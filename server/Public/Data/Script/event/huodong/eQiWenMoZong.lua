--2014.7.15    vân tß¾c biên chª 
-- tìm v§t nhi®m vø 
-- kÏ höi ma tung 
--MisDescBegin
-- chân v¯n s¯ 
x808134_g_ScriptId  =  808134

x808134_g_beginTime1  =  19  *  60  +  30;
x808134_g_endTime1  =  22  *  60  ;
rwbz=0
x808134_g_IsMissionOkFail  =  0	 	 	 	 	 	 	 --  nhi®m vø hoàn thành d¤u hi®u 
x808134_g_MoZongFlag  =  0                                                              -- hoàn thành d¤u hi®u 
x808134_g_rws  =    40001115
x808134_g_bgs  =    40004628
x808134_g_Position_X=282
x808134_g_Position_Z=276
x808134_g_SceneID=4
x808134_g_AccomplishNPC_Name=" hÑa nguy®n cây "
completeNpcName=""  -- n½i này trß¾c ð¸nh nghîa thay ð±i lßþng # nhß không ch×ng nghîa , phía sau không tìm ðßþc cái này thay ð±i lßþng , s¨ khiªn cho chân v¯n d×ng lÕi chªt )
chengshi=""    -- n½i này trß¾c ð¸nh nghîa thay ð±i lßþng 
-- nhi®m vø s¯ 
x808134_g_MissionId  =  1157

-- møc tiêu NPC
x808134_g_Name	 =" lß½ng ðÕo sî "
x808134_g_Name2	 =" hÑa nguy®n cây "
x808134_g_ItemId	 =40004628
-- nhi®m vø xªp loÕi 
x808134_g_MissionKind  =  12

-- nhi®m vø c¤p b§c 
x808134_g_MissionLevel  =  30

-- có phäi là hay không tinh anh nhi®m vø 
x808134_g_IfMissionElite  =  0

-- phía dß¾i m¤y hÕng là ðµng tînh bi¬u hi®n ðích nµi dung , dùng cho · nhi®m vø li®t bi¬u trung ðµng tînh bi¬u hi®n nhi®m vø tình hu¯ng **********************

-- tr· lên là ðµng tînh **************************************************************
-- nhi®m vø tên 
x808134_g_MissionName="#cFF0000 kÏ höi ma tung "
x808134_g_MissionInfo="        l¶i nói ngàn nåm trß¾c Trung Nguyên ðÕi hÕn , hoàng ðª vì cÑu v¾t thß½ng sinh , ðem thØ ma phong v¾i hoàng tuy«n dß¾i . mùa hè lÕi t¾i , mµt ít pháp lñc cao thâm chi thØ ma li«n tránh thoát bùa ðích trói buµc ði ra nguy hÕi nhân gian .         #r        tr÷ng hÕ trong lúc , #G m²i tu¥n ba ðích 19:00 ðªn 22 : 00#W là thØ ma cØa h½i hß nhßþc th¶i ði¬m . nªu ðÕi hi®p có th¬ b¡t · cái này th¶i c½ di®t tr× nhæng thÑ này thØ ma , không chï có có th¬ vì dân tr× hÕi , còn có th¬ có giúp tång lên tu vi . "
x808134_g_MissionTarget="        t× Tô Châu #{_INFOAIM279,44,1,} ði ra ngoài ðªn thái h° tìm ðßþc #Y hÑa nguy®n cây #{_INFOAIM157,188,4, hÑa nguy®n cây }#W hi¬u rõ #G thØ ma #W tung tích ðích tin tÑc , sau ðó tr· lÕi Tô Châu ðích #Y lß½ng ðÕo sî #{_INFOAIM282,276,1, lß½ng ðÕo sî }#W n½i ðó trä lÕi nhi®m vø . "
x808134_g_MissionInfo2=  "#Y        tr÷ng yªu ð« kÏ : #P cái này liên hoàn nhi®m vø c¥n nhi®m vø cüa ngß½i túi ít nh¤t phäi có 7 cá ch² tr¯ng , nªu nhß ch² tr¯ng chßa ðü , xin/m¶i trß¾c ðem chiªm v¸ ðích nhi®m vø hoàn thành ho£c buông tha cho nhæng nhi®m vø này , lßu chân v¸ trí tr· lÕi hái nhi®m vø . "
x808134_g_ContinueInfo="      hi®p sî nhßng hß¾ng hÑa nguy®n cây höi thåm ðßþc thØ ma ðích tung tích li­u sao ? "
x808134_g_MissionComplete="      ngß½i ðã hi¬u ðßþc thØ ma ðích tung tích li­u sao ? "
x808134_g_MoneyBonus=20000
x808134_g_SignPost  =  {x  =  157,  z  =  188,  tip  =  " hÑa nguy®n cây "}
x808134_g_RadioItemBonus={{id=30505255,num=3},{id=39999901,num=1},{id=38000188,num=1}}
x808134_g_ItemBonus={{id=40004628,num=1}}
--MisDescEnd
-- dùng ð¬ bäo t°n tñ phù chu²i cách thÑc hóa ðích s¯ li®u 
x808134_g_FormatList  =  {
" tìm ðßþc thái h° ðích hÑa nguy®n cây ,#G sau ðó tr· lÕi Tô Châu ðích #Y lß½ng ðÕo sî #{_INFOAIM282,276,1,}#G n½i ðó trä lÕi nhi®m vø . ",
}

