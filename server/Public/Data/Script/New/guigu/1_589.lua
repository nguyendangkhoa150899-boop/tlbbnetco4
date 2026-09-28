--K¸ch bän g¯c Hào 
x760589_g_scriptId = 760589

x760589_g_AllBoss = {4}
--##18Th¸ Cänh tßþng ID,Tham khäo SceneInfo.ini

--##N½i này là H® th¯ng Thông cáo ,Cån cÑ Phân t± IDTuyên b¯ Thông cáo ,Cùng T± BOSSChï Tuyên b¯ Mµt l¥n 
x760589_g_BossSysMsgByGroupID={}
x760589_g_BossSysMsgByGroupID[1]={Msg="@*;SrvMsg;SCA:#cFF0000thái h° [174.90]: #cff99ff12 môn phái giä nhân hàng lâm tÕi thái h° ðÕi tÑ l² lßþc sát hÕi thái h° bách tính, kÏ th§t lñc khä b¤t dung ti¬u th¸! Hæu ðäm lßþng ðích ngoÕn gia khä dî ti«n vãng thái h° tiªn hành ngh¸ch t§p chØng cÑu thái h° bách tính vu thüy thâm höa nhi®t chi trung #Y t÷a tiêu [174.90] phø c§n",isSended=0}
x760589_g_AllBoss[4]=
{	
	{ ID=51040, GroupId=1, Title="", PosX=174,  PosY=90, BaseAI=22, ExtAIScript=333, ScriptID=760589 },
	{ ID=51041, GroupId=1, Title="", PosX=174,  PosY=91, BaseAI=22, ExtAIScript=337, ScriptID=760589 },
	{ ID=51042, GroupId=1, Title="", PosX=174,  PosY=92, BaseAI=22, ExtAIScript=338, ScriptID=760589 },
	{ ID=51043, GroupId=1, Title="", PosX=174,  PosY=93, BaseAI=22, ExtAIScript=334, ScriptID=760589 },
	{ ID=51044, GroupId=1, Title="", PosX=174,  PosY=94, BaseAI=22, ExtAIScript=339, ScriptID=760589 },
	{ ID=51045, GroupId=1, Title="", PosX=175,  PosY=90, BaseAI=22, ExtAIScript=330, ScriptID=760589 },	
	{ ID=51046, GroupId=1, Title="", PosX=176,  PosY=90, BaseAI=22, ExtAIScript=332, ScriptID=760589 },
    { ID=51047, GroupId=1, Title="", PosX=177,  PosY=90, BaseAI=22, ExtAIScript=341, ScriptID=760589 },
	{ ID=51048, GroupId=1, Title="", PosX=178,  PosY=90, BaseAI=22, ExtAIScript=335, ScriptID=760589 },
    { ID=51049, GroupId=1, Title="", PosX=178,  PosY=91, BaseAI=22, ExtAIScript=336, ScriptID=760589 },
    { ID=51050, GroupId=1, Title="", PosX=176,  PosY=90, BaseAI=22, ExtAIScript=331, ScriptID=760589 },	
    { ID=51051, GroupId=1, Title="", PosX=177,  PosY=93, BaseAI=22, ExtAIScript=340, ScriptID=760589 },
	
}

--##Cänh tßþng Bän ð° Mu¯n thêm Mµt cái NPC,Lai Xúc phát K¸ch bän g¯c,Nhß yannan_monster.ini,scripttimerTh¸ K¸ch bän g¯c H°i Ði«u Th¶i gian ,60000Vi 60Mi¬u Thuyên chuy¬n Mµt l¥n K¸ch bän g¯c 
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=760589
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
function x760589_OnCharacterTimer(sceneId, objId, dataId, uTime)
	local nHour	= GetHour()--Gi¶ 
	local nMinute = GetMinute()--Phút 
	
	if sceneId==4 then	--##
		if (nHour==01 and nMinute==50) or (nHour==03 and nMinute==50) or (nHour==05 and nMinute==50) or (nHour==07 and nMinute==50) or (nHour==09 and nMinute==50) or (nHour==11 and nMinute==50) or (nHour==13 and nMinute==50) or (nHour==15 and nMinute==50) or (nHour==17 and nMinute==50) or (nHour==19 and nMinute==50) or (nHour==21 and nMinute==50) or (nHour==23 and nMinute==50) then --##21Ði¬m nØa Hòa 12Ði¬m nØa Xoát NhÕn Nam Cüa Quái 
			x760589_CreateMonster(sceneId)	--Xoát Quái 
		end
	end
	--AddGlobalCountNews(sceneId, nMinute)
	--Hüy bö Ð°ng h° 
	--SetCharacterTimer(sceneId, objId, 0)
end

--**********************************
--Xoát BOSS
--**********************************
function x760589_CreateMonster(sceneId)
	--##Tr÷ng Trí Thông cáo Tiêu thÑc 
	--for j,msgData in x760589_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--Xoát Quái Ti«n Nªu Quái T°n tÕi ThoÕi Toàn bµ Thanh không ,Tái Xoát 
	for i,data in x760589_g_AllBoss[sceneId] do
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
	for i,data in x760589_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID)
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x760589_SysMsg(sceneId, data.GroupId)
		
		
		
	end

  AddGlobalCountNews(sceneId, x760589_g_BossSysMsgByGroupID[1].Msg)	
	
end

--**********************************
--H® th¯ng Thông cáo 
--**********************************
function x760589_SysMsg(sceneId, groupId)
	if x760589_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe(sceneId, 0, x760589_g_BossSysMsgByGroupID[groupId].Msg, 4)
		AddGlobalCountNews(sceneId, x760589_g_BossSysMsgByGroupID[groupId].Msg)
		x760589_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760589_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x760589_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ðóng cØa Ð¯i thoÕi Khuông 
--**********************************
function x760589_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
