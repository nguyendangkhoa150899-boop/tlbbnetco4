-- 中秋NPC
-- 小贩

x050007_g_scriptId = 050007

x050007_g_shoptableindex = 9

--**********************************
--事件交互入口
--**********************************
function x050007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    姓i hi畃, 皙n mua m祎 c鈟 ph醥 b鬾g ch絠 餴!" )
		AddNumText( sceneId, x050007_g_scriptId, "Mua ph醥 hoa Trung thu", -1, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x050007_g_shoptableindex )
	end
end
