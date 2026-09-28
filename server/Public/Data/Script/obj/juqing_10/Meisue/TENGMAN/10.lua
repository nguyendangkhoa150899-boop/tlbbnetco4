--脚本号
x808247_g_scriptId = 808247

function x808247_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then		
		return		
	else
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12437) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12438, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12438) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12439, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12439) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12440, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12440) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12441, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12441) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12442, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12442) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12443, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12443) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12444, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12444) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12445, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12445) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12446, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 12446) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,12446)
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 12437, 0 )
		end	
	end
end

--**********************************
-- 心法加成
--**********************************
function x808247_XinFaAddition( sceneId, selfId )
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