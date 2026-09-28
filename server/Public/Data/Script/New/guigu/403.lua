--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760403_g_shoptableindex=289

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760403_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760403_g_shoptableindex)
end
