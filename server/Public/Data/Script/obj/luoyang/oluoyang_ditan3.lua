--洛阳NPC
--地摊--卖灵兽丹
--普通

--地摊
x000160_g_shoptableindex=260

--**********************************
--事件交互入口
--**********************************
function x000160_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000160_g_shoptableindex )
end
