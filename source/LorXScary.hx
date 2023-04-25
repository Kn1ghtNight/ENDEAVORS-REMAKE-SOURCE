package;

import flixel.util.FlxColor;
import data.Paths;
import flixel.FlxSprite;
import states.MusicBeatState;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;

class LorXScary extends MusicBeatState//fuck you gamaverse!
{
    var lorX:FlxSprite;
    var suchFriendlyText:FlxText;
    var rouletteText:String;

    override public function create()
    {
        FlxG.sound.play(Paths.sound('i wonder what lord x will say next'));
        lorX = new FlxSprite().loadGraphic(Paths.image('hjim'));
        lorX.screenCenter();
        lorX.scale.set(0, 0);
        add(lorX);

        rouletteText = FlxG.random.int(0, 1000) == 0 ? '152.14.164.154' : 'Kill yourself';
        suchFriendlyText = new FlxText(0, 0, 600, rouletteText, 32);
        suchFriendlyText.setFormat(Paths.font('PressStart2P.ttf'), 32, FlxColor.WHITE, CENTER);
        suchFriendlyText.alpha = 0;
        suchFriendlyText.borderSize = 1.5;
        suchFriendlyText.borderColor = FlxColor.BLACK;
        suchFriendlyText.borderStyle = OUTLINE;
        suchFriendlyText.screenCenter();
        add(suchFriendlyText);

        FlxTween.tween(lorX.scale, {x: 1, y: 1}, 5, {ease: FlxEase.quadInOut,
        onComplete: function(twn:FlxTween){
            FlxTween.tween(suchFriendlyText, {alpha: 1}, 3, {ease: FlxEase.quadInOut});
        }
        });
    }
}