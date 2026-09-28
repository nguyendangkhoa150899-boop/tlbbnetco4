-- tu¥n hoàn nhi®m vø 
-- tri®u t§p ð°ng bÕn 
--************************************************************************
--MisDescBegin
-- chân v¯n s¯ 
x808131_g_ScriptId  =  808131

-- tiªp nh§n nhi®m vø NPC thuµc tính 
x808131_g_Position_X=282
x808131_g_Position_Z=276
x808131_g_SceneID=1
x808131_g_AccomplishNPC_Name=" lß½ng ðÕo sî "

-- thßþng mµt cái nhi®m vø ðích ID
--x808131_g_MissionIdPre  =  

-- nhi®m vø s¯ 
x808131_g_MissionId  =  1161

-- nhi®m vø møc tiêu npc
x808131_g_Name	 =" lß½ng ðÕo sî "

x808131_g_ItemId	 =30505255

-- nhi®m vø xªp loÕi 
x808131_g_MissionKind  =  12

-- nhi®m vø c¤p b§c 
x808131_g_MissionLevel  =  10000

-- có phäi là hay không tinh anh nhi®m vø 
x808131_g_IfMissionElite  =  0

--******** phía dß¾i m¤y hÕng là ðµng tînh bi¬u hi®n ðích nµi dung , dùng cho · nhi®m vø li®t bi¬u trung ðµng tînh bi¬u hi®n nhi®m vø tình hu¯ng ******
x808131_g_IsMissionOkFail  =  0	 	 	 	 	 -- thay ð±i lßþng ðích thÑ 0 v¸ 
--********************************** tr· lên là ðµng tînh ****************************


-- nhi®m vø vån v¯n miêu tä 
x808131_g_MissionName="#{SQXY_09061_4}"
x808131_g_MissionInfo="#{SQXY_09061_39}"    -- nhi®m vø miêu tä v« ph¥n ð¸a phß½ng nào thích hþp , ngß½i chï c¥n m· ra #Y túi ðeo lßng #W d£m nhi®m vø ðÕo cø lan , bên phäi ki®n ði¬m mµt cái cái này #Y nguy®n linh tuy«n #W , nó là có th¬ cho ngß½i tß½ng quan ð« kÏ . 
x808131_g_MissionTarget="#{SQXY_09061_11}"	 	 -- nhi®m vø møc tiêu 
x808131_g_ContinueInfo="#{SQXY_09061_19}"	 	 -- không hoàn thành nhi®m vø npc ð¯i thoÕi 
x808131_g_MissionComplete="#{SQXY_09061_36}"	 	 	 	 	 -- hoàn thành nhi®m vø npc nói chuy®n thoÕi 
x808131_g_ItemBonus={{id=20502010,num=1}}  -- hÑa nguy®n quä   tÕm dùng 
x808131_g_SignPost  =  {x  =  282,  z  =  276,  tip  =  " lß½ng ðÕo sî "}
x808131_g_MoneyBonus=20000
--x808131_g_SignPost_1  =  {x  =  185,  z  =  350,  tip  =  " hÑa nguy®n ði¬m "}
x808131_g_SignPost_1  =  {x  =  157,  z  =  188,  tip  =  " hÑa nguy®n ði¬m "}
x808131_g_Custom	 =  {  {id=" hß¾ng hÑa nguy®n cây hÑa nguy®n ",num=1}  }    -- nguyên lai là 5

--MisDescEnd
--************************************************************************

-- vai trò Mission thay ð±i lßþng nói rõ 
--0 s¯ : nhi®m vø trÕng thái 
--1 s¯ : 
--2 s¯ : ch² · cänh tßþng biên s¯ 
--3 s¯ : chï ð¸nh x t÷a ðµ 
--4 s¯ : chï ð¸nh z t÷a ðµ 
--5 s¯ : không dùng 
--6 s¯ : không dùng 
--7 s¯ : không dùng 

