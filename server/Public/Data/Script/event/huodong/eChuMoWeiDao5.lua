--杀怪任务之除魔卫道
--除魔卫道任务 2017年7月编制 云雀
--MisDescBegin
--脚本号
x808142_g_ScriptId = 808142
x808142_g_KDZZID = 1006000310
x808142_g_rws =  40001115
--接受任务NPC属性
x808142_g_Position_X=282
x808142_g_Position_Z=276
x808142_g_SceneID=1
x808142_g_AccomplishNPC_Name="梁道士"

--上一个任务的ID
--g_MissionIdPre =

--任务号
x808142_g_MissionId = 1158

--目标NPC
x808142_g_Name	="梁道士"

--任务归类
x808142_g_MissionKind = 12

--任务等级
x808142_g_MissionLevel = 10000

--是否是精英任务
x808142_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x808142_g_IsMissionOkFail = 0		--变量的第0位

x808142_g_SignPost_1 = {x = 282, z = 276, tip = "梁道士"}
--**********************************
--任务奖励
x808142_g_MoneyBonus=40000
x808142_g_ItemBonus={{id=30505255,num=3},{id=39999901,num=1},{id=38000188,num=1}}
--以上是动态**************************************************************

--任务文本描述
x808142_g_MissionName="除魔卫道"
x808142_g_MissionInfo="    许愿树通过这片祈愿叶将暑魔的踪迹告诉了我。这些孽畜果然极尽狡猾之能事！它们现在藏匿在一些野外怪物的体内。即不易被发现，还可以通过控制怪物的神经，来达到危害人间的目的。现在请你去打败那些被暑魔控制的怪物，让暑魔不能遁形，以助我封印暑魔。"
x808142_g_MissionTarget="    到石林打败20个棕熊#{_INFOAIM273,45,26,},将暑魔从怪物体内驱逐出来，然后回到梁道士#{_INFOAIM282,276,1,梁道士}这里交还任务。"
x808142_g_ContinueInfo="    你已经将被暑魔侵入的怪物打败了吗？如果已经将暑魔驱逐出来后，我们就可以开始封印暑魔了。"
x808142_g_MissionComplete="    少侠做得很好，我们可以开始封印暑魔了！"
x808142_g_StrForePart 				= 4
x808142_g_FormatList = {"    到石林打败20个棕熊#{_INFOAIM273,45,26,},将暑魔从怪物体内驱逐出来，然后回到梁道士#{_INFOAIM282,276,1,梁道士}这里交还任务。",}

--杀怪信息
x808142_g_StrList = {
"雁南",
"龙泉",
"苍山",
"雁北",
"石林",
"武夷",
"梅岭",
"草原",
"辽西",
"玉溪",
"南诏",
"南海",
"琼州",
"琼州",
"秦家寨亲兵#{_INFOAIM68,201,18,}",
"龙泉豹#{_INFOAIM79,250,31,}",
"狼族头人#{_INFOAIM138,236,25,}",
"红枫蜘蛛#{_INFOAIM150,200,19,}",
"棕熊#{_INFOAIM273,45,26,}",
"树甲哨兵#{_INFOAIM258,125,32,}",
"红袍蜘蛛#{_INFOAIM40,250,33,}",
"弯刀马匪#{_INFOAIM273,156,20,}",
"白狼王#{_INFOAIM161,268,21,}",
"偃师护法#{_INFOAIM222,213,27,}",
"丛林蜂#{_INFOAIM193,95,28,}",
"南海海盗#{_INFOAIM239,216,34,}",
"鳄鱼帮杀手#{_INFOAIM160,100,35,}",
"南海盗神#{_INFOAIM252,63,35,}",
}
x808142_g_SignPost = {x = 68, z = 201, tip = "秦家寨亲兵"}
x808142_g_SignPost2 = {x = 79, z = 250, tip = "龙泉豹"}
x808142_g_SignPost3 = {x = 138, z = 236, tip = "狼族头人"}
x808142_g_SignPost4 = {x = 150, z = 200, tip = "红枫蜘蛛"}
x808142_g_SignPost5 = {x = 273, z = 45, tip = "棕熊"}
x808142_g_SignPost6 = {x = 273, z = 156, tip = "弯刀马匪"}
x808142_g_SignPost7 = {x = 258, z = 125, tip = "树甲哨兵"}
x808142_g_SignPost8 = {x = 40, z = 250, tip = "红袍蜘蛛"}
x808142_g_SignPost9 = {x = 161, z = 268, tip = "白狼王"}
x808142_g_SignPost10 = {x = 222, z = 213, tip = "偃师护法"}
x808142_g_SignPost11 = {x = 193, z = 95, tip = "丛林蜂"}
x808142_g_SignPost12 = {x = 239, z = 216, tip = "南海海盗"}
x808142_g_SignPost13 = {x = 160, z = 100, tip = "鳄鱼帮杀手"}
x808142_g_SignPost14 = {x = 252, z = 63, tip = "南海盗神"}

