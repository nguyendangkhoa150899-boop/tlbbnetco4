-- Script ID
x891026_g_scriptId = 891026

x891026_g_AllBoss = {710}
--##18ÊÇ³¡¾°ID£¬²Î¿¼SceneInfo.ini

--##ÕâÀïÊÇÏµÍ³¹«¸æ£¬¸ù¾Ý·Ö×éID·¢²¼¹«¸æ£¬Í¬Ò»×éBOSSÖ»·¢²¼Ò»´Î
x891026_g_BossSysMsgByGroupID={}
x891026_g_BossSysMsgByGroupID[1]={Msg="#cFF0000 Vân Phù: #Y Các anh hùng hào ki®t chú ý , #G Vân Phù #YBOSS 2 tiªng xu¤t hi®n 1 l¥n mang theo nguyên li®u th¥n binh cùng r¤t nhi«u v§t ph¦m có giá tr¸ khác hãy nhanh chóng t§p trung Vân Phù PK khô máu nào",isSended=0}

x891026_g_AllBoss[710]=
{	
	{ ID=43960, GroupId=1, Title="Bos Vân Phù", PosX=127,  PosY=154,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43961, GroupId=1, Title="Bos Vân Phù", PosX=130,  PosY=159,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43962 , GroupId=1, Title="Bos Vân Phù", PosX=135,  PosY=161, BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43963, GroupId=1, Title="Bos Vân Phù", PosX=140,  PosY=159,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43965 , GroupId=1, Title="Bos Vân Phù", PosX=142,  PosY=153,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43966 , GroupId=1, Title="Bos Vân Phù", PosX=135,  PosY=146, BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43968, GroupId=1, Title="Bos Vân Phù", PosX=130,  PosY=148,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43969, GroupId=1, Title="Bos Vân Phù", PosX=128,  PosY=154,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
	{ ID=43970 , GroupId=1, Title="Bos Vân Phù", PosX=135,  PosY=154,  BaseAI=29, ExtAIScript=273, ScriptID=-1 },
}

--##³¡¾°µØÍ¼Òª¼ÓÒ»¸öNPC£¬À´´¥·¢½Å±¾,Èçyannan_monster.ini£¬scripttimerÊÇ½Å±¾»Øµ÷Ê±¼ä£¬60000Îª60Ãëµ÷ÓÃÒ»´Î½Å±¾
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=891026
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
function x891026_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--Ð¡Ê±
	local nMinute = GetMinute()--·ÖÖÓ
	
	if sceneId==710 then	--##Ðþº£
		if (nHour==1 and nMinute==00) or (nHour==3 and nMinute==00) or (nHour==5 and nMinute==00) or (nHour==7 and nMinute==00) or (nHour==9 and nMinute==00) or (nHour==11 and nMinute==00) or (nHour==13 and nMinute==00) or (nHour==15 and nMinute==00) or (nHour==17 and nMinute==00) or (nHour==19 and nMinute==00) or (nHour==21 and nMinute==00) or (nHour==23 and nMinute==00) then --##21µã°ëºÍ12µã°ëË¢ÑãÄÏµÄ¹Ö
			x891026_CreateMonster( sceneId )	--Ë¢¹Ö
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--È¡ÏûÊ±ÖÓ
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--Ë¢BOSS
--**********************************
function x891026_CreateMonster( sceneId )

	--##ÖØÖÃ¹«¸æ±êÊ¶
	for j,msgData in x891026_g_BossSysMsgByGroupID do 
		msgData.isSended=0
	end
	for i,data in x891026_g_AllBoss[sceneId] do
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
			x891026_SysMsg( sceneId, data.GroupId )
		end
	end

end

--**********************************
--ÏµÍ³¹«¸æ
--**********************************
function x891026_SysMsg( sceneId, groupId )
	if x891026_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x891026_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x891026_g_BossSysMsgByGroupID[groupId].Msg )
		x891026_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x891026_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--ÐÑÄ¿ÌáÊ¾
--**********************************
function x891026_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¹Ø±Õ¶Ô»°¿ò
--**********************************
function x891026_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end