--K¸ch bän g¯c Hào 
x760583_g_scriptId = 760583

x760583_g_AllBoss = {24}
--##18Th¸ Cänh tßþng ID,Tham khäo SceneInfo.ini

--##N½i này là H® th¯ng Thông cáo ,Cån cÑ Phân t± IDTuyên b¯ Thông cáo ,Cùng T± BOSSChï Tuyên b¯ Mµt l¥n 
x760583_g_BossSysMsgByGroupID={}
x760583_g_BossSysMsgByGroupID[1]={Msg="@*;SrvMsg;SCA:#cFF0000nh¸ häi [227.257]: #cff99ff12 môn phái giä nhân hàng lâm tÕi nh¸ häi ðÕi tÑ l² lßþc sát hÕi nh¸ häi bách tính, kÏ th§t lñc khä b¤t dung ti¬u th¸! Hæu ðäm lßþng ðích ngoÕn gia khä dî ti«n vãng nh¸ häi tiªn hành ngh¸ch t§p chØng cÑu nh¸ häi bách tính vu thüy thâm höa nhi®t chi trung #Y t÷a tiêu [227.257] phø c§n",isSended=0}
x760583_g_AllBoss[24]=
{	
	{ ID=51000, GroupId=1, Title="", PosX=227,  PosY=257, BaseAI=30, ExtAIScript=333, ScriptID=760583 },
	{ ID=51001, GroupId=1, Title="", PosX=228,  PosY=257, BaseAI=30, ExtAIScript=337, ScriptID=760583 },
	{ ID=51002, GroupId=1, Title="", PosX=229,  PosY=257, BaseAI=30, ExtAIScript=338, ScriptID=760583 },
	{ ID=51003, GroupId=1, Title="", PosX=230,  PosY=257, BaseAI=30, ExtAIScript=334, ScriptID=760583 },
	{ ID=51004, GroupId=1, Title="", PosX=227,  PosY=258, BaseAI=30, ExtAIScript=339, ScriptID=760583 },
	{ ID=51005, GroupId=1, Title="", PosX=227,  PosY=259, BaseAI=30, ExtAIScript=330, ScriptID=760583 },
	{ ID=51006, GroupId=1, Title="", PosX=227,  PosY=260, BaseAI=30, ExtAIScript=332, ScriptID=760583 },
    { ID=51007, GroupId=1, Title="", PosX=227,  PosY=261, BaseAI=30, ExtAIScript=341, ScriptID=760583 },
	{ ID=51008, GroupId=1, Title="", PosX=228,  PosY=259, BaseAI=30, ExtAIScript=335, ScriptID=760583 },
    { ID=51009, GroupId=1, Title="", PosX=228,  PosY=260, BaseAI=30, ExtAIScript=336, ScriptID=760583 },
    { ID=51010, GroupId=1, Title="", PosX=228,  PosY=261, BaseAI=30, ExtAIScript=331, ScriptID=760583 },	
    { ID=51011, GroupId=1, Title="", PosX=228,  PosY=262, BaseAI=30, ExtAIScript=340, ScriptID=760583 },		
}

--##Cänh tßþng Bän ð° Mu¯n thêm Mµt cái NPC,Lai Xúc phát K¸ch bän g¯c,Nhß yannan_monster.ini,scripttimerTh¸ K¸ch bän g¯c H°i Ði«u Th¶i gian ,60000Vi 60Mi¬u Thuyên chuy¬n Mµt l¥n K¸ch bän g¯c 
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=760583
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
function x760583_OnCharacterTimer(sceneId, objId, dataId, uTime)
	local nHour	= GetHour()--Gi¶ 
	local nMinute = GetMinute()--Phút 
	
	if sceneId==24 then	--##
		if (nHour==00 and nMinute==00) or (nHour==02 and nMinute==00) or (nHour==04 and nMinute==00) or (nHour==06 and nMinute==00) or (nHour==08 and nMinute==00) or (nHour==10 and nMinute==00) or (nHour==12 and nMinute==00) or (nHour==14 and nMinute==00) or (nHour==16 and nMinute==00) or (nHour==18 and nMinute==00) or (nHour==20 and nMinute==00) or (nHour==22 and nMinute==00) then --##21Ði¬m nØa Hòa 12Ði¬m nØa Xoát NhÕn Nam Cüa Quái 
			x760583_CreateMonster(sceneId)	--Xoát Quái 
		end
	end
	--AddGlobalCountNews(sceneId, nMinute)
	--Hüy bö Ð°ng h° 
	--SetCharacterTimer(sceneId, objId, 0)
end

--**********************************
--Xoát BOSS
--**********************************
function x760583_CreateMonster(sceneId)
	--##Tr÷ng Trí Thông cáo Tiêu thÑc 
	--for j,msgData in x760583_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--Xoát Quái Ti«n Nªu Quái T°n tÕi ThoÕi Toàn bµ Thanh không ,Tái Xoát 
	for i,data in x760583_g_AllBoss[sceneId] do
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
	for i,data in x760583_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID)
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x760583_SysMsg(sceneId, data.GroupId)
		
		
		
	end

  AddGlobalCountNews(sceneId, x760583_g_BossSysMsgByGroupID[1].Msg)	
	
end

--**********************************
--H® th¯ng Thông cáo 
--**********************************
function x760583_SysMsg(sceneId, groupId)
	if x760583_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe(sceneId, 0, x760583_g_BossSysMsgByGroupID[groupId].Msg, 4)
		AddGlobalCountNews(sceneId, x760583_g_BossSysMsgByGroupID[groupId].Msg)
		x760583_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760583_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x760583_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ðóng cØa Ð¯i thoÕi Khuông 
--**********************************
function x760583_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
