--循环任务
--召集同伴
--************************************************************************
--MisDescBegin
--脚本号
x808136_g_ScriptId = 808136

--接受任务NPC属性
x808136_g_Position_X=282
x808136_g_Position_Z=276
x808136_g_SceneID=1
x808136_g_AccomplishNPC_Name="梁道士"

--上一个任务的ID
--x808136_g_MissionIdPre = 

--任务号
x808136_g_MissionId = 1159

--任务目标npc
x808136_g_Name	="梁道士"
x808136_g_ItemId	= 40004488
x808136_g_rws =  40001115
x808136_g_fmf_th	=40004622
x808136_g_fmf_xh	=40004623
x808136_g_fmf_ss	=40004624
x808136_g_fmf_wl	=40004625
x808136_g_fmf_jg	=40004626
x808136_g_fmf_dh	=40004627

--任务归类
x808136_g_MissionKind = 12

--任务等级
x808136_g_MissionLevel = 10000

--是否是精英任务
x808136_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
x808136_g_IsMissionOkFail = 0					--变量的第0位
--**********************************以上是动态****************************


--任务文本描述
x808136_g_MissionName="#Y设阵封魔"
x808136_g_MissionInfo="最后还需要大侠帮我一个忙。带着这个#Y冰心节杖#W,去太湖、西湖、嵩山、无量山、剑阁及敦煌设置封魔阵法。"  --任务描述至于什么地方合适，你只要打开#Y背包#W里的任务道具栏，右键点一下这个#Y冰心节杖#W，它就能给你相关的提示。
x808136_g_MissionInfo2="    #G小提示：如果你的任务道具栏已满，请放弃某个需要道具的任务后再接受该任务。"
x808136_g_MissionTarget="    帮助梁道士去#G太湖#{_INFOAIM160,252,4,}#W、#G西湖#{_INFOAIM170,235,30,}#W、#G嵩山#{_INFOAIM275,85,3,}#W、#G无量山#{_INFOAIM53,264,6,}#W、#G剑阁#{_INFOAIM130,135,7,}#W及#G敦煌#{_INFOAIM260,260,8,}#W设置封魔阵法。记得在#G22:00#W前返回#G苏州#P梁道士#{_INFOAIM282,276,1,梁道士}#W处交还任务。"		--任务目标
x808136_g_ContinueInfo="    你将所有的节杖都安放好了么？如果完成了，我就可以开始施法念咒封印暑魔了。"		--未完成任务的npc对话
x808136_g_MissionComplete="    你将所有的节杖都安放好了么？如果完成了，我就可以开始施法念咒封印暑魔了。"					--完成任务npc说话的话
x808136_g_MoneyBonus=160000
x808136_g_ItemBonus={{id=30505255,num=3},{id=39999901,num=1},{id=38000188,num=1}}
x808136_g_SignPost = {x = 282, z = 276, tip = "梁道士"}

x808136_g_SignPost_1 = {{x = 160, z = 252, tip = "太湖"},
                        {x = 275, z = 85, tip = "嵩山"},
						{x = 170, z = 235, tip = "西湖"},
						{x = 53, z = 264, tip = "无量山"},
						{x = 130, z = 135, tip = "剑阁"},
						{x = 260, z = 260, tip = "敦煌"},}
x808136_g_DemandItem	= { {id=40004622,num=1},{id=40004623,num=1},{id=40004624,num=1},{id=40004625,num=1},{id=40004626,num=1},{id=40004627,num=1} }
--MisDescEnd
--************************************************************************

--角色Mission变量说明
--0号：任务状态
--1号：
--2号：所在场景编号
--3号：指定x坐标
--4号：指定z坐标
--5号：未用
--6号：未用
--7号：未用

--安放位置
x808136_g_TreasureAddress = {	{scene=4,x=160,z=252},
 						        {scene=3,x=275,z=85}, 
						        {scene=30,x=175,z=235},
						        {scene=6,x=53,z=264},
						        {scene=7,x=130,z=135},
						        {scene=8,x=260,z=260},}

