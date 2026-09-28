--洛阳NPC
--地摊-卖革玉地矿布
--普通

--地摊
x000161_g_shoptableindex=261

--**********************************
--事件交互入口
--**********************************
function x000161_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000161_g_shoptableindex )
end
