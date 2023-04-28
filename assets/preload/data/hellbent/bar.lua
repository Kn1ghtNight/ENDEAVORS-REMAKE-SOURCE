function onCreate()
	makeLuaSprite('bar','ui/bar',2000,500)
        makeLuaText('text',"Hellbent - DanlyDaMusicant",0,2050,520)
        setTextSize('text',25)
        setTextBorder("text", 1, '00001')
        addLuaText('text')
        addLuaSprite('bar',false)
        setObjectCamera('bar','camHUD')
end

function onStepHit()
	if curStep == 1 then
		doTweenX('in','bar',600,0.5,'sineOut')
		doTweenX('out','text',700,0.5,'sineOut')
	end
	if curStep == 35 then
		doTweenX('in','bar',2000,1,'sineIn')
		doTweenX('out','text',2050,1,'sineIn')
	end
end