--圣兽山宝箱争夺
--大宝箱NPC交互脚本

--脚本号
x900039_g_ScriptId	= 900039

--圣兽山宝箱争夺活动脚本
x900039_g_ActivityScriptId	= 900052
x900039_g_mynummax =0 --7
x900039_g_dirennummax = 1
x900039_g_hudongtongmennum = 0 --10
x900039_g_ActivityMainScriptId	= 900014
--受限buff....
x900039_g_LimitiBuff = {

			50,
			112,
			1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,
			1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,
			7084,
			7085,

}


--**********************************
--特殊交互:条件判断
--**********************************
function x900039_OnActivateConditionCheck( sceneId, selfId, activatorId )
    local isornottiem = CallScriptFunction( x900039_g_ActivityMainScriptId, "GetIsInTime", sceneId, activatorId )
	if isornottiem == 0 then
	BeginEvent(sceneId)
	AddText(sceneId,"非活动时间不能祭旗！！")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,activatorId)
	return 0
	end
	local strText = "当前状态无法开启"
	--无敌状态无法开启宝箱....
	if LuaFnIsUnbreakable(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,strText)
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--隐身状态无法开启宝箱....
	if LuaFnIsConceal(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,strText)
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--受限buff无法开启....
	for i, impactId in x900039_g_LimitiBuff do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, activatorId, impactId) == 1 then
			BeginEvent(sceneId)
			 		AddText(sceneId,strText)
			 	EndEvent(sceneId)
			DispatchMissionTips(sceneId,activatorId)
			return 0
		end
	end
                local   GuildLeagueID  = LuaFnGetHumanGuildLeagueID( sceneId, activatorId )
	        local	GuildName	= LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
	--检测背包是否有地方....
	if GuildLeagueID == -1 or  GuildName =="" then
		BeginEvent(sceneId)
			AddText( sceneId, "您没有同盟不能祭旗" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end



	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )

            if MosDataID == 45464 then
        local a,b = GetWorldPos( sceneId, MonsterId )
        local x,z = floor(a),floor(b)
		local MosDataName = GetName( sceneId, MonsterId )
           if ""..GuildName.."同盟大旗" ~= MosDataName then
		BeginEvent(sceneId)
		 		AddText(sceneId,"注意：["..MosDataName.."]为可移动大旗，["..MosDataName.."] 已经祭起现在的坐标为("..x..","..z.."),你得击败["..MosDataName.."]后，才能祭旗");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
                else
		BeginEvent(sceneId)
		 		AddText(sceneId,"您的同盟大旗已经祭起，不能重复祭旗。注意：["..MosDataName.."]为可移动大旗已经祭起现在的坐标为("..x..","..z..")，距离["..MosDataName.."]10米范围内的同盟成员越多得到的奖励越多");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
        end
	end
	--检测是否可以开大宝箱....
	local bRet, PlayerName = CallScriptFunction( x900039_g_ActivityScriptId, "CheckOpenBigBox", sceneId, activatorId )

	if bRet == 0 then
		BeginEvent(sceneId)
				AddText(sceneId,"别人已经祭了旗你不能祭旗");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	if bRet == -1 then
		BeginEvent(sceneId)
		 		AddText(sceneId, PlayerName.."正在祭旗，您暂时无法操作");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	return 1

end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x900039_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x900039_OnActivateEffectOnce( sceneId, selfId, activatorId )
    local isornottiem = CallScriptFunction( x900039_g_ActivityMainScriptId, "GetIsInTime", sceneId, activatorId )
	if isornottiem == 0 then
	BeginEvent(sceneId)
	AddText(sceneId,"非活动时间不能祭旗！！")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,activatorId)
	return 0
	end
    local   GuildLeagueID  = LuaFnGetHumanGuildLeagueID( sceneId, activatorId )
	local	GuildName	= LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
	--检测背包是否有地方....
	if GuildLeagueID == -1 or  GuildName =="" then
		BeginEvent(sceneId)
			AddText( sceneId, "您没有同盟不能祭旗" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )

            if MosDataID == 45464 then
        local a,b = GetWorldPos( sceneId, MonsterId )
        local x,z = floor(a),floor(b)
		local MosDataName = GetName( sceneId, MonsterId )
           if ""..GuildName.."同盟大旗" ~= MosDataName then
		BeginEvent(sceneId)
		 		AddText(sceneId,"注意：["..MosDataName.."]为可移动大旗，["..MosDataName.."] 已经祭起现在的坐标为("..x..","..z.."),你得击败["..MosDataName.."]后，才能祭旗");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
                else
		BeginEvent(sceneId)
		 		AddText(sceneId,"您的同盟大旗已经祭起，不能重复祭旗。注意：["..MosDataName.."]为可移动大旗已经祭起现在的坐标为("..x..","..z..")，距离["..MosDataName.."]10米范围内的同盟成员越多得到的奖励越多");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
        end
	end
	CallScriptFunction( x900039_g_ActivityScriptId, "OnBigBoxOpen", sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x900039_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时的特殊处理
--**********************************
function x900039_OnActivateActionStart( sceneId, selfId, activatorId )
		return 1
end

--**********************************
--特殊交互:交互撤消时的特殊处理
--**********************************
function x900039_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--特殊交互:交互中断时的特殊处理
--**********************************
function x900039_OnActivateInterrupt( sceneId, selfId, activatorId )
    local isornottiem = CallScriptFunction( x900039_g_ActivityMainScriptId, "GetIsInTime", sceneId, activatorId )
	if isornottiem == 0 then
	BeginEvent(sceneId)
	AddText(sceneId,"非活动时间不能祭旗！！")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,activatorId)
	return 0
	end
    local   GuildLeagueID  = LuaFnGetHumanGuildLeagueID( sceneId, activatorId )
	local	GuildName	= LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
	--检测背包是否有地方....
	if GuildLeagueID == -1 or  GuildName =="" then
		BeginEvent(sceneId)
			AddText( sceneId, "您没有同盟不能祭旗" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )

            if MosDataID == 45464 then
        local a,b = GetWorldPos( sceneId, MonsterId )
        local x,z = floor(a),floor(b)
		local MosDataName = GetName( sceneId, MonsterId )
           if ""..GuildName.."同盟大旗" ~= MosDataName then
		BeginEvent(sceneId)
		 		AddText(sceneId,"注意：["..MosDataName.."]为可移动大旗，["..MosDataName.."] 已经祭起现在的坐标为("..x..","..z.."),你得击败["..MosDataName.."]后，才能祭旗");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
                else
		BeginEvent(sceneId)
		 		AddText(sceneId,"您的同盟大旗已经祭起，不能重复祭旗。注意：["..MosDataName.."]为可移动大旗已经祭起现在的坐标为("..x..","..z..")，距离["..MosDataName.."]10米范围内的同盟成员越多得到的奖励越多");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
        end
	end
	CallScriptFunction( x900039_g_ActivityScriptId, "OnCancelOpen", sceneId )
	return 0
end

