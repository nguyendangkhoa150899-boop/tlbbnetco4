--2014.7.15  云雀编制 
--寻物任务
--拜访养花名人
--MisDescBegin
--脚本号
x002109_g_ScriptId = 002109
rwbz=0
x002109_g_IsMissionOkFail = 0							-- 任务完成标记
x002109_g_SongXinFlag = 0                               --送信完成标志
x002109_g_Position_X=189
x002109_g_Position_Z=65
x002109_g_SceneID=2
x002109_g_AccomplishNPC_Name="阿里"
completeNpcName="" --此处先定义变量（如不定义，后面找不到这个变量，会使脚本停止死掉)
chengshi=""  --此处先定义变量
--任务号
x002109_g_MissionId = 1455

--目标NPC
x002109_g_Name	="阿里"

--任务归类
x002109_g_MissionKind = 5

--任务等级
x002109_g_MissionLevel = 10000

--是否是精英任务
x002109_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--以上是动态**************************************************************
--任务名
x002109_g_MissionName="#cFF0000拜访养花名人"
x002109_g_MissionInfo="请你去拜访一下%s%s[%d,%d]，你会学到很多养花的知识。"
x002109_g_MissionTarget="%f"
x002109_g_MissionTarget2="#G然后回到大理的#Y阿里#{_INFOAIM312,165,2,}#G那里交还任务并领取奖励。"
--x002109_g_MissionContinue="#G你见到了".."#Y"..chengshi.."#G的".."#R"..completeNpcName.."#G了吗？"
--x002109_g_MissionComplete="   #Y嗯，做得不错。你做事很利索！。"
x002109_g_ContinueInfo="做得不错"
x002109_g_MissionComplete="我知道了，这是给你的奖励"
x002109_g_MoneyBonus=10000
x002109_g_jbjl_1=30505260
x002109_g_jbjl_2=30505261
x002109_g_SignPost = {x = 189, z = 65, tip = "阿里"}
x002109_g_RadioItemBonus={{id=30505260 ,num=2},{id=30505261,num=5},{id=20310175,num=1},{id=38000187,num=1},{id=38000188,num=1},{id=20310113,num=1}}
--MisDescEnd
--用来保存字符串格式化的数据
x002109_g_FormatList = {
"找到%n,#G然后回到大理的#Y阿里#{_INFOAIM189,65,2,}#G那里交还任务并领取奖励。",
}

--格式字符串中对应于g_StringList中字符串的索引, 表示从4开始,后多少位视SetMissionByIndexEx(...)的多少而定
x002109_g_StrForePart=4
--**********************************
--事件列表
--**********************************
function x002109_UpdateEventList( sceneId, selfId,targetId )
	
end

