-- phó bän nhi®m vø 
-- mµc nhân 

--************************************************************************
--MisDescBegin

-- chân v¯n s¯ 
x890057_g_ScriptId  =  890057

-- s¯ng lÕi s¯ l¥n 
x890057_g_ReLifeTimes  =  10
-- phó bän tên 
x890057_g_CopySceneName=" hß không äo cänh "
x890057_g_BossName  =  {" hµ ðäo th¥n thú # huy­n "," bång yêu # huy­n "," lçn vào giang long # huy­n "," vi­n c± kÏ h°n # huy­n "," tÑc gi§n cát vinh # huy­n "," t¥n hoàng chi phách # huy­n "," ðª sau # huy­n "," mang s½n ðÕo ngß¶i # huy­n "," kính nß¾c h° phï ð¥u lînh # huy­n "," ng÷n lØa yêu ma # huy­n "," chín lê ð¥u lînh # huy­n "," ð©p trai ( t¯ng )# huy­n "," ðem ( liêu )# huy­n "," chín lê tµc trß·ng # huy­n "," thü lång giam # huy­n "," tiêu d§t phong # huy­n "," tiêu nhß quân # huy­n "," tiêu nhß úy # huy­n "," cûng lu§t di­m # huy­n "," cûng lu§t liên thành # huy­n "," già Di®p tôn giä # huy­n "," ch£c kia La vß½ng # huy­n "," già lâu La vß½ng # huy­n "," A Tu La vß½ng # huy­n "," ðª thích ngày # huy­n "}
x890057_g_BossID  =  {}
x890057_g_BossID[70]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[80]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[90]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[100]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[110]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[120]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_MissBoss  =  {8,9,10,11,12}
--MisDescEnd
--************************************************************************

