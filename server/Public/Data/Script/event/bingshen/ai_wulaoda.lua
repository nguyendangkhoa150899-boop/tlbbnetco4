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
x894066_g_ScriptId	= 894066

--¸±±¾Âß¼­½Å±¾ºÅ....
x894066_g_FuBenScriptId = 894063

--ÃâÒßBuff....
x894066_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894066_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--¼¼ÄÜ....
x894066_SkillID_F		= 1809
x894066_SkillID_F2		= 1810
x894066_BuffID_F1		= 8833

x894066_SkillID_G		= 1811
x894066_SkillID_G_SpecObj		= 188

x894066_SkillID_H		= 1813
x894066_SkillD_SpecObj = 190

x894066_SkillID_I		= 1814

x894066_SkillID_J		= 1817
x894066_SkillID_J2		= 1818
x894066_BuffID_J2		= 8835

x894066_SkillCD_FH	=	6000
x894066_SkillCD_G		=	45000
x894066_SkillCD_H	=	25000
x894066_SkillCD_I	=	50000
x894066_SkillCD_J	=	30000

x894066_MyName			= " Gia Lu§t Di­m "	--×Ô¼ºµÄÃû×Ö....

--AI Index....
x894066_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1ÐèÒª½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x894066_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x894066_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x894066_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x894066_IDX_CD_SkillI			= 5	--G¼¼ÄÜµÄCD....
x894066_IDX_CD_SkillJ			= 6	--G¼¼ÄÜµÄCD....
x894066_IDX_CD_SkillH			= 7	--H¼¼ÄÜµÄCD....
x894066_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....

--**********************************
--³õÊ¼»¯....
--**********************************
function x894066_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894066_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894066_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894066_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜÐÄÌø....
	if 1 == x894066_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜÐÄÌø....
	if 1 == x894066_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜÐÄÌø....
	if 1 == x894066_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜÐÄÌø....
	if 1 == x894066_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜÐÄÌø....
	if 1 == x894066_TickSkillJ( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894066_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894066_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894066_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894066_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894066_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x894066_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x894066_g_FuBenScriptId, "CreateBOSS", sceneId, "YeLvYan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894066_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x894066_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--¿ªÆôÎÚÀÏ´óËÀÍöµÄ¼ÆÊ±Æ÷....
	--local x,z = GetWorldPos( sceneId, selfId )
	--CallScriptFunction( x894066_g_FuBenScriptId, "OpenYeLvYanDieTimer", sceneId, 4, x894066_g_ScriptId, x, z )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ýÎÚÀÏ´ó....
	CallScriptFunction( x894066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvYan", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýË«×ÓÔò¿ÉÒÔÌôÕ½Ë«×Ó....
	if 2 ~= CallScriptFunction( x894066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "YeLvLian" )	then
		CallScriptFunction( x894066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvLian", 1 )
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
	end
	
	if playerName ~= nil then
		str = format("  #cff99ccD§p t¡t quanh thân ð¯t höa sau,#{_INFOUSR%s}#Pbao vây bên trong tìm kiªm thu¯c tr¸ thß½ng: Tuy nói này, #cFF0000 Gia Lu§t Di­m #W#cff99cclà cái Liêu qu¯c næ tØ, nhßng võ công chiêu s¯ th§t ðúng là không ít, xâm lßþc nhß höa, ð¸a höa Ph¥n Thiên, có mµt không hai tài bäo #p...... Ðây là cái gì chiêu s¯? ThÑ này khi nào thì chÕy ðªn ta trong bao ?!", playerName); --ÎÚÀÏTheo 
		AddGlobalCountNews( sceneId, str )
	end


end


--**********************************
--ÖØÖÃAI....
--**********************************
function x894066_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillFH, x894066_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillG, x894066_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillH, x894066_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillI, x894066_SkillCD_I )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillJ, x894066_SkillCD_J )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894066_IDX_CombatFlag, 0 )

	--¸øËùÓÐÍæ¼ÒÇå³ýFHµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x894066_BuffID_F1 )
		--	LuaFnCancelSpecificImpact( sceneId, nHumanId, x894066_BuffID_H )
		end
	end

	--±éÀú³¡¾°ÀïËùÓÐµÄ¹Ö....Ñ°ÕÒÐÖµÜ²¢½«ÆäÉ¾³ý....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if "µØ¸®Å£Ñý" == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

end


--**********************************
--FH¼¼ÄÜÐÄÌø....
--**********************************
function x894066_TickSkillFH( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillFH, x894066_SkillCD_FH-(nTick-cd) )
		return x894066_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G¼¼ÄÜÐÄÌø....
--**********************************
function x894066_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillG, x894066_SkillCD_G-(nTick-cd) )
		return x894066_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H¼¼ÄÜÐÄÌø....
--**********************************
function x894066_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.6333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillH, x894066_SkillCD_H-(nTick-cd) )
		return x894066_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜÐÄÌø....
--**********************************
function x894066_TickSkillI( sceneId, selfId, nTick )
	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.5333 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillI )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillI, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillI, x894066_SkillCD_I-(nTick-cd) )
		return x894066_UseSkillI( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜÐÄÌø....
--**********************************
function x894066_TickSkillJ( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillJ )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillJ, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894066_IDX_CD_SkillJ, x894066_SkillCD_J-(nTick-cd) )
		return x894066_UseSkillJ( sceneId, selfId )
	end

