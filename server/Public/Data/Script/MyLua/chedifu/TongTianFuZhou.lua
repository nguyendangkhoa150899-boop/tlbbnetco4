
-- ³¹µØ·û¹‚


x330060_g_scriptId = 330060
x330060_g_ItemId = 30008121
--ÒøÆ±
x330060_g_ItemId01 = 30000002
x330060_g_Yinpiao = 40002000
-- ÏŞÖÆÊ¹ÓÃ´«ËÍ¹¦ÄÜµÄ³¡¾°
x330060_g_NoChuangsongScn=
{
	151,	-- ¼àÓü
	125,	-- ¼àÓü
	540,	-- ¼àÓü
	184,	-- ¼àÓü
	410,	-- ¼àÓü
	544,	-- ¼àÓü
	545,	-- ¼àÓü
	546,	-- ¼àÓü
	547,	-- ¼àÓü
	548,	-- ¼àÓü
	181,	-- ¼àÓü
	433,	-- ¼àÓü
	593,	-- ¼àÓü
	564,	-- ¼àÓü
	581,	-- ¼àÓü
	582,	-- ¼àÓü
	583,	-- ¼àÓü
	584,	-- ¼àÓü
	585,	-- ¼àÓü
	571,	-- ¼àÓü
	128,	-- ¼àÓü
	43,	-- ¼àÓü
	580,
	561,
	562,
	708,
	710,
	599		-- ¼àÓü
}

-- ÏŞÖÆÊ¹ÓÃ³¹µØ·û¹‚¶¨Î»µÄ³¡¾°
x330060_g_UselessScn=
{
	125,	-- »ªÉ½
	540,	-- »ªÉ½
	184,	  -- ¾º¼¼³¡
	410,	  -- ¾º¼¼³¡
	544,	  -- ¾º¼¼³¡
	545,	  -- ¾º¼¼³¡
	546,	  -- ¾º¼¼³¡	
	547,  -- ¾º¼¼³¡
	548,  -- ¾º¼¼³¡
	414,  -- ¾º¼¼³¡
	181,  -- ¾º¼¼³¡
	433,  -- ¾º¼¼³¡
	593,  -- ¾º¼¼³¡
	564,  -- ¾º¼¼³¡
	581,  -- Í¨ÌìËş1
	582,  -- Í¨ÌìËş2
	583,  -- Í¨ÌìËş3
	584,  -- Í¨ÌìËş4
	585,  -- Í¨ÌìËş5
	517,  -- ¾º¼¼³¡
	128,  -- ¾º¼¼³¡
	43,  -- ¾º¼¼³¡
	580,
	561,
	562,
	599,		-- ¼àÓü
        317, -- Õù°ÔÈü
        180, --·ï»ËÕ½³¡
        191, --·ï»Ë¹Å³Ç
		708,
		710,
}


--½ûÖ¹´«ËÍµ½Ä³Ğ©³¡¾°µÄµÈ¼¶ÏŞÖÆ....
x330060_g_LimitTransScene =
{
	{423,90},	--»ğÑæÉ½
	{581,90},	--»ğÑæÉ½
	{582,90},	--»ğÑæÉ½
	{583,90},	--»ğÑæÉ½
	{584,90},	--»ğÑæÉ½
	{585,90},	--»ğÑæÉ½
	{519,90},	--»ğÑæ¹È
	{424,90},	--¸ß²ı
	{520,90},	--¸ß²ıÃÔ¹¬
	{425,90},	--ËşÀïÄ¾
	{427,90},	--Ëş¿ËÀ­Âê¸É
	{186,75},	--Â¥À¼
	{517,150},	--Â¥À¼
	{128,150},	--Â¥À¼
	{43,150},	--Â¥À¼
	{431,90},       --´óÍğ
	{432,90}        --º¹ÑªÁë
}