--**********************************
--任务入口函数
--**********************************
function x002109_OnDefaultEvent( sceneId, selfId,targetId )
	if IsHaveMission(sceneId,selfId,x002091_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002106_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002107_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002108_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002117_g_MissionId) > 0  then
		rwbz=1
		BeginEvent(sceneId)
		AddText(sceneId,"    #Y你已经接过别的种花任务，不要太贪心。请完成后再来领取新任务！")
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId ) --更换提示界面
		DispatchMissionTips(sceneId,selfId) --同时在游戏中另外提示
	elseif IsMissionHaveDone(sceneId,selfId,x002109_g_MissionId) < 0 then
		return
		--如果已接此任务
	elseif (IsHaveMission(sceneId,selfId,x002109_g_MissionId) > 0) then
		--********
		if GetName(sceneId, targetId) == x002109_g_Name then
			local misIndex = GetMissionIndexByID(sceneId,selfId,x002109_g_MissionId)
			local npcId = GetMissionParam(sceneId, selfId, misIndex,x002109_g_StrForePart+1)
			local _, npcName, npcScene, x, z = GetNpcInfoByNpcId(sceneId,npcId)
			local strText = format("你见到要拜访的名人了吗？%s%s就在(%d，%d)。你可以点击Alt+Q查看任务目标。", npcScene, npcName, x, z)
			--********
			--****************************
			BeginEvent(sceneId)
			AddText(sceneId,x002109_g_MissionName)
			AddText(sceneId, strText)
			--AddText(sceneId,x002109_g_MissionContinue)
			--local BonusMoney = 22500	--90 + (GetLevel(sceneId, selfId) - 10) * 5
			--local BonusExp = 36200
			--AddText(sceneId, "#R奖励你" .. tostring(BonusExp) .. "点经验和" .. "#{_MONEY" .. tostring(BonusMoney) .. "}，多多拜访一下名人，你的养花技艺会提高，心境也会增强。")
			--SetMissionCacheData(sceneId, selfId, 0, BonusMoney)
			--SetMissionCacheData(sceneId, selfId, 1, BonusExp)
			AddMoneyBonus( sceneId, x002109_g_MoneyBonus )
			EndEvent( )
			bDone = x002109_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x002109_g_ScriptId,x002109_g_MissionId,bDone)
			--DispatchMissionContinueInfo(sceneId, selfId, targetId, x002109_g_ScriptId, x002109_g_MissionId,x002109_g_ScriptId)
			--DispatchEventList(sceneId, selfId, -1)
			--****************************
		end
		--如果未接此任务且满足任务接收条件
	elseif x002109_CheckAccept(sceneId,selfId) > 0 then
		--****************************
		if GetName(sceneId,targetId) == x002109_g_Name then
			                  
			local iDayCount = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
			                  
			local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
			local iDayTime = floor(iTime/100)					--上一次放弃任务的时间(天数)
			local iQuarterTime = mod(iTime,100)				--上一次放弃任务的时间(一刻种)
	
			local iDayHuan = iDayCount 	--当天内完成的任务次数
			   
			local CurTime = GetQuarterTime()							--当前时间
			local CurDaytime = floor(CurTime/100)			--当前时间(天)
			local CurQuarterTime = mod(CurTime,100) 	--当前时间(一刻钟)
			                   --end modified by zhangguoxin 090207
			
			if iDayTime ~= CurDaytime  then
				iDayHuan = 0
				CurQuarterTime = 99
			end


			if iDayTime == CurDaytime then
				if CurQuarterTime == iQuarterTime then
					BeginEvent(sceneId)
						AddText(sceneId, x002109_g_MissionName)
						AddText(sceneId, "  由于你放弃过任务，在15分钟内你不能接收新的任务!")
					EndEvent( )
					DispatchEventList(sceneId, selfId, -1)
					return
				end
			end
			--/////////////////////////////////////////////////// end
			
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				--加入任务到玩家列表
				local bAdd = AddMission( sceneId,selfId, x002109_g_MissionId, x002109_g_ScriptId, 1, 0, 1 )
				if bAdd < 1 then
					return
				end	
				--锁定目标NPC的事件Flag
				SetMissionEvent(sceneId, selfId, x002109_g_MissionId, 4)
				
				local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(tonumber(x002109_g_Name))
				print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ)
			
				Msg2Player(  sceneId, selfId,"#Y接受任务：拜访养花名人", MSG2PLAYER_PARA )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

				--得到任务在20个任务中的序列号
				local misIndex = GetMissionIndexByID(sceneId,selfId,x002109_g_MissionId)
				
				SetMissionByIndex(sceneId, selfId,misIndex, 0, 0) --设置任务是否完成（未完成）
				
				SetMissionByIndex(sceneId, selfId, misIndex,x002109_g_StrForePart, 0)
				SetMissionByIndex(sceneId, selfId, misIndex, x002109_g_StrForePart+1, nNpcId)
				--////////////////////////////////////////////////////////////
				AddText(sceneId,x002109_g_MissionName)
				str = format("请你去拜访一下养花名人%s%s[%d,%d]，你会学到养花的知识的。", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, str)
				AddText(sceneId,"#{M_MUBIAO}")
				strMissionTarget = format("找到%s%s[%d,%d]", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, strMissionTarget)
				for i, item in x002109_g_RadioItemBonus do
			    AddItemBonus( sceneId, item.id, item.num )
		        end
		        AddMoneyBonus( sceneId, x002109_g_MoneyBonus )
			    EndEvent( )
			    DispatchMissionInfo(sceneId,selfId,targetId,x002109_g_ScriptId,x002109_g_MissionId)
			end
		end
  end

		--****************************
		

--**********************************
--列举事件
--**********************************
function x002109_OnEnumerate( sceneId, selfId, targetId )
	
	
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x002109_g_MissionId) > 0 then
		AddNumText(sceneId,x002109_g_ScriptId,x002109_g_MissionName,4,-1);
		--满足任务接收条件
	elseif x002109_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x002109_g_Name then
			AddNumText(sceneId,x002109_g_ScriptId,x002109_g_MissionName,3,-1);
		end
	end
	
