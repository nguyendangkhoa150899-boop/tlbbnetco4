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
x895066_g_ScriptId	= 895066

--¸±±¾Âß¼­½Å±¾ºÅ....
x895066_g_FuBenScriptId = 895063

--ÃâÒßBuff....
x895066_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x895066_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--¼¼ÄÜ....
x895066_SkillID_F		= 1809
x895066_SkillID_F2		= 1810
x895066_BuffID_F1		= 19433

x895066_SkillID_G		= 1811
x895066_SkillID_G_SpecObj		= 188

x895066_SkillID_H		= 1813
x895066_SkillD_SpecObj = 190

x895066_SkillID_I		= 1814

x895066_SkillID_J		= 1817
x895066_SkillID_J2		= 1818
x895066_BuffID_J2		= 19435

x895066_SkillCD_FH	=	6000
x895066_SkillCD_G		=	45000
x895066_SkillCD_H	=	25000
x895066_SkillCD_I	=	50000
x895066_SkillCD_J	=	30000

x895066_MyName			= " Gia Lu§t Di­m "	--×Ô¼ºµÄÃû×Ö....

--AI Index....
x895066_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1ĞèÒª½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x895066_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x895066_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x895066_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x895066_IDX_CD_SkillI			= 5	--G¼¼ÄÜµÄCD....
x895066_IDX_CD_SkillJ			= 6	--G¼¼ÄÜµÄCD....

x895066_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....

x895066_LootItem_1 = {
20310184,
}
--huyet ngoc, tinh ngoc, long ngoc, huyen, bang, hoa,doc
x895066_LootItem_2 = {
20310184,
}
x895066_LootItem_3 = {
20500005,20501005,20502005,20500006,20501006,20502006,20310184,
}
x895066_LootItem_4 = {
50521005,50521006,50521007,50521008,20310184,
}
--**********************************
--³õÊ¼»¯....
--**********************************
function x895066_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x895066_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x895066_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x895066_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜĞÄÌø....
	if 1 == x895066_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜĞÄÌø....
	if 1 == x895066_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜĞÄÌø....
	if 1 == x895066_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜĞÄÌø....
	if 1 == x895066_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜĞÄÌø....
	if 1 == x895066_TickSkillJ( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x895066_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895066_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x895066_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895066_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x895066_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x895066_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "YeLvYan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x895066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x895066_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)

	--ÖØÖÃAI....
	x895066_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--¿ªÆôÎÚÀÏTheo ËÀÍöµÄ¼ÆÊ±Æ÷....
	--local x,z = GetWorldPos( sceneId, selfId )
	--CallScriptFunction( x895066_g_FuBenScriptId, "OpenYeLvYanDieTimer", sceneId, 4, x895066_g_ScriptId, x, z )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ıÎÚÀÏTheo ....
	CallScriptFunction( x895066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvYan", 2 )

	--Èç¹û»¹Ã»ÓĞÌôÕ½¹ıË«×ÓÔò¿ÉÒÔÌôÕ½Ë«×Ó....
	if 2 ~= CallScriptFunction( x895066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "YeLvLian" )	then
		CallScriptFunction( x895066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "YeLvLian", 1 )
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
		--str = format("  #cff99ccD§p t¡t quanh thân ğ¯t höa sau,#{_INFOUSR%s}#Pbao vây bên trong tìm kiªm thu¯c tr¸ thß½ng: Tuy nói này, #cFF0000 Gia Lu§t Di­m #W#cff99cclà cái Liêu qu¯c næ tØ, nhßng võ công chiêu s¯ th§t ğúng là không ít, xâm lßşc nhß höa, ğ¸a höa Ph¥n Thiên, có mµt không hai tài bäo #p...... Ğây là cái gì chiêu s¯? ThÑ này khi nào thì chÕy ğªn ta trong bao ?!", playerName); --ÎÚÀÏTheo 
		AddGlobalCountNews( sceneId, str )
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	for i = 0, num - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and LuaFnIsCharacterLiving( sceneId, mems[i] ) == 1 then					-- ²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷

			rand = random(1)
			if rand < 1 then
			 local WuPin = random( getn(x895066_LootItem_1) )
			AddMonsterDropItem( sceneId, selfId, mems[i], x895066_LootItem_1[WuPin] )
			end
			
			rand = random(1)
			if rand < 1 then
				local WuPin = random( getn(x895066_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x895066_LootItem_2[WuPin]  )
			end
			rand = random(1)
			if rand < 1 then
				local WuPin = random( getn(x895066_LootItem_3) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x895066_LootItem_3[WuPin]  )
			end
			rand = random(1)
			if rand < 1 then
				local WuPin = random( getn(x895066_LootItem_4) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x895066_LootItem_4[WuPin]  )
			end
		end
	end

end


--**********************************
--ÖØÖÃAI....
--**********************************
function x895066_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH, x895066_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG, x895066_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH, x895066_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI, x895066_SkillCD_I )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ, x895066_SkillCD_J )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895066_IDX_CombatFlag, 0 )

	--¸øËùÓĞÍæ¼ÒÇå³ıFHµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895066_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x895066_BuffID_H )
		end
	end

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ²¢½«ÆäÉ¾³ı....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if "µØ¸®Å£Ñı" == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