-- bäo tàng v¸ trí 
x808131_g_TreasureAddress  =  {	 {scene=4,x=157,z=188}}
--	 	 	 	 	 	 {scene=2,x=104,z=201},
--	 	 	 	 	 	 {scene=2,x=242,z=55},
--	 	 	 	 	 	 {scene=2,x=202,z=237},
--	 	 	 	 	 	 {scene=2,x=255,z=232},
--	 	 	 	 	 	 {scene=2,x=185,z=350},
--	 	 	 	 	 	 {scene=2,x=46,z=255},
--	 	 	 	 	 	 {scene=2,x=44,z=151},
--	 	 	 	 	 	 {scene=2,x=79,z=222}}

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ 
--**********************************
function  x808131_OnDefaultEvent(  sceneId,  selfId,  targetId  )	 -- ði¬m kích nên nhi®m vø sau thi hành này chân v¯n 
	 if  IsHaveMission(sceneId,selfId,x808131_g_MissionId)  >  0  then
	 	 -- g·i nhi®m vø nhu c¥u ðích tin tÑc 
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,x808131_g_MissionName)
	 	 	 AddText(sceneId,x808131_g_ContinueInfo)
	 	 	 AddMoneyBonus(  sceneId,  x808131_g_MoneyBonus  )
	 	 EndEvent(  )
	 	 bDone  =  x808131_CheckSubmit(  sceneId,  selfId  )
	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x808131_g_ScriptId,x808131_g_MissionId,bDone)
	 -- thöa mãn nhi®m vø tiªp thu ði«u ki®n 
	 elseif  x808131_CheckAccept(sceneId,selfId)  >  0  then
	 	 -- g·i nhi®m vø tiªp nh§n lúc bi¬u hi®n ðích tin tÑc 
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,x808131_g_MissionName)
	 	 	 AddText(sceneId,x808131_g_MissionInfo)
	 	 	 AddText(sceneId,"#{M_MUBIAO}#r")
	 	 	 AddText(sceneId,x808131_g_MissionTarget)
	 	 	 for  i,  item  in  x808131_g_ItemBonus  do
	 	 	 	 AddItemBonus(  sceneId,  item.id,  item.num  )
	 	 	 end
	 	 	 AddMoneyBonus(  sceneId,  x808131_g_MoneyBonus  )
	 	 EndEvent(  )
	 	 DispatchMissionInfo(sceneId,selfId,targetId,x808131_g_ScriptId,x808131_g_MissionId)
	 end
end

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x808131_OnEnumerate(  sceneId,  selfId,  targetId  )

        -- nªu nhß nhà ch½i còn chßa hoàn thành thßþng mµt cái nhi®m vø 
        --if  	 IsMissionHaveDone(sceneId,selfId,g_MissionIdPre)  <=  0  then
        --	 return
        --end
        -- nªu nhß nhà ch½i hoàn thành quá nhi®m vø này 
        if  IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId)  >  0  then
        	 return  
        -- nªu nhß ðã nh§n này nhi®m vø 
        elseif  IsHaveMission(sceneId,selfId,x808131_g_MissionId)  >  0  then
	 	 AddNumText(sceneId,x808131_g_ScriptId,x808131_g_MissionName,2,-1);    -- n½i này che gi¤u r½i , không ð¬ cho h¡n tiªp tøc gia tång nhi®m vø s¯ 
                return  

        -- thöa mãn nhi®m vø tiªp thu ði«u ki®n 
        elseif  x808131_CheckAccept(sceneId,selfId)  >  0  then

	 	 AddNumText(sceneId,x808131_g_ScriptId,x808131_g_MissionName,1,-1);

            end
end

--**********************************
-- ki¬m tr¡c tiªp nh§n ði«u ki®n 
--**********************************
function  x808131_CheckAccept(  sceneId,  selfId  )
	 -- c¥n 30 c¤p tr· lên m¾i có th¬ nh§n 
	 if  GetLevel(  sceneId,  selfId  )  >=  30  then
	 	 return  1
	 else
	 	 return  0
	 end
end

