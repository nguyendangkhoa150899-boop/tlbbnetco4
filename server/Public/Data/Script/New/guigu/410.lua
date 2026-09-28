--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760410_g_shoptableindex=297

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760410_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760410_g_shoptableindex)
end
