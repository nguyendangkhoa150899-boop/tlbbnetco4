--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760345_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"Trúc Kiªm ,Mai Kiªm Hai v¸ Trß·ng lão Khi¬n Ngã Ði vào Thiên Hoang ,Trþ Có Sào Th¸ Ð¯i kháng CØu Lê .Hi®n gi¶ Giá CØu Lê BÕi lui ,Nhi Ngû Ðª H§u nhân Hi®n thª ,Nói v§y Ly Ta ch¶ Phän h°i Chi KÏ Ð¸nh là Không xa !");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
