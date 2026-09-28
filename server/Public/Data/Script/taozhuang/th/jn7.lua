function x391907_OnImpactFadeOut(sceneId, selfId,key)
local MonsterID = GetMissionData(sceneId, selfId, 205)
if MonsterID> 0 then
local targetId = LuaFnGetNpcIntParameter(sceneId,MonsterID,0)
if targetId == selfId then
if IsInDist(sceneId,selfId, MonsterID,20) ~= 1 then
	BeginEvent(sceneId)
		AddText(sceneId,"ph’m vi 20 m")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
else
--LuaFnSendSpecificImpactToUnit(sceneId, MonsterID, MonsterID, MonsterID, 5633, 0)
--local PlayerX2,PlayerZ2 = GetWorldPos(sceneId,MonsterID)
--SetPos(sceneId, selfId, PlayerX2, PlayerZ2)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5633, 0)
end
end
end
--wy
end
