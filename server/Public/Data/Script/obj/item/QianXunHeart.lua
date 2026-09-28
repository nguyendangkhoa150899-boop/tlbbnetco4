-- Ñ°Â·Ö®ĞÄ ItemID 40004435

-- ½Å±¾ºÅ
x300085_g_scriptId = 300085

x300085_g_event = 229024				-- Ç§Ñ°ÈÎÎñ½Å±¾
--ÈÎÎñºÅ
x300085_g_MissionId			= 421

--ÈÎÎñ»·Êı
x300085_g_Mission_RoundNum	 = 5		--µÚ5Î»²ÎÊı

x300085_g_FuQiMission_IDX		 	= 131	--·òÆŞ¹ØÏµÈÎÎñË÷Òı
x300085_g_JieBaiMission_IDX		= 132	--½á°İ¹ØÏµÈÎÎñË÷Òı
x300085_g_ShiTuMission_IDX		= 133	--Ê¦Í½¹ØÏµÈÎÎñË÷Òı

x300085_g_scenePosInfoList = { {sceneId=7,  scenename="Kiªm Các", PosName="Kiªm môn ği®p thúy", PosX=130, PosY=140,  PosR=10, Area=711 },
															 {sceneId=8,  scenename="Ğôn Hoàng", PosName="Hãn häi c¥u ph§t", PosX=267, PosY=251,  PosR=10, Area=811 },
															 {sceneId=5,  scenename="Kính K°", PosName="Ng÷c ğái lâm phong", PosX=35 , PosY=265,  PosR=10, Area=511 },
															 {sceneId=4,  scenename="Thái H°", PosName="Vû tÕ ca ğài", PosX=155, PosY=255,  PosR=10, Area=411 },
															 {sceneId=3,  scenename="Tung S½n", PosName="Giang s½n ğa ki«u", PosX=280, PosY=80,   PosR=10, Area=311 },
															 {sceneId=30, scenename="Tây H°", PosName="Nh¤t v÷ng h± bào", PosX=170, PosY=230,  PosR=10, Area=3011},															 
															 {sceneId=31, scenename="Long Tuy«n", PosName="Phi lßu trñc hÕ", PosX=270, PosY=280,  PosR=10, Area=3111},
															 {sceneId=25, scenename="Thß½ng S½n", PosName="Tñ thüy niên hoa", PosX=260, PosY=110,  PosR=10, Area=2512},															 
															 {sceneId=32, scenename="Võ Di", PosName="Yên töa nh¸ ki«u", PosX=50 , PosY=180,  PosR=10, Area=3211},															 
															 {sceneId=0,  scenename="LÕc Dß½ng", PosName="Kim thành thang trì", PosX=50,  PosY=220,  PosR=10, Area=11  } }

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x300085_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êı
end


--**********************************
--Cái này ÎïÆ·toÕ ğµ Ê¹ÓÃ¹ı³ÌĞúng·ñÀàËÆÓÚ¼¼ÄÜ: 
--H® th¯ng»áTÕi Ö´ĞĞ¿ªÊ¼Ê±¼ì²âCái này º¯ÊıtoÕ ğµ Tr· v«Öµ,Èç¹ûTr· v«th¤t bÕiÔòºöÂÔºóÃætoÕ ğµ ÀàËÆ¼¼ÄÜtoÕ ğµ Ö´ĞĞ.
--Tr· v«1: ¼¼ÄÜÀàËÆtoÕ ğµ ÎïÆ·,¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜtoÕ ğµ Ö´ĞĞ£»Tr· v«0: ºöÂÔºóÃætoÕ ğµ ²Ù×÷.
--**********************************
function x300085_IsSkillLikeScript( sceneId, selfId )
	return 1	 --Cái này ½Å±¾C¥n ¶¯×÷Ö§³Ö
end


--**********************************
--Ö±½ÓHuÖ böĞ§¹û: 
--H® th¯ng»áÖ±½Óµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾İCái này º¯ÊıtoÕ ğµ Tr· v«ÖµXác nh§nÒÔºótoÕ ğµ Á÷³ÌĞúng·ñÖ´ĞĞ.
--Tr· v«1: ÒÑ¾­HuÖ bö¶ÔÓ¦Ğ§¹û,²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»Tr· v«0: Ã»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û,¼ÌĞøÖ´ĞĞ.
--**********************************
function x300085_CancelImpacts( sceneId, selfId )
	return 0	 --²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕTr· v«0.
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú: 
--Òıµ¼¼¼ÄÜ»áTÕi Ã¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃCái này ½Ó¿Ú.
--Tr· v«: 1¼ÌĞøÏÂ´ÎĞÄÌø£»0: ÖĞ¶ÏÒıµ¼.
--×¢: ÕâÀïĞúng¼¼ÄÜÉúĞ§mµt ´ÎtoÕ ğµ Èë¿Ú
--**********************************
function x300085_OnActivateEachTick( sceneId, selfId )
	return 1	 --²»ĞúngÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end