x330060_g_Impact_NotTransportList = { 5929 } -- ½ûÖ¹´«ËÍµÄImpact
x330060_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- ½ûÖ¹´«ËÍµÄImpactÌáÊ¾ĞÅÏ¢
x330060_g_myomissid = {MD_ZDFS_SMISS1,MD_ZDFS_SMISS2,MD_ZDFS_SMISS3,MD_ZDFS_SMISS4,MD_ZDFS_SMISS5,MD_ZDFS_SMISS6,MD_ZDFS_SMISS7,MD_ZDFS_SMISS8,MD_ZDFS_SMISS9,MD_ZDFS_SMISS10}
--È±Ê¡³¡¾°,½öÏÔÊ¾ĞèÒª
x330060_g_DefaultScn=
{
	{"#{DJTS_110509_34}",401,223,225},	--ÇØ»ÊµØ¹¬¶ş²ã
	{"#{DJTS_110509_35}",538,31,33},	--ÇØ»ÊµØ¹¬ËÄ²ã
	{"#{DJTS_110509_36}",161,13,25},	--ÑàÍõ¹ÅÄ¹Èı²ã
	{"#{DJTS_110509_37}",165,25,108},	--ÑàÍõ¹ÅÄ¹Æß²ã
}
--**********************************
-- ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x330060_OnDefaultEvent( sceneId, selfId, nItemIndex )
	
end

function x330060_IsSkillLikeScript( sceneId, selfId )
	return 1	 --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

function x330060_CancelImpacts( sceneId, selfId )
	return 0	 --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

