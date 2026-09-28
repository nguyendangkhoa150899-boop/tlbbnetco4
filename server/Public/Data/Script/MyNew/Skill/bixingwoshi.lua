
x808238_g_scriptId = 808238
x808238_Ix = {12624,12624,12625,12625,12626,12636,12627,12628,12629,12630,12631,12631}
x808238_Im = {32288,32256,32304,32224,32192,32208}
--**********************************
--事件交互入口
--**********************************
function x808238_OnImpactFadeOut( sceneId,selfId,impactId )

     if GetHp(sceneId,selfId) == 0 then
	return
     end

     local targetId = LuaFnGetTargetObjID(sceneId,selfId)
     if LuaFnIsObjValid(sceneId,targetId) ~= 1 then
        return
     end


     if impactId == 913 then
        if HaveXinFa( sceneId,selfId,68) < 1 then
           return
        end
        local SkillLev = floor(LuaFnGetXinFaLevel(sceneId,selfId,68)/10)
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,targetId,x808238_Ix[SkillLev],100)
        return
     end


     if impactId == 929 then
        if HaveXinFa( sceneId,selfId,67) < 1 then
           return
        end
        local SkillLev = floor(LuaFnGetXinFaLevel(sceneId,selfId,67)/10)
	local nRet = random(getn(x808238_Im))
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,targetId,x808238_Im[nRet]+SkillLev,100)
        return
     end
end

