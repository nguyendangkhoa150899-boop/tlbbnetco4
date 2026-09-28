-- Phiªu Mi¬u Phong phó bän ....      ____? a a     chæa tr¸ 
-- chân v¯n s¯ 
x002052_g_ScriptId  =  002052
x002052_g_CopySceneType  =  FUBEN_LANGHUAN	 -- phó bän loÕi hình , ð¸nh nghîa · ScriptGlobal.lua bên trong 
x002052_g_TickTime	 	 =  1	 	 	 	 -- tr· v« ði«u chân v¯n ðích lúc chuông / ð°ng h° th¶i gian ( ð½n v¸ : giây / l¥n )
x002052_g_NoUserTime	 =  10	 	 	 -- phó bän trung không có ai sau có th¬ tiªp tøc bäo t°n ðích th¶i gian ( ð½n v¸ : giây )
x002052_g_Fuben_X	 	 	 =  66	 	 	 -- tiªn vào phó bän ðích v¸ trí X
x002052_g_Fuben_Z	 	 	 =  57	 	 	 -- tiªn vào phó bän ðích v¸ trí Z
x002052_g_FuBenTime	 	 =  1*60*60	 -- phó bän t¡t th¶i gian ....
--BOSS bi¬u ....
x002052_g_BOSSList  =
{
	 ["JiuMoZhi_NPC1"]	 	 	 	 =  {  DataID=43970,  Title="",  posX=140,  posY=62,  Dir=0,  BaseAI=21,  AIScript=242,  ScriptID=002052},
	 ["JiuMoZhi_NPC2"]	 	 	 	 =  {  DataID=43971,  Title="",  posX=212,  posY=119,  Dir=0,  BaseAI=21,  AIScript=242,  ScriptID=002052},
	 ["JiuMoZhi_NPC3"]	 	 	 	 =  {  DataID=43973,  Title="",  posX=181,  posY=208,  Dir=0,  BaseAI=12,  AIScript=242,  ScriptID=002052},
	 ["JiuMoZhi_NPC4"]	 	 	 	 =  {  DataID=43975,  Title="",  posX=83,  posY=181,  Dir=0,  BaseAI=21,  AIScript=242,  ScriptID=002052},

}


-- cänh tßþng thay ð±i lßþng tác dçn .... có ðßþc hay không khiêu chiªn mµt BOSS ðích d¤u hi®u ....
--  0= không th¬ khiêu chiªn   1= có th¬ khiêu chiªn   2= ðã khiêu chiªn qua 
x002052_g_IDX_BattleFlag_JiuMoZhi	 	 	 =  8    -- khiêu chiªn d¤u hi®u 

x002052_g_IDX_BattleFlag_MuRongFu	 	 =  10
x002052_g_IDX_BattleFlag_Shuangzi	 	 =  11
x002052_g_IDX_BattleFlag_DingChunQiu	 =  12
x002052_g_IDX_FuBenOpenTime	 	 =  13	 -- phó bän thành l§p ðích th¶i gian ....
x002052_g_IDX_FuBenLifeStep	 	 =  14	 -- phó bän sinh mÕng kÏ ðích step....( bao g°m thành l§p NPC.... t¡t cûng tính gi¶ ð« kÏ ....)
-- cänh tßþng thay ð±i lßþng tác dçn .... thông døng Phiªu Mi¬u Phong tính gi¶ khí .... chü yªu dùng cho kích hoÕt BOSS chiªn ð¤u ....
x002052_g_IDX_PMFTimerStep	 	 	 =  15
x002052_g_IDX_PMFTimerScriptID	 =  16
-- cänh tßþng thay ð±i lßþng tác dçn .... ô lão ðÕi tØ vong tính gi¶ khí .... dùng cho xØ lý tØ vong suy lu§n ....
x002052_g_IDX_MuRongFuDieStep	 	 	 	 =  17
x002052_g_IDX_MuRongFuDieScriptID	 	 =  18

