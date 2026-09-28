--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760402_g_shoptableindex=269

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760402_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760402_g_shoptableindex)
end