--**********************************
-- tiªp nh§n 
--**********************************
function  x808131_OnAccept(  sceneId,  selfId  )

	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,MISSION_XUYUAN  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()


	 if  x808131_CheckAccept(sceneId,  selfId  )<=0  then
	 	 return
	 end
	 

        -- ki¬m tr¡c hôm nay là hay không vßþt qua 3 l¥n 	 
                if  nLastDay  ==  nToday  and  nCount  >=  3  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," m²i ngày chï có th¬ làm 3 l¥n hÑa nguy®n nhi®m vø ")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
                end


	 --x808131_g_sequence  =  random(3)	 	 	 	 	 -- cån cÑ bäo v§t ð¸a ði¬m t±ng s¯ ðÕt ðßþc mµt ngçu nhiên ðªm 
	 SceneNum  =  x808131_g_TreasureAddress[1].scene
	 X	 	   =  x808131_g_TreasureAddress[1].x
	 Z	 	   =  x808131_g_TreasureAddress[1].z
	 -- tång thêm nguy®n linh tuy«n 
	 BeginAddItem(sceneId)
	 	 AddItem(  sceneId,x808131_g_ItemId,  1  )
	 local  ret  =  EndAddItem(sceneId,selfId)
	 
	 if  ret  <=  0  then
	 	 Msg2Player(    sceneId,  selfId,"#Y nhi®m vø cüa ngß½i túi ðeo lßng ðã ð¥y . ",  MSG2PLAYER_PARA  )
	 
	 else
	 	 -- gia nh§p nhi®m vø ðªn nhà ch½i li®t bi¬u 
	 	 local  ret1  =  AddMission(  sceneId,selfId,  x808131_g_MissionId,  x808131_g_ScriptId,  0,  0,  1  )

	 	 	 local  nData_xy  =  0
	 	 	 if  nLastDay  ~=  nToday  then
                                                                nCount=0
	 	 	 	 nData_xy  =  SetHighWord(  nData_xy,  nToday  )
	 	 	 	 nData_xy  =  SetLowWord(  nData_xy,  1  )
	 	 	 else
	 	 	 	 nData_xy  =  SetHighWord(  nData_xy,  nToday  )
	 	 	 	 nData_xy  =  SetLowWord(  nData_xy,  nCount  +  1  )
	 	 	 end

	 	                 SetMissionData(  sceneId,  selfId,  MISSION_XUYUAN,  nData_xy  )


	 
	 	 if  ret1  >  0    then
	 	 	 
	 	 	 -- thiªt trí nhi®m vø thay ð±i lßþng bäo v§t ðích cänh tßþng biên s¯ cùng v¸ trí t÷a ðµ 
	 	 	 misIndex  =  GetMissionIndexByID(sceneId,selfId,x808131_g_MissionId)	 	 -- l¤y ðßþc nhi®m vø · 20 cá nhi®m vø trung ðích tñ li®t s¯ 
	 	 	 SetMissionByIndex(sceneId,selfId,misIndex,0,0)	 	 	 	 	 -- cån cÑ tñ li®t s¯ ðem nhi®m vø thay ð±i lßþng ðích v¸ thÑ nh¤t ðßa 0	 v¸ thÑ nh¤t là hoàn thành / th¤t bÕi tình hu¯ng 
	 	 	 SetMissionByIndex(sceneId,selfId,misIndex,2,SceneNum)	 	 -- ðem v¸ thÑ ba ðßa vì bäo v§t ðích cänh tßþng biên s¯ 
	 	 	 SetMissionByIndex(sceneId,selfId,misIndex,3,X)	 	 	 	 	 -- ðem v¸ thÑ tß ðßa vì bäo v§t ðích X t÷a ðµ 
	 	 	 SetMissionByIndex(sceneId,selfId,misIndex,4,Z)	 	 	 	 	 -- ðem v¸ thÑ nåm ðßa vì bäo v§t ðích Z t÷a ðµ 
	 	 	 
	 	 	 AddItemListToHuman(sceneId,selfId)
	 	 	 Msg2Player(  sceneId,  selfId,"#Y tiªp nh§n nhi®m vø : mµt ngàn lë mµt cá nguy®n v÷ng ",MSG2PLAYER_PARA  )
	 	 	 
	 	     Msg2Player(  sceneId,  selfId,  "@*;flagPOS;"  ..  sceneId  ..  ";"  ..  X  ..  ";"  ..  Z  ..  ";".." hÑa nguy®n ði¬m ",  MSG2PLAYER_PARA  )
	 	 	 Msg2Player(  sceneId,  selfId,  "@*;flashPOS;"  ..  sceneId  ..  ";"  ..  X  ..  ";"  ..  Z  ..  ";"  ..  " hÑa nguy®n ði¬m ",  MSG2PLAYER_PARA  )
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,  " ngß½i l¤y ðßþc nguy®n linh tuy«n . ");
	 	 	 EndEvent(sceneId)
	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 
	 	 	 CallScriptFunction(  SCENE_SCRIPT_ID,  "AskTheWay",  sceneId,  selfId,  sceneId,  x808131_g_SignPost_1.x,  x808131_g_SignPost_1.z,  x808131_g_SignPost_1.tip  )
	 	 else
	 	 	 Msg2Player(  sceneId,  selfId,"#Y nhi®m vø cüa ngß½i ngày chí ðã ð¥y . ",  MSG2PLAYER_PARA  )
	 	 
	 	 end
	 end
