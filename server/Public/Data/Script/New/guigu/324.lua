--ÐÕi lý NPC
--Th¥n bí thß½ng nhân 
--Bình thß¶ng 

--Th¥n bí CØa hàng 
x760324_g_scriptId=760324
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760324_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"Ta n½i này Thß¶ng thß¶ng Hµi Có mµt ít ThÑ t¯t ,Chï c¥n Ngß½i Có Kiên nhçn ,Nh¤t ð¸nh s¨ Tìm ðßþc Ngß½i T¯i V×a ý Ð° v§t .#r  B¤t quá ThÑ t¯t Cûng s¨ không Thß¶ng xuyên Có Nga ,Trên c½ bän Chï c¥n V×a lên Giá ,Li«n s¨ b¸ Nhân Mãi Ði ..")
		AddNumText(sceneId, x760324_g_scriptId,"Thß½ng ph¦m Toàn bµ Thßþng giá Chí Nguyên bäo CØa hàng", 7, 1)
		AddNumText(sceneId, x760324_g_scriptId,"V« Th¥n bí CØa hàng", 11, 2)		
			--for i, eventId in x760324_g_eventList do
				--	CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
			--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760324_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText()==2 then
		BeginEvent(sceneId)
			AddText(sceneId,"  #YV« Th¥n bí CØa hàng: #W#r #r  Th¥n bí CØa hàng Trung Bán ra ÐÕo cø #GÐ«u vì Nguyên bäo Thß½ng ph¦m #W,Ðß½ng nhiên C¤u Mua th¶i ði¬m Cûng là Yêu c¥u #GSØ døng Nguyên bäo #WM¾i có th¬ Mua s¡m ,Th¥n bí CØa hàng ÐÕo cø Cüa #GThßþng giá Th¶i gian B¤t C¯ ð¸nh #W,B¤t lu§n cái gì Th¶i gian Quân Có khä nång Có Tân ÐÕo cø Thßþng giá ,H½n næa ÐÕo cø Cüa S¯ lßþng Cûng là có HÕn Cüa .")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	
end
