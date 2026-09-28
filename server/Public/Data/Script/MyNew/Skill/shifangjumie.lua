--脚本号
x808237_g_scriptId = 808237

function x808237_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then		
		return		
	else
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 854) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 855, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 855) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 856, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 856) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 857, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 857) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 858, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 858) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 859, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 859) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 860, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 860) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 861, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 861) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 862, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 862) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 863, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 863) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 864, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 864) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 865, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 865) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 866, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 866) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 867, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 867) == 1 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 868, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 868) == 1 then
		LuaFnCancelSpecificImpact(sceneId,selfId,868)
		end
	end	
end

--**********************************
-- 心法加成
--**********************************
function x808237_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 87)
	local nAdditon = 0
	if nXinfaLevel>=150 then
		nAdditon = 15
	elseif nXinfaLevel>=140 and nXinfaLevel<150 then
		nAdditon = 14
	elseif nXinfaLevel>=130 and nXinfaLevel<140 then
		nAdditon = 13
	elseif nXinfaLevel>=120 and nXinfaLevel<130 then
		nAdditon = 12
	elseif nXinfaLevel>=110 and nXinfaLevel<120 then
		nAdditon = 11
	elseif nXinfaLevel>=100 and nXinfaLevel<110 then
		nAdditon = 10
	elseif nXinfaLevel>=90 and nXinfaLevel<100 then
		nAdditon = 9
	elseif nXinfaLevel>=80 and nXinfaLevel<90 then
		nAdditon = 8
	elseif nXinfaLevel>=70 and nXinfaLevel<80 then
		nAdditon = 7
	elseif nXinfaLevel>=60 and nXinfaLevel<70 then
		nAdditon = 6
	elseif nXinfaLevel>=50 and nXinfaLevel<60 then
		nAdditon = 5
	elseif nXinfaLevel>=40 and nXinfaLevel<50 then
		nAdditon = 4
	elseif nXinfaLevel>=30 and nXinfaLevel<40 then
		nAdditon = 3
	elseif nXinfaLevel>=20 and nXinfaLevel<30 then
		nAdditon = 2
	elseif nXinfaLevel>=10 and nXinfaLevel<20 then
		nAdditon = 1
	elseif nXinfaLevel<10 then
		nAdditon = 0
	end
	return nAdditon
end