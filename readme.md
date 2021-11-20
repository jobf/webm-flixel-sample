# webm video on flixel


Tested with Big Buck Bunny 360 webm, only vp8 works. vp9 and av1 made error "Bitstream not supported by this decoder".

To use same video download this and place in assets directory - https://test-videos.co.uk/vids/bigbuckbunny/webm/vp8/360/Big_Buck_Bunny_360_10s_1MB.webm - or provice your own and edit `webmPath` in `PlayState.hx`.

## Dependencies

When exposing stop and restart via the FlxVideo class I found that calls to stop would crash the code. Quick fix for this was to prevent calling `WebmPlayer.dispose` in `WebmPlayer.stop`.

To that end I have forked the original haxelib extension and pushed the change.

```
## install the haxelib from git
haxelib git extension-webm https://github.com/jobf/extension-webm.git

# then build for your target, e.g. linux (replace with windows if on windows)
lime rebuild extension-webm linux
```

## Run the example

After setting up dependencies, from the root directory; (replace with windows if on windows).

```
lime test linux
```