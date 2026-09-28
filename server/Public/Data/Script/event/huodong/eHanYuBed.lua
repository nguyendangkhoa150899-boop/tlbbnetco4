--º®Óñ´²


--½Å±¾ºÅ
x808072_g_scriptId = 808072

x808072_g_NoRMBBuffID = 5901	--·ÇRMB¹Ò»úµÄbuffµÄID....
x808072_g_RMBBuffID = 5902		--RMB¹Ò»úµÄbuffµÄID....
x808072_g_SpouseBuffID = 5704 --·òÆÞ¹Ò»úbuff

x808072_g_NormalExpBuffID = 5905	--ÆÕÍ¨ »ñµÃ¾­ÑéµÄÌØÐ§....
x808072_g_MoreExpBuffID = 5904		--±©»÷ »ñµÃ¾­ÑéµÄÌØÐ§....

x808072_g_MaxAddExpCount = 60		--Íæ¼Ò¹ÒÒ»´Î»ú¿ÉÒÔ»ñµÃ¾­ÑéµÄ´ÎÊý....(·§Öµ¹¦ÄÜ)

x808072_g_ExpTbl = {

[30] =1785,[31] =1837,[32] =1890,[33] =1942,[34] =1995,
[35] =2047,[36] =2100,[37] =2152,[38] =2205,[39] =2257,
[40] =2310,[41] =2362,[42] =2415,[43] =2467,[44] =2520,
[45] =2572,[46] =2625,[47] =2677,[48] =2730,[49] =2782,
[50] =2835,[51] =2887,[52] =2940,[53] =2992,[54] =3045,
[55] =3097,[56] =3150,[57] =3202,[58] =3255,[59] =3307,
[60] =3360,[61] =3412,[62] =3465,[63] =3517,[64] =3570,
[65] =3622,[66] =3675,[67] =3727,[68] =3780,[69] =3832,
[70] =3885,[71] =3937,[72] =3990,[73] =4042,[74] =4095,
[75] =4147,[76] =4200,[77] =4252,[78] =4305,[79] =4357,
[80] =4410,[81] =4462,[82] =4515,[83] =4567,[84] =4620,
[85] =4672,[86] =4725,[87] =4777,[88] =4830,[89] =4882,
[90] =4935,[91] =4987,[92] =5040,[93] =5092,[94] =5145,
[95] =5197,[96] =5250,[97] =5302,[98] =5355,[99] =5407,
[100] =5460,[101] =5512,[102] =5565,[103] =5617,[104] =5670,
[105] =5722,[106] =5775,[107] =5827,[108] =5880,[109] =5932,
[110] =5985,[111] =6037,[112] =6090,[113] =6142,[114] =6195,
[115] =6247,[116] =6300,[117] =6352,[118] =6405,[119] =6457,
[120] =6510,[121] =6562,[122] =6615,[123] =6667,[124] =6720,
[125] =6772,[126] =6825,[127] =6877,[128] =6930,[129] =6982,
[130] =7035,[131] =7087,[132] =7140,[133] =7192,[134] =7245,
[135] =7297,[136] =7350,[137] =7402,[138] =7455,[139] =7507,
[140] =7560,[141] =7612,[142] =7665,[143] =7717,[144] =7770,
[145] =7822,[146] =7875,[147] =7927,[148] =7980,[149] =8032,
[150]=0,

}

--**********************************
-- OnTime
--**********************************
function x808072_OnSceneTimer(sceneId)

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x808072_DoHanYuLogic( sceneId, nHumanId )
	end

end

