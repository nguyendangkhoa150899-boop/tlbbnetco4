--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760411_g_shoptableindex=298

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760411_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760411_g_shoptableindex)
end
