----- ðÕi t¯ng truy«n t¯ng NPC chân v¯n ---------
----- nguyên sang UK , gia tång sØa ð±i quân phøng ngày QQ : 137094888

-- chân v¯n s¯ 
x300111_g_scriptId  =  300111

--by  UK  QQ  2269169441

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x300111_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 AddText(sceneId,"    ta có th¬ dçn ngß½i tr· v« thành ")
	 AddNumText(  sceneId,  x300111_g_scriptId,  " xác ð¸nh truy«n t¾i ĐÕi Lý ",6  ,1    )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x300111_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x300111_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x300111_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
local  mycamp  =  GetUnitCampID(sceneId,  selfId,selfId  )
if    mycamp  ~=  156  then
x300111_MsgBox(  sceneId,  selfId,  " ta chï vì ðÕi t¯ng ðích chiªn sî phøc vø "  )
return
end

CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,294,241,  10  )	 
end

--**********************************
-- ð¯i thoÕi gi¾i m£t 
--**********************************
function  x300111_MsgBox(  sceneId,  selfId,  str  )	 
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end