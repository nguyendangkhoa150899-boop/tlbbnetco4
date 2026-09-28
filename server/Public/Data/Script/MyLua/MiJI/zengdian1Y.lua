--作者: 虚幻 11:30 2013-11-15 QQ：2636158793

x890100_g_scriptId = 890100
x890100_g_sitem = {}
x890100_g_sitem[30311001]={850,851,852}
x890100_g_sitem[30311003]={853,854,855}
x890100_g_sitem[30311005]={856,857,858}
x890100_g_sitem[30311007]={859,860,861}
x890100_g_sitem[30311009]={862,863,864}
x890100_g_sitem[30311011]={865,866,867}
x890100_g_sitem[30311013]={868,869,870}
x890100_g_sitem[30311015]={871,872,873}
x890100_g_sitem[30311017]={874,875,876}
x890100_g_sitem[30311019]={877,878,879}
x890100_g_sitem[30311021]={880,881,882}
x890100_g_sitem[30311023]={883,884,885}
x890100_g_sitem[30311025]={886,887,888}
x890100_g_sitem[30311027]={889,890,891}
x890100_g_sitem[30311029]={892,893,894}
x890100_g_sitem[30311031]={895,896,897}
x890100_g_sitemmiss = {2,5,3,4,1,2,5,3,4,1,3,4,1,3,4,1}
x890100_g_sitem1 = {30311001,30311003,30311005,30311007,30311009,30311011,30311013,30311015,30311017,30311019,30311021,30311023,30311025,30311027,30311029,30311031}
x890100_g_wujuemijitoxingdenum = {WULIMIJIXUEJUEBOOK1,WULIMIJIXUEJUEBOOK2,WULIMIJIXUEJUEBOOK3}

--**********************************
--事件交互入口