end


--**********************************
--FH¼¼ÄÜĞÄÌø....
--**********************************
function x895066_TickSkillFH( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillFH, x895066_SkillCD_FH-(nTick-cd) )
		return x895066_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G¼¼ÄÜĞÄÌø....
--**********************************
function x895066_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillG, x895066_SkillCD_G-(nTick-cd) )
		return x895066_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H¼¼ÄÜĞÄÌø....
--**********************************
function x895066_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.6333 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillH, x895066_SkillCD_H-(nTick-cd) )
		return x895066_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜĞÄÌø....
--**********************************
function x895066_TickSkillI( sceneId, selfId, nTick )
	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.5333 then
		return 0
	end
	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillI, x895066_SkillCD_I-(nTick-cd) )
		return x895066_UseSkillI( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜĞÄÌø....
--**********************************
function x895066_TickSkillJ( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895066_IDX_CD_SkillJ, x895066_SkillCD_J-(nTick-cd) )
		return x895066_UseSkillJ( sceneId, selfId )
	end

end

--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x895066_UseSkillF( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_F, PlayerId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x895066_BuffID_F1, 0 )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_F2, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x895066_UseSkillG( sceneId, selfId )


	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Xâm lßşc nhß thiên höa lßu yên, vÕn v§t nan ch¡n, thä xem ta ğ¯t tçn thª gian hªt thäy." )
	CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p!" )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_G, selfId, x, z, 0, 1 )
	CreateSpecialObjByDataIndex(sceneId, selfId, 189, 200, 184, 0)
	CallScriptFunction( x895066_g_FuBenScriptId, "OpenBQZTimer", sceneId, 15, x895066_g_ScriptId, -1 ,-1 )

	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x895066_UseSkillH( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_H, selfId, x, z, 0, 1 )

		CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Ğ¸a höa Ph¥n Thiên chß¾c , nhìn ngß½i phàm nhân chi khu nhß thª nào có th¬ ngån." )
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Ğ¸a höa Ph¥n Thiên t× Gia Lu§t Di­m dß¾i chân mà sinh, chß v¸ anh hùng còn thïnh nhi«u h½n lßu ı, ğ¬ tránh làm tÑc gi§n trên thân!" )

		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				x,z = GetWorldPos( sceneId, nHumanId )
				CreateSpecialObjByDataIndex(sceneId, selfId, x895066_SkillD_SpecObj, x, z, 0)
			end
		end

	return 1

end


--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x895066_UseSkillI( sceneId, selfId )

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
	local PlayerIdA = PlayerList[ random(numPlayer) ]
	local PlayerIdB = PlayerList[ random(numPlayer) ]

	--¶Ô×Ô¼ºÊ¹ÓÃÒ»¸ö¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_I, selfId, x, z, 0, 1 )

	x,z = GetWorldPos( sceneId,selfId )
	local MstIdA = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, PlayerIdA, MstIdA, 19443, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdC = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdC, PlayerIdA, MstIdC, 19443, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdB = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdB, PlayerIdB, MstIdB, 19443, 0 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstIdD = CallScriptFunction( x895066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuoNiu_BOSS", x, z )
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdD, PlayerIdB, MstIdD, 19443, 0 )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Höa ngßu sát tr§n, xúc ğ¸ch m®nh tang,#c2ebeff"..GetName( sceneId, PlayerIdA )..","..GetName( sceneId, PlayerIdB ).."#Wngß½i ch¶ ğã b¸ höa ngßu trành thßşng, không lâu li«n ğem h°n v« cØu tuy«n..." )
	CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Höa ngßu ğã xu¤t, các v¸ anh hùng thïnh không c¥n t¾i g¥n höa ngßu, các v¸ t¯c t¯c hşp lñc ğem ğ«u ğánh chªt!" )

	return 1

