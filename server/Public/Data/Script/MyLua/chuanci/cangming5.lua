function x990079_OnImpactFadeOut( sceneId, selfId, impactId )

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)

        if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
           return
        end

	local sanhai = ( GetMissionData( sceneId, selfId, CHUANCI_SH ) - GetMissionData( sceneId, targetId, CHUANCI_JM ) )
	if GetHp( sceneId, selfId ) == 0  or GetHp( sceneId, targetId ) == 0 or selfId == targetId or (LuaFnUnitIsFriend(sceneId, selfId, targetId) == 1 )  then
	   return
	end

        if sanhai <= 0 then
           sanhai = 1
        end

	local AnQitype = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 117 )  --检测暗器位置
	if AnQitype < 10155100 or AnQitype > 10155139 then
              x990079_MsgBox( sceneId, selfId, "你没有装备金翅翎羽，不能使用暗器连击" ) --这里其实没什么作用，因为我已经修改了其他部分，不穿金翅翎羽不显示暗器连击，这里以防万一
           return
        end

        if impactId == 8696 then
	   BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,901)
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId,2014092002)

        elseif impactId == 8697 then
           LuaFnSetDamage(sceneId, selfId, targetId, sanhai)
	   BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,902)
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId,2014092002)

        elseif impactId == 8698 then
           LuaFnSetDamage(sceneId, selfId, targetId, sanhai)
	   BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,903)
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId,2014092002)

        elseif impactId == 8699 then
           LuaFnSetDamage(sceneId, selfId, targetId, sanhai)
	   BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,904)
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId,2014092002)

        elseif impactId == 8700 then
           LuaFnSetDamage(sceneId, selfId, targetId, sanhai)
	   BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,905)
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId,2014092002)

        elseif impactId == 8701 then
           LuaFnSetDamage(sceneId, selfId, targetId, sanhai)
        end

end

function x990079_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

