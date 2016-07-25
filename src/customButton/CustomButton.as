/**
 * Created by hrayr_000 on 25/07/2016.
 */
package customButton {
import flash.display.SimpleButton;

public class CustomButton extends SimpleButton {
	private static const UP_COLOR:uint = 0xFFCC00;
	private static const OVER_COLOR:uint = 0xCCFF00;
	private static const DOWN_COLOR:uint = 0x00CCFF;
	private const _size:uint = 15;

	public function CustomButton() {
		initStates();
		useHandCursor = true;
	}

	private function initStates():void {
		downState = new ButtonDisplayState(DOWN_COLOR, _size);
		overState = new ButtonDisplayState(OVER_COLOR, _size);
		upState = new ButtonDisplayState(UP_COLOR, _size);
		hitTestState = new ButtonDisplayState(UP_COLOR, _size);
	}

}

}

import flash.display.Sprite;

class ButtonDisplayState extends Sprite {
	private var _bgColor:uint;
	private var _size:uint;

	public function ButtonDisplayState(bgColor:uint, size:uint) {
		_bgColor = bgColor;
		_size = size;
		draw();
	}

	private function draw():void {
		graphics.beginFill(_bgColor);
		graphics.drawRect(0, 0, 4 * _size, _size);
		graphics.endFill();
	}
}

