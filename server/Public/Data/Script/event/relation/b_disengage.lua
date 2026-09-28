-- Ç¿ÖÆ½â³ý½á°ÝÈÎÎñ

--½Å±¾ºÅ
x806000_g_scriptId = 806000

--ÌáÊ¾ÐÅÏ¢
x806000_g_msg_swear					= {}
x806000_g_msg_swear["uns"]	= "Giäi tr× kªt bái"
x806000_g_msg_swear["cas"]	= " Chßa t×ng kªt bái nên không th¬ giäi tr× quan h® kªt bái"
x806000_g_msg_swear["unc"]	= " Sau khi giäi tr× quan h® kªt bái, ðµ hæu häo v¾i ngß¶i ch½i kªt bái s¨ tøt xu¯ng 500. Xin höi có mu¯n giäi quan h® kªt bái hay không?"

--Key for AddNumText
x806000_g_key					= {}
x806000_g_key["uns"]	= 10000	--½â³ý½á°Ý
x806000_g_key["all"]	= 20000	--Í¬Òâ½â³ý½á°Ý
x806000_g_key["una"]	= 30000	--È¡Ïû½â³ý½á°Ý

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x806000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806000_g_scriptId, x806000_g_msg_swear["uns"], 6, x806000_g_key["uns"] )
end


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x806000_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()

	--½â³ý½á°Ý
	if key == x806000_g_key["uns"] then
		if x806000_CheckAccept( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		x806000_OnSubmit( sceneId, selfId, targetId )
		return 1
	end

	--Í¬Òâ½â³ý
	if key == x806000_g_key["all"] then
		x806000_DoUnswear( sceneId, selfId, targetId )

		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end

	--È¡Ïû½â³ý
	if key == x806000_g_key["una"] then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x806000_CheckAccept( sceneId, selfId, targetId )
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	if BrotherNum == 0 then
		x806000_MessageBox( sceneId, selfId, targetId, x806000_g_msg_swear["cas"] )
		return 0
	end
end

--**********************************
--È·ÈÏ´°¿Ú
--**********************************
function x806000_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x806000_g_msg_swear["unc"] )
		AddNumText( sceneId, x806000_g_scriptId, "Duy®t", 6, x806000_g_key["all"] )
		AddNumText( sceneId, x806000_g_scriptId, "Hüy", 8, x806000_g_key["una"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x806000_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end


--**********************************
--Ç¿ÖÆ½â³ý½á°Ý
--**********************************
function x806000_DoUnswear( sceneId, selfId, targetId )
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	local selfName = LuaFnGetName( sceneId, selfId )
	local selfGuid = LuaFnGetGUID( sceneId, selfId )
	local AllDismiss = 0
	
	--Èç¹ûÍÅÌåÖÐÖ»ÓÐÁ½¸öÈË£¬ÔòÈ«²¿½âÉ¢
	if BrotherNum == 1 then
		AllDismiss = 1
	end
	
	--É¾³ý³ÆºÅ
	AwardJieBaiTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )
	
	--´¢´æºÃÓÑµÄGUID
	local i = 0
	local BrotherGuid = {}
	while i < BrotherNum do
		BrotherGuid[i] = LuaFnGetBrotherGuid(sceneId, selfId, i)
		i = i + 1
	end

	--ÖðÒ»µÄ½â³ý½á°Ý¹ØÏµ	
	i = 0
	while i < BrotherNum do
		local theGUID = BrotherGuid[i]
		if theGUID ~= nil then

			--½µµÍÓÑºÃ¶Èµ½500
			local FriendPoint = LuaFnGetFriendPointByGUID( sceneId, selfId, theGUID )
			if FriendPoint > 500 then
				LuaFnSetFriendPointByGUID( sceneId, selfId, theGUID, 500 )
			end

			--È¡Ïû½á°Ý
			LuaFnUnswear( sceneId, selfId, theGUID )

			--·¢ËÍÆÕÍ¨ÓÊ¼þ
			local FriendName = LuaFnGetFriendName( sceneId, selfId, theGUID )
			LuaFnSendSystemMail( sceneId, FriendName, selfName .. "Ðã xóa bö quan h® kªt bái v¾i các hÕ" )
			--LuaFnSendNormalMail( sceneId, selfId, FriendName, selfName .. "Ðã xóa bö quan h® kªt bái v¾i các hÕ" )

			--·¢ËÍ¿ÉÖ´ÐÐÓÊ¼þ
			LuaFnSendScriptMail( sceneId, FriendName, MAIL_UNSWEAR, selfGuid, AllDismiss, 0 )

		end
		i = i + 1
	end
	
end