function x330060_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
-- 
--**********************************
function x330060_OnConditionCheck( sceneId, selfId , idid)

	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	-- ÅĞ¶ÏÕâ¸öÎïÆ·ÊÇ²»ÊÇÒÑ¾­¶¨Î»
	if GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x330060_g_ItemId then
		return 0
	end
	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		return 0
	end

	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x330060_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330060_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end

	--¼ì²âÄ¿±ê³¡¾°ÊÇ·ñÏŞÖÆµÈ¼¶....
	for _, tmp in x330060_g_LimitTransScene do
		if ( (tmp[1] == nTarSceneId) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
			local szMsg = format("Trß¶ng cänh này c¥n c¤p %d tr· lên m¾i có th¬ ği vào", tmp[2])
			x330060_MsgBox( sceneId, selfId, szMsg)
			return 0
		end
	end
        local myusepos = GetMissionData(sceneId,selfId,MD_ZDFS_Y)
	if myusepos < 1 or myusepos > 10 then
	--x330060_MsgBox( sceneId, selfId, "ÄúµÄ²ßµØ·û×­ÒÑ¾­Ëğ»µ£¬ÎŞ·¨Ê¹ÓÃÁË" )
	return 0
	end
	-- 1£¬¼ì²âÕâ¸öÎïÆ·ÊÇ²»ÊÇÓĞ¼ÇÂ¼µÄÊı¾İÁË£¬
	-- ĞèÒª¼ÇÂ¼µÄÊı¾İÊÇ£¬Ê¹ÓÃ´ÎÊı£¬¶¨Î»³¡¾°Id£¬ÒÔ¼°×ø±ê
	local nCount = GetMissionData( sceneId, selfId, MD_ZDFS_FUZUO )
	local mydata = GetMissionData( sceneId, selfId, x330060_g_myomissid[myusepos])
	-- Ö´ĞĞ´«ËÍ
	local nTarSceneId = mod(mydata,1000)
	local nPointX = floor((mod(mydata,(10^6)))/10^3)
	local nPointZ = floor(mydata/(10^6))
	if nPointX==0 and nPointZ==0 and myusepos >= 1 and myusepos <= 4 then
	nTarSceneId = x330060_g_DefaultScn[myusepos][2]
	nPointX	= x330060_g_DefaultScn[myusepos][3]
	nPointZ	= x330060_g_DefaultScn[myusepos][4]
	end
	if  nPointX==0 and nPointZ==0  then
		x330060_MsgBox( sceneId, selfId, "Tri®t ğ¸a phù løc cüa cac1c hÕ chßa ğ¸nh v¸ ği¬m, không th¬ ch¤p hành truy«n t¯ng" )
		return 0
	end
	if nCount >= 20 then
	x330060_MsgBox( sceneId, selfId, "#{DJTS_110509_51}" )
	return 0
	end
	return 1
end

--**********************************
-- 
--**********************************
function x330060_CallMe( sceneId, selfId, nItemIndex, PlayerGuid)	
	
	-- ¼ì²âÕâ¸öÍæ¼ÒÊÇ²»ÊÇÄÜ¹»Ê¹ÓÃ³¹µØ·û¹‚¶¨Î»
	--ÅĞ¶Ïµ±Ç°×´Ì¬ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x330060_MsgBox( sceneId, selfId, "Các hÕ có trÕng thái không cho phép truy«n t¯ng, không th¬ sØ døng tri®t ğ¸a phú løc truy«n t¯ng" )
		return 0
	end

	--¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x330060_g_Yinpiao) >= 1  then
		x330060_MsgBox(sceneId, selfId, "Các hÕ có trÕng thái không cho phép truy«n t¯ng, không th¬ sØ døng tri®t ğ¸a phú løc truy«n t¯ng")
		return 0
	end
	
	--¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚ²»ÔÊĞí´«ËÍµÄ³¡¾°£¬±ÈÈç¼àÓü
	for _, tmp in x330060_g_NoChuangsongScn do
		if tmp == sceneId then
			x330060_MsgBox( sceneId, selfId, "Trß¶ng cänh bên trong th¬ sØ døng tri®t ğ¸a phù løc ğ¬ truy«n t¯ng" )
			return 0
		end
	end
	
	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚ°ÚÌ¯×´Ì¬£¬
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x330060_MsgBox( sceneId, selfId, "TrÕng thái bán hàng, không th¬ sØ døng tri®t ğ¸a phù løc truy«n t¯ng" )
		return 0
	end
	
	-- ´¦ÓÚ×é¶Ó¸úËæ×´Ì¬ÏÂ£¬²»ÄÜ´«ËÍ
	if IsTeamFollow(sceneId, selfId) == 1  then
		x330060_MsgBox( sceneId, selfId, "Ngß½i ğang · trÕng thái t± ğµit ği sau, không th¬ sØ døng truy«n t¯ng" )
		return 0
	end
	
	-- [ QUFEI 2007-08-23 20:50 UPDATE BugID 23699 ]
	-- ´¦ÓÚÊ¹ÓÃ½»Í¨¹¤¾ß×´Ì¬ÏÂ£¬²»ÄÜ´«ËÍ
	local	inbus = LuaFnGetBusPassengerIDIsInBus(sceneId, selfId)
	-- PrintNum(inbus)
	if inbus == 1 then
		x330060_MsgBox( sceneId, selfId, "Äú´¦ÓÚÎŞ·¨Ê¹ÓÃ´«ËÍµÄÇé¿öÏÂ£¬ÎŞ·¨Ê¹ÓÃ´«ËÍµÀ¾ß£¡" )
		return 0
	end
	
	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x330060_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330060_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	-- ¿´PlayerGuid ÊÇ²»ÊÇ¶ÓÎéÖĞµÄÈË£¬È»ºóÔÙ¿´Ê±¼äÊÇ²»ÊÇ¹ıÆÚ£¬±ğµÄÒ²Ã»ÓĞÊ²Ã´ÄÜ¼ì²éµÄÁË
	local Time = GetMissionData(sceneId,selfId,MD_ZDFS_TIME)
	local nTarSceneId = GetMissionData(sceneId,selfId,MD_ZDFS_SCENE)
	local posdata = GetMissionData(sceneId,selfId,MD_ZDFS_X)
	local x = mod(posdata,10^3)
	local z = floor(mod(posdata,10^6)/(10^3))
	
	--¼ì²âÄ¿±ê³¡¾°ÊÇ·ñÏŞÖÆµÈ¼¶....
	for _, tmp in x330060_g_LimitTransScene do
		if ( (tmp[1] == nTarSceneId) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
			local szMsg = format("´Ë³¡¾°ĞèÒª%d¼¶ÒÔÉÏ·½¿ÉÈëÄÚ", tmp[2])
			x330060_MsgBox( sceneId, selfId, szMsg)
			return 0
		end
	end
	
	if LuaFnGetCurrentTime() - Time < 30  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nTarSceneId, x, z)
	end

	SetMissionData(sceneId,selfId,MD_ZDFS_TIME,0)
	SetMissionData(sceneId,selfId,MD_ZDFS_SCENE,0)
	SetMissionData(sceneId,selfId,MD_ZDFS_X,0)
	
