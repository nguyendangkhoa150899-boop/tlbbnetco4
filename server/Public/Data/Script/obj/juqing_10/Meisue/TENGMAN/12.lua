--脚本号
x808237_g_scriptId = 808237

function x808237_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then		
		return		
	else
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12314) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12315, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12315) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12316, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12316) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12317, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12317) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12318, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12318) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12319, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12319) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12320, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12320) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12321, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12321) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12322, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12322) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12323, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12323) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,12323)
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12314, 0 )
		end	
	end
end

--**********************************
-- 心法加成
--**********************************
function x808237_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 70)
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
		nAdditon = 4
	elseif nXinfaLevel>=20 and nXinfaLevel<30 then
		nAdditon = 3
	elseif nXinfaLevel>=10 and nXinfaLevel<20 then
		nAdditon = 2
	elseif nXinfaLevel<10 then
		nAdditon = 1
	end
	return nAdditon
end