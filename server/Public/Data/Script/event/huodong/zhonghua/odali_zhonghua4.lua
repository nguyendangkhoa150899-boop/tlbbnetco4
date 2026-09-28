--2014.7.15  云雀编制
--寻物任务
--阿里要你给他找到5把遗失的小铲子
--MisDescBegin
--脚本号
x002107_g_ScriptId = 002107
rwbz=0
x002107_g_Position_X=189
x002107_g_Position_Z=65
x002107_g_SceneID=2
x002107_g_AccomplishNPC_Name="阿里"

--任务号
x002107_g_MissionId = 1453

--上一个任务的ID
--x002107_g_MissionIdPre = 441

--目标NPC
x002107_g_Name	="阿里"

--任务道具编号
x002107_g_ItemId = 40004498
--任务道具名
x002107_g_ItemIdName = "#Y遗失的小铲子"
--任务道具需求数量
x002107_g_ItemNeedNum = 5

--任务归类
x002107_g_MissionKind = 5

--任务等级
x002107_g_MissionLevel = 10000

--是否是精英任务
x002107_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--以上是动态**************************************************************

--任务需要得到的物品
x002107_g_DemandItem={{id=40004498,num=5}}		--变量第1位40004500
x002107_g_IsMissionOkFail = 1		--变量的第0位

--任务名
x002107_g_MissionName="遗失的小铲子"
x002107_g_MissionInfo_1="  #R"
x002107_g_MissionInfo_2="#{event_dali_0050}"
x002107_g_MissionTarget="#{event_dali_0051}"
x002107_g_MissionTarget="#{event_dali_0052}"
x002107_g_MissionContinue="你得到了5把#Y遗失的小铲子#W了吗？"
x002107_g_MissionComplete="  嗯，做得不错。你很能干。"
x002107_g_MoneyBonus=100000
x002107_g_jbjl_1=30505260
x002107_g_jbjl_2=30505261
x002107_g_SignPost = {x = 189, z = 65, tip = "阿里"}
x002107_g_RadioItemBonus={{id=30505260 ,num=2},{id=30505261,num=5},{id=20310175,num=1},{id=38000187,num=1},{id=38000188,num=1},{id=20310113,num=1}}
--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x002107_OnDefaultEvent( sceneId, selfId, targetId )
  if IsHaveMission(sceneId,selfId,x002091_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002106_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002117_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002108_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002109_g_MissionId) > 0  then
       rwbz=1	 
	BeginEvent(sceneId)
				AddText(sceneId,"    #Y你已经接过别的种花任务，不要太贪心。请完成后再来领取新任务！")
			EndEvent( )
			DispatchEventList( sceneId, selfId, targetId ) --更换提示界面
			DispatchMissionTips(sceneId,selfId) --同时在游戏中另外提示
    elseif IsMissionHaveDone(sceneId,selfId,x002107_g_MissionId) < 0 then
		return
    --如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x002107_g_MissionId) > 0 then
			--发送任务需求的信息
			BeginEvent(sceneId)
			AddText(sceneId,x002107_g_MissionName)
			AddText(sceneId,x002107_g_MissionContinue)
			for i, item in x002107_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x002107_g_MoneyBonus )
			EndEvent( )
			bDone = x002107_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x002107_g_ScriptId,x002107_g_MissionId,bDone)
		--满足任务接收条件
	elseif x002107_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
				local  PlayerName=GetName(sceneId,selfId)	
	            local  PlayerSex=GetSex(sceneId,selfId)
	            if PlayerSex == 0 then
		            PlayerSex = "姑娘"
	            else
		            PlayerSex = "少侠"
	            end
			BeginEvent(sceneId)
				AddText(sceneId,x002107_g_MissionName)
				AddText(sceneId,x002107_g_MissionInfo_1..PlayerName..PlayerSex..x002107_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,"#G帮我找来#R5把#Y遗失的小铲子")
				AddText(sceneId,"    #Y遗失的小铲子#G是上古所用的永不磨损的稀有物品，我们非常喜欢它，可惜很难得到了。请你帮我完成我的夙愿。找到5把算你完成一次任务。")
				AddText(sceneId,"    #Y遗失的小铲子#G听说在#Y洱海#G场景中#R(209,215)#G附近的#Y偷铲子贼#G身上有，打败他可以掉落，你可以去试试运气。你愿意辛苦帮我们一下吗？找到后我会给你丰厚的奖励的！")
				AddText(sceneId,x002107_g_MissionTarget)
				for i, item in x002107_g_RadioItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x002107_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x002107_g_ScriptId,x002107_g_MissionId)
			
		end
end

