--³ÇÊĞNPC
--½ğ¿â

x805012_g_scriptId=805012
x805012_g_BuildingID6 = 3

--ÒøÆ±ÀàĞÍID
x805012_g_TicketItemIdx	=	40002000
x805012_g_OutDateTicketItemIdx	=	40000000
x805012_g_MerchandiseRate = 1.5
-- ½»¹ÙÆ±µÄ½±Àø±ÈÀı
x805012_g_GuildRate = 1.00		-- °ïÅÉ»ñµÃµÄ×Ê½ğ»Ø±¨100%
x805012_g_PlayerRate = 0.20		-- ¸öÈË»ñµÃµÄ×Ê½ğ»Ø±¨20%

-- Ã¿¸öÍæ¼ÒÒ»Ìì¿ÉÒÔÁìÈ¡ÒøÆ±µÄ´ÎÊı
x805012_g_TicketTakeTimes = 8

-- Ã¿¸ö°ïÅÉÒ»Ìì¿ÉÒÔÁìÈ¡ÒøÆ±µÄ´ÎÊı»ùÊı
x805012_g_BaseTotalTicketTakeTimes = 200

-- °ïÅÉÃ¿ÉıÒ»¼¶¿ÉÒÔÔö¼ÓµÄÒøÆ±ÁìÈ¡´ÎÊı
x805012_g_TicketTakeTimesBonusPerLvl = 25
x805012_g_TicketDecValue = 136
x805012_g_TicketIncValue = 680
x805012_g_TicketDecRate = 1.0
x805012_g_TicketIncRate = 1.0
x805012_g_GuildBoomIndex = 18
--¾èÖúµÄ×îĞ¡½ğ¶î
x805012_g_GuildMoneyLimit	=	10000

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x805012_OnDefaultEvent( sceneId, selfId,targetId )

	--ÊÇ·ñÊÇ±¾°ï³ÉÔ±
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "     Vùng tài chính tr÷ng yªu cüa b±n bang, xin ğ×ng n¤n ná lÕi, tÕi hÕ thân mÕng tr÷ng trách, không ti®n tiªp ğón"
			AddText(sceneId,strText)
			AddNumText( sceneId, x805012_g_scriptId, "CØa hàng thß½ng nhân",7,5)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	BeginEvent(sceneId)
		strText = "TÕi hÕ phø trách ti«n cüa b±n bang, ti«n là ngu°n s¯ng,hãy ğªn ch± ta tìm vi®c ğ¬ làm, ğ¬ có lşi ích cho Bang hµi và bän thân."
		AddText(sceneId,strText);
		AddNumText( sceneId, x805012_g_scriptId, "#GC¯ng hiªn vàng vào Bang quÛ", 6, 9 )
		AddNumText( sceneId, x805012_g_scriptId, "Lînh ngân phiªu", 6, 2 )
		AddNumText( sceneId, x805012_g_scriptId, "Hoàn trä ngân phiªu", 6, 3 )
		--AddNumText( sceneId, x805012_g_scriptId, "ÉÌÈËµêÆÌ",7,1)
		AddNumText( sceneId, x805012_g_scriptId, "Gi¾i thi®u ti«n trang", 11, 4 )
		AddNumText( sceneId, x805012_g_scriptId, "CØa hàng thß½ng nhân",7,5)
		AddNumText( sceneId, x805012_g_scriptId, "Con ğß¶ng thß½ng nghi®p", 12, 6 )
		AddNumText( sceneId, x805012_g_scriptId, "Giao ngân phiªu quá hÕn", 6, 7 )
		AddNumText( sceneId, x805012_g_scriptId, "Lînh ti«n lß½ng", 7, 8 )
		--life Ìí¼ÓÕâ¸ö½¨ÖşÎïµÄÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805012_g_scriptId,x805012_g_BuildingID6,888)
		AddNumText( sceneId, x805012_g_scriptId, "#{BPZJ_0801014_001}", 6, 11 )--°ï»á×Ê½ğ¾èÖú
		AddNumText( sceneId, x805012_g_scriptId, "#{BPZJ_0801014_002}", 11, 12 )--¹ØÓÚ°ï»á×Ê½ğ¾èÖú
		
		local Guildpos = GetGuildPos(sceneId, selfId)
		if x805012_IsManager(Guildpos)==1 then
			--¹ÜÀíÕß¸£Àû
			AddNumText( sceneId, x805012_g_scriptId, "Lînh thü Bang Phái quän lı giä phúc lşi", 7,  9)
			AddNumText( sceneId, x805012_g_scriptId, "Quan viên Bang Phái quän lı giä phúc lşi", 11, 10 )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x805012_DrawPay( sceneId, selfId  )

	--µÈ¼¶³¬¹ı40¼¶¡£
	local msg;
	if GetLevel( sceneId, selfId ) < 40 then
		msg = format("Các hÕ không ğü c¤p 40, vì v§y không th¬ lînh ti«n lß½ng.");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	--±ØĞëÈë°ïÊ±¼ä´óÓÚµÈÓÚ1ÖÜ¡£
	local nFactionJoinTime = GetFactionJoinTime( sceneId, selfId );
	
	local nTimeCur = LuaFnGetCurrentTime()
	local nTimeDelta = nTimeCur - nFactionJoinTime;
	if nTimeDelta < 7*24*60*60 then
		msg = format("Th¶i gian vào bang cüa các hÕ chßa ğü 1 tu¥n, không th¬ lînh ti«n lß½ng.");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			

	--±ØĞëÃ¿ÖÜÅÜ2´ÎÉÌÒÔÉÏ¡£
	local nCaoYunTime = GetMissionData( sceneId, selfId, MD_CAOYUN_COMPLETE_TIME );
	local nCaoYunNum = mod(nCaoYunTime,1000);
	local nWeek = floor(nCaoYunTime/1000)
	local Guildpos = GetGuildPos(sceneId, selfId)

	if ((Guildpos ~= GUILD_POSITION_CHIEFTAIN) and (Guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN)) then
		if nCaoYunNum < 2 or nWeek~= nWeekCur then
			msg = format("S¯ l¥n thß½ng vø tu¥n này cüa các hÕ không ğü 2 l¥n.");
			x805012_NotifyTips(sceneId, selfId, msg);
			return 0;
		end	
	end


	--°ïÅÉÁìÈ¡´ÎÊı´ïµ½ÉÏÏß
	local nFactionAllTimeNum = CityGetAttr(sceneId, selfId, 14);
	
	local nFactionAllNum = mod(nFactionAllTimeNum,1000)
	local nFactionWeek = floor(nFactionAllTimeNum/1000)
	
	if nWeekCur ~= nFactionWeek then
		nFactionAllNum = 0;
		nFactionAllTimeNum = nWeekCur*1000 + nFactionAllNum;
		local canset = CanCitySetAttr(sceneId, selfId, 14)
	--	if canset >= 1 then
			CitySetAttr(sceneId, selfId, 14, nFactionAllTimeNum)			
	--	end
	end
	
	if nFactionAllNum >= 200 then
		msg = format("Xin l²i, ti«n lß½ng b±n bang tu¥n này ğã ğÕt mÑc gi¾i hÕn");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		msg = format("B±n bang · trÕng thái bäo v® th¤p, không th¬ lînh ti«n lß½ng!");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	
	--Ã¿ÖÜÖ»ÄÜÁìÈ¡1´Î¹¤×Ê¡£	
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_DRAWPAY_TIME );	
	
	local nNum = mod(nDrawPayTimeLast,1000)
	local nWeek = floor(nDrawPayTimeLast/1000)

	local isPosLongEnough = IsGuildPosLongEnough(sceneId, selfId);
	local minusContri = 30

	if (isPosLongEnough == 1) then
		if (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN) then
			minusContri = 15
		elseif (Guildpos == GUILD_POSITION_CHIEFTAIN) then
			minusContri = 0
		end
	end
	
	if nWeekCur ~= nWeek then
	
		--Ã¿´ÎÁìÈ¡ĞèÒªºÄ·Ñ30µã°ï¹±¡£
		local nContribPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT);
		nContribPoint = nContribPoint - minusContri;		
		if nContribPoint < 0 then
			msg = format("Ğµ c¯ng hiªn bang hµi cüa các hÕ không ğü, nên không th¬ nh§n lînh ti«n lß½ng");
			x805012_NotifyTips(sceneId, selfId, msg);
			nContribPoint = 0;
			return 0;
		end
		
		--»ñÈ¡½ğÇ®
		local guildLevel = GetGuildLevel( sceneId, selfId )
		local goldGet = 0;
		if guildLevel == 1 then
			goldGet = 5*10000;
		elseif guildLevel == 2 then
			goldGet = 6*10000;
		elseif guildLevel == 3 then
			goldGet = 7*10000;
		elseif guildLevel == 4 then
			goldGet = 8*10000;
		elseif guildLevel == 5 then
			goldGet = 9*10000;
		end		
		
		local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY);
		
		if GuildMoney < goldGet then
			x805012_NotifyTips(sceneId, selfId, "QuÛ cüa bang hµi không ğü, không th¬ lînh ğßşc.");
			return 0;
		end
		
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*goldGet)
		
		nFactionAllNum = nFactionAllNum + 1;
		nFactionAllTimeNum = nWeekCur*1000 + nFactionAllNum;
		local canset = CanCitySetAttr(sceneId, selfId, 14)
	--	if canset >= 1 then
			CitySetAttr(sceneId, selfId, 14, nFactionAllTimeNum)			
	--	end

		if (isPosLongEnough == 1) then
			if(Guildpos == GUILD_POSITION_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "Các hÕ ğã ğß½ng nhi®m chÑc Bang Chü th¶i gian h½n 1 tu¥n, nên khi nh§n lînh ti«n lß½ng s¨ không tiêu hao ğµ c¯ng hiªn bang hµi.");
			elseif(Guildpos == GUILD_POSITION_ASS_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "Các hÕ ğã ğß½ng nhi®m chÑc Phó Bang Chü th¶i gian h½n 1 tu¥n, nên khi nh§n lînh ti«n lß½ng s¨ tiêu hao ğµ c¯ng hiªn bang hµi giäm b¾t 1 nØa.");
			end
		end

		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, (-1)*minusContri)			
		
		local guildid = GetHumanGuildID(sceneId,selfId);
		LuaFnAuditPlayerGetGuildWage( sceneId, selfId, guildid, goldGet);

		nNum = 1;
		nDrawPayTimeLast = nWeekCur*1000 + nNum;
		SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, nDrawPayTimeLast );	
				
		
		AddMoney( sceneId, selfId, goldGet );
		local  PlayerName=GetName(sceneId,selfId);
		local sMessage = format("@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00 tÕi Kim kh¯ t±ng quän cüa Bang phái lînh ti«n lß½ng cüa tu¥n này, t±ng cµng #{_MONEY%d}.", PlayerName, goldGet );	
	    BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
		
		
	else
		if nNum >= 1 then
			msg = format("Tu¥n này các hÕ ğã nh§n ti«n lß½ng, tu¥n sau hãy ğªn nhé.");
			x805012_NotifyTips(sceneId, selfId, msg);
			return 0;
		end
		--Ã¿´ÎÁìÈ¡ĞèÒªºÄ·Ñ30µã°ï¹±¡£
		local nContribPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT);
		nContribPoint = nContribPoint - minusContri;		
		if nContribPoint < 0 then
			msg = format("Ğµ c¯ng hiªn bang hµi cüa các hÕ không ğü, nên không th¬ nh§n lînh ti«n lß½ng");
			x805012_NotifyTips(sceneId, selfId, msg);
			nContribPoint = 0;
			return 0;
		end
		
		--»ñÈ¡½ğÇ®
		local guildLevel = GetGuildLevel( sceneId, selfId )
		local goldGet = 0;
		if guildLevel == 1 then
			goldGet = 5*10000;
		elseif guildLevel == 2 then
			goldGet = 6*10000;
		elseif guildLevel == 3 then
			goldGet = 7*10000;
		elseif guildLevel == 4 then
			goldGet = 8*10000;
		elseif guildLevel == 5 then
			goldGet = 9*10000;
		end		
		
		local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY);
		
		if GuildMoney < goldGet then
			x805012_NotifyTips(sceneId, selfId, "QuÛ cüa bang hµi không ğü, không th¬ lînh ğßşc.");
			return 0;
		end
		
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*goldGet)
		
		
		
		nFactionAllNum = nFactionAllNum + 1;
		nFactionAllTimeNum = nWeekCur*1000 + nFactionAllNum;
		local canset = CanCitySetAttr(sceneId, selfId, 14)
	--	if canset >= 1 then
			CitySetAttr(sceneId, selfId, 14, nFactionAllTimeNum)
	--	end
		
		if (isPosLongEnough == 1) then
			if(Guildpos == GUILD_POSITION_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "Các hÕ ğã ğß½ng nhi®m chÑc Bang Chü th¶i gian h½n 1 tu¥n, nên khi nh§n lînh ti«n lß½ng s¨ không tiêu hao ğµ c¯ng hiªn bang hµi.");
			elseif(Guildpos == GUILD_POSITION_ASS_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "Các hÕ ğã ğß½ng nhi®m chÑc Phó Bang Chü th¶i gian h½n 1 tu¥n, nên khi nh§n lînh ti«n lß½ng s¨ tiêu hao ğµ c¯ng hiªn bang hµi giäm b¾t 1 nØa.");
			end
		end
		
		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, (-1)*minusContri)	
		local guildid = GetHumanGuildID(sceneId,selfId);
		LuaFnAuditPlayerGetGuildWage( sceneId, selfId, guildid, goldGet);		

		nNum = nNum + 1;
		nDrawPayTimeLast = nWeekCur*1000 + nNum;
		SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, nDrawPayTimeLast );
		
		AddMoney( sceneId, selfId, goldGet );

		local  PlayerName=GetName(sceneId,selfId);
		local sMessage = format("@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00 tÕi Kim kh¯ t±ng quän cüa Bang phái lînh ti«n lß½ng cüa tu¥n này, t±ng cµng #{_MONEY%d}.", PlayerName, goldGet );	
	    BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
	end
	

