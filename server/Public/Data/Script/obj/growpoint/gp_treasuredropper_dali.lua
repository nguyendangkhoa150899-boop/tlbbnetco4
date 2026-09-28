--Éú³¤µã
--¶ÔÓ¦Éú»î¼¼ÄÜ£º-1
--´óÀí±¦ÎïµôÂäÆ÷
--½Å±¾ºÅ******(712501)

--Ò»¸ö±¦ÏäÀïº¬ÓĞ¼¸¸öÎïÆ·
x712501_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1¸öµÄ¼¸ÂÊ
	{num = 2, odd = 0.4},	--2¸öµÄ¼¸ÂÊ
	{num = 3, odd = 0.2},	--3¸öµÄ¼¸ÂÊ
	{num = 4, odd = 0.15},	--4¸öµÄ¼¸ÂÊ
	{num = 5, odd = 0.05},	--5¸öµÄ¼¸ÂÊ
}

x712501_g_TickCreate_Msg = "Tiên næ tung hoa!! Thành ĞÕi Lı s¨ ném ğ° v§t xu¯ng t£ng m÷i ngß¶i!"

--Ã¿ÖÖÎïÆ·ÊÇÄÄÀàÎïÆ·£¬ÇÒ´ËÀàÎïÆ·¶ÑµşÊıÁ¿ÊÇ¼¸¸ö
x712501_g_DropTable = {
	--ÑªÒ©Àà
	{
		itemType = 1, 	--ÑªÒ©ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.5, 			--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 0.2},				--1¸öµÄ¼¸ÂÊ
							{num = 2, odd = 0.4},				--2¸öµÄ¼¸ÂÊ
							{num = 3, odd = 0.2},				--3¸öµÄ¼¸ÂÊ
							{num = 4, odd = 0.15},			--4¸öµÄ¼¸ÂÊ
							{num = 5, odd = 0.05},			--5¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						30001001,30003001,30101031,
					},
	},
	--À¶Ò©Àà
	{
		itemType = 2, 	--À¶Ò©ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.3, 			--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 0.2},				--1¸öµÄ¼¸ÂÊ
							{num = 2, odd = 0.4},				--2¸öµÄ¼¸ÂÊ
							{num = 3, odd = 0.2},				--3¸öµÄ¼¸ÂÊ
							{num = 4, odd = 0.15},			--4¸öµÄ¼¸ÂÊ
							{num = 5, odd = 0.05},			--5¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						30002001,30101041,
					},
	},
	--¿ÚÁ¸
	{
		itemType = 3, 	--¿ÚÁ¸µÄÀàĞÍ±êÊ¶
	 	odd = 0.0, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 0.2},				--1¸öµÄ¼¸ÂÊ
							{num = 2, odd = 0.4},				--2¸öµÄ¼¸ÂÊ
							{num = 3, odd = 0.2},				--3¸öµÄ¼¸ÂÊ
							{num = 4, odd = 0.15},			--4¸öµÄ¼¸ÂÊ
							{num = 5, odd = 0.05},			--5¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						20103001,20103002,20103003,20103004,20103005,		--¿óÊ¯
						20103006,20103007,20103008,20103009,20103010,
					},
	},
	--²ÄÁÏÀà
	{
		itemType = 4, 	--²ÄÁÏÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.0, 			--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 2, odd = 0.2},				--2¸öµÄ¼¸ÂÊ
							{num = 4, odd = 0.4},				--4¸öµÄ¼¸ÂÊ
							{num = 6, odd = 0.2},				--6¸öµÄ¼¸ÂÊ
							{num = 8, odd = 0.15},			--8¸öµÄ¼¸ÂÊ
							{num = 10, odd = 0.05},			--10¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						20104001,20104002,20104003,20104004,20104005,		--Ğ¡Âó
						20104006,20104007,20104008,20104009,20104010,
					},
	},
	--°×É«ÎäÆ÷Àà
	{
		itemType = 5, 	--°×É«ÎäÆ÷ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.1, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						10100001,10101001,10102001,10103001,10104001,10105001,
					},
	},
	--À¶É«ÎäÆ÷Àà
	{
		itemType = 10, 	--À¶É«ÎäÆ÷ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.0, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
					},
	},
	--°×É«×°±¸Àà
	{
		itemType = 6, 	--°×É«×°±¸ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.1, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						10110001,10110002,10110003,10111001,10111002,10111003,10112001,
						10112002,10112003,10113001,10113002,10113003,10120001,10121001,
						10122001,
					},
	},
	--À¶É«×°±¸Àà
	{
		itemType = 11, 	--À¶É«×°±¸ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.0, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
					},
	},
	--±¦Ê¯Àà
	{
		itemType = 7, 	--±¦Ê¯ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.0, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						20107001,20107002,20107003,20107004,20107005,		--²İÆ¤¸ï
						20107006,20107007,20107008,20107009,20107010,
					},
	},
	--Åä·½Àà
	{
		itemType = 8, 	--Åä·½ÀàµÄÀàĞÍ±êÊ¶
	 	odd = 0.0, 			--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 1.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÎïÆ·ĞòÁĞºÅ±í
						20108001,20108002,20108003,20108004,20108005,		--²ĞÈ±¡¢»µµô
						20108006,20108007,20108008,20108009,20108010,
					},
	},
	--ÕäÊŞ
	{
		itemType = 9, 	--ÕäÊŞµÄÀàĞÍ±êÊ¶
	 	odd = -1.0, 		--³öÏÖ¼¸ÂÊ
	 	numOdd = {
							{num = 1, odd = 0.0},				--1¸öµÄ¼¸ÂÊ
						 },
		idx = {	--ÕäÊŞĞòÁĞºÅ±í
						3009,3019,3029,
					},
	},
}

