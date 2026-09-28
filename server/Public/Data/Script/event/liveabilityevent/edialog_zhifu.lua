--¶Ô»°ÊÂ¼ş npc°×Ó±Ã÷

--½Å±¾ºÅ
x713617_g_ScriptId = 713512

--¶Ô»°ÄÚÈİ
x713617_g_dialog = {"Nªu các hÕ có mµt tâm h°n thanh cao, s¨ th¤y hái thu¯c là công vi®c ğáng mªn, c¥m theo chiªc li«m nhö, lang thang trong núi cùng bè bÕn v¾i mùi hß½ng và tiªng chim, trong khoänh kh¡c phát hi®n ra cây thu¯c quı, cäm giác hÕnh phúc ğó không phäi ngß¶i nào cûng có ğßşc, b·i vì nhæng ngß¶i ğó trong lòng chï biªt ğªn ti«n, vi®c t¯t ğ©p ğªn m¤y trong m¡t h÷ cûng chï có nghîa là ğáng nhi«u ti«n h½n",
			"Câu nói thÑ hai",
			"Chï c¥n huynh h÷c kÛ nång tr°ng tr÷t là có th¬ tr°ng ngay. T¤t nhiên, ğÆng c¤p cüa huynh càng cao, chüng loÕi cây ğßşc tr°ng càng nhi«u",
			"Chï c¥n h÷c ğßşc kÛ nång tr°ng tr÷t, t¾i mµt mänh ruµng chßa tr°ng tr÷t, höi ngß¶i coi ruµng, r°i lña ch÷n gi¯ng cây tr°ng là ğßşc",
			"Sau khi b¡t ğ¥u tr°ng tr÷t, s¨ nhìn th¤y trên ğ°ng hi®n ra nhæng m¥m non, các hÕ có th¬ tranh thü ği làm vi®c khác, không c¥n phäi trông coi. Nhßng ğ×ng quên sau 40 phút phäi quay lÕi thu hoÕch, nªu quá 50 phút ngß¶i khác s¨ thu hoÕch m¤t cüa các hÕ."}
x713617_g_button = {"Ğßşc r°i, ğßşc r°i, nói gì thñc tª ği",
			"TÕi hÕ làm thª nào ğ¬ tr°ng tr÷t ğßşc?",
			"Sau ğó thì sao?",
			"Thu hoÕch ra sao?",
			}

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x713617_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNumÊÇ¶Ô»°±àºÅ£¬ÓÃÓÚµ÷ÓÃ²»Í¬¶Ô»°
		BeginEvent(sceneId)
			AddText(sceneId, x713617_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713617_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x713617_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713617_g_ScriptId,"TÕi hÕ mu¯n tìm hi¬u tr°ng tr÷t",11,-1)
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x713617_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713617_OnAccept( sceneId, selfId, AbilityId )
end
