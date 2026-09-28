--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760405_g_shoptableindex=291

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760405_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760405_g_shoptableindex)
end
