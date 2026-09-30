
function x999998_OnDie( sceneId, selfId, killerId )
	if LuaFnIsObjValid( sceneId, killerId ) ~= 1  then
		return
	end
        local GuaiLev = GetLevel(sceneId, selfId) --怪物等级
        local Neixi = (770 + GuaiLev*10) * 4  -- [NetCo4 30/09] x4 noi tuc Vo Y theo yeu cau chu server (goc: 770 + GuaiLev*10)
	---宠物则获取其主人的名字
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end

	if LuaFnHasTeam(sceneId,playerID) == 1  then
		local nPlayerNum = GetNearTeamCount(sceneId,playerID)
		if nPlayerNum >=1 then
			for i=0, nPlayerNum-1  do
				local nPlayerId = GetNearTeamMember(sceneId,playerID, i)
                                CallScriptFunction(2015,"WuyiExpUp",sceneId,nPlayerId,Neixi)


			end
		end
        else
        CallScriptFunction(2015,"WuyiExpUp",sceneId,playerID,Neixi)
	end
end
