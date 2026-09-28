--咕咚1871488541

--脚本号
x895110_g_scriptId = 895110



--**********************************
--开始本节目....
--**********************************
function x895110_OnStartThisChapter( sceneId )

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x895110_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--走到最后一个路径点....
	if patrolPointIndex >= 23 then
		BroadMsgByChatPipe( sceneId, objId, "11111", 4 )
		--LuaFnDeleteMonster(sceneId, objId)--De镖
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)---测人
		for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if GetUnitCampID(sceneId, nHumanId, nHumanId ) == GetUnitCampID(sceneId, objId, objId ) then
				x895110_NotifyTip( sceneId, nHumanId, "222" )
			end
		end
	
	end

end

--**********************************
--结束本节目....
--**********************************
function x895110_OnEndThisChapter( sceneId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x895110_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

end

function x895110_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--MRU作式了中以我些开作上703

