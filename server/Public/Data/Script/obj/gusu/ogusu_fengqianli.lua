--慕容NPC
--风千里
--普通

x002121_g_shoptableindex=271

--**********************************
--事件交互入口
--**********************************
function x002121_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x002121_g_shoptableindex )
end
