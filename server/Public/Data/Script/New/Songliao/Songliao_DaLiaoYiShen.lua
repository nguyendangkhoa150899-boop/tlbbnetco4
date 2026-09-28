----- ðÕi liêu thêm máu NPC chân v¯n ---------
----- nguyên sang UK , gia tång sØa ð±i quân phøng ngày QQ : 137094888

-- chân v¯n s¯ 
x300112_g_scriptId  =  300112

  

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x300112_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 AddText(sceneId," Ta ðây có th¬ tr· v« phøc lßþng máu nhßng mu¯n nh¤t ð¸nh nguyên bäo ")
	 AddNumText(  sceneId,  x891002_g_scriptId,  "H°i phøc huyªt khí ",6  ,1    )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x300112_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x300112_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x300112_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
local  mycamp  =  GetUnitCampID(sceneId,  selfId,selfId  )
if    mycamp  ~=  157  then
x300112_MsgBox(  sceneId,  selfId,  "ta chï vì ðÕi liêu ðích chiªn sî chæa tr¸ "  )
return
end

RestoreHp(  sceneId,  selfId  )
RestoreMp(  sceneId,  selfId  )
x300112_MsgBox(  sceneId,  selfId,  " ðã tr· v« mãn huyªt khí "  )	 
end
--**********************************
-- tin tÑc ð« kÏ 
--**********************************
function  x300112_MsgBox(  sceneId,  selfId,  str  )	 
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end