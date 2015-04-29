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

	public class TextEntry extends TextDisplay
	{
		public var user_is_typing:Boolean = false;
		private var switchLock:Boolean = false;
		private var switchLockAlarm:Alarm;
		private var doneTypingCallback:Function;
		
		public function TextEntry(onDoneTyping:Function)
		{
			super("", 25, 500);
			doneTypingCallback = onDoneTyping;
			switchLockAlarm = new Alarm(0.5, function ():void { switchLock = false; } );
			addTween(switchLockAlarm);
			type = "textDisplay";
		}
		
		override public function update ():void {
			
			if (Input.check(Key.ENTER) && !switchLock) {
				switchLock = true;
				switchLockAlarm.reset(0.5);
				user_is_typing = !user_is_typing;
				if (user_is_typing == true) {
					collidable = true;
					txt.alpha = 1;
					txt2.alpha = 1;
					Input.clear();
					Input.keyString = "Say: ";
				} else {
					if (Input.keyString.length > 5)
						doneTypingCallback(Input.keyString.substr(5));
					fade(0.5);
					collidable = false;
				}
			}
			if (user_is_typing) {
				if (Input.keyString.length < 5) {
					fade(0.5);
					user_is_typing = false;
					collidable = false;
				}
				txt.text = Input.keyString;
				txt2.text = Input.keyString;
				height = txt.textHeight;
				width = txt.textWidth;
			}
		}
	}
}