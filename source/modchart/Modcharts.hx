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

    static var songs = ["endless"];
	public static function isModcharted(songName:String){
		if (songs.contains(songName.toLowerCase()))
            return true;

        // add other conditionals if needed
        
        //return true; // turns modchart system on for all songs, only use for like.. debugging
        return false;
    }
    
    public static function loadModchart(modManager:ModManager, songName:String){
        switch (songName.toLowerCase()){
            case 'race war':
                modManager.queueEase(8, 12, "opponentSwap", 1, "quadOut");
                modManager.queueSetP(8, "squish", 75);
                modManager.queueEaseP(8, 12, "squish", 0, "cubeOut");

                var kicks = [];
                numericForInterval(135, 775, 8, function(i){
                    kicks.push(i);
                });

                for (i in 0...kicks.length){
                    var step = kicks[i];
                    modManager.queueSetP(step, 'tipsy', 125);
                    modManager.queueSetP(step, 'tipsyOffset', 25);
                    modManager.queueSetP(step, "squish", 35);
                    modManager.queueSet(step, 'transformX', -75);
                    modManager.queueSetP(step, 'mini', -25);
                    modManager.queueEaseP(step, step + 4, "squish", 0, "circOut");
                    modManager.queueEase(step, step + 4, 'transformX', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsy', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsyOffset', 0, 'cubeOut');
                    modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");
                }

                modManager.queueEase(907, 911, "localrotateY", FlxAngle.asRadians(85), "quadIn", 1);
                modManager.queueEase(911, 915, "localrotateY", FlxAngle.asRadians(-360)*3, "circOut", 1);
                modManager.queueSet(921, "localrotateY", 0, 1);
                modManager.queueEaseP(1544, 1548, "tipZ", 1, "circOut");
                modManager.queueEaseP(1544, 1548, "tipsy", 1, "circOut");
                modManager.queueEaseP(1799, 1807, "tipZ", 0, "circOut");
                modManager.queueEaseP(1799, 1807, "tipsy", 0, "circOut");
            case 'endless':

                    }
                
            default:
                
        }
}