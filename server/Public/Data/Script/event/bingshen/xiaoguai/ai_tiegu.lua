--½Å±¾ºÅ
x894092_g_ScriptId	= 894092

--¸±±¾Âß¼­½Å±¾ºÅ....
x894092_g_FuBenScriptId = 894063

x894092_MyName			= " Gia Lu§t Liên Thành Thiªt c¯t "	--×Ô¼ºµÄÃû×Ö....
x894092_BrotherName			= " Gia Lu§t Liên Thành "	--×Ô¼ºµÄÃû×Ö....

--ÃâÒßBuff....
x894092_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x894092_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--D¼¼ÄÜ....
x894092_BuffD				= 19801	--¼òµ¥°æçÎç¿·åÊ¹ÓÃÉËº¦½µµÍÁËµÄ°æ±¾....
x894092_SkillD_CD		= 5000

--AI Index....
x894092_IDX_CD_SkillD			= 1	--D¼¼ÄÜµÄCD....

x894092_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....


--**********************************
--³õÊ¼»¯....
--**********************************
function x894092_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894092_ResetMyAI( sceneId, selfId )

end


--**********************************
--ĞÄÌø....
--**********************************
function x894092_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894092_IDX_CombatFlag ) then
		return
	end

	--D¼¼ÄÜĞÄÌø....
	if 1 == x894092_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894092_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894092_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894092_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894092_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894092_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894092_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x894092_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x894092_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894092_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x894092_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ....¸øÆäÉèÖÃĞèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894092_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 8854, 0 )
		end
	end

	CallScriptFunction((200060), "Paopao",sceneId, " Gia Lu§t Liên Thành ", "Binh Thánh KÏ Tr§n", " Gia Lu§t Liên Thành : Nguyên th¥n, thiªt c¯t nhß thª nào b¸ phá, chÆng l¨ là thiên døc thü ngô m®nh?!" )
	CallScriptFunction( x894092_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  B·i vì ğúng lúc ğem phân thân di®t tr×, Gia Lu§t Liên Thành Ğã nguyên khí theo thß½ng, lúc này không công càng ğãi khi nào." )

end


--**********************************
--ÖØÖÃAI....
--**********************************
function x894092_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894092_IDX_CD_SkillD, x894092_SkillD_CD )

end


--**********************************
--ABC¼¼ÄÜĞÄÌø....
--**********************************
function x894092_TickSkillABC( sceneId, selfId, nTick )

end


--**********************************
--D¼¼ÄÜĞÄÌø....
--**********************************
function x894092_TickSkillD( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894092_IDX_CD_SkillD )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894092_IDX_CD_SkillD, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894092_IDX_CD_SkillD, x894092_SkillD_CD-(nTick-cd) )
		return x894092_UseSkillD( sceneId, selfId )

	end

end


--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x894092_UseSkillD( sceneId, selfId )

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ....¸øÆäÉèÖÃĞèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894092_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 8853, 0 )
		end
	end

end
