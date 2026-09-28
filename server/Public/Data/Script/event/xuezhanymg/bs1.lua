--缥缈峰本....
--哈大霸对话脚本....

--脚本号
x391211_g_ScriptId = 391211

--副本逻辑脚本号....
x391211_g_FuBenScriptId = 391200

--**********************************
--任务入口函数....
--**********************************
function x391211_OnDefaultEvent( sceneId, selfId, targetId )
		local axiao = CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId )
	BeginEvent(sceneId)
		if axiao == 0 then
		AddText(sceneId,"      众好汉助我阻挡辽军杀戮，不让更多生灵涂炭！")
		    AddNumText( sceneId, x391211_g_ScriptId, "阻挡辽国大军", 10, 1 )
	elseif axiao == 1 then
		AddText(sceneId,"      耶律辛武功阴毒，他会释放困兽囚笼，寒梅遍野等技能，各位英雄小心应对！")
		    AddNumText( sceneId, x391211_g_ScriptId, "击杀耶律辛", 10, 2 )
	elseif axiao == 2 then
		AddText(sceneId,"      耶律宛冰攻了得，能召唤寒冰之灵，释放冰雪连天，各位英雄小心应对！")
		    AddNumText( sceneId, x391211_g_ScriptId, "击杀耶律宛", 10, 3 )
	elseif axiao == 3 then
		AddText(sceneId,"      耶律元一身盖世火攻，释放火系天罚，引地火焚天，各位英雄小心应对！")
		    AddNumText( sceneId, x391211_g_ScriptId, "击杀耶律元", 10, 4 )
	elseif axiao == 4 then
		AddText(sceneId,"      耶律洪基虽与我割袍短义，但我不忍去擒拿他，各位好汉去吧,往前走就是大本营了，我记得他应该武功低微！")
		    AddNumText( sceneId, x391211_g_ScriptId, "击杀耶律洪基", 10, 5 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x391211_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x391211_g_FuBenScriptId, "IBQZSTimerRunning", sceneId ) then
		return
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果正在和别的BOSS战斗则返回....
	local ret, msg = CallScriptFunction( x391211_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--判断当前是否可以挑战boss....	
      if GetNumText() == 1 then
	if 0 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "你已经挑战过我了。" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end
      if GetNumText() == 2 then
	if 1 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "你已经挑战过我了。" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end

      if GetNumText() == 3 then
	if 2 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "你已经挑战过我了。" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end

      if GetNumText() == 4 then
	if 3 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "你已经挑战过我了。" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end
      if GetNumText() == 5 then
	if 4 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "你已经挑战过我了。" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end


	--开启缥缈峰计时器来激活自己....

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x391211_OnBQZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 6 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 4 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 2 == step then
		--提示战斗开始....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId)  == "萧峰" then
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		return
	end

	if 1 == step then
		--建立BOSS....
		local axiao = CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId )
	if axiao == 0 then
		x391211_axiao0( sceneId )
		x391211_axiao1( sceneId )
		x391211_axiao2( sceneId )
		x391211_axiao3( sceneId )
	elseif axiao == 1 then
		x391211_axiao4( sceneId )
		x391211_axiao5( sceneId )
	elseif axiao == 2 then
		x391211_axiao4( sceneId )
		x391211_axiao6( sceneId )
	elseif axiao == 3 then
		x391211_axiao7( sceneId )
		x391211_axiao8( sceneId )
	elseif axiao == 4 then
		x391211_axiao9( sceneId )
	end
		return
	end

end
function x391211_axiao0( sceneId )
		local nMonsterIdA = LuaFnCreateMonster(sceneId, 45410, 125, 243, 0, 320, -1 )
		SetPatrolId( sceneId, nMonsterIdA, 0 )
end
function x391211_axiao1( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45411, 81, 126, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId20, 1 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45411, 82, 128, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId19, 1 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45411, 84, 131, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId18, 1 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45411, 85, 134, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId17, 1 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45411, 87, 137, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId16, 1 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45411, 89, 142, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId15, 1 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45411, 89, 145, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId14, 1 )

		local nMonsterId13 = LuaFnCreateMonster(sceneId, 45411, 89, 148, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId13, 1 )
end
function x391211_axiao2( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45412, 172, 143, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId20, 2 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45412, 172, 148, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId19, 2 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45412, 168, 150, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId18, 2 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45412, 166, 154, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId17, 2 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45412, 162, 157, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId16, 2 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45412, 160, 160, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId15, 2 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45412, 158, 163, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId14, 2 )

		local nMonsterId13 = LuaFnCreateMonster(sceneId, 45412, 156, 166, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId13, 2 )
end
function x391211_axiao3( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45413, 127, 131, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId20, 3 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45413, 126, 133, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId19, 3 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45413, 125, 142, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId18, 3 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45413, 126, 148, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId17, 3 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45413, 126, 154, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId16, 3 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45413, 127, 162, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId15, 3 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45413, 127, 164, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId14, 3 )

		local nMonsterId13 = LuaFnCreateMonster(sceneId, 45413, 127, 166, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId13, 3 )

		local nMonsterId12 = LuaFnCreateMonster(sceneId, 45413, 125, 60, 0, 0, 391216 )
		SetPatrolId( sceneId, nMonsterId12, 3 )
end
function x391211_axiao4( sceneId )
		LuaFnCreateMonster(sceneId, 45410, 125, 184, 0, 320, -1 )
end
function x391211_axiao5( sceneId )
		local nMonsterIdB = LuaFnCreateMonster(sceneId, 45414, 89, 144, 0, 316, 391215 )
		SetPatrolId( sceneId, nMonsterIdB, 1 )
end
function x391211_axiao6( sceneId )
		local nMonsterIdB = LuaFnCreateMonster(sceneId, 45415, 167, 151, 0, 317, 391214 )
		SetPatrolId( sceneId, nMonsterIdB, 2 )
end
function x391211_axiao7( sceneId )
		local nMonsterIdA = LuaFnCreateMonster(sceneId, 45410, 125, 184, 0, 320, -1 )
		SetPatrolId( sceneId, nMonsterIdA, 4 )
end
function x391211_axiao8( sceneId )
		LuaFnCreateMonster(sceneId, 45416, 126, 114, 0, 318, 391213 )
end
function x391211_axiao9( sceneId )
		LuaFnCreateMonster(sceneId, 45417, 123, 51, 27, 0, 391212 )
end
