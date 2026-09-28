--´óÀíNPC
--´Ş·ê¾Å
--ÆÕÍ¨

x002026_g_ScriptId	= 002026

--ÃÅÅÉĞÅÏ¢(ÃÅÅÉÃû³Æ£¬SceneID£¬PosX£¬PosY£¬ÃÅÅÉID)
x002026_g_mpInfo		= {}
x002026_g_mpInfo[0]	= { "Tinh Túc", 16,  96, 152, MP_XINGSU }
x002026_g_mpInfo[1]	= { "Tiêu Dao", 14,  67, 145, MP_XIAOYAO }
x002026_g_mpInfo[2]	= { "Thiªu Lâm",  9,  96, 127, MP_SHAOLIN }
x002026_g_mpInfo[3]	= { "Thiên S½n", 17,  95, 120, MP_TIANSHAN }
x002026_g_mpInfo[4]	= { "Thiên Long", 13,  96, 120, MP_DALI }
x002026_g_mpInfo[5]	= { "Nga Mi", 15,  89, 139, MP_EMEI }
x002026_g_mpInfo[6]	= { "Võ Ğang", 12, 103, 140, MP_WUDANG }
x002026_g_mpInfo[7]	= { "Minh Giáo", 11,  98, 167, MP_MINGJIAO }
x002026_g_mpInfo[8]	= { "Cái Bang", 10,  91, 116, MP_GAIBANG }

x002026_g_Yinpiao = 40002000

x002026_g_Impact_NotTransportList = { 5929, 5944 } -- ½ûÖ¹´«ËÍµÄImpact
x002026_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ½ûÖ¹´«ËÍµÄImpactÌáÊ¾ĞÅÏ¢

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x002026_OnDefaultEvent( sceneId, selfId, targetId )

	-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x002026_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  ÄãÉíÉÏÓĞÒøÆ±£¬ÕıÔÚÅÜÉÌ£¡ÎÒ²»ÄÜ°ïÖúÄã¡£" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddText( sceneId, "#{XIYU_20071228_01}" )
			--AddNumText( sceneId, x002026_g_ScriptId, "#GLÕc Dß½ng", 9, 1000 )
			AddNumText( sceneId, x002026_g_ScriptId, "#GLÕc Dß½ng", 9, 1001 )
			AddNumText( sceneId, x002026_g_ScriptId, "#GTô Châu", 9, 1002 )
			AddNumText( sceneId, x002026_g_ScriptId, "#GLÕc Dß½ng - CØu Châu thß½ng hµi", 9, 1006 )
			AddNumText( sceneId, x002026_g_ScriptId, "#GTô Châu - Thiªt thß½ng ph¯", 9, 1007 )
			if GetLevel( sceneId, selfId ) >= 75 then
				AddNumText( sceneId, x002026_g_ScriptId, "#GLâu Lan", 9, 1011 )
			end
			AddNumText( sceneId, x002026_g_ScriptId, "#GThúc Hà C± Tr¤n", 9, 1010 )
			--AddNumText( sceneId, x002026_g_ScriptId, "#GPhøng Hoàng C± Tr¤n", 9, 1014 )
			--AddNumText( sceneId, x002026_g_ScriptId, "#GCôn Lôn Phúc Ğ¸a", 9, 1013 )		
			--AddNumText( sceneId, x002026_g_ScriptId, "#GThánh Höa Cung", 9, 1015 )
			--AddNumText( sceneId, x002026_g_ScriptId, "#GBinh Thánh KÏ Tr§n", 9, 1016 )
			--AddNumText( sceneId, x002026_g_ScriptId, "#GQuân Vß½ng Thiên Lång", 9, 1017 )	
			AddNumText( sceneId, x002026_g_ScriptId, "Ği cØu ğÕi môn phái", 9, 1012 )
			--for i, mp in x002026_g_mpInfo do
			--	AddNumText( sceneId, x002026_g_ScriptId, "ÃÅÅÉ - "..mp[1], 9, i )
			--end
		else
			--AddText( sceneId, "  ÄãĞèÒªµÈ¼¶µ½´ï10¼¶ÒÔÉÏ£¬²ÅÄÜÈ¥±ğµÄ³ÇÊĞ¡£" )
			--AddNumText( sceneId, x002026_g_ScriptId, "³ÇÊĞ - ´óÀí",  9, 1003 )
			--AddNumText( sceneId, x002026_g_ScriptId, "³ÇÊĞ - ´óÀí2", 9, 1004 )
			--AddNumText( sceneId, x002026_g_ScriptId, "³ÇÊĞ - ´óÀí3", 9, 1005 )
		end
		
		
		
		-- ÎÒÔõÑù²ÅÄÜÈ¥¶Ø»ÍºÍáÔÉ½
		AddNumText( sceneId, x002026_g_ScriptId, "Ği ğªn Ğôn Hoàng ği thª nào?", 11, 2000 )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--´«ËÍ¼ì²é£¬½â¾öµÍµÈ¼¶Íæ¼Ò´ø¸ßµÈ¼¶Íæ¼Òµ½´óÀí2£¬3µÄÎÊÌâ
