--脚本号
x202023_g_scriptId = 202023

function x202023_AddSkill(sceneId, selfId,type)
	if type==111 then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9564) == 1 then
			AddSkill(  sceneId, selfId, 1379)
			AddSkill(  sceneId, selfId, 1517)
			AddSkill(  sceneId, selfId, 1595)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9568) == 1 then			
			AddSkill(  sceneId, selfId, 1380)
			AddSkill(  sceneId, selfId, 1518)
			AddSkill(  sceneId, selfId, 1596)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9572) == 1 then
			AddSkill(  sceneId, selfId, 1381)
			AddSkill(  sceneId, selfId, 1519)
			AddSkill(  sceneId, selfId, 1597)			
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9576) == 1 then
			AddSkill(  sceneId, selfId, 1382)
			AddSkill(  sceneId, selfId, 1520)
			AddSkill(  sceneId, selfId, 1598)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9580) == 1 then
			AddSkill(  sceneId, selfId, 1383)
			AddSkill(  sceneId, selfId, 1521)
			AddSkill(  sceneId, selfId, 1599)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9565) == 1 then
			AddSkill(  sceneId, selfId, 1379)
			AddSkill(  sceneId, selfId, 1517)
			AddSkill(  sceneId, selfId, 1601)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9569) == 1 then
			AddSkill(  sceneId, selfId, 1380)
			AddSkill(  sceneId, selfId, 1518)
			AddSkill(  sceneId, selfId, 1602)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9573) == 1 then
			AddSkill(  sceneId, selfId, 1381)
			AddSkill(  sceneId, selfId, 1519)
			AddSkill(  sceneId, selfId, 1603)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9577) == 1 then
			AddSkill(  sceneId, selfId, 1382)
			AddSkill(  sceneId, selfId, 1520)
			AddSkill(  sceneId, selfId, 1604)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9581) == 1 then
			AddSkill(  sceneId, selfId, 1383)
			AddSkill(  sceneId, selfId, 1521)
			AddSkill(  sceneId, selfId, 1605)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9566) == 1 then
			AddSkill(  sceneId, selfId, 1379)
			AddSkill(  sceneId, selfId, 1517)
			AddSkill(  sceneId, selfId, 1607)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9570) == 1 then
			AddSkill(  sceneId, selfId, 1380)
			AddSkill(  sceneId, selfId, 1518)
			AddSkill(  sceneId, selfId, 1608)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9574) == 1 then
			AddSkill(  sceneId, selfId, 1381)
			AddSkill(  sceneId, selfId, 1519)
			AddSkill(  sceneId, selfId, 1609)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9578) == 1 then
			AddSkill(  sceneId, selfId, 1382)
			AddSkill(  sceneId, selfId, 1520)
			AddSkill(  sceneId, selfId, 1610)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9582) == 1 then
			AddSkill(  sceneId, selfId, 1383)
			AddSkill(  sceneId, selfId, 1521)
			AddSkill(  sceneId, selfId, 1611)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9567) == 1 then
			AddSkill(  sceneId, selfId, 1379)
			AddSkill(  sceneId, selfId, 1517)
			AddSkill(  sceneId, selfId, 1613)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9571) == 1 then
			AddSkill(  sceneId, selfId, 1380)
			AddSkill(  sceneId, selfId, 1518)
			AddSkill(  sceneId, selfId, 1614)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9575) == 1 then
			AddSkill(  sceneId, selfId, 1381)
			AddSkill(  sceneId, selfId, 1519)
			AddSkill(  sceneId, selfId, 1615)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9579) == 1 then
			AddSkill(  sceneId, selfId, 1382)
			AddSkill(  sceneId, selfId, 1520)
			AddSkill(  sceneId, selfId, 1616)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9583) == 1 then
			AddSkill(  sceneId, selfId, 1383)
			AddSkill(  sceneId, selfId, 1521)
			AddSkill(  sceneId, selfId, 1617)
			end
	elseif type==1111 then
		for i=1379,1383 do
		DelSkill(  sceneId, selfId, i)
		end
		for G=1517,1617 do
		DelSkill(  sceneId, selfId, G)
		end
		
	end
end
--**********************************
--醒目提示
--**********************************
function x202023_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x202023_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