-- cách thÑc tñ phù chu²i trung ð¯i Ñng v¾i g_StringList trung tñ phù chu²i ðích tác dçn ,  bày tö t× 4 b¡t ð¥u , sau bao nhiêu v¸ coi SetMissionByIndexEx(...) h½n thi¬u mà ð¸nh 
x808134_g_StrForePart=4
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x808134_UpdateEventList(  sceneId,  selfId,targetId  )
	 
end

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ 
--**********************************
function  x808134_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 
	 if  IsMissionHaveDone(sceneId,selfId,x808134_g_MissionId)  <  0  then
	 	 return
	 	 -- nªu nhß ðã nh§n này nhi®m vø 
	 elseif  (IsHaveMission(sceneId,selfId,x808134_g_MissionId)  >  0)  then
	           --DelMission(  sceneId,  selfId,  x808134_g_MissionId  )
	 	 --********
	 	 local  RWName=GetName(sceneId,  targetId)
	 	 if  RWName  ==  x808134_g_Name  then
	 	 	 local  misIndex  =  GetMissionIndexByID(sceneId,selfId,x808134_g_MissionId)
	 	 	 local  npcId  =  GetMissionParam(sceneId,  selfId,  misIndex,x808134_g_StrForePart+1)
	 	 	 --local  _,  npcName,  npcScene,  x,  z  =  GetNpcInfoByNpcId(sceneId,npcId)
	 	 	 local  npcName,  npcScene,  x,  z  =  GetNpcInfoByNpcId(sceneId,npcId)
	 	 	 local  npcScene=4
	 	 	 local  x=188
	 	 	 local  strText  =  format("        ngß½i tìm ðßþc hÑa nguy®n ch¸u sao ? hÑa nguy®n cây ðang · thái h° . ngß½i có th¬ ði¬m kích Alt+Q tra xét nhi®m vø møc tiêu .     ",  npcScene,  npcName,  x,  z)
	 	 	 --********
	 	 	 --****************************
	 	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,x808134_g_MissionName)
	 	 	 AddText(sceneId,  strText)
	 	 	 --AddText(sceneId,x808134_g_MissionContinue)
	 	 	 --local  BonusMoney  =  22500	 --90  +  (GetLevel(sceneId,  selfId)  -  10)  *  5
	 	 	 --local  BonusExp  =  36200
	 	 	 --AddText(sceneId,  "#R tß·ng thß·ng ngß½i "  ..  tostring(BonusExp)  ..  " chút kinh nghi®m cùng "  ..  "#{_MONEY"  ..  tostring(BonusMoney)  ..  "} , nhi«u h½n bái phöng mµt cái danh nhân , ngß½i làm vß¶n kÛ thu§t s¨ ð« cao , tâm cänh cûng s¨ tång cß¶ng . ")
	 	 	 --SetMissionCacheData(sceneId,  selfId,  0,  BonusMoney)
	 	 	 --SetMissionCacheData(sceneId,  selfId,  1,  BonusExp)
	 	 	 AddMoneyBonus(  sceneId,  x808134_g_MoneyBonus  )
	 	 	 EndEvent(  )
	 	 	 bDone  =  x808134_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x808134_g_ScriptId,x808134_g_MissionId,bDone)
	 	 	 --DispatchMissionContinueInfo(sceneId,  selfId,  targetId,  x808134_g_ScriptId,  x808134_g_MissionId,x808134_g_ScriptId)
	 	 	 --DispatchEventList(sceneId,  selfId,  -1)
	 	 	 --****************************
	 	 end
	 	 -- nªu nhß không nh§n này nhi®m vø thä thöa mãn nhi®m vø tiªp thu ði«u ki®n 
	 elseif  x808134_CheckAccept(sceneId,selfId)  >  0  then
	 	 --****************************
	 	 if  GetName(sceneId,targetId)  ==  x808134_g_Name  then
	 	 	                                     
	 	 	 local  iDayCount  =  GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
	 	 	                                     
	 	 	 local  iTime  =  GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
	 	 	 local  iDayTime  =  floor(iTime/100)	 	 	 	 	 -- l¥n trß¾c buông tha cho nhi®m vø th¶i gian ( ngày ðªm )
	 	 	 local  iQuarterTime  =  mod(iTime,100)	 	 	 	 -- l¥n trß¾c buông tha cho nhi®m vø th¶i gian ( mµt kh¡c loÕi )
	 
	 	 	 local  iDayHuan  =  iDayCount  	 -- ngày ðó bên trong hoàn thành nhi®m vø s¯ l¥n 
	 	 	       
	 	 	 local  CurTime  =  GetQuarterTime()	 	 	 	 	 	 	 -- trß¾c m£t th¶i gian 
	 	 	 local  CurDaytime  =  floor(CurTime/100)	 	 	 -- trß¾c m£t th¶i gian ( ngày )
	 	 	 local  CurQuarterTime  =  mod(CurTime,100)  	 -- trß¾c m£t th¶i gian ( mµt kh¡c ð°ng h° )
	 	 	                                       --end  modified  by  zhangguoxin  090207
	 	 	 
	 	 	 if  iDayTime  ~=  CurDaytime    then
	 	 	 	 iDayHuan  =  0
	 	 	 	 CurQuarterTime  =  99
	 	 	 end


	 	 	 if  iDayTime  ==  CurDaytime  then
	 	 	 	 if  CurQuarterTime  ==  iQuarterTime  then
	 	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 	 AddText(sceneId,  x808134_g_MissionName)
	 	 	 	 	 	 AddText(sceneId,  "    b·i vì ngß½i buông tha cho quá nhi®m vø , · 15 phút bên trong ngß½i không th¬ tiªp thu nhi®m vø m¾i !")
	 	 	 	 	 EndEvent(  )
	 	 	 	 	 DispatchEventList(sceneId,  selfId,  -1)
	 	 	 	 	 return
	 	 	 	 end
	 	 	 end
	 	 	 --///////////////////////////////////////////////////  end
	 	 	 
	 	 	 -- g·i nhi®m vø tiªp nh§n lúc bi¬u hi®n ðích tin tÑc 
	 	 	 BeginEvent(sceneId)
	 	 	 	 -- gia nh§p nhi®m vø ðªn nhà ch½i li®t bi¬u 
	 	 	 	 --local  bAdd  =  AddMission(  sceneId,selfId,  x808134_g_MissionId,  x808134_g_ScriptId,  1,  0,  1  )
	 	 	 	 --if  bAdd  <  1  then
	 	 	 	 --	 return
	 	 	 	 --end	 
	 	 	 	 -- phong töa møc tiêu NPC chuy®n cüa món Flag
	 	 	 	 --local  nSceneId=4
	 	 	 	 --local  nPosX=157
	 	 	 	 --local  nPosZ=188
	 	 	 	 --local  strNpcName=" hÑa nguy®n cây "
	 	 	 	 --local  nNpcId=13296
	 	 	 	 --local  strNpcScene=4
	 	 	 	 --SetMissionEvent(sceneId,  selfId,  x808134_g_MissionId,  4)
	 	 	 	 
	 	 	 	 --local  nNpcId,  strNpcName,  strNpcScene,  nSceneId,  nPosX,  nPosZ,  strNPCDesc  =  GetOneMissionNpc(tonumber(x808134_g_Name2))
	 	 	 	 --print(nNpcId,  strNpcName,  strNpcScene,  nSceneId,  nPosX,  nPosZ)
	 	 	 
	 	 	 	 --Msg2Player(    sceneId,  selfId,"#Y tiªp nh§n nhi®m vø : kÏ höi ma tung ",  MSG2PLAYER_PARA  )
	 	 	 	 --CallScriptFunction(  SCENE_SCRIPT_ID,  "AskThePos",  sceneId,  selfId,  nSceneId,  nPosX,  nPosZ,  strNpcName)

	 	 	 	 -- l¤y ðßþc nhi®m vø trung ðích tñ li®t s¯ 
	 	 	 	 local  misIndex  =  GetMissionIndexByID(sceneId,selfId,x808134_g_MissionId)
	 	 	 	 
	 	 	 	 SetMissionByIndex(sceneId,  selfId,misIndex,  0,  0)  -- thiªt trí nhi®m vø có hay không hoàn thành # không hoàn thành #
	 	 	 	 
	 	 	 	 SetMissionByIndex(sceneId,  selfId,  misIndex,x808134_g_StrForePart,  0)
	 	 	 	 SetMissionByIndex(sceneId,  selfId,  misIndex,  x808134_g_StrForePart+1,  nNpcId)
	 	 	 	 --////////////////////////////////////////////////////////////
	 	 	 	 AddText(sceneId,x808134_g_MissionName)
                                AddText(sceneId,x808134_g_MissionInfo)
	 	 	 	 AddText(sceneId,x808134_g_MissionInfo2)
	 	 	 	 local  SceneName=" thái h° "
	 	 	 	 local  MBName=" hÑa nguy®n cây "
	 	 	 	 str  =  format(" m¶i/xin ngß½i ði tìm ðªn "..SceneName.." ðích "..MBName..", sau ðó tr· lÕi lß½ng ðÕo sî cái này trä lÕi nhi®m vø ! ",  strNpcScene,  strNpcName,  nPosX,  nPosZ)
                                                                  rwxx  =  format(" l¶i nói ngàn nåm trß¾c Trung Nguyên ðÕi hÕn , hoàng ðª vì cÑu v¾t thß½ng sinh , ðem thØ ma phong v¾i hoàng tuy«n dß¾i . mùa hè lÕi t¾i , mµt ít pháp lñc cao thâm chi thØ ma li«n tránh thoát bùa ðích trói buµc ði ra nguy hÕi nhân gian .         #r tr÷ng hÕ trong lúc , #G m²i tu¥n ba ðích 19:00 ðªn 22 : 00#W là thØ ma cØa h½i hß nhßþc th¶i ði¬m . nªu ðÕi hi®p có th¬ b¡t · cái này th¶i c½ di®t tr× nhæng thÑ này thØ ma , không chï có có th¬ vì dân tr× hÕi , còn có th¬ có giúp tång lên tu vi . ")
                                                                  AddText(scentId,rwxx)
	 	 	 	 AddText(sceneId,  str)
	 	 	 	 AddText(sceneId,"#{M_MUBIAO}")
	 	 	 	 strMissionTarget  =  format(" tìm ðßþc "..SceneName.." ðích "..MBName,  strNpcScene,  strNpcName,  nPosX,  nPosZ)
	 	 	 	 AddText(sceneId,  strMissionTarget)
	 	 	 	 for  i,  item  in  x808134_g_RadioItemBonus  do
	 	 	         AddItemBonus(  sceneId,  item.id,  item.num  )
	 	                 end
	 	                 AddMoneyBonus(  sceneId,  x808134_g_MoneyBonus  )
	 	 	         EndEvent(  )
                                                        BeginAddItem(sceneId)
                                                                AddItem(sceneId,x808134_g_bgs,  1)
	                                                 EndAddItem(sceneId,selfId)
	 	 	         DispatchMissionInfo(sceneId,selfId,targetId,x808134_g_ScriptId,x808134_g_MissionId)
	 	 	 end
	 	 end
    end

	 	 --****************************
	 	 

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x808134_OnEnumerate(  sceneId,  selfId,  targetId  )
        --local  nHour  =  GetHour();
	 --local  nMinute  =  GetMinute();
	 --local  nCurTempTime  =  nHour  *  60  +  nMinute;
	 --if  nCurTempTime  <  x808133_g_beginTime1  and  nCurTempTime  >  x808133_g_endTime1  then
	 --	 return  0
	 --else
	 --return  1;
	 --end
                --local  DayTimes,  oldDate,  nowDate,  takenTimes

	 --DayTimes  =  GetMissionData(  sceneId,  selfId,  MD_ZHONGXIACHUMO_TIME  )
	 --oldDate  =  mod(  DayTimes,  100000  )
	 --takenTimes  =  floor(  DayTimes/100000  )

	 --nowDate  =  GetDayTime()
	 --if  nowDate  ==  oldDate  then
	 --	 takenTimes  =  0
	 --end

	 --if  takenTimes  >=  1  then
	 	 --x050100_NotifyFailTips(  sceneId,  selfId,  " ngài hôm nay nh§n l¤y nhi®m vø s¯ l¥n ðã vßþt qua "  ..  x050100_g_TakeTimes  ..  " l¥n , xin/m¶i ngày mai tr· lÕi nh§n l¤y . "  )
	 --	 return
	 --else
	 --	 DayTimes  =  nowDate  +  takenTimes  *  100000
	 --	 SetMissionData(  sceneId,  selfId,  MD_ZHONGXIACHUMO_TIME,  DayTimes  )
	 --end

              --  local  td  =  GetTime2Day()
	         --  local  lt  =  GetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME)
	           --if  td  ==  lt  then  
	             --    x808134_MsgBox(sceneId,  selfId,targetId,"        m²i ngày chï có th¬ nh§n l¤y 1 l¥n tr÷ng hÕ tr× ma nhi®m vø ! "  )
	 	 --return  0
	           --end
                if    LuaFnGetAvailableItemCount(  sceneId,  selfId,  x808134_g_bgs  )  <  1    then
	 	 return
	     end
	 -- nªu nhß nhà ch½i hoàn thành quá nhi®m vø này 
        --if  IsMissionHaveDone(sceneId,selfId,x808134_g_MissionId)  >  0  then
        --	 return
	 --end
	 -- nªu nhß ðã nh§n này nhi®m vø 
	 if  IsHaveMission(sceneId,selfId,x808134_g_MissionId)  >  0  then
	 	 AddNumText(sceneId,x808134_g_ScriptId,x808134_g_MissionName,4,-1);
	 	 -- thöa mãn nhi®m vø tiªp thu ði«u ki®n 
	 elseif  x808134_CheckAccept(sceneId,selfId)  >  0  then
	 	 if  GetName(sceneId,targetId)  ==  x808134_g_Name  then
	 	 	 AddNumText(sceneId,x808134_g_ScriptId,x808134_g_MissionName,3,-1);
	 	 end
	 end
	 
