--2014.7.15  云雀编制 
--寻物任务
--阿里要你给他买到一只扒鸡
--MisDescBegin
--脚本号
x002108_g_ScriptId = 002108
rwbz=0
x002108_g_Position_X=189
x002108_g_Position_Z=65
x002108_g_SceneID=2
x002108_g_AccomplishNPC_Name="阿里"

--任务号
x002108_g_MissionId = 1454

--目标NPC
x002108_g_Name	="阿里"

--任务道具编号
x002108_g_ItemId = 30101039

--任务道具需求数量
x002108_g_ItemNeedNum = 1

--任务归类
x002108_g_MissionKind = 5

--任务等级
x002108_g_MissionLevel = 10000

--是否是精英任务
x002108_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--以上是动态**************************************************************

--任务需要得到的物品
x002108_g_DemandItem={{id=30101039,num=1}}		--变量第1位40004500
x002108_g_IsMissionOkFail = 1		--变量的第0位

--任务名
x002108_g_MissionName="购买扒鸡"
x002108_g_MissionInfo_1="  #R"
x002108_g_MissionInfo_2="#{event_dali_0050}"
x002108_g_MissionTarget="#{event_dali_0051}"
x002108_g_MissionTarget="#{event_dali_0052}"
x002108_g_MissionContinue="你买来了1只#Y扒鸡#W了吗？"
x002108_g_MissionComplete="  嗯，做得不错。你很能干。"
x002108_g_MoneyBonus=20000
x002108_g_jbjl_1=30505260
x002108_g_jbjl_2=30505261
x002108_g_SignPost = {x = 189, z = 65, tip = "阿里"}
x002108_g_RadioItemBonus={{id=30505260 ,num=2},{id=30505261,num=5},{id=20310175,num=1},{id=38000187,num=1},{id=38000188,num=1},{id=20310113,num=1}}
--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x002108_OnDefaultEvent( sceneId, selfId, targetId )
  if IsHaveMission(sceneId,selfId,x002091_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002106_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002107_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002117_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002109_g_MissionId) > 0  then
       rwbz=1	 
	BeginEvent(sceneId)
				AddText(sceneId,"    #Y你已经接过别的种花任务，不要太贪心。请完成后再来领取新任务！")
			EndEvent( )
			DispatchEventList( sceneId, selfId, targetId ) --更换提示界面
			DispatchMissionTips(sceneId,selfId) --同时在游戏中另外提示
    elseif IsMissionHaveDone(sceneId,selfId,x002108_g_MissionId) < 0 then
		return
    --如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x002108_g_MissionId) > 0 then
			--发送任务需求的信息
			BeginEvent(sceneId)
			AddText(sceneId,x002108_g_MissionName)
			AddText(sceneId,x002108_g_MissionContinue)
			for i, item in x002108_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x002108_g_MoneyBonus )
			EndEvent( )
			bDone = x002108_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x002108_g_ScriptId,x002108_g_MissionId,bDone)
		--满足任务接收条件
	elseif x002108_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
				local  PlayerName=GetName(sceneId,selfId)	
	            local  PlayerSex=GetSex(sceneId,selfId)
	            if PlayerSex == 0 then
		            PlayerSex = "姑娘"
	            else
		            PlayerSex = "少侠"
	            end
			BeginEvent(sceneId)
				AddText(sceneId,x002108_g_MissionName)
				AddText(sceneId,x002108_g_MissionInfo_1..PlayerName..PlayerSex..x002108_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,"#G帮我买来#R1只#Y扒鸡")
				AddText(sceneId,"    #Y扒鸡#G是非常诱人的一种食品，我们都非常喜欢吃，我师傅更上是一天都不能少。想到我们就想流口水。我们有些馋了，请你帮我们买一只好吗？")
				AddText(sceneId,"    #Y扒鸡#G在洛阳酒馆可以买到。请你帮我快去买一只，我们又馋又饿。买来后我会给你丰厚的奖励的！")
				AddText(sceneId,x002108_g_MissionTarget)
				for i, item in x002108_g_RadioItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x002108_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x002108_g_ScriptId,x002108_g_MissionId)
			
		end
end