end

--**********************************
-- 
--**********************************
function x330060_OnActivateOnce( sceneId, selfId )
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	if bagId<0  then
		return 0
	end

	x330060_PlayerGoto( sceneId, selfId, bagId )

	
end

--**********************************
-- 
--**********************************
function x330060_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
-- 
--**********************************
function x330060_Ce_DifuCs( sceneId, selfId,bagpos,key)
    local strinseg = ""
	local index = 0
	local sceneName = ""
    for i = 1,getn(x330060_g_myomissid) do
	index =	GetMissionData( sceneId, selfId, x330060_g_myomissid[i] )
	strinseg = strinseg..format("%06d",floor(mod(index,10^9)/(10^3)))
	if index > 0 then
	sceneName = sceneName..GetSceneName(mod(index,(10^3))).."|"
	else
	sceneName = sceneName.."|"
	end
	end
	if strinseg == nil or strinseg == "" then
	strinseg = strrep("0",60)
	end
	if sceneName == nil or sceneName == "" then
	sceneName = strrep("|",10)
	end
	index =	GetMissionData( sceneId, selfId, MD_ZDFS_FUZUO )
	BeginUICommand(sceneId)
	    if key ~= nil and key == 1 then
		UICommand_AddInt(sceneId,0)
		UICommand_AddInt(sceneId,bagpos)
		else
		UICommand_AddInt(sceneId,1)
		UICommand_AddInt(sceneId,bagpos-1)
		end
		UICommand_AddInt(sceneId,index)
		UICommand_AddString(sceneId,strinseg)
		UICommand_AddString(sceneId,sceneName)
		EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1122361)
end

--**********************************
-- 
--**********************************
function x330060_SetPosition( sceneId, selfId,bagpos,bagitempos)
if bagpos == nil or bagpos < 0 or bagpos > 29 then
return
end
if bagitempos == nil or bagitempos < 0 or bagitempos > 9 then
return
end

	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x330060_MsgBox( sceneId, selfId, "¸±±¾»ò°ï»á³ÇÊĞÄÚ²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚¶¨Î»£¡" )
		return 0
	end
	for _, tmp in x330060_g_UselessScn do
		if tmp == sceneId then
			x330060_MsgBox( sceneId, selfId, "´Ë³¡¾°ÄÚÎŞ·¨Ê¹ÓÃ³¹µØ·û¹‚¶¨Î»£¡" )
			return 0
		end
	end

	-- 0£¬ÎïÆ·°²È«ĞÔ¼ì²é
	-- ÏÈ¼ì²âÕâ¸ö bagpos µÄÎïÆ·ÊÇ²»ÊÇºÍµ±Ç°µÄ¶ÔÓ¦£¬
	if   GetItemTableIndexByIndex(sceneId, selfId, bagpos) ~= x330060_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  ±³°üÄÚ²¿´íÎó")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
		x330060_MsgBox( sceneId, selfId, "´ËÎïÆ·ÒÑ±»Ëø¶¨£¡" )
		return 0
	end
        local x,z = GetWorldPos(sceneId, selfId)
        x,z = floor(x),floor(z)
        SetMissionData( sceneId, selfId, x330060_g_myomissid[bagitempos+1],sceneId+x*10^3+z*10^6)
	BeginEvent(sceneId)
		AddText(sceneId,"ÄãµÄ³¹µØ·û¹‚¶¨Î»³É¹¦¡£")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end