end

--**********************************
-- ki¬m tr¡c tiªp nh§n ði«u ki®n 
--**********************************
function  x808134_CheckAccept(  sceneId,  selfId  )
	 -- c¥n 30 c¤p m¾i có th¬ nh§n 
	 if  GetLevel(  sceneId,  selfId  )  >=  30  then
	 	 return  1
	 else
	 	 return  0
	 end
end


--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x808134_OnAccept(  sceneId,  selfId  )
	 -- gia nh§p nhi®m vø ðªn nhà ch½i li®t bi¬u 
	 local  bAdd  =  AddMission(  sceneId,selfId,  x808134_g_MissionId,  x808134_g_ScriptId,  1,  0,  1  )
	 	 	 	 if  bAdd  <  1  then
	 	 	 	 	 return
	 	 	 	 end
	 local  nSceneId=4
	 	 	 	 local  nPosX=157
	 	 	 	 local  nPosZ=188
	 	 	 	 local  strNpcName=" hÑa nguy®n cây "
	 	 	 	 local  nNpcId=13296
	 	 	 	 local  strNpcScene=4
	 	 	 	 SetMissionEvent(sceneId,  selfId,  x808134_g_MissionId,  4)
	                                                 x808134_NotifyFailTips(sceneId,  selfId,  "#Y tiªp nh§n nhi®m vø : tr÷ng hÕ tr× ma thÑ nh¤t hoàn kÏ höi ma tung . "  )
                                                                  TryRecieveItem(  sceneId,  selfId,  x808134_g_bgs,  1  )
	 	 	 	 CallScriptFunction(  SCENE_SCRIPT_ID,  "AskThePos",  sceneId,  selfId,  nSceneId,  nPosX,  nPosZ,  strNpcName)
                                                                --SetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME,td)

