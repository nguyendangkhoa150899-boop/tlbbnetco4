-- Phiªu Mi¬u Phong phó bän ....

-- chân v¯n s¯ 
x894000_g_ScriptId  =  894000

x894000_g_CopySceneType  =  FUBEN_SANSHENHUANJING	 -- phó bän loÕi hình , ð¸nh nghîa · ScriptGlobal.lua bên trong 

x894000_g_TickTime	 	 =  1	 	 	 	 -- tr· v« ði«u chân v¯n ðích lúc chuông / ð°ng h° th¶i gian ( ð½n v¸ : giây / l¥n )
x894000_g_NoUserTime	 =  300	 	 	 -- phó bän trung không có ai sau có th¬ tiªp tøc bäo t°n ðích th¶i gian ( ð½n v¸ : giây )
x894000_g_Fuben_X	 	 	 =  41	 	 	 -- tiªn vào phó bän ðích v¸ trí X
x894000_g_Fuben_Z	 	 	 =  161	 	 	 -- tiªn vào phó bän ðích v¸ trí Z
x894000_g_FuBenTime	 	 =  3*60*60	 -- phó bän t¡t th¶i gian ....

--BOSS bi¬u ....
x894000_g_BOSSList  =
{
	 ["HaDaBa_NPC"]	 	 	 	 =  {  DataID=9668,  Title="",  posX=124,  posY=86,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=402283  },
	 ["HaDaBa_BOSS"]	 	 	 	 =  {  DataID=42966,  Title="",  posX=54,  posY=112,  Dir=0,  BaseAI=27,  AIScript=242,  ScriptID=894004},

	 ["SangTuGong_NPC"]	 	 =  {  DataID=9669,  Title="",  posX=41,  posY=105,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=402284  },
	 ["SangTuGong_BOSS"]	 	 =  {  DataID=9661,  Title="",  posX=41,  posY=105,  Dir=0,  BaseAI=27,  AIScript=0,  ScriptID=402278  },
	 ["JiangShi_BOSS"]	 	 	 =  {  DataID=9662,  Title="",  posX=0,  posY=0,  Dir=0,  BaseAI=28,  AIScript=0,  ScriptID=-1  },
	 ["WuLaoDa_NPC"]	 	 	 	 =  {  DataID=9670,  Title=" vÕn tiên ð® nh¤t",  posX=117,  posY=49,  Dir=11,  BaseAI=3,  AIScript=0,  ScriptID=402285  },
	 ["WuLaoDaLoss_NPC"]	 	 =  {  DataID=9671,  Title=" vÕn tiên ð® nh¤t",  posX=0,  posY=0,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=402288  },
	 ["WuLaoDa_BOSS"]	 	 	 =  {  DataID=9663,  Title=" vÕn tiên ð® nh¤t",  posX=117,  posY=49,  Dir=11,  BaseAI=27,  AIScript=0,  ScriptID=402279  },
	 ["ZhuoBuFan_BOSS"]	 	 =  {  DataID=9664,  Title=" Kiªm Th¥n ",  posX=121,  posY=31,  Dir=0,  BaseAI=27,  AIScript=0,  ScriptID=402280  },
	 ["BuPingDaoRen_BOSS"]	 =  {  DataID=9665,  Title=" Giao vß½ng ",  posX=129,  posY=31,  Dir=0,  BaseAI=27,  AIScript=261,  ScriptID=402281  },
	 ["DuanMuYuan_BOSS"]	 	 =  {  DataID=9667,  Title="",  posX=125,  posY=36,  Dir=0,  BaseAI=0,  AIScript=0,  ScriptID=402287  },
	 ["FuMinYi_NPC"]	 	 	 	 =  {  DataID=9672,  Title="",  posX=159,  posY=54,  Dir=11,  BaseAI=3,  AIScript=0,  ScriptID=402286  },
	 ["LiQiuShui_BOSS"]	 	 =  {  DataID=9666,  Title="Næ tØ th¥n bí ",  posX=125,  posY=36,  Dir=11,  BaseAI=27,  AIScript=0,  ScriptID=402282  },

            --*********************************************************************************************************************************
            ---------------------------------------------------- tr· lên boss bö hoang · nhßng không mu¯n thü tiêu -------------------------------------------------------
            --*********************************************************************************************************************************

	 ["CANGLINGZI_1"]  =  {  DataID=42958,  Title="",  posX=69,  posY=124,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=894001},
	 ["CANGLINGZI_2"]  =  {  DataID=42958,  Title="",  posX=144,  posY=73,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=894002},
	 ["CANGLINGZI_3"]  =  {  DataID=42958,  Title="",  posX=143,  posY=132,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=894003},

	 ["XUANXI_FENGYIN"]    =  {  DataID=42963,  Title="",  posX=54,  posY=112,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=-1},
	 ["XUANXI_BOSS"]          =  {  DataID=42967,  Title="",  posX=54,  posY=112,  Dir=0,  BaseAI=27,  AIScript=242,  ScriptID=894004},

	 ["HUOFENG_FENGYIN"]  =  {  DataID=42964,  Title="",  posX=126,  posY=65,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=-1},
	 ["HUOFENG_BOSS"]        =  {  DataID=42969,  Title="",  posX=126,  posY=65,  Dir=0,  BaseAI=27,  AIScript=242,  ScriptID=894005},
                ["LIHUO_BOSS"]	         =  {  DataID=42971,  Title="",  posX=0,  posY=0,  Dir=0,  BaseAI=27,  AIScript=0,  ScriptID=894097  },


	 ["HUAYAO_FENGYIN"]    =  {  DataID=42965,  Title="",  posX=133,  posY=152,  Dir=0,  BaseAI=3,  AIScript=0,  ScriptID=-1},
	 ["HUAYAO_BOSS"]          =  {  DataID=42975,  Title="",  posX=133,  posY=152,  Dir=0,  BaseAI=27,  AIScript=242,  ScriptID=894006},

}

