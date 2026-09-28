--SØ døng Tàng bäo ð° 

--K¸ch bän g¯c Hào 
x760399_g_scriptId = 760399

x760399_g_ItemId = 38000434

x760399_g_NpcScriptID = 760400

x760399_g_DefaultCorpseDataId = 3510

x760399_g_ChengxiongdatuScriptId = 760401

x760399_g_DiaorubaozangScriptId = 229021

x760399_g_minValue = 6000
x760399_g_maxValue = 9000

x760399_g_MissionIndex10 = 24
x760399_g_MissionIndex20 = 43
x760399_g_MissionIndex30 = 44
x760399_g_MissionIndex40 = 45
x760399_g_MissionIndex50 = 46
x760399_g_MissionIndex60 = 47
x760399_g_MissionIndex70 = 48
x760399_g_MissionIndex80 = 49
x760399_g_MissionIndex90 = 50

--g_ItemTable = {
--							{sn=30001001, name="Hành Huyªt Tán"},
--							{sn=30002007, name="Tiên ðan Thu Tháng"},
--							{sn=30007003, name="Vß½ng mçu Tiên ðan"},
--							{sn=30101017, name="Giáo tØ"},
--							{sn=30402016, name="Cao c¤p Gia t¯c KÛ nång Thß"},
--							{sn=30505004, name="Yên hoa"},
--							{sn=30505001, name="T¯c Hành Hài"},
--							{sn=30701009, name="T÷a kÜ: BÕch h±"},
--							{sn=30701007, name="T÷a kÜ: Lµc"}
--							}


x760399_g_CorpseMonsterPosTable = {
													{x=104, z=221},
													{x=104, z=201},
													{x=79, z=222}
													}

x760399_g_SceneMapDefine = {	
										{sceneId=573,	sceneName="MÕc Nam Thanh Nguyên",	CorpseMonsterId=2561},
										{sceneId=575,	sceneName="Thiên KÏ Nam Hoài",	CorpseMonsterId=2561},
										{sceneId=498,	sceneName="Bi¬n r×ng Khê C¯c",	CorpseMonsterId=2561},
										{sceneId=574,	sceneName="Vong Xuyên Bi¬n hoa",	CorpseMonsterId=2561},
										{sceneId=496,	sceneName="Vân Dao Thß¾c Lînh",	CorpseMonsterId=2561},
										{sceneId=497,	sceneName="Th¤m ThuÖ ðan Lâm",	CorpseMonsterId=2561},
									}
								
x760399_g_GhoulMonsterTable = {
												{level=11, id=3520},{level=21, id=3521},
												{level=31, id=3522},{level=41, id=3523},
												{level=51, id=3524},{level=61, id=3525},
												{level=71, id=3526},{level=81, id=3527},
												{level=91, id=3528},{level=101, id=3529},
											}									
									
--**********************************
--Ðßþc ðªn itemCüa Tham s¯ Tin tÑc 
--**********************************
function x760399_GetItemParam(sceneId, selfId, BagPos)							
	--local BagPos = GetBagPosByItemSn(sceneId, selfId, x760399_g_ItemId)
	--PrintNum(BagPos)
	local targetsceneId = GetBagItemParam(sceneId, selfId, BagPos, 1, 1)
	--PrintNum(targetsceneId)
	local targetX = GetBagItemParam(sceneId, selfId, BagPos, 3, 1)
	--PrintNum(targetX)
 local targetZ = GetBagItemParam(sceneId, selfId, BagPos, 5, 1)
 --PrintNum(targetZ)
 local r = GetBagItemParam(sceneId, selfId, BagPos, 7, 1)
 return targetsceneId, targetX, targetZ, r
end

--**********************************
--Ðào ðªn Ngân lßþng --OK
--**********************************
function x760399_DiscoverMoney(sceneId, selfId)
		--PrintStr("DiscoverMoney...")
		local Bonus = random(x760399_g_maxValue-x760399_g_minValue) + x760399_g_minValue
		local str ="Ngß½i Ðào ðªn #{_MONEY".. tostring(Bonus).."}"
		AddMoney(sceneId, selfId, Bonus)
		Msg2Player(sceneId, selfId, str, MSG2PLAYER_PARA)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************
--Ngµ ÐÕo mµ t£c --OK
--**********************************
function x760399_DiscoverGhoulMonster(sceneId, selfId)
	local humanLevel = LuaFnGetLevel(sceneId, selfId)
	local dataId = x760399_g_GhoulMonsterTable[1].id
	local ct = getn(x760399_g_GhoulMonsterTable)
	for i=1, ct do
		if humanLevel>= x760399_g_GhoulMonsterTable[i].level then
			dataId = x760399_g_GhoulMonsterTable[i].id
		end
	end

	local aifile = random(3)
	local x, z = GetWorldPos(sceneId, selfId)
	local MonsterId = LuaFnCreateMonster(sceneId, dataId, x, z-2, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, humanLevel+(random(2)-random(2)))
	SetCharacterDieTime(sceneId, MonsterId, 60*60000)

	local strTitle, strName = CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"CreateTitleAndName_ForCangBaoTu", sceneId, selfId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			

		
	BeginEvent(sceneId)		
		AddText(sceneId,"Ti¬u tâm! ÐÕo mµ t£c");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--ÐÕt ðßþc V§t ph¦m --OK
