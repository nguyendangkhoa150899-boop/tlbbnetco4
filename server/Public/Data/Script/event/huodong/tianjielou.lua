--天劫楼   司马逍遥 2013年1月27日修复,2014年6月云雀再次修改
--除恶天劫楼
--MisDescBegin
--脚本号
x808138_g_ScriptId  = 808138

--接受任务NPC属性
x808138_g_Position_X=70
x808138_g_Position_Z=81
x808138_g_AccomplishNPC_Name="付劫生"

--任务号
x808138_g_MissionId = 1711

--目标NPC
x808138_g_Name	="付劫生"

--任务归类
x808138_g_MissionKind = 1

x808138_g_MissionLevel = 10

--是否是精英任务
x808138_g_IfMissionElite = 0

x808138_g_MissionRound = 9
--任务是否已经完成
x808138_g_IsMissionOkFail = 0		--变量的第0位

--任务需要杀死的怪
x808138_g_DemandKill ={{id=13800,num=20}}		--变量第1位
--x808138_g_DemandKill ={{name="天劫楼恶人",num=20}}

--以上是动态**************************************************************

--任务文本描述
x808138_g_MissionName="除恶天劫楼"
x808138_g_MissionInfo="#{TJL_090714_03}" --任务描述
x808138_g_MissionTarget="#{TJL_090714_04}"	--任务目标
x808138_g_ContinueInfo="#{TJL_090714_05}"	--未完成任务的npc对话
x808138_g_MissionComplete=" 大侠为天下百姓而奋力除恶，实在令人倾佩！"	--完成任务npc说话的话
x808138_g_SignPost = {x = 70, z = 81, tip = "付劫生"}
--任务奖励

x808138_g_MoneyBonus=10000

x808138_g_RadioItemBonus={{id=38000188,num=1},{id=38000943,num=1},{id=38000944,num=1},{id=38000945,num=1}} --绛紫仙露，乾元金丹，坤武金丹，玄机药尘	
x808138_g_DemandTrueKill ={{name="天劫楼恶人",num=20}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x808138_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
    local huan = GetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN)
     if huan>=10 then
     SetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN,0)
     end
     if huan < 100000 then 
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x808138_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x808138_g_MissionName)
			AddText(sceneId,x808138_g_ContinueInfo)
			AddMoneyBonus( sceneId, x808138_g_MoneyBonus )
		EndEvent( )
		bDone = x808138_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x808138_g_ScriptId ,x808138_g_MissionId,bDone)
        --满足任务接收条件
        elseif x808138_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x808138_g_MissionName)
				AddText(sceneId,x808138_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x808138_g_MissionTarget)
				AddMoneyBonus( sceneId, x808138_g_MoneyBonus )
                                for i, item in x808138_g_RadioItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x808138_g_ScriptId ,x808138_g_MissionId)
        end
    elseif huan >= 100000 then
        BeginEvent(sceneId)
	AddText(sceneId,x808138_g_MissionName)
	AddText(sceneId,"#{TJL_090714_02}")
        EndEvent(sceneId )
	DispatchEventList(sceneId,selfId,targetId)
    end
end

--**********************************
--列举事件
--**********************************
function x808138_OnEnumerate( sceneId, selfId, targetId )

    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x808138_g_MissionId) > 0 then
		AddNumText(sceneId,x808138_g_ScriptId ,x808138_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x808138_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x808138_g_ScriptId ,x808138_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x808138_CheckAccept( sceneId, selfId )
	--需要9级才能接
	if GetLevel( sceneId, selfId ) >= 9 then
		return 1
	else
		return 0
	end

end

--**********************************
--接受
--**********************************
function x808138_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
        local huan = GetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN)
	AddMission( sceneId,selfId, x808138_g_MissionId, x808138_g_ScriptId , 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x808138_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：除恶天劫楼",MSG2PLAYER_PARA )
	        BeginEvent(sceneId)
	        strText = format("接受任务：除恶天劫楼，当前为第%d环",huan+1)
	        AddText(sceneId,strText);
	        EndEvent(sceneId)
	        DispatchMissionTips(sceneId,selfId)
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x808138_g_SignPost.x, x808138_g_SignPost.z, x808138_g_SignPost.tip )

