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
x894004_g_ScriptId	= 894004

--¸±±¾Âß¼­½Å±¾ºÅ....
x894004_g_FuBenScriptId = 894000


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x894004_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894004_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--±ù¼õËÙ....
x894004_SkillA_ID			= 792
x894004_SkillA_CD		= 10000
x894004_SkillA_SpecObj			= 777

--±©·çÑ©....
x894004_SkillC_ID		= 793
x894004_SkillC_CD		= 15000
x894004_SkillC_SpecObj = 778

--±äÉí---
x894004_SkillH_CD		= 3000
x894004_SkillH_SpecObj			= 780

--D±ù×¶Õó....
x894004_SkillD_ID		= 794
x894004_SkillD_CD		= 15000
x894004_SkillD_SpecObj = 779

--º®±ùµØÓü....
x894004_SkillE_ID		= 798
x894004_SkillE_CD		= 20000


--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x894004_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x894004_IDX_StopWatch						= 1	--Ãë±í....
x894004_IDX_SkillA_CD						= 2	--A¼¼ÄÜµÄCDÊ±¼ä....
x894004_IDX_SkillC_CD						= 3	--C¼¼ÄÜµÄCDÊ±¼ä....
x894004_IDX_SkillD_CD						= 4	--C¼¼ÄÜµÄCDÊ±¼ä....
x894004_IDX_SkillE_CD						= 5	--C¼¼ÄÜµÄCDÊ±¼ä....
x894004_IDX_SkillH_CD						= 6	--C¼¼ÄÜµÄCDÊ±¼ä....
x894004_IDX_KuangBaoTimer				= 7	--¿ñ±©µÄ¼ÆÊ±Æ÷....


x894004_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x894004_IDX_IsKuangBaoMode	= 2	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

--**********************************
--³õÊ¼»¯....
--**********************************
function x894004_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894004_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894004_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894004_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»ÐèÒª×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894004_IDX_IsKuangBaoMode ) then
		return
	end

	--A¼¼ÄÜÐÄÌø....
	if 1 == x894004_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--C¼¼ÄÜÐÄÌø....
	if 1 == x894004_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜÐÄÌø....
	if 1 == x894004_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--D¼¼ÄÜÐÄÌø....
	if 1 == x894004_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E¼¼ÄÜÐÄÌø....
	if 1 == x894004_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--Ãë±íÐÄÌø....
	x894004_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894004_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894004_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894004_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894004_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894004_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894004_OnLeaveCombat(sceneId, selfId)

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "NÑt häi huy«n tích" and BOSSName ~= "NÑt häi Ma Long" then
		return
	end

	--ÖØÖÃAI....
	x894004_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x894004_g_FuBenScriptId, "CreateBOSS", sceneId, "XUANXI_FENGYIN", -1, -1 )
                SetCharacterName(sceneId, MstId, "")
	SetUnitReputationID( sceneId, MstId, MstId, 8 )

	local MstId2 = CallScriptFunction( x894004_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_1", -1, -1 )
	SetUnitReputationID( sceneId, MstId2, MstId2, 9 )

end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894004_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894004_OnDie( sceneId, selfId, killerId )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "NÑt häi huy«n tích" and BOSSName ~= "NÑt häi Ma Long" then
		return
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
        local chonglouItem = {10553112,10553113,10553114}
        local chonglou = -1
	local mems = {}
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
                local aa = random(100)
                if aa > 65  then
		   AddMonsterDropItem( sceneId, selfId, mems[i], 10553565 ) --×øÆï
                end
                if aa < 35 then
		   AddMonsterDropItem( sceneId, selfId, mems[i], random(38000448,38000448))
                end
                if aa == 72 then
                      chonglou = chonglouItem[random(3)]
		      --AddMonsterDropItem( sceneId, selfId, mems[i],chonglou )
		      local strText = format("#cFF0000Ngß¶i ch½i #W"..GetName(sceneId,mems[i]).."#GtÕi Tam Th¥n HUy«n Cänh ðÕi chiªn th¥n uy  #W Ma Häi R°ng #Gbiªt không th¬ ð¸ch lÕi ném xu¯ng 1 cái #{_ITEM"..chonglou.."} bö chÕy ch¯i chªt ")
                     -- BroadMsgByChatPipe(sceneId, selfId, strText, 4);
               end
	end

	--ÖØÖÃAI....
	x894004_ResetMyAI( sceneId, selfId )

	CallScriptFunction( x894004_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_2", -1, -1 )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ý¹þ´ó°Ô....
	--CallScriptFunction( x894004_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MinMo", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýÉ£ÍÁ¹«Ôò¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	--if 2 ~= CallScriptFunction( x894004_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
	--	CallScriptFunction( x894004_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "TaoQin", 1 )
	--end
		
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
		str = format("#cffcc88#{_INFOUSR%s} dçn ð¥u ðµi ngû chém chªt Ma Häi R°ng dß¾i chân ngña ", playerName); --ÎÚÀÏ´ó
		AddGlobalCountNews( sceneId, str )
	end
	--CallScriptFunction( 898992, "MonsterOnDie", sceneId, selfId, killerId,19 )
end



--**********************************
--ÖØÖÃAI....
--**********************************
function x894004_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillA_CD, 0 )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillC_CD, x894004_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillD_CD, x894004_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillE_CD, x894004_SkillE_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillH_CD, x894004_SkillH_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894004_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894004_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A¼¼ÄÜÐÄÌø....
--**********************************
function x894004_TickSkillA( sceneId, selfId, nTick )  --±ù¼õËÙ
	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.7500 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillA_CD, x894004_SkillA_CD-(nTick-cd) )
		return x894004_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--C¼¼ÄÜÐÄÌø....
--**********************************
function x894004_TickSkillC( sceneId, selfId, nTick )  --±©·çÑ©¼¼ÄÜ

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "NÑt häi Ma Long" and BOSSName ~= "NÑt häi huy«n tích" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.7500 or  CurPercent < 0.5000  then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillC_CD, x894004_SkillC_CD-(nTick-cd) )
		return x894004_UseSkillC( sceneId, selfId )
	end

