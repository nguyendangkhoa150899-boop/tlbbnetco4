--洛阳NPC
--地摊--师门大全(药品类）
--普通

--地摊
x000159_g_shoptableindex=268

--**********************************
--事件交互入口
--**********************************
function x000159_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000159_g_shoptableindex )
end
