package;

import flixel.FlxG;
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

		// create sprite that will hold the video
		var sprite:Sprite = new Sprite();
		FlxG.addChildBelowMouse(sprite);

		// must be vp8 webm
		var webmPath = "assets/Big_Buck_Bunny_360_10s_1MB.webm";

		// set up the player
		var io:WebmIoFile = new WebmIoFile(webmPath);
		var player:WebmPlayer = new WebmPlayer(io);

		// WebmPlayer is a Bitmap, add that to the Sprite
		sprite.addChild(player);

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

		// play the video
		player.play();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
