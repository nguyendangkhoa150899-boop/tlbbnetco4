-- Script ID
x891024_g_scriptId = 891024

x891024_g_AllBoss = {432}
--##18ÊÇ³¡¾°ID£¬²Î¿¼SceneInfo.ini

--##ÕâÀïÊÇÏµÍ³¹«¸æ£¬¸ù¾Ý·Ö×éID·¢²¼¹«¸æ£¬Í¬Ò»×éBOSSÖ»·¢²¼Ò»´Î
x891024_g_BossSysMsgByGroupID={}
x891024_g_BossSysMsgByGroupID[1]={Msg="#cFF0000 HÕn Huyªt Lînh: #Y Các anh hùng hào ki®t chú ý , #G HÕn Huyªt Lînhh #Y t× 20h ðên 22h cÑ 15p xu¤t hi®n 1 ðþt BOSS hãy nhanh chóng t§p trung HÕn Huyªt Lînh PK khô máu nào",isSended=0}

x891024_g_AllBoss[432]=
{	
	{ ID=14199, GroupId=1, Title="BOSS time", PosX=44,  PosY=84,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=33519, GroupId=1, Title="BOSS time", PosX=45,  PosY=84,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=33810 , GroupId=1, Title="BOSS time", PosX=46,  PosY=85, BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=34130, GroupId=1, Title="BOSS time", PosX=45,  PosY=51,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42100 , GroupId=1, Title="BOSS time", PosX=40,  PosY=50,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42106 , GroupId=1, Title="BOSS time", PosX=45,  PosY=55, BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=42966, GroupId=1, Title="BOSS time", PosX=81,  PosY=58,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43970, GroupId=1, Title="BOSS time", PosX=85,  PosY=55,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=14199 , GroupId=1, Title="BOSS time", PosX=83,  PosY=59,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
}

--##³¡¾°µØÍ¼Òª¼ÓÒ»¸öNPC£¬À´´¥·¢½Å±¾,Èçyannan_monster.ini£¬scripttimerÊÇ½Å±¾»Øµ÷Ê±¼ä£¬60000Îª60Ãëµ÷ÓÃÒ»´Î½Å±¾
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=891024
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
function x891024_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--Ð¡Ê±
	local nMinute = GetMinute()--·ÖÖÓ
	
	if sceneId==432 then	--##Ðþº£
		if (nHour==20 and nMinute==00) or (nHour==20 and nMinute==15) or (nHour==20 and nMinute==30) or (nHour==20 and nMinute==45) or (nHour==21 and nMinute==00) or (nHour==21 and nMinute==15) or (nHour==21 and nMinute==30) or (nHour==21 and nMinute==45) or (nHour==22 and nMinute==00) or (nHour==22 and nMinute==15) or (nHour==22 and nMinute==30) or (nHour==19 and nMinute==45) then --##21µã°ëºÍ12µã°ëË¢ÑãÄÏµÄ¹Ö
			x891024_CreateMonster( sceneId )	--Ë¢¹Ö
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--È¡ÏûÊ±ÖÓ
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--Ë¢BOSS
--**********************************
function x891024_CreateMonster( sceneId )

	--##ÖØÖÃ¹«¸æ±êÊ¶
	for j,msgData in x891024_g_BossSysMsgByGroupID do 
		msgData.isSended=0
	end
	for i,data in x891024_g_AllBoss[sceneId] do
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
			x891024_SysMsg( sceneId, data.GroupId )
		end
	end

end

--**********************************
--ÏµÍ³¹«¸æ
--**********************************
function x891024_SysMsg( sceneId, groupId )
	if x891024_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x891024_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x891024_g_BossSysMsgByGroupID[groupId].Msg )
		x891024_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x891024_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--ÐÑÄ¿ÌáÊ¾
--**********************************
function x891024_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¹Ø±Õ¶Ô»°¿ò
--**********************************
function x891024_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end