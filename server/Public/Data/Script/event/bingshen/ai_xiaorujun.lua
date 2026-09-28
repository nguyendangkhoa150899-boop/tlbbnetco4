--Æ®Ãì·å ²»Æ½µÀÈËAI   

--F	¡¾°µÀ×¡¿¶Ô×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....ÔÙ¸øÍæ¼Ò¼Ó¸ö½áÊøºó»á»Øµ÷½Å±¾µÄbuff....»Øµ÷Ê±ÈÃBOSS¸øÆäÖÜÎ§ÈË¼ÓÉËº®buff²¢º°»°....
--G ¡¾¾«Ëã¡¿¸ø×Ô¼ºÓÃÒ»¸ö¼ÓbuffµÄ¼¼ÄÜ....
--H ¡¾ÑÌ»¨¡¿¶Ô×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....ÔÙ¸øÍæ¼Ò¼Ó¸ö½áÊøºó»á»Øµ÷½Å±¾µÄbuff....»Øµ÷Ê±º°»°....
--I	¡¾ÅóÓÑ¡¿×¿²»·²ËÀÊ±¸ø×Ô¼ºÓÃÒ»¸ö¼ÓbuffµÄ¼¼ÄÜ....


--È«³Ì¶¼´øÓÐÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--Ã¿¸ô30Ãë¶ÔËæ»úÍæ¼ÒËæ»úÊ¹ÓÃFH....
--Ã¿¸ô45Ãë¶Ô×Ô¼ºÊ¹ÓÃG....
--ËÀÍö»òÍÑÀëÕ½¶·Ê±¸øËùÓÐÍæ¼ÒÇå³ýFHµÄbuff....
--ËÀÍöÊ±Ñ°ÕÒ²»Æ½µÀÈË....ÉèÖÃÆäÐèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
--ËÀÍöÊ±·¢ÏÖ²»Æ½µÀÈËÒÑ¾­ËÀÁË....Ôò´´½¨ÁíÒ»¸öBOSS....


--½Å±¾ºÅ
x894065_g_ScriptId	= 894065

--¸±±¾Âß¼­½Å±¾ºÅ....
x894065_g_FuBenScriptId = 894063

--ÃâÒßBuff....
x894065_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894065_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--¼¼ÄÜ....
x894065_SkillID_F		= 1805
x894065_BuffID_F1		= 8816

x894065_SkillID_G		= 1806
x894065_SkillID_G_SpecObj		= 188

x894065_SkillID_H		= 1807
x894065_BuffID_H		= 19629

x894065_SkillID_I		= 1804

x894065_SkillCD_FH	=	10000
x894065_SkillCD_G		=	12000
x894065_SkillCD_H	=	12000
x894065_SkillCD_I	=	5000


x894065_MyName			= "Tiêu Nhß Quân "	--×Ô¼ºµÄÃû×Ö....
x894065_BrotherName = "Tiêu Nhß Úy "	--ÐÖµÜµÄÃû×Ö....

--AI Index....
x894065_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1ÐèÒª½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x894065_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x894065_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x894065_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x894065_IDX_CD_SkillI			= 5	--G¼¼ÄÜµÄCD....
x894065_IDX_CD_SkillH			= 6	--H¼¼ÄÜµÄCD....

x894065_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....


