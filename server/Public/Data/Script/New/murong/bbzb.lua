--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ

--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀı:


--obj_71.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾

--½Å±¾ºÅ
x391507_g_scriptId = 391507 --ÁÙÊ±Ğ´Õâ¸ö,ÕæÕıÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.

--ĞèÒªµÄµÈ¼¶

--Ğ§¹ûµÄID

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x391507_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x391507_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x391507_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x391507_OnConditionCheck( sceneId, selfId )
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x391507_OnDeplete( sceneId, selfId )
		local itemindex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		if itemindex > 39999910 and itemindex < 39999918 then
			local itemindex1 = itemindex - 39999910
			local itemindex2 = GetMissionData( sceneId, selfId, 186 )
				if itemindex2 > 0 then
					TryRecieveItem( sceneId, selfId, 39999910 + itemindex2, 1)
				end
				SetMissionData( sceneId, selfId, 186,itemindex1 )
				
x391507_axiaoui( sceneId, selfId)
		elseif itemindex > 39999920 and itemindex < 39999928 then
			local itemindex1 = itemindex - 39999920
			local itemindex2 = GetMissionData( sceneId, selfId, 187 )
				if itemindex2 > 0 then
					TryRecieveItem( sceneId, selfId, 39999920 + itemindex2, 1)
				end
				SetMissionData( sceneId, selfId, 187,itemindex1 )
x391507_axiaoui( sceneId, selfId)
		elseif itemindex > 39999930 and itemindex < 39999938 then
			local itemindex1 = itemindex - 39999930
			local itemindex2 = GetMissionData( sceneId, selfId, 188 )
				if itemindex2 > 0 then
					TryRecieveItem( sceneId, selfId, 39999930 + itemindex2, 1)
				end
				SetMissionData( sceneId, selfId, 188,itemindex1 )
x391507_axiaoui( sceneId, selfId)
		elseif itemindex > 39999940 and itemindex < 39999948 then
			local itemindex1 = itemindex - 39999940
			local itemindex2 = GetMissionData( sceneId, selfId, 189 )
				if itemindex2 > 0 then
					TryRecieveItem( sceneId, selfId, 39999940 + itemindex2, 1)
				end
				SetMissionData( sceneId, selfId, 189,itemindex1 )
x391507_axiaoui( sceneId, selfId)
		elseif itemindex > 39999950 and itemindex < 39999958 then
			local itemindex1 = itemindex - 39999950
			local itemindex2 = GetMissionData( sceneId, selfId, 190 )
				if itemindex2 > 0 then
					TryRecieveItem( sceneId, selfId, 39999950 + itemindex2, 1)
				end
				SetMissionData( sceneId, selfId, 190,itemindex1 )
x391507_axiaoui( sceneId, selfId)
		end
		return 1;
	end
	return 0;
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x391507_OnActivateOnce( sceneId, selfId )
--Ë¢ĞÂÊôĞÔº¯Êı

	local pgH , pgL = LuaFnGetCurrentPetGUID(sceneId, selfId)
	local ObjId = 0
if pgH == nil or pgL == nil then
ObjId = 0
else
ObjId = LuaFnGetPetObjIdByGUID( sceneId, selfId, pgH, pgL )
end
if ObjId < 1 then
--ÕâÀïÒªÉèÖÃÒ»ÏÂmissÖµ¼´¿É

return 1;
end
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 9978) == 1 then
	BeginEvent( sceneId )
		AddText( sceneId, "" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
return 1;
end
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9978, 0)

local pmitemlist = {}
	pmitemlist[ 1 ] = {9941,9951,9961,9971}
	pmitemlist[ 2 ] = {9942,9952,9962,9972}
	pmitemlist[ 3 ] = {9943,9953,9963,9973}
	pmitemlist[ 4 ] = {9944,9954,9964,9974}
	pmitemlist[ 5 ] = {9945,9955,9965,9975}
	pmitemlist[ 6 ] = {9946,9956,9966,9976}
	pmitemlist[ 7 ] = {9941,9951,9961,9971}

--ÅĞ¶Ï³öÕ½ÕäÊŞ£¬²»´æÔÚ¾ÍËãÁËÖ±½Ó·µ»Ø1
local buff0 = GetMissionData( sceneId, selfId, 185 )
local bianliang1 = GetMissionData( sceneId, selfId, 186 )
local bianliang2 = GetMissionData( sceneId, selfId, 187 )
local bianliang3 = GetMissionData( sceneId, selfId, 188 )
local bianliang4 = GetMissionData( sceneId, selfId, 189 )
local bianliang5 = GetMissionData( sceneId, selfId, 190 )
local taozhaon = 0
local bianshu = 0
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9950, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9960, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9970, 0)

if bianliang1 > 0 then
--ÕâÀïÊÇÎäÆ÷
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9840 + bianliang1) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9840 + bianliang1, 0)
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9890 + bianliang1) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9890 + bianliang1, 0)
	end