end

--**********************************
--  ch÷n trúng 
--**********************************

--**********************************
--  tiªp tøc 
--**********************************
function  x808134_OnContinue(  sceneId,  selfId,  targetId,  missionIndex  )
	 -- ð« giao nhi®m vø lúc ðích nói rõ tin tÑc 
	 BeginEvent(sceneId)
	 AddText(sceneId,x808134_g_MissionName)
	 AddText(sceneId,x808134_g_MissionComplete)
	 AddMoneyBonus(  sceneId,  x808134_g_MoneyBonus  )
	 for  i,  item  in  x808134_g_RadioItemBonus  do
	 	 AddRadioItemBonus(  sceneId,  item.id,  item.num  )
	 end
	 EndEvent(  )
	 DispatchMissionContinueInfo(sceneId,selfId,targetId,x808134_g_ScriptId,x808134_g_MissionId)

end

--**********************************
-- ki¬m tr¡c có ðßþc hay không ð« giao 
--**********************************
function  x808134_CheckSubmit(  sceneId,  selfId,  missionIndex  )
	 if  IsHaveMission(sceneId,selfId,x808134_g_MissionId)  >  0  then
	 	 local  misIndex  =  GetMissionIndexByID(sceneId,selfId,x808134_g_MissionId)
	 	 if  GetMissionParam(sceneId,  selfId,  misIndex,  0)  ==  1      then
	 	 	 return  1
	 	 end
	 else
	 	 return  0
	 end
	 
	 --if  x808134_g_MoZongFlag  ==  1  then
	 --	 return  1
	 --else
	 --	 return  0
	 --end