x002052_g_IDX_MuRongFuDiePosX	 	 	 	 =	 19  
x002052_g_IDX_MuRongFuDiePosY	 	 	 	 =	 20
--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x002052_OnDefaultEvent(  sceneId,  selfId,  targetId  )
BeginEvent(sceneId)
AddNumText(  sceneId,  x002052_g_ScriptId,  " b¡t ð¥u khiêu chiªn ",6  ,7    )
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end
function  x002052_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 if  GetNumText()  ==  7  then
	 	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  "#{PMF_20080521_07}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 
	 end	 
	 	 if    GetUnitReputationID(sceneId,targetId,targetId)  ~=  8  then
                  BeginEvent(  sceneId  )  
	           AddText(  sceneId,  "#Gðµi ngû ðã b¡t ð¥u chiªn ð¤u , xin không c¥n tái di­n ! "  )
                  EndEvent(  sceneId  )
                  DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return  
	 	 end	 	 
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_BattleFlag_JiuMoZhi,  1  )	 
	 x002052_TipAllHuman(  sceneId,  " b¡t ð¥u chiªn ð¤u "  )
	   SetUnitReputationID(sceneId,  targetId,  targetId,  28)
	 SetNPCAIType(sceneId,  targetId,27)	 
	 -- t¡t NPC ð¯i thoÕi cØa s± ....
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)	 
	 return  0
	 end  	 
	 -- ki¬m tr¡c có ðßþc hay không tiªn vào phó bän ....
	 local  ret,  msg  =  x002052_CheckCanEnter(  sceneId,  selfId,  targetId  )
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

	 x002052_MakeCopyScene(  sceneId,  selfId  )
	 
	 
end	 

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x002052_OnEnumerate(  sceneId,  selfId,  targetId  )
	 AddNumText(  sceneId,  x002052_g_ScriptId,  "#GLang huyên phúc ð¸a thß¶ng",  10,  1  )
end

--**********************************
-- ki¬m tr¡c có ðßþc hay không tiªn vào này phó bän ....
--**********************************
function  x002052_CheckCanEnter(  sceneId,  selfId,  targetId  )

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

	 -- có hay không có ngß¶i không ðü 90 c¤p ....
	 for  i=0,  NearTeamSize-1  do
	 	 local  PlayerId  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 if  GetLevel(  sceneId,  PlayerId  )  <  100  then
	 	 	 Humanlist[nHumanNum]  =  GetName(  sceneId,  PlayerId  )
	 	 	 nHumanNum  =  nHumanNum  +  1
	 	 end
	 end

	 if  nHumanNum  >  0  then

	 	 local  msg  =  " ðµi ngû có"
	 	 for  i=0,  nHumanNum-2  do
	 	 	 msg  =  msg  ..  Humanlist[i]  ..  " , "
	 	 end
	 	 msg  =  msg  ..  Humanlist[nHumanNum-1]  ..  " chßa ðü 100 c¤p "
	 	 return  0,  msg

	 end


	 -- có hay không có ngß¶i hôm nay ðã làm 3 l¥n ....
	 nHumanNum  =  0
	 local  CurDayTime  =  GetDayTime()
	 for  i=0,  NearTeamSize-1  do

	 	 local  PlayerId  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 local  lastTime  =  GetMissionData(  sceneId,  PlayerId,  MD_50WAN_TIME_INFO  )
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
	 	 msg  =  msg  ..  Humanlist[nHumanNum-1]  ..  " ðã khiêu chiªn quá 3 l¥n lang huyên phó bän"
	 	 return  0,  msg

	 end
	 return  1,msg

end

