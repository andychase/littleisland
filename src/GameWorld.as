package
{
	import roshan.buffer.CharacterAction;
	import roshan.buffer.MapChange;
	import roshan.buffer.MapData;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.ShaderEvent;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.ConvolutionFilter;
	import flash.filters.DisplacementMapFilter;
	import flash.filters.GlowFilter;
	import flash.filters.ShaderFilter;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import flash.net.Socket;
	import roshan.buffer.ACTION;
	import roshan.buffer.CHANGE;	
	import flash.system.Security;
	
	public class GameWorld extends World
	{
		public var characters:Dictionary;
		private var network:Network;
		private var textEntry:TextEntry;
		private var my_id:int;
		private var backgrounds:Dictionary;
		private var sock:Socket;
		private var filter:ColorMatrixFilter;
		
		public function GameWorld()
		{
			characters = new Dictionary();
			backgrounds = new Dictionary();
			setupSocket();
		}
		
		public function setupSocket():void {
			sock = new Socket();
			
			sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function (e:SecurityErrorEvent):void { 
				FP.world = new DisconWorld;
			});
			sock.addEventListener(IOErrorEvent.IO_ERROR, function (e:IOErrorEvent):void { 
				FP.world = new DisconWorld;
			});
			sock.addEventListener(Event.CLOSE, function ():void { 
				FP.world = new DisconWorld;
			});
			sock.addEventListener(Event.CONNECT, function():void {
				setup();
			});
			sock.timeout = 5000;
			//sock.connect("coconut.asperous.us", 8081);
			sock.connect("localhost", 8081);
		}
		
		public function setup():void {
			network = new Network(sock, moveCharacters, mapChanges, newMapData);
			
			add(network);
			textEntry = new TextEntry(
				function (sayText:String):void {
					network.sayText = sayText
				}
			);
			add(textEntry);
		}
		
		public function newMapData(mapData:MapData, a:int, b:int):void {
			var fg:Entity = new Entity();
			var bkg:Background = new Background(fg);
			bkg.x = mapData.xOffset * 32;
			bkg.y = mapData.yOffset * 32;
			fg.x = mapData.xOffset * 32;
			fg.y = mapData.yOffset * 32;
			bkg.loadMap(mapData);
			add(bkg);
			add(fg);
			backgrounds[mapData.xOffset.toString() + mapData.yOffset.toString()] = bkg;
		}
		
		override public function update():void {
			// Update all entities on this gameworld
			super.update()
			// The character movement connected with Character
			if (my_id in characters) {
				var me:Hero = characters[my_id];
				var dir:int = xyKeyboard.getDirection()
				var x:Number = (FP.elapsed * 60 * xyKeyboard.dirToX(dir)) + me.x;
				var y:Number = (FP.elapsed * 60 * xyKeyboard.dirToY(dir)) + me.y;
				
				me.sprite.active = false;
				if (!(me.collide('wall', x, me.y))
				  || me.collide('wall', me.x, me.y)) {
					

					me.x = x;
					me.towardsX = me.getTileX();
					textEntry.x = x + 18;
				}
				if (!(me.collide('wall', me.x, y))
				  || me.collide('wall', me.x, me.y)) {
				    me.y = y;
					me.towardsY = me.getTileY();
					textEntry.y = y;  
				  }
				if (dir != -1)
					me.sprite.active = true;
				me.dirSprite(dir);
				
				if (!textEntry.user_is_typing && me.inventory != null) {
					me.inventory.keyActivation()
				}
		
				// Move the Camera
				FP.camera.x = me.x - 320;// ((me.x - 320 - FP.camera.x) / (120), (me.y - 320 - FP.camera.y) / (120))
				FP.camera.y = me.y - 320;
				if (FP.camera.x < 0) FP.camera.x += ((0 - FP.camera.x) / (15))
				if (FP.camera.y < 0) FP.camera.y += ((0 - FP.camera.y) / (15))
			}
		}

		public function moveCharacters(CharAction:CharacterAction, i:int, total:int):void {
			if (CharAction.hasIsYou && CharAction.isYou) {
				// My Id initialization
				my_id = CharAction.id;
				if (!(my_id in characters)) {
					var hero:Hero = new Hero(CharAction.x, CharAction.y);
					add(hero);
					characters[my_id] = hero;
				}

				characters[my_id].my_hero = true;
				characters[my_id].inventoryCallback = network.startAction;
				network.hero = characters[my_id];
				
			} else if (CharAction.hasGone && CharAction.gone) {
				// Bye Character
				remove(characters[CharAction.id]);
				delete characters[CharAction.id];
				
			} else if (CharAction.id in characters && CharAction.hasX && CharAction.hasY) {
				if (CharAction.id != my_id) {
					// Character movement Prediction
					characters[CharAction.id].towardsX = CharAction.x + characters[CharAction.id].predictX(CharAction.x);
					characters[CharAction.id].towardsY = CharAction.y + characters[CharAction.id].predictY(CharAction.y);
					characters[CharAction.id].predictionLimit = 0;
				}
				// Character Moved
				characters[CharAction.id].backupLast();
				characters[CharAction.id].lastX = CharAction.x;
				characters[CharAction.id].lastY = CharAction.y;
			} else if (CharAction.hasX && CharAction.hasY) {
				// New Character
				var newChar:Hero = new Hero(CharAction.x, CharAction.y);
				add(newChar);
				characters[CharAction.id] = newChar;
			}
			// Character Action
			if (CharAction.hasAction && CharAction.id in characters &&
						(CharAction.id != my_id || CharAction.action == ACTION.HURT)) {
					characters[CharAction.id].dirSprite(CharAction.direction);
					characters[CharAction.id].action(CharAction.action);
			}
			// Talking
			if (CharAction.hasSay) {
				var text:TextDisplay = new TextDisplay(CharAction.say,
					characters[CharAction.id].x+18,
					characters[CharAction.id].y);
				text.fader = new VarTween(function ():void { remove(text); } )
				addTween(text.fader);
				add(text);
				text.waitAndFade(1 + Math.min(text.txt.text.length * 0.4, 10), 4);
			}
		}
		
		// Map Changes
		public function mapChanges(MpChange:MapChange, i:int, total:int):void {
			// If we changed channels, clear the characters that we no longer see.
			if (MpChange.change == CHANGE.Clear) {
				for (var char_id:String in characters) {
					if (xyKeyboard.roundToMapBox(characters[char_id].lastX) == MpChange.mapBoxX &&
						xyKeyboard.roundToMapBox(characters[char_id].lastY) == MpChange.mapBoxY) {
						remove(characters[char_id])
						delete(characters[char_id])
					}
				}
				var name:String = MpChange.mapBoxX.toString() + MpChange.mapBoxY.toString();
				if (name in backgrounds) {
					var delete_this_bkg:Background = backgrounds[name];
					delete backgrounds[name];
					var backgroundWaitAndDelete:Alarm = new Alarm(5, function ():void {
						remove(delete_this_bkg);
						remove(delete_this_bkg.fg);
					});
					addTween(backgroundWaitAndDelete);
					backgroundWaitAndDelete.start();
				}
			}
		}
	}
}