-- vai trò Mission thay ð±i lßþng nói rõ 
x890057_g_Param_huan	 	 =0	 --0 s¯ : ðã hoàn thành hoàn ðªm , · tiªp thu nhi®m vø th¶i ði¬m phú tr¸ giá 
x890057_g_Param_ok	 	 	 =1	 --1 s¯ : nhi®m vø trß¾c m£t có hay không hoàn thành (0 không hoàn thành #1 hoàn thành )
x890057_g_Param_sceneid	 	 =2	 --2 s¯ : trß¾c m£t phó bän nhi®m vø cänh tßþng s¯ 
x890057_g_Param_teamid	 	 =3	 --3 s¯ : nh§n phó bän nhi®m vø th¶i ði¬m ðích ðµi ngû s¯ 
x890057_g_Param_killcount	 =4	 --4 s¯ : giªt chªt nhi®m vø trách ðích s¯ lßþng 
x890057_g_Param_time	 	 =5	 --5 s¯ : hoàn thành phó bän sØ døng th¶i gian ( ð½n v¸ : giây )
--6 s¯ : không dùng 
--7 s¯ : không dùng 

x890057_g_CopySceneType=FUBEN_ZHOUTIAN	 -- phó bän loÕi hình , ð¸nh nghîa · ScriptGlobal.lua bên trong 
x890057_g_LimitMembers=3	 	 	 -- có th¬ vào phó bän ðích nhö nh¤t ðµi ngû nhân s¯ 
x890057_g_TickTime=5	 	 	 	 -- tr· v« ði«u chân v¯n ðích lúc chuông / ð°ng h° th¶i gian # ð½n v¸ : giây / l¥n #
x890057_g_LimitTotalHoldTime=300	 --360,1440 phó bän có th¬ s¯ng sót ðích th¶i gian # ð½n v¸ : s¯ l¥n #, nªu nhß lúc này ðang lúc ðªn , là nhi®m vø s¨ th¤t bÕi 
x890057_g_LimitTimeSuccess=-1	 	 --360,1440 phó bän th¶i gian hÕn chª # ð½n v¸ : s¯ l¥n # , nªu nhß lúc này ðang lúc ðªn , nhi®m vø hoàn thành  -- [NetCo4 02/10] truoc = 300 = LimitTotalHoldTime -> het gio lai bao hoan thanh; -1 = khong bao gio, het gio di nhanh that bai (dong LimitTotalHoldTime)
x890057_g_CloseTick=6	 	 	 	 -- phó bän t¡t trß¾c cûng tính gi¶ # ð½n v¸ : s¯ l¥n #
x890057_g_NoUserTime=5	 	 	 -- phó bän trung không có ai sau có th¬ tiªp tøc bäo t°n ðích th¶i gian # ð½n v¸ : giây #
x890057_g_DeadTrans=0	 	 	 	 -- tØ vong d¶i ði mô thÑc , 0 : tØ vong sau còn có th¬ tiªp tøc · phó bän , 1 : tØ vong sau b¸ cßÞng chª d¶i ra phó bän 
x890057_g_Fuben_X=22	 	 	 	 -- tiªn vào phó bän ðích v¸ trí X
x890057_g_Fuben_Z=55	 	 	 	 -- tiªn vào phó bän ðích v¸ trí Z
-- còn không có ð¸nh nghîa 
x890057_g_TotalNeedKill=5	 	 	 -- c¥n giªt chªt quái v§t s¯ lßþng 



--**********************************
-- tiªp nh§n 
--**********************************
function  x890057_OnAccept(  sceneId,  selfId,  targetId  )
	 
end

--**********************************
-- buông tha cho 
--**********************************
function  x890057_OnAbandon(  sceneId,  selfId  )
	 
end

--**********************************
-- khai sáng phó bän 
--**********************************
function  x890057_MakeCopyScene(  sceneId,  selfId,  nearmembercount,TeamLeader,Useitemnum,tagetid1,tagetid2,tagetid3,tagetid4,tagetid5)
        local  teamemissdata  =  {tagetid1,tagetid2,tagetid3,tagetid4,tagetid5}
	 local  mylevel  =  floor(GetLevel(  sceneId,  selfId)/10)
	 if  mylevel  <  7  then
	 mylevel  =  7
	 elseif  mylevel  >  12  then
	 mylevel  =  12
	 else
	 mylevel  =  mylevel
	 end

	 leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	 LuaFnSetSceneLoad_Map(sceneId,  "zhoutian.nav");  -- bän ð° là nh¤t ð¸nh phäi ch÷n l¤y , h½n næa nh¤t ð¸nh phäi · Config/SceneInfo.ini trong ph¯i trí häo 
	 LuaFnSetCopySceneData_TeamLeader(sceneId,  leaderguid);
	 LuaFnSetCopySceneData_NoUserCloseTime(sceneId,  x890057_g_NoUserTime*1000);
	 LuaFnSetCopySceneData_Timer(sceneId,  x890057_g_TickTime*1000);
	 LuaFnSetCopySceneData_Param(sceneId,  0,  x890057_g_CopySceneType);-- thiªt trí phó bän s¯ li®u , n½i này ðem 0 s¯ tác dçn ðích s¯ li®u thiªt trí vì 999 , dùng cho bày tö phó bän s¯ 999( con s¯ tñ ð¸nh nghîa )
	 LuaFnSetCopySceneData_Param(sceneId,  1,  x890057_g_ScriptId);-- ðem 1 s¯ s¯ li®u thiªt trí vì phó bän cänh tßþng sñ ki®n chân v¯n s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  2,  0);-- thiªt trí ð¸nh lúc khí ði«u døng s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  3,  -1);-- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ ,  m¾i b¡t ð¥u hóa 
	 LuaFnSetCopySceneData_Param(sceneId,  4,  0);-- thiªt trí phó bän t¡t d¤u hi®u ,  0 m· ra , 1 t¡t 
	 LuaFnSetCopySceneData_Param(sceneId,  5,  0);-- thiªt trí r¶i ði cûng tính gi¶ s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  6,  GetTeamId(sceneId,selfId));  -- bäo t°n ðµi ngû s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  7,  0)  ;-- giªt chªt Boss ðích s¯ lßþng 
	 LuaFnSetCopySceneData_PvpRuler(  sceneId,  9  )
	 for  i  =  8,12  do
	 if  teamemissdata[i-7]  ~=  nil  then
	 LuaFnSetCopySceneData_Param(  sceneId,  i,teamemissdata[i-7]  )
	 else
	 LuaFnSetCopySceneData_Param(  sceneId,  i,0  )
	 end
	 end
	 for  i  =  13,17  do  -- [NetCo4 02/10] o 13 dem boss, 14-17 hen gio ra boss (truoc la bien toan cuc killmosternum / TBtiemer / FubenTimer / TBsytiemer / TBsytiemer1, luot bo do lam hong luot sau)
	 LuaFnSetCopySceneData_Param(  sceneId,  i,  0  )
	 end
        LuaFnSetCopySceneData_Param(sceneId,  30,  Useitemnum)
	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )	 	 
	   LuaFnSetSceneLoad_Monster(  sceneId,  "zhoutian_monster.ini"  )
	 
        	   local  CopyScene_LevelGap  =  31
	   LuaFnSetCopySceneData_Param(sceneId,  CopyScene_LevelGap,  mylevel*10)  -- c¤p b§c kém , CopyScene_LevelGap  ·   scene.lua  trung phú tr¸ giá 

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
function  x890057_OnContinue(  sceneId,  selfId,  targetId  )
	 
