function x391905_OnImpactFadeOut(sceneId, selfId,key)
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
LuaFnSendSpecificImpactToUnit(sceneId, MonsterID, MonsterID, MonsterID, 5610, 0)
end
end
end
--wy
end
