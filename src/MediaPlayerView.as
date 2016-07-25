/**
 * Created by hrayr_000 on 25/07/2016.
 */
package {
import customButton.CustomButton;

import flash.display.Sprite;

public class MediaPlayerView extends Sprite {
	public static const PLAYER_WIDTH:int = 320;
	public static const PLAYER_HEIGHT:int = 240;
	private var _mediaPlayerContainer:Sprite;
	private var _videoContainer:Sprite;
	private var _playToggleButton:CustomButton;

	public function MediaPlayerView() {
		_mediaPlayerContainer = new Sprite();
		_videoContainer = new Sprite();
		_playToggleButton = new CustomButton();
		buildView();
	}

	private function buildView():void {
		initVideoContainer();
		_mediaPlayerContainer.addChild(_videoContainer);
		_mediaPlayerContainer.addChild(_playToggleButton);
		setPlayToggleButtonPosition();
	}

	private function initVideoContainer():void {
		_videoContainer.graphics.beginFill(0x000000);
		_videoContainer.graphics.drawRect(0, 0, PLAYER_WIDTH, PLAYER_HEIGHT);
		_videoContainer.graphics.endFill();
	}

	private function setPlayToggleButtonPosition():void {
		_playToggleButton.x = _videoContainer.x;
		_playToggleButton.y = PLAYER_HEIGHT + 10;
	}

	public function get videoContainer():Sprite {
		return _videoContainer;
	}

	public function get playToggleButton():CustomButton {
		return _playToggleButton;
	}

	public function get mediaPlayerContainer():Sprite {
		return _mediaPlayerContainer;
	}
}
}
