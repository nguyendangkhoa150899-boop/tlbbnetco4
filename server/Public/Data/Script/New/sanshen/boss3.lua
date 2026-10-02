--½Å±¾ºÅ 
x894006_g_ScriptId	= 894006

--¸±±¾Âß¼­½Å±¾ºÅ....
x894006_g_FuBenScriptId = 894000


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x894006_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x894006_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....


--ÂäÒ¶Éú»¨....
x894006_SkillA_ID		= 808
x894006_SkillA_CD		= 15000
x894006_SkillA_SpecObj = 793


--°Ù¶¾²øÁé....
x894006_SkillC_ID			= 807
x894006_SkillC_CD		= 20000


--±äÉí---
x894006_SkillH_CD		= 3000
x894006_SkillH_SpecObj			= 796


--ÂÖ»Ø¼ÄÉú....
x894006_SkillD_ID		= 812
x894006_SkillD_CD		= 15000


--Íò¶¾²øÁé....
x894006_SkillE_ID		= 810
x894006_SkillE_CD		= 20000
x894006_SkillE_SpecObj = 793 --ÔÝÊ±ÓÃÕâ¸ö´úÌæ


---*********************************************
--ÒÔÏÂµÄÐ¡¹Ö¼¼ÄÜ
--**********************************************
--»¨ÖÖ×Ó¼¼ÄÜ....
x894006_SkillF_ID		= 810  --²»Ê¹ÓÃ
x894006_SkillF_CD		= 4000
x894006_SkillF_SpecObj = 794 --ÔÝÊ±ÓÃÕâ¸ö´úÌæ


--¶¾»¨¼¼ÄÜ....
x894006_SkillG_ID		= 810  --²»Ê¹ÓÃ
x894006_SkillG_CD		= 1000
x894006_SkillG_SpecObj = 795

--**********************************************
--Ð¡¹Ö¼¼ÄÜ½áÊø
--**********************************************

--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x894006_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x894006_IDX_StopWatch						= 1	--Ãë±í....
x894006_IDX_SkillA_CD						= 2	--A¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_SkillC_CD						= 3	--C¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_SkillD_CD						= 4	--C¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_SkillE_CD						= 5	--C¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_SkillF_CD						= 6	--C¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_SkillG_CD						= 8	--C¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_SkillH_CD						= 8	--C¼¼ÄÜµÄCDÊ±¼ä....
x894006_IDX_KuangBaoTimer				= 9	--¿ñ±©µÄ¼ÆÊ±Æ÷....


x894006_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x894006_IDX_IsKuangBaoMode	= 2	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