--**********************************
function x890100_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x890100_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x890100_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x890100_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	local i = 1
	while  GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x890100_g_sitem1[i] do
	i = i + 1
	if i > 31 then
	break
	end
	end
	if x890100_g_sitem1[i] == nil then
	x890100_ShowNotice( sceneId, selfId, "背包内部错误！！" )
	return 0
	end
	if GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x890100_g_sitem1[i] then
	x890100_ShowNotice( sceneId, selfId, "背包内部错误！！" )
	return 0
	end
	-----local wujuemenpai = floor(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE )/1000000)
	local wujuemenpai = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),1000000)
	local skillbook1 = floor(wujuemenpai/10000)
        local skillbook2 = floor(mod(wujuemenpai,10000)/100)
	local xuejimijinum = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),100)
	local booklistacc = {skillbook1,skillbook2,xuejimijinum}
	-----if  wujuemenpai ~= x890100_g_sitemmiss[i] then
	-----local Menpaimis = {"佛宗","气宗","剑宗","魔宗","儒宗"}
	-----x890100_ShowNotice( sceneId, selfId, "请先拜入五绝中的"..Menpaimis[x890100_g_sitemmiss[i]]..",才能学习此书" )
	-----return 0
	-----end
	local bookisokitem = 1
	for i = 1,3 do
	if booklistacc[i] == nil then
	booklistacc[i] = -1
	end  
	if mod(GetItemTableIndexByIndex(sceneId, selfId, bagId),100) == booklistacc[i] and bookisokitem == 1 then
	bookisokitem = 0
	break
	end
	end
	if bookisokitem == 0 then
	x890100_ShowNotice( sceneId, selfId, "您已经学过了此武林秘籍，请不要重复学习！！" )
	return 0
	end
	local nostudeybook = 0
	for i = 1,3 do
	if booklistacc[i] == nil then
	   booklistacc[i] = 1
	end   
	if booklistacc[i] <= 0 and nostudeybook == 0 then
	nostudeybook = 1
	break
	end
	end
	if nostudeybook == 0 then
	x890100_ShowNotice( sceneId, selfId, "您所学的武林秘籍数已经超过3本，请先遗忘再学习！！" )
	return 0
	end
	if GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x890100_g_sitem1[i]  then

		return 0
	end
	
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		return 0
	end		
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x890100_OnDeplete( sceneId, selfId )

	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	local i = 1
	while  GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x890100_g_sitem1[i] do
	i = i + 1
	if i > 31 then
	break
	end
	end
	if x890100_g_sitem1[i] == nil then
	x890100_ShowNotice( sceneId, selfId, "背包内部错误！！" )
	return 0
	end
	if GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x890100_g_sitem1[i]  then
		return 0
	end
        x890100_itemMISS( sceneId, selfId, GetItemTableIndexByIndex(sceneId, selfId, bagId),1)
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x890100_OnActivateOnce( sceneId, selfId )
      local ret = x890100_itemMISS( sceneId, selfId, 0,2)
      if ret == 0 then
      return
      end

      for i = 1,3 do
      AddSkill( sceneId, selfId, x890100_g_sitem[ret][i] )
      end
      local jisumiji = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),1000000)
      --local skillbook1 = floor(jisumiji/10000)
      --local skillbook2 = floor(mod(jisumiji,10000)/100)
      --local skillbook3 = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),100)

      local Xieziskillbook1 = floor(jisumiji/10000)
      local Xieziskillbook2 = floor(mod(jisumiji,10000)/100)
      local Xieziskillbook3 = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),100)

      --local booklistacc = {skillbook1,skillbook2,skillbook3}
      local booklistacc = {Xieziskillbook1,Xieziskillbook2,Xieziskillbook3}

      local valuenumid = {10000,100,1}
      local bookispos = 0
      
      for i = 1,3 do
      if booklistacc[i] == nil then
         booklistacc[i] = 0
      end   
      if booklistacc[i] == 0 and bookispos == 0 then
      	bookispos = i
      	break
      end
      end
      if bookispos == 0 then
      x890100_ShowNotice( sceneId, selfId, "数据错误无法学习技能" )
      return  0
      end	
      SetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE,mod(ret,100)*valuenumid[bookispos]+GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ) )	
      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
      x890100_ShowNotice( sceneId, selfId, "恭喜你学习了【#{_ITEM"..ret.."}】秘籍中的所有技能" )
      local jisumiji = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),1000000)
      local skillbook1 = floor(jisumiji/10000)+ 30311000
      local skillbook2 = floor(mod(jisumiji,10000)/100)+ 30311000
      local skillbook3 = mod(mod(mod(jisumiji,10000),100),100)+ 30311000
      local xiuweijinjue = 0 
      local lingwujinjuelevel = {}
             for i = 1,3 do
             xiuweijinjue = xiuweijinjue + GetMissionData( sceneId, selfId, x890100_g_wujuemijitoxingdenum[i])
             lingwujinjuelevel[i] = GetMissionData( sceneId, selfId, x890100_g_wujuemijitoxingdenum[i])
             end
      
	      BeginUICommand(sceneId)
	      UICommand_AddInt(sceneId,skillbook1)
	      UICommand_AddInt(sceneId,skillbook2)
	      UICommand_AddInt(sceneId,skillbook3)
	      UICommand_AddInt(sceneId,xiuweijinjue)
	      UICommand_AddInt(sceneId,GetMissionData( sceneId, selfId, ZHOUTIANWUXUEXINDE ))
	      UICommand_AddInt(sceneId,GetMissionData( sceneId, selfId, WULIMIJIXUEJUE_3BOOKS ))
	      for i = 1,3 do
	      UICommand_AddInt(sceneId,lingwujinjuelevel[i])
	      end
	      UICommand_AddString(sceneId,"OPEN_MIJI_PAGE")
	      EndUICommand(sceneId)
	      DispatchUICommand(sceneId,selfId,2013092101)
      return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x890100_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x890100_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x890100_itemMISS( sceneId, selfId, item,item1)

if item1 == 1 then
itemmiss = item
return 0
end
if item1 == 2 then
if itemmiss ~= nil then

return itemmiss
end 
return 0
end
   
end