end


--**********************************
--H¼¼ÄÜÐÄÌø....
--**********************************
function x894004_TickSkillH( sceneId, selfId, nTick )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName == "NÑt häi Ma Long" then  --ÒÑ¾­±äÉí£¬·µ»Ø
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent >= 0 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillH_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillH_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillH_CD, x894004_SkillH_CD-(nTick-cd) )
		return x894004_UseSkillH( sceneId, selfId )
	end

end


--**********************************
--D¼¼ÄÜÐÄÌø....
--********************************** 
function x894004_TickSkillD( sceneId, selfId, nTick )   --±ù×¶Õó·¨

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "NÑt häi Ma Long" and BOSSName ~= "NÑt häi huy«n tích" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.2500 or CurPercent > 0.5000  then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillD_CD, x894004_SkillD_CD-(nTick-cd) )
		return x894004_UseSkillD( sceneId, selfId )
	end

end


--**********************************
--E¼¼ÄÜÐÄÌø....
--********************************** 
function x894004_TickSkillE( sceneId, selfId, nTick )   --´«ËÍ

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "NÑt häi Ma Long" and BOSSName ~= "NÑt häi huy«n tích" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.2500 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillE_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillE_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_SkillE_CD, x894004_SkillE_CD-(nTick-cd) )			
		return x894004_UseSkillE( sceneId, selfId )
	end

end


--**********************************
--Ãë±íÐÄÌø....
--**********************************
function x894004_TickStopWatch( sceneId, selfId, nTick )

	--ÏÞÖÆÃ¿Ãë²Å»áÖ´ÐÐÒ»´Î....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894004_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894004_IDX_StopWatch, time+nTick )
		return
	end




end

--**********************************
--Ê¹ÓÃA¼¼ÄÜ....
--**********************************
function x894004_UseSkillA( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Cäm thø mµt chút bång phong lñc lßþng ði! Vô tri nhân loÕi!")

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
	local PlayerId1 = PlayerList[ random(numPlayer) ]
	local PlayerId2 = PlayerList[ random(numPlayer) ]

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894004_SkillA_ID, selfId, x, z, 0, 1 )


	--ÔÚ¸ÃÍæ¼Ò½Åµ×ÏÂ·ÅÏÝÚå....
        local	x1,z1 = GetWorldPos( sceneId,  PlayerId1 )
        local	x2,z2 = GetWorldPos( sceneId,  PlayerId2 )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillA_SpecObj, x1, z1, 1000)
	CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillA_SpecObj, x2, z2, 1000)
	return 1

end

