--Quỷ Cốc NPC
--Tọa kỵ Quản lý viên 
--Bình thường 

x760309_g_shoptableindex=84

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760309_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760309_g_shoptableindex)
end
