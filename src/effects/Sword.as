package effects
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.PreRotation;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.tweens.motion.CircularMotion;

	public class Sword extends Entity
	{
		private var e:Hero;
		private var offsetX:int = -34;
		private var offsetY:int = -28;
		private var rotategraphic:PreRotation;
		
		public function Sword(attachedTo:Hero)
		{
			e = attachedTo;
			
			rotategraphic = new PreRotation(Assets.SWORD, 32, true);
			graphic = rotategraphic;
			layer = 1;
		}
		
		public function start():void {
			x = e.x + offsetX;
			y = e.y + offsetY;
			var direction:int = e.direction;
			
			var swipe:VarTween = new VarTween(null, Tween.ONESHOT);
			if (direction == 2) direction = 6;
			else if (direction == 6) direction = 2;
			else if (direction == 1) direction = 7;			
			else if (direction == 3) direction = 5;
			else if (direction == 5) direction = 3;
			else if (direction == 7) direction = 1;

			rotategraphic.frameAngle = (45 * direction + 25);
			swipe.tween(rotategraphic, "frameAngle", (45 * direction) - 90 + 25, 0.3);
			addTween(swipe);
			swipe.start();
		}
		
		override public function update():void 
		{
			x = e.x + offsetX;
			y = e.y + offsetY;
		}
		
	}
}