--**********************************
--列举事件
--**********************************
function x002107_OnEnumerate( sceneId, selfId, targetId )
    
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x002107_g_MissionId) > 0 then
		AddNumText(sceneId,x002107_g_ScriptId,x002107_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x002107_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x002107_g_ScriptId,x002107_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x002107_CheckAccept( sceneId, selfId )
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
function x002107_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x002107_g_MissionId, x002107_g_ScriptId, 1, 0, 1 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：寻找遗失的小铲子",MSG2PLAYER_PARA )
	--AddItemListToHuman(sceneId, selfId)	
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, sceneId, x002107_g_SignPost.x, x002107_g_SignPost.z, x002107_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x002107_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x002107_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x002107_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x002107_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x002107_g_MissionName)
		AddText(sceneId,x002107_g_MissionComplete)
		AddMoneyBonus( sceneId, x002107_g_MoneyBonus )
		for i, item in x002107_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x002107_g_ScriptId,x002107_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x002107_CheckSubmit( sceneId, selfId )

	for i, item in x002107_g_DemandItem do
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
function x002107_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x002107_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x002107_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		local DelRet = 1
		for i, item in x002107_g_DemandItem do
		
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
			AddMoney(sceneId,selfId,x002107_g_MoneyBonus );
			local playerLevel = GetLevel(sceneId, selfId)
			if playerLevel>=20 and playerLevel<30 then
			LuaFnAddExp(sceneId, selfId,20000) --基本经验奖励12万
			AddExp( sceneId, selfId, 20000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,50000 )     --额外金钱奖励5金
			elseif
			playerLevel>=30 and playerLevel<40 then
			LuaFnAddExp(sceneId, selfId,60000) --基本经验奖励12万
			AddExp( sceneId, selfId, 60000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,60000 )
			elseif
			playerLevel>=30 and playerLevel<40 then
			LuaFnAddExp(sceneId, selfId,100000) --基本经验奖励12万
			AddExp( sceneId, selfId, 100000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,70000 )
			elseif
			playerLevel>=40 and playerLevel<50 then
			LuaFnAddExp(sceneId, selfId,120000) --基本经验奖励12万
			AddExp( sceneId, selfId, 120000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,80000 )
			elseif
			playerLevel>=50 and playerLevel<60 then
			LuaFnAddExp(sceneId, selfId,140000) --基本经验奖励12万
			AddExp( sceneId, selfId, 140000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,90000 )
			elseif
			playerLevel>=60 and playerLevel<70 then
			LuaFnAddExp(sceneId, selfId,150000) --基本经验奖励12万
			AddExp( sceneId, selfId, 150000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,80000 )
			elseif
			playerLevel>=70 and playerLevel<80 then
			LuaFnAddExp(sceneId, selfId,160000) --基本经验奖励12万
			AddExp( sceneId, selfId, 160000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,90000 )
			elseif
			playerLevel>=80 and playerLevel<90 then
			LuaFnAddExp(sceneId, selfId,170000) --基本经验奖励12万
			AddExp( sceneId, selfId, 170000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,100000 )
			elseif
			playerLevel>=90 and playerLevel<100 then
			LuaFnAddExp(sceneId, selfId,200000) --基本经验奖励12万
			AddExp( sceneId, selfId, 200000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,120000 )
			elseif
			playerLevel>=100 and playerLevel<120 then
			LuaFnAddExp(sceneId, selfId,240000) --基本经验奖励12万
			AddExp( sceneId, selfId, 240000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,140000 )
			elseif
			playerLevel>=120  then
			LuaFnAddExp(sceneId, selfId,300000) --基本经验奖励12万
			AddExp( sceneId, selfId, 300000)    --额外经验奖励12万
		    AddMoney(sceneId,selfId,180000 )
			end
			AddItem( sceneId,x002107_g_jbjl_1, 1 )
			AddItem( sceneId,x002107_g_jbjl_2, 5 )
			ret = DelMission( sceneId, selfId, x002107_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x002107_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y遗失的小铲子#G任务完成。#R除基本奖励，另外奖励你12万的经验和5金币的奖励！",MSG2PLAYER_PARA )
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
function x002107_OnKillObject( sceneId, selfId, objdataId,objId )
-- 如果玩家杀死一个偷铲子贼，可以获得一个道具“遗失的小铲子”
	local monsterName = GetMonsterNamebyDataId(objdataId)
	BeginEvent(sceneId)
	   strText = "杀死一个"..monsterName
	   AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	if monsterName == "偷铲子贼"   then
		--取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x002107_g_MissionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local nMisIndex = GetMissionIndexByID(sceneId,humanObjId,x002107_g_MissionId)
				
				-- 检测玩家身上是不是有这个物品了，有了就不再掉了
				if GetMissionParam(sceneId, humanObjId, nMisIndex, 0) == 0  and
						GetItemCount(sceneId, humanObjId, 40004498) < 5 then
					AddMonsterDropItem(sceneId,objId,humanObjId, 40004498)
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x002107_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x002107_OnItemChanged( sceneId, selfId, itemdataId )
	
	 local SL= GetItemCount( sceneId, selfId, 40004498 )
            BeginEvent(sceneId)
		strText = "已经得到 "..SL.."  个"..x002107_g_ItemIdName
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	if itemdataId == 40004498 and  SL>=5  then
            BeginEvent(sceneId)
		strText = "寻找"..x002107_g_ItemIdName.."任务已经完成，快回去交任务吧！再打也不给你"..x002107_g_ItemIdName.."了。"
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId) 
		local misIndex = GetMissionIndexByID(sceneId,selfId,x002107_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	end
end
