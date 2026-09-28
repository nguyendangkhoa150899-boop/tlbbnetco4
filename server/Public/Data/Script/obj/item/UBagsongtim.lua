--½­ºþ¸ÉÀ¤´ü Created by Dengxx30008080
--½Å±¾ºÅ
x300084_g_scriptId = 300084

x300084_ItemList = 30008080

x300084_GiftList = {}
x300084_GiftList[1]={{item=30008060,num=1},{item=30308021,num=1}}
x300084_GiftList[2]={{item=30008061,num=1},{item=10124153,num=1},{item=30008066,num=1}}
x300084_GiftList[3]={{item=30008062,num=1},{item=30607002,num=1},{item=31000006,num=1},{item=20309010,num=24}}
x300084_GiftList[4]={{item=30008063,num=1},{item=30008027,num=1},{item=20309018,num=32}}
x300084_GiftList[5]={{item=30008064,num=1},{item=31000005,num=1},{item=30008027,num=1}}
x300084_GiftList[6]={{item=30008065,num=1},{item=30008027,num=1},{item=20309012,num=50}}
x300084_GiftList[7]={{item=30504113,num=1},{item=30008027,num=1},{item=30504038,num=10},{item=20309012,num=8},{item=20310000,num=15}}
x300084_GiftList[8]={{item=30504114,num=1},{item=20309013,num=24},{item=20310000,num=15}}
x300084_GiftList[9]={{item=30504115,num=1}}
x300084_GiftList[10]={{item=30504116,num=1},{item=20310000,num=60}}
x300084_GiftList[11]={{item=30504117,num=1},{item=20310000,num=60}}
x300084_GiftList[12]={{item=30505192,num=1},{item=20310000,num=60}}
x300084_GiftList[13]={{item=30505192,num=1},{item=20310000,num=60}}

--ÕâÀïµÄÊÇÒª³ÌÐò½øÐÐ°ó¶¨µÄÎïÆ·,±ØÐëÒ»¸öÒ»¸öµØ¸ø,ËùÒÔÎïÆ·ÊýÁ¿¶¼ÊÇ1,ÓÐ¶à¸öµÄ¾ÍÐ´¶à¸öIDÁË¡£
x300084_BindGiftList = {}
x300084_BindGiftList[1]={30308035,10141805}
x300084_BindGiftList[2]={}
x300084_BindGiftList[3]={}
x300084_BindGiftList[4]={}
x300084_BindGiftList[5]={}
x300084_BindGiftList[6]={}
x300084_BindGiftList[7]={30309056}
x300084_BindGiftList[8]={30505076,50313004}
x300084_BindGiftList[9]={30505076,20500001,20501001,20502001}
x300084_BindGiftList[10]={30505076,30505076,10141108}
x300084_BindGiftList[11]={30505076,30505076}
x300084_BindGiftList[12]={50313004,50313004}
x300084_BindGiftList[13]={30505076,30505076,20500001,20501001,20502001,50313004}

x300084_FreeSpaceList = {
	{4,0},  --1
	{3,0},  --2
	{3,2},  --3
	{2,2},  --4
	{3,0},  --5
	{2,3},  --6
	{5,2},  --7
	{2,4},  --8
	{2,3},  --9
	{4,2},  --10
	{4,2},  --11
	{1,4},  --12
	{3,6},  --13
	}
x300084_SheliziID = 30900058
x300084_SheliziExp = 300000
x300084_SheliziExp65 = 6558342 --65¼¶¸ÉÀ¤´ü¸øµÄÉáÀû×Ó¾­Ñé

--¸ÉÀ¤´üµÄÊýÁ¿
x300084_MaxBagID = 13
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x300084_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ÐèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êý
end


function x300084_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ÐèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûÐ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾ÝÕâ¸öº¯ÊýµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ÐÐ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ð§¹û£¬²»ÔÙÖ´ÐÐºóÐø²Ù×÷£»·µ»Ø0£ºÃ»ÓÐ¼ì²âµ½Ïà¹ØÐ§¹û£¬¼ÌÐøÖ´ÐÐ¡£
--**********************************
function x300084_CancelImpacts( sceneId, selfId )
	return 0; --²»ÐèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êý,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼þ¼ì²âÈë¿Ú
--**********************************
function x300084_OnConditionCheck( sceneId, selfId )
	--Ð£ÑéItemÊÇ·ñÓÐÐ§
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	--±³°üÖÐµÄÎ»ÖÃ
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
	x300084_MsgBox( sceneId, selfId, "#{Item_Locked}" )	--ÎïÆ·ÒÑ¼ÓËø
		return 0
	end

	--²éÕÒÁÐ±í
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	if x300084_ItemList ~= itemIndex then
		 x300084_MsgBox( sceneId, selfId, "ÎïÆ·ÁÐ±í´íÎó")
		return 0
	end 

	--µÈ¼¶²»¹»
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	if CurLevel < 10 then
		x300084_MsgBox(sceneId, selfId, "#{GMTripperObj_Resource_Info_Level_Not_Enough}")
		return 0
	end
  --µÀ¾ßÎïÆ·À¸¿ÕÏÐÎ»ÖÃ²»¹»
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 14 ) then
		 x300084_MsgBox( sceneId, selfId, "Tay näi không ðü 13 ô tr¯ng")
	   return 0
	end
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		    x300084_MsgBox( sceneId, selfId, "  Nguyên li®u không ðü ch² tr¯ng"  )
		return 0
	end
	if GetMenPai(sceneId, selfId) ==9 then
		 x300084_MsgBox( sceneId, selfId, "CÁc hÕ còn chßa gia nh§p môn phái sao có th¬ m·"  )
		return 0	
	end	
  return 1
