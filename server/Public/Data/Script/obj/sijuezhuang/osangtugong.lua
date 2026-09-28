--çÎç¿·å¸±±¾....
--É£ÍÁ¹«¶Ô»°½Å±¾....

--kich ban goc hao
x893071_g_ScriptId = 893071

--¸±±¾Âß¼­kich ban goc hao....
x893071_g_FuBenScriptId = 893063

--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x893071_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "   N½i này chính là Ðào thanh ch² bàn long các. Giang h° ð°n ðãi ðào thanh hai m¡t nhân b®nh hi¬m nghèo, ðã mu¯n không th¬ nhìn v§t. Nhßng công phu vçn r¤t lþi hÕi là tÑ tuy®t trang trung t¯i cß¶ng. #rÐào thanh chån nuôi tÑ chích m£c h± cùng mß¶i chích thanh ßng, chúng nó ð¯i v¾i ðào thanh r¤t mñc trung thành và t§n tâm. Nªu trong chiªn ð¤u xu¤t hi®n trong l¶i nói, nh¤t ð¸nh phäi tiªn lui" )
		AddText( sceneId, "   M£t khác h¡n còn có hÕng nh¤t tuy®t kÛ --tam phong lßu vân. SØ xu¤t ðªn sau, ðào thanh hµi  nhß quÖ th¥n bình thß¶ng, xu¤t quÖ nh§p th¥n. Nghe nói, kÛ nång này có v×a vÞ trán, häo häo lþi døng có th¬ ðem tam phong lßu vân c¤p phá #r các ngß½i chu¦n b¸ t¯t li«n cho ta biªt, ta cái này ði dçn ðào thanh ði ra" )
		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		    AddNumText( sceneId, x893071_g_ScriptId, "Khiêu chiªn BOSS Ðào thanh", 10, 1 )
		end
		if 0 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
		    AddNumText( sceneId, x893071_g_ScriptId, "Truy«n t¯ng tiªp theo", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Su kien liet biet lua chon hang nhat
--**********************************
function x893071_OnEventRequest( sceneId, selfId, targetId, eventId )
   if GetNumText() == 1 then
	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x893071_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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
	local ret, msg = CallScriptFunction( x893071_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔKhiêu chiªn É£ÍÁ¹«....	
	if 1 ~= CallScriptFunction( x893071_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ngß½i ðã mu¯n khiêu chiªn ta" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
	CallScriptFunction( x893071_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893071_g_ScriptId, -1, -1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 73, 91)
  end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x893071_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 5 giây b¡t ð¥u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 4 giây b¡t ð¥u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 3 giây b¡t ð¥u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 2 giây b¡t ð¥u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u 1 giây b¡t ð¥u" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Chiªn ð¤u b¡t ð¥u....
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chiªn ð¤u b¡t ð¥u" )
		--É¾³ýNPC....
		--CallScriptFunction( x893071_g_FuBenScriptId, "DeleteBOSS", sceneId, "QinYun_NPC" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x893071_g_FuBenScriptId, "CreateBOSS", sceneId, "QinYun_BOSS", -1, -1 )
		return
	end

end
