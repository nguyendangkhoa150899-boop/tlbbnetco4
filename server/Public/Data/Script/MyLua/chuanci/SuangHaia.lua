--技能
x899039_g_scriptId = 899039
x899039_g_sh = 500
x899039_g_jm = 501
x899039_g_WWDW = {15,30,45,90,150,180,195,210,270,360}
x899039_g_WuYiSkill_ID = {931,932,933,934,935,936,937,938,939,940,941,942}
--**********************************************************************************
function x899039_OnImpactFadeOut( sceneId, selfId, impactId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local objType = GetCharacterType( sceneId, targetId )
	local menpai = GetMenPai( sceneId, selfId )

        if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
           return
        end

	if GetMissionData( sceneId, selfId, MF_GetNewUserCard8) ~= targetId then
	   SetMissionData( sceneId, selfId, MF_GetNewUserCard8,targetId)
	end

	if impactId == 1110 or impactId == 10475 then
	   LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 338, 0 )
	end

	if GetHp( sceneId, selfId ) == 0  or GetHp( sceneId, targetId ) == 0 or selfId == targetId or (LuaFnUnitIsEnemy(sceneId, selfId, targetId) ~= 1 )  then
	   return
	end

	local sanhai = ( GetMissionData( sceneId, selfId, x899039_g_sh ) - GetMissionData( sceneId, targetId, x899039_g_jm ) )
	if GetHp( sceneId, selfId ) == 0  or GetHp( sceneId, targetId ) == 0 or selfId == targetId or (LuaFnUnitIsEnemy(sceneId, selfId, targetId) ~= 1 )  then
	   return
	end
	if sanhai <=0  then
	   return	
	end
	if LuaFnIsUnbreakable(sceneId,targetId) >= 1 then--目标处于无敌状态
           x899039_NotifyTip( sceneId, selfId, "目标处于无敌状态" )
	   return
	end

        local wwdj = mod((GetMissionData(sceneId, selfId, XZ_LANSEDIAOWEN)),100)
        if wwdj >= 1 and wwdj <= 10  then
	   LuaFnSetDamage(sceneId, selfId, targetId, x899039_g_WWDW[wwdj])
           --x899039_NotifyTip( sceneId, selfId, "调试成功，检测到您有忘无雕纹"..wwdj.."级，为您增加攻击伤害"..x899039_g_WWDW[wwdj].."点" )
        end

	if objType == 1 then --objType等于1是人，objType等于2是怪，objType等于3是宠	
	   local sjsanhai = floor(sanhai/1)
           if sjsanhai > 0 then
	      LuaFnSetDamage(sceneId, selfId, targetId, floor(sjsanhai))
	   end

	elseif objType == 3 then
	local jianxue = floor((GetMissionData( sceneId, selfId, x899039_g_sh ))/2 )
           if jianxue > 0 then
	      LuaFnSetDamage(sceneId, selfId, targetId,jianxue) 
	   end

	elseif objType == 2  then
	local asaqt = GetMissionData( sceneId, selfId, x899039_g_sh )
	local sunm = random(asaqt-41,asaqt)
	local jianxue = floor(sunm/5 ) +2 --怪
           if jianxue > 0 then
	      LuaFnSetDamage(sceneId, selfId, targetId,jianxue) 
           end
	end

        x899039_WuYiCheck(sceneId, selfId)
end


--**********************************
--武意技能启动
--**********************************
function x899039_WuYiCheck(sceneId, selfId)

        local WY_Book_1_skill = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_A),10^4)/100)
        local WY_Book_2_skill = floor(GetMissionData(sceneId,selfId,WUYI_SKILL_BC)/10^6)
        local WY_Book_3_skill = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),10^4)/100)
        local WY_Book_4_skill = floor(GetMissionData(sceneId,selfId,WUYI_SKILL_DE)/10^6)

        if GetMissionData(sceneId,selfId,WUYI_SKILL_ITEM) > LuaFnGetCurrentTime() then
           return
        end

        local skillnum = 0
        local TickStep = random(6)

        --if TickStep > 6 then
           --return
        --end

        if TickStep <= 3 then
           if WY_Book_1_skill ~= 0 then
              skillnum = WY_Book_1_skill
           else
              TickStep = random(4,6)
           end
        elseif TickStep == 4 then
           if WY_Book_2_skill ~= 0 then
              skillnum = WY_Book_2_skill
           else
              TickStep = random(5,6)
           end
        elseif TickStep == 5 then
           if WY_Book_3_skill ~= 0 then
              skillnum = WY_Book_3_skill
           else
              TickStep = 6
           end
        elseif TickStep == 6 then
           if WY_Book_4_skill == 10 or WY_Book_4_skill == 11 then
              skillnum = WY_Book_4_skill
           end
        end

        if skillnum ~= 0 then
           BeginUICommand(sceneId)
	     UICommand_AddInt(sceneId,x899039_g_WuYiSkill_ID[skillnum])
	     UICommand_AddString(sceneId,"ski13")
	     EndUICommand(sceneId)
           DispatchUICommand(sceneId,selfId,2014092002)
        end

end

--**********************************
--醒目提示
--**********************************
function x899039_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