--**********************************
--列举事件
--**********************************
function x002108_OnEnumerate( sceneId, selfId, targetId )
    
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x002108_g_MissionId) > 0 then
		AddNumText(sceneId,x002108_g_ScriptId,x002108_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x002108_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x002108_g_ScriptId,x002108_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x002108_CheckAccept( sceneId, selfId )
	--需要20级才能接
	if GetLevel( sceneId, selfId ) >= 20 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x002108_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x002108_g_MissionId, x002108_g_ScriptId, 1, 0, 1 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：买扒鸡",MSG2PLAYER_PARA )
	--AddItemListToHuman(sceneId, selfId)	
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, sceneId, x002108_g_SignPost.x, x002108_g_SignPost.z, x002108_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x002108_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x002108_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x002108_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x002108_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x002108_g_MissionName)
		AddText(sceneId,x002108_g_MissionComplete)
		AddMoneyBonus( sceneId, x002108_g_MoneyBonus )
		for i, item in x002108_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x002108_g_ScriptId,x002108_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x002108_CheckSubmit( sceneId, selfId )

	for i, item in x002108_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--提交
--**********************************
function x002108_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x002108_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x002108_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		local DelRet = 1
		for i, item in x002108_g_DemandItem do
		
			if LuaFnDelAvailableItem( sceneId, selfId, item.id, item.num ) < 1 then
				DelRet = 0
			end
		end
		if DelRet == 0  then 
			Msg2Player(  sceneId, selfId,"#Y扣除任务物品失败",MSG2PLAYER_PARA )
			BeginEvent(sceneId)
				strText = "扣除任务物品失败，是不是被锁定了？"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		
		if ret > 0 then
			AddMoney(sceneId,selfId,x002108_g_MoneyBonus );
			local playerLevel = GetLevel(sceneId, selfId)
			if playerLevel>=20 and playerLevel<30 then
			LuaFnAddExp(sceneId, selfId,10000) --基本经验奖励12万
			AddExp( sceneId, selfId, 10000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,30000 )     --额外金钱奖励5金
			elseif
			playerLevel>=30 and playerLevel<40 then
			LuaFnAddExp(sceneId, selfId,20000) --基本经验奖励12万
			AddExp( sceneId, selfId, 20000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,40000 )
			elseif
			playerLevel>=30 and playerLevel<40 then
			LuaFnAddExp(sceneId, selfId,300000) --基本经验奖励12万
			AddExp( sceneId, selfId, 300000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,50000 )
			elseif
			playerLevel>=40 and playerLevel<50 then
			LuaFnAddExp(sceneId, selfId,40000) --基本经验奖励12万
			AddExp( sceneId, selfId, 40000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,60000 )
			elseif
			playerLevel>=50 and playerLevel<60 then
			LuaFnAddExp(sceneId, selfId,50000) --基本经验奖励12万
			AddExp( sceneId, selfId, 50000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,70000 )
			elseif
			playerLevel>=60 and playerLevel<70 then
			LuaFnAddExp(sceneId, selfId,60000) --基本经验奖励12万
			AddExp( sceneId, selfId, 60000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,80000 )
			elseif
			playerLevel>=70 and playerLevel<80 then
			LuaFnAddExp(sceneId, selfId,70000) --基本经验奖励12万
			AddExp( sceneId, selfId, 70000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,90000 )
			elseif
			playerLevel>=80 and playerLevel<90 then
			LuaFnAddExp(sceneId, selfId,80000) --基本经验奖励12万
			AddExp( sceneId, selfId, 80000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,100000 )
			elseif
			playerLevel>=90 and playerLevel<100 then
			LuaFnAddExp(sceneId, selfId,90000) --基本经验奖励12万
			AddExp( sceneId, selfId, 90000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,110000 )
			elseif
			playerLevel>=100 and playerLevel<120 then
			LuaFnAddExp(sceneId, selfId,100000) --基本经验奖励12万
			AddExp( sceneId, selfId, 100000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,120000 )
			elseif
			playerLevel>=120  then
			LuaFnAddExp(sceneId, selfId,110000) --基本经验奖励12万
			AddExp( sceneId, selfId, 110000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,130000 )
			end
			AddItem( sceneId,x002108_g_jbjl_1, 1 )
			AddItem( sceneId,x002108_g_jbjl_2, 5 )
			ret = DelMission( sceneId, selfId, x002108_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x002108_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y买扒鸡#G任务完成。#R除基本奖励，另外奖励你12万的经验和5金币的奖励！",MSG2PLAYER_PARA )
			end
		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "背包已满,无法完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x002108_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x002108_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x002108_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == 30101039 then 
		local misIndex = GetMissionIndexByID(sceneId,selfId,x002108_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	end
	
end