x894000_g_FightBOSSList  =
{
	 [1]  =  x894000_g_BOSSList["HaDaBa_BOSS"].DataID,
	 [2]  =  x894000_g_BOSSList["SangTuGong_BOSS"].DataID,
	 [3]  =  x894000_g_BOSSList["WuLaoDa_BOSS"].DataID,
	 [4]  =  x894000_g_BOSSList["ZhuoBuFan_BOSS"].DataID,
	 [5]  =  x894000_g_BOSSList["BuPingDaoRen_BOSS"].DataID,
	 [6]  =  x894000_g_BOSSList["LiQiuShui_BOSS"].DataID
}

-- có ðßþc hay không khiêu chiªn mµt BOSS ðích d¤u hi®u li®t bi¬u ....
x894000_g_BattleFlagTbl  =  
{
	 ["HaDaBa"]	 	 	 =  8,	 -- có ðßþc hay không khiêu chiªn h¡c ðÕi phách ...
	 ["SangTuGong"]	 =  9,	 -- có ðßþc hay không khiêu chiªn tang ð¤t công ....
	 ["WuLaoDa"]	 	 	 =  10,	 -- có ðßþc hay không khiêu chiªn ô lão ðÕi ....
	 ["ShuangZi"]	 	 =  11,	 -- có ðßþc hay không khiêu chiªn song tØ ....
	 ["LiQiuShui"]	 	 =  12,	 -- có ðßþc hay không khiêu chiªn lý thu thüy ....
}

-- cänh tßþng thay ð±i lßþng tác dçn .... có ðßþc hay không khiêu chiªn mµt BOSS ðích d¤u hi®u ....
--  0= không th¬ khiêu chiªn   1= có th¬ khiêu chiªn   2= ðã khiêu chiªn qua 
x894000_g_IDX_BattleFlag_Hadaba	 	 	 =  8
x894000_g_IDX_BattleFlag_Sangtugong	 =  9
x894000_g_IDX_BattleFlag_Wulaoda	 	 =  10
x894000_g_IDX_BattleFlag_Shuangzi	 	 =  11
x894000_g_IDX_BattleFlag_Liqiushui	 =  12

x894000_g_IDX_FuBenOpenTime	 	 =  13	 -- phó bän thành l§p ðích th¶i gian ....
x894000_g_IDX_FuBenLifeStep	 	 =  14	 -- phó bän sinh mÕng kÏ ðích step....( bao g°m thành l§p NPC.... t¡t cûng tính gi¶ ð« kÏ ....)