--**********************************
-- khai sáng phó bän ....
--**********************************
function  x002052_MakeCopyScene(  sceneId,  selfId  )
	 local  x  =  0
	 local  z  =  0
	 x,z  =  LuaFnGetWorldPos(sceneId,selfId)
	 leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	 LuaFnSetSceneLoad_Map(sceneId,  "langhuanfudi.nav")
	 LuaFnSetCopySceneData_TeamLeader(sceneId,  leaderguid)
	 LuaFnSetCopySceneData_NoUserCloseTime(sceneId,  x002052_g_NoUserTime*1000)
	 LuaFnSetCopySceneData_Timer(sceneId,  x002052_g_TickTime*1000)
	 LuaFnSetCopySceneData_Param(sceneId,  0,  x002052_g_CopySceneType)    -- phó bän loÕi hình 
	 LuaFnSetCopySceneData_Param(sceneId,  1,  x002052_g_ScriptId)    -- chân v¯n s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  2,  0)
	 LuaFnSetCopySceneData_Param(sceneId,  3,  sceneId)        -- tiªn vào cänh tßþng 
	 LuaFnSetCopySceneData_Param(sceneId,  4,  x)              -- tiªn vào x t÷a ðµ 
	 LuaFnSetCopySceneData_Param(sceneId,  5,  z)            -- tiªn vào y t÷a ðµ 
	 LuaFnSetCopySceneData_Param(sceneId,  6,  GetTeamId(sceneId,selfId))    -- ðµi ngû id
	 LuaFnSetCopySceneData_Param(sceneId,  7,  0)    
	 for  i=8,  31  do
	 	 LuaFnSetCopySceneData_Param(sceneId,  i,  0)
	 end
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_BattleFlag_JiuMoZhi,  0  )    -- khiêu chiªn d¤u hi®u   8  

	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_BattleFlag_MuRongFu,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_BattleFlag_Shuangzi,  0  )
	 
	 
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_BattleFlag_DingChunQiu,  0  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenOpenTime,  LuaFnGetCurrentTime()  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  0  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerStep,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerScriptID,  -1  )

	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieStep,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieScriptID,  -1  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosX,  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosY,  0  )

	 LuaFnSetSceneLoad_Area(  sceneId,  "langhuanfudi_area.ini"  )
	 LuaFnSetSceneLoad_Monster(  sceneId,  "langhuanfudi_monster.ini"  )

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
function  x002052_OnCopySceneReady(  sceneId,  destsceneId  )
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
	 --AuditPMFCreateFuben(  sceneId,  leaderObjId  )

	 if  LuaFnHasTeam(  sceneId,  leaderObjId  )  ==  0    then
	 	 NewWorld(  sceneId,  leaderObjId,  destsceneId,  x002052_g_Fuben_X,  x002052_g_Fuben_Z)  ;
	 else
	 	 if  IsCaptain(sceneId,  leaderObjId)  ==  0    then
	 	 	 NewWorld(  sceneId,  leaderObjId,  destsceneId,  x002052_g_Fuben_X,  x002052_g_Fuben_Z)  ;
	 	 else
	 	 	 local	 nearteammembercount  =  GetNearTeamCount(  sceneId,  leaderObjId)  
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,nearteammembercount-1  do
	 	 	 	 mems[i]  =  GetNearTeamMember(sceneId,  leaderObjId,  i)
	 	 	 	 NewWorld(  sceneId,  mems[i],  destsceneId,  x002052_g_Fuben_X,  x002052_g_Fuben_Z)
	 	 	 end
	 	 end	 	 
	 end

end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n ....
--**********************************
function  x002052_OnCopySceneTimer(  sceneId,  nowTime  )
	 x002052_TickFubenLife(  sceneId,  nowTime  )
	 x002052_TickPMFTimer(  sceneId,  nowTime  )
	 x002052_TickMuRongFuDieTimer(  sceneId,  nowTime  )
end

--**********************************
-- có nhà ch½i tiªn vào phó bän sñ ki®n ....
--**********************************
function  x002052_OnPlayerEnter(  sceneId,  selfId  )

	 -- thiªt trí tØ vong sñ ki®n ....
	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%100",  -1,  "0",  sceneId,  x002052_g_Fuben_X,  x002052_g_Fuben_Z  )

	 -- thiªt trí khiêu chiªn quá mµt l¥n Phiªu Mi¬u Phong ....
	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  MD_50WAN_TIME_INFO  )
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 local  CurDayTime  =  GetDayTime()

	 if  CurDayTime  >  lastDayTime  then
	 	 lastDayTime  =  CurDayTime
	 	 lastDayCount  =  0
	 end

	 lastDayCount  =  lastDayCount  +  1
	 lastTime  =  lastDayTime  *  100  +  lastDayCount
	 SetMissionData(  sceneId,  selfId,  MD_50WAN_TIME_INFO,  lastTime  )


end

--**********************************
-- có nhà ch½i · phó bän trung tØ vong sñ ki®n ....
--**********************************
function  x002052_OnHumanDie(  sceneId,  selfId,  killerId  )
	 
end

