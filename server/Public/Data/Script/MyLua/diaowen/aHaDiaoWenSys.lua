--½Å±¾ºÅ
x391001_g_scriptId = 391001
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x391001_OnDefaultEvent( sceneId, selfId, targetId)
	BeginEvent(sceneId) 
		AddText(sceneId,"#{ZBDW_091105_1}")			
		--AddText(sceneId, "ÔÝ²»¿ª·Å,×øÆï,Ê±×°,°Ù±¦Ïä,°Ù±¦ÄÒµñÎÆ")
		--AddText(sceneId, "#GLão Sß Ðiêu Vån")----#B°µÆ÷ÔÝ²»Ö§³ÖË«¼«
		--AddText(sceneId, "#GÇë×¢Òâ£º#B±ùÆÇÉñÕëµñÎÆ²Ù×÷ÐèÒªÕª³ý±¦Ê¯ÇÒÇ¿»¯À©Õ¹¼¼ÄÜ½«ÏûÊ§")
        AddNumText(sceneId, x391001_g_scriptId,"Hþp Thành Ðiêu Vån", 6, 1)
		AddNumText(sceneId, x391001_g_scriptId,"#GKh¡c Ðiêu Vån", 6, 2)
		AddNumText(sceneId, x391001_g_scriptId,"#cff6633Cß¶ng Hóa Ðiêu Vån ", 6, 3)
		AddNumText(sceneId, x391001_g_scriptId,"#cFF0000Cß¶ng Hóa Ðiêu Vån Song Cñc", 6, 6)
		AddNumText(sceneId, x391001_g_scriptId,"#cFF0000Tháo Ðiêu Vån Song Cñc", 6, 7)
		AddNumText(sceneId, x391001_g_scriptId,"#cff6633Tháo Ðiêu Vån", 6, 4)		
		--AddNumText(sceneId, x391001_g_scriptId,"roi di", 11, 5)
		--AddNumText(sceneId, x391001_g_scriptId,"ÎÒÖ»ÊÇÂ·¹ýµÄ", 8, 9999)
		EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x391001_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key=GetNumText()
	if key==9999 then
		x391001_CloseMe(sceneId, selfId)
	elseif key==1 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000156)
	elseif key==2 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2000156)
	elseif key==3 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,2)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3000156)
	elseif key==4 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 4000156)
	elseif key==5 then
		BeginEvent(sceneId)     
			AddText(sceneId, "#{ZBDW_091105_21}")
		AddText(sceneId, "    #Gti?u ?? k? : b¨ºn ph?i ki?n ?i?m k¨ªch trang b? ¡¢ t¨¤i li?u ti?n h¨¤nh thao t¨¢c , ch? c¨® ??c ??nh cao c?p trang b? m?i c¨® th? ?i¨ºu v?n .")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key==6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,4)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3770156)--3770156
	elseif key==7 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3780156)
	end
end
--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x391001_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--ÐÑÄ¿ÌáÊ¾
--**********************************
function x391001_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--¹Ø±Õ¶Ô»°¿ò
--**********************************
function x391001_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end