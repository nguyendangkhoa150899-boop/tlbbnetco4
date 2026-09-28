--技能
--啊萧
--第一次

x391234_g_scriptId = 391234


--**********************************
--事件交互入口
--**********************************
function x391234_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end
	local x,z = GetWorldPos( sceneId, selfId )
	local nObjId1 = 1
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "耶律元"  then
	nObjId1 = nObjId
		end
	end
		CreateSpecialObjByDataIndex(sceneId, nObjId1, 778, x, z, 0)
end