--**********************************
-- ð« kÏ t¤t cä phó bän bên trong nhà ch½i ....
--**********************************
function  x002052_TipAllHuman(  sceneId,  Str  )

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
function  x002052_TickFubenLife(  sceneId,  nowTime  )
	 local  openTime  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenOpenTime  )
	 local  leftTime  =  openTime  +  x002052_g_FuBenTime  -  LuaFnGetCurrentTime()
	 local  lifeStep  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep  )
	 if  lifeStep  ==  15  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  16  )
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
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  15  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 1 giây "  )
	 	 return
	 end

	 if  lifeStep  ==  13  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  14  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 2 giây "  )
	 	 return
	 end

	 if  lifeStep  ==  12  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  13  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 3 giây "  )
	 	 return
	 end

	 if  lifeStep  ==  11  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  12  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 4 giây "  )
	 	 return
	 end

	 if  lifeStep  ==  10  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  11  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 5 giây "  )
	 	 return
	 end

	 if  leftTime  <=  10  and  lifeStep  ==  9  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  10  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 10 giây "  )
	 	 return
	 end

	 if  leftTime  <=  30  and  lifeStep  ==  8  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  9  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 30 giây "  )
	 	 return
	 end

	 if  leftTime  <=  60  and  lifeStep  ==  7  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  8  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 1 phút "  )
	 	 return
	 end

	 if  leftTime  <=  120  and  lifeStep  ==  6  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  7  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 2 phút "  )
	 	 return
	 end

	 if  leftTime  <=  180  and  lifeStep  ==  5  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  6  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 3 phút "  )
	 	 return
	 end
	 if  leftTime  <=  300  and  lifeStep  ==  4  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  5  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 5 phút "  )
	 	 return
	 end

	 if  leftTime  <=  900  and  lifeStep  ==  3  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  4  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 15 phút "  )
	 	 return
	 end

	 if  leftTime  <=  1800  and  lifeStep  ==  2  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  3  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 30 phút "  )
	 	 return
	 end
	 if  leftTime  <=  3600  and  lifeStep  ==  1  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  2  )
	 	 x002052_TipAllHuman(  sceneId,  " Phó bän ðóng lÕi sau 60 phút "  )
	 	 return
	 end

	 -- m¾i b¡t ð¥u hóa phó bän bên trong ðích NPC....
	 if  lifeStep  ==  0  then
	 	 local  MstId  =  x002052_CreateBOSS(  sceneId,  "JiuMoZhi_NPC1",  -1,  -1  )
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  
	 	 local  MstId  =  x002052_CreateBOSS(  sceneId,  "JiuMoZhi_NPC2",  -1,  -1  )
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  	 
	 	 	 local  MstId  =  x002052_CreateBOSS(  sceneId,  "JiuMoZhi_NPC3",  -1,  -1  )
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  	 	 
	 	 	 
	 	 	 	 local  MstId  =  x002052_CreateBOSS(  sceneId,  "JiuMoZhi_NPC4",  -1,  -1  )
	 	 SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 	 	 SetUnitReputationID(sceneId,  MstId,  MstId,  8)  	 
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_FuBenLifeStep,  1  )
	 	 return
	 end  
	 


end

