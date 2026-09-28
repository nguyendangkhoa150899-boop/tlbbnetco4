--È«²¿¼ÓËø

--½Å±¾ºÅ
x808007_g_ScriptId	= 808007

--²Ù×÷¼¯
x808007_g_Key	=
{
	["hlp"]			= 1,		--°ïÖú
	["lck_s"]		= 11,		--È«²¿¼ÓËø
	["lck_sY"]	= 111,	--È«²¿¼ÓËø£¬È·¶¨
	["lck_1"]		= 10,		--µ¥¸ö¼ÓËø
	["unl_s"]		= 21,		--ÎÒÏëÁÙÊ±½âËø
	["unl_1"]		= 20,		--ÎÒÏëµ¥¸ö½âËø

	["lck_set"]	= 31,		--ÉèÖÃ¶ş¼¶ÃÜÂë
	["lck_res"]	= 30,		--ĞŞ¸Ä¶ş¼¶ÃÜÂë
}

x808007_g_Msg	=
{
	["lck"]		= "#{JSJS_090206_01}",
	["ask_l"]	= "    #{PBSD_20080103_01}",
	["unl"]		= "    Sau khi khóa toàn bµ, trang b¸ trên ngß¶i, v§t ph¦m trong tay näi, ti«n và vât ph¦m trong kho s¨ b¸ khóa toàn bµ, khi sØ døng v§t ph¦m ho£c l¤y ti«n l¥n ğ¥u c¥n phäi nh§p m§t mã c¤p 2. Các hÕ có mu¯n khóa toàn bµ không ?",
	["ask_2"]   = "#r    Gi¾i thi®u #Gtính nång m¾i: các v§t ph¦m ho£c trân thú s¨ b¸ khóa 3 ngày trß¾c khi chính thÑc m· khóa#W, Îª·ÀÖ¹Ä³Ğ©Íæ¼ÒÒòÎó²Ù×÷½«È«²¿ÎïÆ·¼ÓËø¶øÓ°ÏìÕı³£ÓÎÏ·µÄÇé¿ö£¬ÔİÊ±ÕÚÕÖÈ«²¿¼ÓËø¹¦ÄÜ£¬ÉÔºó½«ÔÙ´Î¿ª·Å¡£"
}
--ÕÊºÅ  to  ÕËºÅ

--**********************************
--½Å±¾Èë¿Úº¯Êı
--**********************************
function x808007_OnDefaultEvent( sceneId, selfId, op )

	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) == 0 then
		return
	end
	if GetLevel( sceneId, selfId ) <= 15 then
		x808007_MyNotifyTip( sceneId, selfId, "Sau c¤p 15 chÑc nång này s¨ m·" )
		return
	end
	if LuaFnIsStalling( sceneId, selfId ) == 1 then
		x808007_MyNotifyTip( sceneId, selfId, "Trong trÕng thái buôn bán không th¬ thñc hi®n thao tác này" )
		return
	end

	--¿Í»§¶Ë¿ªÆô
	if op == x808007_g_ScriptId then
		--ÊÇ·ñÒÑÉèÖÃ¶ş¼¶ÃÜÂë
		if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
			x808007_OnLockUI( sceneId, selfId )
		else
			--ÊÇ·ñ½âËø¶ş¼¶ÃÜÂë
			if LuaFnIsPasswordUnlocked( sceneId, selfId, 0 ) == 1 then
				x808007_OnLockUI( sceneId, selfId )
			else
				x808007_OnUnlockUI( sceneId, selfId )
			end
		end
		return
	end
	
	local	key	= GetNumText()

	if key == x808007_g_Key["hlp"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_090}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
		return
	elseif key == x808007_g_Key["lck_s"] then
		BeginEvent( sceneId )
			AddText( sceneId, x808007_g_Msg["ask_l"] )
			AddNumText( sceneId, x808007_g_ScriptId, "Xác nh§n", 2, x808007_g_Key["lck_sY"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
		return
	elseif key == x808007_g_Key["lck_1"] then
		BeginUICommand( sceneId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 5421 )
	elseif key == x808007_g_Key["unl_s"] then
		LuaFnSendOpResult( sceneId, selfId, OR_NEED_UNLOCKMINORPASSWORD )
	elseif key == x808007_g_Key["unl_1"] then
		BeginUICommand( sceneId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 5421 )
	elseif key == x808007_g_Key["lck_sY"] then
		x808007_OnLockAllObj( sceneId, selfId )
		return
	elseif key == x808007_g_Key["lck_set"] then
		--ÉèÖÃ¶ş¼¶ÃÜÂë
		LuaFnSendOpResult( sceneId, selfId, OR_EXE_SETPASSWORD )
	elseif key == x808007_g_Key["lck_res"] then
		--ĞŞ¸Ä¶ş¼¶ÃÜÂë
		LuaFnSendOpResult( sceneId, selfId, OR_EXE_CHANGEPASSWORD )
	end
	
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

end

--**********************************
--¼ÓËø½çÃæ
--**********************************
function x808007_OnLockUI( sceneId, selfId )

	BeginEvent( sceneId )
		AddText( sceneId, x808007_g_Msg["lck"] )
		AddNumText( sceneId, x808007_g_ScriptId, "Khóa toàn bµ", 2, x808007_g_Key["lck_s"] )
		AddNumText( sceneId, x808007_g_ScriptId, "Khóa ğ½n lë", 2, x808007_g_Key["lck_1"] )
		if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
			AddNumText( sceneId, x808007_g_ScriptId, "Thiªt l§p m§t mã c¤p 2", 2, x808007_g_Key["lck_set"] )
		else
			AddNumText( sceneId, x808007_g_ScriptId, "Thiªt l§p th¶i gian an toàn", 2, x808007_g_Key["lck_res"] )
		end
		AddNumText( sceneId, x808007_g_ScriptId, "Liên quan khóa toàn bµ", 11, x808007_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )

end

--**********************************
--½âËø½çÃæ
--**********************************
function x808007_OnUnlockUI( sceneId, selfId )

	BeginEvent( sceneId )
		AddText( sceneId, x808007_g_Msg["unl"] )
		AddNumText( sceneId, x808007_g_ScriptId, "Ta mu¯n m· khóa trß¾c khi thao tác", 2, x808007_g_Key["unl_s"] )
		AddNumText( sceneId, x808007_g_ScriptId, "Ta mu¯n m· khóa 1 v§t ph¦m", 2, x808007_g_Key["unl_1"] )
		if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
			AddNumText( sceneId, x808007_g_ScriptId, "Thay ğ±i m§t mã c¤p 2", 2, x808007_g_Key["lck_set"] )
		else
			AddNumText( sceneId, x808007_g_ScriptId, "Thiªt l§p th¶i gian an toàn", 2, x808007_g_Key["lck_res"] )
		end
		AddNumText( sceneId, x808007_g_ScriptId, "Liên quan khóa toàn bµ", 11, x808007_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )

end

--**********************************
--¶ş¼¶ÃÜÂëËø¶¨ËùÓĞÎïÆ·¡¢³èÎï
--**********************************
function x808007_OnLockAllObj( sceneId, selfId )

	--ÊÇ·ñÒÑÉèÖÃ¶ş¼¶ÃÜÂë
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
		LuaFnSendOpResult( sceneId, selfId, OR_NEED_SETMINORPASSWORD )
	else
		SetAllItemPWLock( sceneId, selfId, 1 )
		SetAllPetPWLock( sceneId, selfId, 1 )
		x808007_MyNotifyTip( sceneId, selfId, "Khóa thành công" )
		BeginUICommand( sceneId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end

end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x808007_MyNotifyTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
