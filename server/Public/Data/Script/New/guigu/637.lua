--Quỷ Cốc NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760637_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{THD_190613_127}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