end

--**********************************
-- ð« giao 
--**********************************
function  x808134_OnSubmit(  sceneId,  selfId,  targetId,  selectRadioId  )
	 --****************************************
	 
	 --****************************************
	 
	 if  x808134_CheckSubmit(  sceneId,  selfId,  selectRadioId  )  ==  1  then
	 	 
	 	 
	 	 BeginAddItem(sceneId)
	 	 for  i,  item  in  x808134_g_RadioItemBonus  do
	 	 	 if  item.id  ==  selectRadioId  then
	 	 	 	 AddItem(  sceneId,item.id,  item.num  )
	 	 	 end
	 	 end
	 	 ret  =  EndAddItem(sceneId,selfId)
	 	 
	 	 if  ret  >  0  then
	 	 	 AddMoney(sceneId,selfId,x808134_g_MoneyBonus  );
	 	 	 local  playerLevel  =  GetLevel(sceneId,  selfId)
	 	 	 if  playerLevel>=20  and  playerLevel<30  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,10000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  10000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,10000  )          -- ngÕch ngoÕi kim ti«n tß·ng thß·ng 5 kim 
	 	 	 elseif
	 	 	 	 playerLevel>=30  and  playerLevel<40  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,20000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  20000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,20000  )
	 	 	 elseif
	 	 	 	 playerLevel>=30  and  playerLevel<40  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,30000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  30000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,30000  )
	 	 	 elseif
	 	 	 	 playerLevel>=40  and  playerLevel<50  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,40000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  40000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,40000  )
	 	 	 elseif
	 	 	 	 playerLevel>=50  and  playerLevel<60  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,50000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  50000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,50000  )
	 	 	 elseif
	 	 	 	 playerLevel>=60  and  playerLevel<70  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,60000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  60000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,50000  )
	 	 	 elseif
	 	 	 	 playerLevel>=70  and  playerLevel<80  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,70000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  70000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,50000  )
	 	 	 elseif
	 	 	 	 playerLevel>=80  and  playerLevel<90  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,80000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  80000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,50000  )
	 	 	 elseif
	 	 	 	 playerLevel>=90  and  playerLevel<100  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,90000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  90000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,60000  )
	 	 	 elseif
	 	 	 	 playerLevel>=100  and  playerLevel<120  then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,100000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  100000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,60000  )
	 	 	 elseif
	 	 	 	 playerLevel>=120    then
	 	 	 	 LuaFnAddExp(sceneId,  selfId,110000)  -- cån bän kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddExp(  sceneId,  selfId,  110000)        -- ngÕch ngoÕi kinh nghi®m tß·ng thß·ng 12 vÕn 
	 	 	 	 AddMoney(sceneId,selfId,70000  )
	 	 	 end
                        if  playerLevel  >=  30    and    playerLevel  <40    then
	 	 	       shijianId  =  	 808135
	 	 	 elseif    playerLevel  >=  40    and    playerLevel  <50    then
	 	 	       shijianId  =  	 808139
	 	 	 elseif    playerLevel  >=  50    and    playerLevel  <60    then
	 	 	       shijianId  =  	 808140
	 	 	 elseif    playerLevel  >=  60    and    playerLevel  <64    then
	 	 	       shijianId  =  	 808141
	 	 	 elseif    playerLevel  >=  64    and    playerLevel  <67    then
	 	 	       shijianId  =  	 808142
	 	 	 elseif    playerLevel  >=  67    and    playerLevel  <70    then
	 	 	       shijianId  =  	 808143
	 	 	 elseif    playerLevel  >=  70    and    playerLevel  <74    then
	 	 	       shijianId  =  	 808144
	 	 	 elseif    playerLevel  >=  74    and    playerLevel  <77    then
	 	 	       shijianId  =  	 808145
	 	 	 elseif    playerLevel  >=  77    and    playerLevel  <80    then
	 	 	       shijianId  =  	 808146
	 	 	 elseif    playerLevel  >=  80    and    playerLevel  <84    then
	 	 	       shijianId  =  	 808147
	 	 	 elseif    playerLevel  >=  84    and    playerLevel  <87    then
	 	 	       shijianId  =  	 808148
	 	 	 elseif    playerLevel  >=  87    and    playerLevel  <90    then
	 	 	       shijianId  =  	 808149
	 	 	 elseif    playerLevel  >=  90    and    playerLevel  <96    then
	 	 	       shijianId  =  	 808150
	 	 	 elseif    playerLevel  >=  96    then
	 	 	       shijianId  =  	 808151
	 	 	 end                      	 	 	 
	 	 	 ret  =  DelMission(  sceneId,  selfId,  x808134_g_MissionId  )
	 	 	 if  ret  >  0  then
	 	 	 	 --SetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME,td)
                                                                --SetMissionData(  sceneId,  selfId,  MD_ZHONGXIACHUMO_TIME,  DayTimes  )
                                                                  AddItem(  sceneId,x808134_g_rws,  1  )
                                                                  LuaFnDelAvailableItem(  sceneId,  selfId,  x808134_g_bgs,  1  )
                                                                  --  AddItem(  sceneId,40004628,  1  )
                                                                --AddItem(  sceneId,40004488,  1  )
                                                                --AddItem(sceneId,x808134_g_bgs,  1)
	 	 	 	 AddItemListToHuman(sceneId,selfId)
	 	 	 	 Msg2Player(    sceneId,  selfId,"#Y kÏ höi ma tung #G nhi®m vø hoàn thành . ",MSG2PLAYER_PARA  )
                                                                --SetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME,td)
                                                                --SetMissionData(  sceneId,  selfId,  MD_ZHONGXIACHUMO_TIME,  DayTimes  )
                                                                CallScriptFunction(  shijianId,  "OnDefaultEvent",sceneId,  selfId,  targetId)
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
-- buông tha cho 
--**********************************
function  x808134_OnAbandon(  sceneId,  selfId  )
	 -- thü tiêu nhà ch½i nhi®m vø li®t bi¬u trung ð¯i Ñng nhi®m vø 
	 --DelMission(  sceneId,  selfId,  x808134_g_MissionId  )
	 --CallScriptFunction(  SCENE_SCRIPT_ID,  "DelSignpost",  sceneId,  selfId,  sceneId,  x808134_g_SignPost.tip  )
	 -- thü tiêu nhà ch½i nhi®m vø li®t bi¬u trung ð¯i Ñng nhi®m vø 
	 local  misIndex  =  GetMissionIndexByID(sceneId,selfId,x808134_g_MissionId)
	 local  npcId  =  GetMissionParam(sceneId,  selfId,misIndex,  x808134_g_StrForePart+1)
	 local    _,  strNpcName,  strNpcScene,  x,  z,  desc,  scene  =  GetNpcInfoByNpcId(sceneId,npcId)
	 LuaFnDelAvailableItem(  sceneId,  selfId,  x808134_g_bgs,  1  )
	 DelMission(  sceneId,  selfId,  x808134_g_MissionId  )
	 CallScriptFunction(  SCENE_SCRIPT_ID,  "DelSignpost",  sceneId,  selfId,  scene,  strNpcName,  x808134_g_MissionId)
	 
	 local  iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
	 local  iTime  =  GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
	 local  iDayTime  =  floor(iTime/100)	 	 -- l¥n trß¾c buông tha cho nhi®m vø th¶i gian ( ngày ðªm )
	 local  iQuarterTime  =  mod(iTime,100)	 -- l¥n trß¾c buông tha cho nhi®m vø th¶i gian ( kh¡c )
	 local  iDayHuan  =  iDayCount  -- ngày ðó bên trong hoàn thành nhi®m vø s¯ l¥n 
	 local  CurTime  =  GetQuarterTime()	 	 -- trß¾c m£t th¶i gian 
	 local  CurDaytime  =  floor(CurTime/100)	 -- trß¾c m£t th¶i gian ( ngày )
	 
	 if  CurDaytime~=iDayTime  then  	 -- l¥n trß¾c hoàn thành nhi®m vø là cùng mµt ngày bên trong 
	 	 iDayHuan  =  0
	 end
	 
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x808134_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x808134_g_eventList  do
	 	 x808134_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end
