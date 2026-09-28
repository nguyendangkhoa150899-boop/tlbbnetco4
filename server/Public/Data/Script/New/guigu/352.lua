--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760352_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"  Nghe nói Kia truy«n thuyªt Trung Cüa Ngû phß½ng Thiên Ðª Cüa H§u nhân Xu¤t hi®n ?#r  Ta còn tß·ng r¢ng Này ðó ð«u là Lão t± tông B¸a ð£t Cüa Chuy®n xßa Ni ?!Xem ra Này thª ðÕo Hµi Càng ngày càng R¯i loÕn ..");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