--**********************************
-- ¹Ò»ú¼Ó¾­ÑéÂß¼­
--**********************************
function x808072_DoHanYuLogic( sceneId, selfId )

	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--»ñµÃÍæ¼ÒµÄ¹Ò»úÀàÐÍ....
	local GuaJiType = 0
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808072_g_NoRMBBuffID ) == 1 then
		GuaJiType = 1
	elseif LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808072_g_RMBBuffID ) == 1 then
		GuaJiType = 2
	elseif LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808072_g_SpouseBuffID ) == 1 then
		GuaJiType = 3
	end

	if 0 == GuaJiType then
		return
	end

	--·§ÖµÂß¼­....ÏÞÖÆÍæ¼Ò»ñµÃ¾­ÑéµÄ´ÎÊý....Æðµ½Ë«±£ÏÕµÄ×÷ÓÃ....
	local CanAddExpCount = GetMissionData( sceneId, selfId, MD_HANYUBED_CANADDEXP_COUNT )
	if CanAddExpCount <= 40 then
		return
	else
		SetMissionData( sceneId, selfId, MD_HANYUBED_CANADDEXP_COUNT, CanAddExpCount-1 )
	end

	--»ñµÃ¾­Ñé....
	local IsMoreExp = 0
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	local CurExp = x808072_g_ExpTbl[CurLevel]
	if CurExp and CurExp > 0 then

		--RMB¹Ò»ú¸ø2±¶¾­Ñé....²¢ÇÒÓÐ50%¼¸ÂÊ¸ø4±¶¾­Ñé....
		if (2 == GuaJiType) or (3 == GuaJiType) then
			if random(100) <= 50 then
				CurExp = CurExp * 4
				IsMoreExp = 1
			else
				CurExp = CurExp * 2
			end
		end
		if 3 == GuaJiType then
			local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
			if (spouseGuid ~= -1) and (LuaFnGuid2ObjId(sceneId, spouseGuid) ~= -1) then		
				LuaFnAddExp( sceneId, selfId, CurExp);
			end
		else
			LuaFnAddExp( sceneId, selfId, CurExp)
		end

	end

	--¸ø»ñµÃ¾­ÑéµÄbuff....
	if 1 == IsMoreExp then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808072_g_MoreExpBuffID, 0)
	else
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808072_g_NormalExpBuffID, 0)
	end

end

--**********************************
-- Íæ¼ÒÊ¹ÓÃÊéµÄÊ±ºò»Øµ÷±¾½Ó¿Ú
--**********************************
function x808072_OnPlayerUseHanYuBook( sceneId, selfId )

	--ÉèÖÃ¸ÃÍæ¼Ò¿ÉÒÔ»ñµÃ60´Î¾­Ñé....
	SetMissionData( sceneId, selfId, MD_HANYUBED_CANADDEXP_COUNT, x808072_g_MaxAddExpCount + 40 )

end

--**********************************
-- RMB¹Ò»úbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú
--**********************************
function x808072_OnImpactFadeOut( sceneId, selfId, impactId )

	--¹«¸æ....
	--local str = format("#YÁÖ³¯ÐÛ#P£º#W#{_INFOUSR%s}#PÔÚ#Gº®Óñ¹È#PµÄÇ§Äêº®Óñ´²ÉÏÔË¹¦ÐÞÐÐÈýÊ®·ÖÖÓ¡£ÔÚ²»Öª²»¾õÖ®¼ä£¬¹¦Á¦ÒÑ¾­Í»·ÉÃÍ½ø£¬Ô¶·ÇÎôÈÕËùÄÜ±ÈÄâ£¡", GetName(sceneId,selfId) )
	--BroadMsgByChatPipe(sceneId, selfId, str, 4)

end

--**********************************
-- Íæ¼ÒÔÚº®Óñ´²ÖÐÊ°È¡±¦ÏäÖÐÎïÆ·Ê±»Øµ÷±¾½Ó¿Ú
--**********************************
function x808072_OnPlayerPickUpItemInHanYuBed( sceneId, selfId, itemId, bagidx )

	--¹«¸æ....
	if itemId == 30501148 or itemId == 30501149 or itemId ==30501150 or itemId == 30700200 or itemId == 30505178 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)

		local message = format("#{_INFOUSR%s} #PTÕi #GTô Châu (178,129) Lâm Tri«u Hùng#P chï dçn ðªn #GHàn Ng÷c C¯c#P tu luy®n, võ công tiªn nhanh ð°ng th¶i còn ngoài ý mu¯n nh£t ðßþc mµt cái #{_INFOMSG%s}#P.", playerName, transfer )
		BroadMsgByChatPipe(sceneId, selfId, message, 4)

	end

end

--**********************************
-- »ñÈ¡Ä³µÈ¼¶µÄ¾­Ñé
--**********************************
function x808072_GetPreExpOfThisLevel( sceneId, level )

	local Exp = x808072_g_ExpTbl[level]
	if Exp then
		return Exp
	else
		return 0
	end

end