-- cänh tßþng thay ð±i lßþng tác dçn .... thông døng Phiªu Mi¬u Phong tính gi¶ khí .... chü yªu dùng cho kích hoÕt BOSS chiªn ð¤u ....
x894000_g_IDX_PMFTimerStep	 	 	 =  15
x894000_g_IDX_PMFTimerScriptID	 =  16

-- cänh tßþng thay ð±i lßþng tác dçn .... ô lão ðÕi tØ vong tính gi¶ khí .... dùng cho xØ lý tØ vong suy lu§n ....
x894000_g_IDX_WuLaoDaDieStep	 	 	 	 =  17
x894000_g_IDX_WuLaoDaDieScriptID	 	 =  18
x894000_g_IDX_WuLaoDaDiePosX	 	 	 	 =	 19
x894000_g_IDX_WuLaoDaDiePosY	 	 	 	 =	 20


--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x894000_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 -- ki¬m tr¡c có ðßþc hay không tiªn vào phó bän ....
	 local  ret,  msg  =  x894000_CheckCanEnter(  sceneId,  selfId,  targetId  )
	 if  1  ~=  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,msg)
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 -- t¡t NPC ð¯i thoÕi cØa s± ....
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

	 x894000_MakeCopyScene(  sceneId,  selfId  )

end

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x894000_OnEnumerate(  sceneId,  selfId,  targetId  )

	 AddNumText(  sceneId,  x894000_g_ScriptId,  "Tam Th¥n Äo Cänh",  10,  1  )

end

--**********************************
-- ki¬m tr¡c có ðßþc hay không tiªn vào này phó bän ....
--**********************************
function  x894000_CheckCanEnter(  sceneId,  selfId,  targetId  )

	 -- có hay không có ðµi ngû ....
	 if  LuaFnHasTeam(sceneId,selfId)  ~=  1  then
	 	 return  0,  "#{PMF_20080521_02}"
	 end

	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 return  0,  "#{PMF_20080521_03}"
	 end

	 -- nhân s¯ có hay không ðü ....
	 if  GetTeamSize(sceneId,selfId)  <  1  then
	 	 return  0,  "#{PMF_20080521_04}"
	 end

	 -- có hay không ð«u · ðây phø c§n ....
	 local  NearTeamSize  =  GetNearTeamCount(sceneId,selfId)
	 if  GetTeamSize(sceneId,selfId)  ~=  NearTeamSize  then
	 	 return  0,  "#{PMF_20080521_05}"
	 end

	 local  Humanlist  =  {}
	 local  nHumanNum  =  0

	 -- có hay không có ngß¶i không ðü 75 c¤p ....
	 for  i=0,  NearTeamSize-1  do
	 	 local  PlayerId  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 if  GetLevel(  sceneId,  PlayerId  )  <  80  then
	 	 	 Humanlist[nHumanNum]  =  GetName(  sceneId,  PlayerId  )
	 	 	 nHumanNum  =  nHumanNum  +  1
	 	 end
	 end

	 if  nHumanNum  >  0  then

	 	 local  msg  =  "ðµi ngû có "
	 	 for  i=0,  nHumanNum-2  do
	 	 	 msg  =  msg  ..  Humanlist[i]  ..  " , "
	 	 end
	 	 msg  =  msg  ..  Humanlist[nHumanNum-1]  ..  " ðích tâm pháp còn th¤p , còn chßa phäi mu¯n ði thì t¯t h½n . "
	 	 return  0,  msg

	 end


	 -- có hay không có ngß¶i hôm nay ðã làm 1 l¥n ....
	 nHumanNum  =  0
	 local  CurDayTime  =  GetDayTime()
	 for  i=0,  NearTeamSize-1  do

	 	 local  PlayerId  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 local  lastTime  =  GetMissionData(  sceneId,  PlayerId,  SANSHENHUANJING_COUNT  )
	 	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 	 local  lastDayCount  =  mod(  lastTime,  100  )
	 
	 	 if  CurDayTime  >  lastDayTime  then
	 	 	 lastDayTime  =  CurDayTime
	 	 	 lastDayCount  =  0
	 	 end

	 	 if  lastDayCount  >=  5  then
	 	 	 Humanlist[nHumanNum]  =  GetName(  sceneId,  PlayerId  )
	 	 	 nHumanNum  =  nHumanNum  +  1
	 	 end

	 end

	 if  nHumanNum  >=  5  then

	 	 local  msg  =  "        "
	 	 for  i=0,  nHumanNum-2  do
	 	 	 msg  =  msg  ..  Humanlist[i]  ..  " , "
	 	 end
	 	 msg  =  msg  ..  Humanlist[nHumanNum-1]  ..  " ðã khiêu chiªn quá 3 l¥n ba th¥n äo cänh , m²i ngày chï có th¬ khiêu chiªn 3 l¥n . "
	 	 return  0,  msg

	 end

	 return  1

