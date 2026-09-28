--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760413_g_shoptableindex=296

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760413_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760413_g_shoptableindex)
end
