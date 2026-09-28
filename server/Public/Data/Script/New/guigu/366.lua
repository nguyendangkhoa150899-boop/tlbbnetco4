--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760366_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"  Cút ngay ,Con kiªn !!Ðãi ta CØu Lê Nh¤t tµc Cüa Chiªn sî Bß¾c vào Giá Phßþng minh Tr¤n ,Ðó là Ngß½i ch¶ Ngày chªt !#r  #GTi¬u ð« KÏ: CØu Lê Tù binh Gàn bß¾ng h° ð° ,Có l¨ Døng Ta Ð£c thù V§t ph¦m ,Có th¬ làm Tha M· mi®ng .");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