end


--ÅĞ¶ÏÊÇ·ñÊÇ¹ÜÀí²ã
function x805012_IsManager( Guildpos  )
    if (   (Guildpos == GUILD_POSITION_CHIEFTAIN) 
	    or (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN)
	    or (Guildpos == GUILD_POSITION_HR)
	    or (Guildpos == GUILD_POSITION_INDUSTRY)
	    or (Guildpos == GUILD_POSITION_AGRI)
	    or (Guildpos == GUILD_POSITION_COM) 
	   )then
        return 1;
		end
		return 0;
end


--ÁìÈ¡°ïÅÉ¹ÜÀíÕß¸£Àû
function x805012_DrawManagerBonus( sceneId, selfId  )

	local msg;
	
	--±ØĞëµ£ÈÎ¹ÙÖ°´óÓÚµÈÓÚ5Ìì¡£
	if( LuaFnGetGuildAppointTime( sceneId, selfId ) < MIN_APPOINT_TIME_FOR_BONUS ) then
	    msg = format("Äã¿´¿´Äã£¬ĞÂ¹ÙÉÏÈÎ£¬Òª¶àéµÜĞÖ‚ƒ×öücÊÂÇé£¬¶ø²»ÊÇ¼±ĞnĞnµÄíîI¸£Àû¡£ß^×ÌìÔÙí°É£¡");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end


	local Guildpos = GetGuildPos(sceneId, selfId)
	if ( x805012_IsManager(Guildpos)~=1 ) then
        msg = format("Äã²»ÊÇ¹ÜÀíŒÓ£¬²»ÄÜîIÈ¡ÍÅÉ¹Ù†T¸£Àû£¡");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end


	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		msg = format("Í•ş¬FÔÚÙY½ğ¶ÌÈ±£¬Ã¿Ò»·ÖåX¶¼ÒªÓÃÔÚµ¶ÈĞÉÏ¡£¹ÜÀíÕß¸£ÀûÖ»ÄÜ•ºÍ£°l·ÅÀ²¡£");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	if GetTodayWeek() ~= 0 then
	    msg = format("ß€›]µ½°l·Å¹ÜÀíÕß¸£ÀûµÄ•rºòÄØ£¬²»ÒªÌ«Öø¼±°¡£¡");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	
	if GetFullExp(sceneId, selfId) == GetExp(sceneId, selfId) then
	    msg = format("ÄãµÄ½›òÒÑ½›ß_µ½ÉÏÏŞ£¬¬FÔÚîIÈ¡¸£ÀûÌ«²»ÖµÁË°É¡£È¥ÓÃµôÒ»Ğ©ÔÙí°É£¡");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	--Ã¿ÖÜÖ»ÄÜÁìÈ¡1´Î°ï»á¸£Àû¡£	
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä		
	
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_GUILD_MANAGER_DRAW_BONUS );	
		
	if nWeekCur ~= nDrawPayTimeLast then

		--»ñÈ¡½ğÇ®
		local guildLevel = GetGuildLevel( sceneId, selfId )
		local goldGet = 0;	
		
		local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY);
	
		local nCount1 = GuildMoney * GUILD_MANAGER_BONUS_MONEY_TABLE[Guildpos][1];
		local nCount2 = guildLevel * GUILD_MANAGER_BONUS_MONEY_TABLE[Guildpos][2];
	
		goldGet = (( nCount1 < nCount2 ) and nCount1) or nCount2
		
		if GuildMoney < goldGet then
			x805012_NotifyTips(sceneId, selfId, "ÍÅÉµÄÙY½ğ²»×ã£¬²»ÄÜîI³ö¡£");
			return 0;
		end
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*goldGet)
		AddMoney( sceneId, selfId, goldGet );
		
		--»ñµÃ¾­Ñé
		local level = GetLevel(sceneId, selfId)
		local expGet = guildLevel * level * GUILD_MANAGER_BONUS_EXP_TABLE[Guildpos];
		AddExp( sceneId, selfId, expGet );
		-- add by zchw for welfare
		AuditDrawGuildWelfare(sceneId, selfId, goldGet, expGet);
			
		SetMissionData(sceneId, selfId, MD_GUILD_MANAGER_DRAW_BONUS, nWeekCur );	
		
		local  PlayerName=GetName(sceneId,selfId);
		local sMessage = format("@*;SrvMsg;GLD:#Y±¾Í[%s][#{_INFOUSR%s}]#cffff00îIÈ¡ÍÅÉ¹Ù†TÙºµ“#{_MONEY%d}ºÍ%düc½›ò¡£", GUILD_POSITION_NAME_TABLE[Guildpos],PlayerName, goldGet, expGet );	
        BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
	  
        msg = format("ÄãµÄÂš„ÕÊÇ£º%s",GUILD_POSITION_NAME_TABLE[Guildpos]);
        x805012_NotifyTips(sceneId, selfId, msg);
				
	else
		msg = format("ºÃÄã‚€®”¹ÙµÄ£¬±¾ÖÜÒÑ½›îIß^Ò»´Î¹ÜÀíÕß¸£ÀûÁË£¬ß€ÒªîIÒ»´Î²»³É£¿");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	

