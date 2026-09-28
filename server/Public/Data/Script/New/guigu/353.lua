--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760353_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"  (Tha Vçn luôn Cúi ð¥u ,Cái gì ð«u không nói ..Nhß R¯i g² Y¬n Giáp Bàn ,Vçn không nhúc nhích ..)");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
