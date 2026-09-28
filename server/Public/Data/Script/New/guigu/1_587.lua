--K¸ch bän g¯c Hào 
x760587_g_scriptId = 760587
x760587_g_AllBoss = {174}
--##18Th¸ Cänh tßþng ID,Tham khäo SceneInfo.ini

--##N½i này là H® th¯ng Thông cáo ,Cån cÑ Phân t± IDTuyên b¯ Thông cáo ,Cùng T± BOSSChï Tuyên b¯ Mµt l¥n 
x760587_g_BossSysMsgByGroupID={}
x760587_g_BossSysMsgByGroupID[1]={Msg="@*;SrvMsg;SCA:#cFF0000Chß·ng quän Thiên th¥n ChÑc Cüa Lôi Th¥n Chiªn tß¾ng Buông xu¯ng Vu Thüy tinh H° :#cff99ffTai h÷a Mµt phß½ng ,Nhßng này Thñc lñc Khä Không dung coi thß¶ng !Mong r¢ng Có Thñc lñc Các ðÕi hi®p Ði trß¾c Thüy tinh H° Tiªn hành Thu phøc Này ch¶ Quái v§t",isSended=0}
x760587_g_AllBoss[174]=
{	
	{ ID=47104, GroupId=1, Title="", PosX=146, PosY=40, BaseAI=4, ExtAIScript=344, ScriptID=760587 },
	{ ID=47104, GroupId=1, Title="", PosX=113, PosY=99, BaseAI=4, ExtAIScript=344, ScriptID=760587 },
	{ ID=47104, GroupId=1, Title="", PosX=203, PosY=131, BaseAI=4, ExtAIScript=344, ScriptID=760587 },
	{ ID=47104, GroupId=1, Title="", PosX=114, PosY=187, BaseAI=4, ExtAIScript=344, ScriptID=760587 },
	{ ID=47104, GroupId=1, Title="", PosX=27, PosY=121, BaseAI=4, ExtAIScript=344, ScriptID=760587 },	
}

--##Cänh tßþng Bän ð° Mu¯n thêm Mµt cái NPC,Lai Xúc phát K¸ch bän g¯c,Nhß yannan_monster.ini,scripttimerTh¸ K¸ch bän g¯c H°i Ði«u Th¶i gian ,60000Vi 60Mi¬u Thuyên chuy¬n Mµt l¥n K¸ch bän g¯c 
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=760587
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
function x760587_OnCharacterTimer(sceneId, objId, dataId, uTime)
	local nHour	= GetHour()--Gi¶ 
	local nMinute = GetMinute()--Phút 
	
	if sceneId==174 then	--##
		if (nHour==01 and nMinute==15) or (nHour==03 and nMinute==15) or (nHour==05 and nMinute==15) or (nHour==07 and nMinute==15) or (nHour==09 and nMinute==15) or (nHour==11 and nMinute==15) or (nHour==13 and nMinute==30) or (nHour==15 and nMinute==15) or (nHour==17 and nMinute==15) or (nHour==19 and nMinute==15) or (nHour==21 and nMinute==15) or (nHour==23 and nMinute==15) then --##21Ði¬m nØa Hòa 12Ði¬m nØa Xoát NhÕn Nam Cüa Quái 
			x760587_CreateMonster(sceneId)	--Xoát Quái 
		end
	end
	--AddGlobalCountNews(sceneId, nMinute)
	--Hüy bö Ð°ng h° 
	--SetCharacterTimer(sceneId, objId, 0)
end

--**********************************
--Xoát BOSS
--**********************************
function x760587_CreateMonster(sceneId)
	--##Tr÷ng Trí Thông cáo Tiêu thÑc 
	--for j,msgData in x760587_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--Xoát Quái Ti«n Nªu Quái T°n tÕi ThoÕi Toàn bµ Thanh không ,Tái Xoát 
	for i,data in x760587_g_AllBoss[sceneId] do
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
	--for i,data in x760587_g_AllBoss[sceneId] do
	--	local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID)
	--	SetCharacterTitle(sceneId, MstId, data.Title)
		--x760587_SysMsg(sceneId, data.GroupId)
		
		
		
	--end

  --AddGlobalCountNews(sceneId, x760587_g_BossSysMsgByGroupID[1].Msg)	
	
end

--**********************************
--H® th¯ng Thông cáo 
--**********************************
function x760587_SysMsg(sceneId, groupId)
	if x760587_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe(sceneId, 0, x760587_g_BossSysMsgByGroupID[groupId].Msg, 4)
		--AddGlobalCountNews(sceneId, x760587_g_BossSysMsgByGroupID[groupId].Msg)
		--x760587_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760587_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x760587_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ðóng cØa Ð¯i thoÕi Khuông 
--**********************************
function x760587_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
