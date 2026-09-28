--Lạc Dương NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760498_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{KVKYD_140226_30}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