end

--**********************************
--Ê¹ÓÃJ¼¼ÄÜ....
--**********************************
function x895066_UseSkillJ( sceneId, selfId )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m : ĞÕi Liêu viêm dß½ng, thÑ Phá Thiên hÕ, thß½ng sinh chi møc, giai ğem mù." )
	CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Chß v¸ ğã b¸ höa di®u hai m¡t ğoÕt ği nhãn lñc, tÕm th¶i chï  ch¸u ğßşc mù làm phÑc tÕp." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_J, nHumanId, x, z, 0, 1 )
		end
	end

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x895066_SkillID_J2, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Di­m ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Di­m Bát mÕch thông huy«n, phi höa lßu tinh, thiên höa hàng thª, sát phÕt chúng sinh, xem nhæ nhß thª nào chÕy tr¯n!" )
	CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  Phi höa lßu tinh s¡p sØa hàng thª, thïnh các v¸ anh hùng t¯c t¯c tø t§p, cµng ğ°ng gánh vác lßu tinh phi höa s· nhiên thß½ng t±n." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x895066_BuffID_J2, 0 )
		end
	end

	return 1

end

--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x895066_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895066_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇ°µÀ×µÄbuff....ÔòÈÃBOSS¸ø¸½½üµÄÍæ¼Ò¼ÓÒ»¸öÉËº¦µÄbuff²¢º°»°....
	if impactId == x895066_BuffID_J2 then

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
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19434, 0 )
		elseif count == 1 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19392, 0 )
		elseif count == 2 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19393, 0 )
		elseif count == 3 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19394, 0 )
		elseif count == 4 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19395, 0 )
		elseif count == 5 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19396, 0 )
		elseif count == 6 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19397, 0 )
		elseif count == 7 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19398, 0 )
		elseif count == 8 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19399, 0 )
		elseif count == 9 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19400, 0 )
		elseif count == 10 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19401, 0 )
		elseif count == 11 then
		    LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 19402, 0 )
		end

		return

	end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x895066_OnBQZTimer( sceneId, step, data1, data2 )

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
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "15 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 13 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "13 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 10 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "10 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 7 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "7 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 6 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "6 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 5 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "5 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 4 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "4 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 3 == step then
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "3 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x895066_g_FuBenScriptId, "TipAllHuman", sceneId, "2 Giây sau b¡t ğ¥u trong tr§n höa lñc b¡t ğ¥u kh·i ğµng, chß v¸ khüng tao ğ¯t ngß¶i chi kiªp, còn thïnh t¯c t¯c tìm kiªm thüy tích ch² ğ¬ tránh xâm lßşc höa t§p." )
		return
	end

	if 1 == step then
		--ÉËº¦....
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, 19434, 0 )
			end
		end
		return
	end

end