x002052_g_Npc_1=  {  {id=43963,x=140,y=63,script=-1,pp=0,camp=110,ai=21,af=242},}
x002052_g_Npc_2=  {  {id=15606,x=71,y=28,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_3=  {  {id=15606,x=30,y=38,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_4=  {  {id=15606,x=27,y=58,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_5=  {  {id=15606,x=30,y=98,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_6=  {  {id=15606,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_7=  {  {id=15606,x=80,y=88,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_8=  {  {id=15606,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},}
x002052_g_Npc_9=  {  {id=15749,x=66,y=60,script=-1,pp=0,camp=110,ai=21,af=242},}

--**********************************
--  sinh thành nhÕc lão Tam sau , nß½ng theo cà ra ðích ti¬u quái 
--**********************************
function  x002052_CreateMonster_1(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_1    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end
function  x002052_CreateMonster_2(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_2    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end
function  x002052_CreateMonster_3(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_3    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end
function  x002052_CreateMonster_4(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_4    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end
function  x002052_CreateMonster_5(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_5    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end

function  x002052_CreateMonster_6(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_6    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end

function  x002052_CreateMonster_7(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_7    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end
function  x002052_CreateMonster_8(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_8    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end


function  x002052_CreateMonster_9(sceneId)
	 for  i,  Npc  in  x002052_g_Npc_9    do
	 	 local  nNpcId  =  x002052_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.y,  Npc.ai,  Npc.af,  Npc.script)
                  SetUnitReputationID(sceneId,  nNpcId,  nNpcId,  28)
	 end
end

function  x002052_ClearMonsterByName(sceneId,  szName)
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  nMonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  GetName(sceneId,  nMonsterId)==  szName    then
	 	 	 LuaFnDeleteMonster(sceneId,  nMonsterId)
	 	 end
	 end
end

--**********************************
--  thông døng khai sáng quái v§t hàm s¯ 
--**********************************
function  x002052_CreateNpc(sceneId,  NpcId,  x,  y,  Ai,  AiFile,  Script)
	 local  nMonsterId  =  LuaFnCreateMonster(sceneId,  NpcId,  x,  y,  Ai,  AiFile,  Script)
	 --SetLevel(sceneId,  nMonsterId,GetLevel(sceneId,selfId))
	 return  nMonsterId
end
--**********************************
--Tick Phiªu Mi¬u Phong tính gi¶ khí ....
--**********************************
function  x002052_TickPMFTimer(  sceneId,  nowTime  )

	 local  step  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerStep  )
	 if  step  <=  0  then
	 	 return
	 end
	 
	 
	 local  scriptID  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerScriptID  )

	 -- tr· v« ði«u chï ð¸nh chân v¯n ðích OnTimer....
	 CallScriptFunction(  scriptID,  "OnPMFTimer",  sceneId,  step  )

	 -- nªu nhß ðã ði hªt t¤t cä step là t¡t tính gi¶ khí ....
	 step  =  step  -  1
	 if  step  <=  0  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerStep,  0  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerScriptID,  -1  )
	 else
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerStep,  step  )
	 end

end

--**********************************
-- m· ra Phiªu Mi¬u Phong tính gi¶ khí ....
--**********************************
function  x002052_OpenPMFTimer(  sceneId,  allstep,  ScriptID  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerStep,  allstep  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerScriptID,  ScriptID  )
end

--**********************************
-- trß¾c m£t Phiªu Mi¬u Phong tính gi¶ khí có hay không kích hoÕt ....
--**********************************
function  x002052_IsPMFTimerRunning(  sceneId  )
	 local  step  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_PMFTimerStep  )
	 if  step  >  0  then
	 	 return  1
	 else
	 	 return  0
	 end

end

--**********************************
--Tick ô lão ðÕi tØ vong tính gi¶ khí ....
--**********************************
function  x002052_TickMuRongFuDieTimer(  sceneId,  nowTime  )
	 local  step  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieStep  )
	 if  step  <=  0  then
	 	 return
	 end
	 local  scriptID  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieScriptID  )
	 local  posX  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosX  )
	 local  posY  =  LuaFnGetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosY  )

	 -- tr· v« ði«u chï ð¸nh chân v¯n ðích OnTimer....
	 CallScriptFunction(  scriptID,  "OnJiuMoZhiDieTimer",  sceneId,  step,  posX,  posY  )

	 -- nªu nhß ðã ði hªt t¤t cä step là t¡t tính gi¶ khí ....
	 step  =  step  -  1
	 if  step  <=  0  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieStep,  0  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieScriptID,  -1  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosX,  0  )
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosY,  0  )
	 else
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieStep,  step  )
	 end

end

--**********************************
-- m· ra ô lão ðÕi tØ vong tính gi¶ khí ....
--**********************************
function  x002052_OpenMuRongFuDieTimer(  sceneId,  allstep,  ScriptID,  posX,  posY  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieStep,  allstep  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDieScriptID,  ScriptID  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosX,  posX  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x002052_g_IDX_MuRongFuDiePosY,  posY  )

end
--**********************************
-- khai sáng chï ð¸nh BOSS....
--**********************************
function  x002052_CreateBOSS(  sceneId,  name,  x,  y  )
	 local  BOSSData  =  x002052_g_BOSSList[name]
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
	 SetUnitReputationID(sceneId,  selfId,  MstId,  8)      --by  yaya
SetNPCAIType(sceneId,  MstId,3)	 
	 --SetUnitCampID(sceneId,  MstId,  MstId,  0)
	 --SetObjDir(  sceneId,  MstId,  BOSSData.Dir  )
	 SetMonsterFightWithNpcFlag(  sceneId,  MstId,1  )
	 if  BOSSData.Title  ~=  ""  then
	 	 SetCharacterTitle(sceneId,  MstId,  BOSSData.Title)
	 end
	 LuaFnSendSpecificImpactToUnit(sceneId,  MstId,  MstId,  MstId,  152,  0)
	 -- th¯ng kê khai sáng BOSS....
	 --AuditPMFCreateBoss(  sceneId,  BOSSData.DataID  )
	 return  MstId

end

--**********************************
-- thü tiêu chï ð¸nh BOSS....
--**********************************
function  x002052_DeleteBOSS(  sceneId,  name  )
	 local  BOSSData  =  x002052_g_BOSSList[name]
	 if  not  BOSSData  then
	 	 return
	 end
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  BOSSData.DataID  ==  GetMonsterDataID(  sceneId,  MonsterId  )  then
	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  MonsterId,  MonsterId,  MonsterId,  152,  0)
	 	 	 SetCharacterDieTime(  sceneId,  MonsterId,  1000  )
	 	 end
	 end

end
--**********************************
-- tìm kiªm chï ð¸nh BOSS....
--**********************************
function  x002052_FindBOSS(  sceneId,  name  )
	 local  BOSSData  =  x002052_g_BOSSList[name]
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


---------------------- a a bän ----------
x002052_SkillABC_CD	 =	 20000
x002052_SkillD_CD	 	 =  5000
--**********************************
-- m¾i b¡t ð¥u hóa ....
--**********************************
function  x002052_OnInit(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x002052_ResetMyAI(  sceneId,  selfId  )
end


--**********************************
-- nh¸p tim ....
--**********************************


function  x002052_OnHeartBeat(sceneId,  selfId,  nTick)
	 -- ki¬m tr¡c có phäi hay không chªt ....
	 if  LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  then
	 	 return
	 end
	 -- ki¬m tr¡c có hay không không có · ðây trÕng thái chiªn ð¤u ....
	 --if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId  )  then
	 --	 return
	 --end
	 
	 --ABC kÛ nång nh¸p tim ....
	 if  1  ==  x002052_TickSkillABC(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end
	 --D kÛ nång nh¸p tim ....
	 if  1  ==  x002052_TickSkillD(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end
--MonsterTalk(  sceneId,  -1,  "",  nTick  )

end
--**********************************
-- tiªn vào chiªn ð¤u ....
--**********************************
function  x002052_OnEnterCombat(sceneId,  selfId,  enmeyId)
	 --MonsterTalk(  sceneId,  -1,  "",  "CCCCCC"  )
	 
	 -- thêm m¾i b¡t ð¥u buff....
--	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x002052_Buff_MianYi1,  0  )
	 --LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x002052_Buff_MianYi2,  0  )
	 -- n£ng ðßa AI....
	 x002052_ResetMyAI(  sceneId,  selfId  )
	 -- thiªt trí tiªn vào trÕng thái chiªn ð¤u ....
--	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,    1  )

end
--**********************************
-- r¶i ði chiªn ð¤u ....
--**********************************
function  x002052_OnLeaveCombat(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x002052_ResetMyAI(  sceneId,  selfId  )
	 -- thü tiêu mình ....
	 LuaFnDeleteMonster(  sceneId,  selfId  )
	 -- khai sáng ð¯i thoÕi NPC....
	 --local  MstId  =  CallScriptFunction(  (890066),  "CreateBOSS",  sceneId,  "MuRongFu_NPC",  -1,  -1  )
--	 SetUnitReputationID(  sceneId,  MstId,  MstId,  0  )

end


--**********************************
-- n£ng ðßa AI....
--**********************************
function  x002052_ResetMyAI(  sceneId,  selfId  )
	 -- n£ng ðßa tham s± ....
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  1,  2000  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  2,  1  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  3,  25000  )
	 --MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  1,  0  )
	 -- cho t¤t cä m÷i ngß¶i thanh tr× D ðích buff....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnCancelSpecificImpact(  sceneId,  nHumanId,  6060  )
	 	 end
	 end

end


--**********************************
--ABC kÛ nång nh¸p tim ....
--**********************************
function  x002052_TickSkillABC(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  1  )
	 if  cd  >  nTick  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  1,  cd-nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  1,  x002052_SkillABC_CD-(nTick-cd)  )

	 	 local  CurSkill  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  2  )
	 	 if  CurSkill  ==  1  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  2,  2  )
	 	 	 return  x002052_UseSkillA(  sceneId,  selfId  )
	 	 elseif  CurSkill  ==  2  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  2,  3  )
	 	 	 return  x002052_UseSkillB(  sceneId,  selfId  )
	 	 elseif  CurSkill  ==  3  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  2,  1  )
	 	 	 return  x002052_UseSkillC(  sceneId,  selfId  )
	 	 end

	 end

