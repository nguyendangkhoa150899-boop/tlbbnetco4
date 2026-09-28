
function x999997_OnDie(sceneId, selfId, killerId)
	if LuaFnIsObjValid(sceneId, killerId) ~= 1 then
		return
	end

    if sceneId ~= 709 and sceneId ~= 711 and sceneId ~= 712 and sceneId ~= 713 and sceneId ~= 714 and sceneId ~= 715 then
      return 
    end

	---Süng v§t T¡c Thu hoÕch Này chü Ngß¶i tên g÷i 
	local playerID = killerId
	local objType = GetCharacterType(sceneId, killerId)
	if objType == 3 then
		playerID = GetPetCreator(sceneId, killerId)
	end

	if LuaFnHasTeam(sceneId,playerID) == 1 then
		local nPlayerNum = GetNearTeamCount(sceneId,playerID)
		if nPlayerNum>=1 then
			for i=0, nPlayerNum-1 do
				local nPlayerId = GetNearTeamMember(sceneId,playerID, i)
	           if IsHaveMission(sceneId, nPlayerId, 1391)> 0 then --Có CØu Lê Døc Nghi®t Nhi®m vø 
                  local misIndex = GetMissionIndexByID(sceneId, nPlayerId, 1391)
                  local killnum = GetMissionParam(sceneId, nPlayerId, misIndex, 1)
                  if killnum <30 then
                   SetMissionByIndex(sceneId, nPlayerId, misIndex, 1, killnum + 1)
                   x999997_NotifyTip(sceneId, nPlayerId,"Ðã Giªt chªt CØu Lê Dß nghi®t "..tonumber(killnum + 1).."/30")
                  else
                   SetMissionByIndex(sceneId, nPlayerId, misIndex, 0, 1)
                   x999997_NotifyTip(sceneId, nPlayerId,"Ðã Hoàn thành Quét sÕch: CØu Lê Dß nghi®t Nhi®m vø ,Thïnh mau chóng Tìm ðßþc [Phßþng minh M§t V®]Trä lÕi Nhi®m vø .")
                  end
                end
			end
		end
    else
	 if IsHaveMission(sceneId, playerID, 1391)> 0 then --Có CØu Lê Døc Nghi®t Nhi®m vø 
       local misIndex = GetMissionIndexByID(sceneId, playerID, 1391)
       local killnum = GetMissionParam(sceneId, playerID, misIndex, 1)
       if killnum <30 then
         SetMissionByIndex(sceneId, playerID, misIndex, 1, killnum + 1)
         x999997_NotifyTip(sceneId, playerID,"Ðã Giªt chªt CØu Lê Dß nghi®t "..tonumber(killnum + 1).."/30")
       else
         SetMissionByIndex(sceneId, playerID, misIndex, 0, 1)
         x999997_NotifyTip(sceneId, playerID,"Ðã Hoàn thành Quét sÕch: CØu Lê Dß nghi®t Nhi®m vø ,Thïnh mau chóng Tìm ðßþc [Phßþng minh M§t V®]Trä lÕi Nhi®m vø .")
       end
      end
	end
end



function x999997_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
