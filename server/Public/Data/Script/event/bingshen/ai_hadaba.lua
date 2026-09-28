--Æ®Ãì·å ÀîÇïË®AI  

--A ¡¾Ð¡ÎÞÏà¹¦¡¿¸ø×Ô¼ºÓÃ¸ö¿Õ¼¼ÄÜ....ÔÙ¸øËæ»ú¸øÒ»¸öÍæ¼ÒÊ§Ã÷....
--B ¡¾½£Îè¡¿¸ø×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....½ÓÏÂÀ´15sÄÚÒÀ´Î¸øÈ«¸±±¾Íæ¼Ò¼ÓÉËº¦ÖµÖð½¥¼Ó´óµÄÉËº¦buff....
--C ¡¾È÷ÍÑ¡¿¸ø×Ô¼ºÓÃÒ»¸öÇåbuffµÄ¼¼ÄÜ....
--D ¡¾±ù±¬¡¿¸ø×Ô¼ºÓÃ¸ö¿Õ¼¼ÄÜ....ÔÙ¸øËæ»ú¸øÍæ¼Ò½ÅÏÂ·Å¸öÏÝÚå....
--E ¡¾¿ñ±©¡¿¸ø×Ô¼º¼Ó·è¿ñµÄbuff....²»ÔÙÊ¹ÓÃÆäËû¼¼ÄÜ....

--È«³Ì¶¼´øÓÐÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--Õ½¶·¿ªÊ¼Í¬Ê±Ã¿¸ô10ÃëÓÃA¼¼ÄÜ....
--µ±HP½µÎª66%ºÍ33%Ê±·Ö±ðÊ¹ÓÃB¼¼ÄÜ....B¼¼ÄÜµÄ³ÖÐøÊ±¼äÄÚ....ÆäËü¼¼ÄÜCDµ½ÁË²»Ê¹ÓÃ....
--Ã¿¸ô20ÃëÓÃC¼¼ÄÜ....
--Ã¿¸ô20ÃëÓÃD¼¼ÄÜ....


--½Å±¾ºÅ
x894064_g_ScriptId	= 894064

--¸±±¾Âß¼­½Å±¾ºÅ....
x894064_g_FuBenScriptId = 894063

x894064_MyName			= "Tiêu D§t Phong"	--×Ô¼ºµÄÃû×Ö....

--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x894064_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894064_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--AÉñÀ´Ö®±Ê....
x894064_SkillA_ID			= 1800
x894064_SkillA_Buff		=	8804
x894064_SkillA_CD			= 5000

--B½£Îè....
x894064_SkillB_ID		= 1803
x894064_SkillB_CD		= 22000


--CÈ÷ÍÑ....
x894064_SkillC_ID		= 1802
x894064_SkillC_CD		= 20000

--D±ù±¬....
x894064_SkillD_ID		= 1801
x894064_SkillD_CD		= 20000
x894064_SkillD_SpecObj = 200
x894064_SkillD_Buff		=	8805

--E¿ñ±©....
x894064_SkillE_Buff1	= 10234
x894064_SkillE_Buff2	= 10235
--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x894064_EnterKuangBaoTime	= 10*60*1000

--AI Index....
x894064_IDX_StopWatch						= 1	--Ãë±í....
x894064_IDX_SkillA_CD						= 2	--A¼¼ÄÜµÄCDÊ±¼ä....
x894064_IDX_SkillB_HPStep				= 3	--ÑªÁ¿¼¶±ð....
x894064_IDX_SkillB_Step					= 4	--B¼¼ÄÜµÄStep....0=Î´·¢¶¯ 15=buff1 14=buff2 ¡­¡­ 1=buff15
x894064_IDX_SkillB_Type					= 5	--µ±Ç°ÕýÔÚÊ¹ÓÃÄÄÖÖÀàÐÍµÄ½£Îè....
x894064_IDX_SkillC_CD						= 6	--C¼¼ÄÜµÄCDÊ±¼ä....
x894064_IDX_SkillD_CD						= 7	--C¼¼ÄÜµÄCDÊ±¼ä....
x894064_IDX_KuangBaoTimer				= 8	--¿ñ±©µÄ¼ÆÊ±Æ÷....
x894064_IDX_SkillB_CD						= 9	--C¼¼ÄÜµÄCDÊ±¼ä....


x894064_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x894064_IDX_IsKuangBaoMode	= 2	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