local taozhao = 0
	if bianliang1 == bianliang2 then
		taozhao = taozhao + 1
	end
	if bianliang1 == bianliang3 then
		taozhao = taozhao + 1
	end
	if bianliang1 == bianliang4 then
		taozhao = taozhao + 1
	end
	if bianliang1 == bianliang5 then
		taozhao = taozhao + 1
	end
	if bianliang1 == 7 then
		taozhao = 0
	end
if taozhao == 4 then
	if buff0 ~= pmitemlist[bianliang1][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang1][1] )
	end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][1]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][1], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][2]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][2], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][3]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][3], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][4]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][4], 0)
		end
taozhaon = bianliang1
elseif taozhao == 3 then
	if buff0 ~= pmitemlist[bianliang1][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang1][1] )
	end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][1]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][1], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][2]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][2], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][3]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][3], 0)
		end
taozhaon = bianliang1
elseif taozhao == 2 then
	if buff0 ~= pmitemlist[bianliang1][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang1][1] )
	end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][1]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][1], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][2]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][2], 0)
		end
taozhaon = bianliang1
elseif taozhao == 1 then
	if buff0 ~= pmitemlist[bianliang1][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang1][1] )
	end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang1][1]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang1][1], 0)
		end
taozhaon = bianliang1
end
else
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9840, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9890, 0)
end
if bianliang2 > 0 then
--ÕâÀïÊÇÃ±×Ó
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9850 + bianliang2) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9850 + bianliang2, 0)
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9900 + bianliang2) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9900 + bianliang2, 0)
	end
if taozhaon ~= bianliang2 then
local taozhao = 0
	if bianliang2 == bianliang3 then
		taozhao = taozhao + 1
	end
	if bianliang2 == bianliang4 then
		taozhao = taozhao + 1
	end
	if bianliang2 == bianliang5 then
		taozhao = taozhao + 1
	end
	if bianliang2 == 7 then
		taozhao = 0
	end
if taozhao == 3 then
if taozhaon == 0 then
	if buff0 ~= pmitemlist[bianliang2][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang2][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][1], 0)
	end
	taozhaon = bianliang2
else
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	if bianshu1 ~= pmitemlist[bianliang2][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,bianshu1)
		SetMissionData( sceneId, selfId, 184,pmitemlist[bianliang2][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][1], 0)

	end
	bianshu = bianliang2
end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang2][2]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][2], 0)
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang2][3]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][3], 0)
		end
elseif taozhao == 2 then
if taozhaon == 0 then
	if buff0 ~= pmitemlist[bianliang2][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang2][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][1], 0)
	end
	taozhaon = bianliang2
else
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	if bianshu1 ~= pmitemlist[bianliang2][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,bianshu1)
		SetMissionData( sceneId, selfId, 184,pmitemlist[bianliang2][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][1], 0)

	end
	bianshu = bianliang2
end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang2][2]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][2], 0)
		end
elseif taozhao == 1 then
if taozhaon == 0 then
	if buff0 ~= pmitemlist[bianliang2][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang2][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][1], 0)
	end
	taozhaon = bianliang2
else
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	if bianshu1 ~= pmitemlist[bianliang2][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,bianshu1)
		SetMissionData( sceneId, selfId, 184,pmitemlist[bianliang2][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang2][1], 0)

	end
	bianshu = bianliang2
end
end
end
else
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9850, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9900, 0)
end
if bianliang3 > 0 then
--ÕâÀïÊÇÒÂ·ş
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9860 + bianliang3) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9860 + bianliang3, 0)
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9910 + bianliang3) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9910 + bianliang3, 0)
	end
if taozhaon ~= bianliang3 and bianshu == 0 then
local taozhao = 0
	if bianliang3 == bianliang4 then
		taozhao = taozhao + 1
	end
	if bianliang3 == bianliang5 then
		taozhao = taozhao + 1
	end
	if bianliang3 == 7 then
		taozhao = 0
	end
if taozhao == 2 then
if taozhaon == 0 then
	if buff0 ~= pmitemlist[bianliang3][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang3][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang3][1], 0)
	end
	taozhaon = bianliang3
else
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	if bianshu1 ~= pmitemlist[bianliang3][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,bianshu1)
		SetMissionData( sceneId, selfId, 184,pmitemlist[bianliang3][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang3][1], 0)

	end
	bianshu = bianliang3
end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, pmitemlist[bianliang3][2]) ~= 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang3][2], 0)
		end
elseif taozhao == 1 then
if taozhaon == 0 then
	if buff0 ~= pmitemlist[bianliang3][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang3][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang3][1], 0)
	end
	taozhaon = bianliang3
else
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	if bianshu1 ~= pmitemlist[bianliang3][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,bianshu1)
		SetMissionData( sceneId, selfId, 184,pmitemlist[bianliang3][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang3][1], 0)

	end
	bianshu = bianliang3
end
end
end
else
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9860, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9910, 0)
end
if bianliang4 > 0 then
--ÕâÀïÊÇÏîÈ¦
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9870 + bianliang4) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9870 + bianliang4, 0)
	end

