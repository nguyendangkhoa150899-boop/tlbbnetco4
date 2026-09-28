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
x894067_g_ScriptId	= 894067

--¸±±¾Âß¼­½Å±¾ºÅ....
x894067_g_FuBenScriptId = 894063

--ÃâÒßBuff....
x894067_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x894067_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--¼¼ÄÜ....
x894067_SkillID_F		= 1805
x894067_BuffID_F1		= 8816

x894067_SkillID_G		= 1806
x894067_SkillID_G_SpecObj		= 188

x894067_SkillID_H		= 1807
x894067_BuffID_H		= 19629

x894067_SkillID_I		= 1804

x894067_SkillCD_FH	=	10000
x894067_SkillCD_G		=	12000
x894067_SkillCD_H	=	12000
x894067_SkillCD_I	=	5000


x894067_MyName			= "Tiêu Nhß Úy "	--×Ô¼ºµÄÃû×Ö....
x894067_BrotherName = "Tiêu Nhß Quân "	--ĞÖµÜµÄÃû×Ö....

--AI Index....
x894067_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1ĞèÒª½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x894067_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x894067_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x894067_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x894067_IDX_CD_SkillI			= 5	--G¼¼ÄÜµÄCD....
x894067_IDX_CD_SkillH			= 6	--H¼¼ÄÜµÄCD....

x894067_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....


--**********************************
--³õÊ¼»¯....
--**********************************
function x894067_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894067_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x894067_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894067_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜĞÄÌø....
	if 1 == x894067_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜĞÄÌø....
	if 1 == x894067_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜĞÄÌø....
	if 1 == x894067_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜĞÄÌø....
	if 1 == x894067_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 15140 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8821, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8822, 0 )
		elseif MosDataID == 15160 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8829, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8830, 0 )
		elseif MosDataID == 15150 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8825, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8826, 0 )
		elseif MosDataID == 15165 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8831, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8832, 0 )
		elseif MosDataID == 15155 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8827, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8828, 0 )
		elseif MosDataID == 15145 then
			LuaFnSendSpecificImpactToUnit( sceneId, nObjId, nObjId, selfId, 8823, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 8824, 0 )
		end
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894067_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894067_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894067_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894067_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894067_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894067_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x894067_ResetMyAI( sceneId, selfId )

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ²¢½«ÆäÉ¾³ı....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x894067_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )
	CallScriptFunction( x894067_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PlayHp", 0 )

	--´´½¨¶Ô»°NPC....
	local MstIdA = CallScriptFunction( x894067_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoRuJun_NPC", -1, -1 )
	local MstIdB = CallScriptFunction( x894067_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoRuWei_NPC", -1, -1 )

	SetUnitReputationID( sceneId, MstIdA, MstIdA, 0 )
	SetUnitReputationID( sceneId, MstIdB, MstIdB, 0 )

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 15040 or MosDataID == 15045 or MosDataID == 15050 or MosDataID == 15055 or MosDataID == 15060 or MosDataID == 15065 or MosDataID == 15140 or MosDataID == 15145 or MosDataID == 15150 or MosDataID == 15155 or MosDataID == 15160 or MosDataID == 15165 then
			LuaFnDeleteMonster( sceneId, nObjId )
		end
	end

end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x894067_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀ
