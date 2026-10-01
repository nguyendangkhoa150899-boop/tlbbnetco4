-- phó bän nhi®m vø 
-- mµc nhân 

--************************************************************************
--MisDescBegin

-- chân v¯n s¯ 
x892009_g_ScriptId  =  892009

-- s¯ng lÕi s¯ l¥n 
x892009_g_ReLifeTimes  =  10
-- phó bän tên 
x892009_g_CopySceneName="Lôi Ðài Sinh TØ"

--MisDescEnd
--************************************************************************

-- vai trò Mission thay ð±i lßþng nói rõ 
x892009_g_Param_huan	 	 =0	 --0 s¯ : ðã hoàn thành hoàn ðªm , · tiªp thu nhi®m vø th¶i ði¬m phú tr¸ giá 
x892009_g_Param_ok	 	 	 =1	 --1 s¯ : nhi®m vø trß¾c m£t có hay không hoàn thành (0 không hoàn thành ;1 hoàn thành )
x892009_g_Param_sceneid	 	 =2	 --2 s¯ : trß¾c m£t phó bän nhi®m vø cänh tßþng s¯ 
x892009_g_Param_teamid	 	 =3	 --3 s¯ : nh§n phó bän nhi®m vø th¶i ði¬m ðích ðµi ngû s¯ 
x892009_g_Param_killcount	 =4	 --4 s¯ : giªt chªt nhi®m vø trách ðích s¯ lßþng 
x892009_g_Param_time	 	 =5	 --5 s¯ : hoàn thành phó bän sØ døng th¶i gian ( ð½n v¸ : giây )
--6 s¯ : không dùng 
--7 s¯ : không dùng 

x892009_g_CopySceneType=FUBEN_GODFIRE	 -- phó bän loÕi hình , ð¸nh nghîa · ScriptGlobal.lua bên trong 
x892009_g_LimitMembers=1	 	 	 -- có th¬ vào phó bän ðích nhö nh¤t ðµi ngû nhân s¯ 
x892009_g_TickTime=3	 	 	 	 -- tr· v« ði«u chân v¯n ðích lúc chuông / ð°ng h° th¶i gian ( ð½n v¸ : giây / l¥n )
x892009_g_LimitTotalHoldTime=360	 --360,1440 phó bän có th¬ s¯ng sót ðích th¶i gian ( ð½n v¸ : s¯ l¥n ), nªu nhß lúc này ðang lúc ðªn , là nhi®m vø s¨ th¤t bÕi 
x892009_g_LimitTimeSuccess=360	 	 --360,1440 phó bän th¶i gian hÕn chª ( ð½n v¸ : s¯ l¥n ) , nªu nhß lúc này ðang lúc ðªn , nhi®m vø hoàn thành 
x892009_g_CloseTick=6	 	 	 	 -- phó bän t¡t trß¾c cûng tính gi¶ ( ð½n v¸ : s¯ l¥n )
x892009_g_NoUserTime=5	 	 	 -- phó bän trung không có ai sau có th¬ tiªp tøc bäo t°n ðích th¶i gian ( ð½n v¸ : giây )
x892009_g_DeadTrans=0	 	 	 	 -- tØ vong d¶i ði mô thÑc , 0 : tØ vong sau còn có th¬ tiªp tøc · phó bän , 1 : tØ vong sau b¸ cßÞng chª d¶i ra phó bän 
x892009_g_Fuben_X=28	 	 	 	 -- tiªn vào phó bän ðích v¸ trí X
x892009_g_Fuben_Z=31	 	 	 	 -- tiªn vào phó bän ðích v¸ trí Z
x892009_g_Back_X=256	 	 	 	 -- nguyên cänh tßþng v¸ trí X
x892009_g_Back_Z=242	 	 	 	 -- nguyên cänh tßþng v¸ trí Z
x892009_g_TotalNeedKill=10	 	 	 -- c¥n giªt chªt quái v§t s¯ lßþng 
x892009_g_Param_sceneid=8	 	 	 -- thiªt trí cänh tßþng ID

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ 
--**********************************
function  x892009_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "    g¥n nh¤t không biªt t× n½i nào ðªn li­u mß¶i hai ác nhân , tñ xßng mß¶i hai sát tinh , · ta LÕc Dß½ng bên trong hoành hành vô kÜ , th¸t cá dân chúng , cái này mß¶i hai ngß¶i võ ngh® cao cß¶ng , hiêu trß½ng bÕt h² , ngày g¥n ðây càng là có không ít giang h° giang h° tiêu ti¬u chi loÕi ð¥u chÕy b÷n h÷ , khiªn cho thª lñc tång mÕnh , lão nÕp tuy nghe nói sau nhanh chóng chÕy t¾i , không biªt sao thª cô lñc ðan , cái này nhßng nhß thª nào cho phäi ?  "  )	 
	 	 AddText(  sceneId,  " #ef12345#Y Phø Bän TÕm Ðóng ð¬ fix l²i")
	 	 AddNumText(  sceneId,  x892009_g_ScriptId,  "Sát tinh ",  6,  10  )
		 AddNumText(  sceneId,  x892009_g_ScriptId,  " sát tinh gi¾i thi®u ",  0,  30  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x892009_OnEnumerate(  sceneId,  selfId,  targetId  )
	 
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x892009_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)
	 if  GetNumText()  ==  10  then

	 local  ret,  msg  =  x892009_CheckAccept(  sceneId,  selfId,  targetId  )
	 if  1  ~=  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,msg)
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  " b÷n h÷ ngß¶i ðông thª mÕnh , ngß½i t¯t nh¤t có th¬ tri®u t§p các ðÕi môn phái ngß¶i cùng nhau ði trß¾c m¾i phäi , nªu nhß ngß½i chu¦n b¸ xong , lão nÕp nhßng ðßa ngß½i ði trß¾c b÷n h÷ thiªt l§p ðích ch² lôi ðài . "  )
	 	 	 AddNumText(  sceneId,  x892009_g_scriptId,  "Tiªn vào Lôi Ðài Sinh tØ ",  6,  666)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )


	 elseif  GetNumText()  ==  30  then
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "    sát tinh phó bän t±ng cµng có BOSS  12  cá , ði¬m kích ð¯i thoÕi khuông sau có th¬ ðªm t× s¯ mµt khiêu chiªn , chiªn th¡ng BOSS sau có tÖ l® nh¤t ð¸nh bµ l¤y ðßþc tß½ng Ñng trân thú , cûng có th¬ tiªn hành biªn äo . "  )
	 	 AddText(  sceneId,  "    phó bän m²i ngày có th¬ ba l¥n tiªn vào , phó bän bÕo tÖ s¯ vì thuµc tính th¶i trang chª tÕo ð° , nguyên bäo phiªu , trân thú biªn äo ðan mänh vøn , thü công tài li®u , BOSS bäo bäo nhæng v§t này ph¦m . "  )	 
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )

	 elseif  GetNumText()  ==  666  then
	 	 local  nearmembercount	 =  GetNearTeamCount(  sceneId,  selfId  )
	 	 x892009_MakeCopyScene(  sceneId,  selfId,  nearmembercount  )
	 	 local	 nam	 =  LuaFnGetName(  sceneId,  selfId  )
	 	 BroadMsgByChatPipe(  sceneId,  selfId,  "#gff00f0 chúc m×ng nhà ch½i #gffff00"..nam.."#gff00f0 mang ðµi ngû thành công tiªn vào 12 sát tinh phó bän , phó bän ðem r½i xu¯ng ðÕi lßþng th¥n bí cao c¤p tß·ng thß·ng , biªn äo bäo bäo , m÷i ngß¶i cùng nhau mong ðþi h¡n có th¬ ðÕt ðßþc phong phú ph¥n thß·ng ði ! ",  4  )
	 end
end

