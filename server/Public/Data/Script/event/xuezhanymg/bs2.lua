--飘渺峰 桑土公AI

--A 【土遁】BOSS的HP每损失20%则会消失20秒....同时创建小怪依次为1122只..死亡or脱离战斗消失....
--B 【牛毛毒针】非土遁状态时每隔20一次大范围攻击....土遁状态下CD正常走只是不使用....土遁结束时清CD....
--C 【出土文物】进入土遁时随机获得2个buff....同时清除上次的2个buff....
--D 【疯狂】战斗20分钟后给自己和所有僵尸加一击致命buff....不再使用AB(C)....

--全程都带有免疫制定技能的buff....
--脱离战斗或死亡时删除僵尸....


--脚本号
x391212_g_ScriptId	= 391212

--副本逻辑脚本号....
x391212_g_FuBenScriptId = 391200


--免疫特定技能buff....
x391212_Buff_MianYi1	= 10472	--免疫一些负面效果....
x391212_Buff_MianYi2	= 10471	--免疫普通隐身....

--A号令天下....
x391212_SkillA_TuDun				= 1028
x391212_SkillA_ChildName		= "天雷"
x391212_SkillA_ChildBuff		= 10246
x391212_SkillA_ChildTime		= 5000		--土遁多长时间后开始刷小怪....
x391212_SkillA_Time					= 20000		--土遁持续的时间....


--B金戈铁马....
x391212_SkillB_NiuMaoDuZhen = 1830
--冷却时间....
x391212_SkillB_CD						= 13000


--C四属性之力的buff列表....
x391212_SkillC_ChutuBuff1 = { 10237, 10238 }
x391212_SkillC_ChutuBuff2 = { 10239, 10240, 10241, 10242 }


--开始进入狂暴状态的时间....
x391212_EnterKuangBaoTime	= 90*1000


--AI Index....
x391212_IDX_HPStep							= 1	--血量级别....
x391212_IDX_SkillB_CD						= 2	--B技能的CD时间....
x391212_IDX_KuangBaoTimer				= 3	--狂暴的计时器....
x391212_IDX_TuDunTimer					= 4	--土遁的计时器....用于计算何时土遁结束....
x391212_IDX_NeedCreateChildNum	= 5	--需要创建的小怪的数量....
x391212_IDX_TuDunTimer1					= 6	--土遁的计时器....用于计算何时土遁结束....

x391212_IDX_CombatFlag 			= 1	--是否处于战斗状态的标志....
x391212_IDX_IsTudunMode			= 2	--是否处于土遁模式的标志....
x391212_IDX_IsKuangBaoMode	= 3	--是否处于狂暴模式的标志....


--**********************************
--初始化....
--**********************************
function x391212_OnInit(sceneId, selfId)
	--重置AI....
	x391212_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x391212_OnHeartBeat(sceneId, selfId, nTick)
	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x391212_IDX_CombatFlag ) then
		return
	end
	--狂暴状态不需要走逻辑....
	x391212_DoSkillD_KuangBao( sceneId, selfId, nTick )
	--执行土遁逻辑....
	x391212_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--执行牛毛毒针逻辑....
	x391212_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

end


--**********************************
--进入战斗....
--**********************************
function x391212_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x391212_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x391212_Buff_MianYi2, 0 )

	--重置AI....
	x391212_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x391212_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x391212_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x391212_ResetMyAI( sceneId, selfId )
	x391212_axiao11( sceneId, 2 )
end


--**********************************
--杀死敌人....
--**********************************
function x391212_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x391212_OnDie( sceneId, selfId, killerId )

	CallScriptFunction( 391200, "SetBossBattleFlag", sceneId, 5)	
	local	playerName	= GetName( sceneId, killerId )
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
		str = format("#{_INFOUSR%s}#{PMF_8812_02}", playerName); --桑土公
		AddGlobalCountNews( sceneId, str )
	
end


--**********************************
--重置AI....
--**********************************
function x391212_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_SkillB_CD, x391212_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x391212_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x391212_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x391212_IDX_IsKuangBaoMode, 0 )


end


--**********************************
--土遁逻辑....
--**********************************
function x391212_SkillLogicA_TunDun( sceneId, selfId, nTick )
	if 2 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x391212_IDX_IsTudunMode ) then
	return
