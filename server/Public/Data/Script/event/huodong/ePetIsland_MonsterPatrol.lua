--Huy«n Vû Ğäo¹ÖÎïÑ²Âß
--»î¶¯Ë¢¹Ö½Å±¾
--ÆÕÍ¨

--½Å±¾ºÅ
x808068_g_ScriptId = 808068;

--³£Á¿ÉùÃ÷ ºÍ Ë½ÓĞÊı¾İ±í¸ñ
x808068_g_MonsterNumber = 5; --Ã¿×é¹ÖÎïÊıÄ¿
x808068_g_MonsterLifeTime = 3000000; --¹ÖÎï´æ»îÊ±¼ä50·ÖÖÓ
x808068_g_ActivitySceneId = 39; --Huy«n Vû Ğäo
x808068_g_ActivityScendName = "Huy«n Vû Ğäo";

x808068_g_BookThiefID = {13400, 13401} --±¦ÊéÇÔÔô¹ÖÎïID Ëæ»úÒ»¸ö
x808068_g_BookThiefExtAI = {286, 287} --±¦ÊéÇÔÔôÀ©Õ¹AI
x808068_g_BookThiefNPCID = 807003 --±¦ÊéÇÔÔôNPCID
x808068_g_BookThiefLifeTime = 40*60000; --±¦ÊéÇÔÔô´æ»îÊ±¼ä
x808068_g_ExistBookThief = 5 --Ëæ»ú²úÉú5¸ö±¦ÊéÇÔÔô³öÀ´

--Ë½ÓĞº¯ÊıÉùÃ÷
function x808068_BroadcastLocation(sceneId, level, x, z)
	local noticeMsg = format("#PThü lînh chiªn ğµi này #{_BOSS3}#PğÆng c¤p cao ğªn #G%d, #Pnghe nói có ngß¶i · g¥n #GHuy«n Vû Ğäo (%d,%d)#P ğã th¤y qua h÷.", level, x, z)
	--PrintStr(format("%d:%d:%d:%s",level, x, z, noticeMsg));
	if nil~=noticeMsg then
		AddGlobalCountNews(sceneId, noticeMsg);
	end
end

function x808068_BroadcastNotice(sceneId)
	local index = random(3);
	local Notices = {
		"#GHuy«n Vû Ğäo#P là n½i có nhi«u trân thú cao c¤p, anh hùng ğªn ğây phäi có bän lînh cao. Và trong các cao thü ai bän lînh nh¤t, ğ® nh¤t #{_BOSS3}#P khiªn Trân Thú n½i ğây cûng phäi hoäng sş, sÑc mÕnh vô song. Anh Hùng häo hán nào có th¬ ğªn khiêu chiªn.",
		"#GHuy«n Vû Ğäo#P báo ğµng c¤p 1, báo ğµng c¤p 1, #{_BOSS3}#P ğã xu¤t hi®n · Huy«n Vû Ğäo, mong các anh hùng ğªn ğây chú ı an toàn, chú ı an toàn!",
		"#{_BOSS3}#P cùng ti¬u ğµi ğã có m£t tÕi #GHuy«n Vû Ğäo#P Ti¬u ğµi này ğßşc trang b¸ tï mî, hu¤n luy®n nghiêm túc, chiªn ğ¤u kiên cß¶ng. mong các v¸ anh hùng nh¡m ğánh ğßşc thì ğánh, không ğßşc thì chÕy."
	};
	local noticeMsg = Notices[index];
	--PrintStr(format("%d:%s",index,noticeMsg));
	if nil~=noticeMsg then
		AddGlobalCountNews(sceneId, noticeMsg);
	end
end