--**********************************
-- ki¬m tr¡c tiªp nh§n ði«u ki®n 
--**********************************
function  x892009_CheckAccept(  sceneId,  selfId,  targetId  )

	 if  LuaFnHasTeam(sceneId,selfId)  ~=  1  then
	 	 return  0,  "12 sát tinh phó bän c¥n 3 ngß¶i tr· lên h÷p thành ðµi m¾i có th¬ tham gia , nªu nhß ngß½i chï là mu¯n bi¬u di­n ngß¶i ðích tài hoa , xin/m¶i ði tham gia Hoa S½n lu§n kiªm ði ! "
	 end

	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 return  0,  " ngß½i không phäi là ðµi trß·ng . "
	 end

	 -- nhân s¯ có hay không ðü ....
	 if  GetTeamSize(sceneId,selfId)  <  x892009_g_LimitMembers  then
	 	 return  0,  " mµt chi ðµi ngû chßa ðü 3 ngß¶i , coi nhß là tiªn vào sinh tØ lôi ðài cûng không có cái gì chiªn th¡ng ðích có th¬ a , còn chßa phäi mu¯n ði li­u . "
	 end

	 -- có hay không ð«u · ðây phø c§n ....
	 local  NearTeamSize  =  GetNearTeamCount(sceneId,selfId)
	 if  GetTeamSize(sceneId,selfId)  ~=  NearTeamSize  then
	 	 return  0,  " có ðµi hæu không có · phø c§n . "
	 end

	 local  Humanlist  =  {}
	 local  nHumanNum  =  0

	 -- có hay không có ngß¶i không ðü 90 c¤p ....
	 for  i=0,  NearTeamSize-1  do
	 	 local  PlayerId  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 if  GetLevel(  sceneId,  PlayerId  )  <  80  then
	 	 	 Humanlist[nHumanNum]  =  GetName(  sceneId,  PlayerId  )
	 	 	 nHumanNum  =  nHumanNum  +  1
	 	 end
	 end

	 if  nHumanNum  >  0  then

	 	 local  msg  =  "        ðµi ngû trong ðích "
	 	 for  i=0,  nHumanNum-2  do
	 	 	 msg  =  msg  ..  Humanlist[i]  ..  " , "
	 	 end
	 	 msg  =  msg  ..  Humanlist[nHumanNum-1]  ..  " ðích tu vi còn th¤p , chßa ðü 80 c¤p , còn chßa phäi mu¯n ði thì t¯t h½n . "
	 	 return  0,  msg

	 end

	 -- có hay không có ngß¶i hôm nay ðã làm 3 l¥n .... nha nha 3.6 sØa ð±i   phòng ng×a không có ði vào khi ðµi trß·ng không ki¬m tr¡c 
	 nHumanNum  =  0
	 local  CurDayTime  =  GetDayTime()
	 for  i=0,  NearTeamSize-1  do

	 	 local  PlayerId  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 local  lastTime  =  GetMissionData(  sceneId,  PlayerId,  MD_JOINMEIPAI_DAYTIME  )
	 	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 	 local  lastDayCount  =  mod(  lastTime,  100  )
	 
	 	 if  CurDayTime  >  lastDayTime  then
	 	 	 lastDayTime  =  CurDayTime
	 	 	 lastDayCount  =  0
	 	 end

	 	 if  lastDayCount  >=  3  then
	 	 	 Humanlist[nHumanNum]  =  GetName(  sceneId,  PlayerId  )
	 	 	 nHumanNum  =  nHumanNum  +  1
	 	 end

	 end

	 if  nHumanNum  >  0  then

	 	 local  msg  =  "        "
	 	 for  i=0,  nHumanNum-2  do
	 	 	 msg  =  msg  ..  Humanlist[i]  ..  " , "
	 	 end
	 	 msg  =  msg  ..  Humanlist[nHumanNum-1]  ..  " v¯n ngày ðã khiêu chiªn quá 3 l¥n sát tinh li­u . "
	 	 return  0,  msg

	 end

	 return	 1
end

--**********************************
-- tiªp nh§n 
--**********************************
function  x892009_OnAccept(  sceneId,  selfId,  targetId  )
	 
end

--**********************************
-- buông tha cho 
--**********************************
function  x892009_OnAbandon(  sceneId,  selfId  )
	 