--**********************************
--任务入口函数
--**********************************
function x808136_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x808136_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x808136_g_MissionName)
			AddText(sceneId,x808136_g_ContinueInfo)
			AddMoneyBonus( sceneId, x808136_g_MoneyBonus )
		EndEvent( )
		bDone = x808136_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x808136_g_ScriptId,x808136_g_MissionId,bDone)
	--满足任务接收条件
	elseif x808136_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x808136_g_MissionName)
			AddText(sceneId,x808136_g_MissionInfo)
			AddText(sceneId,x808136_g_MissionInfo2)
			AddText(sceneId,x808136_g_MissionTarget)
			for i, item in x808136_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x808136_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x808136_g_ScriptId,x808136_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x808136_OnEnumerate( sceneId, selfId, targetId )

    if LuaFnGetAvailableItemCount( sceneId, selfId, x808136_g_rws ) < 1 then
		return
	end 
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x808136_g_MissionId) > 0 then
		AddNumText(sceneId,x808136_g_ScriptId,x808136_g_MissionName,2,-1);  --这里屏蔽掉，不让他继续增加任务号
        return 

    --满足任务接收条件
    elseif x808136_CheckAccept(sceneId,selfId) > 0 then

		AddNumText(sceneId,x808136_g_ScriptId,x808136_g_MissionName,1,-1);

    end
end

--**********************************
--检测接受条件
--**********************************
function x808136_CheckAccept( sceneId, selfId )
	--需要30级以上才能接
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x808136_OnAccept( sceneId, selfId )

	if x808136_CheckAccept(sceneId, selfId )<=0 then
		return
	end
	
     SceneNum = x808136_g_TreasureAddress[3].scene --默认写入太西湖摆放封魔节杖的位置
	X		 = x808136_g_TreasureAddress[3].x
	Z		 = x808136_g_TreasureAddress[3].z

	BeginAddItem(sceneId)
		AddItem( sceneId,x808136_g_ItemId, 1 ) --得到封魔节杖
	local ret = EndAddItem(sceneId,selfId)
	
	if ret <= 0 then
	    x808136_NotifyFailTips(sceneId, selfId, "你的任务背包已经满了。不能得到任务必须道具冰心节杖！" )
	else
		--加入任务到玩家列表
		local ret1 = AddMission( sceneId,selfId, x808136_g_MissionId, x808136_g_ScriptId, 0, 0, 1 )

		if ret1 > 0  then
			
			--设置任务变量封魔的场景编号和坐标位置
			--if sceneId==4  then
			--misIndex1 = GetMissionIndexByID(sceneId,selfId,x808136_g_MissionId)		--得到任务在20个任务中的序列号
			--SetMissionByIndex(sceneId,selfId,misIndex1,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
			--SetMissionByIndex(sceneId,selfId,misIndex1,2,SceneNum_th)		--把第三位置为宝物的场景编号
			--SetMissionByIndex(sceneId,selfId,misIndex1,3,X_th)					--把第四位置为宝物的X坐标
			--SetMissionByIndex(sceneId,selfId,misIndex1,4,Z_th)					--把第五位置为宝物的Z坐标
		    --elseif  sceneId==3  then
            --misIndex2 = GetMissionIndexByID(sceneId,selfId,x808136_g_MissionId)		--得到任务在20个任务中的序列号
			--SetMissionByIndex(sceneId,selfId,misIndex2,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
			--SetMissionByIndex(sceneId,selfId,misIndex2,2,SceneNum_ss)		--把第三位置为宝物的场景编号
			--SetMissionByIndex(sceneId,selfId,misIndex2,3,X_ss)					--把第四位置为宝物的X坐标
			--SetMissionByIndex(sceneId,selfId,misIndex2,4,Z_ss)              --把第五位置为宝物的Z坐标
			--end
			misIndex_fm = GetMissionIndexByID(sceneId,selfId,x808136_g_MissionId)		--得到任务在20个任务中的序列号
			SetMissionByIndex(sceneId,selfId,misIndex_fm,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
			SetMissionByIndex(sceneId,selfId,misIndex_fm,2,SceneNum)		--把第三位置为宝物的场景编号
			SetMissionByIndex(sceneId,selfId,misIndex_fm,3,X)					--把第四位置为宝物的X坐标
			SetMissionByIndex(sceneId,selfId,misIndex_fm,4,Z)
			AddItemListToHuman(sceneId,selfId)
			x808136_NotifyFailTips(sceneId, selfId, "#Y接受任务：仲夏除魔第3环之设阵封魔。" )
			
			BeginEvent(sceneId)
				AddText(sceneId, "你得到了冰心节杖。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[1].x, x808136_g_SignPost_1[1].z, x808136_g_SignPost_1[1].tip )
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
		else
			Msg2Player( sceneId, selfId,"#Y你的任务日志已经满了。", MSG2PLAYER_PARA )
		
		end
	end
	end

--**********************************
--放弃
--**********************************
function x808136_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    res = DelMission( sceneId, selfId, x808136_g_MissionId )
	if res > 0 then
		--移去任务物品
		DelItem( sceneId, selfId, x808136_g_ItemId, 1 ) 
		DelItem( sceneId, selfId, x808136_g_fmf_th, 1 )
		DelItem( sceneId, selfId, x808136_g_fmf_xh, 1 )
		DelItem( sceneId, selfId, x808136_g_fmf_ss, 1 )
		DelItem( sceneId, selfId, x808136_g_fmf_wl, 1 )
		DelItem( sceneId, selfId, x808136_g_fmf_jg, 1 )
		DelItem( sceneId, selfId, x808136_g_fmf_dh, 1 )
	
		
	  Msg2Player( sceneId, selfId, "@*;flagNPCdel;" .. sceneId .. ";" .. "太湖", MSG2PLAYER_PARA )
	  Msg2Player( sceneId, selfId, "@*;flashNPCdel;" .. sceneId .. ";" .. "太湖", MSG2PLAYER_PARA )
		
		
	end
end

--**********************************
--继续
--**********************************
function x808136_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x808136_g_MissionName)
		AddText(sceneId,x808136_g_MissionComplete)
		AddMoneyBonus( sceneId, x808136_g_MoneyBonus )
		for i, item in x808136_g_ItemBonus do
			AddItemBonus( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x808136_g_ScriptId,x808136_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x808136_CheckSubmit( sceneId, selfId )
	if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_th) >= 1 and  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_xh) >= 1  and  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_ss) >= 1  and  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_wl) >= 1  and  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_jg) >= 1  and  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_dh) >= 1   then
        return	1
        else
        return	0
        end
