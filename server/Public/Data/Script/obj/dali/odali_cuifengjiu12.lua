x002026_g_ScriptId	= 002026
x002026_g_Yinpiao = 40002000
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************


x002026_g_mpInfo		= {}
x002026_g_mpInfo[0]	= { "Tinh Túc", 16,  96, 152, MP_XINGSU }
x002026_g_mpInfo[1]	= { "Tiêu Dao", 14,  67, 145, MP_XIAOYAO }
x002026_g_mpInfo[2]	= { "Thiªu Lâm",  9,  96, 127, MP_SHAOLIN }
x002026_g_mpInfo[3]	= { "Thiên S½n", 17,  95, 120, MP_TIANSHAN }
x002026_g_mpInfo[4]	= { "Thiên Long", 13,  96, 120, MP_DALI }
x002026_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x002026_g_mpInfo[6]	= { "Võ Ðang", 12, 103, 140, MP_WUDANG }
x002026_g_mpInfo[7]	= { "Minh Giáo", 11,  98, 167, MP_MINGJIAO }
x002026_g_mpInfo[8]	= { "Cái Bang", 10,  91, 116, MP_GAIBANG }
x002026_g_mpInfo[9]	= { "Mµ Dung", 435,  19, 137, MP_GUSU }
x002026_g_mpInfo[10]	= { "Ðß¶ng Môn", 495,  128, 71, MP_TANGMEN }

x002026_g_Impact_NotTransportList = { 5929, 5944 } -- ½ûÖ¹´«ËÍµÄImpact
x002026_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ½ûÖ¹´«ËÍµÄImpactÌáÊ¾ÐÅÏ¢