end

--**********************************
--检测接受条件
--**********************************
function x002109_CheckAccept( sceneId, selfId )
	--需要20级才能接
	if GetLevel( sceneId, selfId ) >= 20 then
		return 1
	else
		return 0
	end
end


--**********************************
--接受此NPC的任务
--**********************************
function x002109_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	--AddMission( sceneId,selfId, x002109_g_MissionId, x002109_g_ScriptId, 0, 0, 0 )
	--Msg2Player(  sceneId, selfId,"#Y接受任务：访问养花名人",MSG2PLAYER_PARA )
	--AddItemListToHuman(sceneId, selfId)
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x002109_g_SignPost.x, x002109_g_SignPost.z, x002109_g_SignPost.tip )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName,strMissionTarget)
end

--**********************************
-- 选中
--**********************************

--**********************************
-- 继续
--**********************************
function x002109_OnContinue( sceneId, selfId, targetId, missionIndex )
	--提交任务时的说明信息
	BeginEvent(sceneId)
	AddText(sceneId,x002109_g_MissionName)
	AddText(sceneId,x002109_g_MissionComplete)
	AddMoneyBonus( sceneId, x002109_g_MoneyBonus )
	for i, item in x002109_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x002109_g_ScriptId,x002109_g_MissionId)
	
end

--**********************************
--检测是否可以提交
--**********************************
function x002109_CheckSubmit( sceneId, selfId, missionIndex )
	if IsHaveMission(sceneId,selfId,x002109_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x002109_g_MissionId)
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 1   then
			return 1
		end
	else
		return 0
	end
	
	--if x002109_g_SongXinFlag == 1 then
	--	return 1
	--else
	--	return 0
	--end
end

--**********************************
--提交
--**********************************
function x002109_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	--****************************************
	
	--****************************************
	
	if x002109_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		
		BeginAddItem(sceneId)
		for i, item in x002109_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		
		if ret > 0 then
			AddMoney(sceneId,selfId,x002109_g_MoneyBonus );
			local playerLevel = GetLevel(sceneId, selfId)
			if playerLevel>=20 and playerLevel<30 then
				LuaFnAddExp(sceneId, selfId,10000) --基本经验奖励12万
				AddExp( sceneId, selfId, 10000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,10000 )     --额外金钱奖励5金
			elseif
				playerLevel>=30 and playerLevel<40 then
				LuaFnAddExp(sceneId, selfId,20000) --基本经验奖励12万
				AddExp( sceneId, selfId, 20000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,20000 )
			elseif
				playerLevel>=30 and playerLevel<40 then
				LuaFnAddExp(sceneId, selfId,30000) --基本经验奖励12万
				AddExp( sceneId, selfId, 30000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,30000 )
			elseif
				playerLevel>=40 and playerLevel<50 then
				LuaFnAddExp(sceneId, selfId,40000) --基本经验奖励12万
				AddExp( sceneId, selfId, 40000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,40000 )
			elseif
				playerLevel>=50 and playerLevel<60 then
				LuaFnAddExp(sceneId, selfId,50000) --基本经验奖励12万
				AddExp( sceneId, selfId, 50000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,50000 )
			elseif
				playerLevel>=60 and playerLevel<70 then
				LuaFnAddExp(sceneId, selfId,60000) --基本经验奖励12万
				AddExp( sceneId, selfId, 60000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,50000 )
			elseif
				playerLevel>=70 and playerLevel<80 then
				LuaFnAddExp(sceneId, selfId,70000) --基本经验奖励12万
				AddExp( sceneId, selfId, 70000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,50000 )
			elseif
				playerLevel>=80 and playerLevel<90 then
				LuaFnAddExp(sceneId, selfId,80000) --基本经验奖励12万
				AddExp( sceneId, selfId, 80000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,50000 )
			elseif
				playerLevel>=90 and playerLevel<100 then
				LuaFnAddExp(sceneId, selfId,90000) --基本经验奖励12万
				AddExp( sceneId, selfId, 90000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,60000 )
			elseif
				playerLevel>=100 and playerLevel<120 then
				LuaFnAddExp(sceneId, selfId,100000) --基本经验奖励12万
				AddExp( sceneId, selfId, 100000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,60000 )
			elseif
				playerLevel>=120  then
				LuaFnAddExp(sceneId, selfId,110000) --基本经验奖励12万
				AddExp( sceneId, selfId, 110000)    --额外经验奖励12万
				AddMoney(sceneId,selfId,70000 )
			end
			AddItem( sceneId,x002109_g_jbjl_1, 1 )
			AddItem( sceneId,x002109_g_jbjl_2, 5 )			
			ret = DelMission( sceneId, selfId, x002109_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x002109_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y拜访名人#G任务完成。#R除基本奖励，另外奖励你12万的经验和5金币的奖励！",MSG2PLAYER_PARA )
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
--放弃
--**********************************
function x002109_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	--DelMission( sceneId, selfId, x002109_g_MissionId )
	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x002109_g_SignPost.tip )
	--删除玩家任务列表中对应的任务
	local misIndex = GetMissionIndexByID(sceneId,selfId,x002109_g_MissionId)
	local npcId = GetMissionParam(sceneId, selfId,misIndex, x002109_g_StrForePart+1)
	local  _, strNpcName, strNpcScene, x, z, desc, scene = GetNpcInfoByNpcId(sceneId,npcId)
	
	DelMission( sceneId, selfId, x002109_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, scene, strNpcName, x002109_g_MissionId)
	
	local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
	local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
	local iDayTime = floor(iTime/100)		--上一次放弃任务的时间(天数)
	local iQuarterTime = mod(iTime,100)	--上一次放弃任务的时间(刻)
	local iDayHuan = iDayCount --当天内完成的任务次数
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	
	if CurDaytime~=iDayTime then 	--上次完成任务是同一天内
		iDayHuan = 0
	end
	
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002109_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002109_g_eventList do
		x002109_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end


