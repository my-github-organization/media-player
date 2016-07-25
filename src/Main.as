package {import flash.display.Sprite;import flash.events.MouseEvent;import flash.events.NetStatusEvent;import flash.media.Video;import flash.net.NetConnection;import flash.net.NetStream;public class Main extends Sprite {	private static const STREAM_HOST:String = "rtmp://184.72.239.149/vod";	private static const VIDEO_NAME:String = "BigBuckBunny_115k.mov";	private static const NET_CONNECTION_SUCCESS:String = "NetConnection.Connect.Success";	private static const NET_CONNECTION_IDLE_TIMEOUT:String = "NetConnection.Connect.IdleTimeOut";	private var _netConnection:NetConnection;	private var _isPlaying:Boolean;	private var _stream:NetStream;	private var _mediaPlayer:MediaPlayerView;	public function Main() {		_mediaPlayer = new MediaPlayerView();		addChild(_mediaPlayer.mediaPlayerContainer);		initNetConnection();	}	private function initNetConnection():void {		_netConnection = new NetConnection();		_netConnection.addEventListener(NetStatusEvent.NET_STATUS, connectionStatusHandler);		_netConnection.connect(STREAM_HOST);	}	private function connectionStatusHandler(event:NetStatusEvent):void {		switch (event.info.code) {			case NET_CONNECTION_SUCCESS:				connectStream();				break;			case NET_CONNECTION_IDLE_TIMEOUT :				streamTimeOut();		}	}	private function streamTimeOut():void {		if (_stream) {			_stream.close();			_stream = null;		}	}	private function connectStream():void {		initStream();		playVideo();	}	private function initStream():void {		_stream = new NetStream(_netConnection);		_stream.client = {};	}	private function playVideo():void {		var video:Video = new Video(MediaPlayerView.PLAYER_WIDTH, MediaPlayerView.PLAYER_HEIGHT);		video.attachNetStream(_stream);		_stream.play(VIDEO_NAME);		_mediaPlayer.videoContainer.addChild(video);		_mediaPlayer.playToggleButton.addEventListener(MouseEvent.CLICK, playToggleButtonClickHandler);		_isPlaying = true;	}	private function playToggleButtonClickHandler(event:MouseEvent):void {		if (_isPlaying) {			_stream.pause();			_isPlaying = false;		} else {			_stream.resume();			_isPlaying = true;		}	}}}