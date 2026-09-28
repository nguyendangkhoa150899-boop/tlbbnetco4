--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--obj_71.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x889822_g_scriptId = 889822 --临时写这个,真正用的时候一定要改.

--需要的等级

--效果的ID
x889822_g_Impact1 = 33600 --临时写这个
x889822_g_Impact2 = -1 --不用
x889822_g_SpecailObj = 94--

--**********************************
--事件交互入口
--**********************************
function x889822_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889822_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889822_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889822_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意?赫獠还飧涸鹣牡募觳庖哺涸鹣牡闹葱小?
--**********************************
function x889822_OnDeplete( sceneId, selfId )
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x889822_OnActivateOnce( sceneId, selfId )

        local HetiBuff = GetMissionData(sceneId, selfId, HETI_BUFF ) 
        local HetiType = 0 
        if HetiBuff >= 1401 and HetiBuff <= 1409 then
           HetiType = 1 
        elseif HetiBuff >= 1410 and HetiBuff <= 1418 then
           HetiType = 2 
        elseif HetiBuff >= 1419 and HetiBuff <= 1427 then
           HetiType = 3 
        elseif HetiBuff >= 1428 and HetiBuff <= 1436 then
           HetiType = 4 
        end

	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  UICommand_AddInt( sceneId, HetiType )
	  EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  20150630)

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x889822_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
--融魂成功扣除物品：
--**********************************
function x889822_OnImpactFadeOut(sceneId,selfId,maket)

       local myitem = LuaFnDelAvailableItem(sceneId,selfId,30503185,1)

       if myitem  <  1 then   --锁定了
	  BeginEvent( sceneId )
		AddText( sceneId, "融魂丹扣除失败，附体特效未改变！" )
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, selfId )
          return
       else
          SetMissionData(sceneId, selfId, HETI_BUFF, maket) 
	  BeginEvent( sceneId )
		AddText( sceneId, "融魂成功，附外观已改变，请在珍兽界面重新附体即可。" )
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, selfId )
       end
end

