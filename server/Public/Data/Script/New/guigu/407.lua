--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760407_g_shoptableindex=293

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760407_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760407_g_shoptableindex)
end
