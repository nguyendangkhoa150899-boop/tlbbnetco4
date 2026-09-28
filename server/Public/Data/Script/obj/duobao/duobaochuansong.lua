--Â¥À¼NPC
--æäÕ¾....

x891003_g_ScriptId	= 891003

--ÃÅÅÉÐÅÏ¢(ÃÅÅÉÃû³Æ£¬SceneID£¬PosX£¬PosY£¬ÃÅÅÉID)
x891003_g_mpInfo		= {}
x891003_g_mpInfo[0]	= { "Tinh Túc", 16,  96, 152, MP_XINGSU }
x891003_g_mpInfo[1]	= { "Tiêu Dao", 14,  67, 145, MP_XIAOYAO }
x891003_g_mpInfo[2]	= { "Thiªu Lâm",  9,  96, 127, MP_SHAOLIN }
x891003_g_mpInfo[3]	= { "Thiên S½n", 17,  95, 120, MP_TIANSHAN }
x891003_g_mpInfo[4]	= { "Thiên Long", 13,  96, 120, MP_DALI }
x891003_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x891003_g_mpInfo[6]	= { "Võ Ðang", 12, 103, 140, MP_WUDANG }
x891003_g_mpInfo[7]	= { "Minh Giáo", 11,  98, 167, MP_MINGJIAO }
x891003_g_mpInfo[8]	= { "Cái Bang", 10,  91, 116, MP_GAIBANG }

x891003_g_Yinpiao = 40002000 

x891003_g_Impact_NotTransportList = { 5929, 5944 } -- ½ûÖ¹´«ËÍµÄImpact
x891003_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ½ûÖ¹´«ËÍµÄImpactÌáÊ¾ÐÅÏ¢

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x891003_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓÐ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x891003_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin thÑ l²i trên ngß¶i các hÕ ðang giæ ngân phiªu, chÕy thß½ng nhân! Ta không th¬ giúp ðßþc." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )

		AddText( sceneId, "#{loulan_yizhan_20080329}")
		 
		AddNumText( sceneId, x891003_g_ScriptId, "V« ÐÕi Lý", 9, 1000 )
		--AddNumText( sceneId, x891003_g_ScriptId, "Thüy Nguy®t Ðµng Thiên", 9, 1001 )
		--AddNumText( sceneId, x891003_g_ScriptId, "Phßþng Hoàng Lång Mµ", 9, 1002 )
		--AddNumText( sceneId, x891003_g_ScriptId, "MÕc Nam Thanh Nguyên", 9, 1003 )
		--AddNumText( sceneId, x891003_g_ScriptId, "Vong hoa xuyên häi", 9, 1004 )
		--AddNumText( sceneId, x891003_g_ScriptId, "Thiên KÏ Nam Hoài", 9, 1005 )
		--AddNumText( sceneId, x891003_g_ScriptId, "T¥n Hoàng Ð¸a Cung T¥ng 4", 9, 1006 )
		
		
		
		
		--AddNumText( sceneId, x891003_g_ScriptId, "Thúc Hà C± Tr¤n", 9, 1016 )
	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x891003_OnEventRequest( sceneId, selfId, targetId, eventId )

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
				x891003_MsgBox( sceneId, selfId, targetId, "  Trong ðµi ngû cüa các hÕ có ngß¶i ch· hàng b¢ng ðß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho các hÕ" )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x891003_MsgBox( sceneId, selfId, targetId, "  Các hÕ có nhi®m vø ch· hàng b¢ng ðß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho ngß½i" )
		return
	end

	--¼ì²âImpact×´Ì¬×¤ÁôÐ§¹û
	for i, ImpactId in x891003_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x891003_MsgBox( sceneId, selfId, targetId, x891003_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end

	
	--·µ»ØÃÅÅÉ....
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then --Thông Thiên Tháp
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 253, 170 )
		return
	end

	if arg == 1001 then --Thüy Nguy®t Ðµng Thiên
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 722, 36, 68 )
		return
	end

	
	if arg == 1002 then --Phßþng Hoàng Lång Mµ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 706, 16, 111 )
		return
	end

	
	if arg == 1003 then --MÕc Nam Thanh Nguyên
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 573, 40,40 )
		return
	end

	
	if arg == 1004 then --Vong hoa xuyên häi
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 574, 37, 37 )
		return
	end

	
	if arg == 1005 then --Thiên KÏ Nam Hoài
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 575, 37, 37 )
		return
	end
	
	if arg == 1006 then --T¥n Hoàng Ð¸a Cung T¥ng 4
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 203, 30, 35 )
		return
	end
	
	if arg == 1018 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 722, 36, 68 )
		return
	end
	if arg == 1019 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 180, 39, 38 )
		return
	end
	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x891003_g_mpInfo do
				AddNumText( sceneId, x891003_g_ScriptId, "Môn phái - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	if arg == 1016 then		--ÊøºÓ¹ÅÕò
			-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x891003_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Thúc Hà C± Tr¤n là n½i PK s¨ không b¸ sát khí. Xin chú ý an toàn. Các hÕ có xác nh§n tiªn vào không?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	--ÃÅÅÉ....
	for i, mp in x891003_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

end
--  add by zchw
function x891003_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 70, 18, 20 );
	return
end
--**********************************
--¸ù¾ÝÃÅÅÉID»ñÈ¡ÃÅÅÉÐÅÏ¢
--**********************************
function x891003_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x891003_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x891003_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
