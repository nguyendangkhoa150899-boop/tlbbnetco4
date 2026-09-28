--Phượng minh NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760368_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{KVKNPCJ_140305_03}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
