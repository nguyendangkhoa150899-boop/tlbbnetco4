--Đại lý NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760557_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{SXRW_090119_068}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
