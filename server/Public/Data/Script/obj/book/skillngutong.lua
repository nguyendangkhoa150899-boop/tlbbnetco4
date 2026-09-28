--Ê¹ÓÃÅä·½µÄ½Å±¾

--½Å±¾ºÅ
x338001_g_scriptId = 338001

x338001_g_SkillBooks = {}

-- ItemTable ºÅÎªË÷Òı

-- type: ÊéµÄÀàĞÍ£¬1 ±íÊ¾ĞÄ·¨£¬2 ±íÊ¾¼¼ÄÜ
-- menpaiId: Ñ§Ï°µÄ¶ÔÓ¦Åä·½ºÅ
-- MP_SHAOLIN	= 0
-- MP_MINGJIAO	= 1
-- MP_GAIBANG	= 2
-- MP_WUDANG	= 3
-- MP_EMEI		= 4
-- MP_XINGSU	= 5
-- MP_DALI		= 6
-- MP_TIANSHAN	= 7
-- MP_XIAOYAO	= 8
-- MP_WUMENPAI	= 9

-- needLevel: ÑĞ¶Á´ËÊéĞèÒªµÄÏàÓ¦ÈËÎï¼¶±ğ£¬ -1 ±íÊ¾Ã»ÓĞÒªÇó
-- needXinfa: ÑĞ¶Á´ËÊéĞèÒªµÄÏàÓ¦ĞÄ·¨£¬ -1 ±íÊ¾Ã»ÓĞÒªÇó
-- needXinfaLevel: ÑĞ¶Á´ËÊéĞèÒªÏàÓ¦ĞÄ·¨µÄµÈ¼¶£¬ -1 ±íÊ¾Ã»ÓĞÒªÇó
-- specialEffectID: ÌØĞ§ºÅ

-- ÃÅÅÉÃû³Æ #{_MENPAI" .. menpaiid .. "}
-- ÎïÆ·Ãû³Æ #{_ITEM" .. itemid .. "}
-- ĞÄ·¨Ãû³Æ #{_XINFA" .. xinfaid .. "}																								
--------------------½ø½×¼¼ÄÜ--------------------------																									
x338001_g_SkillBooks[30310127] = { type = 2, id = 2020, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }																																																	
x338001_g_SkillBooks[30310128] = { type = 2, id = 2024, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310129] = { type = 2, id = 2022, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310130] = { type = 2, id = 2016, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310131] = { type = 2, id = 2018, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310132] = { type = 2, id = 2021, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310133] = { type = 2, id = 2025, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310134] = { type = 2, id = 2023, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310135] = { type = 2, id = 2017, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310136] = { type = 2, id = 2019, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }																																																		
x338001_g_SkillBooks[30310137] = { type = 2, id = 2036, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }	
x338001_g_SkillBooks[30310138] = { type = 2, id = 2037, menpaiId = 9, needLevel = 75, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }																																																		

x338001_g_TypeNames = {}
x338001_g_TypeNames[1] = "Bí T¸ch"
x338001_g_TypeNames[2] = "Yªu Quyªt"

--**********************************
-- ·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ºÖ´ĞĞ OnDefaultEvent¡£
--**********************************
function x338001_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- ·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x338001_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- Ìõ¼ş¼ì²âÈë¿Ú£º·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x338001_OnConditionCheck( sceneId, selfId )
	-- Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end

	-- ÕÒµ½ÏàÓ¦ÌõÄ¿
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local skillBook = x338001_g_SkillBooks[itemTblIndex]
	if not skillBook then
		return 0
	end

	if GetLevel( sceneId, selfId ) < skillBook.needLevel then
		x338001_NotifyFailTips( sceneId, selfId, "Ngß½i ğü c¤p ğµ ğ¬ h÷c " .. x338001_g_TypeNames[skillBook.type] .. ". " )
		return 0
	end

	if skillBook.needXinfa ~= -1 then
		local xinfaLevel = HaveXinFa( sceneId, selfId, skillBook.needXinfa )
		if xinfaLevel < 1 then
			x338001_NotifyFailTips( sceneId, selfId, "C¥n Bí t¸ch: #{_XINFA" .. skillBook.needXinfa .. "}. " )
			return 0
		end

		if xinfaLevel < skillBook.needXinfaLevel then
			-- ĞèÒª²âÊÔÕâ¸öµØ·½£¬¿çĞĞ¶øÇÒÃ»ÓĞ·ÖºÅ
			x338001_NotifyFailTips( sceneId, selfId, "C¥n Bí t¸ch: #{_XINFA" .. skillBook.needXinfa .. "} "
				.. skillBook.needXinfaLevel .. " hi®n ngß½i ğang ğÕt c¤p " .. xinfaLevel .. ". " )
			return 0
		end
	end

	if skillBook.type == 1 then					-- ĞÄ·¨
		if HaveXinFa( sceneId, selfId, skillBook.id ) > 0 then
			x338001_NotifyFailTips( sceneId, selfId, "Ngß½i ğã h÷c qua tâm pháp này" )
			return 0
		end
	elseif skillBook.type == 2 then				-- Òª¾÷
		if HaveSkill( sceneId, selfId, skillBook.id ) == 1 then
			x338001_NotifyFailTips( sceneId, selfId, "Ngß½i ğã h÷c kÛ nång này." )
			return 0
		end
	end

	return 1
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£¬¸ºÔğÏûºÄµÄ¼ì²âºÍÖ´ĞĞ£º
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x338001_OnDeplete( sceneId, selfId )
	if LuaFnDepletingUsedItem( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x338001_OnActivateOnce( sceneId, selfId )
	-- ÕÒµ½ÏàÓ¦ÌõÄ¿
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local skillBook = x338001_g_SkillBooks[itemTblIndex]
	if not skillBook then
		return 0
	end

	-- Ñ§Ï°
	if skillBook.type == 1 then					-- ĞÄ·¨
		if HaveXinFa( sceneId, selfId, skillBook.id ) > 0 then
			x338001_NotifyFailTips( sceneId, selfId, "Ngß½i ğã h÷c tâm pháp này." )
			return 0
		else
			AddXinFa( sceneId, selfId, skillBook.id )
		end
	elseif skillBook.type == 2 then				-- Òª¾÷
		if HaveSkill( sceneId, selfId, skillBook.id ) == 1 then
			x338001_NotifyFailTips( sceneId, selfId, "Ngß½i ğã h÷c kÛ nång này." )
			return 0
		else
			AddSkill( sceneId, selfId, skillBook.id )
		end
	end

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, skillBook.specialEffectID, 0 )
	return 1
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜĞÄÌøÊ±ÉúĞ§µÄÈë¿Ú
--**********************************
function x338001_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
-- ĞÑÄ¿Ê§°ÜÌáÊ¾
--**********************************
function x338001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