--**********************************
-- 
--**********************************
function x330060_SetUISelIdx( sceneId, selfId,bagpos,bagitempos)
if bagpos == nil or bagpos < 0 or bagpos > 29 then
return
end
if bagitempos == nil or bagitempos < 0 or bagitempos > 9 then
return
end

-- 0£¬ÎïÆ·°²È«ĞÔ¼ì²é
	-- ÏÈ¼ì²âÕâ¸ö nItemIndex µÄÎïÆ·ÊÇ²»ÊÇºÍµ±Ç°µÄ¶ÔÓ¦£¬
	if  GetItemTableIndexByIndex(sceneId, selfId, bagpos) ~= x330060_g_ItemId  then

		return
	end

	-- ´¦ÓÚ×é¶Ó¸úËæ×´Ì¬ÏÂ£¬²»ÄÜ´«ËÍ
	if IsTeamFollow(sceneId, selfId) == 1  then
		return 0
	end
	
	--ÅĞ¶Ïµ±Ç°×´Ì¬ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		return 0
	end

	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
		return 0
	end

	--¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x330060_g_Yinpiao) >= 1  then
		return 0
	end
	
	--¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚ²»ÔÊĞí´«ËÍµÄ³¡¾°£¬±ÈÈç¼àÓü
	for _, tmp in x330060_g_NoChuangsongScn do
		if tmp == sceneId then
			return 0
		end
	end
	
	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚ°ÚÌ¯×´Ì¬£¬
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		return 0
	end
	
	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x330060_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330060_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
SetMissionData(sceneId,selfId,MD_ZDFS_Y,bagitempos+1)	

