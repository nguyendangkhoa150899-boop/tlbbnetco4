--杀怪任务之除魔卫道
--除魔卫道任务 2017年7月编制 云雀
--MisDescBegin
--脚本号
x808135_g_ScriptId = 808135

--接受任务NPC属性
x808135_g_Position_X=282
x808135_g_Position_Z=276
x808135_g_SceneID=1
x808135_g_AccomplishNPC_Name="梁道士"

--上一个任务的ID
--g_MissionIdPre =

--任务号
x808135_g_MissionId = 1158

--目标NPC
x808135_g_Name	="梁道士"

--任务归类
x808135_g_MissionKind = 12

--任务等级
x808135_g_MissionLevel = 10000

--是否是精英任务
x808135_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x808135_g_IsMissionOkFail = 0		--变量的第0位

--任务需要杀死的怪
x808135_g_DemandKill ={{id=996,num=20}}		--变量第1位

--以上是动态**************************************************************

--任务文本描述
x808135_g_MissionName="除魔卫道"
x808135_g_MissionInfo="    许愿树通过这片祈愿叶将暑魔的踪迹告诉了我。这些孽畜果然极尽狡猾之能事！它们现在藏匿在一些野外怪物的体内。即不易被发现，还可以通过控制怪物的神经，来达到危害人间的目的。现在请你去打败那些被暑魔控制的怪物，让暑魔不能遁形，以助我封印暑魔。"
x808135_g_MissionTarget="    到龙泉打败20个龙泉豹将暑魔从怪物体内驱逐出来，然后回到梁道士#{_INFOAIM282,276,1,梁道士}这里交还任务。"
x808135_g_ContinueInfo="    你已经将被暑魔侵入的怪物打败了吗？如果已经将暑魔驱逐出来后，我们就可以开始封印暑魔了。"
x808135_g_MissionComplete="    少侠做得很好，我们可以开始封印暑魔了！"

x808135_g_SignPost_1 = {x = 282, z = 276, tip = "梁道士"}
--任务奖励
x808135_g_MoneyBonus=40000
x808135_g_ItemBonus={{id=30505255,num=3},{id=39999901,num=1},{id=38000188,num=1}}
x808135_g_SignPost = {x = 79, z = 250, tip = "龙泉豹"}

--MisDescEnd
  x808135_g_DemandTrueKill ={{name="龙泉豹",num=20}}
--**********************************
--任务入口函数
--**********************************
function x808135_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x808135_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x808135_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x808135_g_MissionName)
			AddText(sceneId,x808135_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x808135_g_MoneyBonus )
		EndEvent( )
		bDone = x808135_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x808135_g_ScriptId,x808135_g_MissionId,bDone)
    --满足任务接收条件
    elseif x808135_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x808135_g_MissionName)
				AddText(sceneId,x808135_g_MissionInfo)
				AddText(sceneId,x808135_g_MissionTarget)
				for i, item in x808135_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x808135_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x808135_g_ScriptId,x808135_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x808135_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    --if IsMissionHaveDone(sceneId,selfId,x808135_g_MissionId) > 0 then
    --	return
	--end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x808135_g_MissionId) > 0 then
			AddNumText(sceneId,x808135_g_ScriptId,x808135_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x808135_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x808135_g_ScriptId,x808135_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x808135_CheckAccept( sceneId, selfId )
	--需要30级才能接
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x808135_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x808135_g_MissionId, x808135_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x808135_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：除魔卫道",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808135_g_SignPost_1.x, x808135_g_SignPost_1.z, x808135_g_SignPost_1.tip )--梁道士
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 31, x808135_g_SignPost.x, x808135_g_SignPost.z, x808135_g_SignPost.tip )--怪
end

--**********************************
--放弃
--**********************************
function x808135_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x808135_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x808135_g_SignPost_1.tip )
end

--**********************************
--继续
--**********************************
function x808135_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x808135_g_MissionName)
		AddText(sceneId,x808135_g_MissionComplete)
		AddMoneyBonus( sceneId, x808135_g_MoneyBonus )
		for i, item in x808135_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x808135_g_ScriptId,x808135_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x808135_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x808135_g_MissionId )
	if bRet == 1 then
		return 1
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x808135_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x808135_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x808135_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x808135_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
	if ret > 0 then
			AddMoney(sceneId,selfId,x808135_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 80000)
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x808135_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x808135_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y完成任务：除魔卫道",MSG2PLAYER_PARA )
				--allScriptFunction( 808136, "OnDefaultEvent",sceneId, selfId, targetId)
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
function x808135_OnKillObject( sceneId, selfId, objdataId ,objId)
	if GetName(sceneId,objId) == x808135_g_DemandTrueKill[1].name	  then
		-- 获得所有人
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看有没有这个任务
			if IsHaveMission(sceneId, humanObjId, x808135_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x808135_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)

	 			if nNum < x808135_g_DemandTrueKill[1].num then
	 				if nNum == x808135_g_DemandTrueKill[1].num - 1 then
	 					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
	 				end
	 				
			    SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
			  	BeginEvent(sceneId)
					strText = format("已杀死龙泉豹%d/20", GetMissionParam(sceneId,humanObjId,misIndex,1) )
					AddText(sceneId,strText);
			  	EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
	 			end
			end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x808135_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808135_OnItemChanged( sceneId, selfId, itemdataId )
end
