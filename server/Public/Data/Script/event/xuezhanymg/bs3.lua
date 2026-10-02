--ÐþÎäµºBOSS°ó¶¨

--½Å±¾±àºÅ
x391213_g_ScriptId	= 391213

--**********************************
--Monster Timer
--**********************************
function x391213_OnCharacterTimer( sceneId, objId, dataId, uTime )
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x391213_OnDie( sceneId, objId, killerId )
	local x = 126
	local z = 114
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "Ti\234u Phong"  then -- [NetCo4 02/10] so ten GBK "Xiao Feng" khong bao gio khop -> ten VISCII cua 45410/45430 (don Tieu Phong, dat lai NPC)
	x,z = GetWorldPos( sceneId, nObjId )
			LuaFnDeleteMonster(sceneId, nObjId)
		end
	end
	local MstIdA = LuaFnCreateMonster(sceneId, 45430, x, z, 3, 128, 391211 )
	SetUnitReputationID( sceneId, MstIdA, MstIdA, 0 )
	CallScriptFunction( 391200, "SetBossBattleFlag", sceneId, 4)	
end