end



--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x805012_OnEventRequest( sceneId, selfId, targetId, eventId )
	--´¦ÀíÕâ¸ö½¨ÖşÎïµÄÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
	if eventId ~= x805012_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805012_g_scriptId, x805012_g_BuildingID6 )
		return
	end

	--ÌØ²úÉÌµê
	if GetNumText() == 1 then
		if(sceneId == 205) then DispatchShopItem( sceneId, selfId,targetId, 120 )
			elseif(sceneId == 206) then DispatchShopItem( sceneId, selfId,targetId, 121 )
			elseif(sceneId == 207) then DispatchShopItem( sceneId, selfId,targetId, 122 )
			elseif(sceneId == 208) then DispatchShopItem( sceneId, selfId,targetId, 123 )
			elseif(sceneId == 209) then DispatchShopItem( sceneId, selfId,targetId, 124 )
			elseif(sceneId == 210) then DispatchShopItem( sceneId, selfId,targetId, 125 )
			elseif(sceneId == 211) then DispatchShopItem( sceneId, selfId,targetId, 126 )
			elseif(sceneId == 212) then DispatchShopItem( sceneId, selfId,targetId, 127 )
			elseif(sceneId == 213) then DispatchShopItem( sceneId, selfId,targetId, 128 )
			elseif(sceneId == 214) then DispatchShopItem( sceneId, selfId,targetId, 129 )
			elseif(sceneId == 215) then DispatchShopItem( sceneId, selfId,targetId, 130 )
			elseif(sceneId == 216) then DispatchShopItem( sceneId, selfId,targetId, 131 )
			elseif(sceneId == 217) then DispatchShopItem( sceneId, selfId,targetId, 132 )
			elseif(sceneId == 218) then DispatchShopItem( sceneId, selfId,targetId, 133 )
			elseif(sceneId == 219) then DispatchShopItem( sceneId, selfId,targetId, 134 )
			elseif(sceneId == 220) then DispatchShopItem( sceneId, selfId,targetId, 135 )
			elseif(sceneId == 221) then DispatchShopItem( sceneId, selfId,targetId, 136	)
			elseif(sceneId == 222) then DispatchShopItem( sceneId, selfId,targetId, 137	)
		end
	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life Ìí¼ÓÕâ¸ö½¨ÖşÎïµÄÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805012_g_BuildingID6 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	--»ñµÃÅÜÉÌÒøÆ±
	elseif GetNumText() == 2 then
		--ÊÇ·ñÊÇ±¾°ï³ÉÔ±
		local guildid 		= GetHumanGuildID(sceneId,selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "Các hÕ không phäi là ngß¶i cüa bang hµi, nhi®m vø cüa bang hµi không ti®n nói ra"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--ÊÇ·ñÊÇÉÌÈË»ò°ïÖ÷
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ((guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_AGRI) and (guildpos ~= GUILD_POSITION_INDUSTRY) and (guildpos ~= GUILD_POSITION_HR)) then
				BeginEvent(sceneId)
					strText = "Xin l²i, chï có Quan viên thß½ng nghi®p (Thß½ng nhân), Phó bang chü ho£c bang chü m¾i có th¬ l¤y Ngân phiªu."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--¼¶±ğÊÇ·ñ¹»
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "V¸ huynh ğ® này bây gi¶ mà kinh doanh, có l¨ h½i s¾m mµt chút. Hay là ğşi ğªn c¤p 40 r°i quay lÕi tìm ta, nhß thª s¨ t¯t h½n"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--²»Í¬¼¶±ğ¶ÔÓ¦²»Í¬µÄ½ğ¶î
		local curMoney = 0
		local maxMoney = 0
		local maxmaxMoney = 0

		if level>=40 and level<55 then
			curMoney = 20000
			maxMoney = 100000
			maxmaxMoney = 250000
		elseif level>=55 and level<70 then
			curMoney = 30000
			maxMoney = 150000
			maxmaxMoney = 350000
		elseif level>=70 and level<85 then
			curMoney = 40000
			maxMoney = 250000
			maxmaxMoney = 450000
		elseif level>=85 and level<100 then
			curMoney = 50000
			maxMoney = 300000
			maxmaxMoney = 550000
		
		elseif level>=100 and level<115 then
			curMoney = 50000
			maxMoney = 310000
			maxmaxMoney = 600000
		elseif level>=115 and level<130 then
			curMoney = 60000
			maxMoney = 320000
			maxmaxMoney = 650000
		
		elseif level>=130 and level<145 then
			curMoney = 70000
			maxMoney = 330000
			maxmaxMoney = 700000
		else
			curMoney = 80000
			maxMoney = 340000
			maxmaxMoney = 750000
		end

		--ÊÇ·ñÔÚäîÔË
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					strText = "Xin l²i, các hÕ ğang · trÕng thái v§n chuy¬n không th¬ nh§n ngân phiªu."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		--ÊÇ·ñÓĞÒøÆ±
		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805012_g_TicketItemIdx)

		if bagpos ~= -1	then
				BeginEvent(sceneId)
					strText = "Xin l²i, các hÕ chï có th¬ nh§n ğßşc mµt t¶ ngân phiªu."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return

		elseif bagpos == -1 then

				--°ïÅÉ×Ê½ğÊÇ·ñ¹»¿ª³öÒ»ÕÅÒøÆ±µÄ
				local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
				if GuildMoney <= curMoney then
						BeginEvent(sceneId)
							strText = "Quî cüa bang phái không ğü ğ¬ xu¤t ngân phiªu cho các hÕ"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				-- Ò»ÌìÖ»ÄÜÁì 8 ´Î
				local DayTimes, oldDate, nowDate, takenTimes, totalTakenTimes

				DayTimes = GetMissionData( sceneId, selfId, MD_GUILDTICKET_TAKENTIMES )
				oldDate = mod( DayTimes, 100000 )
				takenTimes = floor( DayTimes/100000 )

				nowDate = GetDayTime()
				if nowDate == oldDate then
					takenTimes = takenTimes + 1
				else
					takenTimes = 1
				end

				if takenTimes > x805012_g_TicketTakeTimes then
					BeginEvent( sceneId )
						AddText( sceneId, "Xin l²i, các hÕ nh§n nhi®m vø thß½ng nhân hôm nay ğã ğßşc 8 l¥n, xin ngày mai quay lÕi." )
					EndEvent( sceneId )
					DispatchMissionTips( sceneId, selfId )
					return
				end

				-- °ïÅÉÒ»Ìì½ÓÈ¡´ÎÊıÓĞÉÏÏŞ
				DayTimes = GetTicketTakenTimes( sceneId, selfId )
				oldDate = mod( DayTimes, 100000 )
				totalTakenTimes = floor( DayTimes/100000 )

				if nowDate == oldDate then
					totalTakenTimes = totalTakenTimes + 1
				else
					totalTakenTimes = 1
				end

				local guildLevel = GetGuildLevel( sceneId, selfId )
				if not guildLevel or guildLevel < 1 or guildLevel > 5 then
					guildLevel = 1
				end

				local maxTimes = x805012_g_BaseTotalTicketTakeTimes +
					x805012_g_TicketTakeTimesBonusPerLvl * ( guildLevel - 1 );
					
				local curGuildBoom = CityGetAttr(sceneId, selfId,x805012_g_GuildBoomIndex);
				if(curGuildBoom < x805012_g_TicketDecValue) then
					maxTimes = floor(maxTimes * x805012_g_TicketDecRate);
				elseif(curGuildBoom >= x805012_g_TicketIncValue) then
					maxTimes = floor(maxTimes * x805012_g_TicketIncRate);
				end

				if totalTakenTimes > maxTimes then
					BeginEvent( sceneId )
						AddText( sceneId, "Ch² tÕi hÕ ngày nào cûng có " .. maxTimes .. " s¯ t¶ ngân phiªu ğ¬ giao cho các hÕ, hi®n tÕi ğã vßşt quá s¯ này." )
					EndEvent( sceneId )
					DispatchMissionTips( sceneId, selfId )
					return
				end


				-- É¾³ıÉíÉÏµÄÅÜÉÌÉÌÆ·
				local itemIdx = 0
				for i = 0, 99 do
					itemIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )
					if itemIdx >= 20400001 and itemIdx <= 20400200 then
						LuaFnEraseItem( sceneId, selfId, i )
					end
				end

				BeginAddItem( sceneId )
				AddItem( sceneId, x805012_g_TicketItemIdx, 1 )
				ret = EndAddItem( sceneId, selfId )
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId )
					bagpos = GetBagPosByItemSn(sceneId, selfId, x805012_g_TicketItemIdx)
					--¸ù¾İËùÔÚ³¡¾°,ÎïÆ·ÀàĞÍ»ñµÃÓ¦¸ÃµÄÎïÆ·¼ÛÖµ
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE, curMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE, maxMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MAX_MONEY_TYPE, maxmaxMoney)
					CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*curMoney)
					
					DayTimes = nowDate + totalTakenTimes * 100000
					SetTicketTakenTimes( sceneId, selfId, DayTimes )
					
					DayTimes = nowDate + takenTimes * 100000
					SetMissionData( sceneId, selfId, MD_GUILDTICKET_TAKENTIMES, DayTimes )
					
					LuaFnRefreshItemInfo(sceneId, selfId, bagpos)
					--ÅÜÉÌbuff
					LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,113,0)
					BeginEvent(sceneId)
						strText = "Ch² tÕi hÕ vçn còn " .. ( maxTimes + 1 - totalTakenTimes ) .. "  Ngân phiªu, r¤t t¯t r¤t t¯t, t¶ ngân phiªu này các hÕ c¥m l¤y, kiªm v« nhi«u ngân lßşng cho b±n Bang quä công lao không nhö."
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					BeginEvent(sceneId)
						strText = "Lînh ngân phiªu th¤t bÕi !"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
		end
	--½»»ØÒøÆ±
	elseif GetNumText() == 3 then
		--ÊÇ·ñÊÇ±¾°ï³ÉÔ±
		local guildid 		= GetHumanGuildID(sceneId, selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
		--ÊÇ·ñÊÇÉÌÈËÈÕ
		local merchandiseDayRate	=	1.0;
		
		if (GetTodayWeek() == 6 )then
			merchandiseDayRate = x805012_g_MerchandiseRate;
		end
		
		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "Các hÕ không phäi là ngß¶i cüa b±n bang..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--ÊÇ·ñÊÇÉÌÈË»ò°ïÖ÷
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ( (guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_AGRI) and (guildpos ~= GUILD_POSITION_INDUSTRY) and (guildpos ~= GUILD_POSITION_HR)) then
				BeginEvent(sceneId)
					strText = "Xin l²i, chï có Quan viên thß½ng nghi®p (Thß½ng nhân), Phó bang chü ho£c bang chü m¾i có th¬ giao trä Ngân phiªu."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--¼¶±ğÊÇ·ñ¹»
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "V¸ huynh ğ® này bây gi¶ mà kinh doanh, có l¨ h½i s¾m mµt chút.."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805012_g_TicketItemIdx)
		if bagpos ~= -1	then
			local	TicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE)
			local	MaxTicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE)
			if TicketMoney ~= 0 then

				if TicketMoney < MaxTicketMoney	then
						BeginEvent(sceneId)
							strText = "Ngân phiªu cüa các hÕ không nh§n ğßşc s¯ ti«n ğáng phäi nh§n, tiªp tøc ği kiªm ti«n ği"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				local ReturnType = DelItem(sceneId, selfId, x805012_g_TicketItemIdx, 1)
				LuaFnCancelSpecificImpact(sceneId,selfId,113)
				if ReturnType == 0 then
					BeginEvent(sceneId)
						strText = "Không th¬ xóa ngân phiªu"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				else
					BeginEvent(sceneId)
						strText = "Xóa ngân phiªu thành công"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end

				LuaFnAuditPaoShang(sceneId, selfId, TicketMoney)

				local	FatigueRate = 1.0

				local isLittleFatigueState 		= LuaFnIsLittleFatigueState(sceneId, selfId)
				local isExceedingFatigueState = LuaFnIsExceedingFatigueState(sceneId, selfId)
				
				if(isExceedingFatigueState == 1) then
					FatigueRate = 0.0
				elseif(isLittleFatigueState == 1) then
					FatigueRate = 0.5
				end

				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney * x805012_g_GuildRate*merchandiseDayRate*FatigueRate)	-- °ïÅÉ»ñµÃµÄ×Ê½ğ»Ø±¨
				AddMoney(sceneId, selfId, TicketMoney * x805012_g_PlayerRate*merchandiseDayRate)	-- ¸öÈË»ñµÃµÄ×Ê½ğ»Ø±¨

				local contripoint = 0
				local exppoint		= 0

				if level>=11 and level <40 then
					contripoint = 5
					exppoint = 30000
				elseif level>=40 and level<60 then
					contripoint = 5
					exppoint = 45000
				elseif level>=60 and level<80 then
					contripoint = 5
					exppoint = 50000
				elseif level>=80 and level<100 then
					contripoint = 5
					exppoint = 55000
				elseif level>=100 and level<120 then
					contripoint = 5
					exppoint = 60000
				elseif level>=120 then
					contripoint = 5
					exppoint = 65000
				--else
				--	contripoint = 5
				--	exppoint = 30000
				end

				CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, contripoint)
				AddExp(sceneId, selfId, exppoint*merchandiseDayRate)

				--¼ÇÂ¼ Íê³É ĞÅÏ¢
				local nCaoYunTime = GetMissionData( sceneId, selfId, MD_CAOYUN_COMPLETE_TIME );
				
				local nCaoYunNum = mod(nCaoYunTime,1000)
				
				
				local nWeek = floor(nCaoYunTime/1000)
				

				local nWeekCur = GetWeekTime()		--µ±Ç°Ê±¼ä
				--³¬¹ıÒ»ÖÜ£¬ ÖØĞÂÉèÖÃ Íê³É´ÎÊı
				if nWeekCur ~= nWeek then
					nCaoYunNum = 1;
					nCaoYunTime = nWeekCur*1000 + nCaoYunNum;
					SetMissionData(sceneId, selfId, MD_CAOYUN_COMPLETE_TIME, nCaoYunTime );				
				else
					nCaoYunNum = nCaoYunNum + 1;
					nCaoYunTime = nWeekCur*1000 + nCaoYunNum;
					SetMissionData(sceneId, selfId, MD_CAOYUN_COMPLETE_TIME, nCaoYunTime );
				end
			
			
				--°ïÅÉÆµµÀÍ¨Öª
				local name = GetName( sceneId, selfId )
				BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#Y#{_INFOUSR" .. name .. "}#RHoàn t¤t nhi®m vø thß½ng nhân, giúp b±n bang tång s¯ ti«n cüa bang hµi lên #{_MONEY"..TicketMoney*x805012_g_GuildRate*merchandiseDayRate*FatigueRate .. "}", 6 )
				--BroadMsgByChatPipe( sceneId, selfId, "22", 6 )
				
				if (merchandiseDayRate ~= 1.0  )then
					Msg2Player(sceneId, selfId, "#RDo mai là ngày thß½ng nhân, vì v§y các hÕ thu ğßşc nhi«u thu nh§p h½n bình thß¶ng.",MSG2PLAYER_PARA);
				end
				
				LuaFnComMissComplete( sceneId, selfId )
	
			else
				BeginEvent(sceneId)
					strText = "Xin l²i, ngân phiªu cüa các hÕ không có ti«n"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
		else
			BeginEvent(sceneId)
				strText = "Xin l²i, các hÕ không có ngân phiªu"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_QianZhuang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --µ÷ÓÃ³ÇÊĞÉÌµê½çÃæ
			UICommand_AddInt(sceneId,x805012_g_BuildingID6)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --µ÷ÓÃ³ÇÊĞÉÌÒµÂ·Ïß½çÃæ
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 105)
	elseif GetNumText() == 7 then
			BeginEvent( sceneId )
				AddText( sceneId, "Xin hãy mang ngân phiªu quá hÕn ğ£t vào trong ô v§t ph¦m thÑ nh¤t!" )
			EndEvent( sceneId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x805012_g_scriptId, -1, 2 )
	elseif GetNumText() == 8 then
		--x805012_DrawPay( sceneId, selfId );
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x805012_g_scriptId)
			UICommand_AddInt(sceneId, targetId)
			UICommand_AddString(sceneId, "DrawPay");
			UICommand_AddString(sceneId, "Äú´_¶¨ÒªÏûºÄÒ»¶¨”µÁ¿µÄÍØ•£¬îIÈ¡±¾ÖÜµÄÍÅÉ¹¤ÙY†á£¿");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
	elseif GetNumText() == 9 then
		x805012_DrawManagerBonus( sceneId, selfId );
	elseif GetNumText() == 10 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BPFL_20080318_01}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 11 then
		local guildmoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
		local guildmaxmoney = CityGetAttr(sceneId, selfId, 16)
		
		if guildmoney < guildmaxmoney then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId) --µ÷ÓÃ°ïÅÉ×Ê½ğ¾èÖú½çÃæ
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 19822)
		else  --°ï»á×Ê½ğÒÑ¾­µ½´ïÉÏÏŞ£¬²»ĞèÒªÔÙ¾èÖúÁË¡£
			BeginEvent(sceneId)
				AddText(sceneId,"#{BPZJ_0801014_003}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif GetNumText() == 12 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BPZJ_0801014_019}")--°ï»á×Ê½ğ¾èÖú½éÉÜ
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end

