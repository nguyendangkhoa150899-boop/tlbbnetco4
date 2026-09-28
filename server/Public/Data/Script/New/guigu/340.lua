--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760340_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"  ÐÕo Di­n VÕn v§t ,Hóa th¥n C½ ,VÕn sñ Ð«u có Ð¸nh s¯ ,Ho£c Phúc Ho£c H÷a .#r  Nhßng mà L¥n này Ngû Ðª Truy«n th×a Tái hi®n H§u thª ,Là phúc hay h÷a ,Ngßþc lÕi Không häo Ð¸nh lu§n Ngôn Nói ..");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
