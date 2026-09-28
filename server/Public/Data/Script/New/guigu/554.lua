--Đại lý NPC
--Bình thường đệ tử 
--Bình thường 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760554_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{GY_120202_02}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
