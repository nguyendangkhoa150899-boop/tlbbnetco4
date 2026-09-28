-- quÖ c¯c NPC
-- ðß¶ng thanh thu 
-- bình thß¶ng 

-- có sñ ki®n ID li®t bi¬u 
x080003_g_eventList={229016,228907,227000,227001,227002,227003,227004,227005,227006,227007,227008,227009,227010,227011,227012,227020,227900,050061}

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x080003_UpdateEventList(  sceneId,  selfId,targetId  )
        local      id	 =  LuaFnGetMenPai(  sceneId,  selfId  )
	 	 -- phán ðoán môn phái 
	 	 if  id  <  0  or  id  ==  9  or  id>12    then
	 	 	 playerMenpai=MP_WUMENPAI
	 	 elseif  id==0  then
	 	 	 playerMenpai=MP_SHAOLIN
	 	 elseif  id  ==  1  then
	 	 	 playerMenpai=MP_MINGJIAO
	 	 elseif  id  ==  2  then
	 	 	 playerMenpai=MP_GAIBANG
	 	 elseif  id  ==  3  then
	 	 	 playerMenpai=MP_WUDANG
	 	 elseif  id  ==  4  then
	 	 	 playerMenpai=MP_EMEI
	 	 elseif  id  ==  5  then
	 	 	 playerMenpai=MP_XINGSU
	 	 elseif  id  ==  6  then
	 	 	 playerMenpai=MP_DALI
	 	 elseif  id  ==  7  then
	 	 	 playerMenpai=MP_TIANSHAN
	 	 elseif  id  ==  8  then
	 	 	 playerMenpai=MP_XIAOYAO
	 	 elseif  id  ==  10  then
	 	 	 playerMenpai=MP_GUSU
	 	 elseif  id  ==  11  then
	 	 	 playerMenpai=MP_TANGMEN
	 	 elseif  id  ==  12  then
	 	 	 playerMenpai=MP_GUIGU
	 	 	 
	 	 end
	 if  playerMenpai  ~=  MP_GUIGU  then
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"        #Y ngß½i không phäi là quÖ c¯c ðích ð® tØ , không nên qu¤y r¥y ta thanh tînh , xin/m¶i mau r¶i ði ! . ")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 else  	 
	 
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"#Y ta là vß½ng huy«n phong , ta ban b¯ quÖ c¯c sß môn nhi®m vø . ")
	 	 CallScriptFunction(  x080003_g_eventList[1],  "OnEnumerate",sceneId,  selfId,  targetId  )-- xúc phát sß môn chü nhi®m vø 
	 	 CallScriptFunction(  228907,  "OnEnumerate",sceneId,  selfId,  targetId  )  -- tìm b±n môn nhi®m vø ban b¯ 
	 	 CallScriptFunction(  229011,  "OnEnumerate",sceneId,  selfId,  targetId,  MP_GUIGU  )
	 	 CallScriptFunction(  050025,  "OnEnumerate",sceneId,  selfId,  targetId  )-- thu t§p môn phái ðÕo cø ð±i tß·ng thß·ng 
	 	 CallScriptFunction(  050061,  "OnEnumerate",sceneId,  selfId,  targetId  )-- · t¶ trung ðßþc ch² sß môn ðào ðßþc nhi®m vø 
	 	 --CallScriptFunction(  229013,  "OnEnumerate",sceneId,  selfId,  targetId  )-- · t¶ trung ðßþc ch² sß môn ðào ðßþc nhi®m vø 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
end
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x080003_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x080003_UpdateEventList(  sceneId,  selfId,  targetId  )
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x080003_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  eventId  ==  229011  then
	 	 CallScriptFunction(  229011,  "OnDefaultEvent",sceneId,  selfId,  targetId,  MP_GUIGU,  GetNumText()  )
	 	 return
	 elseif  eventId  ==  050025  then
        CallScriptFunction(  050025,  "OnDefaultEvent",sceneId,  selfId,  targetId,  MP_GUIGU)
	 	 return
	 elseif  eventId  ==  050061  then
	 	 CallScriptFunction(  050061,  "OnDefaultEvent",sceneId,  selfId,  targetId,MP_GUIGU)
	 	 return
	 end

	 for  i,  findId  in  x080003_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x080003_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x080003_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId,  targetId)
	 	 	 end
	 	 	 return
	 	 end
	 end
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x080003_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x080003_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x080003_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x080003_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x080003_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x080003_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x080003_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x080003_OnDie(  sceneId,  selfId,  killerId  )
end

--**********************************
-- ð« giao v§t ph¦m 
--**********************************
function  x080003_OnMissionCheck(  sceneId,  selfId,  npcid,  scriptId,  index1,  index2,  index3,  indexpet  )
	 for  i,  findId  in  x080003_g_eventList  do
	 	 if  scriptId  ==  findId  then
	 	 	 CallScriptFunction(  scriptId,  "OnMissionCheck",  sceneId,  selfId,  npcid,  scriptId,  index1,  index2,  index3,  indexpet  )
	 	 	 return
	 	 end
	 end
end
