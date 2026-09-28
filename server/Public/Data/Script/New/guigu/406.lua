--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760406_g_shoptableindex=292

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760406_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760406_g_shoptableindex)
end
