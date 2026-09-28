-- lâu lan NPC....
-- Phiªu Mi¬u Phong tiªp dçn khiªn cho ....

-- chân v¯n s¯ 
x001155_g_ScriptId  =  001155


-- có sñ ki®n ID li®t bi¬u 
x001155_g_eventList={001151}
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x001155_UpdateEventList(  sceneId,  selfId,targetId  )
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
	           local  str  =  format("#WB·i vì thiên long äo cänh bây gi¶ vô cùng hung hi¬m , cho nên cho dù là hæu duyên ngß¶i m²i ngày cûng chï có th¬ ði vào #G5 l¥n #W , m²i ngày phó bän s¯ l¥n ðem · #G m²i ngày 00:00#W n£ng ðßa . #r thiªu hi®p ngß½i hôm nay ðã tiªp nh§n vø #G%s l¥n #W , còn có th¬ ðón thêm nhi®m vø #G%s l¥n #W . ",lastDayCount,wc)
	 	 	 AddText(sceneId,str)
	 	 --[[	 AddText(sceneId,CurDayTime.."|"..lastDayTime)--]]
	 	 AddNumText(  sceneId,  x001155_g_ScriptId,  "Liên quan t¾i thØ luy®n : thiên long äo cänh ",0  ,2    )
	 AddNumText( sceneId, x001151_g_ScriptId, "#ef12345#Y Phø bän này chßa m·, m¶i các hÕ qua ch² khác" )
	 	 for  i,  eventId  in  x001155_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x001155_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x001155_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x001155_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 
	 if  GetNumText()  ==  2  then
	 BeginEvent(sceneId)
	         AddText(sceneId,"#{TLHJ_120110_05}")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 
	 for  i,  findId  in  x001155_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnEventRequest",sceneId,  selfId,  targetId,  GetNumText(),x001155_g_ScriptId  )
	 	 return
	 	 end
	 end
end