end
		 
--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--**********************************
function x300084_OnDeplete( sceneId, selfId )
		if(0 < LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
	
	
end

--**********************************
--Ö»»áÖ´ÐÐÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼þ¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒýµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ÐÐÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúÐ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x300084_OnActivateOnce( sceneId, selfId )
	
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
  if itemIndex ==30008080 then
        local q={10553090,10553091,10553092,10553093,10553094,10553095,10553096,10553097,10553098,10553098,10553099,10553099,10100000} --»ð
		for i=1,13 do	
		ibagidx1 =	TryRecieveItem( sceneId, selfId, q[i], 1 )
		if ibagidx1 ~= -1 then		
		LuaFnItemBind(sceneId, selfId,ibagidx1)	
		end
		end	
  end
	x300084_yiqianaddbiaoshi( sceneId, selfId)	
	return 1;
end


function x300084_yiqianaddbiaoshi( sceneId, selfId)
local mybiaoshilist_g_Gem = 
{
{ 50421304,50402005,50403001,50421304,50411002,50414001,50413004,50412005 },--ÉÙÁÖ0
{ 50421404,50402007,50403001,50421404,50411002,50414001,50413004,50412006 },--Ã÷½Ì1
{ 50402008,50421104,50403001,50421104,50411002,50414001,50413004,50412008 },--Ø¤°ï2
{ 50421304,50402005,50403001,50421304,50411002,50414001,50413004,50412005 },--Îäµ±3
{ 50421204,50402006,50403001,50421204,50411002,50414001,50413004,50412007 },--¶ëÃ¼4
{ 50402008,50421104,50403001,50421104,50411002,50414001,50413004,50412008 },--ÐÇËÞ5
{ 50421304,50402005,50403001,50421304,50411002,50414001,50413004,50412005 },--ÌìÁú6
{ 50421204,50402006,50403001,50421204,50411002,50414001,50413004,50412007 },--ÌìÉ½7
{ 50421404,50402007,50403001,50421404,50411002,50414001,50413004,50412006 },--Ã÷½Ì8
{ 50421304,50402005,50403001,50421304,50411002,50414001,50413004,50412005 },--Ä½ÈÝ10
{ 50421304,50402005,50403001,50421304,50411002,50414001,50413004,50412005 },--ÎÞÃÅÅÉ10
{ 50402008,50421104,50403001,50421104,50411002,50414001,50413004,50412008 },--ÌÆÃÅ11
}
		local	tEquipGemTable	= { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 14, 15, 17, 18  } 
		local	Bore_Count			= GetBagGemCount( sceneId, selfId, 0 )
		local nLevel					= GetBagItemLevel( sceneId, selfId, 0 )
		local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		local find						= 0
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend = GetBasicBagEndPos(sceneId, selfId)		
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )			
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )				
				local find = 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end
			end
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )					
					while equipMaxGemCount<3 do				
						local ret = AddBagItemSlot( sceneId, selfId, i )
						equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )			
					end
                --AddBagItemSlotFour( sceneId, selfId, i ) --4¿×²»·Å³ö
				end
			end
                local can = 0
                local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )
				local equipEmbededGemCount = 0
				equipMaxGemCount = 0
				if EquipType >= 0 and EquipType ~= 16 then
				-- ÅÐ¶ÏÊÇ·ñ»¹¿ÉÒÔÏâÇ¶¸ü¶à±¦Ê¯
				equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )
				equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, i )
                end
				--modi:lbyÊÇ·ñ¿ÉÒÔÏâÇ¶
				if equipMaxGemCount > equipEmbededGemCount and equipMaxGemCount ~= 0 then
					can = 1
				end
				if can == 1 then	
					if EquipType == 0 or EquipType == 6 or EquipType == 7 or EquipType == 11 or EquipType == 12 or EquipType == 13 or EquipType == 14 or EquipType == 17 or EquipType == 18 or EquipType == 10  then

						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=1, 4 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType( sceneId, selfId, i, k )
								local Type = LuaFnGetItemType( gemEmbededIdx )
								if Type == gemType then
									-- ¶Ô±ÈÁ½¿Å±¦Ê¯µÄÀàÐÍ£¨±¦Ê¯´óÀà£©
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem( sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing( sceneId, selfId, BagIndex, i )
							end
						end
						
					elseif EquipType == 1 or EquipType == 2 or EquipType == 3 or EquipType == 4 or EquipType == 5 or EquipType == 15 or EquipType == 9   then
						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=5, 8 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType( sceneId, selfId, i, k )
								local Type = LuaFnGetItemType( gemEmbededIdx )
								if Type == gemType then
									-- ¶Ô±ÈÁ½¿Å±¦Ê¯µÄÀàÐÍ£¨±¦Ê¯´óÀà£©
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem( sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing( sceneId, selfId, BagIndex, i )
							end
						end
					end
				end --can == 1
end
	x300084_MsgBox( sceneId, selfId, "Chúc m×ng các hÕ nh§n ðßþc bµ ð° tân thü khäm ng÷c sÇn"  )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
end
--**********************************
--Òýµ¼ÐÄÌø´¦ÀíÈë¿Ú£º
--·µ»Ø£º1¼ÌÐøÏÂ´ÎÐÄÌø£»0£ºÖÐ¶ÏÒýµ¼¡£
--**********************************
function x300084_OnActivateEachTick( sceneId, selfId)
	return 1; 
end

--**********************************
--ÐÑÄ¿ÐÅÏ¢ÌáÊ¾
--**********************************
function x300084_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