end
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x391212_IDX_IsTudunMode ) then
			local cda1 = x391212_axiao11( sceneId, 1 )
	if cda1 > 20000 then
		local axiao2 = random(5)
		if axiao2 == 1 then
	x391212_axiao0( sceneId )
	x391212_axiao2( sceneId )
	x391212_axiao5( sceneId )
		elseif axiao2 == 2 then
	x391212_axiao0( sceneId )
	x391212_axiao3( sceneId )
	x391212_axiao4( sceneId )
		elseif axiao2 == 3 then
	x391212_axiao0( sceneId )
	x391212_axiao3( sceneId )
	x391212_axiao5( sceneId )
		elseif axiao2 == 4 then
	x391212_axiao1( sceneId )
	x391212_axiao2( sceneId )
	x391212_axiao4( sceneId )
		elseif axiao2 == 5 then
	x391212_axiao1( sceneId )
	x391212_axiao2( sceneId )
	x391212_axiao5( sceneId )
		else
	x391212_axiao1( sceneId )
	x391212_axiao2( sceneId )
	x391212_axiao5( sceneId )
		end
		x391212_axiao11( sceneId, 2 )
	end
end
		local fhz1 = 0
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		if CurPercent >= 0.4 and CurPercent <= 0.8 then
		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x391212_IDX_IsTudunMode , 1)
		fhz1 = 1
		elseif CurPercent < 0.4 then
			if 1 == x391212_axiao12( sceneId, 1 ) then
		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x391212_IDX_IsTudunMode , 2)
			MonsterTalk( sceneId, -1, "", "天雷之力" )
			local x,z = GetWorldPos( sceneId, selfId )
		local nMonsterId201 = LuaFnCreateMonster(sceneId, 45428, x, z, 3, 128, -1 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId201, nMonsterId201, nMonsterId201, 23624, 0 )
		end
	end

end


--**********************************
--牛毛毒针逻辑....
--**********************************
function x391212_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x391212_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_SkillB_CD, x391212_SkillB_CD )
		--非土遁状态才可以用....
			local x,z = GetWorldPos( sceneId, selfId )
			MonsterTalk( sceneId, -1, "", "金戈铁马，谁人能挡" )
			LuaFnUnitUseSkill( sceneId, selfId, x391212_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
	end

	return 0

end


--**********************************
--狂暴逻辑....
--**********************************
function x391212_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--检测是否到了狂暴的时候....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x391212_IDX_KuangBaoTimer )
	if kbTime < x391212_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x391212_IDX_KuangBaoTimer, 0 )
		--加狂暴buff....
		local axiao3 = random(4)
		if axiao3 == 1 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 23610, 0 )
		elseif axiao2 == 2 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 23611, 0 )
		elseif axiao2 == 3 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 23612, 0 )
		elseif axiao2 == 4 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 23613, 0 )
		else
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 23610, 0 )
		end
			if 1 == x391212_axiao13( sceneId, 1 ) then
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45418, 114, 42, 3, 128, -1 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23620, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45419, 114, 65, 3, 128, -1 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23621, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45420, 132, 42, 3, 128, -1 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23622, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45421, 132, 65, 3, 128, -1 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23623, 0 )

	end

	end


end
function x391212_axiao0( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45422, 108, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId20, 23000)
		SetPatrolId( sceneId, nMonsterId20, 30 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23600, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45422, 110, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId19, 23000)
		SetPatrolId( sceneId, nMonsterId19, 29 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23600, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45422, 112, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 23000)
		SetPatrolId( sceneId, nMonsterId18, 28 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23600, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45422, 114, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId17, 23000)
		SetPatrolId( sceneId, nMonsterId17, 27 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23600, 0 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45422, 116, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId16, 23000)
		SetPatrolId( sceneId, nMonsterId16, 26 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId16, nMonsterId16, nMonsterId16, 23600, 0 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45422, 118, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId15, 23000)
		SetPatrolId( sceneId, nMonsterId15, 25 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId15, nMonsterId15, nMonsterId15, 23600, 0 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45422, 120, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId14, 23000)
		SetPatrolId( sceneId, nMonsterId14, 24 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId14, nMonsterId14, nMonsterId14, 23600, 0 )
end
function x391212_axiao1( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45422, 108, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId20, 23000)
		SetPatrolId( sceneId, nMonsterId20, 30 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23600, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45422, 110, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId19, 23000)
		SetPatrolId( sceneId, nMonsterId19, 29 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23600, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45422, 112, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 23000)
		SetPatrolId( sceneId, nMonsterId18, 28 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23600, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45422, 114, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId17, 23000)
		SetPatrolId( sceneId, nMonsterId17, 27 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23600, 0 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45422, 116, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId16, 23000)
		SetPatrolId( sceneId, nMonsterId16, 26 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId16, nMonsterId16, nMonsterId16, 23600, 0 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45422, 118, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId15, 23000)
		SetPatrolId( sceneId, nMonsterId15, 25 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId15, nMonsterId15, nMonsterId15, 23600, 0 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45422, 120, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId14, 23000)
		SetPatrolId( sceneId, nMonsterId14, 24 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId14, nMonsterId14, nMonsterId14, 23600, 0 )
