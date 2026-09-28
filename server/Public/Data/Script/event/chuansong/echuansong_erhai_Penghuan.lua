--脚本号
x302023_g_scriptId = 302023

function x302023_AddSkill(sceneId, selfId,type)
	if type==101 then			
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9520) == 1 then			
			AddSkill(  sceneId, selfId, 1690)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9521) == 1 then
			AddSkill(  sceneId, selfId, 1691)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9522) == 1 then
			AddSkill(  sceneId, selfId, 1692)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9523) == 1 then
			AddSkill(  sceneId, selfId, 1693)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9524) == 1 then
			AddSkill(  sceneId, selfId, 1694)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9525) == 1 then
			AddSkill(  sceneId, selfId, 1695)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9526) == 1 then
			AddSkill(  sceneId, selfId, 1696)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9527) == 1 then
			AddSkill(  sceneId, selfId, 1697)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9528) == 1 then
			AddSkill(  sceneId, selfId, 1698)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9529) == 1 then
			AddSkill(  sceneId, selfId, 1699)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9530) == 1 then
			AddSkill(  sceneId, selfId, 1700)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9531) == 1 then
			AddSkill(  sceneId, selfId, 1701)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9532) == 1 then
			AddSkill(  sceneId, selfId, 1702)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9533) == 1 then
			AddSkill(  sceneId, selfId, 1703)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9534) == 1 then
			AddSkill(  sceneId, selfId, 1704)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9535) == 1 then
			AddSkill(  sceneId, selfId, 1705)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9536) == 1 then
			AddSkill(  sceneId, selfId, 1706)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9537) == 1 then
			AddSkill(  sceneId, selfId, 1707)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9538) == 1 then
			AddSkill(  sceneId, selfId, 1708)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9539) == 1 then
			AddSkill(  sceneId, selfId, 1709)
		end
	elseif type==102 then
		for i=1690,1709 do
			DelSkill(  sceneId, selfId, i)
		end

		for d=989,999 do
			DelSkill(  sceneId, selfId, d)
		end		
	end
end
--**********************************
--醒目提示
--**********************************
function x302023_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x302023_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