end

--**********************************
-- buông tha cho 
--**********************************
function  x808131_OnAbandon(  sceneId,  selfId  )
	 -- thü tiêu nhà ch½i nhi®m vø li®t bi¬u trung ð¯i Ñng nhi®m vø 
        res  =  DelMission(  sceneId,  selfId,  x808131_g_MissionId  )
	 if  res  >  0  then
	 	 -- d¶i ði nhi®m vø v§t ph¦m 
	 	 DelItem(  sceneId,  selfId,  x808131_g_ItemId,  1  )  -- không mu¯n thü tiêu nguy®n linh tuy«n li­u , tÕi sao mu¯n thü tiêu ðây ? hÕt tØ chú ( thü tiêu nguyên nhân là tiªp nh§n vø lúc cho mµt , buông tha cho li«n ðem cho mµt thü tiêu #
	 	 DelItem(  sceneId,  selfId,  40001113,  5  )    -- thü tiêu hÑa nguy®n b¢ng chÑng , cái này r¤t có c¥n thiªt 
	 	 --CallScriptFunction(  SCENE_SCRIPT_ID,  "DelSignpost",  sceneId,  selfId,  sceneId,  x808131_g_SignPost.tip  )
	 	 
	     Msg2Player(  sceneId,  selfId,  "@*;flagNPCdel;"  ..  sceneId  ..  ";"  ..  " hÑa nguy®n ði¬m ",  MSG2PLAYER_PARA  )
	     Msg2Player(  sceneId,  selfId,  "@*;flashNPCdel;"  ..  sceneId  ..  ";"  ..  " hÑa nguy®n ði¬m ",  MSG2PLAYER_PARA  )
	 	 
	 	 
	 end
end

--**********************************
-- tiªp tøc 
--**********************************
function  x808131_OnContinue(  sceneId,  selfId,  targetId  )
	 -- ð« giao nhi®m vø lúc ðích nói rõ tin tÑc 
        BeginEvent(sceneId)
	 	 AddText(sceneId,x808131_g_MissionName)
	 	 AddText(sceneId,x808131_g_MissionComplete)
	 	 AddMoneyBonus(  sceneId,  x808131_g_MoneyBonus  )
	 	 for  i,  item  in  x808131_g_ItemBonus  do
	 	 	 AddItemBonus(  sceneId,item.id,  item.num  )
	 	 end
        EndEvent(  )
        DispatchMissionContinueInfo(sceneId,selfId,targetId,x808131_g_ScriptId,x808131_g_MissionId)
end

--**********************************
-- ki¬m tr¡c có ðßþc hay không ð« giao 
--**********************************
function  x808131_CheckSubmit(  sceneId,  selfId  )
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  40001113)  >=  5  then
                return	 1
                else
                                return	 0
                end
