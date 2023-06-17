package modchart;

import flixel.math.FlxAngle;
import modchart.events.CallbackEvent;
import modchart.*;

class Modcharts {
    static function numericForInterval(start, end, interval, func){
        var index = start;
        while(index < end){
            func(index);
            index += interval;
        }
    }

    static var songs = ["tutorial"];
	public static function isModcharted(songName:String){
		if (songs.contains(songName.toLowerCase()))
            return true;

        // add other conditionals if needed
        
        //return true; // turns modchart system on for all songs, only use for like.. debugging
        return false;
    }
    
    public static function loadModchart(modManager:ModManager, songName:String){
        switch (songName.toLowerCase()){
            case 'fatality':
                var snares = [];
                numericForInterval(0, 224, 8, function(i){
                    snares.push(i);
                });

                for (i in 0...snares.length){
                    var step = snares[i];
                    modManager.queueSet(step, 'transformX', -150);
                    modManager.queueSetP(step, 'mini', -25);
                    modManager.queueEase(step, step + 4, 'transformX', 0, 'cubeOut');
                    modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");
                }
                var kicks = [];
                numericForInterval(256, 512, 8, function(i){
                    kicks.push(i);
                });

                for (i in 0...kicks.length){
                    var step = kicks[i];
                    modManager.queueSetP(step, 'tipsy', 125);
                    modManager.queueSetP(step, 'tipsyOffset', 25);
                    modManager.queueSetP(step, "beat", 75);
                    modManager.queueSet(step, 'transformX', -75);
                    modManager.queueSetP(step, 'mini', -25);
                    modManager.queueEaseP(step, step + 4, "beat", 0, "quadOut");
                    modManager.queueEase(step, step + 4, 'transformX', 0, 'quadOut');
                    modManager.queueEaseP(step, step + 4, 'tipsy', 0, 'quadOut');
                    modManager.queueEaseP(step, step + 4, 'tipsyOffset', 0, 'quadOut');
                    modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");
                }
                modManager.queueEaseP(1152, 1156, 'tipZ', 145);
                modManager.queueEaseP(1708, 1712, 'tipZ', 0);
            case 'endeavors':
                var kicks3 = [];
				numericForInterval(144, 672, 4, function(i)
				{
					kicks3.push(i);
				});

                var m = 1;
				for (i in 0...kicks3.length)
				{
                    m = m * -1;
					var step = kicks3[i];
                    modManager.queueSet(step, 'transform0Y', 50 * m);
					modManager.queueSet(step, 'transform1Y', 50 * m);
					modManager.queueSet(step, 'transform2Y', -50 * m);
					modManager.queueSet(step, 'transform3Y', -50 * m);
                    modManager.queueSet(step, 'transform0Z', 0.5 * m);
					modManager.queueSet(step, 'transform1Z', 0.5 * m);
					modManager.queueSet(step, 'transform2Z', -0.5 * m);
					modManager.queueSet(step, 'transform3Z', -0.5 * m);
					modManager.queueSetP(step, "reverse", 25);
					modManager.queueSetP(step, "squish", 55);
					modManager.queueSetP(step, 'opponentSwap', 25);
					modManager.queueEaseP(step, step + 4, "squish", 0, "circOut");
					modManager.queueEaseP(step, step + 4, "reverse", 0, "circOut");
					modManager.queueEaseP(step, step + 4, 'opponentSwap', 0, 'circOut');
                    modManager.queueEase(step, step + 6, 'transform0Y', 0, 'circOut');
					modManager.queueEase(step, step + 6, 'transform1Y', 0, 'circOut');
					modManager.queueEase(step, step + 6, 'transform2Y', 0, 'circOut');
					modManager.queueEase(step, step + 6, 'transform3Y', 0, 'circOut');
                    modManager.queueEase(step, step + 6, 'transform0Z', 0, 'circOut');
					modManager.queueEase(step, step + 6, 'transform1Z', 0, 'circOut');
					modManager.queueEase(step, step + 6, 'transform2Z', 0, 'circOut');
					modManager.queueEase(step, step + 6, 'transform3Z', 0, 'circOut');
				}
            }         
        }
    }