--**********************************
--ĞÅÏ¢ÌáÊ¾
--**********************************
function x300085_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú: 
--H® th¯ng»áTÕi ¼¼ÄÜ¼ì²âtoÕ ğµ Ê±¼ä ği¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾İCái này º¯ÊıtoÕ ğµ Tr· v«ÖµXác nh§nÒÔºótoÕ ğµ Á÷³ÌĞúng·ñÖ´ĞĞ.
--Tr· v«1: Ìõ¼ş¼ì²âÍ¨¹ı,¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»Tr· v«0: Ìõ¼ş¼ì²âth¤t bÕi,ÖĞ¶ÏºóĞøÖ´ĞĞ.
--**********************************
function x300085_OnConditionCheck( sceneId, selfId )
	
	--±³°üÖĞtoÕ ğµ Î»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--Ğ£ÑéÊ¹ÓÃtoÕ ğµ ÎïÆ·
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--¼ì²âÎïÆ·Ğúng·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x300085_MsgBox( sceneId, selfId, "V§t ph¦m này ğã b¸ khóa!" )
		return 0
	end

	if IsHaveMission( sceneId, selfId, x300085_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x300085_g_MissionId)
	local nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x300085_g_Mission_RoundNum)
	local ScintInfo = x300085_g_scenePosInfoList[nRoundNum]
	
	--È¡ ği¬mÍæ¼Òµ±Ç°×ø±ê
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	--¼ÆËãÍæ¼ÒÓëÄ¿±ê ği¬mtoÕ ğµ ¾àÀë
	local Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
	local str = format("Ngß½i tìm nhi®m vø ğ® %d: Ği #G%s#W thåm dò #G%s#{_INFOAIM%d,%d,%d,%s}#W, v×a xem cänh ğ©p giang h° ği. Thïnh sØ døng #YTiên nhân chï lµ#W.", nRoundNum, ScintInfo.scenename, ScintInfo.PosName, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)		
	if sceneId ~= ScintInfo.sceneId then
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return 0
	end
	
	--PrintStr("Distance=" .. Distance)

	if Distance > ScintInfo.PosR then
		BeginEvent(sceneId)
			AddText(sceneId,str)
			AddText(sceneId,"Khoäng cách còn "..Distance.." thß¾c")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	
	elseif Distance <= ScintInfo.PosR then  		
 		local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--Ğµi viên ËùÑ¡toÕ ğµ ÈÎÎñÀàĞÍ
		-- ±£Ö¤ÈÎÎñ¹ØÏµÈËÒ²ÒªTÕi ¸½½ü
		if nMisType == x300085_g_FuQiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_FuQi",sceneId, selfId) == 0 then
				return 0
			end
		elseif nMisType == x300085_g_JieBaiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_JieBai",sceneId, selfId) == 0 then			
				return 0
			end
		elseif nMisType == x300085_g_ShiTuMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_ShiTu",sceneId, selfId) == 0 then			
				return 0
			end
		else		
			x300085_NotifyTip( sceneId, selfId, "SØ døng v§t ph¦m th¤t bÕi" )		
			return 0
		end  		
 		 		
 		return 1		
	end
	
	return 0
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú: 
--H® th¯ng»áTÕi ¼¼ÄÜÏûºÄtoÕ ğµ Ê±¼ä ği¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾İCái này º¯ÊıtoÕ ğµ Tr· v«ÖµXác nh§nÒÔºótoÕ ğµ Á÷³ÌĞúng·ñÖ´ĞĞ.
--Tr· v«1: ÏûºÄ´¦ÀíÍ¨¹ı,¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»Tr· v«0: ÏûºÄ¼ì²âth¤t bÕi,ÖĞ¶ÏºóĞøÖ´ĞĞ.
--×¢Òâ: Õâ²»¹â¸ºÔğÏûºÄtoÕ ğµ ¼ì²âÒ²¸ºÔğÏûºÄtoÕ ğµ Ö´ĞĞ.
--**********************************
function x300085_OnDeplete( sceneId, selfId )	
	--
	--TÕi ´Ë»¹ÒªÔÙ´Î¼ì²âmµt ÏÂ....
	--
	local ret
	ret = x300085_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	return 1

end

--**********************************
--Ö»»áÖ´ĞĞmµt ´ÎÈë¿Ú: 
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Thöa mãntoÕ ğµ Ê±ºò),¶øÒıµ¼
--¼¼ÄÜÒ²»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¼¼ÄÜtoÕ ğµ mµt ¿ªÊ¼,ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó).
--Tr· v«1: ´¦Àí³É¹¦£»Tr· v«0: ´¦Àíth¤t bÕi.
--×¢: ÕâÀïĞúng¼¼ÄÜÉúĞ§mµt ´ÎtoÕ ğµ Èë¿Ú
--**********************************
function x300085_OnActivateOnce( sceneId, selfId )
	
	--±³°üÖĞtoÕ ğµ Î»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	CallScriptFunction(x300085_g_event,"OnUseItem",sceneId, selfId, bagId)
	return 1

end
