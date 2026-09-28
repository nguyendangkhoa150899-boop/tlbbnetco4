--缥缈峰副本....   ____、飞翔 By：403413393 修复

--脚本号
x050000_g_ScriptId = 050000
x050000_g_CopySceneType = FUBEN_HUANJING	--副本类型，定义在ScriptGlobal.lua里面
x050000_g_TickTime		= 1				--回调脚本的时钟时间（单位：秒/次）
x050000_g_NoUserTime	= 10			--副本中没有人后可以继续保存的时间（单位：秒）
x050000_g_Fuben_X			= 66			--进入副本的位置X
x050000_g_Fuben_Z			= 57			--进入副本的位置Z
x050000_g_FuBenTime		= 1*60*60	--副本关闭时间....
--BOSS表....
x050000_g_BOSSList =
{
	["JiuMoZhi_NPC"]				= { DataID=15601, Title="#G幻境接引使", posX=60, posY=50, Dir=0, BaseAI=3, AIScript=0, ScriptID=050000},
	["JiuMoZhi_BOSS"]		= { DataID=42966, Title="少室山室主", posX=60, posY=50, Dir=27, BaseAI=27, AIScript=0, ScriptID=890069 },
}

x050000_g_FightBOSSList =
{
	[1] = x050000_g_BOSSList["JiuMoZhi_BOSS"].DataID,
}

--场景变量索引....是否可以挑战某个BOSS的标记....
-- 0=不能挑战 1=可以挑战 2=已经挑战过了
x050000_g_IDX_BattleFlag_JiuMoZhi			= 8
x050000_g_IDX_BattleFlag_ZhuangJuXian	= 9
x050000_g_IDX_BattleFlag_MuRongFu		= 10
x050000_g_IDX_BattleFlag_Shuangzi		= 11
x050000_g_IDX_BattleFlag_DingChunQiu	= 12
x050000_g_IDX_FuBenOpenTime		= 13	--副本建立的时间....
x050000_g_IDX_FuBenLifeStep		= 14	--副本生命期的step....(包括建立NPC....关闭倒计时提示....)
--场景变量索引....通用的缥缈峰计时器....主要用于激活BOSS战斗....
x050000_g_IDX_PMFTimerStep			= 15
x050000_g_IDX_PMFTimerScriptID	= 16
--场景变量索引....乌老大死亡的计时器....用于处理死亡逻辑....
x050000_g_IDX_MuRongFuDieStep				= 17
x050000_g_IDX_MuRongFuDieScriptID		= 18
x050000_g_IDX_MuRongFuDiePosX				=	19 
x050000_g_IDX_MuRongFuDiePosY				=	20
--**********************************
--任务入口函数....
--**********************************
function x050000_OnDefaultEvent( sceneId, selfId, targetId )
BeginEvent(sceneId)
AddText( sceneId, "    开启试炼之后，八个神殿会按照顺序刷出怪物，需要在短时间内迅速清理各殿的怪物，同时也可获取大量经验，你准备好了吗？" )
AddNumText( sceneId, x050000_g_ScriptId, "开始挑战",6 ,7  )
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

function x050000_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi, 1 )	
	x050000_TipAllHuman( sceneId, "开启挑战成功" )	
	return 0
	end 	
	--检测是否可以进入副本....
	local ret, msg = x050000_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
		AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--关闭NPC对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x050000_MakeCopyScene( sceneId, selfId )
	
	
end	

--**********************************
--列举事件
--**********************************
function x050000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x050000_g_ScriptId, "#G进入试炼", 10, 1 )
end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x050000_CheckCanEnter( sceneId, selfId, targetId )

	--是否有队伍....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end
	
	
	
	
if LuaFnGetAvailableItemCount(sceneId, selfId, 20310193)<1 then
return 0, "您没有试炼牌子"	
end	
	--人数是否够....
	if GetTeamSize(sceneId,selfId) < 3 then
		return 0, "#{PMF_20080521_04}"
	end

	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--是否有人不够90级....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 80 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "    队伍当中的"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "的修为尚浅\，还是不要去为妙。"
		return 0, msg

	end


	--是否有人今天做过3次了....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_LINGQUZHAOPAI_HAVESENDMAIL )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 5 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = "    "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "本日已经挑战过5次天龙幻境了。"
		return 0, msg

	end
DelItem(sceneId,selfId,20310193,1)
	return 1,msg

end

--**********************************
--创建副本....
--**********************************
function x050000_MakeCopyScene( sceneId, selfId )
	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "tianlonghuanjing.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x050000_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x050000_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x050000_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x050000_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_ZhuangJuXian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_MuRongFu, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "tianlonghuanjing_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "tianlonghuanjing_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--副本事件....