end

--**********************************
--放弃
--**********************************
function x808138_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x808138_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x808138_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x808138_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x808138_g_MissionName)
		AddText(sceneId,x808138_g_MissionComplete)
		AddMoneyBonus( sceneId, x808138_g_MoneyBonus )
    for i, item in x808138_g_RadioItemBonus do
	AddRadioItemBonus( sceneId, item.id, item.num )
	end

    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x808138_g_ScriptId ,x808138_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x808138_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x808138_g_MissionId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x808138_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x808138_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--提交
--**********************************
function x808138_OnSubmit( sceneId, selfId, targetId,selectRadioId )
    if x808138_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
BeginAddItem(sceneId)
for i, item in x808138_g_RadioItemBonus do
       if item.id == selectRadioId then
	  AddItem( sceneId,item.id, item.num )
	 end
	end
 EndAddItem(sceneId,selfId)
	ret = 1
        local huan = GetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN)
		local gameplayLevel=GetLevel( sceneId, selfId)
		if gameplayLevel>=9 and gameplayLevel<=19 then
	local x808138_g_MoneyBonus=20000
	ExpJiangLi=40000
elseif gameplayLevel>=20 and gameplayLevel<=29 then
    if huan+1==1 then    
	x808138_g_MoneyBonus=30000
	ExpJiangLi=50000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=40000
	ExpJiangLi=70000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=50000
	ExpJiangLi=90000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=60000
	ExpJiangLi=110000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=70000
	ExpJiangLi=130000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=80000
	ExpJiangLi=150000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=420000
	end
elseif gameplayLevel>=30 and gameplayLevel<=39 then
    if huan+1==1 then
    x808138_g_MoneyBonus=40000
	ExpJiangLi=70000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=50000
	ExpJiangLi=90000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=60000
	ExpJiangLi=110000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=70000
	ExpJiangLi=130000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=80000
	ExpJiangLi=150000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=460000
	end
elseif gameplayLevel>=40 and gameplayLevel<=49 then
    if huan+1==1 then
	x808138_g_MoneyBonus=50000
	ExpJiangLi=90000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=60000
	ExpJiangLi=110000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=70000
	ExpJiangLi=130000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=80000
	ExpJiangLi=150000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=500000
	end
elseif gameplayLevel>=50 and gameplayLevel<=59 then
    if huan+1==1 then
	x808138_g_MoneyBonus=60000
	ExpJiangLi=110000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=70000
	ExpJiangLi=130000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=80000
	ExpJiangLi=150000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=540000
	end
elseif gameplayLevel>=60 and gameplayLevel<=69 then
    if huan+1==1 then
	x808138_g_MoneyBonus=70000
	ExpJiangLi=130000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=80000
	ExpJiangLi=150000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=580000
	end
elseif gameplayLevel>=70 and gameplayLevel<=79 then
    if huan+1==1 then
	x808138_g_MoneyBonus=80000
	ExpJiangLi=150000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=620000
	end
elseif gameplayLevel>=80 and gameplayLevel<=89 then
    if huan+1==1 then
	x808138_g_MoneyBonus=90000
	ExpJiangLi=170000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=660000
	end
elseif gameplayLevel>=90 and gameplayLevel<=99 then
    if huan+1==1 then
	x808138_g_MoneyBonus=100000
	ExpJiangLi=190000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=350000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=190000
	ExpJiangLi=700000
	end
elseif gameplayLevel>=100 and gameplayLevel<=109 then
    if huan+1==1 then
	x808138_g_MoneyBonus=110000
	ExpJiangLi=210000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=350000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=190000
	ExpJiangLi=370000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=200000
	ExpJiangLi=740000
	end
