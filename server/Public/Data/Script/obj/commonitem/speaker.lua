--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ

--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀı:


--Public\Data\Script\obj\commonitem\speaker.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾
--Ğ¡À®°È
--½Å±¾ºÅ
x330003_g_ScriptId	= 330003

--Ğ§¹ûµÄID
x330003_g_Impact		= -1	--Ê¹ÓÃÒ»¸öÌØ¶¨µÄÌØĞ§±àºÅ

--·µ»ØÖµ´¦Àí¼¯
x330003_g_WGCResult	=
{
	["SUC_SEND"]			= 36,		--Ğ¡À®°È·¢ËÍ³É¹¦
	["FAL_SEND"]			= 37,		--Ğ¡À®°È·¢ËÍÊ§°Ü£ºÎ´Öª
	["FAL_FULL"]			= 38,		--Ğ¡À®°È·¢ËÍÊ§°Ü£ºÏûÏ¢³ØÒÑÂú
}


x330003_g_itemTabIdxList = { 30505107, 30505219 }

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x330003_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x330003_IsSkillLikeScript( sceneId, selfId )
	return 1	 --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x330003_CancelImpacts( sceneId, selfId )
	return 0	 --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x330003_OnConditionCheck( sceneId, selfId )
    local strGUID = LuaFnGetGUID(sceneId,selfId)
	-- cam Loa
	if strGUID == -1 or strGUID == -1 or strGUID == -1 or strGUID == -1 or strGUID == -1  then
	x330003_MsgBox( sceneId, selfId, "BÕn ğã b¸ c¤m loa, xin liên h® admin m· khóa! " )
	--x330003_MsgBox( sceneId, selfId, "Süa tiªp ği th¢ng xàm l°n ğ¸t m© mày chØi tao à làm Game cho còn süa nh£ng giöi v« mà làm#213 óc #93 !" )

	     return
	end
	--±³°üÖĞµÄÎ»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330003_MsgBox( sceneId, selfId, "V§t ph¦m này ğã b¸ khóa" )
		return 0
	end

	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	return 1

end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x330003_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x330003_OnActivateOnce( sceneId, selfId )

	if( -1 ~= x330003_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330003_g_Impact, 0 )
	end
	
	--±³°üÖĞµÄÎ»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--ºô½Ğ·¢ËÍ½çÃæ
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 5422 )
	return 1

end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x330003_OnActivateEachTick( sceneId, selfId )
	return 1	 --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı¡£
end

--**********************************
--C++»Øµ÷½Ó¿Ú£¬ÑÏ½ûClientºô½Ğ£º
--Ğ¡À®°È·¢²¼Ç°¼ì²é
--**********************************
function x330003_CallBackSpeakerBefore( sceneId, selfId )
    local strGUID = LuaFnGetGUID(sceneId,selfId)
	-- cam thien ly truyen am
	if strGUID == -1 or strGUID == -1 or strGUID == -1 or strGUID == -1 or strGUID == -1  then
	x330003_MsgBox( sceneId, selfId, "BÕn ğã b¸ c¤m loa, xin liên h® admin m· khóa! " )
	--x330003_MsgBox( sceneId, selfId, "Süa tiªp ği th¢ng xàm l°n ğ¸t m© mày chØi tao à làm Game cho còn süa nh£ng giöi v« mà làm#213 óc #93 !" )

	     return
	end
	--»ñÈ¡ÎïÆ·ID
	local ItemIndex = 0
	if LuaFnGetAvailableItemCount( sceneId, selfId, x330003_g_itemTabIdxList[2] ) > 0 then
		ItemIndex = x330003_g_itemTabIdxList[2]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[2] )		
	else
		ItemIndex = x330003_g_itemTabIdxList[1]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[1] )
	end
			
	local	itmId	= ItemIndex;
	if itmId <= 0 then
		x330003_MsgBox( sceneId, selfId, "T¯c ğµ truy«n tin cüa các hÕ quá nhanh!" )
		return 0
	end
	if LuaFnDelAvailableItem( sceneId, selfId, itmId, 1 ) == 0 then
		x330003_MsgBox( sceneId, selfId, "Không có v§t ph¦m, v§t ph¦m không th¬ sØ døng ho£c b¸ khóa!" )
		return 0
	end

	return 1
end

--**********************************
--C++»Øµ÷½Ó¿Ú£¬ÑÏ½ûClientºô½Ğ£º
--Ğ¡À®°È·¢²¼ºó·µ»Ø
--**********************************
function x330003_CallBackSpeakerAfter( sceneId, selfId, retType, retParam )

	--»ñÈ¡ÎïÆ·ID
	local ItemIndex = GetMissionData( sceneId, selfId, MD_SPEAKER_STATE )

	local ItemId = 0
	for i, ItemTabIdx in x330003_g_itemTabIdxList do
		if ItemIndex == ItemTabIdx then
			ItemId = ItemIndex
			break
		end
	end
	local	itmId	= ItemId;
	if itmId <= 0 then
		return 0
	end

	if retType == x330003_g_WGCResult["SUC_SEND"] then
		if retParam > 0 then
			nMin		= floor( retParam / 60 )
			nSec		= mod( retParam, 60 )
			szTim		= nil
			if nMin > 0 then
				szTim	= nMin.."phút"..nSec.."giây"
			else
				szTim	= nSec.."giây"
			end
			x330003_MsgBox( sceneId, selfId, "Cái kèn nhö ğã phát thành công, các hÕ c¥n ğşi khoäng "..szTim.."¡£" )
		--else
			--x330003_MsgBox( sceneId, selfId, "Cái kèn nhö ğã phát thành công." )
		end
			
		SetMissionData( sceneId, selfId, QUANQULABA,GetMissionData( sceneId, selfId,QUANQULABA)+1)	
	local mylevel =  GetMissionData(sceneId, selfId, QUANQULABA)
	   CallScriptFunction( (888899), "SetDengji", sceneId, selfId,mylevel,5 )	
		
		
		
				       local allfirstplayer = GetPaiming(sceneId,5)
	        	 local nMonsterNum = GetMonsterCount(sceneId)
	         for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				local MosDataID = GetMonsterDataID(sceneId, MonsterId )
				if MosDataID == 43541 then
				 SetCharacterName(sceneId,MonsterId,"#G"..allfirstplayer[1].Guid)
		        end
	        end	
			
		---Õâ¸öµØ·½ÊÇ·¢ËÍ³É¹¦ÁËµÄ¸ømiss¼ÇÂ¼ÏÂÀ´¼´¿ÉÅÅÃû
		
		
		
		
		
		
		
		
		
		
		
		
	elseif retType == x330003_g_WGCResult["FAL_SEND"] then
		x330003_MsgBox( sceneId, selfId, "Cái kèn nhö ğã phát th¤t bÕi!" )
	elseif retType == x330003_g_WGCResult["FAL_FULL"] then
		x330003_MsgBox( sceneId, selfId, "Tin tÑc cüa cái kèn nhö ğã ğ¥y, vui lòng ğşi 30 giây næa r°i hãy thØ lÕi!" )
		TryRecieveItem( sceneId, selfId, itmId, QUALITY_CREATE_DEFAULT )
	end

	return 1
end

--**********************************
--ĞÅÏ¢ÌáÊ¾
--**********************************
function x330003_MsgBox( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
