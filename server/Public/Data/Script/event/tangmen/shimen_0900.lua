--找人任务
--唐岳天寻找唐清秋
--MisDescBegin
--脚本号
x228907_g_ScriptId = 228907

--任务号
x228907_g_MissionId = 1301

--上一个任务的ID
--g_MissionIdPre =1302

--目标NPC
x228907_g_Name	="唐清秋"

--任务归类
x228907_g_MissionKind = 85

--任务等级
x228907_g_MissionLevel = 10

--是否是精英任务
x228907_g_IfMissionElite = 0

--任务名
x228907_g_MissionName="#cFF0000为师门而战"
x228907_g_MissionInfo="#{XMPTM_130123_11}"
x228907_g_MissionTarget="#{XMPTM_130123_10}"
x228907_g_MissionComplete="#{XMPTM_130123_12}"
x228907_g_MoneyBonus=800

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x228907_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x228907_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x228907_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x228907_g_Name then
			x228907_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x228907_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x228907_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x228907_g_MissionName)
				AddText(sceneId,x228907_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x228907_g_MissionTarget)
				--( sceneId, x228907_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x228907_g_ScriptId,x228907_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x228907_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x228907_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x228907_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x228907_g_Name then
			AddNumText(sceneId, x228907_g_ScriptId,x228907_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x228907_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x228907_g_Name then
			AddNumText(sceneId,x228907_g_ScriptId,x228907_g_MissionName,10,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x228907_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 11 then
		return 0
	else
		return 1
	end
end

--**********************************
--接受
--**********************************
function x228907_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x228907_g_MissionId, x228907_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：为师门而战",MSG2PLAYER_PARA )
end

--**********************************
--放弃
--**********************************
function x228907_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x228907_g_MissionId )
end

--**********************************
--继续
--**********************************
function x228907_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x228907_g_MissionName)
		AddText(sceneId,x228907_g_MissionComplete)
		--( sceneId, x228907_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x228907_g_ScriptId,x228907_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x228907_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228907_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x228907_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x228907_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x228907_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x228907_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x228907_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y完成任务：为师门而战",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x228907_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x228907_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x228907_OnItemChanged( sceneId, selfId, itemdataId )
end

