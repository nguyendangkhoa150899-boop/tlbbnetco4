--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现


--脚本:

--以下是脚本样例:


--4918.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x335809_g_scriptId = 335809 --临时写这个,真正用的时候一定要改.

--需要的等级
x335809_g_levelRequire = 1
--AE范围半径
x335809_g_radiusAE = 3.0
--AE的目标关系标记
x335809_g_standFlag = 1 -- 2:队友， 1：友军， -1：敌军
--AE影响数目限制
x335809_g_effectCount = 4 -- -1:不限制
--效果的ID
x335809_g_Impact1 = 4918 --临时写这个
x335809_g_Impact2 = -1 --不用

--**********************************
--事件交互入口
--**********************************
function x335809_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335809_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335809_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335809_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(0<=targetId) then
		-- 目标必须是友军的检测
		if LuaFnIsFriend(sceneId, targetId, selfId) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
		if LuaFnIsFriend(sceneId, selfId, targetId ) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
    local SelfSex = LuaFnGetSex(sceneId, selfId)
    local TargetSex = LuaFnGetSex(sceneId, targetId)                
    if( SelfSex == TargetSex ) then
      LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
      
      return 0;                                            
    end 
       
		-- 目标必须是敌军的检测
--		if(1~=LuaFnUnitIsEnemy(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- 目标必须是队友的检测
--		if(1~=LuaFnUnitIsPartner(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- 目标级别的检测
--		if(g_LevelRequire<=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
--		if(g_LevelRequire>=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end

	end
	
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335809_OnDeplete( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x335809_MsgBox( sceneId, selfId, "你没有足够的背包空间" )
		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, targetId ) < 1 then
		x335809_MsgBox( sceneId, selfId, "对方没有足够的背包空间" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509087);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local szNameSelf = GetName( sceneId, selfId );
	local szNameTarget = GetName( sceneId, targetId );
	
	local randMessage = random(3);
	local message;

	--if randMessage == 1 then
	--	message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_00}#{_INFOMSG%s}#{GiveRose_01}#{_INFOUSR%s}#{GiveRose_02}", szNameSelf, szTransfer, szNameTarget );
	--elseif randMessage == 2 then		
	--	message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_04}#{_INFOUSR%s}#{GiveRose_05}", szNameSelf, szTransfer, szNameTarget );
	--else		
	--	message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_06}#{_INFOUSR%s}#{GiveRose_07}", szNameSelf, szTransfer, szNameTarget );
	--end
	
	--AddGlobalCountNews( sceneId, message )
			
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x335809_OnActivateOnce( sceneId, selfId )
	if(-1~=x335809_g_Impact1) then
		--给自己加效果
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x335809_g_Impact1, 0);
		--给目标加效果
		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
		if(0<=targetId) then
			if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x335809_g_Impact1, 0);
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 99, 0);
				
				local nFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, targetId );
				if nFriendPoint >= 99999 then
			
					BeginEvent(sceneId)
						AddText(sceneId, "你与对方的好友度已经到达上限。");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
				
				--else
				
					--BeginEvent(sceneId)
					--AddText(sceneId, "");
					--EndEvent(sceneId)
					--DispatchMissionTips(sceneId,selfId)
					
				end
			  
			  local	namSelf		= GetName( sceneId, selfId )
			  local	namTarget	= GetName( sceneId, targetId )
			

			--给对方用光效
			LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 18, 0);			

					  
			  --奖励
				local	lstBounty	=
				{
					[0]	= { 20310195,	228, "玫瑰之恋" },		--女装
					[1]	= { 20310195,	227, "玫瑰之恋" },				--男装
				}
			  local	untBounty
			  if GetSex( sceneId, selfId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, selfId, untBounty[1], 1 ) >= 0 then
			  	x335809_MsgBox( sceneId, selfId, "你得到了一件"..GetItemName( sceneId, untBounty[1] ) )
			  end
				AwardTitle( sceneId, selfId, 8, untBounty[2] )
				LuaFnDispatchAllTitle( sceneId, selfId )		--更新所有称号到CLIENT
			  --x335809_MsgBox( sceneId, selfId, "你得到了["..untBounty[3].."]称号。" )
			  --x335809_MsgBox( sceneId, selfId, "你的痴情与豪气使然,情圣值增加了1点" )
		 SetMissionData( sceneId, selfId, QUANQUSONGHUA,GetMissionData( sceneId, selfId,QUANQUSONGHUA)+1)	
	     local mylevel1 = GetMissionData(sceneId, selfId, QUANQUSONGHUA)
	     CallScriptFunction( (888899), "SetDengji", sceneId, selfId,mylevel1,2 )


		       local allfirstplayer = GetPaiming(sceneId,2)
	        	 local nMonsterNum = GetMonsterCount(sceneId)
	         for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				local MosDataID = GetMonsterDataID(sceneId, MonsterId )
				if MosDataID == 43539 then
				 SetCharacterName(sceneId,MonsterId,"#G"..allfirstplayer[1].Guid)
		        end
	        end	



			  if GetSex( sceneId, targetId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			  	x335809_MsgBox( sceneId, targetId, "你得到了一件"..GetItemName( sceneId, untBounty[1] ) )
			  end
			  AwardTitle( sceneId, targetId, 8, untBounty[2] )
			  LuaFnDispatchAllTitle( sceneId, targetId )	--更新所有称号到CLIENT
			  --x335809_MsgBox( sceneId, targetId, "你得到了["..untBounty[3].."]称号。" )
			  --x335809_MsgBox( sceneId, targetId, "你的美丽与帅气使然,玫瑰值增加了1点" )
			
			SetMissionData( sceneId,  targetId, QUANQUSHOUHUA ,GetMissionData( sceneId,  targetId,QUANQUSHOUHUA )+1)	
	        local mylevel =  GetMissionData(sceneId,  targetId, QUANQUSHOUHUA )
	      CallScriptFunction( (888899), "SetDengji", sceneId,  targetId,mylevel,6 )


		       local allfirstplayer = GetPaiming(sceneId,6)
	        	 local nMonsterNum = GetMonsterCount(sceneId)
	         for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				local MosDataID = GetMonsterDataID(sceneId, MonsterId )
				if MosDataID == 43540 then
				 SetCharacterName(sceneId,MonsterId,"#G"..allfirstplayer[1].Guid)
		        end
	        end	
			
			end
		end
		--自己周围AE
--		local posX,posZ = LuaFnGetUnitPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x335809_g_radiusAE, x335809_g_standFlag, x335809_g_levelRequire, x335809_g_effectCount, x335809_g_Impact1, 0)
		--指定地点周围AE
--		local posX,posZ = LuaFnGetTargetPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x335809_g_radiusAE, x335809_g_standFlag, x335809_g_levelRequire, x335809_g_effectCount, x335809_g_Impact1, 0)
		--目标个体周围AE
--		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
--		if(0<=targetId) then
--			local posX,posZ = LuaFnGetUnitPosition(sceneId, targetId)
--			LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x335809_g_radiusAE, x335809_g_standFlag, x335809_g_levelRequire, x335809_g_effectCount, x335809_g_Impact1, 0)
--		end

	end
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335809_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
--醒目提示
--**********************************
function x335809_MsgBox( sceneId, selfId, Msg )
	if Msg == nil then
		return
	end
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
