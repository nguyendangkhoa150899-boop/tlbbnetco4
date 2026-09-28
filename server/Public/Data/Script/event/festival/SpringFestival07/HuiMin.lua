--YanBi
x050060_g_scriptId = 050060

--**********************************
--Main
--**********************************
function x050060_OnDefaultEvent( sceneId, selfId)
	BeginEvent(sceneId)     
		AddText(sceneId, "TÕi #GSÑ Giä Môn Phái#W có th¬ tiªn hành gia nh§p môn phái!")
		AddText(sceneId, "#cFF0000Tính nång m¾i: ")
		AddText(sceneId, "-: Thêm mµt loÕt kÛ nång")
	--	AddText(sceneId, "-: Phái #GMµ Dung, Ðß¶ng Môn")
		AddText(sceneId, "-: #YÐiêu Vån #WtÕi #RLÕc Dß½ng - Trß½ng Hàng Long")
		AddText(sceneId, "-: Th¶i trang, thú cßÞi, trân thú m¾i")
		AddText(sceneId, "-: Ðøc l² trên nhi«u loÕi trang b¸! ")
		AddText(sceneId, "Trang chü: #b#Hwww.#G2tgh#W.#Ycom")
		AddText(sceneId, "[ Chúc các hÕ ch½i game vui vë! ]")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--
--**********************************
function x050060_OnEventRequest( sceneId, selfId, targetId, eventId )

end

--**********************************
--
--**********************************
function x050060_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