--**********************************
function x050000_OnCopySceneReady( sceneId, destsceneId )
	--进入副本的规则
	-- 1，如果这个玩家没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--统计创建副本次数....
	--AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x050000_g_Fuben_X, x050000_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x050000_g_Fuben_X, x050000_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x050000_g_Fuben_X, x050000_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x050000_OnCopySceneTimer( sceneId, nowTime )

	x050000_TickFubenLife( sceneId, nowTime )

	x050000_TickPMFTimer( sceneId, nowTime )

	x050000_TickMuRongFuDieTimer( sceneId, nowTime )
	
	
--x050000_TipAllHuman( sceneId,nowTime )
end

--**********************************
--有玩家进入副本事件....
--**********************************
function x050000_OnPlayerEnter( sceneId, selfId )

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050000_g_Fuben_X, x050000_g_Fuben_Z )

	--设置挑战过一次缥缈峰....
	local lastTime = GetMissionData( sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL, lastTime )


end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x050000_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x050000_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick副本生命期....
--**********************************
function x050000_TickFubenLife( sceneId, nowTime )
	local openTime = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x050000_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep )
	if lifeStep == 15 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 16 )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 15 )
		x050000_TipAllHuman( sceneId, "副本将在1秒後关闭。" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 14 )
		x050000_TipAllHuman( sceneId, "副本将在2秒後关闭。" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 13 )
		x050000_TipAllHuman( sceneId, "副本将在3秒後关闭。" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 12 )
		x050000_TipAllHuman( sceneId, "副本将在4秒後关闭。" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 11 )
		x050000_TipAllHuman( sceneId, "副本将在5秒後关闭。" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 10 )
		x050000_TipAllHuman( sceneId, "副本将在10秒後关闭。" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 9 )
		x050000_TipAllHuman( sceneId, "副本将在30秒後关闭。" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 8 )
		x050000_TipAllHuman( sceneId, "副本将在1分钟後关闭。" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 7 )
		x050000_TipAllHuman( sceneId, "副本将在2分钟後关闭。" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 6 )
		x050000_TipAllHuman( sceneId, "副本将在3分钟後关闭。" )
		return
	end
	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 5 )
		x050000_TipAllHuman( sceneId, "副本将在5分钟後关闭。" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 4 )
		x050000_TipAllHuman( sceneId, "副本将在15分钟後关闭。" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 3 )
		x050000_TipAllHuman( sceneId, "副本将在30分钟後关闭。" )
		return
	end



	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 2 )
		x050000_TipAllHuman( sceneId, "副本将在60分钟後关闭。" )
		return
	end

	--初始化副本内的NPC....
	if lifeStep == 0 then
		local MstId = x050000_CreateBOSS( sceneId, "JiuMoZhi_NPC", -1, -1 )
		SetUnitCampID(sceneId, MstId, MstId, 0)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_FuBenLifeStep, 1 )
		return
	end
	if	LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==1 then
		x050000_ClearMonsterByName(sceneId, "若梦")
		x401040_CreateMonster_1(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
		x050000_TipAllHuman( sceneId, "速度前往(天神殿)消灭怪1分钟后出现第二波怪在(龙王殿)" )
	end
	--	x050000_TipAllHuman( sceneId, LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime )
  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==2 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_2(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "怪物已经出现在(龙王殿)消灭怪1分钟后出现第三波怪在(夜叉殿)" )
  end

  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==3 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_3(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "怪物已经出现在(夜叉殿)消灭怪1分钟后出现第四波怪在(修罗殿)" )
  end
  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==4 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_4(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "怪物已经出现在(修罗殿)消灭怪1分钟后出现第五波怪在(乾达罗殿)" )
  end

  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==5 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_5(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "怪物已经出现在(乾达罗殿)消灭怪1分钟后出现第六波怪在(迦楼罗殿)" )
  end

  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==6 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_6(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "怪物已经出现在(迦楼罗殿)消灭怪1分钟后出现第七波怪在(紧纳罗殿)" )
  end
  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==7 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_7(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "怪物已经出现在(紧纳罗殿)消灭怪1分钟后出现第八波怪在(摩呼罗迦殿)" )
  end
  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==8 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_8(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	x050000_TipAllHuman( sceneId, "怪物已经出现在(摩呼罗迦殿)消灭怪2分钟后出现顶级BOSS" )
  end
  
  if LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi ) ==9 and  LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu) - leftTime  >120 then 
		x401040_CreateMonster_9(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x050000_TipAllHuman( sceneId, "3分钟后顶级BOSS已经出现在坐标(58,61)速度消灭吧" )
  end
end

x401040_g_Npc_1= {   
{id=15609,x=71,y=28,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=70,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=69,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=68,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=67,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=66,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=65,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=64,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=63,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=62,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=61,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=71,y=28,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=70,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=69,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=68,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=67,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=66,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=65,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=64,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=63,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=62,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=61,y=38,script=-1,pp=0,camp=110,ai=21,af=234},

{id=15645,x=61,y=38,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS
}
x401040_g_Npc_2= {    
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},

{id=15645,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS
}

x401040_g_Npc_3= {   
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=97,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=98,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=99,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=55,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=97,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=98,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=99,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=55,script=-1,pp=0,camp=110,ai=21,af=234},

{id=15653,x=99,y=55,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS
}

x401040_g_Npc_4= {  
{id=15621,x=80,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=81,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=82,y=80,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=83,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=84,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=85,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=86,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=87,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=88,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=89,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=90,y=93,script=-1,pp=0,camp=110,ai=21,af=234},  
{id=15621,x=80,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=81,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=82,y=80,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=83,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=84,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=85,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=86,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=87,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=88,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=89,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=90,y=93,script=-1,pp=0,camp=110,ai=21,af=234},  

{id=15657,x=90,y=93,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS  
}

x401040_g_Npc_5= {  
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=98,script=-1,pp=0,camp=110,ai=21,af=234},  
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=98,script=-1,pp=0,camp=110,ai=21,af=234},  

{id=15661,x=55,y=98,script=-1,pp=0,camp=110,ai=21,af=234}, --领头BOSS 
}

x401040_g_Npc_6= {    
{id=15629,x=30,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=31,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=32,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=33,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=34,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=36,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=37,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=38,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=39,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=95,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=30,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=31,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=32,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=33,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=34,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=36,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=37,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=38,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=39,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=95,script=-1,pp=0,camp=110,ai=21,af=234},

{id=15665,x=35,y=95,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS
}

x401040_g_Npc_7= {    
{id=15633,x=27,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=27,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=26,y=62,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=63,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=64,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=65,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=66,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=27,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=27,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=26,y=62,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=63,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=64,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=65,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=66,script=-1,pp=0,camp=110,ai=21,af=234},

{id=15669,x=25,y=66,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS
}

x401040_g_Npc_8= {    
{id=15637,x=30,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=31,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=32,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=33,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=34,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=36,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=37,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=38,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=39,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=30,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=31,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=32,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=33,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=34,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=36,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=37,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=38,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=39,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},

{id=15673,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},--领头BOSS
}

x401040_g_Npc_9= {    
{id=15605,x=66,y=60,script=-1,pp=0,camp=110,ai=21,af=242},--BOSS
}

--**********************************
-- 生成岳老三之后，伴随刷出的小怪
--**********************************
function x401040_CreateMonster_1(sceneId)
	for i, Npc in x401040_g_Npc_1  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end


function x401040_CreateMonster_2(sceneId)
	for i, Npc in x401040_g_Npc_2  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_3(sceneId)
	for i, Npc in x401040_g_Npc_3  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_4(sceneId)
	for i, Npc in x401040_g_Npc_4  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_5(sceneId)
	for i, Npc in x401040_g_Npc_5  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x401040_CreateMonster_6(sceneId)
	for i, Npc in x401040_g_Npc_6  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x401040_CreateMonster_7(sceneId)
	for i, Npc in x401040_g_Npc_7  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_8(sceneId)
	for i, Npc in x401040_g_Npc_8  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x401040_CreateMonster_9(sceneId)
	for i, Npc in x401040_g_Npc_9  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x050000_ClearMonsterByName(sceneId, szName)
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
end

--**********************************
-- 通用创建怪物函数
--**********************************
function x401040_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script)
	local nMonsterId = LuaFnCreateMonster(sceneId, NpcId, x, y, Ai, AiFile, Script)
	--SetLevel(sceneId, nMonsterId,GetLevel(sceneId,selfId))
	return nMonsterId
end
--**********************************
--Tick缥缈峰计时器....
--**********************************
function x050000_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	
	
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerScriptID )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--开启缥缈峰计时器....
--**********************************
function x050000_OpenPMFTimer( sceneId, allstep, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerScriptID, ScriptID )
end

--**********************************
--当前缥缈峰计时器是否激活....
--**********************************
function x050000_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick乌老大死亡计时器....
--**********************************
function x050000_TickMuRongFuDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosY )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnJiuMoZhiDieTimer", sceneId, step, posX, posY )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieStep, step )
	end

end

--**********************************
--开启乌老大死亡计时器....
--**********************************
function x050000_OpenMuRongFuDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x050000_g_IDX_MuRongFuDiePosY, posY )

end
--**********************************
--创建指定BOSS....
--**********************************
function x050000_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x050000_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)
	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)
	--统计创建BOSS....
	--AuditPMFCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--删除指定BOSS....
--**********************************
function x050000_DeleteBOSS( sceneId, name )

	local BOSSData = x050000_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--寻找指定BOSS....
--**********************************
function x050000_FindBOSS( sceneId, name )

	local BOSSData = x050000_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--检测当前是否已经存在一个BOSS了....
--**********************************
function x050000_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x050000_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end
	if nBossNum > 0 then
		local msg = "正与"
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. "，"
		end
		msg = msg .. BossList[nBossNum-1] .. "战斗中"
		return 1, msg
	end

	return 0, ""

end