--**********************************
--³õÊ¼»¯....
--**********************************
function x894065_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894065_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894065_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894065_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜÐÄÌø....
	if 1 == x894065_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜÐÄÌø....
	if 1 == x894065_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜÐÄÌø....
	if 1 == x894065_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜÐÄÌø....
	if 1 == x894065_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 15040 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8821, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8822, 0 )
		elseif MosDataID == 15060 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8829, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8830, 0 )
		elseif MosDataID == 15050 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8825, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8826, 0 )
		elseif MosDataID == 15065 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8831, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8832, 0 )
		elseif MosDataID == 15055 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8827, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8828, 0 )
		elseif MosDataID == 15045 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8823, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8824, 0 )
		end
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894065_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894065_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894065_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894065_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894065_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894065_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x894065_ResetMyAI( sceneId, selfId )

	--±éÀú³¡¾°ÀïËùÓÐµÄ¹Ö....Ñ°ÕÒÐÖµÜ²¢½«ÆäÉ¾³ý....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894065_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )
	CallScriptFunction( x894065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PlayHp", 0 )

	--´´½¨¶Ô»°NPC....
	local MstIdA = CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoRuJun_NPC", -1, -1 )
	local MstIdB = CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoRuWei_NPC", -1, -1 )

	SetUnitReputationID( sceneId, MstIdA, MstIdA, 0 )
	SetUnitReputationID( sceneId, MstIdB, MstIdB, 0 )

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 15040 or MosDataID == 15045 or MosDataID == 15050 or MosDataID == 15055 or MosDataID == 15060 or MosDataID == 15065
		   MosDataID == 15140 or MosDataID == 15145 or MosDataID == 15150 or MosDataID == 15155 or MosDataID == 15160 or MosDataID == 15165 then
			LuaFnDeleteMonster( sceneId, nObjId )
		end
	end

end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894065_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894065_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x894065_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ýÉ£ÍÁ¹«....
	CallScriptFunction( x894065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "XiaoRuJun", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýÎÚÀÏ´óÔò¿ÉÒÔÌôÕ½ÎÚÀÏ´ó....
	if 1 ~= CallScriptFunction( x894065_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "YeLvYan" )	then
		CallScriptFunction( x894065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvYan", 1 )
	end
	
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
	       LuaFnSendSpecificImpactToUnit( sceneId, leaderID, leaderID, leaderID, 8812, 0 )
	end
	
	if playerName ~= nil then
		str = format(" #cff99ccSan b¢ng lâm tr§n sau, #{_INFOUSR%s}#P ðang mu¯n xoay ngß¶i r¶i ði, lÕi phát hi®n ch¸u #cff0000 Tiêu Nhß Quân #W#cff99cc tan tác s· ð±  r×ng trúc trung nhßng lÕi có d¤u tuy®t thª bäo v§t #p, vì thª li«n vui vë ðem thu vào trong túi, thúc ngña thÆng ðªn höa tr§n mà ði.", playerName); --É£ÍÁ¹«
		AddGlobalCountNews( sceneId, str )
	end

	CallScriptFunction( x894065_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Tuy nói Tiêu Nhß Quân  ðã bÕi cho trß¾c tr§n, nhßng còn thïnh nhanh chóng ðánh chªt  Tiêu Nhß Úy nªu không  Tiêu Nhß Quân  30 giây sau s¨ s¯ng lÕi. ." )

end


--**********************************
--ÖØÖÃAI....
--**********************************
function x894065_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillFH, x894065_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillG, x894065_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillH, x894065_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillI, x894065_SkillCD_I )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894065_IDX_CombatFlag, 0 )

	--¸øËùÓÐÍæ¼ÒÇå³ýFHµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894065_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894065_BuffID_H )
		end
	end

end


--**********************************
--FH¼¼ÄÜÐÄÌø....
--**********************************
function x894065_TickSkillFH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8555 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillFH, x894065_SkillCD_FH-(nTick-cd) )
		return x894065_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G¼¼ÄÜÐÄÌø....
--**********************************
function x894065_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillG, x894065_SkillCD_G-(nTick-cd) )
		return x894065_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H¼¼ÄÜÐÄÌø....
--**********************************
function x894065_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillH, x894065_SkillCD_H-(nTick-cd) )
		return x894065_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜÐÄÌø....
--**********************************
function x894065_TickSkillI( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillI )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillI, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894065_IDX_CD_SkillI, x894065_SkillCD_I-(nTick-cd) )
		return x894065_UseSkillI( sceneId, selfId )
	end

end


