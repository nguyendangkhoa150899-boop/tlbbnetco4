--½Å±¾ºÅ
x760588_g_scriptId = 760588

x760588_g_AllBoss = {22}
--##18ÊÇ³¡¾°ID£¬²Î¿¼SceneInfo.ini

--##ÕâÀïÊÇÏµÍ³¹«¸æ£¬¸ù¾Ý·Ö×éID·¢²¼¹«¸æ£¬Í¬Ò»×éBOSSÖ»·¢²¼Ò»´Î
x760588_g_BossSysMsgByGroupID={}
x760588_g_BossSysMsgByGroupID[1]={Msg="@*;SrvMsg;SCA:#cFF0000Thßþng c± Th¥n thú Di®t Thª Höa Phßþng buông xu¯ng Trß¶ng BÕch S½n :#cff99ffTai h÷a Mµt phß½ng ,Nhßng này Thñc lñc Khä Không dung coi thß¶ng !Mong r¢ng Có Thñc lñc Các ðÕi hi®p Ði trß¾c Trß¶ng BÕch s½n Tiªn hành Thu phøc Này ch¶ Quái v§t",isSended=0}
x760588_g_AllBoss[22]=
{	
	{ ID=16638, GroupId=1, Title="Höa Vñc Ma Tôn", PosX=195, PosY=186, BaseAI=25, ExtAIScript=242, ScriptID=100136 }
	--{ ID=47105, GroupId=1, Title="Thßþng c± Th¥n thú", PosX=164, PosY=146, BaseAI=4, ExtAIScript=345, ScriptID=760588 },
	--{ ID=47105, GroupId=1, Title="Thßþng c± Th¥n thú", PosX=152, PosY=47, BaseAI=4, ExtAIScript=345, ScriptID=760588 },
	--{ ID=47105, GroupId=1, Title="Thßþng c± Th¥n thú", PosX=242, PosY=155, BaseAI=4, ExtAIScript=345, ScriptID=760588 },
	--{ ID=47105, GroupId=1, Title="Thßþng c± Th¥n thú", PosX=169, PosY=259, BaseAI=4, ExtAIScript=345, ScriptID=760588 },
	--{ ID=47105, GroupId=1, Title="Thßþng c± Th¥n thú", PosX=82, PosY=199, BaseAI=4, ExtAIScript=345, ScriptID=760588 },	
}

--##³¡¾°µØÍ¼Òª¼ÓÒ»¸öNPC£¬À´´¥·¢½Å±¾,Èçyannan_monster.ini£¬scripttimerÊÇ½Å±¾»Øµ÷Ê±¼ä£¬60000Îª60Ãëµ÷ÓÃÒ»´Î½Å±¾
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=760588
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
--Ë¢¹ÖÂß¼­
--**********************************
function x760588_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--Ð¡Ê±
	local nMinute = GetMinute()--·ÖÖÓ
	
	if sceneId==22 then	--##
		if (nHour==9 and nMinute==00) or (nHour==21 and nMinute==00)  then --##21µã°ëºÍ12µã°ëË¢ÑãÄÏµÄ¹Ö
			x760588_CreateMonster( sceneId )	--Ë¢¹Ö
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--È¡ÏûÊ±ÖÓ
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--Ë¢BOSS
--**********************************
function x760588_CreateMonster( sceneId )
	--##ÖØÖÃ¹«¸æ±êÊ¶
	--for j,msgData in x760588_g_BossSysMsgByGroupID do 
	--	msgData.isSended=0
	--end
	--Ë¢¹ÖÇ°Èç¹û¹Ö´æÔÚµÄ»°È«²¿Çå¿Õ£¬ÔÙË¢
	for i,data in x760588_g_AllBoss[sceneId] do
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			local MosDataID = GetMonsterDataID( sceneId, MonsterId )
			if MosDataID == data.ID then
				--Çå¹Ö
				LuaFnDeleteMonster(sceneId, MonsterId)
			end		
		end
	end
	--Ë¢¹Ö
	for i,data in x760588_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID )
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x760588_SysMsg( sceneId, data.GroupId )
		
		
		
	end

    AddGlobalCountNews( sceneId, x760588_g_BossSysMsgByGroupID[1].Msg )	
	
end

--**********************************
--ÏµÍ³¹«¸æ
--**********************************
function x760588_SysMsg( sceneId, groupId )
	if x760588_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x760588_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x760588_g_BossSysMsgByGroupID[groupId].Msg )
		x760588_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x760588_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--ÐÑÄ¿ÌáÊ¾
--**********************************
function x760588_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¹Ø±Õ¶Ô»°¿ò
--**********************************
function x760588_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end