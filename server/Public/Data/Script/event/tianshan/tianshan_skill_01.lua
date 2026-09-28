-- ◊‘¡¢√≈ªß

-- ’“µΩÕı…ÿ

--MisDescBegin

-- Ω≈±æ∫≈
x228902_g_ScriptId = 228902

-- ƒø±Í NPC
x228902_g_Position_X = 217
x228902_g_Position_Z = 255
x228902_g_SceneID = 2
x228902_g_AccomplishNPC_Name = "VﬂΩng Thi´u"

-- »ŒŒÒ∫≈
x228902_g_MissionId = 944

-- «∞–¯»ŒŒÒ
-- g_PreMissionId = -1

-- Ω” ‹»ŒŒÒ NPC  Ù–‘
x228902_g_Name = "Lan Ki™m"

--»ŒŒÒπÈ¿‡
x228902_g_MissionKind = 28

--»ŒŒÒµ»º∂
x228902_g_MissionLevel = 30

-- «∑Ò «æ´”¢»ŒŒÒ
x228902_g_IfMissionElite = 0

--»ŒŒÒ√˚
x228902_g_MissionName = "TÒ lßp mÙn hµ"
x228902_g_MissionInfo = "#{TIANSHAN_SKILL_01}"
x228902_g_MissionTarget = "    T’i #Gth‡nh –’i L˝ Tu VÂn –‡i#W tÏm #RVﬂΩng Thi´u #W#{_INFOAIM217,255,2,VﬂΩng Thi´u}."
x228902_g_MissionContinue = "    "
x228902_g_MissionComplete = "#{TIANSHAN_SKILL_02}"

x228902_g_MoneyBonus = 1000
x228902_g_exp = 2000

x228902_g_IsMissionOkFail = 0					--  «∑ÒÕÍ≥…»ŒŒÒµƒ±Íº«Œª
x228902_g_IsFindTarget = 1						--  «∑Ò’“µΩÕı…ÿ±Íº«Œª
x228902_g_Custom = { { id = "–„ tÏm ﬂ˛c VﬂΩng Thi´u", num = 1 } }

--MisDescEnd

x228902_g_XinfaDemand = {
	{ id = 43, lvl = 10 },				-- ¡È’π¶ -- zchw
	{ id = 44, lvl = 10 },				-- –°Œﬁœ‡π¶
	{ id = 45, lvl = 10 },				-- πÍœ¢π¶
	{ id = 46, lvl = 10 },				-- ÃÏ…Ω»⁄—©π¶
	{ id = 47, lvl = 10 },				-- ÃÏ…Ω’€√∑ ÷
	{ id = 48, lvl = 10 },				-- ÃÏ…Ω¡˘—Ù’∆–ƒ∑®
}