--MisDescEnd
  x808142_g_DemandTrueKill ={{name="秦家寨亲兵",num=20,cjh=18}}
  x808142_g_DemandTrueKill2 ={{name="龙泉豹",num=20,cjh=31}}
  x808142_g_DemandTrueKill3 ={{name="狼族头人",num=20,cjh=25}}
  x808142_g_DemandTrueKill4 ={{name="红枫蜘蛛",num=20,cjh=19}}
  x808142_g_DemandTrueKill5 ={{name="棕熊",num=20,cjh=26}}
  x808142_g_DemandTrueKill6 ={{name="弯刀马匪",num=20,cjh=20}}
  x808142_g_DemandTrueKill7 ={{name="树甲哨兵",num=20,cjh=32}}
  x808142_g_DemandTrueKill8 ={{name="红袍蜘蛛",num=20,cjh=33}}
  x808142_g_DemandTrueKill9 ={{name="白狼王",num=20,cjh=21}}
  x808142_g_DemandTrueKill10 ={{name="偃师护法",num=20,cjh=27}}
  x808142_g_DemandTrueKill11 ={{name="丛林蜂",num=20,cjh=28}}
  x808142_g_DemandTrueKill12 ={{name="南海海盗",num=20,cjh=34}}
  x808142_g_DemandTrueKill13 ={{name="鳄鱼帮杀手",num=20,cjh=35}}
  x808142_g_DemandTrueKill14 ={{name="南海盗神",num=20,cjh=35}}

  x808142_g_shaguaixinxi = {{cjname = "雁南",guaiwu = "秦家寨亲兵#{_INFOAIM68,201,18,}"}}						
  x808142_g_shaguaixinxi2 = {{cjname = "龙泉",guaiwu = "龙泉豹#{_INFOAIM79,250,31,}"}}
  x808142_g_shaguaixinxi3 = {{cjname = "苍山",guaiwu = "狼族头人#{_INFOAIM138,236,25,}"}}
  x808142_g_shaguaixinxi4 = {{cjname = "雁北",guaiwu = "红枫蜘蛛#{_INFOAIM150,200,19,}"}}
  x808142_g_shaguaixinxi5 = {{cjname = "石林",guaiwu = "棕熊#{_INFOAIM273,45,26,}"}}
  x808142_g_shaguaixinxi6 = {{cjname = "草原",guaiwu = "弯刀马匪#{_INFOAIM273,156,20,}"}}
  x808142_g_shaguaixinxi7 = {{cjname = "武夷",guaiwu = "树甲哨兵#{_INFOAIM258,125,32,}"}}
  x808142_g_shaguaixinxi8 = {{cjname = "梅岭",guaiwu = "红袍蜘蛛#{_INFOAIM40,250,33,}"}}
  x808142_g_shaguaixinxi9 = {{cjname = "辽西",guaiwu = "白狼王#{_INFOAIM161,268,21,}"}}
  x808142_g_shaguaixinxi10 = {{cjname = "玉溪",guaiwu = "偃师护法#{_INFOAIM222,213,27,}"}}
  x808142_g_shaguaixinxi11 = {{cjname = "南诏",guaiwu = "丛林蜂#{_INFOAIM193,95,28,}"}}
  x808142_g_shaguaixinxi12 = {{cjname = "南海",guaiwu = "南海海盗#{_INFOAIM239,216,34,}"}}
  x808142_g_shaguaixinxi13 = {{cjname = "琼州",guaiwu = "鳄鱼帮杀手#{_INFOAIM160,100,35,}"}}
  x808142_g_shaguaixinxi14 = {{cjname = "琼州",guaiwu = "南海盗神#{_INFOAIM252,63,35,}"}}
function x808142_GetStrIndexByStrValue(stringV)
	for i, v in x808142_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("必须将%s注册到StrList中", stringV)
	--PrintStr(strText)
	return 0;
