package;

import webm.WebmIo;
import webm.WebmEvent;
import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import webm.WebmIoFile;
import webm.WebmPlayer;

/**
 * A extension of `FlxSprite` that can display a video from a .webm file.
 */
class FlxVideo extends FlxSprite {

	/**
	 * The path to the webm file
	 */
	public var webmPath:String;

	/**
	 * The webm file
	 */
	var io:WebmIoFile;
	/**
	 * The webm player
	 */
	var player:WebmPlayer;

	/**
	 * A variable that gets set to true when the video ends, useful for removing or making events happen once the video has ended
	 */
	public var ended:Bool = false;

	/**
	 * Create a new `FlxVideo` instance
	 * @param webmPath The path to the webm file
	 */
	public function new(x:Float = 0, y:Float = 0, webmPath:String)
	{
		this.webmPath = webmPath;

		io = new WebmIoFile(webmPath);
		player = new WebmPlayer(io, true);

		player.addEventListener(WebmEvent.PLAY, onPlay);
		player.addEventListener(WebmEvent.STOP, onStop);
		player.addEventListener(WebmEvent.RESTART, onRestart);
		player.addEventListener(WebmEvent.COMPLETE, onComplete);

		super(x, y, player.bitmapData);
		player.play();
		
	}

	/**
	 * Called when video playback begins
	 * @param e WebmEvent
	 */
	function onPlay(e:WebmEvent)
	{
		trace("playing");
		ended = false;
	}

	/**
	 * Called when video playback stops
	 * @param e WebmEvent
	 */
	function onStop(e:WebmEvent)
	{
		trace("stopping");
		ended = true;
	}

	/**
	 * Called when video playback is restarted
	 * @param e WebmEvent
	 */
	function onRestart(e:WebmEvent)
	{
		trace("restart");
		ended = true;
	}

	/**
	 * Called when the last frame of video has been played
	 * @param e WebmEvent
	 */
	function onComplete(e:WebmEvent)
	{
		trace("complete");
		ended = true;
	}
}