end

--**********************************
--提交
--**********************************
function x808136_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x808136_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x808136_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
			if ret > 0 then
					AddMoney(sceneId,selfId,x808136_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,160000)
					ret = DelMission( sceneId, selfId, x808136_g_MissionId )
					--移去任务物品
		            DelItem( sceneId, selfId, x808136_g_ItemId, 1 ) 
		            DelItem( sceneId, selfId, x808136_g_fmf_th, 1 )
		            DelItem( sceneId, selfId, x808136_g_fmf_xh, 1 )
		            DelItem( sceneId, selfId, x808136_g_fmf_ss, 1 )
		            DelItem( sceneId, selfId, x808136_g_fmf_wl, 1 )
		            DelItem( sceneId, selfId, x808136_g_fmf_jg, 1 )
		            DelItem( sceneId, selfId, x808136_g_fmf_dh, 1 )
                    DelItem( sceneId, selfId, x808136_g_rws, 1 )
				if ret > 0 then
					MissionCom( sceneId, selfId, x808136_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y完成任务：仲夏除魔第3环之设阵封魔",MSG2PLAYER_PARA )

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
function x808136_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x808136_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808136_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--道具使用
--**********************************
function x808136_OnUseItem( sceneId, selfId, BagIndex )
  if sceneId==4  then  
		didian="太湖"
	
	    treasureX = 160				--获得宝物X坐标
	    treasureZ = 252				--获得宝物Z坐标
	
	elseif sceneId==3  then
		didian="嵩山"
	 
	    treasureX = 275				--获得宝物X坐标
	    treasureZ = 85				--获得宝物Z坐标
		
	elseif sceneId==30  then
		didian="西湖"
		treasureX = 170				--获得宝物X坐标
	    treasureZ = 235
	elseif sceneId==6  then
		didian="无量山"
		treasureX = 53			--获得宝物X坐标
	    treasureZ = 264
	elseif sceneId==7  then
		didian="剑阁"
		treasureX = 130				--获得宝物X坐标
	    treasureZ = 135
		elseif sceneId==8  then
		didian="敦煌"
		treasureX = 260				--获得宝物X坐标
	    treasureZ = 260
	end	
	    
		--取得玩家当前坐标
	    PlayerX = GetHumanWorldX(sceneId,selfId)
	    PlayerZ = GetHumanWorldZ(sceneId,selfId)

	--计算玩家与安放点的距离
	      Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId==4  or sceneId==3  or sceneId==30   or sceneId==6   or sceneId==7   or sceneId==8  then
	
	end
	
	    if sceneId==4  then
	        if Distance <= 8 then
		        if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_th) < 1 then
		        CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[1].x, x808136_g_SignPost_1[1].z, x808136_g_SignPost_1[1].tip )
                        --CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
                local nBagIndex = TryRecieveItem( sceneId, selfId, x808136_g_fmf_th, 1 );
				local  xysl=  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_th)
                     if   xysl  ==  1   then
                        BeginEvent(sceneId)
			            AddText(sceneId,"冰心节杖已经在"..didian.."安放完毕！")
		                EndEvent(sceneId)
                        DispatchMissionTips(sceneId,selfId)
                     end
			     end	
             end   
		elseif  sceneId==3   then
		     if Distance <= 8 then
		        if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_ss) < 1 then
		           CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[2].x, x808136_g_SignPost_1[2].z, x808136_g_SignPost_1[2].tip )
                          --CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
                   local nBagIndex = TryRecieveItem( sceneId, selfId, x808136_g_fmf_ss, 1 );
				   local  xysl=  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_ss)
                     if   xysl  ==  1   then
                        BeginEvent(sceneId)
			            AddText(sceneId,"冰心节杖已经在"..didian.."安放完毕！")
		                EndEvent(sceneId)
                        DispatchMissionTips(sceneId,selfId)
                     end
			    end
			        
		     end
		elseif  sceneId==30   then
		     if Distance <= 8 then
		        if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_xh) < 1 then
		           CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[3].x, x808136_g_SignPost_1[3].z, x808136_g_SignPost_1[3].tip )
                         --CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
                   local nBagIndex = TryRecieveItem( sceneId, selfId, x808136_g_fmf_xh, 1 );
				   local  xysl=  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_xh)
                     if   xysl  ==  1   then
                        BeginEvent(sceneId)
			            AddText(sceneId,"冰心节杖已经在"..didian.."安放完毕！")
		                EndEvent(sceneId)
                        DispatchMissionTips(sceneId,selfId)
                     end
			    end
			        
		     end
		elseif  sceneId==6   then
		     if Distance <= 8 then
		        if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_wl) < 1 then
		           CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[4].x, x808136_g_SignPost_1[4].z, x808136_g_SignPost_1[4].tip )
                           --CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
                   local nBagIndex = TryRecieveItem( sceneId, selfId, x808136_g_fmf_wl, 1 );
				   local  xysl=  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_wl)
                     if   xysl  ==  1   then
                        BeginEvent(sceneId)
			            AddText(sceneId,"冰心节杖已经在"..didian.."安放完毕！")
		                EndEvent(sceneId)
                        DispatchMissionTips(sceneId,selfId)
                     end
			    end
			        
		     end
		elseif  sceneId==7   then
		     if Distance <= 8 then
		        if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_jg) < 1 then
		           CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[5].x, x808136_g_SignPost_1[5].z, x808136_g_SignPost_1[5].tip )
                           --CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
                   local nBagIndex = TryRecieveItem( sceneId, selfId, x808136_g_fmf_jg, 1 );
				   local  xysl=  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_jg)
                     if   xysl  ==  1   then
                        BeginEvent(sceneId)
			            AddText(sceneId,"冰心节杖已经在"..didian.."安放完毕！")
		                EndEvent(sceneId)
                        DispatchMissionTips(sceneId,selfId)
                     end
			    end
			        
		     end
		elseif  sceneId==8   then
		     if Distance <= 8 then
		        if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_dh) < 1 then
		           CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost_1[6].x, x808136_g_SignPost_1[6].z, x808136_g_SignPost_1[6].tip )
                           --CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808136_g_SignPost.x, x808136_g_SignPost.z, x808136_g_SignPost.tip )
                   local nBagIndex = TryRecieveItem( sceneId, selfId, x808136_g_fmf_dh, 1 );
				   local  xysl=  LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_dh)
                     if   xysl  ==  1   then
                        BeginEvent(sceneId)
			            AddText(sceneId,"冰心节杖已经在"..didian.."安放完毕！")
		                EndEvent(sceneId)
                        DispatchMissionTips(sceneId,selfId)
                     end
			    end
			        
		     end		
           
	    end

	--如果在所有场景安放冰心节杖完成
	     if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_th) >= 1   then
            th_bz = 1
		 end
		 if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_xh) >= 1   then
            xh_bz = 1
		 end
		 if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_ss) >= 1   then
            ss_bz = 1
		 end
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_wl) >= 1   then
            wl_bz = 1
		 end
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_jg) >= 1   then
            jg_bz = 1
		 end
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_dh) >= 1   then
            dh_bz = 1
		 end		
		 if  th_bz == 1  and  xh_bz == 1  and  ss_bz == 1  and  wl_bz == 1  and  jg_bz == 1  and  dh_bz == 1  then
                     SetMissionByIndex(sceneId,selfId,misIndex_fm,0,1)		--把任务状态变量设置为1,表示已经完成
		             SetMissionByIndex(sceneId,selfId,misIndex_fm,1,1)		--把任务状态变量设置为1,表示已经完成
	     end  
end
--**********************************
-- 屏幕中间信息提示
--**********************************
function x808136_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