end

--**********************************
-- khai sáng phó bän 
--**********************************
function  x892009_MakeCopyScene(  sceneId,  selfId,  nearmembercount  )

	 local  mylevel  =  120
	 local  iniLevel=120

	 leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	 LuaFnSetSceneLoad_Map(sceneId,  "shengsileitai.nav");  -- bän ð° là nh¤t ð¸nh phäi ch÷n l¤y , h½n næa nh¤t ð¸nh phäi · Config/SceneInfo.ini trong ph¯i trí häo 
	 LuaFnSetCopySceneData_TeamLeader(sceneId,  leaderguid);
	 LuaFnSetCopySceneData_NoUserCloseTime(sceneId,  x892009_g_NoUserTime*1000);
	 LuaFnSetCopySceneData_Timer(sceneId,  x892009_g_TickTime*1000);
	 LuaFnSetCopySceneData_Param(sceneId,  0,  x892009_g_CopySceneType);-- thiªt trí phó bän s¯ li®u , n½i này ðem 0 s¯ tác dçn ðích s¯ li®u thiªt trí vì 999 , dùng cho bày tö phó bän s¯ 999( con s¯ tñ ð¸nh nghîa )
	 LuaFnSetCopySceneData_Param(sceneId,  1,  x892009_g_ScriptId);-- ðem 1 s¯ s¯ li®u thiªt trí vì phó bän cänh tßþng sñ ki®n chân v¯n s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  2,  0);-- thiªt trí ð¸nh lúc khí ði«u døng s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  3,  -1);-- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ ,  m¾i b¡t ð¥u hóa 
	 LuaFnSetCopySceneData_Param(sceneId,  4,  0);-- thiªt trí phó bän t¡t d¤u hi®u ,  0 m· ra , 1 t¡t 
	 LuaFnSetCopySceneData_Param(sceneId,  5,  0);-- thiªt trí r¶i ði cûng tính gi¶ s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  6,  GetTeamId(sceneId,selfId));  -- bäo t°n ðµi ngû s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  7,  0)  ;-- giªt chªt Boss ðích s¯ lßþng 
	 LuaFnSetCopySceneData_Param(sceneId,  24,  0)  -- [NetCo4 01/10] o 24 = 1 khi luot nay da ghi tui boss Ngo Vinh (NetCo4/roimap.lua x950001_TB_SatTinhDuoc)
	 LuaFnSetCopySceneData_PvpRuler(  sceneId,  9  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )	 	 

	 LuaFnSetSceneLoad_Monster(  sceneId,  "shengsileitai_monster2.ini"  )
	 
        	 local  CopyScene_LevelGap  =  31
	 LuaFnSetCopySceneData_Param(sceneId,  CopyScene_LevelGap,  mylevel  -  iniLevel)  -- c¤p b§c kém , CopyScene_LevelGap  ·   scene.lua  trung phú tr¸ giá 

	 local  bRetSceneID  =  LuaFnCreateCopyScene(sceneId);  -- m¾i b¡t ð¥u hóa sau khi hoàn thành ði«u døng khai sáng phó bän hàm s¯ 
	 BeginEvent(sceneId)
	 	 if  bRetSceneID>0  then
	 	 	 AddText(sceneId," phó bän khai sáng thành công ! ");
	 	 else
	 	 	 AddText(sceneId," phó bän s¯ lßþng ðã ðÕt thßþng hÕn , xin h§u thØ lÕi ! ");
	 	 end
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,selfId)
end

--**********************************
-- tiªp tøc 
--**********************************
function  x892009_OnContinue(  sceneId,  selfId,  targetId  )
	 
end

--**********************************
-- ki¬m tr¡c có ðßþc hay không ð« giao 
--**********************************
function  x892009_CheckSubmit(  sceneId,  selfId  )
	 
end

--**********************************
-- ð« giao 
--**********************************
function  x892009_OnSubmit(  sceneId,  selfId,  targetId,  selectRadioId  )
	 
