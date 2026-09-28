function x391903_OnImpactFadeOut(sceneId, selfId,key)
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
local PlayerX,PlayerZ = GetWorldPos(sceneId,selfId)
local PlayerX2,PlayerZ2 = GetWorldPos(sceneId,MonsterID)
CreateSpecialObjByDataIndex(sceneId, selfId, 1014, PlayerX2, PlayerZ2, 0)
SetPos(sceneId, MonsterID, PlayerX, PlayerZ)
SetPos(sceneId, selfId, PlayerX2, PlayerZ2)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5631, 0)
end
end
end
--wy
end