end


--**********************************
--D kÛ nång nh¸p tim ....
--**********************************
function  x002052_TickSkillD(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  3  )
	 if  cd  >  nTick  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  3,  cd-nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  3,  x002052_SkillD_CD-(nTick-cd)  )
	 	 return  x002052_UseSkillD(  sceneId,  selfId  )

	 end

end


--**********************************
-- sØ døng A kÛ nång ....
--**********************************
function  x002052_UseSkillA(  sceneId,  selfId  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  561,  selfId,  x,  z,  0,  1  )  -- sØ døng kÛ nång 
	 return  1

end


--**********************************
-- sØ døng B kÛ nång ....
--**********************************
function  x002052_UseSkillB(  sceneId,  selfId  )

	 -- phó bän trung hæu hi®u ðích nhà ch½i ðích li®t bi¬u ....
	 local  PlayerList  =  {}

	 -- ðem hæu hi®u ngß¶i cüa gia nh§p li®t bi¬u ....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 PlayerList[i+1]  =  nHumanId
	 	 end
	 end

	 -- ngçu nhiên ch÷n lña mµt nhà ch½i ....
	 local  numPlayer  =  getn(PlayerList)
	 if  numPlayer  <=  0  then
	 	 return  0
	 end
	 local  PlayerId  =  PlayerList[  random(numPlayer)  ]

	 -- ð¯i v¾i kÏ sØ døng kÛ nång ....
	 local  x,z  =  GetWorldPos(  sceneId,  PlayerId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  562,  PlayerId,  x,  z,  0,  1  )  -- sØ døng kÛ nång 


