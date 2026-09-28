--   001129

--**********************************
-- 君奉天QQ：137094888原创，请勿外传
--**********************************
x001129_g_DemandKillGroup = { 0, 1, 2, 3, 4 }	-- 1 ~ 5 号怪物对应的 GroupID 号，与 x001129_g_DemandKill 一一对应
x001129_g_DemandKill = {  { id = 13000, num = 60 }, { id = 13020, num = 1 }, { id = 13040, num = 1 } ,{ id = 13060, num = 1 },{ id = 4130, num = 1 } }	-- 1 ~ 5 号，怪物信息
x001129_g_DogfaceGroup = 0					-- 逃跑小兵的 Group ID
x001129_g_LittleBossGroup = 2				-- 小 Boss Group ID
x001129_g_ViceBossGroup = 1					-- 宋军副都统
x001129_g_BossGroup = 3						-- Boss Group ID
x001129_g_Token = 40004315					-- 令牌号
x001129_g_MissionId = 1256					-- 1260 - 1269
x001129_g_BroadcastMsg = {
"#Y ：王阎#P已经死了！他被我们的英雄#{_INFOUSR$N}#P干掉了！下一个送死的会是谁？ ！",
"#Y ：#P我们的英雄#{_INFOUSR$N}#P，从#G宋辽边境#P带来了振奋人心的消息！那个无恶不作的王阎#P，已经被干掉了！",
"#Y ：#P大家快来看看我们的英雄！#{_INFOUSR$N}#P！一个活着的传奇，大侠中的战斗侠，哦耶！"
}

x001129_g_Param_sceneid = 6					-- 6 号：当前副本任务的场景号
x001129_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }
x001129_g_LittleBoss = { 4090, 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4098, 4099, 34090, 34091, 34092, 34093, 34094, 34095, 34096, 34097, 34098, 34099 }

