package states.menus;

import flixel.tweens.FlxTween;
import data.Paths;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class WarnState extends MusicBeatState//totally not flashing state sob it actually isnt
{
    var warningText:FlxText;

    override function create()
    {
        warningText = new FlxText(0, 0, FlxG.width, "WARNING:\nTHIS MOD IS UNFINISHED.\nOr not but i wanna get this out soon. \n \n-Kn1ghtNight", 32);
		warningText.setFormat("Press Start 2P", 32, FlxColor.WHITE, CENTER);
		warningText.screenCenter(Y);
		add(warningText);
    }

    override function update(elapsed:Float)
    {
        var back:Bool = controls.BACK;
        if (controls.ACCEPT || back)
			{
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if (!back)
				{
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxFlicker.flicker(warningText, 1, 0.1, false, true, function(flk:FlxFlicker)
					{
						new FlxTimer().start(0.5, function(tmr:FlxTimer)
						{
							MusicBeatState.switchState(new TitleState());
						});
					});
				}
				else
				{
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warningText, {alpha: 0}, 1, {
						onComplete: function(twn:FlxTween)
						{
							MusicBeatState.switchState(new TitleState());
						}
					});
				}
			}
    }
}