end
--**********************************
-- Íæ¼Ò×Ô¼ºµÄ´«ËÍ
--**********************************
function x330060_PlayerGoto( sceneId, selfId, nItemIndex )
-- 0£¬ÎïÆ·°²È«ĞÔ¼ì²é
	-- ÏÈ¼ì²âÕâ¸ö nItemIndex µÄÎïÆ·ÊÇ²»ÊÇºÍµ±Ç°µÄ¶ÔÓ¦£¬
	local myusepos = GetMissionData(sceneId,selfId,MD_ZDFS_Y)
	if myusepos < 1 or myusepos > 10 then
	x330060_MsgBox( sceneId, selfId, "²»ÄÜ´«ËÍµ½Ä¿±ê³¡¾°¡£" )
	return 0
	end
	if  GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330060_g_ItemId  then

		BeginEvent(sceneId)
			AddText(sceneId,"  ±³°üÄÚ²¿´íÎó")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end

	-- ´¦ÓÚ×é¶Ó¸úËæ×´Ì¬ÏÂ£¬²»ÄÜ´«ËÍ
	if IsTeamFollow(sceneId, selfId) == 1  then
		x330060_MsgBox( sceneId, selfId, "Äã´¦ÓÚ×é¶Ó¸úËæ×´Ì¬£¬²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚´«ËÍ£¡" )
		return 0
	end
	
	--ÅĞ¶Ïµ±Ç°×´Ì¬ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x330060_MsgBox( sceneId, selfId, "Äú´¦ÓÚ²»ÔÊĞí´«ËÍµÄ×´Ì¬£¬²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚´«ËÍ£¡" )
		return 0
	end

	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x330060_MsgBox( sceneId, selfId, "´ËÎïÆ·ÒÑ±»Ëø¶¨£¡" )
		return 0
	end

	--¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x330060_g_Yinpiao) >= 1  then
		x330060_MsgBox(sceneId, selfId, "Äú´¦ÓÚ²»ÔÊĞí´«ËÍµÄ×´Ì¬£¬²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚´«ËÍ£¡")
		return 0
	end
	
	--¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚ²»ÔÊĞí´«ËÍµÄ³¡¾°£¬±ÈÈç¼àÓü
	for _, tmp in x330060_g_NoChuangsongScn do
		if tmp == sceneId then
			x330060_MsgBox( sceneId, selfId, "´Ë³¡¾°ÄÚ²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚´«ËÍ£¡" )
			return 0
		end
	end
	
	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚ°ÚÌ¯×´Ì¬£¬
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x330060_MsgBox( sceneId, selfId, "°ÚÌ¯×´Ì¬ÏÂ£¬²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚´«ËÍ£¡" )
		return 0
	end
	
	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x330060_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330060_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	-- 1£¬¼ì²âÕâ¸öÎïÆ·ÊÇ²»ÊÇÓĞ¼ÇÂ¼µÄÊı¾İÁË£¬
	-- ĞèÒª¼ÇÂ¼µÄÊı¾İÊÇ£¬Ê¹ÓÃ´ÎÊı£¬¶¨Î»³¡¾°Id£¬ÒÔ¼°×ø±ê
	local nCount = GetMissionData( sceneId, selfId, MD_ZDFS_FUZUO )
	local mydata = GetMissionData( sceneId, selfId, x330060_g_myomissid[myusepos])
	-- Ö´ĞĞ´«ËÍ
	local nTarSceneId = mod(mydata,1000)
	local nPointX = floor((mod(mydata,(10^6)))/10^3)
	local nPointZ = floor(mydata/(10^6))
	if nPointX==0 and nPointZ==0 and myusepos >= 1 and myusepos <= 4 then
	nTarSceneId = x330060_g_DefaultScn[myusepos][2]
	nPointX	= x330060_g_DefaultScn[myusepos][3]
	nPointZ	= x330060_g_DefaultScn[myusepos][4]
	end
	if  nPointX==0 and nPointZ==0  then
		x330060_MsgBox( sceneId, selfId, "³¹µØ·û¹‚Õâ¸ö¶¨Î»µãÉĞÎ´¶¨Î»£¬²»ÄÜÖ´ĞĞ´«ËÍ¡£" )
		return
	end
	if nCount >= 20 then
	x330060_MsgBox( sceneId, selfId, "#{DJTS_110509_51}" )
	return 
	end
	-- ¼ì²éÄ¿±ê³¡¾°ÊÇ²»ÊÇÄÜ¹»µ½´ï
	if sceneId ~= nTarSceneId then
		if IsCanNewWorld( sceneId, selfId, nTarSceneId, nPointX, nPointZ ) ~= 1 then
			x330060_MsgBox( sceneId, selfId, "²»ÄÜ´«ËÍµ½Ä¿±ê³¡¾°¡£" )
			return 0
		end
	end
	SetMissionData( sceneId, selfId, MD_ZDFS_FUZUO,nCount+1 )
	SetMissionData(sceneId,selfId,MD_ZDFS_Y,0)
		-- »ñµÃÍæ¼Ò¶ÓÎéÖĞÔÚ¸½½üµÄ¶ÓÔ±
		local nTeamCount = GetNearTeamCount(sceneId,selfId)
		local selfGuid = LuaFnGetGUID(sceneId,selfId)
		
		local nTarSceneName = GetSceneName(nTarSceneId)
		if nTeamCount > 0  then
			for i=0, nTeamCount-1  do
				local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
				if nPlayerId ~= selfId and LuaFnIsCharacterLiving(sceneId, nPlayerId) == 1 then
					-- ¸øÕâ¸öÍæ¼Ò·¢ËÍÒ»¸ö´«ËÍÑûÇë
					local str = "ÄãµÄ¶ÓÓÑ" .. GetName(sceneId, selfId) .. "Ê¹ÓÃÁË³¹µØ·û¹‚£¬»Øµ½ÁË¡¾" .. nTarSceneName .. "¡¿£¬ÄãÊÇ·ñÒ²Òª¸ú×ÅÒ»Æğ´«ËÍ£¿×¢Òâ£º³¬¹ı20ÃëÈÔÎ´×ö¾ö¶¨½«È¡Ïû´«ËÍ¡£"
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,x330060_g_scriptId);
						UICommand_AddInt(sceneId,nItemIndex)
						UICommand_AddInt(sceneId,selfGuid)
						UICommand_AddString(sceneId,"CallMe");
						UICommand_AddString(sceneId,str);
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,nPlayerId, 1009)
					
					-- Í¬Ê±°ÑÕâĞ©ÖØÒªÊı¾İ¼ÇÂ¼µ½MissionDataÖĞ
	SetMissionData(sceneId,nPlayerId,MD_ZDFS_TIME,	LuaFnGetCurrentTime())
	SetMissionData(sceneId,nPlayerId,MD_ZDFS_SCENE,nTarSceneId)
	SetMissionData(sceneId,nPlayerId,MD_ZDFS_X,	nPointX+nPointZ*10^3)
                         				end
			end
                     end

		-- ´«ËÍ×Ô¼º
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nTarSceneId, nPointX, nPointZ)

