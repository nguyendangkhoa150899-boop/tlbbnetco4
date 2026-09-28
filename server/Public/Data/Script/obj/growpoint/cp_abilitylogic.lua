-- Í¨ÓÃÉú»î¼¼ÄÜÂß¼­½Å±¾
-- ½Å±¾ºÅ
x701601_g_ScriptId = 701601

-- ×°±¸ÔÊÐíÏâÇ¶µÄ±¦Ê¯ÀàÐÍ±í
x701601_g_EquipGemTable = {}

x701601_g_EquipGemCost = {}

x701601_g_EnergyCostTbl = {}
-- ²É¿ó
x701601_g_EnergyCostTbl[ABILITY_CAIKUANG] = {3,4,5,6,7,8,9,10,11,12,13,14}

-- ²ÉÒ©
x701601_g_EnergyCostTbl[ABILITY_CAIYAO] = {3,4,5,6,7,8,9,10,11,12,13,14}
-- ÖÖÖ²
x701601_g_EnergyCostTbl[ABILITY_ZHONGZHI] = {10,10,10,20,20,20,30,30,30,30,30,30}

---------------------------------------------------------------------
---------------------------------------------------------------------


-- ¼ÆËã²úÆ·Æ·ÖÊ
function x701601_CalcQuality(sceneId, RecipeLevel, AbilityLevel, AbilityMaxLevel, ItemIndex)
	-- Ëæ»ú³öÒ»¸öÊý [0, 49]
	--Quality = random(0, 49)
	--return Quality
	if IsEquipItem(ItemIndex) == 1 then
		local lEquipPoint = GetItemEquipPoint(ItemIndex)
		local	lEquipLevel = GeEquipReqLevel(ItemIndex)
		if(lEquipPoint == -1) then
			return random(0, 49)
		elseif 	lEquipPoint == HEQUIP_WEAPON then
			return (lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_CAP then
			return 20+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_ARMOR then
			return 10+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_CUFF then
			return 40+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_BOOT then
			return 30+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_SASH then
			return 20+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_RING then
			return 30+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_NECKLACE then
			return 40+(lEquipLevel/10)-1
		end
	end
	return	random(0, 49)
end

---------------------------------------------------------------------
---------------------------------------------------------------------


-- Åä·½ºÏ³É½áÊøÊ±µÄÊìÁ·¶ÈÔö³¤
function x701601_GainExperience(sceneId, selfId, AbilityID, RecipeLevel)
	-- Éú»î¼¼ÄÜ¼¶±ð
	local AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	local MinLevelDisparity = 0
	local MaxLevelDisparity = 1
	local ExpGain = 0

	if AbilityLevel < 1 or AbilityLevel > 12 then
		return
	end

	--old
	--if AbilityID == ABILITY_PENGREN then
	--	ExpLimit = LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_DIAOYU then
	--	ExpLimit = LEVELUP_ABILITY_DIAOYU[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHONGZHI then
	--	ExpLimit = LEVELUP_ABILITY_ZHONGZHI[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_CAIYAO then
	--	ExpLimit = LEVELUP_ABILITY_CAIYAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHIYAO then
	--	ExpLimit = LEVELUP_ABILITY_ZHIYAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_CAIKUANG then
	--	ExpLimit = LEVELUP_ABILITY_CAIKUANG[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHUZAO then
	--	ExpLimit = LEVELUP_ABILITY_ZHUZAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_FENGREN then
	--	ExpLimit = LEVELUP_ABILITY_FENGREN[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_GONGYI then
	--	ExpLimit = LEVELUP_ABILITY_GONGYI[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_XIANGQIAN then
	--	ExpLimit = LEVELUP_ABILITY_XIANGQIAN[AbilityLevel].AbilityExpLimitTop
	--else
	--	ExpLimit = LEVELUP_ABILITY_MENPAI[AbilityLevel].AbilityExpLimitTop
	--end
	--new
	local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(AbilityID, AbilityLevel);
	if ret and ret == 1 then
		ExpLimit = currentLevelAbilityExpTop;
	end

	ExpNow = GetAbilityExp(sceneId, selfId, AbilityID)

	if ExpLimit <= ExpNow then
		return
	end

	LevelDisparity = AbilityLevel - RecipeLevel
	if LevelDisparity < 0 then
		LevelDisparity = 0
	end

	if LevelDisparity <= MinLevelDisparity then
		ExpGain = 100
	elseif LevelDisparity <= MaxLevelDisparity then
		ExpGain = 100 / (LevelDisparity - MinLevelDisparity + 1)
	end

	Exp = ExpGain + ExpNow

	if Exp > ExpLimit then
		Exp = ExpLimit
	end

	SetAbilityExp(sceneId, selfId, AbilityID, Exp)
	--Msg2Player(sceneId,selfId,"ÊìÁ·¶ÈÔö¼Óµ½"..floor(Exp/100).."¡£",MSG2PLAYER_PARA)
end

---------------------------------------------------------------------------

--¼ì²éÄ³ÏîÉú»î¼¼ÄÜÊÇ·ñÐèÒªÉý¼¶(¸ù¾ÝÊìÁ·¶È×Ô¶¯Éý¼¶)
--AbilityID Ö¸Éú»î¼¼ÄÜ ID
--
function	x701601_CheckAbilityLevel(sceneId,selfId,AbilityID)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, AbilityID)
	Flag = 0

	if AbilityLevel<=10 then
		if AbilityLevel*10<ExpPoint then
			Flag = 1
		end
	elseif AbilityLevel<=20 then
		if (10*10 + (AbilityLevel-10)*20)<ExpPoint then
			Flag = 1
		end
	--elseif ...
	end

	if Flag>0 then
		SetHumanAbilityLevel(sceneId, selfId, AbilityID, AbilityLevel+1)
		AddText(sceneId, selfId, 0, "KÛ nång cuµc s¯ng ðã ðßþc thång c¤p!")
	end

end

function	x701601_TooManyGems(sceneId,selfId, EquipPos)
	GemCount = GetGemEmbededCount(sceneId, selfId, EquipPos)

	if GemCount<3 then
		return 0
	end

	--·µ»Ø 1 ±íÊ¾±¦Ê¯ÏâÇ¶ÊýÁ¿ÒÑÂú
	return 1
end

--±¦Ê¯ÏâÇ¶½Ó¿Ú Gaoqi: ÒÔÇ°ÌÆÅôµÄ´úÂë£¬¾­¹ýºú·±ÐÞ¸Ä¹ýºó£¬ÏÖÔÚÕâ¶Î´úÂëÒÑ¾­·ÏÆú
--GemIndex ±¦Ê¯¶ÔÓ¦µÄÎïÆ·Î¨Ò»ºÅ(ItemIndex)
--selfId Ö¸ºÏ³ÉÎïÆ·µÄÍæ¼Ò
--·µ»ØÖµ 0:³É¹¦£¬ÆäËûÊ§°Ü 1:±¦Ê¯ÏûÊ§ 2:×°±¸ÏûÊ§ 3:±¦Ê¯×°±¸¶¼ÏûÊ§ 4:¾«Á¦²»×ã
function	x701601_EmbedProc(sceneId,selfId, EquipBagIndex, GemIndex, MatIndex1, MatIndex2)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_XIANGQIAN)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_XIANGQIAN)
	--±¦Ê¯µÈ¼¶(1~8)
	GemQual = GetItemQuality(GemIndex)
	--±¦Ê¯Àà±ð
	GemType = GetItemIndex(GemIndex)

	--ÓÐ¶à´ó¼¸ÂÊÉú³É£¬¼¸ÂÊËã·¨¿ÉÒÔ½øÐÐÐÞ¸Ä
	--odds = 90 - (GemQual - 1) * 5
	odds = 25
	if MatIndex1 == 30900009 then --µÍ¼¶±¦Ê¯ÏâÇ¶·û
		odds = 50
	end
	if MatIndex1 == 30900010 then --¸ß¼¶±¦Ê¯ÏâÇ¶·û
		odds = 75
	end
	rand = random(100)


	-- ¼ÆËã¾«Á¦ÏûºÄ
	EnergyCost = GemQual * 2 + 1
	MyNewEnergy = GetHumanEnergy( sceneId, selfId ) - EnergyCost
	if MyNewEnergy < 0 then
		return 4
	end

	--ÏûºÄ½ðÇ®
	local GemCount = GetGemEmbededCount(sceneId, selfId, EquipBagIndex)
	local need_money = x701601_g_EquipGemCost[GemQual]
	if GemCount == 1 then
		need_money = need_money * 2
	elseif GemCount == 2 then
		need_money = need_money * 3
	end
	local ret = LuaFnCostMoney( sceneId, selfId, need_money )
	if ret ~= 1 then
--		BeginEvent(sceneId)
--		AddText(sceneId,"½ðÇ®²»×ã¡£");
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
		return 4 --´úÂëÀïÃæÃ»ÓÐÏà¹Ø¶¨Òå
	end

	-- ÏûºÄ¾«Á¦
	SetHumanEnergy( sceneId, selfId, MyNewEnergy )

	if odds>rand then
		--Ôö¼ÓÊìÁ·¶È
		--x701601_GainExperience(sceneId, selfId, ABILITY_XIANGQIAN, GemQual)
		return 0 --ÏâÇ¶³É¹¦
	else
		if MatIndex2 == 30900011 then --±¦Ê¯Ç¿»¯·û
			if GemQual <= 1 then
				return 1 --±¦Ê¯Ã»ÁË
			else
				return 5 --±¦Ê¯½µ1¼¶
			end
		else
			if GemQual <= 2 then
				return 1 --±¦Ê¯Ã»ÁË
			else
				return 6 --±¦Ê¯½µ2¼¶
			end
		end
	end
end

--±¦Ê¯ÏâÇ¶Ê±ÅÐ¶ÏÁ½¸ö±¦Ê¯ÊÇ·ñ³åÍ»
--Gem1SerialNumber ±¦Ê¯µÄÐòÁÐºÅ
--Gem2SerialNumber ±¦Ê¯µÄÐòÁÐºÅ
--·µ»ØÖµ true ±íÊ¾³åÍ»£¬false ±íÊ¾²»³åÍ»
function	x701601_IsGemConflict(sceneId, Gem1SerialNumber, Gem2SerialNumber)
	--µÃµ½ÎïÆ·µÄÀàÐÍ£¨±¦Ê¯´óÀà£©
	return (LuaFnGetItemType(Gem1SerialNumber) == LuaFnGetItemType(Gem2SerialNumber))
end

function x701601_IsGemFitEquip(sceneId, selfId, GemSerialNum, EquipBagIndex)
	EquipType = LuaFnGetBagEquipType(sceneId, selfId, EquipBagIndex)
	GemType = LuaFnGetItemType(GemSerialNum)
	GemQual = GetItemQuality(GemSerialNum)
	GemCount = GetGemEmbededCount(sceneId, selfId, EquipBagIndex)
	if GemQual <= 0 or GemQual > 9 then
		return 0
	end
	local need_money = x701601_g_EquipGemCost[GemQual]
	if GemCount == 1 then
		need_money = need_money * 2
	elseif GemCount == 2 then
		need_money = need_money * 3
	end
	
	local money = GetMoney( sceneId, selfId )
	if money < need_money then
		return 0
	end

--Ã¿¸ö¿×µ±ÖÐµÄÏâÇ¶µÄ±¦Ê¯±ØÐë²»Í¬ÀàÐÍ	
	local i
	for i=0, GemCount-1 do
		GemEmbededType = GetGemEmbededType(sceneId, selfId, EquipBagIndex, i)
		if GemEmbededType == GemType then
			return 0
		end
	end
	
	if EquipType == -1 then
		return 0
	end

	for i, gem in x701601_g_EquipGemTable[EquipType] do
		if gem == GemType then
			return 1
		end
	end

	return 0
end

--²É¼¯ÀàÉú»î¼¼ÄÜµÄ¾«Á¦ÏûºÄ´¦Àí
function x701601_CalcEnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
	if not x701601_g_EnergyCostTbl[AbilityID] then
		return
	end

	local energyCost = x701601_g_EnergyCostTbl[AbilityID][BaseLevel]
	if not energyCost then
		energyCost = 0
	end

	return energyCost
end

--²É¼¯ÀàÉú»î¼¼ÄÜµÄ¾«Á¦ÏûºÄ´¦Àí
function x701601_EnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
	local energyCost = x701601_CalcEnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)

	if energyCost > 0 then
		local curEnergy = GetHumanEnergy( sceneId, selfId )
		curEnergy = curEnergy - energyCost
		if curEnergy < 0 then
			curEnergy = 0
		end

		--ÉèÖÃÏûºÄºóµÄ¾«Á¦
		SetHumanEnergy( sceneId, selfId, curEnergy )
	end
end

--ÖÖÖ²¼¼ÄÜµÄ¾«Á¦ÏûºÄ´¦Àí
function x701601_EnergyCostZhongZhi(sceneId, selfId, AbilityID, BaseLevel)
	x701601_EnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
end

--ÖÆÒ©¼¼ÄÜ»îÁ¦ÏûºÄ
function x701601_VigorCostZhiYao( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	if RecipeLevel < 8 then
		cost = 5 + 5 * RecipeLevel
	else
		cost = 40
	end

	return cost
end

--Åëâ¿¼¼ÄÜ»îÁ¦ÏûºÄ
function x701601_VigorCostPengRen( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	if RecipeLevel < 8 then
		cost = 5 + 5 * RecipeLevel
	else
		cost = 40
	end

	return cost
end

--´òÔì¼¼ÄÜ»îÁ¦ÏûºÄ
function x701601_VigorCostDazao( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	cost = 5 + 15 * RecipeLevel

	return cost
end

--±¦Ê¯Õª³ý½Ó¿Ú
--·µ»ØÖµ 0:³É¹¦£¨µÍ¼¶±¦Ê¯Õª³ý·û£© 1:ÎÞ´Ë×°±¸ 2:±¦Ê¯Î»ÖÃ´íÎó 3:×°±¸ÉÏÃ»ÓÐ±¦Ê¯ 4:×°±¸·Ç·¨ 8:ÐèÒª±¦Ê¯Õª³ý·û 9:³É¹¦£¨¸ß¼¶±¦Ê¯Õª³ý·û£©
function x701601_ReomveProc(sceneId,selfId, EquipIndex, GemIndex, MatIndex)
	if MatIndex == 73 or MatIndex == 74 then
	local materbagspace = LuaFnGetMaterialBagSpace( sceneId, selfId)
	if materbagspace < 1 then
		return 2
	end
	end
	local equip_point = LuaFnGetBagEquipType(sceneId,selfId, EquipIndex)
	if equip_point == -1 then
		return 2
	end
	
	local gem_type = GetGemEmbededType(sceneId,selfId, EquipIndex, GemIndex)
	if gem_type == 0 then
		return 3
	end
	if gem_type == -1 then
		return 4
	end
	
	if MatIndex == 73 or MatIndex == 74 then
	local isdiansui = floor((mod(gem_type,100000))/1000)
	if isdiansui >= 31 then
	x701601_NotifyTip( sceneId, selfId, "´ËÀà±¦Ê¯²»ÄÜ½øÐÐÉý¼¶" )
	return 2
	end
	if MatIndex == 73 then
	local biaoshiLv = floor((gem_type - 50000000)/100000)
	local itemName=GetItemName( sceneId, gem_type)
	local startpos,endpos = strfind(itemName,"Ú¤¾§")
	if (biaoshiLv == nil or biaoshiLv < 1 or biaoshiLv > 7) and (startpos == nil) and (endpos == nil) then
	return 2
	end
	local ismingjinornot,ismingshiornot = 0,0
	local biaoshiLvLV = mod(gem_type,10)
	if biaoshiLv == 8 and biaoshiLvLV == 8 then
	return 2
	end
	if biaoshiLv < 6 then
	x701601_NotifyTip( sceneId, selfId, "µÍÓÚ6¼¶µÄ±¦Ê¯²»¿É½øÐÐ´ËÀà²Ù×÷" )
	return
	end
	if startpos ~= nil and endpos ~= nil then
	ismingjinornot = 1
	else
	startpos,endpos = strfind(itemName,"Ú¤Ê¯")
	if startpos ~= nil and endpos ~= nil then
	ismingshiornot = 1
	end
	end

        local missmysu = 400
        for i = 1,biaoshiLv-5 do
           missmysu = missmysu*5
        end 
        local nowneedyuanbao = floor((missmysu*0.8)/1)+floor((missmysu*0.1*ismingshiornot)/1)+floor((missmysu*0.05*ismingjinornot)/1)
	local myhaveyuanbao = YuanBao(sceneId,selfId,-1,3,0)
	if myhaveyuanbao < nowneedyuanbao then
	x701601_NotifyTip( sceneId, selfId, "Ôª±¦²»×ã"..nowneedyuanbao.."µã" )
	return 2
	end
	end
	return 9
	end
	local gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatIndex )
	if equip_point == 16 then
	if gem_index == 30503136 then
	return 9
	end
	return 1
	end

	if gem_index == 30900012 then  --µÍ¼¶±¦Ê¯Õª³ý·û
		return 0
	elseif (gem_index >= 30900036 and gem_index <= 30900044) then  --¸ß¼¶±¦Ê¯Õª³ý·û
		return 9
	else
	  return 8
	end
end

function x701601_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--±¦Ê¯Õª³ý½Ó¿Ú
--±¦Ê¯Õª³ýºóµÄÏà¹Ø´¦Àí£¨·¢ËÍÊÀ½ç¹«¸æ£©
function x701601_SplitGemSucceed(sceneId,selfId, EquipPos, GemPos, MatPos)
    if 	MatPos == 74 then
	local CharmId = GetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS);
	if CharmId  < 50000000 then
	local CharmId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemPos )
	if CharmId > 50000000 then
	local delitemid = LuaFnEraseItem( sceneId, selfId, GemPos )
	if delitemid == 1 then
	SetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS,CharmId);
	end
	end
	end
    elseif MatPos == 73 then
	local CharmId = GetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS2);
	local CharmId2 = GetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS);
	if CharmId  < 50000000 then
	local CharmId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemPos )
	CharmId2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemPos );
	if CharmId > 50000000 then
	local delitemid = LuaFnEraseItem( sceneId, selfId, GemPos )
	if delitemid == 1 then
	local biaoshiLv = floor((CharmId - 50000000)/100000)
	if biaoshiLv ~= nil and biaoshiLv >= 1 and biaoshiLv <= 8 then
	local itemName=GetItemName( sceneId, CharmId)
	local startpos,endpos = strfind(itemName,"Ú¤¾§")
	local ismingjinornot,ismingshiornot = 0,0
	local biaoshiLvLV = mod(CharmId,10)
	if biaoshiLv == 8 and biaoshiLvLV == 8 then
	return 0
	end
	if biaoshiLv < 6 then
	x701601_NotifyTip( sceneId, selfId, "µÍÓÚ6¼¶µÄ±¦Ê¯²»¿É½øÐÐ´ËÀà²Ù×÷" )
	return
	end
	if startpos ~= nil and endpos ~= nil then
	ismingjinornot = 1
	else
	startpos,endpos = strfind(itemName,"Ú¤Ê¯")
	if startpos ~= nil and endpos ~= nil then
	ismingshiornot = 1
	end
	end

        local missmysu = 400
        for i = 1,biaoshiLv-5 do
           missmysu = missmysu*5
        end 
        local nowneedyuanbao = floor((missmysu*0.8)/1)+floor((missmysu*0.1*ismingshiornot)/1)+floor((missmysu*0.05*ismingjinornot)/1)
	local result = YuanBao(sceneId,selfId,-1,2,nowneedyuanbao)
    if result ~= -1 then
	CharmId = CharmId + 100000
	if ismingjinornot == 1 then
	if biaoshiLv == biaoshiLvLV then
	ismingjinornot = floor(CharmId/10)*10
	CharmId = ismingjinornot + 1
	else
	CharmId = CharmId2 + 1
	end
	end
	end
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#H#{_INFOUSR%s}»¨·Ñ"..nowneedyuanbao.."Ôª±¦£¬³É¹¦°Ñ±¦Ê¯Éý¼¶Îª[#{_ITEM"..CharmId.."}]", PlayerName)
	if str ~= nil then
	     BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	end
	end
	SetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS2,CharmId);
	end
	end
	end
	SetCharacterTimer( sceneId, selfId, 0)
	SetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISSN,EquipPos+1);
    --Ôö¼ÓÌØÐ§
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	x701601_NotifyTip( sceneId, selfId, "¹§Ï²Äú±¦Ê¯Éý¼¶³É¹¦£¡£¡" )
    end
    if 	MatPos == 73 or MatPos == 74 then
	if 	MatPos == 73 then
	SetCharacterTimer( sceneId, selfId, 1200)
	end
	return 1
	end
    --Ôö¼ÓÌØÐ§
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
    local CharmId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatPos )
    local CharmId2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemPos )
	local itemName=GetItemName( sceneId, CharmId2)
	x701601_NotifyTip( sceneId, selfId, "µÃµ½"..itemName.."" )
     local CharmId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatPos )
	 if CharmId == 30503136 then
	 CallScriptFunction( (830001), "SplitGemSucceed",sceneId,selfId, EquipPos, GemPos, MatPos )
	 return
	 end

    --´óÓÚµÈÓÚ3¼¶ÒÔÉÏ¸ß¼¶±¦Ê¯Õª³ý·ûÊ¹ÓÃÕª³ý³É¹¦·¢³öÊÀ½ç¹«¸æ
    if (CharmId >= 30900038 and CharmId <= 30900044) then  --¸ß¼¶±¦Ê¯Õª³ý·û	
		   local PlayerName = GetName(sceneId,selfId)
		   local GemInfo = GetBagItemTransfer( sceneId, selfId, GemPos )
		   local MatInfo = GetBagItemTransfer( sceneId, selfId, MatPos )
	     str = format( "#H#{_INFOUSR%s} c¥m #{_INFOMSG%s} mi®ng l¦m b¦m, chï th¤y #{_INFOMSG%s} Ch§m rãi bong ra t×ng mãng, Nhßng lÕi không h« t±n thß½ng, Th§t sñ là cñc ph¦m chi phù.", PlayerName, MatInfo, GemInfo)
	     BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	  end

end