--**********************************
--»ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x228902_OnDefaultEvent( sceneId, selfId, targetId )
	--»Áπ˚ÕÊº“ÕÍ≥…π˝’‚∏ˆ»ŒŒÒ
	if IsMissionHaveDone( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return
	elseif IsHaveMission( sceneId, selfId, x228902_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228902_g_AccomplishNPC_Name then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x228902_g_MissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsFindTarget, 1 )
			x228902_OnContinue( sceneId, selfId, targetId )
		end
	--¬˙◊„»ŒŒÒΩ” ’Ãıº˛
	elseif x228902_CheckAccept( sceneId, selfId ) > 0 then
		--∑¢ÀÕ»ŒŒÒΩ” ‹ ±œ‘ æµƒ–≈œ¢
		BeginEvent( sceneId )
			AddText( sceneId, x228902_g_MissionName )
			AddText( sceneId, x228902_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228902_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228902_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228902_g_ScriptId, x228902_g_MissionId )
	end
end

--**********************************
--¡–æŸ ¬º˛
--**********************************
function x228902_OnEnumerate( sceneId, selfId, targetId )
	--»Áπ˚ÕÊº“ÕÍ≥…π˝’‚∏ˆ»ŒŒÒ
	if IsMissionHaveDone( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return
	--»Áπ˚“—Ω”¥À»ŒŒÒ
	elseif IsHaveMission( sceneId, selfId, x228902_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228902_g_AccomplishNPC_Name then
			AddNumText( sceneId, x228902_g_ScriptId, x228902_g_MissionName, 2, -1 )
		end
	--¬˙◊„»ŒŒÒΩ” ’Ãıº˛
	elseif GetName( sceneId, targetId ) == x228902_g_Name and GetLevel( sceneId, selfId ) >= x228902_g_MissionLevel then
		AddNumText( sceneId, x228902_g_ScriptId, x228902_g_MissionName, 1, -1 )
	end
end

--**********************************
--ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x228902_CheckAccept( sceneId, selfId )
	-- 1£¨ºÏ≤‚ÕÊº“ «≤ª «“—æ≠◊ˆπ˝
	if IsMissionHaveDone( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return 0
	end

	-- µ»º∂ºÏ≤‚
	if GetLevel( sceneId, selfId ) < x228902_g_MissionLevel then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--Ω” ‹
--**********************************
function x228902_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228902_g_Name then
		return 0
	end

	if x228902_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	for i, xinfa in x228902_g_XinfaDemand do										-- ºÏ≤È–ƒ∑®º∂± «∑Ò◊„πª
		if HaveXinFa( sceneId, selfId, xinfa.id ) < xinfa.lvl then
			x228902_NotifyFailBox( sceneId, selfId, targetId, "    c¸a c·c h’ #{_XINFA" .. xinfa.id
				.. "} t‚m ph·p tu luyÆn Ìt nh§t ph‰i ™n " .. xinfa.lvl .. " c§p." )
			return
		end
	end

	--º”»Î»ŒŒÒµΩÕÊº“¡–±Ì
	local ret = AddMission( sceneId, selfId, x228902_g_MissionId, x228902_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		x228902_NotifyFailBox( sceneId, selfId, targetId, "    #YNhßt k˝ nhiÆm v¯ c¸a c·c h’ „ •y" )
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228902_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsMissionOkFail, 0 )	-- ≥ı ºªØ»ŒŒÒÕÍ≥…±Íº«
	SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsFindTarget, 0 )		-- ≥ı ºªØ±Íº«

	--œ‘ æƒ⁄»›∏ÊÀﬂÕÊº““—æ≠Ω” ‹¡À»ŒŒÒ
	x228902_NotifyFailTips( sceneId, selfId, "C·c h’ „ nhßn nhiÆm v¯: " .. x228902_g_MissionName )
	Msg2Player( sceneId, selfId, "#YTi™p nhßn nhiÆm v¯ " .. x228902_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--∑≈∆˙
--**********************************
function x228902_OnAbandon( sceneId, selfId )
	--…æ≥˝ÕÊº“»ŒŒÒ¡–±Ì÷–∂‘”¶µƒ»ŒŒÒ
	DelMission( sceneId, selfId, x228902_g_MissionId )
end

--**********************************
--ºÃ–¯
--**********************************
function x228902_OnContinue( sceneId, selfId, targetId )
	--Ã·Ωª»ŒŒÒ ±µƒÀµ√˜–≈œ¢
    BeginEvent( sceneId )
		AddText( sceneId, x228902_g_MissionName )
		AddText( sceneId, x228902_g_MissionComplete )
		AddMoneyBonus( sceneId, x228902_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo( sceneId, selfId, targetId, x228902_g_ScriptId, x228902_g_MissionId )
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x228902_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228902_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228902_g_MissionId )				-- µ√µΩ»ŒŒÒµƒ–Ú¡–∫≈
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228902_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ã·Ωª
--**********************************
function x228902_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228902_g_AccomplishNPC_Name then		--≈–∂œ∏√npc «∑Ò «∂‘”¶»ŒŒÒµƒnpc
		return
	end

	if x228902_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	--ÃÌº”»ŒŒÒΩ±¿¯
	AddMoney( sceneId, selfId, x228902_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x228902_g_exp )

	DelMission( sceneId, selfId, x228902_g_MissionId )
	--…Ë÷√»ŒŒÒ“—æ≠±ªÕÍ≥…π˝
	MissionCom( sceneId, selfId, x228902_g_MissionId )
	Msg2Player( sceneId, selfId, "#YHo‡n th‡nh nhiÆm v¯: " .. x228902_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--…±À¿π÷ŒÔªÚÕÊº“
--**********************************
function x228902_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--Ω¯»Î«¯”Ú ¬º˛
--**********************************
function x228902_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µ¿æﬂ∏ƒ±‰
--**********************************
function x228902_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
-- ∂‘ª∞¥∞ø⁄–≈œ¢Ã· æ
--**********************************
function x228902_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x228902_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