end								
--**********************************
--任务入口函数
--**********************************
function x808142_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x808142_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x808142_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x808142_g_MissionName)
			AddText(sceneId,x808142_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x808142_g_MoneyBonus )
		EndEvent( )
		bDone = x808142_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x808142_g_ScriptId,x808142_g_MissionId,bDone)
    --满足任务接收条件
    elseif x808142_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x808142_g_MissionName)
				AddText(sceneId,x808142_g_MissionInfo)
				AddText(sceneId,x808142_g_MissionTarget)
				for i, item in x808142_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x808142_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x808142_g_ScriptId,x808142_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x808142_OnEnumerate( sceneId, selfId, targetId )
         --local td = GetTime2Day()
	   --  local lt = GetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME)
	     --if td == lt then 
	        --x808142_MsgBox(sceneId, selfId,targetId,"    每天只能领取1次仲夏除魔任务！" )
	--	    return
	  --   end
	local playerlevel = GetLevel( sceneId, selfId )
	if playerlevel < 64  or  playerlevel >= 67  then
	    return 0
	end
    --检测上一个任务完成情况，是否有任务完成书
    if LuaFnGetAvailableItemCount( sceneId, selfId, x808142_g_rws ) < 1 then
		return
	end
    --如果玩家完成过这个任务
    --if IsMissionHaveDone(sceneId,selfId,x808142_g_MissionId) > 0 then
    --	return
	--end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x808142_g_MissionId) > 0 then
			AddNumText(sceneId,x808142_g_ScriptId,x808142_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x808142_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x808142_g_ScriptId,x808142_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x808142_CheckAccept( sceneId, selfId )
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
function x808142_OnAccept( sceneId, selfId )
	local odds = random( 60000 )
	local PlayerLevel  = GetLevel(sceneId, selfId)
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x808142_g_MissionId, x808142_g_ScriptId, 1, 0, 0 )		--添加任务
	Msg2Player(  sceneId, selfId,"#Y接受任务：除魔卫道",MSG2PLAYER_PARA )
	misIndex = GetMissionIndexByID(sceneId,selfId,x808142_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0

	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808142_g_SignPost_1.x, x808142_g_SignPost_1.z, x808142_g_SignPost_1.tip )--梁道士
	if PlayerLevel >= 30 and PlayerLevel < 40 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill[1].cjh, x808142_g_SignPost.x, x808142_g_SignPost.z, x808142_g_SignPost.tip )--怪
	elseif PlayerLevel >= 40 and PlayerLevel < 50 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill2[1].cjh, x808142_g_SignPost2.x, x808142_g_SignPost2.z, x808142_g_SignPost2.tip )--怪
	elseif PlayerLevel >= 50 and PlayerLevel < 60 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill3[1].cjh, x808142_g_SignPost3.x, x808142_g_SignPost3.z, x808142_g_SignPost3.tip )--怪
	elseif PlayerLevel >= 60 and PlayerLevel < 64 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill4[1].cjh, x808142_g_SignPost4.x, x808142_g_SignPost4.z, x808142_g_SignPost4.tip )--怪
	elseif PlayerLevel >= 64 and PlayerLevel < 67 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill5[1].cjh, x808142_g_SignPost5.x, x808142_g_SignPost5.z, x808142_g_SignPost5.tip )--怪
	elseif PlayerLevel >= 67 and PlayerLevel < 70 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill6[1].cjh, x808142_g_SignPost6.x, x808142_g_SignPost6.z, x808142_g_SignPost6.tip )--怪
	elseif PlayerLevel >= 70 and PlayerLevel < 74 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill7[1].cjh, x808142_g_SignPost7.x, x808142_g_SignPost7.z, x808142_g_SignPost7.tip )--怪
	elseif PlayerLevel >= 74 and PlayerLevel < 77 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill8[1].cjh, x808142_g_SignPost8.x, x808142_g_SignPost8.z, x808142_g_SignPost8.tip )--怪
	elseif PlayerLevel >= 77 and PlayerLevel < 80 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill9[1].cjh, x808142_g_SignPost9.x, x808142_g_SignPost9.z, x808142_g_SignPost9.tip )--怪
	elseif PlayerLevel >= 80 and PlayerLevel < 84 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill10[1].cjh, x808142_g_SignPost10.x, x808142_g_SignPost10.z, x808142_g_SignPost10.tip )--怪
	elseif PlayerLevel >= 84 and PlayerLevel < 87 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill11[1].cjh, x808142_g_SignPost11.x, x808142_g_SignPost11.z, x808142_g_SignPost11.tip )--怪
	elseif PlayerLevel >= 87 and PlayerLevel < 90 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill12[1].cjh, x808142_g_SignPost12.x, x808142_g_SignPost12.z, x808142_g_SignPost12.tip )--怪
	elseif PlayerLevel >= 90 and PlayerLevel < 96 then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill13[1].cjh, x808142_g_SignPost13.x, x808142_g_SignPost13.z, x808142_g_SignPost13.tip )--怪
	elseif PlayerLevel >= 96  then
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, x808142_g_DemandTrueKill14[1].cjh, x808142_g_SignPost14.x, x808142_g_SignPost14.z, x808142_g_SignPost14.tip )--怪
	end
end
--**********************************
--放弃
--**********************************
function x808142_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x808142_g_MissionId )
  LuaFnDelAvailableItem( sceneId, selfId, x808142_g_rws, 1 )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x808142_g_SignPost_1.tip )
