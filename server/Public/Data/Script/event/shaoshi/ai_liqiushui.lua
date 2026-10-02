--Æ®Ãì·å ²»Æ½µÀÈËAI

--F	¡¾°µÀ×¡¿¶Ô×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....ÔÙ¸øÍæ¼Ò¼Ó¸ö½áÊøºó»á»Øµ÷½Å±¾µÄbuff....»Øµ÷Ê±ÈÃBOSS¸øÆäÖÜÎ§ÈË¼ÓÉËº®buff²¢º°»°....
--G ¡¾¾«Ëã¡¿¸ø×Ô¼ºÓÃÒ»¸ö¼ÓbuffµÄ¼¼ÄÜ....
--H ¡¾ÑÌ»¨¡¿¶Ô×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....ÔÙ¸øÍæ¼Ò¼Ó¸ö½áÊøºó»á»Øµ÷½Å±¾µÄbuff....»Øµ÷Ê±º°»°....
--I	¡¾ÅóÓÑ¡¿×¿²»·²ËÀÊ±¸ø×Ô¼ºÓÃÒ»¸ö¼ÓbuffµÄ¼¼ÄÜ....


--È«³Ì¶¼´øÓĞÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--Ã¿¸ô30Ãë¶ÔËæ»úÍæ¼ÒËæ»úÊ¹ÓÃFH....
--Ã¿¸ô45Ãë¶Ô×Ô¼ºÊ¹ÓÃG....
--ËÀÍö»òÍÑÀëÕ½¶·Ê±¸øËùÓĞÍæ¼ÒÇå³ıFHµÄbuff....
--ËÀÍöÊ±Ñ°ÕÒ²»Æ½µÀÈË....ÉèÖÃÆäĞèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
--ËÀÍöÊ±·¢ÏÖ²»Æ½µÀÈËÒÑ¾­ËÀÁË....Ôò´´½¨ÁíÒ»¸öBOSS....


--½Å±¾ºÅ
x890069_g_ScriptId	= 890069

--¸±±¾Âß¼­½Å±¾ºÅ....
x890069_g_FuBenScriptId = 890063

--ÃâÒßBuff....
x890069_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x890069_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--¼¼ÄÜ....
x890069_SkillID_F		= 910
x890069_BuffID_F1		= 19639
x890069_BuffID_F2		= 19640

x890069_SkillID_G		= 920

x890069_SkillID_H		= 911
x890069_BuffID_H		= 19741
x890069_BuffID_H2		= 19742
x890069_BuffID_H3		= 19743
x890069_BuffID_H4		= 19744
x890069_BuffID_H5		= 19745
x890069_BuffID_H6		= 19746

x890069_SkillID_I		= 1036
x890069_BuffID_I1		= 10253
x890069_BuffID_I2		= 10254

x890069_SkillID_J		= 912
x890069_BuffID_J		= 22405

x890069_SkillCD_FH	=	15000
x890069_SkillCD_G		=	10000
x890069_SkillCD_J	=	12000


x890069_MyName			= "Ğinh xuân thu"	--×Ô¼ºµÄÃû×Ö....

--AI Index....
x890069_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1ĞèÒª½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x890069_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x890069_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x890069_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x890069_IDX_CD_SkillJ			= 5	--G¼¼ÄÜµÄCD....

x890069_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....