end

--**********************************
-- 
--**********************************
function x330060_AddFuZhou( sceneId, selfId,bagpos)
if bagpos == nil or bagpos < 0 or bagpos > 29 then
return
end
	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x330060_MsgBox( sceneId, selfId, "¸±±¾»ò°ï»á³ÇÊĞÄÚ²»ÄÜÊ¹ÓÃ³¹µØ·û¹‚¶¨Î»£¡" )
		return 0
	end
	for _, tmp in x330060_g_UselessScn do
		if tmp == sceneId then
			x330060_MsgBox( sceneId, selfId, "´Ë³¡¾°ÄÚÎŞ·¨Ê¹ÓÃ³¹µØ·û¹‚¶¨Î»£¡" )
			return 0
		end
	end

	-- 0£¬ÎïÆ·°²È«ĞÔ¼ì²é
	-- ÏÈ¼ì²âÕâ¸ö bagpos µÄÎïÆ·ÊÇ²»ÊÇºÍµ±Ç°µÄ¶ÔÓ¦£¬
	if   GetItemTableIndexByIndex(sceneId, selfId, bagpos) ~= x330060_g_ItemId  then

		BeginEvent(sceneId)
			AddText(sceneId,"  ±³°üÄÚ²¿´íÎó")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
		x330060_MsgBox( sceneId, selfId, "´ËÎïÆ·ÒÑ±»Ëø¶¨£¡" )
		return 0
	end
	
local fuzuoid = LuaFnGetAvailableItemCount(sceneId, selfId, 30008122)	
if fuzuoid < 1 then
x330060_MsgBox( sceneId, selfId, "#{DJTS_110509_28}" )
return
end
local nCount	= GetMissionData( sceneId, selfId, MD_ZDFS_FUZUO )
if nCount == 0 then
		x330060_MsgBox( sceneId, selfId, "#{DJTS_110509_29}" )
		return 0
end
if LuaFnDelAvailableItem(sceneId,selfId,30008122,1) ~= 1 then
x330060_MsgBox( sceneId, selfId, "#{DJTS_110509_28}" )
return 
end
nCount = nCount - 10
if nCount < 0 then
nCount = 0
end
SetMissionData( sceneId, selfId, MD_ZDFS_FUZUO,nCount )
x330060_Ce_DifuCs( sceneId, selfId,bagpos,1)
x330060_MsgBox( sceneId, selfId, "#{DJTS_110509_30}" )
end