function x002026_OnDefaultEvent( sceneId, selfId, targetId )

	-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓÐ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x002026_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Ngß½i ðang trong trÕng thái Thß½ng Nhân, không th¬ d¸ch chuy¬n!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	BeginEvent( sceneId )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddText( sceneId, "     #{loulan_yizhan_20080329}" )
			AddNumText( sceneId, x002026_g_ScriptId, "#c66ffffThành Th¸", 9, 100 )
			AddNumText( sceneId, x002026_g_ScriptId, "#c66ffffMôn Phái", 9, 200 )
			AddNumText( sceneId, x002026_g_ScriptId, "#c66ffffLuy®n c¤p", 9, 300 )
			AddNumText( sceneId, x002026_g_ScriptId, "#c66ffffPhó bän", 9, 400 )
			AddNumText( sceneId, x002026_g_ScriptId, "#c66ffffDã NgoÕi", 9, 500 )
			AddNumText( sceneId, x002026_g_ScriptId, "#c66ffffThành Chiªn", 9, 600 )
		else
			AddText( sceneId, "  C¤p 10 tr· lên m¾i có th¬ di chuy¬n" )
			AddNumText( sceneId, x002026_g_ScriptId, "ÐÕi Lý",  9, 1003 )
			AddNumText( sceneId, x002026_g_ScriptId, "ÐÕi Lý 2", 9, 1004 )
			AddNumText( sceneId, x002026_g_ScriptId, "ÐÕi Lý 3", 9, 1005 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x002026_OnEventRequest( sceneId, selfId, targetId, eventId )
	x002026_g_scriptId = 002026
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
				x002026_MsgBox( sceneId, selfId, targetId, "  T± ðµi cüa ngß½i có thành viên ðang trong trÕng thái Tào V§n, không th¬ d¸ch chuy¬n!" )
				return
			end
		end
	end

	--äîÔËÏà¹Ø
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002026_MsgBox( sceneId, selfId, targetId, "Ngß½i ðang trong trÕng thái Tào V§n, không th¬ d¸ch chuy¬n!" )
		return
	end
	
		if GetNumText() == 100 then
		BeginEvent( sceneId )
					AddText( sceneId, "   #YLña ch÷n thành th¸ các hÕ mu¯n t¾i" )
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffPhøng Minh Tr¤n", -1, 101)		
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffTô Châu", -1, 102)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffÐÕi Lý", -1, 103)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffLÕc Dß½ng", -1, 104)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffThúc Hà", -1, 105)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffLâu Lan", -1, 106)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 101 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 157, 119, 10 )
	end

	if GetNumText() == 102 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 202, 257, 10 )
	end

	if GetNumText() == 103 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2,253, 122, 10 )
	end

	if GetNumText() == 104 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 236, 320, 10 )
	end

	if GetNumText() == 105 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 202, 208, 10 )
	end

	if GetNumText() == 106 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 286, 129, 10 )
	end
	
		if GetNumText() == 200 then
		BeginEvent( sceneId )
					AddText( sceneId, "  #YLña chon môn phái các hÕ mu¯n qua" )
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffMµ Dung", 9, 201)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffTinh Túc", 9, 202)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffTiêu Dao", 9, 203)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffThiªu Lâm", 9, 204)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffThiên S½n", 9, 205)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffThiên Long", 9, 206)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffNga My", 9, 207)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffVõ Ðang", 9, 208)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffMinh Giáo", 9, 209)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffCái Bang", 9, 210)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffÐß¶ng Môn", 9, 211)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 201 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 435, 19, 137, 10 )
	end
	
	if GetNumText() == 202 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 16, 96, 152, 10 )
	end

	if GetNumText() == 203 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 14, 67, 145, 10 )
	end

	if GetNumText() == 204 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 9, 95, 137, 10 )
	end

	if GetNumText() == 205 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 17, 95, 120, 10 )
	end

	if GetNumText() == 206 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 13, 96, 120, 10 )
	end
	
	if GetNumText() == 207 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 15, 89, 144, 10 )
	end
	
	if GetNumText() == 208 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 12, 103, 140, 10 )
	end
	
	if GetNumText() == 209 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 11, 98, 167, 10 )
	end
	
	if GetNumText() == 210 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 10, 91, 116, 10 )
	end
	
	if GetNumText() == 211 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 495, 128, 71, 10 )
	end

	if GetNumText() == 300 then
		BeginEvent( sceneId )
					AddText( sceneId, "   #YLña ch÷n vùng dã ngoÕi luy®n c¤p" )
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffYªn Vß½ng t¥ng 1", 9, 301)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffYªn Vß½ng t¥ng 7", 9, 302)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffT¥n Hoàng Ð¸a Cung t¥ng 1", 9, 303)
			AddNumText( sceneId, x002026_g_scriptId, "#c66ffffT¥n Hoàng Ð¸a Cung t¥ng 2", 9, 304)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffT¥n Hoàng Ð¸a Cung t¥ng 3", 9, 305)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffT¥n Hoàng Ð¸a Cung t¥ng 4", 9, 306)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 301 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 159, 69, 89, 10 )
	end

	if GetNumText() == 302 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 165, 39, 103, 10 )
	end

	if GetNumText() == 303 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 400, 227, 224, 10 )
	end

	if GetNumText() == 304 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 401, 208, 226, 10 )
	end
	
	if GetNumText() == 305 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 402, 195, 216, 10 )
	end
	
	if GetNumText() == 306 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 538, 28, 32, 10 )
	end

	if GetNumText() == 400 then
		BeginEvent( sceneId )
		    AddText( sceneId, "   #YKhu vñc phó bän ð£c sÑ" )
			AddNumText( sceneId, x002026_g_scriptId, "Trân Long", 9, 404)--0 364 228
			AddNumText( sceneId, x002026_g_scriptId, "Túc C¥u", 9, 405)--0 298 192
			AddNumText( sceneId, x002026_g_scriptId, "Lâu Lan T¥m Bäo", 9, 409)--186 163 79
            AddNumText( sceneId, x002026_g_scriptId, "Lâu Lan Tam Hoàn", 9, 406)--1 133 258
			AddNumText( sceneId, x002026_g_scriptId, "Lâu Lan New", 9, 415)--186 296 72
			AddNumText( sceneId, x002026_g_scriptId, "Yªn TØ Ô", 9, 411)--4  69 120
			AddNumText( sceneId, x002026_g_scriptId, "S½ Chiªn Phiêu Mi­u Phong", 9, 413) --186 189 218
			AddNumText( sceneId, x002026_g_scriptId, "TÑ Tuy®t Trang", 9, 414) --1 195 214
			AddNumText( sceneId, x002026_g_scriptId, "Thiªu Th¤t S½n", 9, 410)--2 70 59
			AddNumText( sceneId, x002026_g_scriptId, "NhÕn Môn Quan", 9, 412)--0  295 224
			AddNumText( sceneId, x002026_g_scriptId, "Sát Tinh", 9, 401)--2 131 77
			AddNumText( sceneId, x002026_g_scriptId, "Binh Thánh KÏ Tr§n", 9, 402)--186 205 175
			AddNumText( sceneId, x002026_g_scriptId, "Hß Không Huy«n Cänh", 9, 403)--0 217 242
			AddNumText( sceneId, x002026_g_scriptId, "Côn Lôn Phúc Ð¸a", 9, 407) --2 293 91
			AddNumText( sceneId, x002026_g_scriptId, "Thiên Long Huy«n Cänh", 9, 408)--186 178 117
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 401 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 131, 77, 10 )
	end

	if GetNumText() == 402 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 205, 175, 10 )
	end

	if GetNumText() == 403 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 217, 242, 10 )
	end

	if GetNumText() == 404 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 364, 228, 10 )
	end
	
	if GetNumText() == 405 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 298, 192, 10 )
	end
	
	if GetNumText() == 406 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 133, 258, 10 )
	end
	
	if GetNumText() == 407 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 293, 91, 10 )
	end
	
	if GetNumText() == 408 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 178, 117, 10 )
	end
	
	if GetNumText() == 409 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 163, 79, 10 )
	end
	
	if GetNumText() == 410 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 70, 59, 10 )
	end
	
	if GetNumText() == 411 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 4, 69, 120, 10 )
	end
	
	if GetNumText() == 412 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 295, 225, 10 )
	end
	
	if GetNumText() == 413 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 189, 218, 10 )
	end
	
	if GetNumText() == 414 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 195, 214, 10 )
	end
	
	if GetNumText() == 415 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 296, 72, 10 )
	end

	if GetNumText() == 500 then
		BeginEvent( sceneId )
					AddText( sceneId, "   #YKhu vñc truy«n t¯ng BOSS" )
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffBÕo Long - NhÕn Nam", 9, 501)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffTi¬u Long - Kính H°", 9, 502)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffBång Yêu - Võ Di", 9, 503)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffHuy«n Thích - Thß½ng S½n", 9, 504)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffHuy«n Vû Ðäo", 9, 505)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffThäo Nguyên", 9, 506)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffThánh Thú Long Quy", 9, 507)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffThánh Thú Bäo Rß½ng", 9, 508)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffNgân Ngai Tuyªt Nguyên", 9, 509)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffThái Hoàng Th¥n Vñc", 9, 510)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 501 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 18, 235, 88, 10 )
	end

	if GetNumText() == 502 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 5, 236, 89, 10 )
	end

	if GetNumText() == 503 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 32, 101, 122, 10 )
	end

	if GetNumText() == 504 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 25, 162, 71, 10 )
	end

	if GetNumText() == 505 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 39, 162, 43, 10 )
	end

	if GetNumText() == 506 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 20, 225, 255, 10 )
	end

	if GetNumText() == 507 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 158, 164, 46, 10 )
	end

	if GetNumText() == 508 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 158, 137, 130, 10 )
	end

    if GetNumText() == 509 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 188, 74, 41, 10 )
	end
	
    if GetNumText() == 510 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 508, 160, 160, 10 )
	end

	if GetNumText() == 600 then
		BeginEvent( sceneId )
					AddText( sceneId, "  #YKhu vñc truy«n t¯ng" )
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffNam MÕc Thanh Nguy®n", 9, 601)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffThiên KÏ Nam Hoài", 9, 602)
			AddNumText( sceneId, x002026_g_scriptId, "#c00ffffV÷ng Xuyên Hoa Häi", 9, 603)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffVân Dao Thß¾c Lînh", 9, 604)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffÐan Lâm", 9, 605)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffLâm Khê Häi C¯c¿", 9, 606)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffÇ§ Çï µî   #cff99cc¡¾ÌìÍâ¿ìËÙ´«ËÍ¡¿", 9, 607)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffff²» ¹é ÁÖ   #cff99cc¡¾ÌìÍâ¿ìËÙ´«ËÍ¡¿", 9, 608)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffÎÞ ÑÄ º£   #cff99cc¡¾ÌìÍâ¿ìËÙ´«ËÍ¡¿", 9, 609)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffÑ× ÂÞ Ìì   #cff99cc¡¾ÌìÍâ¿ìËÙ´«ËÍ¡¿", 9, 610)
			--AddNumText( sceneId, x002026_g_scriptId, "#c00ffffÌì »Ê É½   #cff99cc¡¾ÌìÍâ¿ìËÙ´«ËÍ¡¿", 9, 611)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 601 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 573, 161, 96, 10 )
	end

	if GetNumText() == 602 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 575, 136, 120, 10 )
	end

	if GetNumText() == 603 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 574,130, 104, 10 )
	end

	if GetNumText() == 604 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 496,100, 100, 10 )
	end

	if GetNumText() == 605 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 497, 100, 100, 10 )
	end

	if GetNumText() == 606 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 498, 100, 100, 10 )
	end

	if GetNumText() == 607 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 499, 100, 100, 10 )
	end

	if GetNumText() == 608 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 500, 100, 100, 10 )
	end

	if GetNumText() == 609 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 501, 100, 100, 10 )
	end

	if GetNumText() == 610 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 502, 100, 100, 10 )
	end
	
	if GetNumText() == 611 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 503, 100, 100, 10 )
	end	
		
	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	

	

	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end


  local arg = GetNumText()


	if arg == 1001 then		--ÂåÑô
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183, 10 )
		return
	end
	if arg == 1002 then		--ËÕÖÝ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162, 10 )
		return
	end
	if arg == 1006 then		--ÂåÑôÉÌ»á
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132, 10 )
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
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--´óÀí3
		--Èç¹ûÍæ¼Ò¾ÍÔÚ´óÀí3Ôò²»´«ËÍ
		if sceneId == 72 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ÄãÒÑ¾­ÔÚ´óÀí3ÁË¡£" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	
end

--**********************************
--¸ù¾ÝÃÅÅÉID»ñÈ¡ÃÅÅÉÐÅÏ¢
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
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x002026_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end



