--K¸ch bän g¯c Hào 
x760437_g_scriptId = 760437

x760437_g_AllBoss = {714}
--##18Th¸ Cänh tßþng ID,Tham khäo SceneInfo.ini

--##N½i này là H® th¯ng Thông cáo ,Cån cÑ Phân t± IDTuyên b¯ Thông cáo ,Cùng T± BOSSChï Tuyên b¯ Mµt l¥n 
x760437_g_BossSysMsgByGroupID={}
x760437_g_BossSysMsgByGroupID[1]={Msg="",isSended=0}
x760437_g_AllBoss[714]=
{	
	{ ID=50001, GroupId=1, Title="ÐÕi bäo tß½ng", PosX=64, PosY=76, BaseAI=26, ExtAIScript=0, ScriptID=760437 },
	{ ID=50001, GroupId=1, Title="ÐÕi bäo tß½ng", PosX=53, PosY=64, BaseAI=26, ExtAIScript=0, ScriptID=760437 },
	{ ID=50001, GroupId=1, Title="ÐÕi bäo tß½ng", PosX=64, PosY=53, BaseAI=26, ExtAIScript=0, ScriptID=760437 },
	{ ID=50001, GroupId=1, Title="ÐÕi bäo tß½ng", PosX=75, PosY=64, BaseAI=26, ExtAIScript=0, ScriptID=760437 },
	{ ID=50001, GroupId=1, Title="ÐÕi bäo tß½ng", PosX=64, PosY=64, BaseAI=26, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50003, GroupId=1, Title="Trµm bäo Giä", PosX=64, PosY=48, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50003, GroupId=1, Title="Trµm bäo Giä", PosX=52, PosY=52, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50004, GroupId=1, Title="Trµm bäo Giä", PosX=47, PosY=64, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50004, GroupId=1, Title="Trµm bäo Giä", PosX=52, PosY=75, BaseAI=0, ExtAIScript=0, ScriptID=760437 },		
	{ ID=50005, GroupId=1, Title="Trµm bäo Giä", PosX=64, PosY=81, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50005, GroupId=1, Title="Trµm bäo Giä", PosX=76, PosY=76, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50006, GroupId=1, Title="Trµm bäo Giä", PosX=81, PosY=64, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50006, GroupId=1, Title="Trµm bäo Giä", PosX=76, PosY=53, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
	{ ID=50007, GroupId=1, Title="Trµm bäo Giä", PosX=59, PosY=65, BaseAI=0, ExtAIScript=0, ScriptID=760437 },		
	{ ID=50007, GroupId=1, Title="Trµm bäo Giä", PosX=69, PosY=65, BaseAI=0, ExtAIScript=0, ScriptID=760437 },	
}

--##Cänh tßþng Bän ð° Mu¯n thêm Mµt cái NPC,Lai Xúc phát K¸ch bän g¯c,Nhß yannan_monster.ini,scripttimerTh¸ K¸ch bän g¯c H°i Ði«u Th¶i gian ,60000Vi 60Mi¬u Thuyên chuy¬n Mµt l¥n K¸ch bän g¯c 
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=760437
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
--Xoát Quái Logic 
--**********************************
function x760437_OnCharacterTimer(sceneId, objId, dataId, uTime)
	local nHour	= GetHour()--Gi¶ 
	local nMinute = GetMinute()--Phút 
	
	if sceneId==714 then	--##Nh¤t Nguyên Kính 16:00 20:20 
		if (nHour==16 and nMinute==00) or (nHour==20 and nMinute==00) then --##16Ði¬m Hòa 20Ði¬m Xoát Nh¤t Nguyên Kính Cüa Quái 
			x760437_CreateMonster(sceneId)	--Xoát Quái 
		end
	end
	--AddGlobalCountNews(sceneId, nMinute)
	--Hüy bö Ð°ng h° 
	--SetCharacterTimer(sceneId, objId, 0)
end

--**********************************
--Xoát BOSS
--**********************************
function x760437_CreateMonster(sceneId)
	--##Tr÷ng Trí Thông cáo Tiêu thÑc 
	--for j,msgData in x760437_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--Xoát Quái Ti«n Nªu Quái T°n tÕi ThoÕi Toàn bµ Thanh không ,Tái Xoát 
	for i,data in x760437_g_AllBoss[sceneId] do
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			local MosDataID = GetMonsterDataID(sceneId, MonsterId)
			if MosDataID == data.ID then
				--Thanh quái 
				LuaFnDeleteMonster(sceneId, MonsterId)
			end		
		end
	end
	--Xoát Quái 
	for i,data in x760437_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID)
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x760437_SysMsg(sceneId, data.GroupId)
		
		
		
	end
	
	AddGlobalCountNews(sceneId, x760437_g_BossSysMsgByGroupID[1].Msg)

end

--**********************************
--H® th¯ng Thông cáo 
--**********************************
function x760437_SysMsg(sceneId, groupId)
	if x760437_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe(sceneId, 0, x760437_g_BossSysMsgByGroupID[groupId].Msg, 4)
		AddGlobalCountNews(sceneId, x760437_g_BossSysMsgByGroupID[groupId].Msg)
		x760437_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760437_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x760437_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ðóng cØa Ð¯i thoÕi Khuông 
--**********************************
function x760437_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
