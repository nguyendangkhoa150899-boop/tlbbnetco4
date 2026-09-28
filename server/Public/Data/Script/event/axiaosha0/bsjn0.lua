--技能
--啊萧
--囚笼

x391230_g_scriptId = 391230


--**********************************
--事件交互入口
--**********************************
function x391230_OnImpactFadeOut( sceneId, selfId, impactId )
		local x,z = GetWorldPos( sceneId, selfId )
		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45213, x, z, 0, 0, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 20000)
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 32628, 0 )
	end

