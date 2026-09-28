--Éú³¤µã
--¶ÔÓ¦Éú»î¼¼ÄÜ£º-1
--µØ¹¬±¦ÎïµôÂäÆ÷
--½Å±¾ºÅ******(712533)

--Ò»¸ö±¦ÏäÀïº¬ÓĞ¼¸¸öÎïÆ·
x712533_g_DropNumTable  = {
	{num = 1, odd = 1.0},	--1¸öµÄ¼¸ÂÊ
}

x712533_g_TickCreate_Msg = "T¥n Hoàng Ğ¸a Cung s¨ r½i xu¯ng v§t ph¦m t£ng m÷i ngß¶i!"

--Ã¿ÖÖÎïÆ·ÊÇÄÄÀàÎïÆ·£¬ÇÒ´ËÀàÎïÆ·¶ÑµşÊıÁ¿ÊÇ¼¸¸ö
x712533_g_DropTable = {
	--±¦Ê¯Àà
	{
		itemType = 7, 	--±¦Ê¯ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 1.0, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						20310004, --zchw ÇØ»ÊÖé
					},
	},
}

--±¦Îï»ØÊÕÊ±¼ä2006-8-21 17:33 ĞŞ¸ÄÎªÓÉ¹ÜÀíÆ÷´«µİ½øÀ´

--¸ù¾İ±¾´ÎËæ»úÊıÀ´ÕÒµ½±íÖĞ¶ÔÓ¦µÄË÷Òı
function x712533_GetTableIndexByOdd(tb)
	local oddNow = random();
	
	local base = 0.0;
	for i = 1, getn(tb) do
		if(tb[i].odd + base >= oddNow) then
			return i;
		end
		base = base + tb[i].odd;
	end
	
	return nil;
end

--Éú³Éº¯Êı¿ªÊ¼************************************************************************
--Ã¿¸öItemBoxÖĞ×î¶à10¸öÎïÆ·£¬·µ»ØÖµ -1 Ö±½Ó»ØÊÕÉú³¤µã£¬²»Õ¼ÓÃ
function x712533_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--±¦ÏäµÄÏûÊ§Ê±¼ä
	
	-- ±¦ÏäÀïÓĞ¼¸¸öÎïÆ·
	local numIdx = x712533_GetTableIndexByOdd(x712533_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712533_g_DropNumTable[numIdx].num do
			--Õâ¸öÎïÆ·ÊÇÊ²Ã´ÀàĞÍµÄÎïÆ·
			local showIdx = x712533_GetTableIndexByOdd(x712533_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--Õâ¸öÀàĞÍµÄÎïÆ·ÊıÁ¿ÊÇ¼¸¸ö
				dropNumIdx = x712533_GetTableIndexByOdd(x712533_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712533_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712533_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712533_g_DropTable[showIdx].idx[itemIdx]
						--Ìí¼ÓµôÂäÏäºÍÎïÆ·µ½³¡¾°
						for k = 1, x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " (b¯i) cänh s¯ (" .. x .. ", " .. y .. ") ch² ğó xu¤t hi®n 1 rß½ng v§t ph¦m"..
											 "("..x712533_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end 
						end
					end
				elseif(dropNumIdx and 9 == x712533_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712533_g_DropTable[showIdx].idx)))
					local petId = x712533_g_DropTable[showIdx].idx[petIdx]
					--Ìí¼ÓÕäÊŞµ½³¡¾°
					for k = 1, x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num do
						local PetObjId = nil
						PetObjId = CreatePetOnScene( sceneId, petId, x, y )
						SetCharacterDieTime( sceneId, PetObjId, delDur )
						print( sceneId .. " (b¯i) cänh s¯ (" .. x .. ", " .. y .. ") ch² ğó xu¤t hi®n 1 con trân thú "..
									 GetName( sceneId, PetObjId ) .. "." )
					end 
				end
			end --end of if(showIdx) then
			
			--¼ÇÂ¼ÎïÆ·µôÂä°üËù°üº¬µÄÄÚÈİ
			if(showIdx and dropNumIdx and itemId ~= nil) then
				if(9 ~= x712533_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("Trong rß½ng v§t ph¦m có (loÕi"..x712533_g_DropTable[showIdx].itemType..")"..
								x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								"Cái (con) ["..itemName.."].")
					itemNum = x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "Hình thành t× Bäo rß½ng");
				end
			end
			
		end -- end of for i = 1, x712533_g_DropNumTable[numIdx].num do
		
		--Éè¶¨»ØÊÕÊ±¼ä
		if(ItemBoxId) then
			SetItemBoxMaxGrowTime( sceneId, ItemBoxId, delDur )
			return 0	--Õâ¸ö×ø±ê±»±¦ÏäÕ¼ÓÃÁË
		end
	end
	
	return -1	--Õâ¸ö×ø±êÃ»ÓĞ±»Õ¼ÓÃ
end
--Éú³Éº¯Êı½áÊø**********************************************************************

--Ò»´Î´´½¨¶à¸ö±¦ÏäµÄÍê³Éº¯Êı¿ªÊ¼****************************************************
function x712533_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712533_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 µÈ´ıÏş½¡µÄserver¶Ô»°Æ½Ì¨
		print( sceneId .. " (b¯i) cänh s¯ "..x712533_g_TickCreate_Msg)
	end
end
--Ò»´Î´´½¨¶à¸ö±¦ÏäµÄÍê³Éº¯Êı½áÊø****************************************************

--´ò¿ªÇ°º¯Êı¿ªÊ¼
function x712533_OnOpen( sceneId, selfId, targetId )
--·µ»ØÀàĞÍ
-- 0 ±íÊ¾´ò¿ª³É¹¦
end
--´ò¿ªÇ°º¯Êı½áÊø


--»ØÊÕº¯Êı¿ªÊ¼
function x712533_OnRecycle( sceneId, selfId, targetId )
--·µ»Ø1£¬Éú³¤µã»ØÊÕ
	return 1
end
--»ØÊÕº¯Êı½áÊø

--´ò¿ªºóº¯Êı¿ªÊ¼
function x712533_OnProcOver( sceneId, selfId, targetId )
end

--´ò¿ªºóº¯Êı½áÊø
function x712533_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
