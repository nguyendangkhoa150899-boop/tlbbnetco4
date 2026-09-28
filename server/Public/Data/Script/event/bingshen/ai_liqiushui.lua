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
x894069_g_ScriptId	= 894069

--¸±±¾Âß¼­½Å±¾ºÅ....
x894069_g_FuBenScriptId = 894063

--ÃâÒßBuff....
x894069_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894069_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--¼¼ÄÜ....
x894069_SkillID_F		= 1820  --ÆÕÍ¨¹¥»÷
x894069_SkillID_F2		= 1821
x894069_BuffID_F		= 8851

--Ê¯¶Ñ
x894069_SkillID_G		= 1822

x894069_SkillID_H		= 1823
x894069_BuffID_H		= 19741

x894069_SkillID_I		= 1036
x894069_BuffID_I1		= 10253
x894069_BuffID_I2		= 10254

x894069_SkillID_J		= 1824
x894069_BuffID_J		= 8834

x894069_SkillCD_FH	=	8000
x894069_SkillCD_G		=	45000
x894069_SkillCD_J	=	31000
x894069_SkillCD_H		=	60000
x894069_SkillCD_K	=	5000


x894069_MyName			= " Gia Lu§t Liên Thành "	--×Ô¼ºµÄÃû×Ö....

--AI Index....
x894069_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1ÐèÒª½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x894069_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x894069_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x894069_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x894069_IDX_CD_SkillJ			= 5	--G¼¼ÄÜµÄCD....
x894069_IDX_CD_SkillH			= 6	--G¼¼ÄÜµÄCD....
x894069_IDX_CD_SkillK			= 7	--G¼¼ÄÜµÄCD....

x894069_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....

--**********************************
--³õÊ¼»¯....
--**********************************
function x894069_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894069_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894069_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894069_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜÐÄÌø....
	if 1 == x894069_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜÐÄÌø....
	if 1 == x894069_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜÐÄÌø....
	if 1 == x894069_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜÐÄÌø....
	if 1 == x894069_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	--J¼¼ÄÜÐÄÌø....
	if 1 == x894069_TickSkillJ( sceneId, selfId, nTick ) then
		return
	end

	--K¼¼ÄÜÐÄÌø....
	if 1 == x894069_TickSkillK( sceneId, selfId, nTick ) then
		return
	end
end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894069_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894069_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894069_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894069_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894069_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894069_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x894069_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "LiFan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894069_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894069_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x894069_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ýÀîÇïË®....
	CallScriptFunction( x894069_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvLian", 2 )

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
		str = format(" #cff99ccTránh toát #G Gia Lu§t Liên Thành #W#cff99cct¤t bát bí kî sau #{_INFOUSR%s}#P long còn sþ hãi ng°i · mµt kh¯i nham thÕch phía trên. Hãy còn th· dài, v×a ch¸u bí kî xâm nh§p nham thÕch li«n vÞ vøn ra, chÑa nhi«u thÕch tiªt giæa có r¤t nhi«u bäo tß½ng #P lên tiªng trä l¶i r½i xu¯ng ð¤t..", playerName); --ÀîÇïË®
		AddGlobalCountNews( sceneId, str )
	end


end


--**********************************
--ÖØÖÃAI....
--**********************************
function x894069_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillFH, x894069_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillG, x894069_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillJ, x894069_SkillCD_J )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillH, x894069_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillK, x894069_SkillCD_K )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894069_IDX_CombatFlag, 0 )

	--¸øËùÓÐÍæ¼ÒÇå³ýFHµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894069_BuffID_F )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894069_BuffID_H )
		end
	end

end


--**********************************
--FH¼¼ÄÜÐÄÌø....
--**********************************
function x894069_TickSkillFH( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillFH, x894069_SkillCD_FH-(nTick-cd) )
		return x894069_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G¼¼ÄÜÐÄÌø....
--**********************************
function x894069_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.6666 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillG, x894069_SkillCD_G-(nTick-cd) )
		return x894069_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H¼¼ÄÜÐÄÌø....
