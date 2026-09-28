--脚本号
x100125_g_scriptId = 100125

x100125_g_AllBoss = {489}
--##18是场景ID，参考SceneInfo.ini

--##这里是系统公告，根据分组ID发布公告，同一组BOSS只发布一次
x100125_g_BossSysMsgByGroupID={}
x100125_g_BossSysMsgByGroupID[1]={Msg="#cFF0000林海溪谷：#cff99ff四大神兽降临神域，实力非凡！有人可去瞻仰否?#r#Y坐标[91,193][120,218][229,127][206,92]",isSended=0}
x100125_g_AllBoss[489]=
{	
	{ ID=14687, GroupId=1, Title="", PosX=91,  PosY=193, BaseAI=21, ExtAIScript=255, ScriptID=100125 },
	{ ID=14688, GroupId=1, Title="", PosX=120,  PosY=218, BaseAI=21, ExtAIScript=255, ScriptID=100125 },
	{ ID=14689, GroupId=1, Title="", PosX=229,  PosY=127, BaseAI=21, ExtAIScript=255, ScriptID=100125 },
	{ ID=14690, GroupId=1, Title="", PosX=206,  PosY=92, BaseAI=21, ExtAIScript=255, ScriptID=100125 },
}

--##场景地图要加一个NPC，来触发脚本,如yannan_monster.ini，scripttimer是脚本回调时间，60000为60秒调用一次脚本
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=100125
-- respawn_time=1800000
-- base_ai=3
-- scripttimer=60000		
-- group_id=-1
-- team_id=-1
-- patrol_id=-1
-- shop0=-1
-- shop1=-1
-- shop2=-1
-- shop3=-1
-- ReputationID=-1
--**********************************
--刷怪逻辑
--**********************************
function x100125_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--小时
	local nMinute = GetMinute()--分钟
	
	if sceneId==508 then	--##玄海01:20 04:20 07:20 10:20 13:20 16:20 19:20 22:20 
		if (nHour==00 and nMinute==45) or (nHour==03 and nMinute==45) or (nHour==06 and nMinute==45) or (nHour==09 and nMinute==45) or (nHour==12 and nMinute==45) or (nHour==15 and nMinute==45) or (nHour==18 and nMinute==45) or (nHour==21 and nMinute==45) then --##21点半和12点半刷雁南的怪
			x100125_CreateMonster( sceneId )	--刷怪
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--取消时钟
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--刷BOSS
--**********************************
function x100125_CreateMonster( sceneId )
	--##重置公告标识
	--for j,msgData in x100125_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--刷怪前如果怪存在的话全部清空，再刷
	for i,data in x100125_g_AllBoss[sceneId] do
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			local MosDataID = GetMonsterDataID( sceneId, MonsterId )
			if MosDataID == data.ID then
				--清怪
				LuaFnDeleteMonster(sceneId, MonsterId)
			end		
		end
	end
	--刷怪
	for i,data in x100125_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID )
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x100125_SysMsg( sceneId, data.GroupId )
		
		
		
	end
	
	AddGlobalCountNews( sceneId, x100125_g_BossSysMsgByGroupID[1].Msg )

end

--**********************************
--系统公告
--**********************************
function x100125_SysMsg( sceneId, groupId )
	if x100125_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x100125_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x100125_g_BossSysMsgByGroupID[groupId].Msg )
		x100125_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x100125_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x100125_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--关闭对话框
--**********************************
function x100125_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end