--**********************************
function x760399_DiscoverItem(sceneId, selfId)
	
		--tableIndex = random(9)
		--ItemSn = g_ItemTable[tableIndex].sn
		--ItemName = g_ItemTable[tableIndex].name
		--PrintStr("DiscoverItem...")
		local ItemSn, ItemName,_, bBroadCast
		local playerLevel = LuaFnGetLevel(sceneId, selfId)
		if playerLevel <= 10 then
		ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex10)
		elseif playerLevel <= 20 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex20)
		elseif playerLevel <= 30 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex30)
		elseif playerLevel <= 40 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex40)
		elseif playerLevel <= 50 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex50)
		elseif playerLevel <= 60 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex60)
		elseif playerLevel <= 70 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex70)
		elseif playerLevel <= 80 then
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex80)
		else
			ItemSn, ItemName,_, bBroadCast = GetOneMissionBonusItem(x760399_g_MissionIndex90)
		end
		
		BeginAddItem(sceneId)
			AddItem(sceneId, ItemSn, 1)
		local canAdd = EndAddItem(sceneId,selfId)
		
		if canAdd> 0 then
			--Khen thß·ng Th¯ng kê 
			local itemName;
			_,itemName,_ = GetItemInfoByItemId(ItemSn)
			LuaFnAuditItemCreate(sceneId,selfId,1,ItemSn,itemName,"OÕt Bäo")

		AddItemListToHuman(sceneId,selfId)
		local strText = format("Ngß½i ÐÕt ðßþc %s", ItemName)
		
		BeginEvent(sceneId)
			AddText(sceneId, strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local PlayName = GetName(sceneId,selfId)
		local x, z = GetWorldPos(sceneId,selfId)

		local_, sceneName = CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"GetScenePosInfo", sceneId,sceneId)
		ItemName = GetItemTransfer(sceneId,selfId,0)
		strText = format("#W#{_INFOUSR%s}#PTÕi #G%s#POÕt Bäo Th¶i May m¡n Ðßþc ðªn #W#{_INFOMSG%s}", PlayName, sceneName, ItemName)
		--PrintNum(bBroadCast)
			BroadMsgByChatPipe(sceneId, selfId, strText, bBroadCast)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i b¯i Bao Ðã mãn !")
			EndEvent()	
			DispatchMissionTips(sceneId, selfId)
			return 0
		end	
		return 1
end

--**********************************
--Cån cÑ Cänh tßþng IdÐªn ra Ð¯i Ñng Quái v§t Cüa ID
--**********************************
function x760399_GetDataIDbySceneID(sceneId)
		for i, SceneMapInfo in x760399_g_SceneMapDefine do
			if SceneMapInfo.sceneId == sceneId then
				return SceneMapInfo.CorpseMonsterId
			end
		end
		return x760399_g_DefaultCorpseDataId
end

