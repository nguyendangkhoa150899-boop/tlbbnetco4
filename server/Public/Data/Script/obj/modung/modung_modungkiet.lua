--¶ëáÒNPC
--ÀîÊ®¶þÄï
--ÆÕÍ¨

x960004_g_scriptId = 960004
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x960004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"TÕi hÕ là Mµ Dung Ki®t, trß·ng môn ðang nghiên cÑu thu§t #GDi Hình Hoán Änh#W nên m÷i vi®c sß môn tÕm th¶i do ta ðäm nhi®m.")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x960004_g_scriptId, "#WV«#G LÕc Dß½ng #WGia nh§p môn phái",6,9999)
		end
		AddNumText(sceneId, x960004_g_scriptId, "Gi¾i thi®u môn phái",8,1)
		AddNumText(sceneId, x960004_g_scriptId, "H÷c KÛ nång cüa môn phái?",8,8)		--Ö¸Â·µ½¼¼ÄÜÑ§Ï°ÈË


	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x960004_OnDefaultEvent( sceneId, selfId,targetId )
	x960004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x960004_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x960004_g_MenPai = GetMenPai(sceneId, selfId)
		if x960004_g_MenPai == 10 then
			BeginEvent(sceneId)
				AddText(sceneId, "Ngß½i lÕi t¾i qu¤y r¥y sß phø, ngß½i ðã là ð® tØ phái Mµ Dung, còn bái sß gì næa")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x960004_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i ðã là cao ð° cüa môn phái khác, chúng ta không thu nh§n ngß½i")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{GUSU_MENPAI_25}")
			AddNumText(sceneId, x960004_g_scriptId, "Ta mu¯n gia nh§p phái Mµ Dung",6,3)
			AddNumText(sceneId, x960004_g_scriptId, "TÕi hÕ chßa mu¯n bái sß",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end

	if GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"Hãy s¡p xªp lÕi tay näi, c¥n 2 v¸ trí tr¯ng, ta s¨ thß·ng cho ngß½i!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ hãy ðþi t¾i sau c¤p 10 lÕi t¾i bái sß h÷c ngh®!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x960004_g_MenPai = GetMenPai(sceneId, selfId)
			if x960004_g_MenPai == 10 then
				BeginEvent(sceneId)
					AddText(sceneId, "Ngß½i lÕi t¾i qu¤y r¥y sß phø, ngß½i ðã là ð® tØ phái Nga My, còn bái sß gì næa")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--·µ»ØÖµÎª9±íÊ¾ÎÞÃÅÅÉ
			elseif x960004_g_MenPai==9	then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 10)

				-- ÉèÖÃ³õÊ¼µÄNpc¹ØÏµÖµ
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )
				
				-- °ÑÏà¹ØµÄÐÄ·¨ÉèÖÃÎª10¼¶±ð  25£¬28£¬29
				LuaFnSetXinFaLevel(sceneId,selfId,64,10)
				LuaFnSetXinFaLevel(sceneId,selfId,67,10)
				LuaFnSetXinFaLevel(sceneId,selfId,68,10)
				LuaFnSetXinFaLevel(sceneId,selfId,70,10)
				LuaFnSetXinFaLevel(sceneId,selfId,71,10)
				
				BeginEvent(sceneId)
					AddText(sceneId,"Các hÕ ðã gia nh§p phái Mµ Dung!");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				--¸øÍæ¼Ò·¢ÐÅ,¸æËßËûµ½ÄÄÀï´ò¹Ö,ÔõÑù×¬Ç®
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_10}" )
				
				--ÃÅÅÉ½±ÀøÕÙ¼¯Áî
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x960004_MsgBox( sceneId, selfId, "Nh§n ðßþc 20 cái Môn Phái Tri®u T§p L®nh!" )
				
				if TryRecieveItem( sceneId, selfId, 10124198, 1 ) >= 0 then
					str		= "#YCác hÕ ðã nh§n ðßþc "..GetItemName( sceneId, 10124198 ).."."
					x960004_MsgBox( sceneId, selfId, str )
				end

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"Các hÕ ðã gia nh§p phái Nga My!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
					CallScriptFunction( 226900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"Các hÕ ðã gia nh§p phái Nga My!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
					CallScriptFunction( 226900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ngß½i ðã là cao ð° cüa môn phái khác, chúng ta không thu nh§n ngß½i.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_gusu_0001}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x960004_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_EMEI )
				return
			end
		end
	end

		if GetNumText()==8 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ð® tØ Mµ Dung có th¬ h÷c ðßþc kÛ nång môn phái qua ngß¶i truy«n thø võ h÷c Mµ Dung Thanh S½n#H[48,134]#W.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
			
	end

	--Ö¸Â·
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "Mµ Dung Th¡ng [68,125] có th¬ dÕy ngß½i kÛ nång chiªn ð¤u cüa phái ta, cô ta · ngay bên cÕnh.")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 98, 51, "Mµ Dung Th¡ng" )
		return
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x960004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x960004_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x960004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x960004_g_eventList do
		if missionScriptId == findId then
			x960004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x960004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x960004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x960004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x960004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x960004_OnDie( sceneId, selfId, killerId )
end

--**********************************
--ÏûÏ¢ÌáÊ¾
--**********************************
function x960004_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
