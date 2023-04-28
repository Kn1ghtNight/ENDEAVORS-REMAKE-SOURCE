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
                //modManager.queueEaseP(1708, 1712, 'tipZ', 0);
            case 'endeavors':

                var kicks = [];
                numericForInterval(144, 672, 8, function(i){
                    kicks.push(i);
                });

                for (i in 0...kicks.length){
                    var step = kicks[i];
                    modManager.queueSetP(step, 'tipsy', 125);
                    modManager.queueSetP(step, 'tipsyOffset', 25);
                    modManager.queueSetP(step, "squish", 35);
                    modManager.queueSetP(step, "beat", 75);
                    modManager.queueSet(step, 'transformX', -75);
                    modManager.queueSetP(step, 'mini', -25);
                    modManager.queueEaseP(step, step + 4, "squish", 0, "circOut");
                    modManager.queueEaseP(step, step + 4, "beat", 0, "circOut");
                    modManager.queueEase(step, step + 4, 'transformX', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsy', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsyOffset', 0, 'cubeOut');
                    modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");
                }

                modManager.queueFunc(144, 672, function(event:CallbackEvent, cDS:Float){
                    var s = cDS - 144;
                    var beat = s / 4;
                    modManager.setValue("transformY-a", -60 * Math.abs(Math.sin(Math.PI * beat)));
                    modManager.setValue("transformX-a", 30 * Math.cos(Math.PI * beat));
                });

                modManager.queueEaseP(672, 676, "transformY-a", 0, 'quadOut');
                modManager.queueEase(672, 676, "transformX-a", 0, 'quadOut');

                var kicks2 = [];
                numericForInterval(736, 1778, 8, function(i){
                    kicks2.push(i);
                });

                for (i in 0...kicks2.length){
                    var step = kicks2[i];
                    modManager.queueSetP(step, 'tipsy', 125);
                    modManager.queueSetP(step, 'tipsyOffset', 25);
                    modManager.queueSetP(step, "squish", 35);
                    modManager.queueSetP(step, "beat", 75);
                    modManager.queueSet(step, 'transformX', -75);
                    modManager.queueSetP(step, 'mini', -25);
                    modManager.queueEaseP(step, step + 4, "squish", 0, "circOut");
                    modManager.queueEaseP(step, step + 4, "beat", 0, "circOut");
                    modManager.queueEase(step, step + 4, 'transformX', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsy', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsyOffset', 0, 'cubeOut');
                    modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");
                }

                modManager.queueFunc(736, 1778, function(event:CallbackEvent, cDS:Float){
                    var s = cDS - 736;
                    var beat = s / 4;
                    modManager.setValue("transformY-a", -60 * Math.abs(Math.sin(Math.PI * beat)));
                    modManager.setValue("transformX-a", 30 * Math.cos(Math.PI * beat));
                });

                //speeen -- take long note step, subtract 4 MAKE SURE STEP IS EVEN I BEG OF YOU :SOB:
                modManager.queueEase(396, 400, "centerrotateX", FlxAngle.asRadians(85), "quadIn");
                modManager.queueEase(400, 410, "centerrotateX", FlxAngle.asRadians(-360)*3, "elasticOut");
                modManager.queueSet(410, "centerrotateX", 0);

                modManager.queueEase(986, 990, "centerrotateY", FlxAngle.asRadians(85), "quadIn");
                modManager.queueEase(990, 1000, "centerrotateY", FlxAngle.asRadians(-360)*3, "elasticOut");
                modManager.queueSet(1000, "centerrotateY", 0);

                modManager.queueEase(1242, 1246, "centerrotateY", FlxAngle.asRadians(85), "quadIn");
                modManager.queueEase(1246, 1256, "centerrotateY", FlxAngle.asRadians(-360)*3, "elasticOut");
                modManager.queueSet(1256, "centerrotateY", 0);

                modManager.queueEaseP(1778, 1779, "transformY-a", 0, 'quadOut');
                modManager.queueEase(1778, 1779, "transformX-a", 0, 'quadOut');

                var kicks3 = [];
                numericForInterval(1780, 2031, 8, function(i){
                    kicks3.push(i);
                });

                for (i in 0...kicks3.length){
                    var step = kicks3[i];
                    modManager.queueSetP(step, 'tipsy', 125);
                    modManager.queueSetP(step, 'tipsyOffset', 25);
                    modManager.queueSetP(step, "squish", 35);
                    modManager.queueSet(step, 'transformX', -75);
                    modManager.queueSetP(step, "beat", 75);
                    modManager.queueSetP(step, 'mini', -25);
                    modManager.queueEaseP(step, step + 4, "squish", 0, "circOut");
                    modManager.queueEaseP(step, step + 4, "beat", 0, "circOut");
                    modManager.queueEase(step, step + 4, 'transformX', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsy', 0, 'circOut');
                    modManager.queueEaseP(step, step + 4, 'tipsyOffset', 0, 'cubeOut');
                    modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");
                }

                modManager.queueFunc(1780, 2031, function(event:CallbackEvent, cDS:Float){
                    var s = cDS - 1780;
                    var beat = s / 4;
                    modManager.setValue("transformY-a", -60 * Math.abs(Math.sin(Math.PI * beat)));
                    modManager.setValue("transformX-a", 30 * Math.cos(Math.PI * beat));
                });

                modManager.queueEaseP(1904, 1908, "infinite", 100, "quadOut", 0);
                modManager.queueEaseP(1904, 1908, "alpha", 100, "quadOut", 1);
                modManager.queueEaseP(2032, 2034, "infinite", 0, "quadOut", 0);
                modManager.queueEaseP(2046, 2052, "alpha", 100, "quadOut", 0);
            }         
        }
    }