--**********************************
function x002026_EnterConditionCheck(sceneId, selfId)
	local teamSize = GetNearTeamCount(sceneId, selfId); 
	if teamSize > 1 then
		for i=0, teamSize-1 do
	  	local objId = GetNearTeamMember(sceneId, selfId, i);
	  	if GetLevel(sceneId, objId) > 9 and IsTeamFollow(sceneId, objId) == 1 then
	  		local name = GetName(sceneId, objId);
	  		local msg = format("  ¶ÓÔ±%sµÈ¼¶¹ı¸ß£¬²»ÄÜ½øÈë£¡", name);
	  		return 0, msg;
	  	end  	
	  end
  end
	return 1, "ok";
end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x002026_OnEventRequest( sceneId, selfId, targetId, eventId )
	--¶ÓÎéÏà¹Ø
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x002026_MsgBox( sceneId, selfId, targetId, "  Äã¶ÓÎé³ÉÔ±ÖĞÓĞÈËÓĞäîÔË»õ²ÕÔÚÉí£¬ÎÒÃÇæäÕ¾²»ÄÜÎªÄãÌá¹©´«ËÍ·şÎñ¡£" )
				return
			end
		end
	end

	--äîÔËÏà¹Ø
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002026_MsgBox( sceneId, selfId, targetId, "  ÄãÓĞäîÔË»õ²ÕÔÚÉí£¬ÎÒÃÇæäÕ¾²»ÄÜÎªÄãÌá¹©´«ËÍ·şÎñ¡£" )
		return
	end
	
	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x002026_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x002026_MsgBox( sceneId, selfId, targetId, x002026_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--Ë³Àû´«ËÍ
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--·µ»ØÃÅÅÉ
		if id < 0 or id >= 9 then
			x002026_MsgBox( sceneId, selfId, targetId, "  Äã»¹Ã»ÓĞ¼ÓÈëÈÎºÎÃÅÅÉ£¡" )
		else
			mp	= x002026_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--ÂåÑô
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 239, 322, 10 )
		return
	end
	if arg == 1002 then		--ËÕÖİ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 201,258, 10 )
		return
	end
	if arg == 1006 then		--ÂåÑôÉÌ»á
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 327, 271, 10 )
		return
	end
	if arg == 1007 then		--ËÕÖİÌú½³ÆÌ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 331, 226, 10 )
		return
	end
	if arg == 1003 then		--´óÀí1
		--Èç¹ûÍæ¼Ò¾ÍÔÚ´óÀí1Ôò²»´«ËÍ
		if sceneId == 2 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ÄãÒÑ¾­ÔÚ´óÀíÁË¡£" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--´óÀí2
		--Èç¹ûÍæ¼Ò¾ÍÔÚ´óÀí2Ôò²»´«ËÍ
		if sceneId == 71 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ÄãÒÑ¾­ÔÚ´óÀí2ÁË¡£" )
		else
			local ret, msg = x002026_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x002026_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--´óÀí3
		--Èç¹ûÍæ¼Ò¾ÍÔÚ´óÀí3Ôò²»´«ËÍ
		if sceneId == 72 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ÄãÒÑ¾­ÔÚ´óÀí3ÁË¡£" )
		else
			local ret, msg = x002026_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x002026_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x002026_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			return
		end
	end
	
	if arg == 1010 then		--ÊøºÓ¹ÅÕò
		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x002026_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "ÊøºÓ¹ÅÕòÎª²»¼ÓÉ±Æø³¡¾°£¬Çë×¢Òâ°²È«¡£ÄãÈ·ÈÏÒª½øÈëÂğ£¿");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1011 then		--Â¥À¼
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 10 )
		return
	end
	if arg == 1014 then		--·ï»Ë¹ÅÕò
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 180, 49, 32, 10 )
		return
	end
	if arg == 1013 then		--À¥ÂØ¸£µØ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 421, 89, 41, 10 )
		return
	end
	if arg == 1015 then		--Ê¥»ğ¹¬
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 537, 89, 41, 10 )
		return
	end
	if arg == 1016 then		--±øÊ¥ÆæÕó
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 543, 117, 140, 10 )
		return
	end
	if arg == 1017 then		--¾ûÌìÍõÁê
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 553, 48, 48, 10 )
		return
	end

	if arg == 1012 then		
		BeginEvent( sceneId )
			for i, mp in x002026_g_mpInfo do
				AddNumText( sceneId, x002026_g_ScriptId, "ÃÅÅÉ - "..mp[1], 9, i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end


	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
	
end
--  add by zchw
function x002026_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--¸ù¾İÃÅÅÉID»ñÈ¡ÃÅÅÉĞÅÏ¢
--**********************************
function x002026_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002026_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--¶Ô»°´°¿ÚĞÅÏ¢ÌáÊ¾
--**********************************
function x002026_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