MonsterTalk(  sceneId,  -1,  "",  ""  )


	 -- cho kÏ thêm buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  PlayerId,  6235,  0  )  -- cho buff
	 return  1
end
--**********************************
-- sØ døng C kÛ nång ....
--**********************************
function  x002052_UseSkillC(  sceneId,  selfId  )
	 -- ðÕt ðßþc trß¾c m£t ð¸ch nhân ....
	 local  enemyId  =  GetMonsterCurEnemy(  sceneId,  selfId  )
	 if  enemyId  <=  0  then
	 	 return  0
	 end
	 if  GetCharacterType(  sceneId,  enemyId  )  ==  3  then
	 	 enemyId  =  GetPetCreator(  sceneId,  enemyId  )
	 end
	 -- · nên ð¸ch nhân dß¾i chân ð¬ cá bçy r§p ....
	 local  x,z  =  GetWorldPos(  sceneId,  enemyId  )
	 CreateSpecialObjByDataIndex(  sceneId,  selfId,  54,  x,  z,  0  )    --CreateSpecialObjByDataIndex    hi®u quä 

	 -- kêu thoÕi ....
	 MonsterTalk(  sceneId,  -1,  "",  "#{JCLY_160411_190}"  )
	 -- ð¯i v¾i mình sØ døng mµt chï có ð£c hi®u ðích vô ích kÛ nång ....
	 x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  560,  selfId,  x,  z,  0,  1  )    -- sØ døng kÛ nång 
	 return  1
end
--**********************************
-- sØ døng D kÛ nång ....
--**********************************
function  x002052_UseSkillD(  sceneId,  selfId  )
	 -- cho phó bän trong t¤t cä m÷i ngß¶i thêm buff....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  nHumanId,  6060,  0  )    -- cho buff
	 	 end
	 end

end
