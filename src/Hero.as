package
{
	import roshan.buffer.ACTION;
	import roshan.buffer.StatusToken;
	import roshan.buffer.TOKEN;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.tweens.misc.VarTween;

	public class Hero extends Entity
	{
		public var towardsX:int;
		public var towardsY:int;
		public var my_hero:Boolean = false;
		public var lastX:int;
		public var lastY:int;
		public var lastlastX:int;
		public var lastlastY:int;
		public var direction:int;
		public var sprite:Spritemap;
		private var tileSize:int = 32;
		public var inventory:Inventory = null;
		public var inventoryCallback:Function = null;
		public var showHurt:Boolean = false;
		public var predictionLimit:int = 0;
		
		public function Hero(x:int, y:int)
		{
			sprite = new Spritemap(Assets.HERO, 18, 22);
			sprite.add("running", [0, 1, 2, 3], 8);
			sprite.add("right", [6, 7], 8);
			sprite.add("up", [4, 5], 8);
			graphic = sprite;
			type = "wall";
			sprite.setFrame(0, 0);
			towardsX = x;
			towardsY = y;
			lastX = x;
			lastY = y;
			lastlastX = x;
			lastlastY = y;
			setXY(towardsX, towardsY);
			width = 18;
			height = 22;
			layer = 1;
		}
		
		public function action(action:int):void {
			if (inventory) switch (action) {
				case ACTION.SWORD:
					inventory.swordActivate(); break;
					
				case ACTION.HURT:
					hurt(); break;
			}
		}
		
		override public function added():void {
			inventory = new Inventory(this, inventoryCallback);
			world.add(inventory);
		}
		
		override public function update():void 
		{
			if (showHurt) sprite.alpha = Math.abs(1 - sprite.alpha)
			// Jump character back to a position if they travel too far away from last server location
			if (Math.abs(getTileX() - lastX) > 2 ||
				Math.abs(getTileY() - lastY) >  2) setXY(lastX, lastY);
			if (!(my_hero)) {
				if (predictionLimit++ > 40) {
					towardsX = lastX;
					towardsY = lastY;
					backupLast();
					predictionLimit = 0;
				}
				moveTowards(towardsX * tileSize, (towardsY * tileSize) + originY, 1.5)
				dirSprite(xyKeyboard.dirFromXY(x, y,
					towardsX * tileSize, towardsY * tileSize + originY));
				if (x == towardsX * tileSize && y == towardsY * tileSize)
					sprite.rate = 0;
				else 
					sprite.rate = 1;
			};

		}
		
		public function hurt():void { 
			var repeat:int = 10;
			var hurtTween:VarTween = new VarTween(function ():void {
				if (repeat-- < 1) {
					hurtTween.cancel();
					sprite.alpha = 1;
				}
			}, Tween.LOOPING);
			hurtTween.tween(sprite, "alpha", 0, 0.05, Ease.sineInOut);
			addTween(hurtTween);
			hurtTween.start();
		}
		
		public function setXY(tileX:int, tileY:int):void {
			x = tileX * tileSize;
			y = tileY * tileSize;
		}
		
		public function getTileX():int {
			return Math.floor((x + 9) / tileSize)
		}
		public function getTileY():int {
			return Math.floor((y + 20) / tileSize)
		}
		
		public function dirSprite(dir:int):void {
			if /*(down)         */ (dir == 0) sprite.play("running");
			if /*(left)         */ (dir == 2) { sprite.flipped = true; sprite.play("right"); }
			if /*(right)        */ (dir == 6) { sprite.flipped = false; sprite.play("right");}
			if /*(up)           */ (dir == 4) sprite.play("up");
			if /*(left && down) */ (dir == 1) sprite.play("running");
			if /*(left && up)   */ (dir == 3) sprite.play("up");
			if /*(right && up)  */ (dir == 5) sprite.play("up");
			if /*(right && down)*/ (dir == 7) sprite.play("running");
			if (dir != -1) direction = dir;
		}
		
		public function backupLast():void {
			lastlastX = lastX;
			lastlastY = lastY;
		}
		
		public function predictX(newX:int):int {
			var lastDeltaX:int = lastX - lastlastX;
			var deltaX:int = newX - lastX;
			var avg:Number = (lastDeltaX + deltaX) / 2;
			if (avg > 0) return Math.floor(avg);
			else return Math.ceil(avg);
		}
		
		public function predictY(newY:int):int {
			var lastDeltaY:int = lastY - lastlastY;
			var deltaY:int = newY - lastY;
			var avg:Number = (lastDeltaY + deltaY) / 2;
			if (avg > 0) return Math.floor(avg);
			else return Math.ceil(avg);
		}
		
	}
}