--**********************************
--Íæ¼ÒÌá½»ÕäÊŞºóµÄ»Øµ÷º¯Êı
--**********************************
function x805012_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if index1 < 0 or index1 >= 255 then
		x805012_MyNotifyTip( sceneId, selfId, "Äúß€›]ÓĞ·ÅÖÃÏëÒªÉÏ½»µÄß^ÆÚãyÆ±¡£" )
		return
	else
		if LuaFnIsItemAvailable( sceneId, selfId, index1) == 1 then
			local	itm_id		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, index1 )
			if(itm_id == x805012_g_OutDateTicketItemIdx) then
				local	TicketMoney = GetBagItemParam(sceneId, selfId, index1, 0, 2)
				EraseItem( sceneId, selfId, index1) 
				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney)	-- °ïÅÉ»ñµÃµÄ×Ê½ğ»Ø±¨
				AddMoney(sceneId, selfId, TicketMoney * 0.2)	-- ¸öÈË»ñµÃµÄ×Ê½ğ»Ø±¨
				local name = GetName( sceneId, selfId )
				BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}²»ÖªÄÄÄÀïµÃíÒ»ˆß^ÆÚãyÆ±£¬#{_MONEY"..TicketMoney.."}ÒÑ³äÈëé±¾ÍµÄÍ•şÙY½ğ¡£", 6 )
				x805012_MyNotifyTip( sceneId, selfId, "ß^ÆÚãyÆ±³äÈëÍ•şÙY½ğ³É¹¦¡£" )
				return
			else
				x805012_MyNotifyTip( sceneId, selfId, "ÄúÒªÉÏ½»µÄÎïÆ·ËÆºõ²»ÊÇß^ÆÚãyÆ±°¡¡£" )
				return
			end
		end
	end
	x805012_MyNotifyTip( sceneId, selfId, "Ìá½»Ê§”¡" )