end

--**********************************
-- khai sáng phó bän ....
--**********************************
function  x894000_MakeCopyScene(  sceneId,  selfId  )

	 local  x  =  0
	 local  z  =  0
	 x,z  =  LuaFnGetWorldPos(sceneId,selfId)
	 leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	 LuaFnSetSceneLoad_Map(sceneId,  "sanshenhuanjing.nav")
	 LuaFnSetCopySceneData_TeamLeader(sceneId,  leaderguid)
	 LuaFnSetCopySceneData_NoUserCloseTime(sceneId,  x894000_g_NoUserTime*1000)
	 LuaFnSetCopySceneData_Timer(sceneId,  x894000_g_TickTime*1000)
	 LuaFnSetCopySceneData_Param(sceneId,  0,  x894000_g_CopySceneType)
	 LuaFnSetCopySceneData_Param(sceneId,  1,  x894000_g_ScriptId)
	 LuaFnSetCopySceneData_Param(sceneId,  2,  0)
	 LuaFnSetCopySceneData_Param(sceneId,  3,  sceneId)
	 LuaFnSetCopySceneData_Param(sceneId,  4,  x)
	 LuaFnSetCopySceneData_Param(sceneId,  5,  z)
	 LuaFnSetCopySceneData_Param(sceneId,  6,  GetTeamId(sceneId,selfId))
	 LuaFnSetCopySceneData_Param(sceneId,  7,  0)

	 for  i=8,  31  do
	 	 LuaFnSetCopySceneData_Param(sceneId,  i,  0)
	 end

	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_BattleFlag_Hadaba,  1  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_BattleFlag_Sangtugong,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_BattleFlag_Wulaoda,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_BattleFlag_Shuangzi,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_BattleFlag_Liqiushui,  0  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenOpenTime,  LuaFnGetCurrentTime()  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  0  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerStep,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerScriptID,  -1  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieStep,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieScriptID,  -1  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosX,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosY,  0  )

	 LuaFnSetSceneLoad_Area(  sceneId,  "sanshenhuanjing_area.ini"  )
	 LuaFnSetSceneLoad_Monster(  sceneId,  "sanshenhuanjing_monster.ini"  )

	 local  bRetSceneID  =  LuaFnCreateCopyScene(sceneId)
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
-- phó bän sñ ki®n ....
--**********************************
function  x894000_OnCopySceneReady(  sceneId,  destsceneId  )

	 -- tiªn vào phó bän ðích quy t¡c 
	 --  1 , nªu nhß cái này nhà ch½i không có h÷p thành ðµi , li«n truy«n t¯ng cái này nhà ch½i mình tiªn vào phó bän 
	 --  2,  nªu nhß nhà ch½i có ðµi ngû , nhßng là nhà ch½i không phäi là ðµi trß·ng , li«n truy«n t¯ng mình tiªn vào phó bän 
	 --  3 , nªu nhß nhà ch½i có ðµi ngû , h½n næa cái này nhà ch½i là ðµi trß·ng , li«n truy«n t¯ng mình và phø c§n ðµi hæu cùng nhau ði vào 

	 LuaFnSetCopySceneData_Param(destsceneId,  3,  sceneId)  -- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ 
	 leaderguid    =  LuaFnGetCopySceneData_TeamLeader(destsceneId)
	 leaderObjId  =  LuaFnGuid2ObjId(sceneId,leaderguid)

	 if  LuaFnIsCanDoScriptLogic(  sceneId,  leaderObjId  )  ~=  1  then
	 	 return
	 end

	 -- th¯ng kê khai sáng phó bän s¯ l¥n ....
	 AuditPMFCreateFuben(  sceneId,  leaderObjId  )

	 if  LuaFnHasTeam(  sceneId,  leaderObjId  )  ==  0    then
	 	 NewWorld(  sceneId,  leaderObjId,  destsceneId,  x894000_g_Fuben_X,  x894000_g_Fuben_Z)  ;
	 else
	 	 if  IsCaptain(sceneId,  leaderObjId)  ==  0    then
	 	 	 NewWorld(  sceneId,  leaderObjId,  destsceneId,  x894000_g_Fuben_X,  x894000_g_Fuben_Z)  ;
	 	 else
	 	 	 local	 nearteammembercount  =  GetNearTeamCount(  sceneId,  leaderObjId)  
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,nearteammembercount-1  do
	 	 	 	 mems[i]  =  GetNearTeamMember(sceneId,  leaderObjId,  i)
	 	 	 	 NewWorld(  sceneId,  mems[i],  destsceneId,  x894000_g_Fuben_X,  x894000_g_Fuben_Z)
	 	 	 end
	 	 end	 	 
	 end