--**********************************
--³õÊ¼»¯....
--**********************************
function x894064_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894064_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894064_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894064_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»ÐèÒª×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894064_IDX_IsKuangBaoMode ) then
		return
	end

	--A¼¼ÄÜÐÄÌø....
	if 1 == x894064_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B¼¼ÄÜÐÄÌø....
	if 1 == x894064_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C¼¼ÄÜÐÄÌø....
	if 1 == x894064_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D¼¼ÄÜÐÄÌø....
	if 1 == x894064_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E¼¼ÄÜÐÄÌø....
	if 1 == x894064_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--Ãë±íÐÄÌø....
	x894064_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894064_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894064_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894064_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x894064_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "XiaoYiFeng_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894064_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894064_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x894064_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ý¹þ´ó°Ô....
	CallScriptFunction( x894064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "XiaoYiFeng", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýÉ£ÍÁ¹«Ôò¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	if 2 ~= CallScriptFunction( x894064_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoRuJun" ) then
		CallScriptFunction( x894064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "XiaoRuJun", 1 )
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
		str = format(" #cff99ccÐ¯i m£t v¾i giang h° bao vây tÑ phía #GTiêu D§t Phong#W#cff99cc m£t Ñng ð¯i thong dong ðµ nhiên mµt tiªng ''Này t§t nhß gió'' Li«n biªn m¤t cho mµt ngß¶i trß¾c m£t  #{_INFOUSR%s}#W#cff99cc nh£t lên thßþng phân tán bäo v§t sau, mi®ng thì thào nói:T§t nhß gió quä nhiên danh b¤t hß truy«n, ngay cä ta cûng chï có th¬ thß½ng ðªn ngß½i....", playerName); --¹þ´ó°Ô
		AddGlobalCountNews( sceneId, str )
	end

	CallScriptFunction( x894064_g_FuBenScriptId, "CreateSamllDog", sceneId, 2 )
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x894064_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD, x894064_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD, x894064_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD, x894064_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A¼¼ÄÜÐÄÌø....
--**********************************
function x894064_TickSkillA( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillA_CD, x894064_SkillA_CD-(nTick-cd) )
		return x894064_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B¼¼ÄÜÐÄÌø....
--**********************************
function x894064_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_CD, x894064_SkillB_CD-(nTick-cd) )
		return x894064_UseSkillB( sceneId, selfId )
	end

end

--**********************************
--C¼¼ÄÜÐÄÌø....
--**********************************
function x894064_TickSkillC( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.5333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillC_CD, x894064_SkillC_CD-(nTick-cd) )
		return x894064_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D¼¼ÄÜÐÄÌø....
--**********************************
function x894064_TickSkillD( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.8333 then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillD_CD, x894064_SkillD_CD-(nTick-cd) )
		return x894064_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E¼¼ÄÜÐÄÌø....
--**********************************
function x894064_TickSkillE( sceneId, selfId, nTick )

	--Èç¹ûÕýÔÚÓÃB¼¼ÄÜÔòÏÈµÈ´ý....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--¼ì²âÊÇ·ñµ½ÁË¿ñ±©µÄÊ±ºò....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_KuangBaoTimer )
	if kbTime < x894064_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else
		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894064_IDX_IsKuangBaoMode, 1 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_SkillE_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894064_SkillE_Buff2, 0 )
		return 1

	end
end

--**********************************
--Ãë±íÐÄÌø....
--**********************************
function x894064_TickStopWatch( sceneId, selfId, nTick )

	--ÏÞÖÆÃ¿Ãë²Å»áÖ´ÐÐÒ»´Î....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--½£Îè¼¼ÄÜÂß¼­....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--Ñ°ÕÒ·ûÃôÒÇ....
		local bossId = CallScriptFunction( x894064_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
		if bossId <= 0 then
			return 0
		end

		--ÈÃ·ûÃôÒÇ¸øÍæ¼Ò¼Óbuff....
		local buffTbl = x894064_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[16-buffStep]
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			end
		end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--Ê¹ÓÃA¼¼ÄÜ....
--**********************************
function x894064_UseSkillA( sceneId, selfId )

	--Èç¹ûÕýÔÚÓÃB¼¼ÄÜÔòÌø¹ý....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x894064_IDX_SkillB_Step ) > 0 then
		return 0
	end

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

	--¶Ô×Ô¼ºÊ¹ÓÃÒ»¸ö¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillA_ID, selfId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼ÓÊ§Ã÷buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x894064_SkillA_Buff, 0 )

	return 1

