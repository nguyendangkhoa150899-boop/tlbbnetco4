--ÐÇËÞNPC
--Ììè¯×Ó
--ÆÕÍ¨

x017512_g_scriptId = 017512

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x017512_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ngày trß¾c Trß½ng Long xu¤t hi®n báo có tin chÆng may cho Ðß¶ng Môn, có vài ác t£c ðªn khu¤y ðµng b±n môn. Ngß½i có b¢ng lòng ð°ng ý tß½ng trþ?")
		--AddNumText(sceneId,x017512_g_scriptId,"Ð°ng ý",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x017512_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<80  then	
			BeginEvent( sceneId )
			local strText = "Tß½ng trþ ngß¶i trong giang h° r¤t nguy hi¬m ð«u trên c¤p 80, nhìn ngß½i võ công thông thß¶ng ta không dám mang ngß½i ði"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 527,27,137)
		end
	end
end
