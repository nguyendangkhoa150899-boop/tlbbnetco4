

x990010_g_scriptId = 895109

function x895109_OnDefaultEvent(sceneId,selfId,targetId)
	BeginEvent( sceneId )
	AddText(sceneId,"#r#G[如有任何问题或建议请给我们提出]")
	AddNumText( sceneId, x990010_g_scriptId, "交镖", 6, 100)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x895109_OnEventRequest(sceneId,selfId,targetId,eventId)
	local nam  = LuaFnGetName( sceneId, selfId )
	local yabiaoZT= GetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 )
	local DeMonter = 0
if	GetNumText() == 100	then
		local nCount = GetMonsterCount(sceneId) ---检查地图内所有怪物
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local posX, posZ = LuaFnGetWorldPos(sceneId, nObjId);
		if  LuaFnGetName( sceneId, nObjId ) == "青铜镖车（"..nam.."）" then
			if (posX-232) < 5 and (posZ-47) < 5 then
				x895109_NotifyTip( sceneId, selfId, "青铜奖励" )
				LuaFnDeleteMonster(sceneId, nObjId)
				SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 0 )
				DeMonter=1
				AddMoney( sceneId, selfId, 100000)
	for i=0, 4 do
	TryRecieveItem( sceneId, selfId, 38002012, 1)
	end
				break
			else
				x895109_NotifyTip( sceneId, selfId, "镖车镖车还未到达，不可领取奖励" )
				return
			end
		elseif LuaFnGetName( sceneId, nObjId ) == "白银镖车（"..nam.."）" then
			if (posX-232) < 5 and (posZ-47) < 5 then
				x895109_NotifyTip( sceneId, selfId, "白银奖励" )
				LuaFnDeleteMonster(sceneId, nObjId)
				SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 0 )
				AddMoney( sceneId, selfId, 200000)
				DeMonter=1
	for i=0, 9 do
	TryRecieveItem( sceneId, selfId, 38002012, 1)
	end
				break
			else
				x895109_NotifyTip( sceneId, selfId, "镖车镖车还未到达，不可领取奖励" )
				return
			end
		elseif LuaFnGetName( sceneId, nObjId ) == "黄金镖车（"..nam.."）" then
			if (posX-232) < 5 and (posZ-47) < 5 then
				x895109_NotifyTip( sceneId, selfId, "黄金奖励" )
				LuaFnDeleteMonster(sceneId, nObjId)
				SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 0 )
				AddMoney( sceneId, selfId, 500000)
				DeMonter=1
	for i=0, 19 do
	TryRecieveItem( sceneId, selfId, 38002012, 1)
	end
				break
			else
			x895109_NotifyTip( sceneId, selfId, "镖车镖车还未到达，不可领取奖励" )
			return
			end
		end
	end
	if DeMonter == 0 and yabiaoZT >= 1 then
	x895109_NotifyTip( sceneId, selfId, "镖车被摧毁，给你一个释灵液")
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 0 )
	TryRecieveItem( sceneId, selfId, 38002012, 1)
	return
	elseif DeMonter == 0  then
	x895109_NotifyTip( sceneId, selfId, "您没有可交付的镖车")
	end
end
	
end

function x895109_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--DJZVMRU作式了中以我些开作

--上了要发我些展581581481