--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x894065_UseSkillF( sceneId, selfId )

	--¸±±¾ÖÐÓÐÐ§µÄÍæ¼ÒµÄÁÐ±í....
	local PlayerList = {}

	--½«ÓÐÐ§µÄÈË¼ÓÈëÁÐ±í....
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
	LuaFnUnitUseSkill( sceneId, selfId, x894065_SkillID_F, PlayerId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Tiêu Nhß Quân ", "Binh Thánh KÏ Tr§n", "Tiêu Nhß Quân : B¸ lÕc cho lâm,, "..GetName( sceneId, PlayerId ).." Nhìn ngß½i nhß thª nào thoát thân." )
	CallScriptFunction( x894065_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Tiêu Nhß Quân   ðã phóng ra vây kh¯n chi kî, thân trung lâm dã mê tung trÕng thái ngß¶i t¯c t¯c r¶i xa ðám ngß¶i, ð¬ tránh ngß¶i khác ðang mê say núi r×ng.!" )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x894065_BuffID_F1, 0 )

	return 1

end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x894065_UseSkillG( sceneId, selfId )


	--¸±±¾ÖÐÓÐÐ§µÄÍæ¼ÒµÄÁÐ±í....
	local PlayerList = {}

	--½«ÓÐÐ§µÄÈË¼ÓÈëÁÐ±í....
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

	local PlayerIdA = PlayerList[ random(numPlayer) ]
	local PlayerIdB = PlayerList[ random(numPlayer) ]

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894065_SkillID_G, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Tiêu Nhß Quân ", "Binh Thánh KÏ Tr§n", "Tiêu Nhß Quân : Núi r×ng bích thúy, cänh ð©p di nhân,#c2ebeff"..GetName( sceneId, PlayerIdA ).."¡¢"..GetName( sceneId, PlayerIdB )..",#Wvài v¸ sao không mê say cho này lâm dã bên trong." )
	CallScriptFunction( x894065_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Tiêu Nhß Quân   phóng ra  thÑ trúc cÕm bçy sinh cho dß¾i chân, còn thïnh chß v¸ t¯c t¯c tránh né." )

	local x,z = GetWorldPos( sceneId, PlayerIdA )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894065_SkillID_G_SpecObj, x, z, 0)

	local x,z = GetWorldPos( sceneId, PlayerIdB )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894065_SkillID_G_SpecObj, x, z, 0)

	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x894065_UseSkillH( sceneId, selfId )

		local Last = CallScriptFunction( x894065_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PlayHp" )
		if Last > 1 then
			return 0
		end

		CallScriptFunction( x894065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PlayHp", 2 )

	       --Ê¹ÓÃ¿Õ¼¼ÄÜ....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x894065_SkillID_H, selfId, x, z, 0, 1 )

		CallScriptFunction((200060), "Paopao",sceneId, "Tiêu Nhß Quân ", "Binh Thánh KÏ Tr§n", "Tiêu Nhß Quân Ð°ng tâm løc trúc, ðón gió mà ðÑng, ngñ ta thân hình, cho ta hµ th¬, nghï ng½i l¤y lÕi sÑc, ra sÑc giªt ð¸ch." )
		CallScriptFunction( x894065_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Tiêu Nhß Quân  : Ð°ng tâm løc trúc, ðón gió mà ðÑng, ngñ ta thân hình, cho ta hµ th¬, nghï ng½i l¤y lÕi sÑc, ra sÑc giªt ð¸ch." )

		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuBai_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuHong_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuHuang_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuLan_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuLv_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuZi_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "Bai_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "Hong_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "Huang_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "Lan_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "Lv_BOSS", -1, -1 )
		CallScriptFunction( x894065_g_FuBenScriptId, "CreateBOSS", sceneId, "Zi_BOSS", -1, -1 )

	return 1

end


--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x894065_UseSkillI( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894065_SkillID_I, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x894065_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local MonsterId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == "Tiêu Nhß Quân " then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == 8813 then

		local bok = 0
		local MosDataID = 0
		local nCount = GetMonsterCount(sceneId)
		for i=0, nCount-1  do
			local nObjId = GetMonsterObjID(sceneId, i)
			local MosDataID = GetMonsterDataID( sceneId, nObjId )
			if MosDataID == 15130 then
				bok = 1
			end
		end

		if bok == 0 then
			return
		end

		if bok == 1 then

			local MonsterId = CallScriptFunction( x894067_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoRuWei_BOSS", -1, -1 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 8814, 0 )

			CallScriptFunction( x894067_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Huynh ð® ð°ng tâm, này lñc ð°ng tâm......B·i vì chßa 30 giây có th¬ tiêu di®t Tiêu Nhß Quân  hi®n ðã s¯ng lÕi......." )

			return
		end

		return
	end

	--Èç¹ûÊÇ°µÀ×µÄbuff....ÔòÈÃBOSS¸ø¸½½üµÄÍæ¼Ò¼ÓÒ»¸öÉËº¦µÄbuff²¢º°»°....

	if impactId == x894065_BuffID_F1 then

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 12*12 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, 8818, 0 )
				end
			end
		end

		return

	end


end