--**********************************
--³õÊ¼»¯....
--**********************************
function x894006_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x894006_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x894006_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894006_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»ÐèÒª×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x894006_IDX_IsKuangBaoMode ) then
		return
	end

	--A¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--C¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--D¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--F¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillF( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜÐÄÌø....
	if 1 == x894006_TickSkillG( sceneId, selfId, nTick ) then
		return
	end


	--Ãë±íÐÄÌø....
	x894006_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x894006_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894006_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x894006_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x894006_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894006_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x894006_OnLeaveCombat(sceneId, selfId)

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" and BOSSName ~= "Ph® H°n Hoa Yêu" then
		return
	end

	--ÖØÖÃAI....
	x894006_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x894006_g_FuBenScriptId, "CreateBOSS", sceneId, "HUAYAO_FENGYIN", -1, -1 )
                SetCharacterName(sceneId, MstId, "")
	SetUnitReputationID( sceneId, MstId, MstId, 8 )

	local MstId2 = CallScriptFunction( x894006_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_3", -1, -1 )
	SetUnitReputationID( sceneId, MstId2, MstId2, 9 )

end


--**********************************
--É±ËÀµÐÈË....
--**********************************
function x894006_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x894006_OnDie( sceneId, selfId, killerId )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" and BOSSName ~= "Ph® H°n Hoa Yêu" then
		return
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
        local chonglouItem = {10553112,10553113,10553114}
        local chonglou = -1
	local mems = {}
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
                local aa = random(1000)
                if aa > 650  then
		   AddMonsterDropItem( sceneId, selfId, mems[i], 10553566 ) --×øÆï
                end
                if aa < 350 then
		   AddMonsterDropItem( sceneId, selfId, mems[i], random(38000448,38000448))
                end
                if aa == 999  then
                      chonglou = chonglouItem[random(3)]
		      --AddMonsterDropItem( sceneId, selfId, mems[i],chonglou )
		      local strText = format("#cFF0000Ngß¶i ch½i #W"..GetName(sceneId,mems[i]).."#GTÕi Tam Th¥n Huy«n Cänh #WMa Häi Cà R°ng #Gtñ biªt không phäi là ð¯i thü ném ra 1 cái #{_ITEM"..chonglou.."} chÕy tr¯i chªt")
                      -- BroadMsgByChatPipe(sceneId, selfId, strText, 4);   -- [NetCo4 02/10] TAT: dong roi Trung Lau o tren da bi chu thich -> loa bao roi gia (boss1/boss2 da tat san)
               end
	end

	--ÖØÖÃAI....
	x894006_ResetMyAI( sceneId, selfId )

	CallScriptFunction( x894006_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_2", -1, -1 )
        CallScriptFunction( x894006_g_FuBenScriptId, "CreateBOSS", sceneId, "CANGLINGZI_3", -1, -1 )


	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	for i=0, num-1 do
	    local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
            CallScriptFunction( 890536,"JianCe",sceneId,ServerID)
            if floor(mod(GetMissionData(sceneId,ServerID,HUOYUEFB_2),100)/10) < 1 then
               SetMissionData(sceneId,ServerID,HUOYUEZHI,GetMissionData(sceneId,ServerID,HUOYUEZHI)+89) --»îÔ¾Öµ+89
               SetMissionData(sceneId,ServerID,HUOYUEFB_2,GetMissionData(sceneId,ServerID,HUOYUEFB_2)+10)
            end
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
		str = format("#cffcc88#{_INFOUSR%s} dçn ð¥u ðµi ngû cu¯i cùng chém chªt Hoa Yêu dß¾i chân ngña ", playerName); --ÎÚÀÏ´ó
		AddGlobalCountNews( sceneId, str )
	end
	--CallScriptFunction( 898992, "MonsterOnDie", sceneId, selfId, killerId,19 )

       LuaFnCreateMonster(sceneId, 43606, 130, 152, 3, -1, 894007 )
	   
       LuaFnCreateMonster(sceneId, 43607, 136, 149, 3, -1, 894007 )
	   
       LuaFnCreateMonster(sceneId, 43608, 136, 155, 3, -1, 894007 )
	   
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x894006_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillA_CD, 0 )

	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillC_CD, x894006_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillD_CD, x894006_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillE_CD, x894006_SkillE_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillF_CD, x894006_SkillF_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillG_CD, x894006_SkillG_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillH_CD, x894006_SkillH_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894006_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x894006_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A¼¼ÄÜÐÄÌø....
--**********************************
function x894006_TickSkillA( sceneId, selfId, nTick )  --±ù¼õËÙ

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" and BOSSName ~= "Ph® H°n Hoa Yêu" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.7500 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillA_CD, x894006_SkillA_CD-(nTick-cd) )
		return x894006_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--C¼¼ÄÜÐÄÌø....
--**********************************
function x894006_TickSkillC( sceneId, selfId, nTick )  --±©·çÑ©¼¼ÄÜ

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" and BOSSName ~= "Ph® H°n Hoa Yêu" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.7500 or CurPercent < 0.5000  then
		return 0
	end

	--?üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillC_CD, x894006_SkillC_CD-(nTick-cd) )
		return x894006_UseSkillC( sceneId, selfId )
	end

end


--**********************************
--H¼¼ÄÜÐÄÌø....
--**********************************
function x894006_TickSkillH( sceneId, selfId, nTick )

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" then  --ÒÑ¾­±äÉí£¬·µ»Ø
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent >= 0 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillH_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillH_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillH_CD, x894006_SkillH_CD-(nTick-cd) )
		return x894006_UseSkillH( sceneId, selfId )
	end

end


--**********************************
--D¼¼ÄÜÐÄÌø....
--********************************** 
function x894006_TickSkillD( sceneId, selfId, nTick )   --±ù×¶Õó·¨

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" and BOSSName ~= "Ph® H°n Hoa Yêu" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent < 0.2500 or  CurPercent > 0.5000  then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillD_CD, x894006_SkillD_CD-(nTick-cd) )
		return x894006_UseSkillD( sceneId, selfId )
	end

end


