--  sØa ð±i [ trØ thi¬u vi   2008.5.29  tång thêm , ma binh ngày ðem , cñc ph¦m trang b¸ thä ra . ]

--  391201  sáo trang ð±i NPC

--  lß½ng sß thành 

-- chân v¯n s¯ 
x391201_g_ScriptId  =  391201

-- có sñ ki®n ID li®t bi¬u 
x391201_g_eventList={391200}

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x391201_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 for  i,  eventId  in  x391201_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end

	 	 AddText(sceneId,"      dß¾i m¡t nhÕn cØa quan ngoÕi chiªn höa ð¯t ngày , thiên tri«u dûng sî cûng là b¸ chª v¾i giao trÑ chiªn cuµc , b¡c chinh chi thª khó tiªn thêm næa . ngày trß¾c lÕi truy®n m§t báo nói Khiªt Ðan nh¤t tµc ðem hu« kÏ tr§n t¾i , t× là xem chi , ðÕi t¯ng chi binh ðã nguy · ðán t¸ch . #r        #Y b·i vì binh thánh phó bän tß½ng ð¯i phÑc tÕp khó khån , ð« ngh¸ nhà ch½i ðªn v¯n dùng/u¯ng trang web tra xét c£n k¨ công lßþc , ð¬ t¯t h½n trò ch½i . ")


	 	 --AddNumText(  sceneId,  x391201_g_ScriptId,  " liên quan t¾i binh thánh kÏ tr§n ",  0,  500  )
	 	 
	 	 --AddNumText(  sceneId,  x391201_g_ScriptId,  " r¶i ði ……",  0,  0  )

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x391201_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x391201_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x391201_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 local  nNumText  =  GetNumText()
	 
	 if  eventId  ==  x391201_g_MenPaiTaoScriptId  then
	 	 if  nNumText  ==  846  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 elseif  nNumText  ==  2500  or  nNumText  ==  2600  or  nNumText  ==  2700  then
	 	 	 CallScriptFunction(  eventId,  "OnEventRequest",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 
	 if  nNumText  ==  0    then
	 	 --  t¡t cØa s± 
	 	 BeginUICommand(sceneId)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  1000)
	 	 return
	 end

	 if  nNumText  ==  500    then
	 	 BeginEvent(sceneId)
	 	         AddText(sceneId," binh thánh kÏ tr§n hoàn mÛ quan phß½ng phó bän , chü yªu r½i xu¯ng long vån thång c¤p tài li®u , m²i ngày ba l¥n , cu¯i cùng thành công ðánh chªt cu¯i cùng BOSS sau nhßng ðÕt ðßþc ðÕi lßþng tß·ng thß·ng , #r#Y        chú ý : BOSS kÛ nång hoàn mÛ cùng quan phß½ng gi¯ng nhau , c¦n th§n nga , ð« ngh¸ ðªn c¤p b§c nh¤t ð¸nh næa tiªn hành phó bän trò ch½i ! ")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x391201_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x391201_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x391201_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x391201_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x391201_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x391201_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x391201_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x391201_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x391201_OnDie(  sceneId,  selfId,  killerId  )
end
