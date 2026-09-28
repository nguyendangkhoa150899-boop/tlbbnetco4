--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760408_g_shoptableindex=294

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760408_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760408_g_shoptableindex)
end
