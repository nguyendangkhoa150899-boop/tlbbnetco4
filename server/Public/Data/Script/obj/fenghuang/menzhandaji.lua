--圣兽山宝箱争夺

--脚本号
x900052_g_ScriptId	= 900052

--NPC大宝箱
x900052_g_BigBox = {

	Name			= "祭旗台",
	MonsterID	= 45465,
	PosX			= 162,
	PosY			= 161,
	ScriptID	= 900039

}

x900052_g_MonsterLifeTime = 1800000
--**********************************
--事件交互入口
--**********************************
function x900052_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
    if actId == 97 then
	x900052_actShow( sceneId)
	return
	end
	--不管是否创建新的大宝箱都发公告....
	local message = format("@*;SrvMsg;SCA:#P凤凰古城，谁与争锋！#Y凤凰古城争夺战#P已经开始，各大帮会，狭路相逢，谁是真正的霸主，谁能统领武林群雄，尽在今晚#Y凤凰古城争夺战#P！您可以从#G束河古镇(150，152)#Y李野#P处进入#G凤凰古城#P或点击#R确定#P传到束河古镇。" )
	AddGlobalCountNews( sceneId, message )

	--雷电交加天气效果....
	local curWeather = LuaFnGetSceneWeather(sceneId)
	if not curWeather or curWeather ~= -1 then
		--已经有天气了则不改变天气....
	else
		LuaFnSetSceneWeather(sceneId, 3, 5*60*1000 )
	end
	if x900052_g_IsBigBoxOpening == nil then
	x900052_g_IsBigBoxOpening = 0
	end
	if x900052_g_PlayerOpeningTime == nil then
	x900052_g_PlayerOpeningTime = 0
	end
	--如果已经有了就不再创建新的大宝箱....
	if CallScriptFunction((900014), "GetMonsterIDToObj",sceneId, x900052_g_BigBox.MonsterID) ~= -1 then
		return
	end

	--没有则创建NPC大宝箱....
	local MstId = LuaFnCreateMonster(sceneId, x900052_g_BigBox.MonsterID, x900052_g_BigBox.PosX, x900052_g_BigBox.PosY, 3, 0, x900052_g_BigBox.ScriptID )
	SetCharacterName( sceneId, MstId, x900052_g_BigBox.Name )
	SetCharacterDieTime(sceneId, MstId, x900052_g_MonsterLifeTime)
	maxtmname = nil 
	maxtmjifen = nil
	for i = 0,31 do
    LuaFnSetCopySceneData_Param( sceneId, i, 0 )
    end
end
--**********************************
--活动前15分钟....
--**********************************
function x900052_actShow( sceneId)
	--不管是否创建新的大宝箱都发公告....
	local message = format("@*;SrvMsg;SCA:#P凤凰古城#Y，争夺战将在15分钟后进行，请各同盟做好准备！！" )
	AddGlobalCountNews( sceneId, message )
	for i = 0,31 do
    LuaFnSetCopySceneData_Param( sceneId, i, 0 )
    end
end
--**********************************
--检测是否可以打开大宝箱....
--**********************************
function x900052_CheckOpenBigBox( sceneId, selfId )
	--宝箱是否存在....
	if x900052_g_IsBigBoxExist == nil then
	x900052_g_IsBigBoxExist = 0
	end
    if x900052_g_OpeningPlayerName == nil then
	x900052_g_OpeningPlayerName = "(ERROR)"
	end
	if x900052_g_IsBigBoxOpening == nil then
	x900052_g_IsBigBoxOpening = 0
	end
	if x900052_g_PlayerOpeningTime == nil then
	x900052_g_PlayerOpeningTime = 0
	end
	--如果有人正在开大宝箱....
	if x900052_g_IsBigBoxOpening == 1 then
		--如果是自己在开....
		if x900052_g_OpeningPlayerName == LuaFnGetName( sceneId, selfId ) then
			return 1, "(ERROR)"
		end
     local   GuildLeagueID  = LuaFnGetHumanGuildLeagueID( sceneId, selfId )
	 local	GuildName	= LuaFnGetHumanGuildLeagueName( sceneId, selfId )
	--检测背包是否有地方....
	if GuildLeagueID == -1 or  GuildName =="" then
		BeginEvent(sceneId)
			AddText( sceneId, "您没有同盟不能祭旗" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	      end
	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )

            if MosDataID == 45464 then
        local a,b = GetWorldPos( sceneId, MonsterId )
        local x,z = floor(a),floor(b)
		local MosDataName = GetName( sceneId, MonsterId )
           if ""..GuildName.."同盟大旗" ~= MosDataName then
		BeginEvent(sceneId)
		 		AddText(sceneId,"注意：["..MosDataName.."]为可移动大旗，["..MosDataName.."] 已经祭起现在的坐标为("..x..","..z.."),你得击败["..MosDataName.."]后，才能祭旗");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
                else
		BeginEvent(sceneId)
		 		AddText(sceneId,"您的同盟大旗已经祭起，不能重复祭旗。注意：["..MosDataName.."]为可移动大旗已经祭起现在的坐标为("..x..","..z..")，距离["..MosDataName.."]10米范围内的同盟成员越多得到的奖励越多");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end
        end
	end
		--如果是别人在开并且他已经超时了....则让位给我来开....
		local NowTime = LuaFnGetCurrentTime()
		if x900052_g_OpeningPlayerName ~= LuaFnGetName( sceneId, selfId ) then
		if (NowTime - x900052_g_PlayerOpeningTime) > 150 then
			x900052_g_PlayerOpeningTime = NowTime
			x900052_g_OpeningPlayerName = LuaFnGetName( sceneId, selfId )
			return 1, x900052_g_OpeningPlayerName
		else
			return -1, x900052_g_OpeningPlayerName
		end
		return
		end

	end

	--没有人在开大宝箱....
	x900052_g_IsBigBoxOpening = 1
	x900052_g_PlayerOpeningTime = LuaFnGetCurrentTime()
	x900052_g_OpeningPlayerName = LuaFnGetName( sceneId, selfId )
	return 1, x900052_g_OpeningPlayerName

