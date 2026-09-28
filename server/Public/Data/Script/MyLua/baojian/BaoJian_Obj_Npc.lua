

-- chân v¯n s¯ 
x910104_g_scriptId  =  910104
x910104_g_BoxId  =  40004645
x910104_g_eventList={}
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x910104_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 --AddText(sceneId,"    #{ZZZB_150811_109}")
	 AddText(sceneId,"    #{ZZZB_150811_94}")
	 --AddText(sceneId,"    #cFF0000 TØ Vi giáng, Vß½ng Ðïnh phá, Ngû Hành Tø, Vß½ng Quy«n l§p")
	 --AddText(sceneId,"    #G Bàn C± #W hy sinh bän thân mình khai tÕo tr¶i ð¤t, vÕn v§t ðßþc kh·i sinh, nhân loÕi mà b¡t ð¥u sinh sôi näy n·, nhßng tiªc thay sau tr§n chiªn v¾i cüa các chß th¥n th¶i thßþng c±, #GThüy Th¥n Cµng Công #Wðánh nhau v¾i #GHöa Th¥n Chúc Dung#W làm ð±" ) 
	 --AddText(sceneId," #G B¤t Châu Tiên S½n #W gây ðÕi nÕn cho nhân loÕi...Lúc này #GNæ Oa #Wðã dùng th¥n lñc thu th§p ðßþc ðá ngû s¡c mà vá tr¶i, nhân loÕi m¾i ðßþc bình an")
	 --AddText(sceneId," Nay ta ðã chu du tìm kh¡p thiên hÕ ð¬ hi¬u v« loÕi ðá này và may m¡n luy®n thành thu§t #cFF0000Ngû Hành Bäo Giám Bäo Ng÷c, #WsÑc mÕnh nåm loÕi ðá này uy lñc vô song, ðúng là kÏ v§t thßþng c±")
	 	 --AddText(sceneId," #ef12345#YChÑc Nång tÕm chßa m·")	
	 AddNumText(  sceneId,  x891002_g_scriptId,  " #cFF0000Ngßng Tø Bäo Ng÷c ",6  ,1    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  " #cFF0000Loan Kim Tr÷ng Tø Thuµc Tính ",6  ,5    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  " #cFF0000Vân Thüy Tr÷ng Tø Thuµc Tính ",6  ,6    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  " #cFF0000Thiên Höa Tr÷ng Tø Thuµc Tính ",6  ,4    )	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x910104_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x910104_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x910104_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 
	 if  GetNumText()  ==  1    then
	 local  misssusu  =  {MD_BIAOJIAN_SUXING1,MD_BIAOJIAN_SUXING2,MD_BIAOJIAN_SUXING3,MD_BIAOJIAN_SUXING4,MD_BIAOJIAN_SUXING5,MD_BIAOJIAN_NUM}
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId)
	 	 for  i  =  1,getn(misssusu)  do
	 	 UICommand_AddInt(sceneId,GetMissionData(sceneId,  selfId,  misssusu[i]))
	 	 end
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  2015123198)
	 elseif  GetNumText()  ==  4    then
local  mynowNinJiLevel  =  GetMissionData(sceneId,  selfId,  MD_BIAOJIAN_SUXING4)
local  bElementsLevel  =  mod(mynowNinJiLevel,1000)
local  mytaby  =  floor(mynowNinJiLevel/1000)	 
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId)
	 	 UICommand_AddInt(sceneId,mytaby)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  2015123195)
	 elseif  GetNumText()  ==  5    then
local  mynowNinJiLevel  =  GetMissionData(sceneId,  selfId,  MD_BIAOJIAN_SUXING1)
local  bElementsLevel  =  mod(mynowNinJiLevel,1000)
local  mytaby  =  floor(mynowNinJiLevel/1000)	 	 
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId)
	 	 UICommand_AddInt(sceneId,mytaby)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  2015123193)	 
	 elseif  GetNumText()  ==  6    then
local  mynowNinJiLevel  =  GetMissionData(sceneId,  selfId,  MD_BIAOJIAN_SUXING2)
local  bElementsLevel  =  mod(mynowNinJiLevel,1000)
local  mytaby  =  floor(mynowNinJiLevel/1000)	 	 
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId)
	 	 UICommand_AddInt(sceneId,mytaby)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  2015123191)	 	 	 
	 end



	 for  i,  findId  in  x910104_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x910104_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x910104_g_eventList  do
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
function  x910104_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x910104_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x910104_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x910104_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x910104_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x910104_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x910104_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x910104_OnDie(  sceneId,  selfId,  killerId  )
end