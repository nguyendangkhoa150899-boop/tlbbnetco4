--çÎç¿·å¸±±¾....
--Õ½°ÜÎÚÀÏ´ó¶Ô»°½Å±¾....

--½Å±¾ºÅ
x894075_g_ScriptId = 894075

--¸±±¾Âß¼­½Å±¾ºÅ....
x894075_g_FuBenScriptId = 894063


--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x894075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#RGia Lu§t Liên Thành")
		AddText(sceneId,"      Th§t không biªt s¯ng chªt là gì. Dám ðªn #YKhiêu chiªn #Wv¾i Ta sao")

		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔÌôÕ½ÀîÇïË®....	
		if 1 == CallScriptFunction( x894075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "YeLvLian" ) then
			AddNumText( sceneId, x894075_g_ScriptId, "Khiêu Chiªn...", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x894075_OnEventRequest( sceneId, selfId, targetId, eventId )

	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x894075_g_FuBenScriptId, "IBQZSTimerRunning", sceneId ) then
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
	if 1 ~= CallScriptFunction( x894075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "YeLvLian" ) then
		return
	end

	--Èç¹ûÕýÔÚºÍ±ðµÄBOSSÕ½¶·Ôò·µ»Ø....
	local ret, msg = CallScriptFunction( x894075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
	CallScriptFunction( x894075_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x894075_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x894075_OnBQZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x894075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu chiên sau 5 giây" )
		return
	end

	if 6 == step then
		CallScriptFunction( x894075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu chiên sau 4 giây" )
		return
	end

	if 5 == step then
		CallScriptFunction( x894075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu chiên sau 3 giây" )
		return
	end

	if 4 == step then
		CallScriptFunction( x894075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu chiên sau 2 giây" )
		return
	end

	if 3 == step then
		CallScriptFunction( x894075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu chiên sau 1 giây" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x894075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu chiên b¡t ð¥u" )
		--É¾³ýNPC....
		CallScriptFunction( x894075_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiFan_NPC" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x894075_g_FuBenScriptId, "CreateBOSS", sceneId, "YeLvLian_BOSS", -1, -1 )
		return
	end

end