--**********************************
--死亡事件
--**********************************
function x002109_OnDie( sceneId, selfId, killerId )
end


--**********************************
--进入区域事件
--**********************************
function x002109_OnEnterZone( sceneId, selfId, zoneId )
end
--锁定NPC
function x002109_OnLockedTarget(sceneId, selfId, objId )
	-- 判断是不是锁定的Npc
	if IsHaveMission(sceneId, selfId, x002109_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x002109_g_MissionId)		--得到任务在20个任务中的序列号
		local missionType = GetMissionParam(sceneId, selfId,misIndex, 1)
		
		local nNpcId = GetMissionParam(sceneId, selfId,misIndex, x002109_g_StrForePart+1)
		local _, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
			 
		if GetName(sceneId, objId) == strNpcName then
                                x002109_g_SongXinFlag = 1
		BeginEvent(sceneId)
                AddText(sceneId,"#Y恭喜你完成本次拜访任务！")	
	         --TAddNumText(sceneId,x002109_g_ScriptId,x002109_g_MissionName,4,0,x002109_g_ScriptId);--判断后才可能交任务
                strtxt="    #G哈哈......其实我对养花也没有太多的经验，更不是名人，让我们互相学习，共同提高。"
                AddText( sceneId, strtxt)
                AddText( sceneId, "    #cFF0000快回去找阿里师徒领取奖励吧！")
		EndEvent( ) 
                local nNumText = GetNumText()
   
if nNumText==1  then
	x002109_g_SongXinFlag = 1
--local BonusMoney = GetMissionCacheData(sceneId, selfId, 0)
		       -- local BonusExp = GetMissionCacheData(sceneId, selfId, 1)
		        --AddMoney(sceneId,selfId,BonusMoney ) --奖励金钱
		        --AddExp(sceneId,selfId,BonusExp )     --奖励经验

        end
  
           --BeginEvent(sceneId)
		    
		
		SetMissionByIndex(sceneId, selfId,misIndex, 0, 1)   
		   
           --*************************给奖励
		   --local BonusMoney = GetMissionCacheData(sceneId, selfId, 0)
		    --    local BonusExp = GetMissionCacheData(sceneId, selfId, 1)
		     --   AddMoney(sceneId,selfId,BonusMoney ) --奖励金钱
		     --   AddExp(sceneId,selfId,BonusExp )     --奖励经验
		    
			--DelMission( sceneId,selfId, x002109_g_MissionId ) --删除任务
			
            --DispatchEventList( sceneId, selfId, targetId ) --更换提示界面
           --DispatchMissionTips(sceneId,selfId) --同时在游戏中另外提示	
				  
		end	
					
	end 
	
	return 0
end	