end

--**********************************
--Íæ¼ÒÌá½»°ï»á×Ê½ğ¾èÖúºóµÄ»Øµ÷º¯Êı
--**********************************
function x805012_PutGuildMoney( sceneId, selfId, money )
	--ÊÇ·ñÊÇ±¾°ï³ÉÔ±£¬°´µÀÀíÊÇ²»»á×ßÕâÀï£¬²»ÊÇ±¾°ïµÄ³ÉÔ±²»¿ÉÄÜ´ò¿ª¾èÖú½çÃæ£¬µ«ÎªÁË±£ÏÕ»¹ÊÇ¼ÓÉÏ
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

	if guildid ~= cityguildid then
		x805012_NotifyTips(sceneId, selfId, "éwÏÂ²»ÊÇ±¾Í³É†T£¡")
		return
	end
	
	if money < x805012_g_GuildMoneyLimit then --²»Ó¦¸Ã×ßµ½ÕâÀï£¬³ı·Ç¿Í»§¶Ë·Ç·¨Êı¾İ
		x805012_NotifyTips(sceneId, selfId, "ÊäÈëµÄ½ğ¶îĞ¡ÓÚ#{_EXCHG"..x805012_g_GuildMoneyLimit.."}")
		return
	end
	
	--¶Ô²»Æğ£¬ÄúÊäÈëµÄ½ğ¶î´óÓÚÄúËùĞ¯´øµÄ½ğ¶î¡£
	local nMoneyJZ = GetMoneyJZ(sceneId,selfId)
	local nMoneyJB = GetMoney(sceneId,selfId)
	local nMoneySelf = nMoneyJZ + nMoneyJB
	if nMoneySelf < money then
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_007}")
		return
	end
	
	--ÊÇ·ñ°²È«Ê±¼ä£¬Õâ¸öÅĞ¶Ïº¯ÊıÀïÃæ×Ô¼ºÓĞÌáÊ¾ĞÅÏ¢£¬²»ĞèÒªÕâÀïĞ´ÌáÊ¾ĞÅÏ¢
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	local addmoney = floor(money*0.9)
	--hzp 2008-12-15
	local guildmoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
	local guildmaxmoney = CityGetAttr(sceneId, selfId, 16)
	
	--PrintStr(" addmoney "..addmoney.." guildmoney "..guildmoney.." guildmaxmoney "..guildmaxmoney)
	
	if addmoney + guildmoney > guildmaxmoney then
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_021}#{_MONEY"..guildmaxmoney.."}#{BPZJ_0801014_014}")
		return
	end
	
	--local ret = CostMoney(sceneId, selfId, money)
	local jzCost, jbCost = LuaFnCostMoneyWithPriority( sceneId, selfId, money );	
	if jzCost == -1 then
		x805012_NotifyTips(sceneId, selfId, "¿Û³ı½ğåXÊ§”¡£¡")
		return
	end
	--Èç¹ûÖ»¿Û³ı½ğ±Ò
	if jzCost == 0 then
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, addmoney)
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_MONEY"..jbCost.."}£¡")
		x805012_NotifyTips(sceneId, selfId, "¿ÛË°Ö®ºó£¬°ï»á×Ê½ğÊµ¼ÊÔö³¤ÁË#{_MONEY"..addmoney.."}£¡")
		local name = GetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_MONEY"..jbCost.."}#{BPZJ_0801014_018}", 6 )
	end
	--Èç¹ûÖ»¿Û³ı½»×Ó
	if jbCost == 0 then
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, addmoney)
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_EXCHG"..jzCost.."}£¡")
		x805012_NotifyTips(sceneId, selfId, "¿ÛË°Ö®ºó£¬°ï»á×Ê½ğÊµ¼ÊÔö³¤ÁË#{_MONEY"..addmoney.."}£¡")
		local name = GetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_EXCHG"..jzCost.."}#{BPZJ_0801014_018}", 6 )
	end
	--Èç¹û¼ÈÓĞ½»×ÓÓÖÓĞ½ğ±Ò
	if jzCost ~= 0 and jbCost ~= 0 then
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, addmoney)
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_EXCHG"..jzCost.."}£¡")
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_MONEY"..jbCost.."}£¡")
		x805012_NotifyTips(sceneId, selfId, "¿ÛË°Ö®ºó£¬°ï»á×Ê½ğÊµ¼ÊÔö³¤ÁË#{_MONEY"..addmoney.."}£¡")
		local name = GetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_EXCHG"..jzCost.."}ºÍ#{_MONEY"..jbCost.."}#{BPZJ_0801014_018}", 6 )
		--BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_MONEY"..jbCost.."}#{BPZJ_0801014_018}", 6 )

	end
end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x805012_NotifyTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x805012_MyNotifyTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
