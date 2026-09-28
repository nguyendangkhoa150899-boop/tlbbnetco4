--使用配方的脚本

--脚本号
x502019_g_scriptId = 502019

x502019_g_Chess = {}
--**********************************************************
--宋棋：兵马炮车相士帅
--**********************************************************
x502019_g_Chess[30308200] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 1 }
x502019_g_Chess[30308201] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 1 }
x502019_g_Chess[30308202] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 1 }


x502019_g_Chess[40004571] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 1 }
x502019_g_Chess[40004572] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 10 }
x502019_g_Chess[40004573] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 100 }
x502019_g_Chess[40004574] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 1000 }
x502019_g_Chess[40004575] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 10000 }
x502019_g_Chess[40004576] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 100000 }
x502019_g_Chess[40004577] = {TeamId = MD_CHESS_SONG, NeedNum = 5, AddNum = 1000000 }

--**********************************************************
--宋棋：卒马炮车象士将
--**********************************************************
x502019_g_Chess[40004578] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 1 }
x502019_g_Chess[40004579] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 10 }
x502019_g_Chess[40004580] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 100 }
x502019_g_Chess[40004581] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 1000 }
x502019_g_Chess[40004582] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 10000 }
x502019_g_Chess[40004583] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 100000 }
x502019_g_Chess[40004584] = {TeamId = MD_CHESS_LIAO, NeedNum = 5, AddNum = 1000000 }

--**********************************
-- 返回1：技能类似的物品，可以继续类似技能的执行；返回0：执行 OnDefaultEvent。
--**********************************
function x502019_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x502019_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x502019_OnConditionCheck( sceneId, selfId )
	-- 校验使用的物品
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end

	-- 找到相应条目
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local ChessItem = x502019_g_Chess[itemTblIndex]
	if not ChessItem then
		return 0
	end

	-- 找到六博棋盒
	local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
        if LiuBoQiHe < 1 then
		x502019_NotifyFailTips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		return 0
	end

	-- 棋子是否满了
	if ChessItem.NeedNum ~= -1 then
           local TeamData = GetMissionData(sceneId,selfId,ChessItem.TeamId)
           local MyChessData = floor(mod(TeamData,10)/ChessItem.AddNum)

                 if MyChessData >= ChessItem.NeedNum
		    x502019_NotifyFailTips( sceneId, selfId, "此枚棋子已收集完成，无需再注入！" )
		    return 0
	         end
        end

    return 1
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x502019_OnDeplete( sceneId, selfId )
	if LuaFnDepletingUsedItem( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x502019_OnActivateOnce( sceneId, selfId )
	-- 找到相应条目
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local ChessItem = x502019_g_Chess[itemTblIndex]
	if not ChessItem then
		return 0
	end

	if ChessItem.NeedNum ~= -1 then
           local TeamData = GetMissionData(sceneId,selfId,ChessItem.TeamId)
           local MyChessData = floor(mod(TeamData,10)/ChessItem.AddNum)
                 if MyChessData >= ChessItem.NeedNum
		    x502019_NotifyFailTips( sceneId, selfId, "此枚棋子已收集完成，无需再注入！" )
		    return 0
	         else
                    SetMissionData( sceneId, selfId, ChessItem.TeamId ,TeamData+ChessItem.AddNum)
		    x502019_NotifyFailTips( sceneId, selfId, "棋子注入成功！" )

                    local aaaa = GetMissionData(sceneId,selfId,MD_CHESS_SONG)
                    local bbbb = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)
	            BeginUICommand(sceneId)
	            UICommand_AddInt( sceneId, aaaa )      
	            UICommand_AddInt( sceneId, bbbb )      
	            EndUICommand(sceneId)
	            DispatchUICommand(sceneId,selfId, 502018)
	         end
        end

        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能心跳时生效的入口
--**********************************
function x502019_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
-- 醒目失败提示
--**********************************
function x502019_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
