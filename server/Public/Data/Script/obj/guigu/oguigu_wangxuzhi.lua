-- ðß¶ng nhÕc ngày 

-- chân v¯n s¯ 
x080001_g_scriptId  =  080001

-- có sñ ki®n ID li®t bi¬u 
x080001_g_eventList={228911,228912}
--x080001_g_eventList={}--201012,201111,201411,201412,201611,201612	 	 

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x080001_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 local    PlayerName=GetName(sceneId,selfId)
	 AddText(sceneId,"        ta QuÖ C¯c chính là th¶i kÏ Xuân Thu tiên sß #G QuÖ C¯c TØ #W sáng chª , thông hi¬u âm dß½ng , quan sát thiên ð¸a , lên tr¶i xu¯ng bi¬n không ch² nào không th¬ . ph¯i hþp l¸ch Nhâm chß·ng môn sØa ð±i không ng×ng ðích #G tr§n pháp #W , càng là vô ð¸ch kh¡p thiên hÕ . #r        ta QuÖ C¯c ð® tØ tinh v¾i #G tr§n pháp #W , am hi¬u l¤y #G huy«n höa #W lñc rót vào tr§n pháp , có th¬ công có th¬ thü , uy lñc kinh ngß¶i . ")
	 AddText(sceneId,"        ta QuÖ C¯c l¤y thiên hÕ làm bàn c¶ , b÷n ngß½i chÆng qua ðßþc là ta phái ð® tØ tung hoành thiên hÕ nhu mµt quân c¶ mà thôi . ")
	 for  i,  eventId  in  x080001_g_eventList  do
	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x080001_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x080001_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x080001_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 for  i,  findId  in  x080001_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x080001_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x080001_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId,  targetId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x080001_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x080001_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x080001_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x080001_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x080001_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x080001_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x080001_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x080001_OnDie(  sceneId,  selfId,  killerId  )
end