end


--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x808134_OnDie(  sceneId,  selfId,  killerId  )
end


--**********************************
-- tiªn vào khu vñc sñ ki®n 
--**********************************
function  x808134_OnEnterZone(  sceneId,  selfId,  zoneId  )
end
-- phong töa NPC
function  x808134_OnLockedTarget(sceneId,  selfId,  targetId,  NpcId  )
	 --  phán ðoán có phäi hay không phong töa ðích Npc
	 if  IsHaveMission(sceneId,  selfId,  x808134_g_MissionId)  >  0  then
	 	 local  misIndex  =  GetMissionIndexByID(sceneId,selfId,x808134_g_MissionId)	 	 -- l¤y ðßþc nhi®m vø · 20 cá nhi®m vø trung ðích tñ li®t s¯ 
	 	 local  missionType  =  GetMissionParam(sceneId,  selfId,misIndex,  1)
	 	 
	 	 local  nNpcId  =  GetMissionParam(sceneId,  selfId,  misIndex,x808134_g_StrForePart+1)
	 	 local  _,  strNpcName,  strNpcScene,  PosX,  PosZ,  desc  =  GetNpcInfoByNpcId(sceneId,nNpcId)
	 	 local  strNpcName=" hÑa nguy®n cây "
	 	 local  szname=  GetName(sceneId,  targetId)
	 	 
	 	 if  szname  ==  strNpcName  then
                      x808134_g_MoZongFlag  =  1
	 	       AddItem(sceneId,  selfId,  x808134_g_bgs,  1)
	 	 BeginEvent(sceneId)
                                AddText(sceneId,"#Y chúc m×ng ngß½i hoàn thành kÏ höi ma tung nhi®m vø ! ")	 
	                   --TAddNumText(sceneId,x808134_g_ScriptId,x808134_g_MissionName,4,0,x808134_g_ScriptId);-- phán ðoán sau m¾i có th¬ ðóng nhi®m vø 
                                strtxt="        #G ðã hi¬u ðßþc thØ ma d¤u chân ðích tin tÑc . "
                                AddText(  sceneId,  strtxt)
                                AddText(  sceneId,  "        #cFF0000 mau tr· v« tìm lß½ng ðÕo sî trä lÕi nhi®m vø ði ! ")
	 	 EndEvent(  )  
                                local  nNumText  =  GetNumText()
      