function x808068_CreateMonstersByGroup(sceneId, groupId)
	local Group25 = {
		{DataId=3830, x=212.517, z=181.2889, aiType=20, aiScript=211,aiLuaExtend=808068,patrolId=5},
		{DataId=3833, x=213.217, z=180.5889, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=6},
		{DataId=3836, x=213.917, z=179.8889, aiType=20, aiScript=213,aiLuaExtend=-1,patrolId=7},
		{DataId=3839, x=211.817, z=180.5889, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=8},
		{DataId=3842, x=211.117, z=179.8889, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=9}
	};
	local Group45 = {
		{DataId=3831, x=113.6972, z=219.7326, aiType=20, aiScript=211,aiLuaExtend=808068,patrolId=10},
		{DataId=3834, x=114.3972, z=219.0326, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=11},
		{DataId=3837, x=115.0972, z=218.3326, aiType=20, aiScript=213,aiLuaExtend=-1,patrolId=12},
		{DataId=3840, x=112.9972, z=219.0326, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=13},
		{DataId=3843, x=112.2972, z=218.3326, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=14}
	};
	local Group65 = {
		{DataId=3832, x=271.3059, z=63.2789, aiType=20, aiScript=211,aiLuaExtend=808068,patrolId=15},
		{DataId=3835, x=272.0059, z=62.5789, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=16},
		{DataId=3838, x=272.7059, z=61.8789, aiType=20, aiScript=213,aiLuaExtend=-1,patrolId=17},
		{DataId=3841, x=270.6059, z=62.5789, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=18},
		{DataId=3844, x=269.9059, z=61.8789, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=19}
	};

	local MonsterGroup = {
		Group25,
		Group45,
		Group65
	};
	local LocationInfo = {
		{level=25, x=212, z=181},
		{level=45, x=113, z=219},
		{level=65, x=271, z=63}
	};
	local group = MonsterGroup[groupId];
	if nil~=group then
		local locationInfo = LocationInfo[groupId];
		for index=1, x808068_g_MonsterNumber do
			monster = group[index];
			if nil~=monster then
				local monsterId = LuaFnCreateMonster(
										sceneId, 
										monster.DataId, 
										monster.x, 
										monster.z, 
										monster.aiType,
										monster.aiScript,
										monster.aiLuaExtend
										);
				SetMonsterGroupID(sceneId, monsterId, groupId);	--Ã¿×é¹ÖÎïÊôÓÚÍ¬Ò»¸öGroupID£¬ÕâÑù¹ÖÎïÃÇ¿ÉÒÔ»¥ÏàÔöÔ®
				SetPatrolId(sceneId, monsterId, monster.patrolId); --ÉèÖÃ¹ÖÎïµÄÑ²ÂßID
				SetCharacterDieTime(sceneId, monsterId, x808068_g_MonsterLifeTime); --¹ÖÎïÖ»»á´æ»îµ½Ö¸¶¨Ê±¼ä
				if (GetName(sceneId, monsterId) == "Vô Ğ¸ch Phi Thiên Miêu") then
					SetCharacterTitle(sceneId, monsterId, "Huy«n Vû Ğäo trinh t§p ğµi trß·ng")
				end
				--PrintStr(format("%d:monsterDataID=%d",groupId,monster.DataId));
			else
				break;
			end
		end
		--PrintNum(sceneId)
		-- Broadcast the notice of this monster group
		x808068_BroadcastNotice(sceneId);
		-- Broadcast the level and location of this monster group
		if nil~=locationInfo then
			x808068_BroadcastLocation(sceneId, locationInfo.level, locationInfo.x, locationInfo.z);
		end 
	end
end


--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x808068_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
	if x808068_g_ActivitySceneId == sceneId then
		StartOneActivity( sceneId, actId, floor(300000));--Timer ÖÜÆÚ£º5·ÖÖÓ
	end
end

