--脚本号
x808235_g_scriptId = 808235

x808235_g_PartnerBuff = {260,334,335,336,337,615,616,617,618,734,735,736,736,736,736,736,736}
x808235_g_EnemyBuff = {32016,32017,32018,32019,32020,32021,32022,32023,32024,32025,32026,32027,32028,32029,32030,32031}
--**********************************
--回调本接口....
--**********************************
function x808235_OnImpactFadeOut(sceneId,selfId,impactId)

    if impactId == 259 then
	if GetHp( sceneId, selfId ) == 0 then		
		return		
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
        if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
           return
        end

        if HaveXinFa(sceneId,selfId,59) < 1 then  --不是峨嵋
           return
        end

        local mylev = floor(LuaFnGetXinFaLevel(sceneId,selfId,59)/10)+1

	if LuaFnUnitIsFriend(sceneId,selfId,targetId) == 1 then --友军
	   LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,targetId,x808235_g_PartnerBuff[mylev],0)
           return
        end

        if LuaFnUnitIsEnemy(sceneId,selfId,targetId) == 1 then --敌军
	   LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,targetId,x808235_g_EnemyBuff[mylev],0)
           return
        end

	BeginEvent(sceneId)
	  AddText(sceneId,"所选的目标必须是敌军或队友！" )
	  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
     end
end

