--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760364_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"  La Phù Thành ?Không c¥n LÕi cùng Ngã Nh¡c t¾i La Phù ,Hi®n tÕi N½i ðó ðã Th¸ Ðám kia Thñc Nhân Dã thú NhÕc viên R°i !#r  Ngã Hi®n tÕi Chï hy v÷ng Có th¬ · Giá Phßþng minh Tr¤n Nµi T¯ Ta Chính mình Khä nång cho phép Vi®c ,Quên m¤t Na ÐoÕn Cñc kÏ bi thäm Ký Ñc .");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
