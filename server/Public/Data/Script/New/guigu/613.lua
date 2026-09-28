--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760613_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPJJRW_110805_439}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
