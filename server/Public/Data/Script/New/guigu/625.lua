--Quỷ Cốc NPC
--Tọa kỵ Quản lý viên 
--Bình thường 

x760625_g_shoptableindex=272

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760625_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760625_g_shoptableindex)
end
