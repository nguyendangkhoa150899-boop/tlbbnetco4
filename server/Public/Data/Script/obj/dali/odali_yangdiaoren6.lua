-- lâu lan NPC....
-- phiªu mi¬u phong tiªp dçn sØ ....

-- cß¾c bän hào 
x002083_g_ScriptId  =  002083


-- s· üng hæu ðích sñ ki®n ID li®t bi¬u 
x002083_g_eventList={002052,002047}
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x002083_UpdateEventList(  sceneId,  selfId,targetId  )
	 local  CurDayTime  =  GetDayTime()
	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  MD_LINGQUZHAOPAI_HAVESENDMAIL  )
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 if  CurDayTime  >  lastDayTime  then
	 lastDayCount  =  5
	 end
	 wc  =  5  -  lastDayCount
	 if    wc  <=0  then  
	 wc  =0  
	 end	 
	 if  lastDayCount  >5  then  
	 	 lastDayCount  =5
	 end	 
	 BeginEvent(sceneId)
	           local  str  =  format("#Y ám khí tông sß : #G lÕc dß½ng #{_INFOAIM208,346,0, vu tình vû }#R vu tình vû #r#Y lang huyên phúc ð¸a phó bän : #G ðÕi lý #{_INFOAIM293,92,2, lý thanh la }#R lý thanh la #r#Y tiªn nh§p ði«u ki®n : #W ðµi ngû nhân s± b¤t thi¬u vu #G6 nhân #W thä #G ðÆng c¤p =100 c¤p #W#r#Y m²i nh§t khä tiªn nh§p thÑ s± : #G1 thÑ ")
	 	 	 AddText(sceneId,str)
	 	 --[[	 AddText(sceneId,CurDayTime.."|"..lastDayTime)--]]
	 	 AddNumText(  sceneId,  x002083_g_ScriptId,  "Quan vu ám khí :Lang huyên phúc ð¸a ",0  ,2    )
	 	 for  i,  eventId  in  x002083_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n giao h² nh§p kh¦u 
--**********************************
function  x002083_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x002083_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u tuy¬n trung nh¤t hÕng 
--**********************************
function  x002083_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 
	 if  GetNumText()  ==  2  then
	 BeginEvent(sceneId)
	         AddText(sceneId,"#{JCLY_160217_29}")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 
	 for  i,  findId  in  x002083_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnEventRequest",sceneId,  selfId,  targetId,  GetNumText(),x002083_g_ScriptId  )
	 	 return
	 	 end
	 end
end