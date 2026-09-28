--洛阳NPC
--地摊--阿朱师门(烹饪类)
--普通

--地摊
x000162_g_shoptableindex=269

--**********************************
--事件交互入口
--**********************************
function x000162_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000162_g_shoptableindex )
end
