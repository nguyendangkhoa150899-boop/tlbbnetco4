--çÎç¿·å¸±±¾....
--Õ½°ÜÎÚÀÏ´ó¶Ô»°½Å±¾....

--½Å±¾ºÅ
x402288_g_ScriptId = 402288

--¸±±¾Âß¼­½Å±¾ºÅ....
x402288_g_FuBenScriptId = 402276


--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x402288_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_19}" )

		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔÌôÕ½ÀîÇïË®....	
		if 1 == CallScriptFunction( x402288_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
			AddNumText( sceneId, x402288_g_ScriptId, "Quyªt chiªn Lý Thu Thüy?", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x402288_OnEventRequest( sceneId, selfId, targetId, eventId )

	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x402288_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--ÊÇ²»ÊÇ¶Ó³¤....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔÌôÕ½ÀîÇïË®....	
	if 1 ~= CallScriptFunction( x402288_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
		return
	end

	--Èç¹ûÕýÔÚºÍ±ðµÄBOSSÕ½¶·Ôò·µ»Ø....
	local ret, msg = CallScriptFunction( x402288_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
	CallScriptFunction( x402288_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402288_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x402288_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr§n chiªn sau 5 giây næa b¡t ð¥u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr§n chiªn sau 4 giây næa b¡t ð¥u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr§n chiªn sau 3 giây næa b¡t ð¥u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr§n chiªn sau 2 giây næa b¡t ð¥u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr§n chiªn sau 1 giây næa b¡t ð¥u" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr§n chiªn b¡t ð¥u" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x402288_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui_BOSS", -1, -1 )
		return
	end

end