end

--**********************************
-- ki¬m tr¡c có ðßþc hay không ð« giao 
--**********************************
function  x890057_CheckSubmit(  sceneId,  selfId  )
	 
end

--**********************************
-- ð« giao 
--**********************************
function  x890057_OnSubmit(  sceneId,  selfId,  targetId,  selectRadioId  )
	 
end
--**********************************
-- quái v§t tØ vong 
--**********************************
function  x890057_OnDie(sceneId,  objId,  killerId)



end
--**********************************
-- giªt chªt quái v§t ho£c nhà ch½i 
--**********************************
function  x890057_OnKillObject(  sceneId,  selfId,  objdataId  ,objId  )


end

--**********************************
-- tiªn vào khu vñc sñ ki®n 
--**********************************
function  x890057_OnEnterZone(  sceneId,  selfId,  zoneId  )
	 
end

--**********************************
-- ðÕo cø sØa ð±i 
--**********************************
function  x890057_OnItemChanged(  sceneId,  selfId,  itemdataId  )
end

--**********************************
-- phó bän sñ ki®n 
--**********************************
function  x890057_OnCopySceneReady(  sceneId,  destsceneId  )

	 LuaFnSetCopySceneData_Param(destsceneId,  3,  sceneId);-- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ 
	 leaderguid    =  LuaFnGetCopySceneData_TeamLeader(destsceneId)  ;
	 leaderObjId  =  LuaFnGuid2ObjId(sceneId,leaderguid);
	 NewWorld(  sceneId,leaderObjId,  destsceneId,  x890057_g_Fuben_X,  x890057_g_Fuben_Z)
	 local  nearmembercount	 =  GetNearTeamCount(  sceneId,  leaderObjId  )
	 local  member
	 for	 i=0,  nearmembercount-1  do
	 	 member  =  GetNearTeamMember(  sceneId,  leaderObjId,  i  )
	 	 if  LuaFnIsCanDoScriptLogic(  sceneId,  member  )  ==  1  then
	 	 NewWorld(  sceneId,  member,  destsceneId,  x890057_g_Fuben_X,  x890057_g_Fuben_Z  )
	 	 end
	 end
end

--**********************************
-- có nhà ch½i tiªn vào phó bän sñ ki®n 
--**********************************
function  x890057_OnPlayerEnter(  sceneId,  selfId  )

-- thiªt trí tØ vong sau s¯ng lÕi ði¬m v¸ trí 
	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%50",  "%50",  "%50",  sceneId,  x890057_g_Fuben_X,  x890057_g_Fuben_Z  );
	 --SetUnitCampID(sceneId,  selfId,  selfId,  109)
                local  itemnum  =  LuaFnGetCopySceneData_Param(sceneId,  30)
                local  yunyuoitemnum  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANITEM)
	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  WJMISS  )
	 
	 
	 -- [NetCo4 02/10] bo dong debug hien so WJMISS (lastTime) len man hinh khi vao pho ban
	 	 	 	 
	 	 	 	 
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 local  CurDayTime  =  GetDayTime()

	 if  CurDayTime  >  lastDayTime  then
	 	 lastDayTime  =  CurDayTime
	 	 lastDayCount  =  0
	 	 yunyuoitemnum  =  0
	 end
                
	 lastDayCount  =  lastDayCount  +  1
	 yunyuoitemnum  =  yunyuoitemnum  +  itemnum  +  CurDayTime*1000
	 lastTime  =  lastDayTime  *  100  +  lastDayCount
	 SetMissionData(  sceneId,  selfId,  WJMISS,  lastTime  )
	 SetMissionData(  sceneId,  selfId,  ZHOUTIANITEM,  yunyuoitemnum  )
