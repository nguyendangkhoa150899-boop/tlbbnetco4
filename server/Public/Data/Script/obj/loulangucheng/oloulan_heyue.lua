-- Â¥À¼NPC
-- ºÎÔÃ
-- ÆÕÍ¨

-- ½Å±¾ºÅ
x050110_g_ScriptId = 050110

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x050110_g_EventList = { 050220 } --050222

x050110_g_Name					= "Hà Duy®t"

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x050110_UpdateEventList( sceneId, selfId, targetId )

	--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x050110_g_Name then
		return
	end
	
	BeginEvent( sceneId )
	 	 AddText(  sceneId,  "        diêu mu¯n m¤y tråm nåm trß¾c , lâu lan bên ngoài thành cûng t×ng cây xanh thành ¤m , phß½ng thäo thê thê , nhßng ðây hªt thäy lÕi ð«u · ðây ng÷n lØa yêu ma ðích ma träo hÕ b¸ hüy trong ch¯c lát , may m¡n có ðÕi th¥n thông ngß¶i giáng thª , ðem chi phong ¤n · #G viêm ma s½n #W ðính ðích dung nham ð¤t trung . nhßng tråm nåm th¶i gian ðã qua , nåm ðó phong ¤n #R ng÷n lØa yêu ma #W ðích kªt gi¾i ðã dãn ra , chÆng l¨ nåm ðó kia trß¶ng hÕo kiªp lÕi mu¯n lÕi xu¤t hi®n nhân gian sao ? "  )
		--local i, findId
		for i, findId in x050110_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
	 	 AddNumText(  sceneId,  x050110_g_ScriptId,  " liên quan t¾i kiªm ðãng ba hoàn tr× yêu ma ",  11,  10  )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x050110_OnDefaultEvent( sceneId, selfId, targetId )
	x050110_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x050110_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent( sceneId )
	 	 AddText(  sceneId,  " #Y liên quan t¾i kiªm ðãng ba hoàn tr× yêu ma #W#r        nh§n l¤y nhi®m vø NPC : #R hà duy®t #{_INFOAIM295,68,246,  hà duy®t }#W tiªp nh§n vø ðích ði«u ki®n : nhà ch½i c¤p b§c >=#G75 c¤p #W# tâm pháp c¤p b§c >=#G45 c¤p #W# h÷p thành ðµi thä ðµi ngû nhân s¯ >=#G3 ngß¶i #W# ðµi viên ð«u · ðây có th¬ truy«n t¯ng ðích bên trong phÕm vi # tiªn vào phó bän lúc cùng hà duy®t ð¯i thoÕi ngß¶i cüa phäi là #G ðµi trß·ng #W# thä ðµi ngû t¤t cä ")
	 	 AddText(  sceneId,  " ngß¶i cûng nh§n có #G kiªm ðãng ba hoàn tr× yêu ma #W nhi®m vø . #r        nhi®m vø møc tiêu : #G tiªn vào viêm ma s½n #W , xông qua phï thü #R vß½ng diêm #W trông ch×ng ðích huy«n lôi sß¶n núi cùng #R h°ng cÑc yêu vß½ng #W tr¤n giæ ðµc chß¾ng trÕch ð¸a , cu¯i cùng chém tr× dung nham ð¤t ðích #R ng÷n lØa yêu ma #W . "  )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--local i, findId
	for i, findId in x050110_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x050110_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	--local i, findId
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x050110_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			x050110_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x050110_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x050110_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x050110_OnDie( sceneId, selfId, killerId )
end
