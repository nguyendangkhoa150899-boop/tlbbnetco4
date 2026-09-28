--脚本号
x808233_g_scriptId = 808233

function x808233_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then		
		return		
	else
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 319) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 320, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 320) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 321, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 321) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 322, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 322) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 323, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 323) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 324, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 324) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 325, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 325) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 236, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 326) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 327, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 327) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 328, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 328) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 329, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 330) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 331, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 331) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 332, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 332) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 333, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 333) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32693, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32693) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32694, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32694) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32695, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32695) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,32695)
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 319, 0 )
		end	
	end
end

--**********************************
-- 心法加成
--**********************************
function x808233_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 70)
	local nAdditon = 0
	local JinJie = 0

	if HaveSkill( sceneId, selfId, 1697 ) == 1 then
           JinJie = 3
        else
           JinJie = 0
        end

	if nXinfaLevel>=150 then
		nAdditon = 15 + JinJie
	elseif nXinfaLevel>=140 and nXinfaLevel<150 then
		nAdditon = 14 + JinJie
	elseif nXinfaLevel>=130 and nXinfaLevel<140 then
		nAdditon = 13 + JinJie
	elseif nXinfaLevel>=120 and nXinfaLevel<130 then
		nAdditon = 12 + JinJie
	elseif nXinfaLevel>=110 and nXinfaLevel<120 then
		nAdditon = 11 + JinJie
	elseif nXinfaLevel>=100 and nXinfaLevel<110 then
		nAdditon = 10 + JinJie
	elseif nXinfaLevel>=90 and nXinfaLevel<100 then
		nAdditon = 9 + JinJie
	elseif nXinfaLevel>=80 and nXinfaLevel<90 then
		nAdditon = 8 + JinJie
	elseif nXinfaLevel>=70 and nXinfaLevel<80 then
		nAdditon = 7 + JinJie
	elseif nXinfaLevel>=60 and nXinfaLevel<70 then
		nAdditon = 6 + JinJie
	elseif nXinfaLevel>=50 and nXinfaLevel<60 then
		nAdditon = 5 + JinJie
	elseif nXinfaLevel>=40 and nXinfaLevel<50 then
		nAdditon = 4 + JinJie
	elseif nXinfaLevel>=30 and nXinfaLevel<40 then
		nAdditon = 4 + JinJie
	elseif nXinfaLevel>=20 and nXinfaLevel<30 then
		nAdditon = 3 + JinJie
	elseif nXinfaLevel>=10 and nXinfaLevel<20 then
		nAdditon = 2 + JinJie
	elseif nXinfaLevel<10 then
		nAdditon = 1 + JinJie
	end
	return nAdditon
end