end

--**********************************
--玩家开大宝箱被打断事件(由大宝箱脚本调用)....
--**********************************
function x900052_OnCancelOpen( sceneId )

	x900052_g_IsBigBoxOpening = 0
	x900052_g_OpeningPlayerName = "(ERROR)"
	x900052_g_PlayerOpeningTime = 0

end

--**********************************
--大宝箱被打开事件(由大宝箱脚本调用)....
--**********************************
function x900052_OnBigBoxOpen( sceneId, selfId, activatorId )
                local   GuildLeagueID  = LuaFnGetHumanGuildLeagueID( sceneId, activatorId )
	        local	GuildName	= LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
	--检测背包是否有地方....
	if GuildLeagueID == -1 or  GuildName =="" then
		BeginEvent(sceneId)
			AddText( sceneId, "您没有同盟不能祭旗" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )

            if MosDataID == 45464 then
        local a,b = GetWorldPos( sceneId, MonsterId )
        local x,z = floor(a),floor(b)
		local MosDataName = GetName( sceneId, MonsterId )
           if ""..GuildName.."同盟大旗" ~= MosDataName then
		BeginEvent(sceneId)
		 		AddText(sceneId,"注意：["..MosDataName.."]为可移动大旗，["..MosDataName.."] 已经祭起现在的坐标为("..x..","..z.."),你得击败["..MosDataName.."]后，才能祭旗");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
                else
		BeginEvent(sceneId)
		 		AddText(sceneId,"您的同盟大旗已经祭起，不能重复祭旗。注意：["..MosDataName.."]为可移动大旗已经祭起现在的坐标为("..x..","..z..")，距离["..MosDataName.."]10米范围内的同盟成员越多得到的奖励越多");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
        end
	end
	local missmytongmen,wobang = -1,-1
	local myGuildLeagueName = LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
	local   myGuildLeagueID  = LuaFnGetHumanGuildLeagueID( sceneId, activatorId )
    for i = 0,7 do
	wobang = LuaFnGetCopySceneData_Param(sceneId,i)
	wobang = mod(wobang,10000)
	if wobang == myGuildLeagueID + 1 then
	missmytongmen = i
	end
	end
	if missmytongmen == -1 then
	BeginEvent(sceneId)
	AddText( sceneId, "没有同盟不能祭旗" )
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,activatorId)
	return 0
	end
	wobang = LuaFnGetCopySceneData_Param(sceneId,missmytongmen)
	findmenid = mod(wobang,10000)
	denfen = floor(wobang/10000)+3
	if maxtmname == nil and maxtmjifen == nil then
    maxtmname = LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
    maxtmjifen = denfen
    else
	if maxtmname == myGuildLeagueName then
	maxtmjifen =denfen
	else
	if denfen > maxtmjifen then
	maxtmname = LuaFnGetHumanGuildLeagueName( sceneId, activatorId )
    maxtmjifen = denfen
	end
    end	
	end
	LuaFnSetCopySceneData_Param(sceneId,missmytongmen,denfen*10000+findmenid)

	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 169, 0);
          local senying =  GetUnitCampID(sceneId,activatorId,activatorId)
          local	PlayerX = GetHumanWorldX(sceneId,activatorId)
          local	PlayerZ = GetHumanWorldZ(sceneId,activatorId)
	local MstId = LuaFnCreateMonster(sceneId, 45464, 161, 160, 3, 0, -1)----45464
	if myGuildLeagueID + 10000 ~= senying then
	SetUnitCampID(sceneId, activatorId, activatorId, myGuildLeagueID + 10000 )
	senying = myGuildLeagueID + 10000
	end
	SetCharacterName( sceneId, MstId, ""..myGuildLeagueName.."同盟大旗" )
	SetCharacterDieTime(sceneId, MstId, 7200000)
    SetUnitCampID(sceneId,MstId, MstId,senying)
	SetPatrolId(sceneId, MstId, 0)
	--公告....
	--用3号来做祭过旗的帮会数量，4号为第一个祭旗的同盟的分数记录，5号是第一个祭旗的同盟ID

	local PlayerName = GetName(sceneId, activatorId)
	string = format( "@*;SrvMsg;SCA:#G凤凰古城#P战场上#W#{_INFOUSR%s}#P力排万难，终于将#Y ["..myGuildLeagueName.."同盟大旗] #P升起，只要在#W凤凰古城#Y战场的#G同盟#Y将得到大量的奖励", PlayerName )
	BroadMsgByChatPipe( sceneId, activatorId, string, 4 )
	--统计....
	LuaFnAuditShengShouOpenBigBox(sceneId, activatorId)
	x900052_g_IsBigBoxOpening = 0
	x900052_g_OpeningPlayerName = "(ERROR)"
	x900052_g_PlayerOpeningTime = 0

end

