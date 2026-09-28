-- lâu lan NPC....
-- Phiªu Mi¬u Phong tiªp dçn khiªn cho ....

-- chân v¯n s¯ 
x002096_g_ScriptId  =  002096


-- có sñ ki®n ID li®t bi¬u 
x002096_g_eventList={890063}

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x002096_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," Thi¬u Th¤t S½n : tr§n chiªn này không th¬ không xäy ra , xin chú ý phòng ngñ ! ")
	 	 for  i,  eventId  in  x002096_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x002096_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x002096_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x002096_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 for  i,  findId  in  x002096_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId,  GetNumText(),x002096_g_ScriptId  )
	 	 return
	 	 end
	 end
end