--ËÕÖÝNPC 
--Å·Ò±×Ó
--ÆÕÍ¨

--½Å±¾ºÅ
x001066_g_ScriptId = 001066
x001066_g_ShenBingScriptId = 500503			-- ÑªÓûÉñ±øÈÎÎñ½Å±¾
x001066_g_ChongZhuScriptId = 500504			-- ÉñÆ÷ÖýÔìºÍÐÞÀí½Å±¾
x001066_g_Name			= " Âu Dã TØ "

x001066_g_eventList={}
--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x001066_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x001066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_suzhou_0020}")
		for i, eventId in x001066_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		if LuaFnGetName( sceneId, targetId ) == x001066_g_Name then
			AddNumText(sceneId,x001066_g_ScriptId,"Huyªt Døc Th¥n Binh",3,105)
		end
		AddNumText(sceneId,x001066_g_ScriptId,"Giám Ð¸nh Tß Ch¤t Trang B¸",6,4)
		AddNumText(sceneId,x001066_g_ScriptId,"#cFF0000Trang B¸ Cß¶ng Hóa",6,5)
		--AddNumText(sceneId,x001066_g_ScriptId,"Tång lên trang b??Æng c¤p",6,6)
		--AddNumText(sceneId,x001066_g_ScriptId,"Trang b?cäi biªn ngo?i h?nh",6,7)
		AddNumText(sceneId,x001066_g_ScriptId,"Gia Tång S¯ L¥n SØa Chæa",6,8)
		AddNumText(sceneId,x001066_g_ScriptId,"Trang B¸ Kh¡c Minh",6,9)
		AddNumText(sceneId,x001066_g_ScriptId,"Trang B¸ Tr× Minh",6,22)
		AddNumText(sceneId,x001066_g_ScriptId,"Giám ð¸nh lÕi Trang B¸" ,6,19)
		if LuaFnGetName( sceneId, targetId ) == x001066_g_Name then
			AddNumText(sceneId,x001066_g_ScriptId,"Ðúc Th¥n Khí" ,11,106)
		end
		AddNumText( sceneId, x001066_g_ScriptId, "Trang B¸ tãng cß¶ng g¾i thi®u", 11, 10 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001066_OnEventRequest( sceneId, selfId, targetId, eventId )

---------------------------½éÉÜ-------------------------------------------------
		if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText(sceneId,"#{function_help_055}#r")	
				AddNumText(sceneId, x001066_g_ScriptId,"Trang b¸ kh¡c minh gi¾i thi®u",11,11);
				AddNumText(sceneId, x001066_g_ScriptId,"Trang b¸ cß¶ng hóa gi¾i thi®u",11,12);
				AddNumText(sceneId, x001066_g_ScriptId,"Trang b¸ tß ch¤t giám ð¸nh gi¾i thi®u",11,13);
				--AddNumText(sceneId, x001066_g_ScriptId,"Cäi biªn trang b¸ ngoÕi hình gi¾i thi®u",11,14);				
				AddNumText(sceneId, x001066_g_ScriptId,"Mµt l¥n næa giám ð¸nh trang b¸ tß ch¤t gi¾i thi®u",11,29);
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	
		if GetNumText() == 11 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_044}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 12 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_045}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 13 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_046}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 14 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_047}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	

		if GetNumText()== 15 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1002)
			return
		end

		if GetNumText() == 16 then
	   	        BeginUICommand( sceneId )
		        UICommand_AddInt( sceneId, selfId )
                        UICommand_AddInt( sceneId, 11)
                        UICommand_AddInt( sceneId, 50000)---ÐèÒªµÄÇ®
	                UICommand_AddInt( sceneId, 10000000) --×°±¸¿ªÊ¼
	                UICommand_AddInt( sceneId, 20000000)  --×°±¸½áÊø
	                UICommand_AddInt( sceneId, -1)  --ÎïÆ·id
		        UICommand_AddString(sceneId,"×°±¸Ç¿»¯¡¤¾íÖá");
		        UICommand_AddString(sceneId,"#{ZBQHJ_130508_7}");
		        UICommand_AddString(sceneId,"Çë½«×°±¸·ÅÈë´Ë¿ò");
		        UICommand_AddString(sceneId,"Çë½«Ç¿»¯¾íÖá·ÅÈë´Ë¿ò");
		        EndUICommand( sceneId )
		        DispatchUICommand( sceneId,selfId,21090722)
			return
		end

		if GetNumText() == 20 then
            BeginUICommand(sceneId)
		    UICommand_AddInt(sceneId,targetId);
		    EndUICommand(sceneId )
		    DispatchUICommand(sceneId,selfId, 20130521  )
            return
        end
		if GetNumText() == 29 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_097}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		--------------------------------------------------------------------------
		
		-- ×°±¸×ÊÖÊ¼ø¶¨
		if GetNumText() == 4 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1001 )
			return
		end

		-- ×°±¸Ç¿»¯
		if GetNumText() == 5 then
		        BeginEvent(sceneId)
		        AddText(sceneId,"#{ZBQHJ_130508_1}")
		        AddNumText(sceneId,x001066_g_ScriptId,"#cffcc00SØ døng #G Cß¶ng Hóa ÐÕo Cø #cffcc00Cß¶ng Hóa Trang B¸",6,15)
		        AddNumText(sceneId,x001066_g_ScriptId,"#cffcc00SØ døng #cFF0000 Cß¶ng Hóa Quy¬n Trøc #cffcc00 Cß¶ng Hóa Trang B¸ (NEW)" ,6,16)
		        AddNumText(sceneId,x001066_g_ScriptId,"#c33ff99Cß¶ng Hóa Di Chuy¬n",6,20)
		        AddNumText(sceneId,x001066_g_ScriptId,"#cffcc00Trang B¸ cß¶ng hóa gi¾i thi®u",11,3333)
		        AddNumText(sceneId,x001066_g_ScriptId,"#cffcc00Cß¶ng hóa di chuy¬n gi¾i thi®u",11,3334)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end


		if GetNumText()==6 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1003)
			return
		end

		if GetNumText()==7 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1010)
			return
		end

		-- Ôö¼Ó¿ÉÐÞÀí´ÎÊý
		if GetNumText()==8 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1004)
			return
		end

		-- ×°±¸¿ÌÃú
		if GetNumText()==9 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1005)
			return
		end
		
		-- ×°±¸³ýÃú
		if GetNumText()==22 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1006)
			return
		end
		
		-- ÖØÐÂ¼ø¶¨×°±¸×ÊÖÊ
		if GetNumText()==19 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 112233)
			return
		end
		
		-- ÑªÔ¡Éñ±ø
		if GetNumText() == 105 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{XYSB_20070928_001}")				
				CallScriptFunction( x001066_g_ShenBingScriptId, "OnEnumerate",sceneId, selfId, targetId )
				CallScriptFunction( x001066_g_ChongZhuScriptId, "OnEnumerate",sceneId, selfId, targetId )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		if GetNumText() == 106 then
			BeginEvent(sceneId)						
				AddText( sceneId, "#{XYSB_20070928_011}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		if eventId == x001066_g_ShenBingScriptId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end	
		
		if eventId == x001066_g_ChongZhuScriptId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end	
		
		for i, findId in x001066_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
				return
			end
		end
		
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x001066_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
	end
	
--	local i				= 1
--	local findId	= 0
--	for i, findId in x001066_g_eventList do
--		if missionScriptId == findId then
--			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
--			if ret > 0 then
--				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
--			end
--			return
--		end
--	end

end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x001066_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		x001066_UpdateEventList( sceneId, selfId, targetId )
		return
	end	

end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x001066_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end	

end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x001066_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end	

end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x001066_OnDie( sceneId, selfId, killerId )
end

--**********************************
--Ìá½»ÎïÆ·
--**********************************
function x001066_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
	if scriptId == x001066_g_ShenBingScriptId or scriptId == x001066_g_ChongZhuScriptId then
		CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
		return
	end
	
end
