-- Script ID
x808276_g_scriptId = 808276
x808276_g_Buff1 = 13096
x808276_g_Buff2 = 13097
x808276_g_Buff3 = 13098
x808276_g_Buff4 = 13099
x808276_g_Buff5 = 13100
x808276_g_Buff6 = 13101
x808276_g_Buff7 = 13104
x808276_g_Buff8 = 13105
x808276_g_Buff9 = 13106
x808276_g_Buff10 = 13107


function x808276_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff1 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff2 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff3 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff4 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff5 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff6 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff7 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff8 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff9 , 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808276_g_Buff10 , 0 )

	
end

--**********************************
-- Tam phap
--**********************************
function x808276_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 63)
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