--**********************************
function x894069_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.6 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillH, x894069_SkillCD_H-(nTick-cd) )
		return x894069_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--J¼¼ÄÜÐÄÌø....
--**********************************
function x894069_TickSkillJ( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.2 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillJ )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillJ, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillJ, x894069_SkillCD_J-(nTick-cd) )
		return x894069_UseSkillJ( sceneId, selfId )
	end

end

--**********************************
--K¼¼ÄÜÐÄÌø....
--**********************************
function x894069_TickSkillK( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillK )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillK, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_CD_SkillK, x894069_SkillCD_K-(nTick-cd) )
		return x894069_UseSkillK( sceneId, selfId )
	end

end
--**********************************
--I¼¼ÄÜÐÄÌø....
--**********************************
function x894069_TickSkillI( sceneId, selfId, nTick )

	--»ñµÃµ±Ç°¿ñ±©mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894069_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--Èç¹û²»ÐèÒª¿ñ±©»òÕßÒÑ¾­¿ñ±©ÁËÔò·µ»Ø....
		return 0

	elseif CurMode == 1 then

		--Èç¹ûÐèÒª¿ñ±©ÔòÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
		local ret =  x894069_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x894069_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x894069_UseSkillF( sceneId, selfId )

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

	--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894069_SkillID_F, PlayerId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x894069_BuffID_F, 0 )

	--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894069_SkillID_F2, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x894069_UseSkillG( sceneId, selfId )

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894069_SkillID_G, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Liên Thành ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Liên Thành Kim giáp phi thân, b¤t ðµng nhß núi, này núi ðá tinh khí ðä thß½ng ngß¶i, cûng khä b¸ ta s· døng, trong ðó lþi hÕi, ngß½i ch¶ mµt lát s¨ biªt " )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Núi ðá xªp s¡p hi®n thân, nªu không th¬ · 30 giây nµi tiêu di®t h¡n, ðªn lúc ðó chÆng nhæng h¡n mÕnh mà còn h°i phøc th¬ lñc.." )

	local MstIdA = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSA", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, MstIdA, MstIdA, 8857, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdA, 30000 )

	local MstIdB = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSB", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdB, MstIdB, MstIdB, 8857, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdB, 30000 )

	local MstIdC = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSC", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdC, MstIdC, MstIdC, 8857, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdC, 30000 )

	local MstIdD = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSD", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdD, MstIdD, MstIdD, 8857, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdD, 30000 )

	local MstIdE = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSE", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdE, MstIdE, MstIdE, 8858, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdE, 30000 )

	local MstIdF = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSF", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdF, MstIdF, MstIdF, 8858, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdF, 30000 )

	local MstIdG = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSG", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdG, MstIdG, MstIdG, 8858, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdG, 30000 )

	local MstIdH = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "ShiDui_BOSSH", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdH, MstIdH, MstIdH, 8858, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8859, 0 )
	SetCharacterDieTime( sceneId, MstIdH, 30000 )

       --×Ô¼ºÒþÉí
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8852, 0 )

	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x894069_UseSkillH( sceneId, selfId )

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894069_SkillID_H, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Liên Thành ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Liên Thành  Dãy núi non trùng ði®p, phong hóa ngàn vÕn, ngß½i ch¶ ta thân hãm ta tam thân vòng vây, táng thân nhß thª kªt thành kªt cøc ðã ð¸nh" )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:   Gia Lu§t Liên Thành thiªt c¯t chï có th¬ dùng nµi công cß¶ng t§p Gia Lu§t Liên Thành nguyên th¥n cûng b¸ ch¸u ngoÕi công gây thß½ng tích" )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Ta ðã cho trong tr§n ám phóng hai n½i cÕm bçy, phân bi®t khä tång thêm Gia Lu§t Liên Thành thiªt c¯t trùng Gia Lu§t Liên Thành nguyên th¥n s· ch¸u ngoÕi công cùng nµi công thß½ng t±n" )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Nªu 60 giây có th¬ ðánh chªt phân thân có th¬ làm Gia Lu§t Liên Thành nguyên khí ðÕi thß½ng, t±n thß½ng trên di®n rµng tång lên" )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdI = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "TieGu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdI, MstIdI, MstIdI, 8857, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdJ = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "YuanShen_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdJ, MstIdJ, MstIdJ, 8858, 0 )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8853, 0 )

	local MstIdK = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "TieFuZhen_BOSS", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdK, MstIdK, MstIdK, 8866, 0 )
	SetCharacterDieTime( sceneId, MstIdK, 60000 )

	local MstIdL = CallScriptFunction( x894069_g_FuBenScriptId, "CreateBOSS", sceneId, "YuanFuZhen_BOSS", -1, -1 )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdL, MstIdL, MstIdL, 8867, 0 )
	SetCharacterDieTime( sceneId, MstIdL, 60000 )

	return 1