--**********************************
--Ê¹ÓÃC¼¼ÄÜ....
--**********************************
function x894004_UseSkillC( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Mßa to gió l¾n, hüy thiên di®t ð¸a. Phá!")
	--CallScriptFunction((200060), "Paopao",sceneId, "²ÔÁè×Ó", "ÈýÉñ»Ã¾³","²ÔÁè×Ó£ºNÑt häi huy«n tíchÒªÊ©·ÅÏÝÚå[¿ñ·ç±©Óê]ÁË£¬Ò»µ©±»»÷ÖÐ£¬½«»áÊÜµ½¾Þ´óµÄÉËº¦£¬Çë×¢Òâ¶ã±Ü£¡" )

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

	--Ëæ»úÌôÑ¡2¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId1 = PlayerList[ random(numPlayer) ]
	local PlayerId2 = PlayerList[ random(numPlayer) ]

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894004_SkillC_ID, selfId, x, z, 0, 1 )
        local x1,z1 = GetWorldPos( sceneId,  PlayerId1 )
        local x2,z2 = GetWorldPos( sceneId,  PlayerId2 )
	--ÔÚ¸ÃÍæ¼Ò½Åµ×ÏÂ·ÅÏÝÚå....

	CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillC_SpecObj, x1, z1, 1000)
	CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillC_SpecObj, x2, z2, 1000)
	return 1

end

--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x894004_UseSkillD( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Vô tri nhân loÕi, ðªn tiªp nh§n bång tuyªt phçn nµ ði!")
	--CallScriptFunction((200060), "Paopao",sceneId, "²ÔÁè×Ó", "ÈýÉñ»Ã¾³","²ÔÁè×Ó£ºNÑt häi Ma LongÒª·Å¾ø¼¼[±ùÑ©Á¬Ìì]ÁË£¬´ó¼ÒÔ¶ÀëËûÊÍ·ÅµÄÏÝÚå£¡" )

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
	LuaFnUnitUseSkill( sceneId, selfId, x894004_SkillD_ID, selfId, x, z, 0, 1 )

	--ÔÚ¸ÃÍæ¼Ò½Åµ×ÏÂ·ÅÏÝÚå....
	local j,q = 3,3
	for i=1,4 do
		CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillD_SpecObj, x+j, z, 1500)	
		CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillD_SpecObj, x+j, z+j, 1500)		
		CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillD_SpecObj, x, z+j, 1500)	
		CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillD_SpecObj, x-q, z, 1500)	
		CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillD_SpecObj, x-q, z-q, 1500)		
		CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillD_SpecObj, x, z-q, 1500)			
		j=j+2
		q=q+2			
		end

	return 1

end


--**********************************
--Ê¹ÓÃE¼¼ÄÜ....
--**********************************
function x894004_UseSkillE( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Hàn bång Ð¸a Ngøc, li®t ð¸a ðông lÕnh tr¶i!")
	--CallScriptFunction((200060), "Paopao",sceneId, "²ÔÁè×Ó", "ÈýÉñ»Ã¾³","²ÔÁè×Ó£ºNÑt häi Ma LongÒª·Å¾ø¼¼[º®±ùµØÓü]ÁË£¬´ó¼ÒÑ¸ËÙÔ¶ÀëËûÊÍ·ÅµÄÏÝÚå£¡" )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894004_SkillE_ID, selfId, x, z, 0, 1 )

	--¸±±¾ÖÐÓÐÐ§µÄÍæ¼ÒµÄÁÐ±í....
	local PlayerList = {}

	--½«ÓÐÐ§µÄÈË¼ÓÈëÁÐ±í....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
	        local x,z = GetWorldPos( sceneId, selfId )
                        --NewWorld(sceneId,nHumanId,sceneId,random(x-2,x+2),random(z-2,z+2))
		CallScriptFunction( (400900), "TransferFunc", sceneId, nHumanId, sceneId, x, z, 1 )
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	return 1

end

--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x894004_UseSkillH( sceneId, selfId )

        local CurPercent = GetHp( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894004_SkillH_SpecObj, x, z, 100)

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨xinNPC....
	local MstId = LuaFnCreateMonster(sceneId, 42967, x, z, 25, 253, 894004 )
        SetHp( sceneId, MstId,CurPercent*1.5 )
	LuaFnNpcChat(sceneId, MstId, 0, "Ma Long hi®n thª, biªn!")
	return 1

end

