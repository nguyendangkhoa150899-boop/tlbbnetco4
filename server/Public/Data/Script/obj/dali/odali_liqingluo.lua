-- lâu lan NPC....
-- Phiªu Mi¬u Phong tiªp dçn khiªn cho ....

-- chân v¯n s¯ 
x002099_g_ScriptId  =  002099


-- có sñ ki®n ID li®t bi¬u 
x002099_g_eventList={002052,002047}
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x002099_UpdateEventList(  sceneId,  selfId,targetId  )
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
	           local  str  =  format("#Y ám khí tông sß : #G LÕc Dß½ng #{_INFOAIM208,346,0, vu tình mßa }#R vu tình mßa #r#Y lang huyên phúc ð¸a phó bän : #G ÐÕi Lý #{_INFOAIM293,92,2, lý thanh la }#R lý thanh la #r#Y tiªn vào ði«u ki®n : #W ðµi ngû nhân s¯ không dß¾i #G6 ngß¶i #W thä #G c¤p b§c =100 c¤p #W#r#Y m²i ngày có th¬ vào s¯ l¥n : #G1 l¥n ")
	 	 	 AddText(sceneId,str)
	 	 --[[	 AddText(sceneId,CurDayTime.."|"..lastDayTime)--]]
	 	 AddNumText(  sceneId,  x002099_g_ScriptId,  " liên quan t¾i ám khí : lang huyên phúc ð¸a ",0  ,2    )
	 	 for  i,  eventId  in  x002099_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x002099_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x002099_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x002099_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 
	 if  GetNumText()  ==  2  then
	 BeginEvent(sceneId)
	         AddText(sceneId,"#{JCLY_160217_29}")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 
	 for  i,  findId  in  x002099_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnEventRequest",sceneId,  selfId,  targetId,  GetNumText(),x002099_g_ScriptId  )
	 	 return
	 	 end
	 end
end