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
x894005_g_ScriptId	= 894005

--¸±±¾Âß¼­½Å±¾ºÅ....
x894005_g_FuBenScriptId = 894000


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x894005_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894005_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....


--Àë»ð·ÉÎè--´´½¨1¸öÀë»ð---
x894005_SkillA_ID		= 799
x894005_SkillA_CD		= 15000


--ÁÒÑæ·ÙÉí--µ¥»ðÈ¦---
x894005_SkillC_ID		= 800
x894005_SkillC_CD		= 20000
x894005_SkillC_SpecObj1         = 782
x894005_SkillC_SpecObj3         = 783
x894005_SkillC_SpecObj5         = 784
x894005_SkillC_SpecObj7         = 785
x894005_SkillC_SpecObj9         = 786


--±äÉí---
x894005_SkillH_CD		= 4000
x894005_SkillH_SpecObj		= 792


--·ï»ËÄù˜„---Ë«»ðÈ¦--
x894005_SkillD_ID		= 803
x894005_SkillD_CD		= 20000
x894005_SkillD_SpecObj1          = 787
x894005_SkillD_SpecObj3          = 788
x894005_SkillD_SpecObj5          = 789
x894005_SkillD_SpecObj7          = 790
x894005_SkillD_SpecObj9          = 791


--·ï»ËÄù˜„---Ë«ìÍ»ð--
x894005_SkillE_ID		= 805
x894005_SkillE_CD		= 15000


--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x894005_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x894005_IDX_StopWatch						= 1	--Ãë±í....
x894005_IDX_SkillA_CD						= 2	--A¼¼ÄÜµÄCDÊ±¼ä....
x894005_IDX_SkillC_CD						= 3	--C¼¼ÄÜµÄCDÊ±¼ä....
x894005_IDX_SkillD_CD						= 4	--C¼¼ÄÜµÄCDÊ±¼ä....
x894005_IDX_SkillE_CD						= 5	--C¼¼ÄÜµÄCDÊ±¼ä....
x894005_IDX_SkillH_CD						= 6	--C¼¼ÄÜµÄCDÊ±¼ä....
x894005_IDX_KuangBaoTimer				= 7	--¿ñ±©µÄ¼ÆÊ±Æ÷....


x894005_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x894005_IDX_IsKuangBaoMode	= 2	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