--**********************************
--Thä ra Cß½ng thi 
--**********************************
function x760399_DiscoverCorpseMonster(sceneId, selfId)

		local corpseMonsterId = x760399_GetDataIDbySceneID(sceneId)
		for i=1, 3 do
			local_, sceneName, x, z,_ = CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"GetScenePosInfo", sceneId,sceneId)
			--Ít nh¤t Bäo ðäm — ngß¶i ch½i Bên ngß¶i Xu¤t hi®n Mµt cái ÐoÕt bäo Mã t£c 
			if i == 1 then
				x, z = GetWorldPos(sceneId,selfId)
				x = x + 2
			end	
			
			corpseMonsterId = corpseMonsterId or x760399_g_DefaultCorpseDataId
			local aifile = random(3)
			local MonsterId = LuaFnCreateMonster(sceneId, corpseMonsterId, x, z, 0, aifile, x760399_g_NpcScriptID)
			SetCharacterDieTime(sceneId, MonsterId, 60*60000)
			--Thiªt trí Ð¯i Quái Vi Hæu häo Trß¾c m¡t Th¸ 0Hào Th¸ Hæu häo ,Nªu có Nhân Thay ð±i Tß½ng Ñng Thª lñc Danh v÷ng Ta ðây Tñu Thäm !!:-(((
			SetUnitReputationID(sceneId, selfId, MonsterId, 0)
			local monsterLevel = GetLevel(sceneId, MonsterId)
			SetLevel(sceneId, MonsterId, monsterLevel+i-1)
			--Nªu Quái v§t Cüa L¾n nh¤t C¤p b§c Vßþt qua Ngß¶i ch½i L¾n nh¤t C¤p b§c HÕn mÑc cao nh¤t ,T¡c Quái v§t C¤p b§c Tß½ng ðß½ng Ngß¶i ch½i L¾n nh¤t C¤p b§c HÕn mÑc cao nh¤t 
			local PlayerMaxLevel = GetHumanMaxLevelLimit()
			if monsterLevel+i-1> PlayerMaxLevel then
				SetLevel(sceneId, MonsterId, PlayerMaxLevel)
			end
		end
		
		BeginEvent(sceneId)
			AddText(sceneId,"Thä ra ÐoÕt bäo Mã t£c ð¥u lînh");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local_, sceneName = CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"GetScenePosInfo", sceneId,sceneId)
		
		local playerName = GetName(sceneId,selfId)
		local strText = format("{Thiên Hoang c± Cänh }:#P#W#{_INFOUSR%s}#PTÕi #G%s#P#PSØ døng #YHi thª Trân bäo Ð° #PTh¶i Ðßa t¾i 3Cái Cß¾p ðoÕt Võ lâm Tr÷ng bäo Cüa #{_BOSS148}#P,M¶i Các v¸ Võ lâm Ð°ng ðÕo T¯c t¯c Tiªn ðªn Quét sÕch ,Ðánh bÕi B÷n h÷ Tß½ng Có c½ hµi ÐÕt ðßþc #YLong Vån #P,#YNg÷c Long Tüy #P,#YChú Vån Huyªt ng÷c #P,#YChuª Long thÕch #PÐÆng Hi hæu Bäo v§t .", 
					playerName, sceneName)

		BroadMsgByChatPipe(sceneId, selfId, strText, 4)

end

--**********************************
--R¾t nh§p Bäo tàng 
--**********************************
function x760399_DiscoverInstance(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"R¾t nh§p Bäo tàng");
			CallScriptFunction(x760399_g_DiaorubaozangScriptId,"MakeCopyScene",sceneId, selfId, 0)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************
--Tao ngµ C½ quan --OK
--**********************************
function x760399_DiscoverTrap(sceneId, selfId)
		local nHp = GetHp(sceneId, selfId)
		local nMp = GetHp(sceneId, selfId)
		local nHp = nHp * 0.3 --0.05
		local nMp = nMp * 0.3 --0.05
		
		if nHp <1 then
			nHp = 1
		end
		if nMp <1 then
			nMp = 1
		end
		
		SetHp(sceneId, selfId, nHp)
		SetMp(sceneId, selfId, nMp)
		
		BeginEvent(sceneId)
			AddText(sceneId,"Tao ngµ C½ quan");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************
--Cam ch¸u Sñ ki®n 
--**********************************
function x760399_OnDefaultEvent(sceneId, selfId, BagPos)
	--PrintStr("cangbaotu...x760399_OnDefaultEvent...")
	
	--Không ð¥y 30C¤p Th¶i Khinh Thi®p Bäo tàng Khüng Có tánh mÕng chi ngu A 
	if GetLevel(sceneId, selfId) <30 then
		BeginEvent(sceneId)
			AddText(sceneId,"Không ð¥y 30C¤p Th¶i Khinh Thi®p Bäo tàng Khüng Có tánh mÕng chi ngu A")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return
	end	
	
	-- /////////////////////////////////////////////////////////////////
	-- Tiên L¤y ra V§t ph¦m Trung S¯ li®u ,Nªu là Cam ch¸u Tr¸ 0T¡c Thuyªt minh Th¸ L¥n ð¥u tiên SØ døng ,L§p tÑc Sinh thành S¯ li®u 
	-- Nªu Ðã có S¯ li®u T¡c Cái gì Ð«u không T¯ 
	local targetSceneId, targetX, targetZ, r = x760399_GetItemParam(sceneId, selfId, BagPos)
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the first time.... nil nil nil")
		--L§p tÑc Sinh thành S¯ li®u 
		CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"ProduceItemParamData", sceneId, selfId, BagPos)
		--Mµt l¥n næa Thu hoÕch V§t ph¦m S¯ li®u 
		targetSceneId, targetX, targetZ, r = x760399_GetItemParam(sceneId, selfId, BagPos)
	end
	-- Có chút BT Chúng ta LÕi làm Mµt l¥n Ki¬m tra ðo lß¶ng 
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the second time.... nil nil nil")
		--L§p tÑc Sinh thành S¯ li®u 
		CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"ProduceItemParamData", sceneId, selfId, BagPos)
		--Mµt l¥n næa Thu hoÕch V§t ph¦m S¯ li®u 
		targetSceneId, targetX, targetZ, r = x760399_GetItemParam(sceneId, selfId, BagPos)
	end
	--Nªu Không · Chï ð¸nh Cüa Cänh tßþng, Chï ð¸nh Cüa T÷a ðµ Tñu B¡n ra Ð¯i thoÕi Khuông Ð« kÏ Ngß¶i ch½i Ði ch² nào Ch² nào Ch² nào 
	local sceneName = CallScriptFunction(x760399_g_ChengxiongdatuScriptId,"GetSceneName", sceneId, selfId, targetSceneId)
	-- /////////////////////////////////////////////////////////////////
	
	--local sceneName = GetSceneName(targetSceneId)
	--PrintStr(sceneName)
	local strText = format("Yêu c¥u Ðªn Thiên Hoang c± Cänh Cüa %s#c00ffff[%d,%d]#WSØ døng #YHi thª Trân bäo Ð° #W,Thành công SØ døng H§u Hµi Ðßa t¾i #RÐoÕt bäo Mã t£c ð¥u lînh #W,M¶i chú ý An toàn ,Kiªn ngh¸ #GT± ðµi #WÐi trß¾c .#r#GChú ý: Ðoàn ðµi Cûng có th¬ ÐÕt ðßþc ÐoÕt bäo Mã t£c ð¥u lînh Cüa R½i xu¯ng .", sceneName, targetX, targetZ)
	
	--L¤y ðßþc Ngß¶i ch½i Trß¾c m£t T÷a ðµ 
	local PlayerX = GetHumanWorldX(sceneId, selfId)
	local PlayerZ = GetHumanWorldZ(sceneId, selfId)
	--Tính toán Ngß¶i ch½i Dæ Møc tiêu Ði¬m Cüa Khoäng cách 
	local Distance = floor(sqrt((targetX-PlayerX)*(targetX-PlayerX)+(targetZ-PlayerZ)*(targetZ-PlayerZ)))
	--print(PlayerX,PlayerZ)

	if targetSceneId ~= sceneId or Distance> r then
		--print(sceneId,selfId,targetId)
		BeginEvent(sceneId)
			AddText(sceneId, strText);
			--AddText(sceneId,"#e00f000Ti¬u ð« KÏ: #e000000Ðôi khi Tàng bäo ð° S¨ xu¤t hi®n TÕi #gfff0f0Cao h½n Ngài Trß¾c m¡t C¤p b§c Bän ð° #g000000Này ðó Trên bän ð° m£t Quái v§t C¤p b§c So cao ,#gfff0f0M¶i Ngàn vÕn Ti¬u tâm #g000000,Ngài Có th¬ Tß½ng Tàng bäo ð° Bán ra C¤p Ngß¶i ch½i khác Ho£c là TÕm gác lÕi Chính mình C¤p b§c Bay lên Lúc sau Tái T¾i sØ døng .")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)

		--test code begin
		--EraseItem(sceneId, selfId, BagPos)
		--test cod end
		return
	end	
	
	--C¡t bö Cai V§t ph¦m 
	if LuaFnIsItemAvailable(sceneId, selfId, BagPos) <= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ngài Cüa V§t ph¦m Hi®n tÕi Không th¬ Døng Ho£c Ðã b¸ Töa ð¸nh .")
		EndEvent()
		DispatchMissionTips(sceneId,selfId)	
		return	
	end	
	
	--PrintStr("begin random...")
	--Nªu — sØ døng PhÕm vi, T¡c Tùy c½ Xúc phát Dß¾i Sñ ki®n 
	local ret = random(100)
	if ret <30 then --Ðào ðªn Ngân lßþng 
		x760399_DiscoverCorpseMonster(sceneId, selfId)
	elseif ret <40 then --Thä ra Cß½ng thi 
		x760399_DiscoverCorpseMonster(sceneId, selfId)
	elseif ret <80 then --ÐÕt ðßþc V§t ph¦m 
		x760399_DiscoverCorpseMonster(sceneId, selfId)
		if retval == 0 then
		--Ký løc Th¯ng kê Tin tÑc 
	 LuaFnAuditWaBao(sceneId, selfId)
			return
		end
	elseif ret <85 then --Ngµ ÐÕo mµ t£c 
		x760399_DiscoverCorpseMonster(sceneId, selfId)
	elseif ret <95 then --R¾t nh§p Bäo tàng 
		x760399_DiscoverCorpseMonster(sceneId, selfId)
	else --Tao ngµ C½ quan 
		x760399_DiscoverCorpseMonster(sceneId, selfId)
	end
	
 EraseItem(sceneId, selfId, BagPos)
	
	--Ký løc Th¯ng kê Tin tÑc 
	LuaFnAuditWaBao(sceneId, selfId)
		
end

function x760399_IsSkillLikeScript(sceneId, selfId)
	return 0;
end