end

--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x894066_UseSkillF( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_F, PlayerId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x894066_BuffID_F1, 0 )
	LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_F2, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x894066_UseSkillG( sceneId, selfId )


	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Xâm lßþc nhß thiên höa lßu yên, vÕn v§t nan ch¡n, thä xem ta ð¯t tçn thª gian hªt thäy." )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p!" )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_G, selfId, x, z, 0, 1 )
	CreateSpecialObjByDataIndex(sceneId, selfId, 189, 200, 184, 0)
	CallScriptFunction( x894066_g_FuBenScriptId, "OpenBQZTimer", sceneId, 15, x894066_g_ScriptId, -1 ,-1 )

	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x894066_UseSkillH( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_H, selfId, x, z, 0, 1 )

		CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Ð¸a höa Ph¥n Thiên chß¾c , nhìn ngß½i phàm nhân chi khu nhß thª nào có th¬ ngån." )
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Ð¸a höa Ph¥n Thiên t× Gia Lu§t Di­m dß¾i chân mà sinh, chß v¸ anh hùng còn thïnh nhi«u h½n lßu ý, ð¬ tránh làm tÑc gi§n trên thân!" )

		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			local  	x,z = GetWorldPos( sceneId, nHumanId )
				CreateSpecialObjByDataIndex(sceneId, selfId, x894066_SkillD_SpecObj, x, z, 0)
			end
		end

	return 1

end


--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x894066_UseSkillI( sceneId, selfId )

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

	--¶Ô×Ô¼ºÊ¹ÓÃÒ»¸ö¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_I, selfId, x, z, 0, 1 )

         local	x,z = GetWorldPos( sceneId,selfId )
	local MstIdA = CallScriptFunction( x894066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, PlayerIdA, MstIdA, 8843, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdC = CallScriptFunction( x894066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdC, PlayerIdA, MstIdC, 8843, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdB = CallScriptFunction( x894066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdB, PlayerIdB, MstIdB, 8843, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdD = CallScriptFunction( x894066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdD, PlayerIdB, MstIdD, 8843, 0 )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Höa ngßu sát tr§n, xúc ð¸ch m®nh tang,#c2ebeff"..GetName( sceneId, PlayerIdA )..","..GetName( sceneId, PlayerIdB ).."#Wngß½i ch¶ ðã b¸ höa ngßu trành thßþng, không lâu li«n ðem h°n v« cØu tuy«n..." )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Höa ngßu ðã xu¤t, các v¸ anh hùng thïnh không c¥n t¾i g¥n höa ngßu, các v¸ t¯c t¯c hþp lñc ðem ð«u ðánh chªt!" )

	return 1

end

--**********************************
--Ê¹ÓÃJ¼¼ÄÜ....
--**********************************
function x894066_UseSkillJ( sceneId, selfId )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m : ÐÕi Liêu viêm dß½ng, thÑ Phá Thiên hÕ, thß½ng sinh chi møc, giai ðem mù." )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Chß v¸ ðã b¸ höa di®u hai m¡t ðoÕt ði nhãn lñc, tÕm th¶i chï  ch¸u ðßþc mù làm phÑc tÕp." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
		         local	x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_J, nHumanId, x, z, 0, 1 )
		end
	end

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x894066_SkillID_J2, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Bát mÕch thông huy«n, phi höa lßu tinh, thiên höa hàng thª, sát phÕt chúng sinh, xem nhæ nhß thª nào chÕy tr¯n!" )
	CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Phi höa lßu tinh s¡p sØa hàng thª, thïnh các v¸ anh hùng t¯c t¯c tø t§p, cµng ð°ng gánh vác lßu tinh phi höa s· nhiên thß½ng t±n." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x894066_BuffID_J2, 0 )
		end
	end

	return 1

end

--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x894066_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894066_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇ°µÀ×µÄbuff....ÔòÈÃBOSS¸ø¸½½üµÄÍæ¼Ò¼ÓÒ»¸öÉËº¦µÄbuff²¢º°»°....
	if impactId == x894066_BuffID_J2 then

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
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 10*10 then
					count = count + 1
				end
			end
		end

		if count == 0 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8834, 0 )
		elseif count == 1 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8792, 0 )
		elseif count == 2 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8793, 0 )
		elseif count == 3 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8794, 0 )
		elseif count == 4 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8795, 0 )
		elseif count == 5 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8796, 0 )
		elseif count == 6 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8797, 0 )
		elseif count == 7 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8798, 0 )
		elseif count == 8 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8799, 0 )
		elseif count == 9 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8800, 0 )
		elseif count == 10 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8801, 0 )
		elseif count == 11 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8802, 0 )
		end

		return

	end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x894066_OnBQZTimer( sceneId, step, data1, data2 )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == " Gia Lu§t Di­m " then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	if 15 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "15 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 13 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "13 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 10 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "10 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 7 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "7 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 6 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "6 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 5 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "5 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 4 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "4 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 3 == step then
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "3 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x894066_g_FuBenScriptId, "TipAllHuman", sceneId, "2 Giây sau b¡t ð¥u trong tr§n höa lñc b¡t ð¥u kh·i ðµng, chß v¸ khüng tao ð¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ð¬ tránh xâm lßþc höa t§p." )
		return
	end

	if 1 == step then
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

