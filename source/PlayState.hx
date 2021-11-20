package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		// must be vp8 webm
		var webmPath = "assets/Big_Buck_Bunny_360_10s_1MB.webm";
		var autoPlay = false;
		var video = new FlxVideo(webmPath, autoPlay);
		video.screenCenter();
		add(video);

		var buttonsY = FlxG.height - 30;
		add(new FlxButton(10, buttonsY, "PLAY", () ->
		{
			video.play();
		}));

		// todo, after some edits to WebmPlayer?
		// add(new FlxButton(100, buttonsY, "STOP", () ->
		// {
		// 	video.stop();
		// }));

		add(new FlxButton(190, buttonsY, "RESTART", () ->
		{
			video.restart();
		}));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
