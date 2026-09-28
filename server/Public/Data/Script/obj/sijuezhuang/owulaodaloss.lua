--çÎç¿·å¸±±¾....
--Õ½°ÜÎÚÀÏ´ó¶Ô»°½Å±¾....

--kich ban goc hao
x893075_g_ScriptId = 893075

--¸±±¾Âß¼­kich ban goc hao....
x893075_g_FuBenScriptId = 893063


--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x893075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "Phi, này nham hi¬m ti¬u nhân ðã kêu bàng xí. Nåm ðó vì ðµc chiªm phó sß yªu truy«n cho chúng la bí bäo, hÕ ðµc sß huynh muµi ba ngß¶i" )

		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn ÀîÇïË®....	
		if 1 == CallScriptFunction( x893075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
			AddNumText( sceneId, x893075_g_ScriptId, "Quyªt chiªn BOSS Bàng xí", 10, 1 )
		end
		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn ¹ýÀîÇïË®....	
		if 2 == CallScriptFunction( x893075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
			AddNumText( sceneId, x893075_g_ScriptId, "V« Tô Châu", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Su kien liet biet lua chon hang nhat
--**********************************
function x893075_OnEventRequest( sceneId, selfId, targetId, eventId )
   if GetNumText() == 1 then

	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x893075_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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

	--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn ÀîÇïË®....	
	if 1 ~= CallScriptFunction( x893075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
		return
	end

	--Èç¹ûÕýÔÚºÍ±ðµÄBOSSChiªn ð¤u Ôò·µ»Ø....
	local ret, msg = CallScriptFunction( x893075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
	CallScriptFunction( x893075_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893075_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
      CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 195,215,10 )--´«ËÍ
  end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x893075_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 5 giây b¡t ð¥u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 4 giây b¡t ð¥u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 3 giây b¡t ð¥u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 2 giây b¡t ð¥u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 1 giây b¡t ð¥u" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Chiªn ð¤u b¡t ð¥u....
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u b¡t ð¥u" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x893075_g_FuBenScriptId, "CreateBOSS", sceneId, "PangQi_BOSS", -1, -1 )
		return
	end

end
