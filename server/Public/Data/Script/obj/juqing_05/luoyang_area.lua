-- LÕc Dß½ngtoÕ ğµ Id = 4toÕ ğµ ÊÂ¼şÇøÓò
-- ¹¦ÄÜ,µ±Íæ¼ÒHoàn t¤t nhi®m vø21,Í¬Ê±ÓÖÃ»ÓĞHoàn t¤t nhi®m vø22,Í¬Ê±LÕc Dß½ng³¡¾°Ã»ÓĞ±ğÈËÔÙ×öCái này ÈÎÎñtoÕ ğµ Ê±ºò,

-- Ç°ĞøÈÎÎñ
x113007_g_PreMissionId = 21
x113007_g_MissionId = 22

x113007_g_OnTimerIndex = -1

-- ¶ÓÎé±àºÅ
x113007_g_GroupId = 1

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x113007_OnEnterArea( sceneId, selfId, areaId)

	-- Thöa mãnÈÎÎñ³öÏÖtoÕ ğµ Ìõ¼ş	
  if IsMissionHaveDone(sceneId,selfId,x113007_g_PreMissionId) < 1 then
  	return 0
  end
  
  -- Èç¹ûÍæ¼ÒÒÑ¾­Íê³ÉÁËCái này ÈÎÎñ,¾Í²»ÔÙË¢ÇÇ·å³öÀ´ÁË
  if IsMissionHaveDone(sceneId,selfId,x113007_g_MissionId) > 0 then
  	return 0
  end
  
  -- ¼ì²âµØÍ¼ÖĞĞúng²»ĞúngÒÑ¾­´æTÕi Cái này ÈËÎï,Cái này ¼ì²âĞúng²»»á¼ì²âÍæ¼ÒtoÕ ğµ ,¿ÉÒÔ·ÅĞÄÓÃ
  local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "Ki«u Phong"  then
			return
		end
		
		if GetName(sceneId, nMonsterId)  == "A Châu"  then
			return
		end
	end

  -- ´´½¨ÈËÎï,ÇÇ·å,A Châu
  local nNpc1 = LuaFnCreateMonster(sceneId, 442, 283, 116, 3, 0, 36008)
	local nNpc2 = LuaFnCreateMonster(sceneId, 443, 283, 113, 3, 0, 200025)

	SetCharacterName(sceneId, nNpc1, "Ki«u Phong")
	SetCharacterName(sceneId, nNpc2, "A Châu")
	
	-- ÉèÖÃÏûÊ§Ê±¼ä
	SetCharacterDieTime(sceneId, nNpc1, 600000)
	SetCharacterDieTime(sceneId, nNpc2, 600000)
	
	-- ÉĞúngëmµt cái¶ÓÎé
	--local groupId = AllocateMonsterGroup(sceneId)
	
	-- ÏÖTÕi ¹Ì¶¨toÕ ğµ Ê¹ÓÃmµt cái¶ÓÎé±àºÅ,TÕi SØ døng trß¾c ÏÖÇå¿Õ¾Í¿ÉÒÔ
	ReleaseMonsterGroup(sceneId, x113007_g_GroupId)
	
	AddGroupLeader(sceneId, x113007_g_GroupId, nNpc1)
	AddGroupMember(sceneId, x113007_g_GroupId, nNpc2, 2, 1)
	RefixPosOfGroupMember(sceneId,x113007_g_GroupId,nNpc1)

	SetIntervalDistOfGroupMember(sceneId, x113007_g_GroupId, 1)
	
	SetPatrolId(sceneId, nNpc1, 5)
	
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x113007_OnLeaveArea( sceneId, selfId, areaId)

end

