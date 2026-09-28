-- tiêu dao NPC
-- chß·ng môn nhân 
-- tô tinh hà 
-- bình thß¶ng 

x080002_g_scriptId  =  080002
x080002_g_eventList={225900,229009,200041,200043,200045,200094,808004,229012,808092}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x080002_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"    ta là vß½ng thi®n mµt , ta phø trách quän lý quÖ c¯c môn phái ð® tØ . ")
	 	 local  mp  =  GetMenPai(sceneId,  selfId)
                                local  xiezi=GetHumanMaxVigor(sceneId,selfId)  
	 	 if  mp  ==  9  and  xiezi  <  25000  then  
	 	 	 AddNumText(sceneId,  x080002_g_scriptId,  " gia nh§p môn phái ",6,0)
	 	 end
	 	 AddNumText(sceneId,  x080002_g_scriptId,  " môn phái gi¾i thi®u ",8,1)
	 	 AddNumText(sceneId,  x080002_g_scriptId,  " nhß thª nào h÷c t§p môn phái kÛ nång ",8,6)	 	 -- chï ðß¶ng ðªn kÛ nång h÷c t§p ngß¶i 
	 	 for  i,  eventId  in  x080002_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x080002_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 for  i,  findId  in  x080002_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId,  MP_GUIGU  )
	 	 	 return
	 	 end
	 end

	 if  GetNumText()==0  then

	 	 x080002_g_MenPai  =  GetMenPai(sceneId,  selfId)
                                local  xiezi=GetHumanMaxVigor(sceneId,selfId)  
	 	 if  x080002_g_MenPai  ==  12      then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,  " ngß½i lÕi t¾i tiêu khi¬n vi sß li­u , ngß½i ðã là ta quÖ C¯c ð® tØ , còn lÕy cái gì sß ðây . ")
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 return
	 	 end
	 	 
	 local  index  =	 GetMissionData(  sceneId,  selfId,  MY_JIARUMENPAI  )
	 if  index  ~=0  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId," ngß½i ðã là môn phái khác ðích cao ð° li­u , chúng ta không thu ngß½i . ")
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 return
	 	 end

	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  "#{MenpaiInfo_012}")
	 	 	 AddNumText(sceneId,  x080002_g_scriptId,  " ta nh¤t ð¸nh phäi xªp vào quÖ c¯c ",6,3)
	 	 	 AddNumText(sceneId,  x080002_g_scriptId,  " ta tÕm th¶i còn không mu¯n xªp vào môn phái ",8,4)
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	   
	 	 return
	 end
	 
	 if  GetNumText()==4  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  1000  )
	 	 return
	 end

	 if  GetNumText()==3  then
	 	 if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,"    sØa sang mµt chút túi ðeo lßng , c¥n phäi có hai ch² tr¯ng , ta s¨ có tß·ng thß·ng cho ngß½i ! ")
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 elseif  GetLevel(  sceneId,  selfId  )  <  10  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId," ngß½i còn là ðþi ðªn 10 c¤p sau tr· lÕi bái sß h÷c ngh® ði ! ")
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 else
	 	 	 x080002_g_MenPai  =  GetMenPai(sceneId,  selfId)
	 	 	 if  x080002_g_MenPai  ==  12  then
	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 AddText(sceneId,  " ngß½i lÕi t¾i tiêu khi¬n vi sß li­u , ngß½i ðã là ta quÖ C¯c ð® tØ , còn lÕy cái gì sß ðây . ")
	 	 	 	 EndEvent(sceneId)
	 	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 -- tr· v« tr¸ giá là 9 bày tö không cØa phái 
	 	 local  index  =	 GetMissionData(  sceneId,  selfId,  MY_JIARUMENPAI  )
	                                                 elseif  index  ~=0  then
	 	 	 	 LuaFnJoinMenpai(sceneId,  selfId,  targetId,  12)

	 	 	 	 --  thiªt trí m¾i b¡t ð¥u ðích Npc quan h® tr¸ giá 
	 	 	 	 CallScriptFunction(  200099,  "InitRelation",  sceneId,  selfId  )

	 	 	 	 --  ðem tß½ng quan tâm pháp thiªt trí vì 10 c¤p b§c     49,52,53
	 	               LuaFnSetXinFaLevel(sceneId,selfId,89,1)
	 	               LuaFnSetXinFaLevel(sceneId,selfId,90,1)
	 	               LuaFnSetXinFaLevel(sceneId,selfId,91,1)
	 	               LuaFnSetXinFaLevel(sceneId,selfId,92,1)
	 	               LuaFnSetXinFaLevel(sceneId,selfId,93,1)
	 	               LuaFnSetXinFaLevel(sceneId,selfId,94,1)
	 	             --  LuaFnSetXinFaLevel(sceneId,selfId,95,1)
	 	             --  LuaFnSetXinFaLevel(sceneId,selfId,96,1)
	 	 	 --AddSkill(    sceneId,  selfId,  27)
	 	 	 SetMissionData(sceneId,  selfId,  MY_JIARUMENPAI,  1);
	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 AddText(sceneId," ngß½i ðã gia nh§p quÖ c¯c ! ");
	 	 	 	 EndEvent(sceneId)
	 	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 	 -- cho nhà ch½i phát tin/th½ , nói cho h¡n biªt t¾i ch² nào ðánh trách , nhß thª nào kiªm ti«n 
	 	 	 	 LuaFnSendSystemMail(  sceneId,  GetName(sceneId,selfId),  "#{LevelMail_menpai_12}"  )
	 	 	 	 --LuaFnSendSystemMail(  sceneId,  GetName(sceneId,selfId),  "#{OBJ_xiaoyao_0001}"  )
	 	 	 	 
	 	 	 	 -- môn phái tß·ng thß·ng tri®u t§p làm 
	 	 	 	 for  i=1,  20  do
	 	 	 	 	 TryRecieveItem(  sceneId,  selfId,  30501001,  1  )
	 	 	 	 end
	 	 	 	 x080002_MsgBox(  sceneId,  selfId,  " l¤y ðßþc 20 mai môn phái tri®u t§p làm . "  )

	 	 	 	 if  TryRecieveItem(  sceneId,  selfId,  10124007,  1  )  >=  0  then
	 	 	 	 	 str	 	 =  "#Y ngß½i thu ðßþc "..GetItemName(  sceneId,  10124007  ).." . "
	 	 	 	 	 x080002_MsgBox(  sceneId,  selfId,  str  )
	 	 	 	 end

	 	 	 	 if	 LuaFnGetSex(  sceneId,  selfId)==0	 then
	 	 	 	 	 LuaFnMsg2Player(  sceneId,  selfId," ngß½i ðã gia nh§p quÖ c¯c ! ",MSG2PLAYER_PARA)
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  168,  0)
	 	 	 	 	 CallScriptFunction(  225900,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 	 else
	 	 	 	 	 LuaFnMsg2Player(  sceneId,  selfId," ngß½i ðã gia nh§p quÖ c¯c ! ",MSG2PLAYER_PARA)
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  168,  0)
	 	 	 	 	 CallScriptFunction(  225900,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 	 end
	 	 	 else
	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 AddText(sceneId," ngß½i ðã là môn phái khác ðích cao ð° li­u , chúng ta không thu ngß½i . ")
	 	 	 	 EndEvent(sceneId)
	 	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 end
	 	 end
	 elseif	 GetNumText()==1	 then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  "        #Y lØa cháy thiên long hoan nghênh ngài , xin/m¶i nh§n chính xác bän chính lØa cháy . hÕt tØ QQ-718805400.#r    #r        lØa cháy thiên long , c¯ g¡ng làm t¯t nh¤t phäng quan ! ")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 end
	 -- chï ðß¶ng 
	 if  GetNumText()==6  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  " lý kª long #{_INFOAIM92,55,715, lý kª long } có th¬ dÕy cho ta ngß½i phái chiªn ð¤u kÛ nång , h¡n ðang · bên cÕnh ta . ")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,  selfId,  targetId)
	 	 CallScriptFunction(  SCENE_SCRIPT_ID,  "AskTheWay",  sceneId,  selfId,  sceneId,  92,  55,  " lý kª long "  )
	 	 return
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x080002_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x080002_g_eventList  do
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
function  x080002_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x080002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x080002_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x080002_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x080002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x080002_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x080002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x080002_OnDie(  sceneId,  selfId,  killerId  )
end

--**********************************
-- tin tÑc ð« kÏ 
--**********************************
function  x080002_MsgBox(  sceneId,  selfId,  str  )
	 Msg2Player(  sceneId,  selfId,  str,  MSG2PLAYER_PARA  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
