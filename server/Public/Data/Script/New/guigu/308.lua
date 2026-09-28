--Quỷ Cốc NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760308_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{WHOATN_12103123_01}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
