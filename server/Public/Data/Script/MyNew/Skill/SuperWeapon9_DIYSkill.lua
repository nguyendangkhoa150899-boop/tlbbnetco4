--9星神器技能  蝎子制作QQ-718805400

x808242_g_scriptId = 808242

x808242_g_MingHun = {{32509,32510,32511,32512,32513,32514,32515,32516,32517,32518},{32519,32520,32521,32522,32523,32524,32525,32526,32527,32528},{32529,32530,32531,32532,32533,32534,32535,32536,32537,32538},{32539,32540,32541,32542,32543,32544,32545,32546,32547,32548}}
x808242_g_DiHun = {{32549,32550,32551,32552,32553,32554,32555,32556,32557,32558},{32559,32560,32561,32562,32563,32564,32565,32566,32567,32568},{32569,32570,32571,32572,32573,32574,32575,32576,32577,32578},{32579,32580,32581,32582,32583,32584,32585,32586,32587,32588}}
x808242_g_TianHun = {32589,32590,32591,32592,32593,32594,32595,32596,32597,32598}

--**********************************************************************************
function x808242_OnImpactFadeOut( sceneId, selfId, impactId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local objType = GetCharacterType( sceneId, targetId )
	local mymenpai = GetMenPai( sceneId, selfId )

        if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
           return
        end

        --特殊情况
	if GetHp( sceneId, selfId ) == 0  or GetHp( sceneId, targetId ) == 0 or selfId == targetId or (LuaFnUnitIsEnemy(sceneId, selfId, targetId) ~= 1 )  then
	   x808242_NotifyTip( sceneId, selfId, "不能攻击此目标")
	   return
	end
	if LuaFnIsUnbreakable(sceneId,targetId) >= 1 then
	   x808242_NotifyTip( sceneId, selfId, "目标处于无敌状态")
	   return
	end

     if impactId == 32508 then
        local ShenQiSkill = GetMissionData(sceneId,selfId,SuperWeapon9_DIYSkill)
        local MingHun =    floor(mod(ShenQiSkill,1000000)/100000)
        local MingHunLev = floor(mod(ShenQiSkill,100000)/10000)+1
        local DiHun =      floor(mod(ShenQiSkill,10000)/1000)
        local DiHunLev =   floor(mod(ShenQiSkill,1000)/100)+1
        local TianHun =    floor(mod(ShenQiSkill,100)/10)
        local TianHunLev = mod(ShenQiSkill,10)+1

        if MingHun >= 1 and MingHun <= 4 then
	   LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, targetId, x808242_g_MingHun[MingHun][MingHunLev], 0 )
        end

        if DiHun >= 1 and DiHun <= 4 then
	   LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808242_g_DiHun[DiHun][DiHunLev], 0 )
        end

        if TianHun >= 1 and TianHun <= 4 then
	   LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808242_g_TianHun[TianHunLev], 0 )
        end
    end


end

--**********************************
--醒目提示
--**********************************
function x808242_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
