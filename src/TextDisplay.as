package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Ease;

	public class TextDisplay extends Entity
	{
		public var txt:Text;
		public var txt2:Text;
		public var fader:VarTween  = new VarTween();
		public var fader2:VarTween  = new VarTween();
		
		public function TextDisplay(text:String, X:int, Y:int)
		{
			x = X;
			y = Y;
			txt = new Text(text, 0, 0, { color: '0xDDDDDD', width: 200, wordWrap: true } );
			txt2 = new Text(text, 0, 2, { color: 'black', width: 200, wordWrap: true } );
			addGraphic(txt2);
			addGraphic(txt);
			fader = new VarTween();
			fader2 = new VarTween();
			type = "textDisplay";
			height = txt.textHeight;
			width = txt.textWidth;
			layer = 1;
			
			addTween(fader);
			addTween(fader2);
		}
		
		public function waitAndFade(wait_duration:Number, fade_duration:Number):void {
			var wait:Alarm = new Alarm(wait_duration, function ():void { fade(fade_duration); } );
			addTween(wait);
			wait.start();
		}
		
		public function fade(duration:Number):void {
			fader.tween(txt, 'alpha', 0, duration, Ease.expoOut);
			fader2.tween(txt2, 'alpha', 0, duration, Ease.expoOut);
		}
		
		override public function update():void {
			var e:Entity = collide("textDisplay", x, y);
			if (e != null) {
				if (y > e.y || y == e.y) y += 1;
				if (y < e.y) y -= 1;
			}
		}
		
	}
}