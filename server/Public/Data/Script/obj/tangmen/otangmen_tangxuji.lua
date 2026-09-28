--唐门NPC
--唐绪机
--普通

x017507_g_shoptableindex=272

--**********************************
--事件交互入口
--**********************************
function x017507_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x017507_g_shoptableindex )
end
