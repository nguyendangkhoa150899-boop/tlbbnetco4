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
	           local  str  =  format("#YLang Huy\234n Ph\250c \208\184a: #G\208\213i L\253 #{_INFOAIM293,92,2, l\253 thanh la }#RL\253 Thanh La#W, #GL\213c D\223\189ng #{_INFOAIM208,346,0, vu t\236nh m\223a }#RVu T\236nh V\251#r#Y\208i\171u ki\174n: #Wc\243 \240\181i (1 ng\223\182i c\251ng \240\223\254c), c\228 \240\181i #Gc\164p 100+#r#YM\178i ng\224y: #G3 l\223\254t#W, th\223\182ng v\224 kh\243 t\237nh chung")  -- [NetCo4 02/10] khop code: 1 nguoi, cap >= 100, 3 luot/ngay chung 2 che do (truoc ghi 6 nguoi, 1 lan)
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