if taozhaon ~= bianliang4 and bianshu == 0 then
local taozhao = 0
	if bianliang4 == bianliang5 then
		taozhao = taozhao + 1
	end
	if bianliang4 == 7 then
		taozhao = 0
	end
if taozhao == 1 then
if taozhaon == 0 then
	if buff0 ~= pmitemlist[bianliang4][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,buff0)
		SetMissionData( sceneId, selfId, 185,pmitemlist[bianliang4][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang4][1], 0)
	end
	taozhaon = bianliang4
else
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	if bianshu1 ~= pmitemlist[bianliang4][1] then
		LuaFnCancelSpecificImpact(sceneId,selfId,bianshu1)
		SetMissionData( sceneId, selfId, 184,pmitemlist[bianliang4][1] )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, pmitemlist[bianliang4][1], 0)

	end
	bianshu = bianliang4
end
end
end
else
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9870, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9920, 0)
end
if bianliang5 > 0 then
--ÕâÀïÊÇ»¤·û
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9880 + bianliang5) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9880 + bianliang5, 0)
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, ObjId, 9930 + bianliang5) ~= 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9930 + bianliang5, 0)
	end
else
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9880, 0)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 9930, 0)
end
if bianshu == 0 then
local bianshu1 = GetMissionData( sceneId, selfId, 184 )
	LuaFnCancelSpecificImpact(sceneId,ObjId,bianshu1)
end
if taozhaon == 0 then
local bianshu1 = GetMissionData( sceneId, selfId, 185 )
	LuaFnCancelSpecificImpact(sceneId,ObjId,bianshu1)
end

	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x391507_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end
function x391507_axiaoshb( sceneId, selfId)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9977, 3000)
end
function x391507_axiaosha( sceneId, selfId, selfId1)

	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		BeginEvent( sceneId ) 
			AddText( sceneId, "ĞÕo cø lan lßu 1 cá không v¸!" )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
		return
	end
if selfId1 == 2 then
	local itemindex = GetMissionData( sceneId, selfId, 186 )
		if itemindex > 0 then
			TryRecieveItem( sceneId, selfId, 39999910 + itemindex, 1)
			SetMissionData( sceneId, selfId, 186,0 )
			x391507_axiaoui( sceneId, selfId)
		end
elseif selfId1 == 1 then
	local itemindex = GetMissionData( sceneId, selfId, 187 )
		if itemindex > 0 then
			TryRecieveItem( sceneId, selfId, 39999920 + itemindex, 1)
			SetMissionData( sceneId, selfId, 187,0 )
			x391507_axiaoui( sceneId, selfId)
		end
elseif selfId1 == 3 then
	local itemindex = GetMissionData( sceneId, selfId, 188 )
		if itemindex > 0 then
			TryRecieveItem( sceneId, selfId, 39999930 + itemindex, 1)
			SetMissionData( sceneId, selfId, 188,0 )
			x391507_axiaoui( sceneId, selfId)
		end
elseif selfId1 == 4 then
	local itemindex = GetMissionData( sceneId, selfId, 189 )
		if itemindex > 0 then
			TryRecieveItem( sceneId, selfId, 39999940 + itemindex, 1)
			SetMissionData( sceneId, selfId, 189,0 )
			x391507_axiaoui( sceneId, selfId)
		end
elseif selfId1 == 5 then
	local itemindex = GetMissionData( sceneId, selfId, 190 )
		if itemindex > 0 then
			TryRecieveItem( sceneId, selfId, 39999950 + itemindex, 1)
			SetMissionData( sceneId, selfId, 190,0 )
			x391507_axiaoui( sceneId, selfId)
		end
end
end
function x391507_OnImpactFadeOut( sceneId, selfId, impactId )
--¹ı³¡¾°µÄ´¦Àí
x391507_OnActivateOnce( sceneId, selfId )
local pgH , pgL = LuaFnGetCurrentPetGUID(sceneId, selfId)
local ObjId = 0
if pgH == nil or pgL == nil then
ObjId = 0
else
ObjId = LuaFnGetPetObjIdByGUID( sceneId, selfId, pgH, pgL )
end
if ObjId > 1 then
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 6507, 500 )
end

end

function x391507_axiaoui( sceneId, selfId, selfId1)
local bianliang1 = GetMissionData( sceneId, selfId, 190 ) * 1
local bianliang2 = GetMissionData( sceneId, selfId, 189 ) * 10
local bianliang3 = GetMissionData( sceneId, selfId, 188 ) * 100
local bianliang4 = GetMissionData( sceneId, selfId, 187 ) * 1000
local bianliang5 = GetMissionData( sceneId, selfId, 186 ) * 10000
local bianliang = bianliang1 + bianliang2 + bianliang3 + bianliang4 + bianliang5
	SetMissionData(sceneId, selfId, 191, bianliang);
x391507_OnActivateOnce( sceneId, selfId )
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 2170407)
end