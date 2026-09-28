function x391902_OnImpactFadeOut(sceneId, selfId,key)
local MonsterID = GetMissionData(sceneId, selfId, 205)
if MonsterID> 0 then
local targetId = LuaFnGetNpcIntParameter(sceneId,MonsterID,0)
if targetId == selfId then
if IsInDist(sceneId,selfId, MonsterID,20) ~= 1 then
	BeginEvent(sceneId)
		AddText(sceneId,"Ph’m vi 20 m")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
else
local PlayerX,PlayerZ = GetWorldPos(sceneId,selfId)
local PlayerX2,PlayerZ2 = GetWorldPos(sceneId,MonsterID)
SetPos(sceneId, MonsterID, PlayerX+1, PlayerZ)
CreateSpecialObjByDataIndex(sceneId, selfId, 1013, PlayerX2, PlayerZ2, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5654, 0)
end
end
end
end