--lv,500v, 1000v, 
x890069_LootItem_1 = {
39910003, 39910004,
}
--huyet ngoc, tinh ngoc, long ngoc, huyen, bang, hoa,doc
x890069_LootItem_2 = {
20301007,
}
x890069_LootItem_3 = {
--20500005, 20501005, 20502005,50502001,50502002,50502003,50502004,
}
x890069_LootItem_4 = {
--20500006, 20501006, 20502006,50503001,50504002,50511001,50511002,50512001,50512002,50512003,50512004,
}
--**********************************
--³õÊ¼»¯....
--**********************************
function x890069_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890069_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x890069_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890069_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜĞÄÌø....
	if 1 == x890069_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜĞÄÌø....
	if 1 == x890069_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜĞÄÌø....
	if 1 == x890069_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	--J¼¼ÄÜĞÄÌø....
	if 1 == x890069_TickSkillJ( sceneId, selfId, nTick ) then
		return
	end

	local x,z = GetWorldPos(sceneId,selfId)
	local MonsterId, DogX, DogZ
	local nMonsterNum = GetMonsterCount( sceneId )
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, MonsterId) == "Huyªt chú vu c±" then
			DogX, DogZ = GetWorldPos( sceneId, MonsterId )
		end
	end
	if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 6*6 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19650, 0 )
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x890069_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890069_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890069_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x890069_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890069_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )
	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890069_g_FuBenScriptId, "CreateBOSS", sceneId, "LiFan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x890069_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x890069_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890069_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ıÀîÇïË®....
	CallScriptFunction( x890069_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "DingChunQiu", 2 )

	-- zchw È«Çò¹«¸æ
	local	playerName	= GetName( sceneId, killerId )
	
	--É±ËÀ¹ÖÎïµÄÊÇ³èÎïÔò»ñÈ¡ÆäÖ÷ÈËµÄÃû×Ö....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--Èç¹ûÍæ¼Ò×é¶ÓÁËÔò»ñÈ¡¶Ó³¤µÄÃû×Ö....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		--str = format("#cff99ccTÕi #Y[Thiªu Th¤t S½n]#W#cff99cc vang lên mµt tiªng s¤m xé toÕc b¥u tr¶i u ám. Thì ra là #Y[#{_INFOUSR%s}]#W#cff99cc ğã th¯ng lînh ğµi ngû ğánh bÕi #Y[Ğinh Xuân Thu]#W. ", playerName); --ÀîÇïË®
		AddGlobalCountNews( sceneId, str )
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	local ItemDroplisst = {}
    ItemDroplisst[1]= {38000397,30504583}----CNTP
    ItemDroplisst[2]= {50601001,50601002,50602001,50611001,50611002,50602002,50612001,50612002,50602003,50612003,50602004}----ID ngoc
    ItemDroplisst[3]= {38000396}----CNP
	local PlayerObj = {}
	local NearTeamSize = GetNearTeamCount(sceneId,killerId)

	if NearTeamSize == -1 then
			local Tyle = random(1,100)
			if Tyle <= 10 then	----------ty le CNTP	
			AddMonsterDropItem( sceneId, selfId, killerId, ItemDroplisst[1][random( 1,getn(ItemDroplisst[1]))] )
			end
			if Tyle <= 100 then		
			AddMonsterDropItem( sceneId, selfId, killerId, ItemDroplisst[2][random( 1,getn(ItemDroplisst[2]))] )
			end
			
			if Tyle <= 90 then		
			AddMonsterDropItem( sceneId, selfId, killerId, 38000396)
			end
	else
			
			
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, killerId, i )
		PlayerObj[i] = PlayerId
		if LuaFnIsObjValid( sceneId, PlayerObj[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerObj[i] ) == 1 and LuaFnIsCharacterLiving( sceneId, PlayerObj[i] ) == 1 then					-- ²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷

			local Tyle = random(1,100)
			if Tyle <= 10 then	----------ty le CNTP	
			AddMonsterDropItem( sceneId, selfId, PlayerObj[i], ItemDroplisst[1][random( 1,getn(ItemDroplisst[1]))] )
			end
			if Tyle <= 100 then		
			AddMonsterDropItem( sceneId, selfId, PlayerObj[i], ItemDroplisst[2][random( 1,getn(ItemDroplisst[2]))] )
			end
			if Tyle <= 90 then		
			
			AddMonsterDropItem( sceneId, selfId, PlayerObj[i], 38000396 )
			end
		end
		end
	
	 
	
	end
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890069_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillFH, x890069_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillG, x890069_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillJ, x890069_SkillCD_J )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890069_IDX_CombatFlag, 0 )

	--¸øËùÓĞÍæ¼ÒÇå³ıFHµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890069_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890069_BuffID_H )
		end
	end

