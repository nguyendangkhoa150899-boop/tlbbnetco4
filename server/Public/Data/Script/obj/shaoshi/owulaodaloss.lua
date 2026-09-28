--çÎç¿·å¸±±¾....
--Õ½°ÜÎÚÀÏ´ó¶Ô»°½Å±¾....

--½Å±¾ºÅ
x890075_g_ScriptId = 890075

--¸±±¾Âß¼­½Å±¾ºÅ....
x890075_g_FuBenScriptId = 890063


--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x890075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"Mu¯n hoàn thành nhi®m vø các hÕ c¥n phäi #Gchiªn th¡ng #Wl¥n lßþt các #YCao thü #Wtrong #HThiªu Th¤t S½n")
		AddText(sceneId,"#R1. #WTiêu di®t #YCßu Ma Trí")
		AddText(sceneId,"#R2. #WTiêu di®t #GTrang Tø Hi«n")
		AddText(sceneId,"#R3. #WTiêu di®t #cff0000Mµ Dung Phøc")
		AddText(sceneId,"#R4. #WTiêu di®t #HÐinh Xuân Thu")
		--ÅÐ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔÌôÕ½ÀîÇïË®....	
		if 1 == CallScriptFunction( x890075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
			AddNumText( sceneId, x890075_g_ScriptId, "Khiêu Chiªn #GÐinh Xuân Thu", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x890075_OnEventRequest( sceneId, selfId, targetId, eventId )
   if GetNumText() == 1 then

	--Èç¹ûÕýÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x890075_g_FuBenScriptId, "IsSSSTimerRunning", sceneId ) then
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
	if 1 ~= CallScriptFunction( x890075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
		return
	end

	--Èç¹ûÕýÔÚºÍ±ðµÄBOSSÕ½¶·Ôò·µ»Ø....
	local ret, msg = CallScriptFunction( x890075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
	CallScriptFunction( x890075_g_FuBenScriptId, "OpenSSSTimer", sceneId, 7, x890075_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	BeginEvent(sceneId)
		AddText(sceneId,"Th§t không biªt tñ lßþng sÑc mình. Dám #GKhiêu chiªn #Wv¾i #YÐinh Xuân Thu #WTa sao...Mu¯n chªt s½m r°i hä ?")
		    AddNumText( sceneId, x890075_g_ScriptId, "Ch¤p nh§n #cff0000Ðinh Xuân Thu", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
  end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x890075_OnSSSTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "Ch¤p nh§n Khiêu chiªn sau 5 giây" )
		return
	end

	if 6 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "Ch¤p nh§n Khiêu chiªn sau 4 giây" )
		return
	end

	if 5 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "Ch¤p nh§n Khiêu chiªn sau 3 giây" )
		return
	end

	if 4 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "Ch¤p nh§n Khiêu chiªn sau 2 giây" )
		return
	end

	if 3 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "Ch¤p nh§n Khiêu chiªn sau 1 giây" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "Khiêu Chiªn B¡t Ð¥u" )
		--É¾³ýNPC....
		CallScriptFunction( x890075_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiFan_NPC" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x890075_g_FuBenScriptId, "CreateBOSS", sceneId, "DingChunQiu_BOSS", -1, -1 )
		return
	end

end