--**********************************
--E¼¼ÄÜÐÄÌø....
--********************************** 
function x894006_TickSkillE( sceneId, selfId, nTick )   --´«ËÍ

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Nhiªp Linh c± hoa" and BOSSName ~= "Ph® H°n Hoa Yêu" then
		return 0
	end

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.2500 then
		return 0
	end
	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillE_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillE_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillE_CD, x894006_SkillE_CD-(nTick-cd) )			
		return x894006_UseSkillE( sceneId, selfId )
	end

end


--**********************************
--F¼¼ÄÜÐÄÌø....
--********************************** 
function x894006_TickSkillF( sceneId, selfId, nTick )   --´«ËÍ

	local BOSSName=GetName(sceneId,selfId)
	if BOSSName ~= "Ðµc hÕt gi¯ng" then
		return 0
	end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillF_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillF_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillF_CD, x894006_SkillF_CD-(nTick-cd) )			
		return x894006_UseSkillF( sceneId, selfId )
	end

end



--**********************************
--G¼¼ÄÜÐÄÌø....
--********************************** 
function x894006_TickSkillG( sceneId, selfId, nTick )   --´«ËÍ

	local BOSSName=GetName(sceneId,selfId)
	--if BOSSName ~= "¶¾»¨" then
	--	return 0
	--end

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillG_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillG_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_SkillG_CD, x894006_SkillG_CD-(nTick-cd) )			
		return x894006_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--Ãë±íÐÄÌø....
--**********************************
function x894006_TickStopWatch( sceneId, selfId, nTick )

	--ÏÞÖÆÃ¿Ãë²Å»áÖ´ÐÐÒ»´Î....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x894006_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x894006_IDX_StopWatch, time+nTick )
		return
	end

end

--**********************************
--Ê¹ÓÃA¼¼ÄÜ....
--**********************************
function x894006_UseSkillA( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Bách ðµc qu¥n linh, nØa bß¾c khó d¶i")

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
	LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillA_ID, selfId, x, z, 0, 1 )

	--ÔÚboss¸½½ü·ÅÏÝÚå....
        local suiji = random(10)
        if suiji >= 5 then
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894006_SkillA_SpecObj, x+5, z, 1000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894006_SkillA_SpecObj, x-5, z, 1000)
        else
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894006_SkillA_SpecObj, x, z+5, 1000)
	   CreateSpecialObjByDataIndex(sceneId, selfId, x894006_SkillA_SpecObj, x, z-5, 1000)
        end
   return 1
end

--**********************************
--Ê¹ÓÃC¼¼ÄÜ....
--**********************************
function x894006_UseSkillC( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Vô tri nhân loÕi ")
	--CallScriptFunction((200060), "Paopao",sceneId, "²ÔÁè×Ó", "ÈýÉñ»Ã¾³","²ÔÁè×Ó£ºNhiªp Linh c± hoaÒªÊ©·Å¼¼ÄÜ[ÂäÒ¶Éú»¨]ÁË£¬Ò»µ©±»»÷ÖÐ£¬½«»áÊÜµ½¾Þ´óµÄÉËº¦£¬Çë×¢Òâ¶ã±Ü£¡" )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillC_ID, selfId, x, z, 0, 1 )

	--ÔÚboss¸½½ü·Å¶¾»¨ÖÖ×Ó....
        local suiji = random(10)
        if suiji >= 5 then
	   LuaFnCreateMonster(sceneId, 42973, x+5, z, 32, 0, 894006 )
	   LuaFnCreateMonster(sceneId, 42973, x-5, z, 32, 0, 894006 )
        else
	   LuaFnCreateMonster(sceneId, 42973, x, z+5, 32, 0, 894006 )
	   LuaFnCreateMonster(sceneId, 42973, x, z-5, 32, 0, 894006 )
        end
	return 1

end