end


--**********************************
--FH¼¼ÄÜĞÄÌø....
--**********************************
function x890069_TickSkillFH( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillFH, x890069_SkillCD_FH-(nTick-cd) )

		--Ëæ»úÊ¹ÓÃFH....
		if random(100) < 50 then
			return x890069_UseSkillF( sceneId, selfId )
		else
			return x890069_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G¼¼ÄÜĞÄÌø....
--**********************************
function x890069_TickSkillG( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillG, x890069_SkillCD_G-(nTick-cd) )
		return x890069_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--J¼¼ÄÜĞÄÌø....
--**********************************
function x890069_TickSkillJ( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.4666 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillJ )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillJ, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_CD_SkillJ, x890069_SkillCD_J-(nTick-cd) )
		return x890069_UseSkillJ( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜĞÄÌø....
--**********************************
function x890069_TickSkillI( sceneId, selfId, nTick )

	--»ñµÃµ±Ç°¿ñ±©mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--Èç¹û²»ĞèÒª¿ñ±©»òÕßÒÑ¾­¿ñ±©ÁËÔò·µ»Ø....
		return 0

	elseif CurMode == 1 then

		--Èç¹ûĞèÒª¿ñ±©ÔòÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
		local ret =  x890069_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x890069_UseSkillF( sceneId, selfId )

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x890069_BuffID_F1) == 1 then
		return 0
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x890069_BuffID_H) == 1 then
		return 0
	end

	--¸±±¾ÖĞÓĞĞ§µÄÍæ¼ÒµÄÁĞ±í....
	local PlayerList = {}

	--½«ÓĞĞ§µÄÈË¼ÓÈëÁĞ±í....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Ëæ»úÌôÑ¡Ò»¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillID_F, selfId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890069_BuffID_F1, 0 )
	--LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890069_BuffID_F3, 0 )
	x890069_MsgBox( sceneId, PlayerId, "Ngß½i ğem · 10 giây sau sinh ra n± mÕnh, thïnh r¶i xa ğám ngß¶i!" )

	return 1

end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x890069_UseSkillG( sceneId, selfId )


	--¸±±¾ÖĞÓĞĞ§µÄÍæ¼ÒµÄÁĞ±í....
	local PlayerList = {}

	--½«ÓĞĞ§µÄÈË¼ÓÈëÁĞ±í....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Ëæ»úÌôÑ¡Ò»¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillID_G, PlayerId, x, z, 0, 1 )

	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x890069_UseSkillH( sceneId, selfId )

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x890069_BuffID_F1) == 1 then
		return 0
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x890069_BuffID_H) == 1 then
		return 0
	end

	--¸±±¾ÖĞÓĞĞ§µÄÍæ¼ÒµÄÁĞ±í....
	local PlayerList = {}

	--½«ÓĞĞ§µÄÈË¼ÓÈëÁĞ±í....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Ëæ»úÌôÑ¡Ò»¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillID_H, selfId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890069_BuffID_H, 0 )
	x890069_MsgBox( sceneId, PlayerId, "Ngß½i ğem · 10 giây sau sinh ra n± mÕnh, có th¬ tìm kiªm ğµi hæu cho ngß½i chia së thß½ng t±n!" )

	return 1

end

