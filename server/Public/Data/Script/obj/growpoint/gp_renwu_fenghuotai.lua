--´´½¨
--·é»ðÌ¨

-- scriptId = 715001
x715001_g_missionId = 552

function  x715001_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- ÎïÆ·ÊýÁ¿
	ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount)	--º¯Êýµ÷ÓÃ
end

--·µ»ØÀàÐÍ
-- 0 ±íÊ¾´ò¿ª³É¹¦
--´ò¿ªÇ°
--ÔÚCONFIG/ABILITY.TXTÎÄ¼þÖÐ
function	 x715001_OnOpen(sceneId,selfId,targetId)
	if HaveItem(sceneId,selfId,40002070) <0 then
		BeginEvent(sceneId)
			strText = "C¥n phäi có ðu¯c"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_NOT_ENOUGH_ITEM
	end

	if HaveItem(sceneId,selfId,40002069) <0	then
		BeginEvent(sceneId)
			strText = "C¥n phân sói"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_NOT_ENOUGH_ITEM
	end
	
	return OR_OK
end

--»ØÊÕ  £¨ÓëÆäËû3¸öÏà·´£¬·µ»Ø1 ±íÊ¾Òª»ØÊÕ£¬¾ÍÊÇÉú³¤µãÏûÊ§£¬²»ÄÜÔÙÊ¹ÓÃ£©
function	 x715001_OnRecycle(sceneId,selfId,targetId)
 	return 0;
end

--´ò¿ªºó
function	x715001_OnProcOver(sceneId,selfId,targetId)
	
	local Ret1 = DelItem( sceneId, selfId, 40002069, 1 )
	local Ret2 = DelItem( sceneId, selfId, 40002070, 1 )
	
	if( Ret1 > 0 and Ret2 > 0 ) then
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x715001_g_missionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	BeginEvent(sceneId)
	  	strText = "Xua ðu±i H¡c phong (hoàn thành)"
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

    end
    
	return OR_OK
end

function x715001_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
