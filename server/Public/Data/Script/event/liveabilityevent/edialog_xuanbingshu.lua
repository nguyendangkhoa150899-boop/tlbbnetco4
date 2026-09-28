--¶Ô»°ÊÂ¼ş npc°×Ó±Ã÷

--½Å±¾ºÅ
x713614_g_ScriptId = 713512

--¶Ô»°ÄÚÈİ
x713614_g_dialog = {"#{event_liveabilityevent_0017}",
			"Câu nói thÑ hai",
			"Chï c¥n huynh h÷c kÛ nång tr°ng tr÷t là có th¬ tr°ng ngay. T¤t nhiên, ğÆng c¤p cüa huynh càng cao, chüng loÕi cây ğßşc tr°ng càng nhi«u",
			"Chï c¥n h÷c ğßşc kÛ nång tr°ng tr÷t, t¾i mµt mänh ruµng chßa tr°ng tr÷t, höi ngß¶i coi ruµng, r°i lña ch÷n gi¯ng cây tr°ng là ğßşc",
			"#{event_liveabilityevent_0018}"}
x713614_g_button = {"Ğßşc r°i, ğßşc r°i, nói gì thñc tª ği",
			"TÕi hÕ làm thª nào ğ¬ tr°ng tr÷t ğßşc?",
			"Sau ğó thì sao?",
			"Thu hoÕch ra sao?",
			}

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x713614_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNumÊÇ¶Ô»°±àºÅ£¬ÓÃÓÚµ÷ÓÃ²»Í¬¶Ô»°
		BeginEvent(sceneId)
			AddText(sceneId, x713614_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713614_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x713614_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713614_g_ScriptId,"TÕi hÕ mu¯n tìm hi¬u tr°ng tr÷t",11,-1)
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x713614_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713614_OnAccept( sceneId, selfId, AbilityId )
end
