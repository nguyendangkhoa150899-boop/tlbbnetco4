--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
x760414_g_shoptableindex=300

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760414_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem(sceneId, selfId,targetId, x760414_g_shoptableindex)
end
