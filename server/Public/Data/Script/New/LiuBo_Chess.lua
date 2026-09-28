--脚本号
x502019_g_scriptId = 502019 --临时写这个,真正用的时候一定要改.

function x502019_Tips( sceneId, selfId,msg )
BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--事件交互入口
--**********************************
function x502019_OnDefaultEvent( sceneId, selfId )

end
--**********************************
--只会执行一次入口：
--返回1：处理成功；返回0：处理失败。
--**********************************
function x502019_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	if itemTblIndex== 40004571 then
		local Chess = "宋棋：兵"
		local Add = 1
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)

	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
             if LiuBoQiHe < 1 then
		x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		return 0
	     end

		if floor(mod(TeamData,Add*10)/Add) >= 5 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end
	

	if itemTblIndex== 40004572 then
		local Chess = "宋棋：馬"
		local Add = 10
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)
	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end

		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004573 then
		local Chess = "宋棋：砲"
		local Add = 100
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)
 	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end

		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004574 then
		local Chess = "宋棋：車"
		local Add = 1000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004575 then
		local Chess = "宋棋：相"
		local Add = 10000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004576 then
		local Chess = "宋棋：仕"
		local Add = 100000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004577 then
		 local Chess = "宋棋：帥"
		local Add = 1000000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_SONG)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 1 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_SONG,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004578 then
		local Chess = "辽棋：卒"
		local Add = 1
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 5 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end
	

	if itemTblIndex== 40004579 then
		local Chess = "辽棋：馬"
		local Add = 10
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004580 then
		local Chess = "辽棋：炮"
		local Add = 100
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004581 then
		local Chess = "辽棋：車"
		local Add = 1000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004582 then
		local Chess = "辽棋：象"
		local Add = 10000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004583 then
		local Chess = "辽棋：士"
		local Add = 100000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 2 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end


	if itemTblIndex== 40004584 then
		local Chess = "辽棋：将"
		local Add = 1000000
	        local LiuBoQiHe = LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
                local TeamData = GetMissionData(sceneId,selfId,MD_CHESS_LIAO)

		   	
		   if LiuBoQiHe < 1 then
		      x502019_Tips( sceneId, selfId, "你没有[六博棋盒],不能注入棋子！" )
		      return 0;
		   end
		
		if floor(mod(TeamData,Add*10)/Add) >= 1 then
		   x502019_Tips( sceneId, selfId, "此枚棋子已收集完成，请尽快收集其他棋子！" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
		   return
                else
                   SetMissionData(sceneId,selfId,MD_CHESS_LIAO,TeamData+Add)
		   x502019_Tips( sceneId, selfId,"恭喜您成功注入了  "..(Chess).."。" )
		   DelItem( sceneId, selfId, itemTblIndex, 1 )	--删除物品
	           CallScriptFunction( 502018, "OnDefaultEvent", sceneId,selfId,targetId)
		   return
                end
	end
	
end
--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x502019_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x502019_OnDeplete( sceneId, selfId )
	return 1
end


--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x502019_OnConditionCheck( sceneId, selfId )
	return 1
end
--**********************************
-- 
--**********************************
function x502019_IsSkillLikeScript( sceneId, selfId)
	return 1
end
function x502019_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
