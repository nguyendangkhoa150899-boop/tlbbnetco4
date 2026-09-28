--ÐþÎäµºBOSS°ó¶¨

--½Å±¾±àºÅ
x391215_g_ScriptId	= 391215

--**********************************
--Monster Timer
--**********************************
function x391215_OnCharacterTimer( sceneId, objId, dataId, uTime )
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x391215_OnDie( sceneId, objId, killerId )
	local x = 126
	local z = 184
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "Ïô·å"  then
	x,z = GetWorldPos( sceneId, nObjId )
			LuaFnDeleteMonster(sceneId, nObjId)
		end
	end
	local MstIdA = LuaFnCreateMonster(sceneId, 45430, x, z, 3, 128, 391211 )
	SetUnitReputationID( sceneId, MstIdA, MstIdA, 0 )
	CallScriptFunction( 391200, "SetBossBattleFlag", sceneId, 2)	
end