end

--**********************************
-- có nhà ch½i · phó bän trung tØ vong sñ ki®n 
--**********************************
function  x890057_OnHumanDie(  sceneId,  selfId,  killerId  )
	 
end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n 
--**********************************
function  x890057_OnCopySceneTimer(  sceneId,  nowTime  )
	 -- phó bän lúc chuông / ð°ng h° h÷c l¤y cùng thiªt trí 
	 TickCount  =  LuaFnGetCopySceneData_Param(sceneId,  2)  ;-- l¤y ðßþc ðã thi hành ðích ð¸nh lúc s¯ l¥n 
	 TickCount  =  TickCount+1  ;
	 LuaFnSetCopySceneData_Param(sceneId,  2,  TickCount);-- thiªt trí m¾i ð¸nh lúc khí ði«u døng s¯ l¥n 
        	   local  CopyScene_LevelGap  =  31
	 local  mylevel  =  LuaFnGetCopySceneData_Param(sceneId,  CopyScene_LevelGap)  -- c¤p b§c kém , CopyScene_LevelGap  ·   scene.lua  trung phú tr¸ giá 

	 -- phó bän t¡t d¤u hi®u 
	 leaveFlag  =  LuaFnGetCopySceneData_Param(sceneId,  4)  ;

	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , chu¦n b¸ ra trách 	       	 	 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
                                        if  (GetTeamLeader(sceneId,mems[i])  ~=  mems[i]  or  GetTeamSize(sceneId,mems[i])  ~=  1)  and  (LuaFnIsObjValid(sceneId,  mems[i])  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  mems[i])  ==  1  and  LuaFnIsCharacterLiving(sceneId,  mems[i])  ==  1)      then
                                        	     	 	 	 BeginEvent(sceneId)
	     	 	 	 	 strText  =  format(" ngß½i phäi là ðµi trß·ng , thä là mµt ngß¶i ðích ðµi ngû "  )
	     	 	 	 	 AddText(sceneId,strText);
	     	 	 	 EndEvent(sceneId)
	     	 	 	 DispatchMissionTips(sceneId,mems[i])
                                        x890057_KickOut(  sceneId,  mems[i]  )                                        
                                        return
                                        end	 
                                        end	 
                    	 	 
	 	 	 	 	 
	     if  TickCount  ==  1  then
	 
	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , chu¦n b¸ ra trách 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	     	 	 	 BeginEvent(sceneId)
	     	 	 	 	 strText  =  format(" ðem · %d giây sau b¡t ð¥u ra trách !",  10  )
	     	 	 	 	 AddText(sceneId,strText);
	     	 	 	 EndEvent(sceneId)
	     	 	 	 DispatchMissionTips(sceneId,mems[i])
	 	 	 end
	 	 end
	 	 
                
                local  TBsytiemer  =  LuaFnGetCopySceneData_Param(sceneId,  16)  -- [NetCo4 02/10] hen ra boss luu o pho ban (truoc la bien toan cuc); 0 = chua hen
                local  TBsytiemer1  =  LuaFnGetCopySceneData_Param(sceneId,  17)
                if  TBsytiemer  ~=  0  and    TickCount  ==  TBsytiemer  then
	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , chu¦n b¸ ra trách 	       	 	 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	 	 	     if  TBsytiemer1  <  6  then	 
	 	 	     miss  =  LuaFnGetCopySceneData_Param(sceneId,x890057_g_MissBoss[TBsytiemer1])
	 	 	     delmiss  =  LuaFnGetCopySceneData_Param(sceneId,  x890057_g_MissBoss[TBsytiemer1-1])
	 	 	     senzhen  =  LuaFnGetCopySceneData_Param(sceneId,  x890057_g_MissBoss[TBsytiemer1-1])	 
	 	 MstId1  =  LuaFnCreateMonster(sceneId,  x890057_g_BossID[mylevel][miss],  29,  40,  19,  0,  890058)
	 -- l¥n l¸ch cänh tßþng trung t¤t cä trách .... ð±i m¾i BOSS xây dñng lÕi trÕng thái ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  k=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,k)
	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 if  MosDataID  ==  x890057_g_BossID[mylevel][delmiss]  then
	 	 LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 ------SetCharacterDieTime(sceneId,  MonsterId,  1)
	 	 end
	 	 end
	 	 
	 	 MstId2  =  LuaFnCreateMonster(sceneId,  x890057_g_BossID[mylevel][senzhen],  48,  48,  19,  0,  890058)
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  MstId2,  MstId2,  MstId2,  152,  0)
                                SetCharacterName(  sceneId,  MstId1,  x890057_g_BossName[miss]  )
                                SetCharacterName(  sceneId,  MstId2,  x890057_g_BossName[senzhen]  )
                                SetUnitReputationID(sceneId,  MstId1,  MstId1,  8)
                                SetUnitReputationID(sceneId,  MstId2,  MstId2,  8)
                                else
	                 delmiss  =  LuaFnGetCopySceneData_Param(sceneId,x890057_g_MissBoss[5])
	                 senzhen  =  LuaFnGetCopySceneData_Param(sceneId,x890057_g_MissBoss[5])
	 -- l¥n l¸ch cänh tßþng trung t¤t cä trách .... ð±i m¾i BOSS xây dñng lÕi trÕng thái ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  k=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,k)
	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 if  MosDataID  ==  x890057_g_BossID[mylevel][delmiss]  then
	 	 LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 ------SetCharacterDieTime(sceneId,  MonsterId,  1)
	 	 end
	 	 end
                                MstId1  =  LuaFnCreateMonster(sceneId,  x890057_g_BossID[mylevel][senzhen],  48,  48,  19,  0,  890058)
                                LuaFnSendSpecificImpactToUnit(sceneId,  MstId1,  MstId1,  MstId1,  152,  0)
                                SetCharacterName(  sceneId,  MstId1,  x890057_g_BossName[senzhen]  )
                                SetUnitReputationID(sceneId,  MstId1,  MstId1,  8)
                                end
	 BeginEvent(sceneId)
	 strText  =  format(" có th¬ khiêu chiªn %s li­u !",  x890057_g_BossName[senzhen])
	 AddText(sceneId,strText);
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,mems[i])                                
                                end
	 	 	 	 
                LuaFnSetCopySceneData_Param(sceneId,  16,  0)  -- [NetCo4 02/10] da ra boss theo hen -> xoa hen
                LuaFnSetCopySceneData_Param(sceneId,  17,  0)
                end
                
                local  a,b  =  x890057_SetFubenTimer(  sceneId,  0,2  )
                if  a  ~=  0  and  b	 ~=  0  then
                LuaFnSetCopySceneData_Param(sceneId,  16,  a)  -- [NetCo4 02/10] luu hen vao o pho ban
                LuaFnSetCopySceneData_Param(sceneId,  17,  b)
                
	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , chu¦n b¸ ra trách 
	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 local  mems  =  {}
	 for	 i=0,membercount-1  do
	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	 BeginEvent(sceneId)
	 if  b  ==  6  then
	 strText  =  format(" ðem · %d giây sau có th¬ khiêu chiªn cu¯i cùng chï BOSS!",  (a-TickCount)*5,b,b-1  )
	 else
	 strText  =  format(" ðem · %d giây sau ra thÑ %d chï BOSS, có th¬ khiêu chiªn thÑ %d chï BOSS!",  (a-TickCount)*5,b,b-1  )
	 end
	 AddText(sceneId,strText);
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,mems[i])
	 end
                
                end
	 	 	 	 	 	 
                if  TickCount  ==  2  then
	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , chu¦n b¸ ra trách 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	             local  miss  =  {}	 	 	 
                            miss[1]  =  LuaFnGetCopySceneData_Param(sceneId,  x890057_g_MissBoss[1])
                            miss[2]  =  LuaFnGetCopySceneData_Param(sceneId,  x890057_g_MissBoss[2])
                            local  MstId  =  {}
                            for  j  =  1,2  do
                            if  j  ==  1  then
                            x  =  48
                            y  =  48
	             MstId[j]  =  LuaFnCreateMonster(sceneId,  x890057_g_BossID[mylevel][miss[j]],  x,  y,  19,  0,  890058)
                            end
                            if  j  ==  2  then
                            x  =  29
                            y  =  40
	             MstId[j]  =  LuaFnCreateMonster(sceneId,  x890057_g_BossID[mylevel][miss[j]],  x,  y,  19,  0,  890058)
                            end
                            
	                             
                SetCharacterName(  sceneId,  MstId[j],  x890057_g_BossName[miss[j]]  )	 
                SetUnitReputationID(sceneId,  MstId[j],  MstId[j],  8)
	 end
	 BeginEvent(sceneId)
	 strText  =  format(" có th¬ khiêu chiªn %s li­u !",  x890057_g_BossName[miss[1]])
	 AddText(sceneId,strText);
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,mems[i])                                
                end
                end
	 if  leaveFlag  ==  1  then  -- c¥n r¶i ði 

	 	 -- r¶i ði cûng tính gi¶ ðang lúc ðích h÷c l¤y cùng thiªt trí 
	 	 leaveTickCount  =  LuaFnGetCopySceneData_Param(sceneId,  5)  ;
	 	 leaveTickCount  =  leaveTickCount+1  ;
	 	 LuaFnSetCopySceneData_Param(sceneId,  5,  leaveTickCount)  ;

	 	 if  leaveTickCount  ==  x890057_g_CloseTick  then  -- cûng tính gi¶ ðang lúc ðªn , t¤t cä m÷i ngß¶i ði ra ngoài ði 

	 	 	 oldsceneId  =  LuaFnGetCopySceneData_Param(sceneId,  3)  ;-- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 

	 	 	 -- ðem trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i truy«n t¯ng tr· v« thì ra là tiªn vào th¶i ði¬m ðích cänh tßþng 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	 	 	 	 x890057_KickOut(  sceneId,  mems[i]  )
	 	 	 	 ---- ði«u døng cùng cá hàm s¯ NewWorld(  sceneId,  mems[i],  oldsceneId,  x890057_g_Back_X,  x890057_g_Back_Z  )
	 	 	 end

	 	 elseif  leaveTickCount<x890057_g_CloseTick  then

	 	 	 oldsceneId  =  LuaFnGetCopySceneData_Param(sceneId,  3)  ;-- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 

	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , cänh tßþng t¡t cûng tính gi¶ ðang lúc 
	 	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,membercount-1  do
	 	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)
	     	 	 	 BeginEvent(sceneId)
	     	 	 	 	 strText  =  format(" ngß½i ðem · %d giây sau r¶i ði cänh tßþng !",  (x890057_g_CloseTick-leaveTickCount)*x890057_g_TickTime  )
	     	 	 	 	 AddText(sceneId,strText);
	     	 	 	 EndEvent(sceneId)
	     	 	 	 DispatchMissionTips(sceneId,mems[i])
	 	 	 end
	 	 end
	 elseif  TickCount  ==  x890057_g_LimitTimeSuccess  then
	 	 -- n½i này thiªt trí có lúc ðang lúc hÕn chª nhi®m vø hoàn thành xØ lý 
	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 local  mems  =  {}
	 	 for	 i=0,membercount-1  do
	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)

    	 	 	 BeginEvent(sceneId)
    	 	 	 	 AddText(sceneId," nhi®m vø ðã ðªn gi¶ , hoàn thành !");
    	 	 	 EndEvent(sceneId)
    	 	 	 DispatchMissionTips(sceneId,mems[i])
    	 	 	 
    	 	 	 
    	 	 	 
	 	 end

	 	 -- thiªt trí phó bän t¡t d¤u hi®u 
	 	 LuaFnSetCopySceneData_Param(sceneId,  4,  1)  ;

	 elseif  TickCount  ==  x890057_g_LimitTotalHoldTime  then  -- phó bän t±ng th¶i gian hÕn chª ðªn 
	 	 -- n½i này thiªt trí phó bän nhi®m vø có lúc ðang lúc hÕn chª tình hu¯ng , lúc ¤y ðang lúc ðªn sau xØ lý ...
	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 local  mems  =  {}
	 	 for	 i=0,membercount-1  do
	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(sceneId,i)

    	 	 	 BeginEvent(sceneId)
    	 	 	 	 AddText(sceneId,"H\170t th\182i gian, khi\234u chi\170n th\164t b\213i!");  -- [NetCo4 02/10] het gio = that bai (truoc chu dich may kho hieu)
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
function  x890057_KickOut(  sceneId,  objId  )
if    LuaFnIsCharacterLiving(sceneId,  objId)  ~=  1  or  LuaFnIsObjValid(  sceneId,  objId  )  ~=  1  or  LuaFnIsCanDoScriptLogic(  sceneId,  objId  )  ~=  1  then
        
        return
        end
        
        local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  3  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 
	 local  x  =  252  -- tiªn vào lúc ðích t÷a ðµ X
	 local  z  =  259  -- tiªn vào lúc ðích t÷a ðµ Z
	 if  oldsceneId  ==  0  then
	   x  =  217  -- tiªn vào lúc ðích t÷a ðµ X
	   z  =  242  -- tiªn vào lúc ðích t÷a ðµ Z
	 elseif    oldsceneId  ==  1  then
	   x  =  200  -- tiªn vào lúc ðích t÷a ðµ X
	   z  =  334  -- tiªn vào lúc ðích t÷a ðµ Z
	 elseif    oldsceneId  ==  2  then
	   x  =  240  -- tiªn vào lúc ðích t÷a ðµ X
	   z  =  57  -- tiªn vào lúc ðích t÷a ðµ Z
	 end
	 if  LuaFnIsObjValid(  sceneId,  objId  )  ==  1  then
	         NewWorld(  sceneId,  objId,  oldsceneId,  x,  z  )
	 end
	 
