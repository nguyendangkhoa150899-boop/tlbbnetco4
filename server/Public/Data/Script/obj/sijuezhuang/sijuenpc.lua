--  001090
--  cao quá công   phï trÕi truy«n t¯ng ngß¶i 

-- chân v¯n s¯ 
x001090_g_scriptId  =  001090

-- có sñ ki®n ID li®t bi¬u 
x001090_g_eventList={893063}

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x001090_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 AddText(sceneId,"      Nghîa phø cüa ta là Phan Xí v¯n là kÏ ngh® con nhà thª gia , trong nhà còn có tuy®t thª kÏ ngh® bí bäo c¥m kÏ thß h÷a n±i tiªng giang h°, thª nhßng ðã b¸ huynh ð® b÷n Bàng Xí dùng các loÕi hi¬m ác thü ðoÕn ðem bí bäo cß¾p ði t× b±n tuy®t trang. ")
	 AddText(sceneId," B÷n chúng còn nghî Phan gia b¸ di®t môn, còn nghîa phø ta vì r½i xu¯ng vách ðá khi chÕy tr¯n, ðã b¸ tàn t§t hai chân. Hôm nay, nghîa phø ta r¶i xa nhân thª, ta v¯n ð¸nh ðoÕt lÕi bí bäo nhß tâm nguy®n cüa nghîa phø ta, nhßng ðành lñc b¤t tòng tâm, · ch² ")
	 AddText(sceneId," này kính xin chß v¸ ðÕi hi®p giúp ta ðoÕt lÕi bí bäo , ð¬ cho ti¬u næ tØ có th¬ tr÷n ph¥n hiªu thäo . ")
	 --AddText(sceneId,"      #B mãnh li®t ð« ngh¸   h÷p thành ðµi Thiên S½n . bên trong ði¬m dÕy ð¥u vô cùng lþi hÕi , b¤t quá   gõ vang ð¯i di®n h½i l¾n chuông / ð°ng h°   nhæng thÑ này dÕy ð¥u s¨ r¶i ði ")
	 AddNumText(  sceneId,  x001090_g_scriptId,  " liên quan t¾i b¯n tuy®t trang - h÷p thành ðµi Thiên S½n ",0  ,2    )
	 
	 for  i,  eventId  in  x001090_g_eventList  do
	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x001090_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x001090_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x001090_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 
	 if  GetNumText()  ==  2  then
	 BeginEvent(sceneId)
	         AddText(sceneId," b¯n tuy®t trang hoàn mÛ quan phß½ng phó bän , chü yªu r½i xu¯ng vû h°n thång c¤p tài li®u , m²i ngày ba l¥n , cu¯i cùng thành công ðánh chªt cu¯i cùng BOSS sau không ai nhßng ðÕt ðßþc mµt b¯n tuy®t trang bäo rß½ng , #r#Y        chú ý : BOSS kÛ nång hoàn mÛ cùng quan phß½ng gi¯ng nhau , c¦n th§n nga , ð« ngh¸ ðªn c¤p b§c nh¤t ð¸nh næa tiªn hành phó bän trò ch½i ! ")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 for  i,  findId  in  x001090_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x001090_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x001090_g_eventList  do
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
function  x001090_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x001090_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x001090_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc # ðã nh§n nhi®m vø #
--**********************************
function  x001090_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x001090_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x001090_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x001090_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x001090_OnDie(  sceneId,  selfId,  killerId  )
end

--**********************************
--  ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x001090_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end
