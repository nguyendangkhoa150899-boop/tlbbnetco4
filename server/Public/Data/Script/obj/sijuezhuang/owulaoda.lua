--çÎç¿·å¸±±¾....
--ÎÚÀÏ´ó¶Ô»°½Å±¾....

--kich ban goc hao
x893072_g_ScriptId = 893072

--¸±±¾Âß¼­kich ban goc hao....
x893072_g_FuBenScriptId = 893063

--Õ½°ÜÎÚÀÏ´ó¶Ô»°kich ban goc hao....
x893072_g_LossScriptId = 893075

--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x893072_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)

		AddText( sceneId, "    N½i này chính là t¥n v§n ch² tây v§n các. Theo taði«u tra tin, t¥n v§n có chúc änh diêu h°ng cùng màu vàng dû ði®u hai ðÕi tuy®t kÛ. #rChúc änh diêu h°ng s¨ là ngß½i thß½ng t±n chính ðµi ngü cüa minh" )
		AddText( sceneId, "    Màu vàng vû ði®u còn lÕi là dña vào h°i âm phiên cß¶ng hóa t¥n v§n công lñc, nghe nói có ðem nhân kích b¸ m¤t mÕng uy lñc #rcác ngß½i chu¦n b¸ t¯t li«n cho ta biªt, ta cái này ði dçn t¥n v§n ði ra" )

		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
		    AddNumText( sceneId, x893072_g_ScriptId, "Khiêu chiªn BOSS T¥n v§n", 10, 1 )
		end

		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn ÀîÇïË®....	
		if 0 ~= CallScriptFunction( x893072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
		    AddNumText( sceneId, x893072_g_ScriptId, "Truy«n t¯ng tiªp theo", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Su kien liet biet lua chon hang nhat
--**********************************
function x893072_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then

	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x893072_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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

	--Èç¹ûÕýÔÚºÍ±ðµÄBOSSChiªn ð¤u Ôò·µ»Ø....
	local ret, msg = CallScriptFunction( x893072_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn ÎÚÀÏ´ó....	
		if 1 ~= CallScriptFunction( x893072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
			BeginEvent(sceneId)
				AddText( sceneId, "#{PMF_20080521_11}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
		CallScriptFunction( x893072_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893072_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 28, 57)
  end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x893072_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 5 giây b¡t ð¥u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 4 giây b¡t ð¥u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 3 giây b¡t ð¥u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 2 giây b¡t ð¥u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 1 giây b¡t ð¥u" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Chiªn ð¤u b¡t ð¥u....
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u b¡t ð¥u" )
		--É¾³ýNPC....
		--CallScriptFunction( x893072_g_FuBenScriptId, "DeleteBOSS", sceneId, "TaoQin_NPC" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x893072_g_FuBenScriptId, "CreateBOSS", sceneId, "TaoQin_BOSS", -1, -1 )
		return
	end

end