end
--**********************************
--  ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x890057_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x890057_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--**********************************
--  ki¬m tr¡c m· ra th¶i gian 
--**********************************
function  x890057_IsActivityOpen(sceneId)
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
--  ki¬m tr¡c m· ra th¶i gian 2
--**********************************
function  x890057_IsActivityOpen2(sceneId)
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
function  x890057_ToMax(  sceneId,  selfId,  killerId  ,guildName,maxCount  )
	 PK_MAXCOUNTGUILD=guildName
	 PK_MAXCOUNT=maxCount
end
--**********************************
--  toàn c¥u thông báo 
--**********************************
function  x890057_GlobalCountNews(  sceneId,  selfId,  targetId,str  )
	 BeginEvent(  sceneId  )
                	 AddGlobalCountNews(  sceneId,  str  )
                EndEvent(  sceneId  )
                DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n 
--**********************************
function  x890057_SetFubenTimer(  sceneId,  nowTime,tabey  )
                if  tabey  ==  1  then
	 local  Timer  =  LuaFnGetCopySceneData_Param(sceneId,  2)  ;-- l¤y ðßþc ðã thi hành ðích ð¸nh lúc s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  15,  Timer+5)  -- [NetCo4 02/10] FubenTimer -> o 15 (truoc la bien toan cuc)
	 LuaFnSetCopySceneData_Param(sceneId,  14,  nowTime)  -- [NetCo4 02/10] TBtiemer -> o 14
	 return
	 end
	 if  tabey  ==  2  then
	 
	 local  TBtiemer  =  LuaFnGetCopySceneData_Param(sceneId,  14)  -- [NetCo4 02/10] 0 = khong co hen
	 if  TBtiemer  ==  0  then
	 return  0,0
	 end
	 local  atiemer  =  TBtiemer
	 LuaFnSetCopySceneData_Param(sceneId,  14,  0)
	 return  LuaFnGetCopySceneData_Param(sceneId,  15),atiemer
	 
                end
                
                end