end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n ....
--**********************************
function  x894000_OnCopySceneTimer(  sceneId,  nowTime  )

	 x894000_TickFubenLife(  sceneId,  nowTime  )

	 x894000_TickPMFTimer(  sceneId,  nowTime  )

	 x894000_TickWuLaoDaDieTimer(  sceneId,  nowTime  )

	 x894000_TickJianWuArea(  sceneId,  nowTime  )

end

--**********************************
-- có nhà ch½i tiªn vào phó bän sñ ki®n ....
--**********************************
function  x894000_OnPlayerEnter(  sceneId,  selfId  )

	 -- thiªt trí tØ vong sñ ki®n ....
	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%10",  -1,  "0",  sceneId,  x894000_g_Fuben_X,  x894000_g_Fuben_Z  )

	 -- thiªt trí khiêu chiªn quá mµt l¥n Phiªu Mi¬u Phong ....
	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  SANSHENHUANJING_COUNT  )
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 local  CurDayTime  =  GetDayTime()

	 if  CurDayTime  >  lastDayTime  then
	 	 lastDayTime  =  CurDayTime
	 	 lastDayCount  =  0
	 end

	 lastDayCount  =  lastDayCount  +  1
	 lastTime  =  lastDayTime  *  100  +  lastDayCount
	 SetMissionData(  sceneId,  selfId,  SANSHENHUANJING_COUNT,  lastTime  )

	 if  lastDayCount  >  20  then
                      x894000_NotifyTip(  sceneId,  selfId,  " ngß½i sØ døng phi pháp công cø tÕp phó bän ðã b¸ ghi chép , nhi«u l¥n b¸ ghi chép s¨ b¸ phong hào ! "  )  
                      x894000_KickOut(  sceneId,  selfId  )
                end
end

--**********************************
-- màn änh trung gian ð« kÏ 
--**********************************
function  x894000_NotifyTip(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- ðem mµt nhà ch½i truy«n t¯ng ra phó bän , tr· lÕi tiªn vào lúc ðích v¸ trí 
--**********************************
function  x894000_KickOut(  sceneId,  objId  )
        local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  3  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 
	 local  x  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_Fuben_X  )  -- tiªn vào lúc ðích t÷a ðµ X
	 local  z  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_Fuben_Z  )  -- tiªn vào lúc ðích t÷a ðµ Z
	 
	 if  LuaFnIsObjValid(  sceneId,  objId  )  ==  1  then
	         NewWorld(  sceneId,  objId,  oldsceneId,  x,  z  )
	 end
	 
end

--**********************************
-- có nhà ch½i · phó bän trung tØ vong sñ ki®n ....
--**********************************
function  x894000_OnHumanDie(  sceneId,  selfId,  killerId  )
	 
end

--**********************************
-- ð« kÏ t¤t cä phó bän bên trong nhà ch½i ....
--**********************************
function  x894000_TipAllHuman(  sceneId,  Str  )

	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanNum-1    do
	 	 local  PlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(  sceneId,  PlayerId  )  ==  1  and  LuaFnIsCanDoScriptLogic(  sceneId,  PlayerId  )  ==  1  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,  Str)
	 	 	 EndEvent(sceneId)
	 	 	 DispatchMissionTips(sceneId,  PlayerId)
	 	 end
	 end

