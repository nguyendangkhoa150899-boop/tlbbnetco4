--逍遥NPC
--苟读
--普通

x760003_g_shoptableindex=87

--**********************************
--事件交互入口
--**********************************
function x760003_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x760003_g_shoptableindex )
end