--**********************************
--ĞÄÌøº¯Êı
--**********************************
function x808068_OnTimer( sceneId, actId, uTime )
	if x808068_g_ActivitySceneId == sceneId then
		local RegenesisTime ={
				{groupId = 3},--0µã
				{groupId = 1},--1µã
				{groupId = 2},--2µã
				{groupId = 3},--3µã
				{groupId = 1},--4µã
				{groupId = 2},--5µã
				{groupId = 3},--6µã
				{groupId = nil},--7µã
				{groupId = nil},--8µã
				{groupId = nil},--9µã
				{groupId = 1},--10µã
				{groupId = 2},--11µã
				{groupId = 3},--12µã
				{groupId = 1},--13µã
				{groupId = 2},--14µã
				{groupId = 3},--15µã
				{groupId = 1},--16µã
				{groupId = 2},--17µã
				{groupId = 3},--18µã
				{groupId = 1},--19µã
				{groupId = 2},--20µã
				{groupId = 3},--21µã
				{groupId = 1},--22µã
				{groupId = 2},--23µã
			};
		if 5>floor(GetMinute()) then --Ö»ÓĞÔÚÃ¿¸öĞ¡Ê±µÄÍ·5·ÖÖÓÄÚ»áË¢ĞÂ¹ÖÎï
			local index = floor(GetHour()+1);
			local groupId = nil;
			local regenesisTime = RegenesisTime[index];
			if nil~=regenesisTime then
				groupId = regenesisTime.groupId;
			end
			if nil~=groupId then
				x808068_CreateMonstersByGroup(sceneId, groupId);
			end
		end
	end
end

--**********************************
--objËÀÍö
--**********************************
function x808068_OnDie( sceneId, objId, selfId )--Õâ¸öselfId¿ÉÄÜÊÇ³èÎï
	local killerID = selfId
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --Èç¹ûÊÇ³èÎïµÄ»°£¬°ÑÕâ¸öIDÉèÖÃ³ÉÖ÷ÈËID
		killerID = GetPetCreator( sceneId, selfId )
	end
	
	local postable = {{87,	108},{173,	58},{234,	53},{259,	80},{243,	150},{152,	145},{75,	191},{136,	206},{184,	209},{256,	215},
										{219,	252},{176,	231},{129,	274},{74,	275},{127,	199},{44,	90},{46,	126},{45,	167},{39,	219},{75,	279},
										{103,	74},{110,	126},{112,	170},{116,	216},{145,	235},{182,	278},{180,	238},{159,	136},{222,	98},{283,	176}}
	local size = getn(postable)
	for i=1, x808068_g_ExistBookThief do
		--PrintStr(size)
		local ram = random(size)
		local ThisPos = postable[ram]
		
		for j=ram, size do
			if j+1 <= size then
				postable[j] = postable[j+1]
			end
		end
		
		size = size -1
		
		--PrintStr("after size "..size.." this create pos "..ThisPos[1].." "..ThisPos[2].." ran "..ram)
		
		local monsterType = random(getn(x808068_g_BookThiefID))
		local MonsterId = LuaFnCreateMonster(sceneId, x808068_g_BookThiefID[monsterType], ThisPos[1], ThisPos[2], 0, x808068_g_BookThiefExtAI[monsterType], x808068_g_BookThiefNPCID)
		SetCharacterDieTime(sceneId, MonsterId, x808068_g_BookThiefLifeTime)
		SetCharacterTitle(sceneId, MonsterId, "Bäo Thß Thiªt T£c")
		--ÉèÖÃ¶Ô¹ÖÎªÓÑºÃµÄ Ä¿Ç°ÊÇ0ºÅÊÇÓÑºÃµÄ£¬Èç¹ûÓĞÈË¸Ä±äÁËÏàÓ¦µÄÊÆÁ¦ÉùÍûÄÇÎÒ¾Í²ÒÁË£¡£¡:-(((
		SetUnitReputationID(sceneId, killerID, MonsterId, 0)
		
	end
	
	-- #P´«ÎÅÔÚ#{_BOSS3}#P´ó¾üÀ£°ÜÖ®Ç°£¬Í¸Â¶ÁË¾ªÈËµÄÏûÏ¢£ºÒ»Ğ©Ì°À·µÄ#G±¦ÊéÇÔÔô£º#{_BOSS113}¡¢#{_BOSS114}#PÔÚ#GHuy«n Vû Ğäo#P¿ªÊ¼ÁËËûÃÇµÄÃØÃÜ»î¶¯£¡¸÷Â·Ó¢ĞÛ¿ì¿ìÈ¥¿´¸ö¾¿¾¹°É¡£
	local strText = "#{ZSSFC_090211_05}"
	BroadMsgByChatPipe(sceneId, killerID, strText, 4)
	
end