end

--**********************************
--Tick phó bän sinh mÕng kÏ ....
--**********************************
function  x894000_TickFubenLife(  sceneId,  nowTime  )

	 local  openTime  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenOpenTime  )
	 local  leftTime  =  openTime  +  x894000_g_FuBenTime  -  LuaFnGetCurrentTime()
	 local  lifeStep  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep  )

	 if  lifeStep  ==  15  then

	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  16  )

	 	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 local  oldSceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  3  )
	 	 local  oldX  =  LuaFnGetCopySceneData_Param(  sceneId,  4  )
	 	 local  oldZ  =  LuaFnGetCopySceneData_Param(  sceneId,  5  )
	 	 for  i=0,  nHumanNum-1    do
	 	 	 local  PlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	 if  LuaFnIsObjValid(  sceneId,  PlayerId  )  ==  1  and  LuaFnIsCanDoScriptLogic(  sceneId,  PlayerId  )  ==  1  then
	 	 	 	 NewWorld(  sceneId,  PlayerId,  oldSceneId,  oldX,  oldZ  )
	 	 	 end
	 	 end

	 	 return

	 end

	 if  lifeStep  ==  14  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  15  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 1 giây sau t¡t . "  )
	 	 return
	 end

	 if  lifeStep  ==  13  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  14  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 2 giây sau t¡t . "  )
	 	 return
	 end

	 if  lifeStep  ==  12  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  13  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 3 giây sau t¡t . "  )
	 	 return
	 end

	 if  lifeStep  ==  11  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  12  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 4 giây sau t¡t . "  )
	 	 return
	 end

	 if  lifeStep  ==  10  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  11  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 5 giây sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  10  and  lifeStep  ==  9  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  10  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 10 giây sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  30  and  lifeStep  ==  8  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  9  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 30 giây sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  60  and  lifeStep  ==  7  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  8  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 1 phút sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  120  and  lifeStep  ==  6  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  7  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 2 phút sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  180  and  lifeStep  ==  5  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  6  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 3 phút sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  300  and  lifeStep  ==  4  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  5  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 5 phút sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  900  and  lifeStep  ==  3  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  4  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 15 phút sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  1800  and  lifeStep  ==  2  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  3  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 30 phút sau t¡t . "  )
	 	 return
	 end

	 if  leftTime  <=  3600  and  lifeStep  ==  1  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  2  )
	 	 x894000_TipAllHuman(  sceneId,  " phó bän ðem · 60 phút sau t¡t . "  )
	 	 return
	 end

	 -- m¾i b¡t ð¥u hóa phó bän bên trong ðích NPC....
	 if  lifeStep  ==  0  then

	 	 local  MstId  =  x894000_CreateBOSS(  sceneId,  "XUANXI_FENGYIN",  -1,  -1  )
                                SetCharacterName(sceneId,  MstId,  "")
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  

	 	 local  MstId  =  x894000_CreateBOSS(  sceneId,  "HUOFENG_FENGYIN",  -1,  -1  )
                                SetCharacterName(sceneId,  MstId,  "")
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  
	 
	 	 local  MstId  =  x894000_CreateBOSS(  sceneId,  "HUAYAO_FENGYIN",  -1,  -1  )
                                SetCharacterName(sceneId,  MstId,  "")
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  

	 	 local  MstId  =  x894000_CreateBOSS(  sceneId,  "CANGLINGZI_1",  -1,  -1  )
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  10)  
		 
		 local  MstId  =  x894000_CreateBOSS(  sceneId,  "CANGLINGZI_2",  -1,  -1  )
	 	
		 
		 local  MstId  =  x894000_CreateBOSS(  sceneId,  "CANGLINGZI_3",  -1,  -1  )
	 	  


	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_FuBenLifeStep,  1  )
	 	 return
	 end

end

--**********************************
--Tick Phiªu Mi¬u Phong tính gi¶ khí ....
--**********************************
function  x894000_TickPMFTimer(  sceneId,  nowTime  )

	 local  step  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerStep  )
	 if  step  <=  0  then
	 	 return
	 end
	 local  scriptID  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerScriptID  )

	 -- tr· v« ði«u chï ð¸nh chân v¯n ðích OnTimer....
	 CallScriptFunction(  scriptID,  "OnPMFTimer",  sceneId,  step  )

	 -- nªu nhß ðã ði hªt t¤t cä step là t¡t tính gi¶ khí ....
	 step  =  step  -  1
	 if  step  <=  0  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerStep,  0  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerScriptID,  -1  )
	 else
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerStep,  step  )
	 end