end

--**********************************
--Ê¹ÓÃJ¼¼ÄÜ....
--**********************************
function x894069_UseSkillJ( sceneId, selfId )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Liên Thành ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Liên Thành Dãy núi non trùng ði®p, ngß½i ch¾ khinh ngß¶i quá ðáng ta s¨ cho ngß½i biªt" )
	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  30 giây không th¬ ðánh chªt Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )

	--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894069_SkillID_J, selfId, x, z, 0, 1 )

	CallScriptFunction( x894069_g_FuBenScriptId, "OpenBQZTimer", sceneId, 30, x894069_g_ScriptId, -1 ,-1 )

	return 1


end

--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x894069_UseSkillK( sceneId, selfId )

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 15085 or MosDataID == 15100 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8853, 0 )
		end
	end

	return 1

end

--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x894069_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894069_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894069_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894069_SkillID_I, selfId, x, z, 0, 1 )

	CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId,  "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x894069_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894069_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == 8859 then

		local x,z = GetWorldPos( sceneId,selfId )
		CreateSpecialObjByDataIndex(sceneId, bossId, 192, x, z, 0)

		local bok = 0
		local nMonsterNum = GetMonsterCount( sceneId )
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId, i)
			if GetName(sceneId, MonsterId) == "Ê¯¶Ñ" and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
		          bok = 1
			end
		end

	       if bok == 1 then
			local nMonsterNum = GetMonsterCount( sceneId )
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId, i)
				if GetName(sceneId, MonsterId) == " Gia Lu§t Liên Thành " and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
				 	 LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 8861, 0)
				end
			end
		end

		return
	end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x894069_OnBQZTimer( sceneId, step, data1, data2 )
	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == " Gia Lu§t Liên Thành " then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end
	if 30 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 30 giây không th¬ ðánh chªt Gia Lu§t Liên Thành ðánh chªt, mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 20 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 20 giây không th¬ giªt Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 15 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân  Thôn thiên thÕch ðã thành tr§n quá bán, tái sinh ngû tòa tháp ðem m®nh quy tiên 15 giây không th¬ giªt Gia Lu§t Liên Thành ðánh chªt, mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 10 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 10 giây không th¬ giªt Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 6 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 6 giây nµi có th¬ ðem Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 5 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 5 giây nµi có th¬ ðem Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 4 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 4 giây nµi có th¬ ðem Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 3 == step then
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 3 giây nµi có th¬ ðem Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x894069_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân 2 giây không th¬ giªt Gia Lu§t Liên Thành thì mß¶i tòa thiên thÕch li«n ðem ngay thành tr§n pháp r¤t mÕnh khó mà Ñng phó" )
		return
	end

	if 1 == step then
		CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Liên Thành ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Liên Thành  C¡n nu¯t thiên ð¸a, vÕn v§t tînh tÑc, ngß½i ch¾ cu°ng ð°, mµng ß·ng.." )
		--ÉËº¦....
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, 8834, 0 )
			end
		end
		return
	end

end
