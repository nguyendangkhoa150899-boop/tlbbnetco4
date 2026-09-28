--ÐÂµÄÔª±¦ÉÌµê
x888902_g_scriptId = 888902
--Ôª±¦ÉÌµêÁÐ±í ÒªÓë¿Í»§¶Ë½çÃæ¶ÔÓ¦
x888902_g_shoplist = {}
x888902_g_shoplist[1]	= {214,181,182,216,215,217,223,224}	--217 dieu van, 210 xay thanh, 223 shop trung lau , 224 shop nl vo hon			--´óÂô³¡
x888902_g_shoplist[2]	= {150, 151,153}	--152 tinh hoa cap 9		--±¦Ê¯ÉÌ³Ç,Ìí¼Ó"´óÀí±¦Ê¯Õ«--149",czf,2009.07.21
x888902_g_shoplist[3]	= {132,218,219, 133, 135, 135}			--ÕäÊÞÉÌ³Ç
x888902_g_shoplist[4]	= {136, 137, 144, 152}	--152			--ÄÏ±±ÔÓ»õ
x888902_g_shoplist[5]	= {120,121,220,165,178,188,189}			--ÐÎÏó¹ã³¡
x888902_g_shoplist[6]	= {192, 193, 192, 192}	--190, 191, 192, 			--»¨ÎèÈË¼ä
x888902_g_shoplist[7]	= {146, 164,212, 134}					--Îä¹¦ÃØ¼® 146 164,134
x888902_g_shoplist[8]	= {156, 157, 158, 159, 160, 161, 162, 163}	--´òÔìÍ¼

x888902_g_shoplist[9]	= {}			--ÎÒÒª¸üÇ¿´ó
x888902_g_shoplist[10]	= {}			--ÎÒÒª¸üÓÐ÷ÈÁ¦
x888902_g_shoplist[11]	= {}			--ÎÒÒª´òÔì¼«Æ·×°±¸
x888902_g_shoplist[12]	= {}				--ÎÒÒª´òÔì¼«Æ·ÕäÊÞ
x888902_g_shoplist[13]	= {}					--ÎÒÒªÒÆ¶¯µÄ¸ü¿ì
x888902_g_shoplist[14]	= {}			--ÎÒÒªÏò±ðÈË±í°×
x888902_g_shoplist[15]	= {}				--ÎÒÒªÑ§Ï°ÐÂ¼¼ÄÜ

x888902_g_shoplist[101]	= {211, 212, 213, 214, 222,223}	
--**********************************
-- ¼ì²é´ËËæÉíNPCµÄ¹¦ÄÜ
-- opÊÇÇëÇóÀà±ð£¬±ÈÈç1´ú±íÔª±¦Ïà¹ØµÄËæÉí²Ù×÷¡­¡­
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId , shopA ,shopB,shopC,shopD)
	

local sun = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)

	local bCheck = x888902_YuanbaoShopCheckOp(sceneId,selfId);
	if shopA == -97 then
	CallScriptFunction((600054), "UpSuJi",sceneId,selfId,targetId,shopB)
	return
	end
	if bCheck > 0 then
		if shopA > 0 and shopA < 300 and x888902_g_shoplist[shopA][shopB] ~= nil then

			if targetId == -1 then
				
				if shopA == 101 and shopB > sun then 
					return
				end 
			
				x888902_g_UIVIP(sceneId, selfId)
				DispatchYuanbaoShopItem( sceneId, selfId, x888902_g_shoplist[shopA][shopB])
				
				
			else
				DispatchNpcYuanbaoShopItem( sceneId, selfId, targetId , x888902_g_shoplist[shopA][shopB])
			end
			
			
			
			
		end
	end
	
	 if  targetId ==1002 and shopA == 1002 then
	local  andid = LuaFnGetMenPai( sceneId, selfId )
	local	lev	= GetLevel( sceneId, selfId )
	if LuaFnGetXinFaLevel(sceneId, selfId, shopB) >=119 then
		x888902_NotifyTip( sceneId, selfId, "ÐÆng c¤p tâm pháp ðÕt cao nh¤t " )
	return
	end
	if (lev +4) <	LuaFnGetXinFaLevel(sceneId, selfId, shopB) then
	x888902_NotifyTip( sceneId, selfId, "ÄãÖ»ÄÜÑ§Ï°¸ß³ö5¼¶µÄÐÄ·¨" )
		return
	end	
    if GetExp(sceneId,selfId) <shopD then
		x888902_NotifyTip( sceneId, selfId, "Chßa ðü "..shopD.." EXP,không th?tång c¤p" )
	return
	end
	local HumanMoney = LuaFnGetMoney( sceneId, selfId )
  	local HumanMoneyJZ = GetMoneyJZ( sceneId, selfId );
	
	if HumanMoney + HumanMoneyJZ < shopC  then
		x888902_NotifyTip( sceneId, selfId, "Chßa ðü ".."#{_MONEY"..shopC.."}".." không th?tång c¤p" )
		return
	end
	
	local nDelJZ, nDelMoney = LuaFnCostMoneyWithPriority(sceneId, selfId, shopC);
	if nDelJZ ~= -1 then
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, shopB) + 1
		LuaFnAddExp(sceneId,selfId,0-shopD)
		LuaFnSetXinFaLevel(sceneId,selfId,shopB,nXinfaLevel)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
		x888902_NotifyTip( sceneId, selfId, "Hao t¯n "..shopD.." EXP v?".."#{_MONEY"..shopC.."}".."Nâng c¤p tâm pháp lên c¤p "..nXinfaLevel.." thành công" )	
		DispatchXinfaLevelInfo( sceneId, selfId, selfId,tonumber( andid) );
	end
end	

end


function x888902_g_UIVIP(sceneId, selfId)  --vipµÈ¼¶
local sun = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)
if 	sun > 6 then
	sun = 6
end	
	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId,sun )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20160227 )	
	
end	

	

function x888902_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end	

function x888902_YuanbaoShopCheckOp(sceneId,selfId)
	--µØ¸®
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:µØ¸®Àï²»ÄÜÊ¹ÓÃËæÉí¹¦ÄÜ", 0);
		return 0
	end
	--×é¶Ó¸úËæ
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			return 0
		end
		if teamFollowFlag ~= 0 and teamLeaderFlag ~= 1 then
			return 0
		end
	end
	--Ë«ÈËÆï³Ë
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--´¦ÓÚË«ÈËÆï³Ë×´Ì¬£¬ÇÒÊÇ±»¶¯µÄ£¬½»¸øÖ÷¶¯·½À´´¦Àí
			return 0
		end
	end
	--15¼¶ÒÔÉÏ
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 10 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:C¤p ðµ 10 m¾i có th¬ sØ døng", 0);
		return 0
	else

		return 1
	end
	return 0
end