end
--**********************************
-- quái v§t tØ vong 
--**********************************
function  x892009_OnDie(sceneId,  objId,  killerId)
	-- [NetCo4 01/10] tui boss: KHONG goi TB_Ghi o day - 501000 OnDie ben duoi da goi (goi 2 cho = moi boss ghi 2 dong)
--CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  objId,  killerId,1  )
CallScriptFunction(  501000,  "OnDie",  sceneId,  objId,  killerId)
end
--**********************************
-- giªt chªt quái v§t ho£c nhà ch½i 
--**********************************
function  x892009_OnKillObject(  sceneId,  selfId,  objdataId  ,objId  )

end

--**********************************
-- tiªn vào khu vñc sñ ki®n 
--**********************************
function  x892009_OnEnterZone(  sceneId,  selfId,  zoneId  )
	 
end

--**********************************
-- ðÕo cø sØa ð±i 
--**********************************
function  x892009_OnItemChanged(  sceneId,  selfId,  itemdataId  )
end

--**********************************
-- phó bän sñ ki®n 
--**********************************
function  x892009_OnCopySceneReady(  sceneId,  destsceneId  )

	 LuaFnSetCopySceneData_Param(destsceneId,  3,  sceneId);-- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ 
	 leaderguid    =  LuaFnGetCopySceneData_TeamLeader(destsceneId)  ;
	 leaderObjId  =  LuaFnGuid2ObjId(sceneId,leaderguid);
	 NewWorld(  sceneId,leaderObjId,  destsceneId,  x892009_g_Fuben_X,  x892009_g_Fuben_Z)
	 local  nearmembercount	 =  GetNearTeamCount(  sceneId,  leaderObjId  )
	 local  member
	 local  misIndex
	 for	 i=0,  nearmembercount-1  do
	 	 member  =  GetNearTeamMember(  sceneId,  leaderObjId,  i  )
	 	 if  LuaFnIsCanDoScriptLogic(  sceneId,  member  )  ==  1  then
	 	 local  a1,a2  =  x892009_Checkself(  sceneId,  member)
	         if  a1  ~=  1  then
                x892009_NotifyFailTips(  sceneId,  member,  a2  )
	         return
	         end
	 	 NewWorld(  sceneId,  member,  destsceneId,  x892009_g_Fuben_X,  x892009_g_Fuben_Z  )
	 	 end
	 end
end


--**********************************
-- có nhà ch½i tiªn vào phó bän sñ ki®n 
--**********************************
function  x892009_OnPlayerEnter(  sceneId,  selfId  )

-- thiªt trí tØ vong sau s¯ng lÕi ði¬m v¸ trí 
	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%10",  -1,  "0",  sceneId,  x892009_g_Fuben_X,  x892009_g_Fuben_Z  );
	 --SetUnitCampID(sceneId,  selfId,  selfId,  109)

	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  MD_JOINMEIPAI_DAYTIME  )
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 local  CurDayTime  =  GetDayTime()

	 if  CurDayTime  >  lastDayTime  then
	 	 lastDayTime  =  CurDayTime
	 	 lastDayCount  =  0
	 end

	 lastDayCount  =  lastDayCount  +  1
	 lastTime  =  lastDayTime  *  100  +  lastDayCount
	 SetMissionData(  sceneId,  selfId,  MD_JOINMEIPAI_DAYTIME,  lastTime  )

end

--**********************************
-- có nhà ch½i · phó bän trung tØ vong sñ ki®n 
--**********************************
function  x892009_OnHumanDie(  sceneId,  selfId,  killerId  )
	 
