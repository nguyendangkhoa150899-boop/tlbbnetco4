--çÎç¿·å¸±±¾....
--¹þ´ó°Ô¶Ô»°½Å±¾....

--kich ban goc hao
x893070_g_ScriptId = 893070

--¸±±¾Âß¼­kich ban goc hao....
x893070_g_FuBenScriptId = 893063

--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x893070_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"  Ti«n phß½ng chính là TÑ tuy®t trang. Chúng ta phäi ði vào · ch± sâu trong tài nång tìm ðßþc bí bào. Ð¥u tiên là phäi thông qua TÑ tuy®t ði®n")
		AddText(sceneId,"  TÑ tuy®t trong ði®n có r¤t nhi«u hµ v®, nhßng chï mu¯n nghe ðªn trong ði®n tÑ tuy®t tiªng chuông, s¨ r¶i ði. Ta có th¬ làm cho c§n chiªn môn phái lën vào xao chung, nªu không cûng chï có th¬ xông vào")

		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn ....	
		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MinMo" ) then
		AddText(sceneId,"   Trong ði®n hµ v­ ðã mu¯n thanh lí, ta ði ðem tÑ tuy®t chi thß sinh mçn m£c ðßa t¾i, m÷i ngß¶i mau b¡t giæ h¡n, ð¬ cho ta ép höi h¡n bí bäo bäo t°n ð¸a phß½ng. H¡n phi thß¶ng thích bÕch [ðem tiªn rßþu]. M²i l¥n sÑ tuy®t kÛ th¶i ði¬m ð«u ðã ngâm xß¾ng v×a l§t. M÷i ngß¶i chï c¥n chú ý né tránh h¡n phát ra ðem tiªn mùi rßþu kính, thoäi mái b¡t giæ h¡n không là v¤n ð«")
		    AddNumText( sceneId, x893070_g_ScriptId, "Khiêu chiªn BOSS Mçn m£c", 10, 1 )
		end
		--ÅÐ¶Ïµ±Ç°ÊÇ·ñKhiêu chiªn Íê±ÏÖ®ºó´«ËÍ....	
		if 0 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		    AddNumText( sceneId, x893070_g_ScriptId, "Truy«n t¯ng tiªp theo", 10, 2 )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Su kien liet biet lua chon hang nhat
--**********************************
function x893070_OnEventRequest( sceneId, selfId, targetId, eventId )

   if GetNumText() == 1 then

	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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
	local ret, msg = CallScriptFunction( x893070_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn É£ÍÁ¹«....	
	if 1 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MinMo" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ngß½i ðã mu¯n khiêu chiªn ta" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
	CallScriptFunction( x893070_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893070_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 101, 52)

  end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x893070_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 5 giây b¡t ð¥u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 4 giây b¡t ð¥u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 3 giây b¡t ð¥u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 2 giây b¡t ð¥u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 1 giây b¡t ð¥u" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Chiªn ð¤u b¡t ð¥u....
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u b¡t ð¥u" )
		--É¾³ýNPC....
		--CallScriptFunction( x893070_g_FuBenScriptId, "DeleteBOSS", sceneId, "MinMo_NPC" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x893070_g_FuBenScriptId, "CreateBOSS", sceneId, "MinMo_BOSS", -1, -1 )
		return
	end

end