end

--**********************************
-- ð« giao 
--**********************************
function  x808131_OnSubmit(  sceneId,  selfId,  targetId,selectRadioId  )
	 if  x808131_CheckSubmit(  sceneId,  selfId,  selectRadioId  )  ==  1  then
        	 BeginAddItem(sceneId)
	 	 	 for  i,  item  in  x808131_g_ItemBonus  do
	 	 	 	 AddItem(  sceneId,item.id,  item.num  )
	 	 	 end
	 	 ret  =  EndAddItem(sceneId,selfId)
	 	 -- tång thêm nhi®m vø tß·ng thß·ng 
	 	 	 if  ret  >  0  then
	 	 	 	 	 AddMoney(sceneId,selfId,x808131_g_MoneyBonus  );
	 	 	 	 	 LuaFnAddExp(  sceneId,  selfId,80000)
	 	 	 	 	 ret  =  DelMission(  sceneId,  selfId,  x808131_g_MissionId  )
                                                                                DelItem(  sceneId,  selfId,  40001113,  5  )
	 	 	 	 if  ret  >  0  then
	 	 	 	 	 MissionCom(  sceneId,  selfId,  x808131_g_MissionId  )
	 	 	 	 	 AddItemListToHuman(sceneId,selfId)
	 	 	 	 	 Msg2Player(    sceneId,  selfId,"#Y hoàn thành nhi®m vø : mµt ngàn lë mµt cá nguy®n v÷ng ",MSG2PLAYER_PARA  )

	 	                                                 BeginEvent(sceneId)
	 	                                                 	 AddText(sceneId," ðÕt ðßþc [ hÑa nguy®n quä ]*1")
	 	                                                 EndEvent(sceneId)
	 	                                                 DispatchMissionTips(sceneId,selfId)

                                                                    if  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ==  mod(GetWeekTime(),10)  then
                                                                          if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  1  or
                                                                                floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  2  or
                                                                                floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  3  and  floor(mod(GetMissionData(sceneId,selfId,GONGZI_2),10^8)/10^6)  <  3  then
                                                                                SetMissionData(sceneId,selfId,GONGZI_2,GetMissionData(sceneId,selfId,GONGZI_2)+10^6)
                                                                          end
                                                                    end
                                                                    CallScriptFunction(  890536,"JianCe",sceneId,selfId)
                                                                    if  floor(mod(GetMissionData(sceneId,selfId,HUOYUEFB_1),10^6)/10^5)  <  1  then
                                                                          SetMissionData(sceneId,selfId,HUOYUEZHI,GetMissionData(sceneId,selfId,HUOYUEZHI)+20)  -- hoÕt dßþc tr¸ giá +20
                                                                          SetMissionData(sceneId,selfId,HUOYUEFB_1,GetMissionData(sceneId,selfId,HUOYUEFB_1)+10^5)
                                                                    end
	 	 	 	 	 --CallScriptFunction(  210212,  "OnDefaultEvent",sceneId,  selfId,  targetId)
	 	 	                 end
	 	 	 else
	 	 	 	 -- nhi®m vø tß·ng thß·ng không có thêm ðßþc công 
	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 strText  =  " túi ðeo lßng ðã ð¥y , không cách nào hoàn thành nhi®m vø "
	 	 	 	 	 AddText(sceneId,strText);
	 	 	 	 EndEvent(sceneId)
	 	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 end
	 end
end

--**********************************
-- giªt chªt quái v§t ho£c nhà ch½i 
--**********************************
function  x808131_OnKillObject(  sceneId,  selfId,  objdataId  )
end

--**********************************
-- tiªn vào khu vñc sñ ki®n 
--**********************************
function  x808131_OnEnterArea(  sceneId,  selfId,  zoneId  )
end

--**********************************
-- ðÕo cø sØa ð±i 
--**********************************
function  x808131_OnItemChanged(  sceneId,  selfId,  itemdataId  )
end

