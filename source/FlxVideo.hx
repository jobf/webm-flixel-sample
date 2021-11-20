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
	public function new(webmPath:String) {
		super();
		this.webmPath = webmPath;

		io = new WebmIoFile(webmPath);
		player = new WebmPlayer(io, true);

		player.addEventListener('play', onPlay);
		player.addEventListener('stop', onStop);
		player.addEventListener('end', onComplete);

		pixels = player.bitmapData;

		player.play();
		
	}

	/**
	 * Callback to run once the video plays
	 * @param e Webm Event
	 */
	function onPlay(e:WebmEvent) {
		trace("playing");
		ended = false;
	}

	/**
	 * Callback to run once the video ends
	 * @param e Webm Event
	 */
	function onStop(e:WebmEvent) {
		trace("stopping");
		ended = true;
	}

	/**
	 * Not used by the code
	 * @param e Webm Event
	 */
	function onComplete(e:WebmEvent) {
		trace("complete");
		ended = true;
	}
}
