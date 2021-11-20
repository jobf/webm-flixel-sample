package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import webm.WebmIoFile;
import webm.WebmPlayer;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		// must be vp8 webm
		var webmPath = "assets/Big_Buck_Bunny_360_10s_1MB.webm";

		// set up the player
		var io:WebmIoFile = new WebmIoFile(webmPath);
		var player:WebmPlayer = new WebmPlayer(io);

		// listen to some events (optional)
		player.addEventListener('play', function(e)
		{
			trace('play!');
		});
		player.addEventListener('end', function(e)
		{
			trace('end!');
		});
		player.addEventListener('stop', function(e)
		{
			trace('stop!');
		});

		// WebmPlayer extends Bitmap
		// so FlxSprite can be created from the underlying BitmapData
		var sprite = new FlxSprite(player.bitmapData);
		add(sprite);

		// play the video
		player.play();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
