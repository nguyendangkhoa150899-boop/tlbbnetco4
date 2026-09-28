--K¸ch bän g¯c Hào 
x760584_g_scriptId = 760584
x760584_g_AllBoss = {18}
--##18Th¸ Cänh tßþng ID,Tham khäo SceneInfo.ini

--##N½i này là H® th¯ng Thông cáo ,Cån cÑ Phân t± IDTuyên b¯ Thông cáo ,Cùng T± BOSSChï Tuyên b¯ Mµt l¥n 
x760584_g_BossSysMsgByGroupID={}
x760584_g_BossSysMsgByGroupID[1]={Msg="@*;SrvMsg;SCA:#cFF0000Ph® h°n hoa yêu Dçn d¡t TÑ ÐÑa con trai Häi Th¥n chi tØ Buông xu¯ng NhÕn Nam :#cff99ffTai h÷a Mµt phß½ng ,Nhßng này Thñc lñc Khä Không dung coi thß¶ng !Mong r¢ng Có Thñc lñc Các ðÕi hi®p Ði trß¾c NhÕn Nam Tiªn hành Tiêu di®t Giá VÕn nåm Không x¤u Chi Khu Quái v§t",isSended=0}
x760584_g_AllBoss[18]=
{	
	{ ID=16644, GroupId=1, Title="Ðµc Vñc Ma Tôn", PosX=248, PosY=80, BaseAI=25, ExtAIScript=242, ScriptID=100137 },
	--{ ID=47101, GroupId=1, Title="Häi Th¥n", PosX=170, PosY=67, BaseAI=4, ExtAIScript=342, ScriptID=760584 },
	--{ ID=47100, GroupId=1, Title="Häi Th¥n chi tØ", PosX=89, PosY=113, BaseAI=4, ExtAIScript=342, ScriptID=760584 },
	--{ ID=47100, GroupId=1, Title="Häi Th¥n chi tØ", PosX=94, PosY=222, BaseAI=4, ExtAIScript=342, ScriptID=760584 },
	--{ ID=47100, GroupId=1, Title="Häi Th¥n chi tØ", PosX=165, PosY=275, BaseAI=4, ExtAIScript=342, ScriptID=760584 },
	--{ ID=47100, GroupId=1, Title="Häi Th¥n chi tØ", PosX=234, PosY=157, BaseAI=4, ExtAIScript=342, ScriptID=760584 },	
}

--##Cänh tßþng Bän ð° Mu¯n thêm Mµt cái NPC,Lai Xúc phát K¸ch bän g¯c,Nhß yannan_monster.ini,scripttimerTh¸ K¸ch bän g¯c H°i Ði«u Th¶i gian ,60000Vi 60Mi¬u Thuyên chuy¬n Mµt l¥n K¸ch bän g¯c 
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=760584
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
function x760584_OnCharacterTimer(sceneId, objId, dataId, uTime)
	local nHour	= GetHour()--Gi¶ 
	local nMinute = GetMinute()--Phút 
	
	if sceneId==18 then	--##
		if (nHour==9 and nMinute==00) or (nHour==21 and nMinute==00) then --##21Ði¬m nØa Hòa 12Ði¬m nØa Xoát NhÕn Nam Cüa Quái 
			x760584_CreateMonster(sceneId)	--Xoát Quái 
		end
	end
	--AddGlobalCountNews(sceneId, nMinute)
	--Hüy bö Ð°ng h° 
	--SetCharacterTimer(sceneId, objId, 0)
end

--**********************************
--Xoát BOSS
--**********************************
function x760584_CreateMonster(sceneId)
	--##Tr÷ng Trí Thông cáo Tiêu thÑc 
	--for j,msgData in x760584_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--Xoát Quái Ti«n Nªu Quái T°n tÕi ThoÕi Toàn bµ Thanh không ,Tái Xoát 
	for i,data in x760584_g_AllBoss[sceneId] do
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
	for i,data in x760584_g_AllBoss[sceneId] do
	local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID)
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x760584_SysMsg(sceneId, data.GroupId)
		
		
		
	end

  AddGlobalCountNews(sceneId, x760584_g_BossSysMsgByGroupID[1].Msg)	
	
end

--**********************************
--H® th¯ng Thông cáo 
--**********************************
function x760584_SysMsg(sceneId, groupId)
	if x760584_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe(sceneId, 0, x760584_g_BossSysMsgByGroupID[groupId].Msg, 4)
		AddGlobalCountNews(sceneId, x760584_g_BossSysMsgByGroupID[groupId].Msg)
		x760584_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760584_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, -1)
end


--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x760584_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ðóng cØa Ð¯i thoÕi Khuông 
--**********************************
function x760584_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