end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n 
--**********************************
function  x892009_OnCopySceneTimer(  sceneId,  nowTime  )
	 -- phó bän lúc chuông / ð°ng h° h÷c l¤y cùng thiªt trí 
	 TickCount  =  LuaFnGetCopySceneData_Param(sceneId,  2)  ;-- l¤y ðßþc ðã thi hành ðích ð¸nh lúc s¯ l¥n 
	 TickCount  =  TickCount+1  ;
	 LuaFnSetCopySceneData_Param(sceneId,  2,  TickCount);-- thiªt trí m¾i ð¸nh lúc khí ði«u døng s¯ l¥n 

	 -- phó bän t¡t d¤u hi®u 
	 leaveFlag  =  LuaFnGetCopySceneData_Param(sceneId,  4)  ;

	 if  leaveFlag  ==  1  then  -- c¥n r¶i ði 

	 	 -- r¶i ði cûng tính gi¶ ðang lúc ðích h÷c l¤y cùng thiªt trí 
	 	 leaveTickCount  =  LuaFnGetCopySceneData_Param(sceneId,  5)  ;
	 	 leaveTickCount  =  leaveTickCount+1  ;
	 	 LuaFnSetCopySceneData_Param(sceneId,  5,  leaveTickCount)  ;

	 	 if  leaveTickCount  ==  x892009_g_CloseTick  then  -- cûng tính gi¶ ðang lúc ðªn , t¤t cä m÷i ngß¶i ði ra ngoài ði 

	 	 	 oldsceneId  =  LuaFnGetCopySceneData_Param(sceneId,  3)  ;-- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 

	 	 	 -- ðem trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i truy«n t¯ng tr· v« thì ra là tiªn vào th¶i ði¬m ðích cänh tßþng 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	 	 	 	 NewWorld(  sceneId,  mems[i],  oldsceneId,  x892009_g_Back_X,  x892009_g_Back_Z  )
	 	 	 end

	 	 elseif  leaveTickCount<x892009_g_CloseTick  then

	 	 	 oldsceneId  =  LuaFnGetCopySceneData_Param(sceneId,  3)  ;-- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 

	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , cänh tßþng t¡t cûng tính gi¶ ðang lúc 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	     	 	 	 BeginEvent(sceneId)
	     	 	 	 	 strText  =  format(" ngß½i ðem · %d giây sau r¶i ði cänh tßþng !",  (x892009_g_CloseTick-leaveTickCount)*x892009_g_TickTime  )
	     	 	 	 	 AddText(sceneId,strText);
	     	 	 	 EndEvent(sceneId)
	     	 	 	 DispatchMissionTips(sceneId,mems[i])
	 	 	 end
	 	 end
	 elseif  TickCount  ==  x892009_g_LimitTimeSuccess  then
	 	 -- n½i này thiªt trí có lúc ðang lúc hÕn chª nhi®m vø hoàn thành xØ lý 
	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 local  mems  =  {}
	 	 for	 i=0,membercount-1  do
	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)

    	 	 	 BeginEvent(sceneId)
    	 	 	 	 AddText(sceneId," nhi®m vø ðã ðªn gi¶ , hoàn thành !");
    	 	 	 EndEvent(sceneId)
    	 	 	 DispatchMissionTips(sceneId,mems[i])
	 	 	 misIndex  =  GetMissionIndexByID(sceneId,mems[i],x892009_g_MissionId)-- l¤y ðßþc nhi®m vø s¯ li®u tác dçn tr¸ giá 
	 	 	 -- ðem nhi®m vø thÑ 1 s¯ s¯ li®u thiªt trí vì 1, bày tö hoàn thành nhi®m vø 
	 	 	 SetMissionByIndex(sceneId,mems[i],misIndex,x892009_g_Param_ok,1)-- thiªt trí nhi®m vø s¯ li®u 
	 	 	 -- hoàn thành phó bän sØ døng th¶i gian 
	 	 	 SetMissionByIndex(sceneId,mems[i],misIndex,x892009_g_Param_time,TickCount*x892009_g_TickTime)-- thiªt trí nhi®m vø s¯ li®u 
	 	 end

	 	 -- thiªt trí phó bän t¡t d¤u hi®u 
	 	 LuaFnSetCopySceneData_Param(sceneId,  4,  1)  ;

	 elseif  TickCount  ==  x892009_g_LimitTotalHoldTime  then  -- phó bän t±ng th¶i gian hÕn chª ðªn 
	 	 -- n½i này thiªt trí phó bän nhi®m vø có lúc ðang lúc hÕn chª tình hu¯ng , lúc ¤y ðang lúc ðªn sau xØ lý ...
	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 local  mems  =  {}
	 	 for	 i=0,membercount-1  do
	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	 	 	 DelMission(  sceneId,  mems[i],  x892009_g_MissionId  );-- nhi®m vø th¤t bÕi , thü tiêu chi 

    	 	 	 BeginEvent(sceneId)
    	 	 	 	 AddText(sceneId," nhi®m vø th¤t bÕi , cñc kÏ lúc !");
    	 	 	 EndEvent(sceneId)
    	 	 	 DispatchMissionTips(sceneId,mems[i])
	 	 end

	 	 -- thiªt trí phó bän t¡t d¤u hi®u 
	 	 LuaFnSetCopySceneData_Param(sceneId,  4,  1)  ;

	 end