if  nNumText==1    then
	 x808134_g_MoZongFlag  =  1
--local  BonusMoney  =  GetMissionCacheData(sceneId,  selfId,  0)
	 	               --  local  BonusExp  =  GetMissionCacheData(sceneId,  selfId,  1)
	 	                 --AddMoney(sceneId,selfId,BonusMoney  )  -- tß·ng thß·ng kim ti«n 
	 	                 --AddExp(sceneId,selfId,BonusExp  )          -- tß·ng thß·ng kinh nghi®m 

                end
    
                      --BeginEvent(sceneId)
	 	         
	 	 
	 	 SetMissionByIndex(sceneId,  selfId,misIndex,  0,  1)      
	 	       
                      --************************* cho tß·ng thß·ng 
	 	       --local  BonusMoney  =  GetMissionCacheData(sceneId,  selfId,  0)
	 	         --        local  BonusExp  =  GetMissionCacheData(sceneId,  selfId,  1)
	 	           --      AddMoney(sceneId,selfId,BonusMoney  )  -- tß·ng thß·ng kim ti«n 
	 	           --      AddExp(sceneId,selfId,BonusExp  )          -- tß·ng thß·ng kinh nghi®m 
	 	         
	 	 	 --DelMission(  sceneId,selfId,  x808134_g_MissionId  )  -- thü tiêu nhi®m vø 
	 	 	 
                        --DispatchEventList(  sceneId,  selfId,  targetId  )  -- thay ð±i ð« kÏ gi¾i m£t 
                      --DispatchMissionTips(sceneId,selfId)  -- ð°ng th¶i · trong trò ch½i khác ð« kÏ 	 
	 	 	 	     
	 	 end	 
	 	 	 	 	 
	 end  
	 
	 return  0
end
--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x808134_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end	 