--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x894006_UseSkillD( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "Vô chi nhân loÕi, cu°ng nµ ")
	--CallScriptFunction((200060), "Paopao",sceneId, "²ÔÁè×Ó", "ÈýÉñ»Ã¾³","²ÔÁè×Ó£ºPh® H°n Hoa YêuÒª·Å¾ø¼¼[ÂÖ»Ø¼ÄÉú]ÁË£¬´ó¼ÒÔ¶ÀëËûÊÍ·ÅµÄÏÝÚå£¡" )

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
	local x1,z1 = GetWorldPos( sceneId, PlayerId )
	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillD_ID, selfId, x, z, 0, 1 )

	--ÔÚ¸ÃÍæ¼Ò½Åµ×ÏÂ·ÅÐ¡»¨....
	local j,q = 3,3
	for i=1,4 do
	      flo1 = LuaFnCreateMonster(sceneId, 42976, x1+j, z1, 27, 0, 894006 )
	             SetMonsterGroupID( sceneId, flo1, 3 )  

	       --LuaFnCreateMonster(sceneId, 42976, x1+j, z1+j, 27, 0, 894006 )
	       --LuaFnCreateMonster(sceneId, 42976, x1, z1+j, 27, 0, 894006 )
	      flo2 = LuaFnCreateMonster(sceneId, 42976, x1-q, z1, 27, 0, 894006 )
	             SetMonsterGroupID( sceneId, flo2, 3 )  

	       --LuaFnCreateMonster(sceneId, 42976, x1-q, z1-q, 27, 0, 894006 )
	       --LuaFnCreateMonster(sceneId, 42976, x1, z1-q, 27, 0, 894006 )		
		j=j+2
		q=q+2			
	end

	return 1

end


--**********************************
--Ê¹ÓÃE¼¼ÄÜ....
--**********************************
function x894006_UseSkillE( sceneId, selfId )

	LuaFnNpcChat(sceneId, selfId, 0, "VÕn ðµc di linh, t§n di®t thß½ng sinh")
	--CallScriptFunction((200060), "Paopao",sceneId, "²ÔÁè×Ó", "ÈýÉñ»Ã¾³","²ÔÁè×Ó£ºPh® H°n Hoa YêuÒª·Å¾ø¼¼[Íò¶¾Ê¬Áé]ÁË£¬´ó¼ÒÑ¸ËÙÔ¶ÀëËûÊÍ·ÅµÄÏÝÚå£¡" )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillE_ID, selfId, x, z, 0, 1 )

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


	--Ëæ»úÌôÑ¡Á½¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId1 = PlayerList[ random(numPlayer) ]
	local PlayerId2 = PlayerList[ random(numPlayer) ]

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillE_ID, selfId, x, z, 0, 1 )

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x1,z1 = GetWorldPos( sceneId, PlayerId1 )
	local x2,z2 = GetWorldPos( sceneId, PlayerId2 )	

		CreateSpecialObjByDataIndex(sceneId, PlayerId1, x894006_SkillE_SpecObj, x1, z1, 1500)
		CreateSpecialObjByDataIndex(sceneId, PlayerId2, x894006_SkillE_SpecObj, x2, z2, 1500)		

	return 1

end


--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x894006_UseSkillF( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	--LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillF_ID, selfId, x, z, 0, 1 )

	--ÔÚWANJIA¸½½ü·ÅHUA....
	local floA = LuaFnCreateMonster(sceneId, 42976, x+1, z+1, 27, 0, 894006 )
	SetMonsterGroupID( sceneId, floA, 3 ) 

	local floB = LuaFnCreateMonster(sceneId, 42976, x-1, z-1, 27, 0, 894006 )
	SetMonsterGroupID( sceneId, floB, 3 ) 

   return 1
end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x894006_UseSkillG( sceneId, selfId )

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

	--Ëæ»úÌôÑ¡1¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId1 = PlayerList[ random(numPlayer) ]
	local x1,z1 = GetWorldPos( sceneId, PlayerId1 )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	--LuaFnUnitUseSkill( sceneId, selfId, x894006_SkillG_ID, selfId, x, z, 0, 1 )

	--¼ÆËãÍæ¼ÒÓë±¦²ØµÄ¾àÀë
	Distance = floor(sqrt((x-x1)*(x-x1)+(z-z1)*(z-z1)))
        if Distance <= 2 then
	   LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId1, 8931, 0 )
        end

   return 1
end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x894006_UseSkillH( sceneId, selfId )

        local CurPercent = GetHp( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x894006_SkillH_SpecObj, x, z, 100)

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨xinNPC....
	local MstId = LuaFnCreateMonster(sceneId, 42975, x, z, 25, 253, 894006 )
	SetMonsterGroupID( sceneId, MstId, 3 )  --×éID
        SetHp( sceneId, MstId,CurPercent*1.5 )
	LuaFnNpcChat(sceneId, MstId, 0, "Hoa yªu biªn thª , biªn")
	return 1

end

