function x391906_OnImpactFadeOut(sceneId, selfId,key)
local MonsterID = GetMissionData(sceneId, selfId, 205)
if MonsterID> 0 then
local targetId = LuaFnGetNpcIntParameter(sceneId,MonsterID,0)


if targetId == selfId then
if IsInDist(sceneId,selfId, MonsterID,20) == 1 then
local xadd = {1,-1,0,0,2,-2}
local yadd = {0,0,1,-1,0,0}
local PlayerX2,PlayerZ2 = GetWorldPos(sceneId,MonsterID)
CreateSpecialObjByDataIndex(sceneId, selfId, 1015, PlayerX2, PlayerZ2, 0)



	local nnum = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)

		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, nHumanId, 5638) == 1 then

		if IsInDist(sceneId,MonsterID, nHumanId,15) == 1 then
			nnum = nnum + 1
			SetPos(sceneId, nHumanId, PlayerX2+xadd[nnum], PlayerZ2+yadd[nnum])			
			if nnum> 5 then
				break
			end
		end
		end
	end
end
end
end
--wy
end