end

--**********************************
-- m· ra Phiªu Mi¬u Phong tính gi¶ khí ....
--**********************************
function  x894000_OpenPMFTimer(  sceneId,  allstep,  ScriptID  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerStep,  allstep  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerScriptID,  ScriptID  )

end

--**********************************
-- trß¾c m£t Phiªu Mi¬u Phong tính gi¶ khí có hay không kích hoÕt ....
--**********************************
function  x894000_IsPMFTimerRunning(  sceneId  )

	 local  step  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_PMFTimerStep  )
	 if  step  >  0  then
	 	 return  1
	 else
	 	 return  0
	 end

end

--**********************************
--Tick ô lão ðÕi tØ vong tính gi¶ khí ....
--**********************************
function  x894000_TickWuLaoDaDieTimer(  sceneId,  nowTime  )

	 local  step  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieStep  )
	 if  step  <=  0  then
	 	 return
	 end

	 local  scriptID  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieScriptID  )
	 local  posX  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosX  )
	 local  posY  =  LuaFnGetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosY  )

	 -- tr· v« ði«u chï ð¸nh chân v¯n ðích OnTimer....
	 CallScriptFunction(  scriptID,  "OnHaDaBaDieTimer",  sceneId,  step,  posX,  posY  )

	 -- nªu nhß ðã ði hªt t¤t cä step là t¡t tính gi¶ khí ....
	 step  =  step  -  1
	 if  step  <=  0  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieStep,  0  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieScriptID,  -1  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosX,  0  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosY,  0  )
	 else
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieStep,  step  )
	 end

end

--**********************************
-- m· ra ô lão ðÕi tØ vong tính gi¶ khí ....
--**********************************
function  x894000_OpenWuLaoDaDieTimer(  sceneId,  allstep,  ScriptID,  posX,  posY  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieStep,  allstep  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDieScriptID,  ScriptID  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosX,  posX  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x894000_g_IDX_WuLaoDaDiePosY,  posY  )

end

--**********************************
--Tick kiªm vû khu vñc ....
-- chï c¥n nhà ch½i ðÑng · cänh tßþng d£m 6 cá cµt sáng bên trong .... m²i giây cûng có th¬ ðÕt ðßþc mµt mi­n d¸ch kiªm vû ðích buff....
--**********************************
function  x894000_TickJianWuArea(  sceneId,  nowTime  )

	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then

	 	 	 local  x,z  =  GetWorldPos(  sceneId,  nHumanId  )
	 	 	 local  buff1  =  -1
	 	 	 local  buff2  =  10376

	 	 	 if  x>=112  and  x<=116  and  z>=27  and  z<=31  then
	 	 	 	 buff1  =  10370
	 	 	 elseif  x>=134  and  x<=138  and  z>=27  and  z<=31  then
	 	 	 	 buff1  =  10374
	 	 	 elseif  x>=145  and  x<=149  and  z>=46  and  z<=50  then
	 	 	 	 buff1  =  10375
	 	 	 elseif  x>=134  and  x<=138  and  z>=65  and  z<=69  then
	 	 	 	 buff1  =  10371
	 	 	 elseif  x>=112  and  x<=116  and  z>=65  and  z<=69  then
	 	 	 	 buff1  =  10373
	 	 	 elseif  x>=101  and  x<=105  and  z>=46  and  z<=50  then
	 	 	 	 buff1  =  10372
	 	 	 end

	 	 	 if  buff1  ~=  -1  then
	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  nHumanId,  nHumanId,  nHumanId,  buff1,  0)
	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  nHumanId,  nHumanId,  nHumanId,  buff2,  0)
	 	 	 end

	 	 end
	 end

end

