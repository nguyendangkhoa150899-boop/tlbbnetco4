--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760404_g_shoptableindex=290

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760404_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760404_g_shoptableindex)
end