--**********************************
--Ê¹ÓÃJ¼¼ÄÜ....
--**********************************
function x890069_UseSkillJ( sceneId, selfId )

	--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillID_J, selfId, x, z, 0, 1 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstId = CallScriptFunction( x890069_g_FuBenScriptId, "CreateBOSS", sceneId, "WuDing_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, 10246, 0 )
	CreateSpecialObjByDataIndex(sceneId, selfId, 1023, x, z, 0)
	CallScriptFunction((200060), "Paopao",sceneId, "Ğinh xuân thu", "Thiªu th¤t s½n", "Ğinh xuân thu: Này ğó vu c± · ta bên ngß¶i s¨ cho ta tr¸ li®u, nªu các ngß½i tiªn vào, v§y ch¶ chªt ği!" )
	MonsterTalk( sceneId, -1, "", "Chú ı, thïnh nhanh chóng ğem ğinh xuân thu dçn huyªt chú vu c±  thi pháp phÕm vi, nªu không ğem b¸ huyªt chú vu c± khôi phøc nh¤t ğ¸nh  sinh m®nh giá tr¸!" )

	return 1

end


--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x890069_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x890069_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890069_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == x890069_BuffID_F1 then

		CallScriptFunction((200060), "Paopao",sceneId, "Ğinh xuân thu", "Thiªu th¤t s½n", "Ğinh xuân thu: #c2ebeff"..GetName( sceneId, selfId ).."#WNgß½i ğã b¸ lão phu thi hÕ ån mòn ğµc, cüa ngß½i b¯n phía s¨ cùng ngß½i cµng phó hoàng tuy«n!" )

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890069_BuffID_F2, 0 )
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )
				end
			end
		end

		return
	end

	--Èç¹ûÊÇ°µÀ×µÄbuff....ÔòÈÃBOSS¸ø¸½½üµÄÍæ¼Ò¼ÓÒ»¸öÉËº¦µÄbuff²¢º°»°....
	if impactId == x890069_BuffID_H then

		CallScriptFunction((200060), "Paopao",sceneId, "Ğinh xuân thu", "Thiªu th¤t s½n", "Ğinh xuân thu: Lão phu ğ± mu¯n nhìn, có ai nguy®n ı thay#c2ebeff"..GetName( sceneId, selfId ).."#WChia së thß½ng t±n!" )

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		local count = 0

		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 8*8 then
					count = count + 1
				end
			end
		end

		if count == 0 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, x890069_BuffID_F2, 0 )
		    --LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, x890069_BuffID_H2, 0 )
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )

		elseif count == 1 then
			x,z = GetWorldPos( sceneId,selfId )
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			for i=0, nHumanNum-1  do
				local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 then
					xx,zz = GetWorldPos(sceneId,PlayerId)
					if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
						LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890069_BuffID_H2, 0 )
					       LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )
					end
				end
			end
		elseif count == 2 then
			x,z = GetWorldPos( sceneId,selfId )
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			for i=0, nHumanNum-1  do
				local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 then
					xx,zz = GetWorldPos(sceneId,PlayerId)
					if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
						LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890069_BuffID_H3, 0 )
					       LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )
					end
				end
			end
		elseif count == 3 then
			x,z = GetWorldPos( sceneId,selfId )
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			for i=0, nHumanNum-1  do
				local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 then
					xx,zz = GetWorldPos(sceneId,PlayerId)
					if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
						LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890069_BuffID_H4, 0 )
					       LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )
					end
				end
			end
		elseif count == 4 then
			x,z = GetWorldPos( sceneId,selfId )
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			for i=0, nHumanNum-1  do
				local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 then
					xx,zz = GetWorldPos(sceneId,PlayerId)
					if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
						LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890069_BuffID_H5, 0 )
					       LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )
					end
				end
			end
		elseif count == 5 then
			x,z = GetWorldPos( sceneId,selfId )
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			for i=0, nHumanNum-1  do
				local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 then
					xx,zz = GetWorldPos(sceneId,PlayerId)
					if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
						LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890069_BuffID_H6, 0 )
					       LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19652, 0 )
					end
				end
			end
		end

		return

	end

end

--**********************************
--ÏûÏ¢ÌáÊ¾
--**********************************
function x890069_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end