end
--**********************************
-- ðem mµt nhà ch½i truy«n t¯ng ra phó bän , tr· lÕi tiªn vào lúc ðích v¸ trí 
--**********************************
function  x892009_KickOut(  sceneId,  objId  )
        local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  3  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 
	 local  x  =  158  -- tiªn vào lúc ðích t÷a ðµ X
	 local  z  =  130  -- tiªn vào lúc ðích t÷a ðµ Z
	 
	 if  LuaFnIsObjValid(  sceneId,  objId  )  ==  1  then
	         NewWorld(  sceneId,  objId,  oldsceneId,  x,  z  )
	 end
	 
end
--**********************************
--  ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x892009_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x892009_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--**********************************
--  ki¬m tr¡c m· ra th¶i gian 
--**********************************
function  x892009_IsActivityOpen(sceneId)
	 local  nHour  =  GetHour();
	 local  nMinute  =  GetMinute();
	 local  nCurTempTime  =  nHour  *  60  +  nMinute;
	 if  nCurTempTime  >=  20  *  60  and  nCurTempTime  <  21  *  60  +  20  then
	 	 return  1;
	 end
	 return  0;
--	 return  1
end
--**********************************
--
--**********************************
function  x892009_Checkself(  sceneId,  selfId)



	 	 if  GetLevel(  sceneId,  selfId  )  <  80  then

	 	 msg  =    " tu vi cüa ngß½i còn th¤p , chßa ðü 80 c¤p , còn chßa phäi mu¯n ði thì t¯t h½n . "
	 	 return  0,  msg

	 end

	 local  CurDayTime  =  GetDayTime()

	 	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  MD_JOINMEIPAI_DAYTIME  )
	 	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 	 local  lastDayCount  =  mod(  lastTime,  100  )
	 
	 	 if  CurDayTime  >  lastDayTime  then
	 	 	 lastDayTime  =  CurDayTime
	 	 	 lastDayCount  =  0
	 	 end

	 	 if  lastDayCount  >=  3  then

	 	 msg  =    " ngß½i v¯n ngày ðã khiêu chiªn quá 3 l¥n . "
	 	 return  0,  msg

	 end

	 return	 1
end

--**********************************
--  ki¬m tr¡c m· ra th¶i gian 2
--**********************************
function  x892009_IsActivityOpen2(sceneId)
	 local  nHour  =  GetHour();
	 local  nMinute  =  GetMinute();
	 local  nCurTempTime  =  nHour  *  60  +  nMinute;
	 if  nCurTempTime  >=  21  *  60  +  20  and  nCurTempTime  <  21  *  50  then
	 	 return  1;
	 end
	 return  0;
--	 return  1
end
--**********************************
--  phú tr¸ giá 
--**********************************
function  x892009_ToMax(  sceneId,  selfId,  killerId  ,guildName,maxCount  )
	 PK_MAXCOUNTGUILD=guildName
	 PK_MAXCOUNT=maxCount
end
--**********************************
--  toàn c¥u thông báo 
--**********************************
function  x892009_GlobalCountNews(  sceneId,  selfId,  targetId,str  )
	 BeginEvent(  sceneId  )
                	 AddGlobalCountNews(  sceneId,  str  )
                EndEvent(  sceneId  )
                DispatchEventList(  sceneId,  selfId,  targetId  )
end