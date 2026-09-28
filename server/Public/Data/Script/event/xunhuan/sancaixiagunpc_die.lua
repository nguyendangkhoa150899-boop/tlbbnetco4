-- 三才侠谷NPC通用 001130
--**********************************
-- 君奉天QQ：137094888原创，请勿外传
--**********************************
x001130_g_DemandKillGroup = { 4, 0, 1, 2, 3 }	-- 1 ~ 5 号怪物对应的 GroupID 号，与 x001130_g_DemandKill 一一对应
x001130_g_DemandKill = {  { id = 4060, num = 50 }, { id = 4070, num = 10 }, { id = 4100, num = 1 } ,{ id = 4120, num = 1 },{ id = 4130, num = 1 } }	-- 1 ~ 5 号，怪物信息
x001130_g_DogfaceGroup = 0					-- 逃跑小兵的 Group ID
x001130_g_LittleBossGroup = 2				-- 小 Boss Group ID
x001130_g_ViceBossGroup = 1					-- 宋军副都统
x001130_g_BossGroup = 3						-- Boss Group ID
x001130_g_Token = 40004315					-- 令牌号
x001130_g_MissionId = 1260					-- 1260 - 1269
x001130_g_BroadcastMsg = {
"#Y ：#{_BOSS45}#P已经死了！他被我们的英雄#{_INFOUSR$N}#P干掉了！下一个送死的会是谁？#{_BOSS46}？还是#{_BOSS47}？哈哈！",
"#Y ：#P我们的英雄#{_INFOUSR$N}#P，从#G宋辽边境#P带来了振奋人心的消息！那个无恶不作的马匪#{_BOSS45}#P，已经被干掉了！",
"#Y ：#P大家快来看看我们的英雄！#{_INFOUSR$N}#P！一个活着的传奇，大侠中的战斗侠，哦耶！"
}

x001130_g_Param_sceneid = 6					-- 6 号：当前副本任务的场景号
x001130_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }
x001130_g_LittleBoss = { 4090, 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4098, 4099, 34090, 34091, 34092, 34093, 34094, 34095, 34096, 34097, 34098, 34099 }

