--技能
--啊萧
--囚笼

x391233_g_scriptId = 391233


--**********************************
--事件交互入口
--**********************************
function x391233_OnImpactFadeOut( sceneId, selfId, impactId )
		local x,z = GetWorldPos( sceneId, selfId )
		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45214, x, z, 0, 319, 391217 )
		SetCharacterDieTime(sceneId, nMonsterId18, 11000)
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 32646, 0 )
	end

