--ÐþÎäµºBOSS°ó¶¨

--½Å±¾±àºÅ
x391218_g_ScriptId	= 391218

--**********************************
--Monster Timer
--**********************************
function x391218_OnCharacterTimer( sceneId, objId, dataId, uTime )
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x391218_OnDie( sceneId, objId, killerId )
	local x,z = GetWorldPos( sceneId, objId )
		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45216, x, z, 0, 0, -1 )
		SetCharacterDieTime(sceneId, nMonsterId18, 25000)
		LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId18, nMonsterId18, nMonsterId18, 32645, 0 )
end