--**********************************
--³õÊ¼»¯....
--**********************************
function x894005_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894005_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894005_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	local DogName=GetName(sceneId,selfId)
	if DogName ~= "Luy®n Ngøc Phßþng Hoàng" and  DogName ~= "Di®t thª Höa Phßþng" then
	   local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	   if enemyId > 0 then
		 local x,z = GetWorldPos(sceneId,selfId)
		 local DogX, DogZ = GetWorldPos( sceneId, enemyId )
		 if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 2 then
	            LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, enemyId, 8927, 0 )
	            LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, enemyId, 8928, 0 )
		    LuaFnDeleteMonster( sceneId, selfId )
                    --LuaFnGmKillObj( sceneId, selfId, selfId )
		 end
	   end
	   return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894005_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»ÐèÒª×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894005_IDX_IsKuangBaoMode ) then
		return
	end

	--A¼¼ÄÜÐÄÌø....
	if 1 == x894005_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜÐÄÌø....
	if 1 == x894005_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--C¼¼ÄÜÐÄÌø....
	if 1 == x894005_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D¼¼ÄÜÐÄÌø....
	if 1 == x894005_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E¼¼ÄÜÐÄÌø....
	if 1 == x894005_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--Ãë±íÐÄÌø....
	x894005_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894005_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894005_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894005_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894005_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894005_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894005_OnLeaveCombat(sceneId, selfId)

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
		return
	end

	--ÖØÖÃAI....
	x894005_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x894005_g_FuBenScriptId, "CreateBOSS", sceneId, "HUOFENG_FENGYIN", -1, -1 )
                SetCharacterName(sceneId, MstId, "")
	SetUnitReputationID( sceneId, MstId, MstId, 8 )

	local MstId2 = CallScriptFunction( x894005_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_2", -1, -1 )
	SetUnitReputationID( sceneId, MstId2, MstId2, 9 )

end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894005_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894005_OnDie( sceneId, selfId, killerId )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
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
		   AddMonsterDropItem( sceneId, selfId, mems[i], 10553564 ) --×øÆï
                end
                if aa < 35 then
		   AddMonsterDropItem( sceneId, selfId, mems[i], random(38000448,38000448))
                end
                if aa == 72 then
                      chonglou = chonglouItem[random(3)]
		      --AddMonsterDropItem( sceneId, selfId, mems[i],chonglou )
		      local strText = format("#cFF0000Ngß¶i ch½i #W"..GetName(sceneId,mems[i]).."#GtÕi Tam Th¥n HUy«n Cänh ðÕi chiªn th¥n uy  #W Ma Häi R°ng #Gbiªt không th¬ ð¸ch lÕi ném xu¯ng 1 cái #{_ITEM"..chonglou.."} bö chÕy ch¯i chªt ")
                    --  BroadMsgByChatPipe(sceneId, selfId, strText, 4);
               end
	end

	--ÖØÖÃAI....
	x894005_ResetMyAI( sceneId, selfId )

	CallScriptFunction( x894005_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_3", -1, -1 )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ý¹þ´ó°Ô....
	--CallScriptFunction( x894005_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MinMo", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýÉ£ÍÁ¹«Ôò¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	--if 2 ~= CallScriptFunction( x894005_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
	--	CallScriptFunction( x894005_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "TaoQin", 1 )
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
function x894005_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillA_CD, 0 )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillC_CD, x894005_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillD_CD, x894005_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillE_CD, x894005_SkillE_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillH_CD, x894005_SkillH_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894005_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894005_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A¼¼ÄÜÐÄÌø....
--**********************************
function x894005_TickSkillA( sceneId, selfId, nTick )
	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.7500 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillA_CD, x894005_SkillA_CD-(nTick-cd) )
		return x894005_UseSkillA( sceneId, selfId )
	end

end


--**********************************
--C¼¼ÄÜÐÄÌø....
--**********************************
function x894005_TickSkillC( sceneId, selfId, nTick )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.7500 or CurPercent < 0.5000  then   --30%ÒÔÉÏ²»ÊÍ·Å 
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillC_CD, x894005_SkillC_CD-(nTick-cd) )
		return x894005_UseSkillC( sceneId, selfId )
	end

end


--**********************************
--H¼¼ÄÜÐÄÌø....
--**********************************
function x894005_TickSkillH( sceneId, selfId, nTick )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent >= 0 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillH_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillH_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillH_CD, x894005_SkillH_CD-(nTick-cd) )
		return x894005_UseSkillH( sceneId, selfId )
	end

end


--**********************************
--D¼¼ÄÜÐÄÌø....
--**********************************
function x894005_TickSkillD( sceneId, selfId, nTick )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.2500 or CurPercent > 0.5000  then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillD_CD, x894005_SkillD_CD-(nTick-cd) )
		return x894005_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E¼¼ÄÜÐÄÌø....
--**********************************
function x894005_TickSkillE( sceneId, selfId, nTick )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Luy®n Ngøc Phßþng Hoàng" and BOSSName ~= "Di®t thª Höa Phßþng" then
		return
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.2500 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillE_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillE_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_SkillE_CD, x894005_SkillE_CD-(nTick-cd) )
		return x894005_UseSkillE( sceneId, selfId )
	end

end

--**********************************
--Ãë±íÐÄÌø....
--**********************************
function x894005_TickStopWatch( sceneId, selfId, nTick )

	--ÏÞÖÆÃ¿Ãë²Å»áÖ´ÐÐÒ»´Î....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894005_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894005_IDX_StopWatch, time+nTick )
		return
	end

end

--**********************************
--Ê¹ÓÃA¼¼ÄÜ....
--**********************************
function x894005_UseSkillA( sceneId, selfId )

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

	--Ê¹ÓÃ?Õ¼¼Ä?...
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894005_SkillA_ID, selfId, x, z, 0, 1 )

	local MstIdA = LuaFnCreateMonster(sceneId, 42970, x, z, 27, 0, 894005 )
        SetCharacterName(sceneId, MstIdA, ""..GetName( sceneId, PlayerIdA ).."")
        SetCharacterDieTime(sceneId, MstIdA, 10000)
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, PlayerIdA, MstIdA, 8839, 0 )

	CallScriptFunction((200060), "Paopao",sceneId, "Luy®n Ngøc Phßþng Hoàng", "Ba th¥n huy­n cänh", "Luy®n Ngøc Phßþng Hoàng: Ly Höa hi®n thª, s¶ ð¸ch m®nh tang "..GetName( sceneId, PlayerIdA )..",#WNhìn ngß½i nhß thª nào tránh né cái này vô t§n chi höa." )
	--CallScriptFunction( x894005_g_FuBenScriptId, "TipAllHuman", sceneId, "²ÔÁè×ÓµÀ£º Àë»ðÒÑ³ö£¬ÖÚÎ»Ó¢ÐÛÇë²»Òª¿¿½üÀë»ð£¬¸÷Î»ËÙËÙºÏÁ¦½«Æä¾¡Êý»÷É±£¡" )

	return 1