end

--**********************************
--Ê¹ÓÃB¼¼ÄÜ....
--**********************************
function x894064_UseSkillB( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillB_ID, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Tiêu D§t Phong", "Binh Thánh KÏ Tr§n", "Tiêu D§t Phong T§t nhß gió, nhanh nhß thi­m, phong giáp thêm thân, ngß½i ch¶ s· hØu công kích ta ðem nh¤t nh¤t hoàn trä" )
	CallScriptFunction( x894064_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói: Tiêu D§t Phong ðã khu t§t phong hµ th¬, m£c dù ch¸u s· hæu thß½ng t±n s¨ có b¡n ngßþc, liên tøc 15 giây..." )

	return 1

end

--**********************************
--Ê¹ÓÃC¼¼ÄÜ....
--**********************************
function x894064_UseSkillC( sceneId, selfId )

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

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillC_ID, PlayerId, x, z, 0, 1 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, 8808, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, 8806, 0 )
	local x,z = GetWorldPos( sceneId, PlayerId )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "FengLei_BOSS", x, z )
	CallScriptFunction((200060), "Paopao",sceneId, "Tiêu D§t Phong", "Binh Thánh KÏ Tr§n", "Tiêu D§t Phong: TØ tiêu mây tø, s¤m d§y cØu thiên, cu°n cuµn s¤m ðánh qua ði, Phong lôi dÕn s¨ theo #c2ebeff"..GetName( sceneId, PlayerId ).." #Wthân th¬ trung sinh ra, ðem ch¶ ngß½i c¡n nu¯t h¥u nhß không còn..." )
	CallScriptFunction( x894064_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói: #c2ebeff"..GetName( sceneId, PlayerId ).."ðã thân trung s¤m ðánh thu§t, 5 giây sau hµi tñ này thân hình sinh ra 4 cái Phong lôi ðÕn, thä này Phong lôi ðÕn cûng hµi phóng ra này s¤m ðánh thu§t..." )

	return 1


end

--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x894064_UseSkillD( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x894064_SkillD_ID, selfId, x, z, 0, 1 )

	CallScriptFunction((200060), "Paopao",sceneId, "Tiêu D§t Phong", "Binh Thánh KÏ Tr§n", "Tiêu D§t Phong: Vây c½n l¯c, phong huy®t ð¸nh thân, chï ðµi khí xoáy tø tÕc li®t là lúc #c2ebeff"..GetName( sceneId, PlayerIdA )..","..GetName( sceneId, PlayerIdB ).."#W li«n ðem h°n v« cØu tuy«n..." )
	CallScriptFunction( x894064_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Nhân Dûng nói:  C½n l¯c ðem cho 30 giây sau tÕc li®t, ðªn lúc ðó b¸ nguy ngß¶i cùng phø c§n anh hùng b¸ thß½ng n£ng.." )

	--¸øÍæ¼Ò¼ÓÊ§Ã÷buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdA, x894064_SkillD_Buff, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdA, 8803, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdB, x894064_SkillD_Buff, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerIdB, 8803, 0 )

	local x,z = GetWorldPos( sceneId, PlayerIdA )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894064_SkillD_SpecObj, x, z, 0)
	local MstIdA = CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "XuanFeng_BOSS", x, z )
	SetCharacterDieTime( sceneId, MstIdA, 31500 )

	local x,z = GetWorldPos( sceneId, PlayerIdB )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894064_SkillD_SpecObj, x, z, 0)
	local MstIdB = CallScriptFunction( x894064_g_FuBenScriptId, "CreateBOSS", sceneId, "XuanFeng_BOSS", x, z )
	SetCharacterDieTime( sceneId, MstIdB, 31500 )

	return 1

end

--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x894064_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName( sceneId, MonsterId ) == "Tiêu D§t Phong" then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == 8803 then

		x,z = GetWorldPos( sceneId,selfId )
		CreateSpecialObjByDataIndex(sceneId, bossId, 193, x, z, 0)

		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == 8808 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8806, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, selfId, 8809, 0 )

		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == 8809 then
		CreateSpecialObjByDataIndex(sceneId, bossId, 191, x, z, 0)
		return
	end

end