--**********************************
-- 屏幕中间信息提示
--**********************************
function x001130_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x001130_OnDie( sceneId, selfId, killerId )
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end
	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态，则杀怪无效
		return
	end
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
	
	--取得杀死怪物的GroupID
	local GroupID = GetMonsterGroupID( sceneId, selfId )
	local killedMonsterIndex, killedCount = 0, 0
	if LuaFnGetCopySceneData_Param( sceneId, 21  ) ==0 then
		
		for i = 1, getn( x001130_g_DemandKillGroup ) do
			if GroupID == x001130_g_DemandKillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossi的数量
				break
			end
		end
		
		if killedMonsterIndex == 0 then		 -- 杀死了一个不相关怪
			return
		end
		if GroupID==0 and  killedCount==10   then  -----杀了十个跑的马贼怪，直接刷小BOSS
			x001130_TipAllHuman( sceneId, "伪装的宋兵都统已经出现......." )
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x001130_g_LittleBoss[bossGrade] then
				return
			end
			local bossId = LuaFnCreateMonster( sceneId, x001130_g_LittleBoss[bossGrade], 192, 59, 14, 125, 1130 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetMonsterGroupID( sceneId, bossId, 1 )
		end
		if x001130_g_BossGroup == GroupID then
			LuaFnSetCopySceneData_Param( sceneId, 21,1 )   -----设置第二关
			LuaFnSetCopySceneData_Param( sceneId, 2, 0 )
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀死Boss1的数量
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 杀死Boss2的数量
			LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 杀死Boss3的数量
			LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 杀死Boss4的数量
			LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 杀死Boss5的数量
			LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 是否杀死小 Boss
			LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 是否已经有小怪逃走
			LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- 是否已经刷出大 Boss
			x001130_TipAllHuman( sceneId, "余毒已被打败，30秒后将进入第二关，击杀红熊王" )
			local BroadcastMsg = x001130_g_BroadcastMsg[ random( getn(x001130_g_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
		end
		
		local maxKilledCount = x001130_g_DemandKill[killedMonsterIndex].num
		--取得当前场景里的人数
		local i, humanObjId, misIndex
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local strText = format( "已杀死%s： %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )
		for i = 0, num - 1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取得当前场景里人的objId
			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						-- 不在场景的不做此操作
				x001130_NotifyFailTips( sceneId, humanObjId, strText )
				Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x001130_g_MissionId )
				if killedMonsterIndex <=3 then 
				SetMissionByIndex( sceneId, humanObjId, misIndex, killedMonsterIndex, killedCount )	-- 刷新杀怪数量
				end
				-- 杀死所有怪没有放走一个则在中央大营前刷出boss[余毒],杀死后副本任务完成。(余毒身上必掉任务道具”余毒的令牌”)
			end
		end
		
		-- 杀死地图中央的小boss[伪装的宋兵都统]5秒后，在地图下方刷出10只沿路线逃窜的小怪
		if x001130_g_LittleBossGroup == GroupID then									-- 杀死了小 Boss
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 是否杀死小 Boss
		end
		
		-- 杀死所有怪没有放走一个则在中央大营前刷出boss[余毒]
		local bigBossFlag = 1
		for i = 1, 4 do
			if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x001130_g_DemandKill[i].num then
				bigBossFlag = 0
				break
			end
		end
		if bigBossFlag == 1 then
			if LuaFnGetCopySceneData_Param( sceneId, 15 ) > 0 then					-- 不需要再刷 Boss 了
				return
			end
			
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x001130_g_Boss[bossGrade] then
				return
			end
			
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			local bossId = LuaFnCreateMonster( sceneId, x001130_g_Boss[bossGrade], 195, 48, 14, 126, 1130 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetCharacterTitle(sceneId, bossId, "边境大王")
			SetMonsterGroupID( sceneId, bossId, x001130_g_BossGroup )
			LuaFnSetCopySceneData_Param( sceneId, 15, 1 )
			x001130_TipAllHuman( sceneId, "余毒已经出现在大帐前！" )
		end
		
		
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==1  then  -----第二关
		-- 广播消息
		local tow_BroadcastMsg = {
		"#Y 花剑雨：#W#{_INFOUSR$N}#P大侠真是强，一拳打扁#{_BOSS46}#P。有了#{_INFOUSR$N}#P大侠在，哪个毛贼敢倡狂？",
		"#Y 花剑雨：#W#{_INFOUSR$N}#P大侠真是行，横扫苏州小竹林。一顿胖揍捶下去，没有#G红熊#P摆不平。",
		"#Y 花剑雨：#W#{_INFOUSR$N}#P大侠真是强，侠义之名万古流。武功更是没得说，凡是#G红熊#P全爆头。"
		}
		too_DemandKill = { { id = 4120, num = 1 }, { id = 4110, num = 80 } }			-- 1 ~ 2 号，怪物信息
		too_DemandKillGroup = { 2, 1 }		-- 1 ~ 2 号怪物对应的 GroupID 号，与 too_DemandKill 一一对应
		 
		if GroupID == 2 then -- Boss Group ID
			LuaFnSetCopySceneData_Param( sceneId, 21,2)   -----设置第3关
			LuaFnSetCopySceneData_Param( sceneId, 2, 0 )
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀死Boss1的数量
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 杀死Boss2的数量
			LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 杀死Boss3的数量
			LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 杀死Boss4的数量
			LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 杀死Boss5的数量
			LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 是否杀死小 Boss
			LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 是否已经有小怪逃走
			LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- 是否已经刷出大 Boss
			local BroadcastMsg = tow_BroadcastMsg[ random( getn(tow_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			x001130_TipAllHuman( sceneId, "红熊王已被打败，30秒后将进入第三关，山寨大王即将出现......." )
		end
		
		
		local killedMonsterIndex, killedCount = 0, 0
		for i = 1, getn( too_DemandKillGroup ) do
			if GroupID == too_DemandKillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossi的数量
				break
			end
		end
		
		if killedMonsterIndex == 0 then													-- 杀死了一个不相关怪
			return
		end
		
		local maxKilledCount = too_DemandKill[killedMonsterIndex].num
		
		--取得当前场景里的人数
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local misIndex
		local strText = format( "已杀死%s： %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )
		for i = 0, num - 1 do
			mems[i + 1] = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取得当前场景里人的objId
			if LuaFnIsObjValid( sceneId, mems[i + 1] ) == 1 then						-- 不在场景的不做此操作
				x001130_NotifyFailTips ( sceneId, mems[i + 1], strText )
				Msg2Player( sceneId, mems[i + 1], strText, MSG2PLAYER_PARA )
				misIndex = GetMissionIndexByID( sceneId, mems[i + 1], x001130_g_MissionId )
				if killedMonsterIndex==2 then 
				---SetMissionByIndex( sceneId, mems[i + 1], misIndex, 6, killedCount )	-- 刷新杀怪数量
				else
				SetMissionByIndex( sceneId, mems[i + 1], misIndex, 4, killedCount )	-- 刷新杀怪数量	
				end
			end
		end
		
		if killedCount==maxKilledCount and killedMonsterIndex==2 then ---杀完所有小怪，就刷BOSS
			---红熊王
			too_Boss = { 4120, 4121, 4122, 4123, 4124, 4125, 4126, 4127, 4128, 4129, 34120, 34121, 34122, 34123, 34124, 34125, 34126, 34127, 34128, 34129 }
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			local boss_id =  too_Boss[bossGrade]
			if not too_Boss[bossGrade] then
				return
			end
			local bossId = LuaFnCreateMonster( sceneId, boss_id, 49, 42, 14, 128, 1130 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetCharacterTitle(sceneId, bossId, "菜鸡熊王")
			SetMonsterGroupID( sceneId, bossId, 2 )
			SetPatrolId( sceneId, bossId, 8 )		-- 设置巡逻路径
			if bossId >=0 then 
			x001130_TipAllHuman( sceneId, "红熊王已经出现......." )
			end
		end
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==2  then  -----第3关
		-- 广播消息
		local three_BroadcastMsg = {
		"#Y：#P告诉大家一个好消息，恶名昭彰的匪徒首领#{_BOSS47}#P，今天终于被#{_INFOUSR$N}#P打败了！大家鼓掌！",
		"#Y：#P让我们尽情的欢呼吧，匪徒首领#{_BOSS47}#P不能再为害一方了，他已经死在了#{_INFOUSR$N}#P的手中，大家欢呼吧！",
		"#Y：#{_BOSS47}#P死了！从今天起，我们再也不用提心吊胆的生活了！让我们赞美我们的英雄吧：#{_INFOUSR$N}#P，你太天才了！"
		}
		
		if GroupID == 0 then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 是否杀死匪首
			local BroadcastMsg = three_BroadcastMsg[ random( getn(three_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
		end
		
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local killedCount = 1
		local maxKilledCount = 1
		local strText = format( "已杀死%s： %d/%d", GetName( sceneId, selfId ),  killedCount, maxKilledCount )
		for i = 0, num - 1 do
			local HumanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取得当前场景里人的objId
			if LuaFnIsObjValid( sceneId, HumanObjId ) == 1 then
				local misIndex = GetMissionIndexByID( sceneId, HumanObjId, x001130_g_MissionId )
				SetMissionByIndex( sceneId, HumanObjId, misIndex, 5, killedCount )	-- 刷新杀怪数量
				SetMissionByIndex( sceneId, HumanObjId, misIndex, 0, 1 )	-- 任务完成	
          		AddMonsterDropItem( sceneId, selfId, HumanObjId , x001130_g_Token )			  
				x001130_NotifyFailTips( sceneId, HumanObjId, strText )
				Msg2Player( sceneId, HumanObjId, strText, MSG2PLAYER_PARA )
				x001130_NotifyFailTips( sceneId, HumanObjId, "任务目标完成" ) 
			end
		end
	    LuaFnSetCopySceneData_Param( sceneId, 4,1 ) ----设置离开
	end
	
end


--**********************************
--提示所有副本内玩家
--**********************************
function x001130_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
		AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end