--**********************************
-- 屏幕中间信息提示
--**********************************
function x001129_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x001129_OnDie( sceneId, selfId, killerId )
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
	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
	local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
	--取得杀死怪物的GroupID
	local GroupID = GetMonsterGroupID( sceneId, selfId )
	local killedMonsterIndex, killedCount = 0, 0
	----*********
	----第一关
	----*********
	if LuaFnGetCopySceneData_Param( sceneId, 21  ) ==0 then
		
		local one_KillGroup = { 0, 1, 2, 3  }	-- 1 ~ 3号怪物对应的 GroupID 号，与 one_DemandKill 一一对应
		local one_DemandKill = {  { id = "小兵", num = 60 },  { id = "牛曲和牛奇", num = 1 },{ id = "牛曲和牛奇", num = 1 }, { id = "王阎", num = 1 } }	-- 1 ~ 4 号，怪物信息
		for i = 1, getn( one_KillGroup ) do
			if GroupID == one_KillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossi的数量
				break
			end
		end
		if killedMonsterIndex == 0 then		 -- 杀死了一个不相关怪
			return
		end
		local maxKilledCount = one_DemandKill[killedMonsterIndex].num
		x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
		if GroupID == one_KillGroup[4] then
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
			x001129_TipAllHuman( sceneId, "王阎已被打败，30秒后将进入第二关，请前往（57.81） " ,1)
			local BroadcastMsg = x001129_g_BroadcastMsg[ random( getn(x001129_g_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			return
		end
		if  LuaFnGetCopySceneData_Param( sceneId, 7  )==60  and  LuaFnGetCopySceneData_Param( sceneId, 8  )==1   and  LuaFnGetCopySceneData_Param( sceneId, 9  )==1   then  -----杀死了两只BOSS就刷王阎
			x001129_TipAllHuman( sceneId, "10秒王阎将出现在坐标（90，183）......." )
			LuaFnSetCopySceneData_Param( sceneId, 12,1 ) ---设置刷王阎的天关
		end

	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==1  then  -----第二关
		local two_KillGroup = { 0, 1, 2 }
		local two_DemandKill ={ { id = "毒障小怪", num = 15 }, { id = "小BOSS", num = 1} , { id = "终极BOSS", num = 1}  }
		for i = 1, getn( two_KillGroup ) do
			if GroupID == two_KillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossi的数量
				break
			end
		end
		
		if killedMonsterIndex == 0 then		 -- 杀死了一个不相关怪
			return
		end
		local maxKilledCount = two_DemandKill[killedMonsterIndex].num
		x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
		if LuaFnGetCopySceneData_Param( sceneId, 7 ) ==15 and LuaFnGetCopySceneData_Param( sceneId, 8 ) ==1 then
			local boshu =  LuaFnGetCopySceneData_Param( sceneId, 14 )
			LuaFnSetCopySceneData_Param( sceneId, 14,boshu+1)
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀死Boss1的数量
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )
			local boshu_str = {
			[0]="裂地行者即将出现......请作好准备." ,
			[1]="五毒魔使即将出现......请作好准备......." ,
			[2]="武玄将即将出现......请作好准备......." ,
			[3]="破焰尊者即将出现......请作好准备......." ,
			[4]="第二关最后一个BOSS洪棘妖王即将出现在（56，56）请作好准备......." ,
             } 
			if boshu_str[boshu]  ~= nil then 
			x001129_TipAllHuman( sceneId, boshu_str[boshu]  )	
			end 	 
		end
		if GroupID == 2 then -- Boss Group ID
			-- 广播消息
			local tow_BroadcastMsg = {
			"#Y 花剑雨：#W#{_INFOUSR$N}#P大侠真是强，一拳打扁洪棘妖王#P。有了#{_INFOUSR$N}#P大侠在，哪个毛贼敢倡狂？",
			"#Y 花剑雨：#W#{_INFOUSR$N}#P大侠真是行，横扫炎魔山 。一顿胖揍捶下去，没有#G洪棘妖王#P摆不平。",
			"#Y 花剑雨：#W#{_INFOUSR$N}#P大侠真是强，侠义之名万古流。武功更是没得说，凡是#G洪棘妖王#P全爆头。"
			}
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
			x001129_TipAllHuman( sceneId, "洪棘妖王已被打败，30秒后将进入第三关，火焰妖魔即将出现（210，40）....." ,2)
		end
		
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==2  then  -----第3关
		-- 广播消息
		local three_BroadcastMsg = {
		"#Y：#P告诉大家一个好消息，恶名昭彰的匪徒首领【火焰妖魔】#P，今天终于被#{_INFOUSR$N}#P打败了！大家鼓掌！",
		"#Y：#P让我们尽情的欢呼吧，匪徒首领【火焰妖魔】不能再为害一方了，他已经死在了#{_INFOUSR$N}#P的手中，大家欢呼吧！",
		"#Y：【火焰妖魔】#P死了！从今天起，我们再也不用提心吊胆的生活了！让我们赞美我们的英雄吧：#{_INFOUSR$N}#P，你太天才了！"
		}
		
		if GroupID == 0 then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 是否杀死匪首
			local BroadcastMsg = three_BroadcastMsg[ random( getn(three_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			x001129_TipAllGongGao( sceneId,selfId, 1, 1 )
			x001129_TipAllHuman( sceneId, "任务完成" ,3)
			LuaFnSetCopySceneData_Param( sceneId, 4,1 ) ----设置离开
		end
		
	end
	
end


--**********************************
--提示所有副本内玩家
--**********************************
function x001129_TipAllHuman( sceneId, Str ,misIndex_num  )
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
		if 	misIndex_num ~=nil  then
			local misIndex = GetMissionIndexByID( sceneId, PlayerId, x001129_g_MissionId )
			SetMissionByIndex( sceneId, PlayerId, misIndex, misIndex_num, 1 )	-- 刷新杀怪数量
			if misIndex_num ==3 then
				SetMissionByIndex( sceneId, PlayerId, misIndex, 0, 1 )	-- 任务完成
			end
		end
	end
end


--**********************************
--提示所有副本内玩家
--**********************************
function x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	if num < 1 then
		return
	end
	local strText = format( "已杀死%s： %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )
	for i = 0, num - 1 do
		local PlayerId= LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取得当前场景里人的objId
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 then
    		BeginEvent(sceneId)
	        AddText(sceneId, strText)
		    EndEvent(sceneId)
		    DispatchMissionTips(sceneId, PlayerId)			   
		end
	end
	
end