--±¦Îï»ØÊÕÊ±¼ä2006-8-21 17:33 ĞŞ¸ÄÎªÓÉ¹ÜÀíÆ÷´«µİ½øÀ´

--¸ù¾İ±¾´ÎËæ»úÊıÀ´ÕÒµ½±íÖĞ¶ÔÓ¦µÄË÷Òı
function x712501_GetTableIndexByOdd(tb)
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
function x712501_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--±¦Ïä»òÕäÊŞµÄÏûÊ§Ê±¼ä
	
	-- ±¦ÏäÀïÓĞ¼¸¸öÎïÆ·
	local numIdx = x712501_GetTableIndexByOdd(x712501_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712501_g_DropNumTable[numIdx].num do
			--Õâ¸öÎïÆ·ÊÇÊ²Ã´ÀàĞÍµÄÎïÆ·
			local showIdx = x712501_GetTableIndexByOdd(x712501_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--Õâ¸öÀàĞÍµÄÎïÆ·ÊıÁ¿ÊÇ¼¸¸ö
				dropNumIdx = x712501_GetTableIndexByOdd(x712501_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712501_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712501_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712501_g_DropTable[showIdx].idx[itemIdx]
						--Ìí¼ÓµôÂäÏäºÍÎïÆ·µ½³¡¾°
						for k = 1, x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " (b¯i) cänh s¯ (" .. x .. ", " .. y .. ") ch² ğó xu¤t hi®n 1 rß½ng v§t ph¦m"..
											 "("..x712501_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712501_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712501_g_DropTable[showIdx].idx)))
					local petId = x712501_g_DropTable[showIdx].idx[petIdx]
					--Ìí¼ÓÕäÊŞµ½³¡¾°
					for k = 1, x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num do
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
				if(9 ~= x712501_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("Trong rß½ng v§t ph¦m có (loÕi"..x712501_g_DropTable[showIdx].itemType..")"..
								x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								"Cái (con) ["..itemName.."].")
					itemNum = x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "Hình thành t× Bäo rß½ng");
				end
			end
			
		end -- end of for i = 1, x712501_g_DropNumTable[numIdx].num do
		
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
function x712501_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712501_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 µÈ´ıÏş½¡µÄserver¶Ô»°Æ½Ì¨
		print( sceneId .. " (b¯i) cänh s¯ "..x712501_g_TickCreate_Msg)
	end
end
--Ò»´Î´´½¨¶à¸ö±¦ÏäµÄÍê³Éº¯Êı½áÊø****************************************************

--´ò¿ªÇ°º¯Êı¿ªÊ¼
function x712501_OnOpen( sceneId, selfId, targetId )
--·µ»ØÀàĞÍ
-- 0 ±íÊ¾´ò¿ª³É¹¦
end
--´ò¿ªÇ°º¯Êı½áÊø


--»ØÊÕº¯Êı¿ªÊ¼
function x712501_OnRecycle( sceneId, selfId, targetId )
--·µ»Ø1£¬Éú³¤µã»ØÊÕ
	return 1
end
--»ØÊÕº¯Êı½áÊø

--´ò¿ªºóº¯Êı¿ªÊ¼
function x712501_OnProcOver( sceneId, selfId, targetId )
end

--´ò¿ªºóº¯Êı½áÊø
function x712501_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