elseif gameplayLevel>=110 and gameplayLevel<=119 then
    if huan+1==1 then
	x808138_g_MoneyBonus=120000
	ExpJiangLi=230000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=350000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=190000
	ExpJiangLi=370000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=200000
	ExpJiangLi=390000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=210000
	ExpJiangLi=780000
	end
elseif gameplayLevel>=120 and gameplayLevel<=129 then
    if huan+1==1 then
	x808138_g_MoneyBonus=130000
	ExpJiangLi=250000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=350000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=190000
	ExpJiangLi=370000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=200000
	ExpJiangLi=390000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=210000
	ExpJiangLi=410000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=220000
	ExpJiangLi=820000
	end
elseif gameplayLevel>=130 and gameplayLevel<=139 then
    if huan+1==1 then
	x808138_g_MoneyBonus=140000
	ExpJiangLi=270000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=350000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=190000
	ExpJiangLi=370000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=200000
	ExpJiangLi=390000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=210000
	ExpJiangLi=410000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=220000
	ExpJiangLi=430000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=230000
	ExpJiangLi=860000
	end
elseif gameplayLevel>=140 then
    if huan+1==1 then
	x808138_g_MoneyBonus=150000
	ExpJiangLi=290000
	elseif huan+1==2 then
	x808138_g_MoneyBonus=160000
	ExpJiangLi=310000
	elseif huan+1==3 then
	x808138_g_MoneyBonus=170000
	ExpJiangLi=330000
	elseif huan+1==4 then
	x808138_g_MoneyBonus=180000
	ExpJiangLi=350000
	elseif huan+1==5 then
	x808138_g_MoneyBonus=190000
	ExpJiangLi=370000
	elseif huan+1==6 then
	x808138_g_MoneyBonus=200000
	ExpJiangLi=390000
	elseif huan+1==7 then
	x808138_g_MoneyBonus=210000
	ExpJiangLi=410000
	elseif huan+1==8 then
	x808138_g_MoneyBonus=220000
	ExpJiangLi=430000
	elseif huan+1==9 then
	x808138_g_MoneyBonus=230000
	ExpJiangLi=450000
	elseif huan+1==10 then
	x808138_g_MoneyBonus=240000
	ExpJiangLi=900000
	end									
end
		--添加任务奖励
	if ret > 0 then
	    AddMoney(sceneId,selfId,x808138_g_MoneyBonus );
	    LuaFnAddExp( sceneId, selfId,ExpJiangLi)
          AddItem( sceneId,x808138_g_RadioItemBonus,1)
	    ret = DelMission( sceneId, selfId, x808138_g_MissionId )
	    if ret > 0 then
		MissionCom( sceneId, selfId, x808138_g_MissionId )
		AddItemListToHuman(sceneId,selfId)
                SetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN,huan+1)
		Msg2Player(  sceneId, selfId,"#Y完成任务：除恶天劫楼",MSG2PLAYER_PARA )
	        BeginEvent(sceneId)
	        strText = format("任务完成，当前为第%d环",huan+1)
	        AddText(sceneId,strText);
	        EndEvent(sceneId)
	        DispatchMissionTips(sceneId,selfId)
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
function x808138_OnKillObject( sceneId, selfId, objdataId ,objId)
	
	if GetName(sceneId,objId) == x808138_g_DemandTrueKill[1].name	  then
		-- 获得所有人
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看有没有这个任务
			if IsHaveMission(sceneId, humanObjId, x808138_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x808138_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)

	 			if nNum < x808138_g_DemandTrueKill[1].num then
	 				if nNum == x808138_g_DemandTrueKill[1].num - 1 then
	 					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
	 				end
	 				
			    SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
			  	BeginEvent(sceneId)
					strText = format("已杀死天劫楼恶人%d/20", GetMissionParam(sceneId,humanObjId,misIndex,1) )
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
function x808138_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808138_OnItemChanged( sceneId, selfId, itemdataId )
end
