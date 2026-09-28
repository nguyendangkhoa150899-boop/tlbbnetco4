--Quỷ Cốc NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760302_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{XMPGG_160823_63}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