end

--**********************************
--继续
--**********************************
function x808142_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x808142_g_MissionName)
		AddText(sceneId,x808142_g_MissionComplete)
		AddMoneyBonus( sceneId, x808142_g_MoneyBonus )
		for i, item in x808142_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x808142_g_ScriptId,x808142_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x808142_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x808142_g_MissionId )
	if bRet == 1 then
		return 1
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x808142_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x808142_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x808142_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x808142_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
	if ret > 0 then
			AddMoney(sceneId,selfId,x808142_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 80000)
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x808142_g_MissionId )
		if ret > 0 then
                SetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME,td)                
		--LuaFnDelAvailableItem( sceneId, selfId, x808142_g_rws, 1 )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y完成任务：除魔卫道",MSG2PLAYER_PARA )
				CallScriptFunction( 808136, "OnDefaultEvent",sceneId, selfId, targetId)
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
function x808142_OnKillObject( sceneId, selfId, objdataId ,objId)
	odds = random( 60000 )
	local PlayerLevel = GetLevel( sceneId, selfId )
	if PlayerLevel >= 30 and PlayerLevel < 40 then
	 guainame = x808142_g_DemandTrueKill[1].name
	 shaguaishu = x808142_g_DemandTrueKill[1].num
	elseif PlayerLevel >= 40 and PlayerLevel < 50 then
	 guainame = x808142_g_DemandTrueKill2[1].name
	 shaguaishu = x808142_g_DemandTrueKill2[1].num
	elseif PlayerLevel >= 50 and PlayerLevel < 60 then
	 guainame = x808142_g_DemandTrueKill3[1].name
	 shaguaishu = x808142_g_DemandTrueKill3[1].num
	elseif PlayerLevel >= 60 and PlayerLevel < 64 then
	 guainame = x808142_g_DemandTrueKill4[1].name
	 shaguaishu = x808142_g_DemandTrueKill4[1].num
	elseif PlayerLevel >= 64 and PlayerLevel < 67 then
	 guainame = x808142_g_DemandTrueKill5[1].name
	 shaguaishu = x808142_g_DemandTrueKill5[1].num
	elseif PlayerLevel >= 67 and PlayerLevel < 70 then
	 guainame = x808142_g_DemandTrueKill6[1].name
	 shaguaishu = x808142_g_DemandTrueKill6[1].num
	elseif PlayerLevel >= 70 and PlayerLevel < 74 then
	 guainame = x808142_g_DemandTrueKill7[1].name
	 shaguaishu = x808142_g_DemandTrueKill7[1].num
	elseif PlayerLevel >= 74 and PlayerLevel < 77 then
	 guainame = x808142_g_DemandTrueKill8[1].name
	 shaguaishu = x808142_g_DemandTrueKill8[1].num
	elseif PlayerLevel >= 77 and PlayerLevel < 80 then
	 guainame = x808142_g_DemandTrueKill9[1].name
	 shaguaishu = x808142_g_DemandTrueKill9[1].num
	elseif PlayerLevel >= 80 and PlayerLevel < 84 then
	 guainame = x808142_g_DemandTrueKill10[1].name
	 shaguaishu = x808142_g_DemandTrueKill10[1].num
	elseif PlayerLevel >= 84 and PlayerLevel < 87 then
	 guainame = x808142_g_DemandTrueKill11[1].name
	 shaguaishu = x808142_g_DemandTrueKill11[1].num
	elseif PlayerLevel >= 87 and PlayerLevel < 90 then
	 guainame = x808142_g_DemandTrueKill12[1].name
	 shaguaishu = x808142_g_DemandTrueKill12[1].num
	elseif PlayerLevel >= 90 and PlayerLevel < 96 then
	 guainame = x808142_g_DemandTrueKill13[1].name
	 shaguaishu = x808142_g_DemandTrueKill13[1].num
	elseif PlayerLevel >= 96  then
	 guainame = x808142_g_DemandTrueKill14[1].name
	 shaguaishu = x808142_g_DemandTrueKill14[1].num
	end
	if GetName(sceneId,objId) == guainame	  then
		-- 获得所有人
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看有没有这个任务
			if IsHaveMission(sceneId, humanObjId, x808142_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x808142_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)

	 			if nNum < shaguaishu then
	 				if nNum == shaguaishu - 1 then
	 					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
	 				end
	 				
			    SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
			  	BeginEvent(sceneId)
					strText = format("已杀死%d/20", GetMissionParam(sceneId,humanObjId,misIndex,1) )
					AddText(sceneId,strText);
			  	EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
				else
				BeginEvent(sceneId)
					strText = format("任务已经完成，快回去交任务吧！")
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
function x808142_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808142_OnItemChanged( sceneId, selfId, itemdataId )
end
