--Â¥À¼NPC
--æäÕ¾....

x044701_g_ScriptId	= 044701

--ÃÅÅÉĞÅÏ¢(ÃÅÅÉÃû³Æ£¬SceneID£¬PosX£¬PosY£¬ÃÅÅÉID)
x044701_g_mpInfo		= {}
x044701_g_mpInfo[0]	= { "Tinh Túc", 16,  96, 152, MP_XINGSU }
x044701_g_mpInfo[1]	= { "Tiêu Dao", 14,  67, 145, MP_XIAOYAO }
x044701_g_mpInfo[2]	= { "Thiªu Lâm",  9,  96, 127, MP_SHAOLIN }
x044701_g_mpInfo[3]	= { "Thiên S½n", 17,  95, 120, MP_TIANSHAN }
x044701_g_mpInfo[4]	= { "Thiên Long", 13,  96, 120, MP_DALI }
x044701_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x044701_g_mpInfo[6]	= { "Võ Ğang", 12, 103, 140, MP_WUDANG }
x044701_g_mpInfo[7]	= { "Minh Giáo", 11,  98, 167, MP_MINGJIAO }
x044701_g_mpInfo[8]	= { "Cái Bang", 10,  91, 116, MP_GAIBANG }
x044701_g_mpInfo[10]= { "Mµ Dung", 435,  27, 136, MP_GUSU }

x044701_g_Yinpiao = 40002000 

x044701_g_Impact_NotTransportList = { 5929, 5944 } -- ½ûÖ¹´«ËÍµÄImpact
x044701_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ½ûÖ¹´«ËÍµÄImpactÌáÊ¾ĞÅÏ¢

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x044701_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x044701_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin thÑ l²i trên ngß¶i các hÕ ğang giæ ngân phiªu, chÕy thß½ng nhân! Ta không th¬ giúp ğßşc." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )

		--AddText( sceneId, "#{loulan_yizhan_20080329}")
		 
		AddNumText( sceneId, x001100_g_ScriptId, "Quay v« môn phái", 9, 1000 )
		AddNumText( sceneId, x001100_g_ScriptId, "Thành Th¸ - LÕc Dß½ng", 9, 1001 )
		AddNumText( sceneId, x001100_g_ScriptId, "Thành Th¸ - LÕc Dß½ng - CØu Châu thß½ng hµi", 9, 1002 )
		AddNumText( sceneId, x001100_g_ScriptId, "Thành Th¸ - Tô Châu", 9, 1003 )
		AddNumText( sceneId, x001100_g_ScriptId, "Thành Th¸ - Tô Châu - Thiªt Tßşng Ph¯", 9, 1004 )
		AddNumText( sceneId, x001100_g_ScriptId, "Thành Th¸ - ĞÕi Lı", 9, 1005 )
		--AddNumText( sceneId, x001100_g_ScriptId, "Thành Th¸ - Thúc Hà C± Tr¤n", 9, 1016 )
		--AddNumText( sceneId, x044701_g_ScriptId, "Huy«n Häi", 9, 1017 )
		--AddNumText( sceneId, x044701_g_ScriptId, "ĞÕi Di Côn Häi", 9, 1018 )
		 
		--AddNumText( sceneId, x001100_g_ScriptId, "Ğßa ta ğªn các môn phái khác", 9, 1011 )
		
		--for i, mp in x044701_g_mpInfo do
			--AddNumText( sceneId, x001100_g_ScriptId, "Môn phái - "..mp[1], 9, i )
		--end

	
	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x044701_OnEventRequest( sceneId, selfId, targetId, eventId )

	--äîÔË½ûÖ¹´«ËÍ....
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
				x044701_MsgBox( sceneId, selfId, targetId, "  Trong ğµi ngû cüa các hÕ có ngß¶i ch· hàng b¢ng ğß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho các hÕ" )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x044701_MsgBox( sceneId, selfId, targetId, "  Các hÕ có nhi®m vø ch· hàng b¢ng ğß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho ngß½i" )
		return
	end

	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x044701_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x044701_MsgBox( sceneId, selfId, targetId, x044701_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end

	
	--·µ»ØÃÅÅÉ....
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--·µ»ØÃÅÅÉ
		if id < 0 or id == 9 then
			x044701_MsgBox( sceneId, selfId, targetId, "  Các hÕ chßa gia nh§p môn phái nào." )
		else
			mp	= x044701_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end

	--ÂåÑô....
	if arg == 1001 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 233, 321 )
		return
	end

	--ÂåÑô¾ÅÖİ....
	if arg == 1002 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 325, 270 )
		return
	end

	--ËÕÖİ....
	if arg == 1003 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 202,257 )
		return
	end

	--ËÕÖİÌú½³....
	if arg == 1004 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 331, 226 )
		return
	end

	--´óÀí....
	if arg == 1005 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 222 )
		return
	end
	--Â¥À¼....
	if arg == 1017 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 720, 235, 235 )
		return
	end
	--Â¥À¼....
	if arg == 1018 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 721, 39, 91 )
		return
	end

	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x044701_g_mpInfo do
				AddNumText( sceneId, x001100_g_ScriptId, "Môn phái - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	if arg == 1016 then		--ÊøºÓ¹ÅÕò
			-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x044701_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Thúc Hà C± Tr¤n là n½i PK s¨ không b¸ sát khí. Xin chú ı an toàn. Các hÕ có xác nh§n tiªn vào không?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	--ÃÅÅÉ....
	for i, mp in x044701_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

end
--  add by zchw
function x044701_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--¸ù¾İÃÅÅÉID»ñÈ¡ÃÅÅÉĞÅÏ¢
--**********************************
function x044701_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x044701_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--¶Ô»°´°¿ÚĞÅÏ¢ÌáÊ¾
--**********************************
function x044701_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