end


--**********************************
--Ê¹ÓÃC¼¼ÄÜ....
--**********************************
function x894005_UseSkillC( sceneId, selfId )

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

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894005_SkillC_ID, selfId, x, z, 0, 1 )

	--ÔÚ×Ô¼º½Åµ×ÏÂ·ÅÏÝÚå....
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillC_SpecObj1, x, z, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillC_SpecObj3, x, z, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillC_SpecObj5, x, z, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillC_SpecObj7, x, z, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillC_SpecObj9, x, z, 2000)
     return 1
end


--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x894005_UseSkillD( sceneId, selfId )




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

	--Ëæ»úÌôÑ¡Ò»¸öµ¹Ã¹¹í....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]
        local x1,z1 = GetWorldPos( sceneId,  PlayerId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894005_SkillD_ID, selfId, x, z, 0, 1 )

	--ÔÚ×Ô¼º½Åµ×ÏÂ·ÅÏÝÚå....
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillD_SpecObj1, x, z, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillD_SpecObj5, x, z, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillD_SpecObj9, x, z, 2000)

	--ÔÚµ¹Ã¹¹í½Åµ×ÏÂ·ÅÏÝÚå....
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillD_SpecObj1, x1, z1, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillD_SpecObj5, x1, z1, 2000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillD_SpecObj9, x1, z1, 2000)

	return 1

end



--**********************************
--Ê¹ÓÃE¼¼ÄÜ....
--**********************************
function x894005_UseSkillE( sceneId, selfId )
	
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

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894005_SkillE_ID, selfId, x, z, 0, 1 )

	local MstIdA = LuaFnCreateMonster(sceneId, 42971, x-2, z-2, 27, 35, 894005 )
        SetCharacterName(sceneId, MstIdA, ""..GetName( sceneId, PlayerIdA ).."")
        SetCharacterDieTime(sceneId, MstIdA, 10000)
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdA, PlayerIdA, MstIdA, 8839, 0 )

	local MstIdC = LuaFnCreateMonster(sceneId, 42971, x+2, z+2, 27, 35, 894005 )
        SetCharacterName(sceneId, MstIdC, ""..GetName( sceneId, PlayerIdA ).."")
        SetCharacterDieTime(sceneId, MstIdA, 10000)
	LuaFnSendSpecificImpactToUnit( sceneId, MstIdC, PlayerIdA, MstIdC, 8839, 0 )

	CallScriptFunction((200060), "Paopao",sceneId, "Luy®n Ngøc Phßþng Hoàng", "Ba th¥n huy­n cänh", "Luy®n Ngøc Phßþng Hoàng: Ly Höa hi®n thª, s¶ ð¸ch m®nh tang, #c2ebeff"..GetName( sceneId, PlayerIdA )..",#WNhìn ngß½i nhß thª nào tránh né cái này vô t§n chi höa." )
	--CallScriptFunction( x894005_g_FuBenScriptId, "TipAllHuman", sceneId, "²ÔÁè×ÓµÀ£º Àë»ðÒÑ³ö£¬ÖÚÎ»Ó¢ÐÛÇë²»Òª¿¿½üÀë»ð£¬¸÷Î»ËÙËÙºÏÁ¦½«Æä¾¡Êý»÷É±£¡" )

	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....±äÉí
--**********************************
function x894005_UseSkillH( sceneId, selfId )

        local CurPercent = GetHp( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894005_SkillH_SpecObj, x, z, 100)

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨xinNPC....
	local MstId = LuaFnCreateMonster(sceneId, 42969, x, z, 25, 253, 894005 )
        SetHp( sceneId, MstId,CurPercent*1.5 )
	LuaFnNpcChat(sceneId, MstId, 0, "Höa Phßþng hi®n thª, biªn!")
	return 1

end

