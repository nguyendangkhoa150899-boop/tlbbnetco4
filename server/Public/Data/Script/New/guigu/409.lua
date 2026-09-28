--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760409_g_shoptableindex=295

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760409_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760409_g_shoptableindex)
end