end
function x391212_axiao2( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45422, 122, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId20, 23000)
		SetPatrolId( sceneId, nMonsterId20, 23 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23600, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45422, 124, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId19, 23000)
		SetPatrolId( sceneId, nMonsterId19, 22 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23600, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45422, 126, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 23000)
		SetPatrolId( sceneId, nMonsterId18, 21 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23600, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45422, 128, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId17, 23000)
		SetPatrolId( sceneId, nMonsterId17, 20 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23600, 0 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45422, 130, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId16, 23000)
		SetPatrolId( sceneId, nMonsterId16, 19 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId16, nMonsterId16, nMonsterId16, 23600, 0 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45422, 132, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId15, 23000)
		SetPatrolId( sceneId, nMonsterId15, 18 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId15, nMonsterId15, nMonsterId15, 23600, 0 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45422, 134, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId14, 23000)
		SetPatrolId( sceneId, nMonsterId14, 17 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId14, nMonsterId14, nMonsterId14, 23600, 0 )
end
function x391212_axiao3( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45422, 122, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId20, 23000)
		SetPatrolId( sceneId, nMonsterId20, 23 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23600, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45422, 124, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId19, 23000)
		SetPatrolId( sceneId, nMonsterId19, 22 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23600, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45422, 126, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 23000)
		SetPatrolId( sceneId, nMonsterId18, 21 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23600, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45422, 128, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId17, 23000)
		SetPatrolId( sceneId, nMonsterId17, 20 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23600, 0 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45422, 130, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId16, 23000)
		SetPatrolId( sceneId, nMonsterId16, 19 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId16, nMonsterId16, nMonsterId16, 23600, 0 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45422, 132, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId15, 23000)
		SetPatrolId( sceneId, nMonsterId15, 18 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId15, nMonsterId15, nMonsterId15, 23600, 0 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45422, 134, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId14, 23000)
		SetPatrolId( sceneId, nMonsterId14, 17 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId14, nMonsterId14, nMonsterId14, 23600, 0 )
end
function x391212_axiao4( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45422, 136, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId20, 23000)
		SetPatrolId( sceneId, nMonsterId20, 16 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23600, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45422, 138, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId19, 23000)
		SetPatrolId( sceneId, nMonsterId19, 15 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23600, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45422, 140, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 23000)
		SetPatrolId( sceneId, nMonsterId18, 14 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23600, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45422, 142, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId17, 23000)
		SetPatrolId( sceneId, nMonsterId17, 13 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23600, 0 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45422, 144, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId16, 23000)
		SetPatrolId( sceneId, nMonsterId16, 12 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId16, nMonsterId16, nMonsterId16, 23600, 0 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45422, 146, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId15, 23000)
		SetPatrolId( sceneId, nMonsterId15, 11 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId15, nMonsterId15, nMonsterId15, 23600, 0 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45422, 148, 70, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId14, 23000)
		SetPatrolId( sceneId, nMonsterId14, 10 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId14, nMonsterId14, nMonsterId14, 23600, 0 )
end
function x391212_axiao5( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45422, 136, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId20, 23000)
		SetPatrolId( sceneId, nMonsterId20, 16 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId20, nMonsterId20, nMonsterId20, 23600, 0 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45422, 138, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId19, 23000)
		SetPatrolId( sceneId, nMonsterId19, 15 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId19, nMonsterId19, nMonsterId19, 23600, 0 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45422, 140, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 23000)
		SetPatrolId( sceneId, nMonsterId18, 14 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 23600, 0 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45422, 142, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId17, 23000)
		SetPatrolId( sceneId, nMonsterId17, 13 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId17, nMonsterId17, nMonsterId17, 23600, 0 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45422, 144, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId16, 23000)
		SetPatrolId( sceneId, nMonsterId16, 12 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId16, nMonsterId16, nMonsterId16, 23600, 0 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45422, 146, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId15, 23000)
		SetPatrolId( sceneId, nMonsterId15, 11 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId15, nMonsterId15, nMonsterId15, 23600, 0 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45422, 148, 80, 3, 128, -1 )
		SetCharacterDieTime(sceneId, nMonsterId14, 23000)
		SetPatrolId( sceneId, nMonsterId14, 10 )
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId14, nMonsterId14, nMonsterId14, 23600, 0 )
end
function x391212_axiao11( sceneId, key )
	if f1times == nil then
		f1times=0
	end 
	if key == 1 then
		f1times=f1times+210
	return f1times
end
	if key == 2 then
		f1times=0
end
end
function x391212_axiao12( sceneId, key )
	if times == nil then
		times=0
	end 
	if key == 1 then
		times=times+1
	return times
end
	if key == 2 then
		times=0
end
end
function x391212_axiao13( sceneId, key )
	if times1 == nil then
		times1=0
	end 
	if key == 1 then
		times1=times1+1
	return times1
end
	if key == 2 then
		times1=0
end
end