--**********************************
-- ðÕo cø sØ døng 
--**********************************
function  x808131_OnUseItem(  sceneId,  selfId,  BagIndex  )
-- nªu nhß nhi®m vø ðã hoàn thành 
	 
	 misIndex  =  GetMissionIndexByID(sceneId,selfId,x808131_g_MissionId)
	 x808131_g_MissionCondition  =  GetMissionParam(sceneId,selfId,misIndex,0)	 	 -- ðÕt ðßþc nhi®m vø trÕng thái 
	 scene  =  GetMissionParam(sceneId,selfId,misIndex,2)	 	 	 	 	 -- ðÕt ðßþc bäo v§t cänh tßþng s¯ 
	 treasureX  =  GetMissionParam(sceneId,selfId,misIndex,3)	 	 	 	 -- ðÕt ðßþc bäo v§t X t÷a ðµ 
	 treasureZ  =  GetMissionParam(sceneId,selfId,misIndex,4)	 	 	 	 -- ðÕt ðßþc bäo v§t Z t÷a ðµ 	 
	 if  x808131_g_MissionCondition  ==  1  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," hÑa nguy®n ðã hoàn thành , không mu¯n lãng phí th¶i gian næa li­u , nhanh ði ðóng nhi®m vø ði ! ")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 -- l¤y ðßþc nhà ch½i trß¾c m£t t÷a ðµ 
	 PlayerX  =  GetHumanWorldX(sceneId,selfId)
	 PlayerZ  =  GetHumanWorldZ(sceneId,selfId)
	 -- tính toán nhà ch½i cùng bäo tàng ðích khoäng cách 
	 Distance  =  floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	 if  sceneId==scene  or  sceneId==71  or  sceneId==72  then
	 else
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," hÑa nguy®n th¤t bÕi , xin liên lÕc GM")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 if  Distance  >  5  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," xin/m¶i · thái h° hÑa nguy®n cây (157,188) phø c§n sØ døng [ nguy®n linh tuy«n ] , trß¾c m£t t÷a ðµ khoäng cách hÑa nguy®n cây còn có "..Distance.." thß¾c ")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 elseif  Distance  <=  5  then
	 	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  40001113)  <  5  then
	 	 CallScriptFunction(  SCENE_SCRIPT_ID,  "AskTheWay",  sceneId,  selfId,  sceneId,  x808131_g_SignPost.x,  x808131_g_SignPost.z,  x808131_g_SignPost.tip  )
                                DelItem(  sceneId,  selfId,  x808131_g_ItemId,  1  )
                                local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  40001113,  1  );
                                if      LuaFnGetAvailableItemCount(sceneId,  selfId,  40001113)  ==  5      then
                                                                BeginEvent(sceneId)
	 	 AddText(sceneId," ngß½i ðã hoàn thành 5 l¥n hÑa nguy®n , mau tr· v« tìm lß½ng ðÕo sî ð« giao nhi®m vø nh§n l¤y tß·ng thß·ng ði . . ")
	 	 EndEvent(sceneId)
                                DispatchMissionTips(sceneId,selfId)
                                SetMissionByIndex(sceneId,selfId,misIndex,0,1)	 	 -- ðem nhi®m vø trÕng thái thay ð±i lßþng thiªt trí vì 1, bày tö ðã hoàn thành     40001113
	 	 SetMissionByIndex(sceneId,selfId,misIndex,1,1)	 	 -- ðem nhi®m vø trÕng thái thay ð±i lßþng thiªt trí vì 1, bày tö ðã hoàn thành 
                                end
                                                                local    xysl=    LuaFnGetAvailableItemCount(sceneId,  selfId,  40001113)
                                                                if      xysl    <    5      then
                                BeginEvent(sceneId)
	 	 	 AddText(sceneId," ngß½i ðã hoàn thành thÑ "..xysl.." l¥n hÑa nguy®n . ")
	 	 EndEvent(sceneId)
                                DispatchMissionTips(sceneId,selfId)
                                end
                                end
	 end
end
