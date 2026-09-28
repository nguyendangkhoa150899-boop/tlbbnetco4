
x808240_g_scriptId = 808240
x808240_Im = {{672,673,674,675},{1111,1112,1113,1114},{1115,1116,1117,1118},{1119,1120,1121,1122}}
--**********************************
--事件交互入口
--**********************************
function x808240_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)

        if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
           return
        end

        if HaveXinFa(sceneId,selfId,61) < 1 then  --不是天龙寺
           return
        end

     local mylev = 1
     if impactId == 671 then
        mylev = floor(LuaFnGetXinFaLevel(sceneId,selfId,61)/40)+1
        if mylev < 1 or mylev > 3 then
           mylev = 3
        end
     elseif impactId == 32634 then
           mylev = 4
     end

     local nRet = random(4)
     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x808240_Im[mylev][nRet], 100 )

end

--**********************************
--醒目提示
--**********************************
function x808240_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end