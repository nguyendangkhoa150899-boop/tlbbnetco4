--Tô Châu NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760335_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{AYX_100401_1}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
