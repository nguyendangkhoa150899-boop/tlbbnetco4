-- Script ID
x891025_g_scriptId = 891025

x891025_g_AllBoss = {708}
--##18ÊÇ³¡¾°ID£¬²Î¿¼SceneInfo.ini

--##ÕâÀïÊÇÏµÍ³¹«¸æ£¬¸ù¾Ý·Ö×éID·¢²¼¹«¸æ£¬Í¬Ò»×éBOSSÖ»·¢²¼Ò»´Î
x891025_g_BossSysMsgByGroupID={}
x891025_g_BossSysMsgByGroupID[1]={Msg="#cFF0000 Mai Nha Ðäo: #Y Các anh hùng hào ki®t chú ý , #G BOSS 2 tiªng xu¤t hi®n 1 l¥n mang theo nguyên li®u th¥n binh cùng r¤t nhi«u v§t ph¦m có giá tr¸ khác hãy nhanh chóng t§p trung Mai Nha Ðäo PK khô máu nào",isSended=0}

x891025_g_AllBoss[708]=
{	
	{ ID=42340, GroupId=1, Title="Mai Nha Hµ V®", PosX=168,  PosY=99,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42344, GroupId=1, Title="Mai Nha Hµ V®", PosX=159,  PosY=96,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42348 , GroupId=1, Title="Mai Nha Hµ V®", PosX=168,  PosY=86, BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42352, GroupId=1, Title="Mai Nha Hµ V®", PosX=186,  PosY=84,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42356 , GroupId=1, Title="Mai Nha Hµ V®", PosX=181,  PosY=97,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42360 , GroupId=1, Title="Mai Nha Hµ V®", PosX=174,  PosY=101, BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42364, GroupId=1, Title="Mai Nha Hµ V®", PosX=169,  PosY=105,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42368, GroupId=1, Title="Mai Nha Hµ V®", PosX=169,  PosY=93,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42372 , GroupId=1, Title="Mai Nha Hµ V®", PosX=174,  PosY=89,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
}

--##³¡¾°µØÍ¼Òª¼ÓÒ»¸öNPC£¬À´´¥·¢½Å±¾,Èçyannan_monster.ini£¬scripttimerÊÇ½Å±¾»Øµ÷Ê±¼ä£¬60000Îª60Ãëµ÷ÓÃÒ»´Î½Å±¾
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=891025
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
function x891025_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--Ð¡Ê±
	local nMinute = GetMinute()--·ÖÖÓ
	
	if sceneId==708 then	--##Ðþº£
		if (nHour==02 and nMinute==00) or (nHour==04 and nMinute==00) or (nHour==06 and nMinute==00) or (nHour==08 and nMinute==00) or (nHour==10 and nMinute==00) or (nHour==12 and nMinute==00) or (nHour==14 and nMinute==00) or (nHour==16 and nMinute==00) or (nHour==18 and nMinute==00) or (nHour==20 and nMinute==00) or (nHour==22 and nMinute==00) or (nHour==24 and nMinute==00) then --##21µã°ëºÍ12µã°ëË¢ÑãÄÏµÄ¹Ö
			x891025_CreateMonster( sceneId )	--Ë¢¹Ö
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--È¡ÏûÊ±ÖÓ
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--Ë¢BOSS
--**********************************
function x891025_CreateMonster( sceneId )

	--##ÖØÖÃ¹«¸æ±êÊ¶
	for j,msgData in x891025_g_BossSysMsgByGroupID do 
		msgData.isSended=0
	end
	for i,data in x891025_g_AllBoss[sceneId] do
		local isExist = 0
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			local MosDataID = GetMonsterDataID( sceneId, MonsterId )
			if MosDataID == data.ID then
				isExist = 1
				break
			end		
		end
		if isExist==0 then
			local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID )
			SetCharacterTitle(sceneId, MstId, data.Title)
			x891025_SysMsg( sceneId, data.GroupId )
		end
	end

end

--**********************************
--ÏµÍ³¹«¸æ
--**********************************
function x891025_SysMsg( sceneId, groupId )
	if x891025_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x891025_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x891025_g_BossSysMsgByGroupID[groupId].Msg )
		x891025_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x891025_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--ÐÑÄ¿ÌáÊ¾
--**********************************
function x891025_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¹Ø±Õ¶Ô»°¿ò
--**********************************
function x891025_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end