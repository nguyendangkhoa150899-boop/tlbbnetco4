--缥缈峰副本....
--端木元对话脚本....

--脚本号
x890074_g_ScriptId	= 890074

--副本逻辑脚本号....
x890074_g_FuBenScriptId = 890063

--**********************************
--死亡....
--**********************************
function x890074_OnDie( sceneId, selfId, killerId )

	--如果还没有挑战过李秋水则可以挑战李秋水....
	if 2 ~= CallScriptFunction( x890074_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" )	then
		CallScriptFunction( x890074_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "DingChunQiu", 1 )
	end
	-- zchw 全球公告
	local	playerName	= GetName( sceneId, killerId )
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{SSS_8812_04}#{_INFOUSR%s}#{SSS_8812_05}", playerName); --任平生
		AddGlobalCountNews( sceneId, str )
	end
end