--**********************************
-- khai sáng chï ð¸nh BOSS....
--**********************************
function  x894000_CreateBOSS(  sceneId,  name,  x,  y  )

	 local  BOSSData  =  x894000_g_BOSSList[name]
	 if  not  BOSSData  then
	 	 return
	 end

	 local  posX  =  0
	 local  posY  =  0
	 if  x  ~=  -1  and  y  ~=  -1  then
	 	 posX  =  x
	 	 posY  =  y
	 else
	 	 posX  =  BOSSData.posX
	 	 posY  =  BOSSData.posY
	 end

	 local  MstId  =  LuaFnCreateMonster(  sceneId,  BOSSData.DataID,  posX,  posY,  BOSSData.BaseAI,  BOSSData.AIScript,  BOSSData.ScriptID  )
	 SetObjDir(  sceneId,  MstId,  BOSSData.Dir  )
	 SetMonsterFightWithNpcFlag(  sceneId,  MstId,  0  )
	 if  BOSSData.Title  ~=  ""  then
	 	 SetCharacterTitle(sceneId,  MstId,  BOSSData.Title)
	 end

	 LuaFnSendSpecificImpactToUnit(sceneId,  MstId,  MstId,  MstId,  152,  0)

	 -- th¯ng kê khai sáng BOSS....
	 AuditPMFCreateBoss(  sceneId,  BOSSData.DataID  )

	 return  MstId

end

--**********************************
-- thü tiêu chï ð¸nh BOSS....
--**********************************
function  x894000_DeleteBOSS(  sceneId,  name  )

	 local  BOSSData  =  x894000_g_BOSSList[name]
	 if  not  BOSSData  then
	 	 return
	 end

	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  BOSSData.DataID  ==  GetMonsterDataID(  sceneId,  MonsterId  )  then
	 	 	 --LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  MonsterId,  MonsterId,  MonsterId,  152,  0)
	 	 	 SetCharacterDieTime(  sceneId,  MonsterId,  1000  )
	 	 end
	 end

end

--**********************************
-- tìm kiªm chï ð¸nh BOSS....
--**********************************
function  x894000_FindBOSS(  sceneId,  name  )

	 local  BOSSData  =  x894000_g_BOSSList[name]
	 if  not  BOSSData  then
	 	 return  -1
	 end

	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  BOSSData.DataID  ==  GetMonsterDataID(  sceneId,  MonsterId  )  then
	 	 	 return  MonsterId
	 	 end
	 end

	 return  -1

end

--**********************************
-- ki¬m tr¡c trß¾c m£t có hay không ðã t°n tÕi mµt BOSS li­u ....
--**********************************
function  x894000_CheckHaveBOSS(  sceneId  )

	 local  BossList  =  {}
	 local  nBossNum  =  0

	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  LuaFnIsCharacterLiving(sceneId,  MonsterId)  ==  1  then
	 	 	 local  DataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 	 for  j,  dataId  in  x894000_g_FightBOSSList  do
	 	 	 	 if  DataID  ==  dataId  then
	 	 	 	 	 BossList[nBossNum]  =  GetName(  sceneId,  MonsterId  )
	 	 	 	 	 nBossNum  =  nBossNum  +  1
	 	 	 	 end
	 	 	 end
	 	 end
	 end

	 if  nBossNum  >  0  then
	 	 local  msg  =  " ðang cùng "
	 	 for  i=0,  nBossNum-2  do
	 	 	 msg  =  msg  ..  BossList[i]  ..  " , "
	 	 end
	 	 msg  =  msg  ..  BossList[nBossNum-1]  ..  " vòng chiªn "
	 	 return  1,  msg
	 end

	 return  0,  ""

end

--**********************************
-- l¤y ðßþc có ðßþc hay không khiêu chiªn mµt BOSS ðích d¤u hi®u ....
--**********************************
function  x894000_GetBossBattleFlag(  sceneId,  bossName  )

	 local  idx  =  x894000_g_BattleFlagTbl[  bossName  ]
	 return  LuaFnGetCopySceneData_Param(  sceneId,  idx  )

end

--**********************************
-- thiªt trí có ðßþc hay không khiêu chiªn mµt BOSS ðích d¤u hi®u ....
--**********************************
function  x894000_SetBossBattleFlag(  sceneId,  bossName,  bCan  )

	 local  idx  =  x894000_g_BattleFlagTbl[  bossName  ]
	 LuaFnSetCopySceneData_Param(  sceneId,  idx,  bCan  )

end