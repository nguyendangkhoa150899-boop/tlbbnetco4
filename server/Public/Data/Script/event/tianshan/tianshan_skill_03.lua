-- ”Œ…ΩÕÊÀÆ

--MisDescBegin

-- Ω≈±æ∫≈
x228904_g_ScriptId = 228904

-- ƒø±Í NPC
x228904_g_Position_X = 217
x228904_g_Position_Z = 255
x228904_g_SceneID = 2
x228904_g_AccomplishNPC_Name = "VﬂΩng Thi´u"

-- »ŒŒÒ∫≈
x228904_g_MissionId = 949

-- «∞–¯»ŒŒÒ
x228904_g_PreMissionId = 948

-- Ω” ‹»ŒŒÒ NPC  Ù–‘
x228904_g_Name = "VﬂΩng Thi´u"

--»ŒŒÒπÈ¿‡
x228904_g_MissionKind = 28

--»ŒŒÒµ»º∂
x228904_g_MissionLevel = 30

-- «∑Ò «æ´”¢»ŒŒÒ
x228904_g_IfMissionElite = 0

--»ŒŒÒ√˚
x228904_g_MissionName = "Du sΩn ngo’n th¸y"
x228904_g_MissionInfo = "#{TIANSHAN_SKILL_06}"
x228904_g_MissionTarget = "    Mang 5 v‡ng ™n Tu VÂn –‡i ∑ th‡nh –’i L˝#W giao cho #RVﬂΩng Thi´u #W#{_INFOAIM217,255,2, VﬂΩng Thi´u}. "
x228904_g_MissionContinue = "#{TIANSHAN_SKILL_07}"
x228904_g_MissionComplete = "#{TIANSHAN_SKILL_08}"

x228904_g_MoneyCost = 50000

x228904_g_MoneyBonus = 1000
x228904_g_exp = 2000

x228904_g_IsMissionOkFail = 0					--  «∑ÒÕÍ≥…»ŒŒÒµƒ±Íº«Œª
x228904_g_IsFindTarget = 1						--  «∑Ò’“µΩÕı…ÿ±Íº«Œª

--MisDescEnd

--**********************************
--»ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x228904_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228904_g_Name then
		return 0
	end

	--»Áπ˚ÕÊº“ÕÍ≥…π˝’‚∏ˆ»ŒŒÒ
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return
	elseif IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228904_g_AccomplishNPC_Name then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsFindTarget, 1 )
			x228904_OnContinue( sceneId, selfId, targetId )
		end
	--¬˙◊„»ŒŒÒΩ” ’Ãıº˛
	elseif x228904_CheckAccept( sceneId, selfId ) > 0 then
		--∑¢ÀÕ»ŒŒÒΩ” ‹ ±œ‘ æµƒ–≈œ¢
		BeginEvent( sceneId )
			AddText( sceneId, x228904_g_MissionName )
			AddText( sceneId, x228904_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228904_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228904_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228904_g_ScriptId, x228904_g_MissionId )
	end
end

--**********************************
--¡–æŸ ¬º˛
--**********************************
function x228904_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x228904_g_PreMissionId ) <= 0 then
		return
	end

	--»Áπ˚ÕÊº“ÕÍ≥…π˝’‚∏ˆ»ŒŒÒ
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return
	--»Áπ˚“—Ω”¥À»ŒŒÒ
	elseif IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228904_g_AccomplishNPC_Name then
			AddNumText( sceneId, x228904_g_ScriptId, x228904_g_MissionName, 2, -1 )
		end
	--¬˙◊„»ŒŒÒΩ” ’Ãıº˛
	elseif GetName( sceneId, targetId ) == x228904_g_Name and GetLevel( sceneId, selfId ) >= x228904_g_MissionLevel then
		AddNumText( sceneId, x228904_g_ScriptId, x228904_g_MissionName, 1, -1 )
	end
end

--**********************************
--ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x228904_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228904_g_PreMissionId ) <= 0 then
		return 0
	end

	-- 1£¨ºÏ≤‚ÕÊº“ «≤ª «“—æ≠◊ˆπ˝
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return 0
	end

	-- µ»º∂ºÏ≤‚
	if GetLevel( sceneId, selfId ) < x228904_g_MissionLevel then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--Ω” ‹
--**********************************
function x228904_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228904_g_Name then
		return 0
	end

	if x228904_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	--º”»Î»ŒŒÒµΩÕÊº“¡–±Ì
	local ret = AddMission( sceneId, selfId, x228904_g_MissionId, x228904_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		x228904_NotifyFailBox( sceneId, selfId, targetId, "    #YNhßt k˝ nhiÆm v¯ c¸a c·c h’ „ •y" )
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail, 0 )	-- ≥ı ºªØ»ŒŒÒÕÍ≥…±Íº«
	SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsFindTarget, 0 )		-- ≥ı ºªØ±Íº«

	--œ‘ æƒ⁄»›∏ÊÀﬂÕÊº““—æ≠Ω” ‹¡À»ŒŒÒ
	x228904_NotifyFailTips( sceneId, selfId, "C·c h’ „ nhßn nhiÆm v¯: " .. x228904_g_MissionName )
	Msg2Player( sceneId, selfId, "#YTi™p nhßn nhiÆm v¯ " .. x228904_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--∑≈∆˙
--**********************************
function x228904_OnAbandon( sceneId, selfId )
	--…æ≥˝ÕÊº“»ŒŒÒ¡–±Ì÷–∂‘”¶µƒ»ŒŒÒ
	DelMission( sceneId, selfId, x228904_g_MissionId )
end

--**********************************
--ºÃ–¯
--**********************************
function x228904_OnContinue( sceneId, selfId, targetId )
	--Ã·Ωª»ŒŒÒ ±µƒÀµ√˜–≈œ¢
    BeginEvent( sceneId )
		AddText( sceneId, x228904_g_MissionName )
		AddText( sceneId, x228904_g_MissionContinue )
		AddMoneyBonus( sceneId, x228904_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo( sceneId, selfId, targetId, x228904_g_ScriptId, x228904_g_MissionId )
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x228904_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228904_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )				-- µ√µΩ»ŒŒÒµƒ–Ú¡–∫≈
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ã·Ωª
--**********************************
function x228904_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228904_g_AccomplishNPC_Name then		--≈–∂œ∏√npc «∑Ò «∂‘”¶»ŒŒÒµƒnpc
		return
	end

	if x228904_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	if GetMoney( sceneId, selfId ) < x228904_g_MoneyCost then
		x228904_NotifyFailBox( sceneId, selfId, targetId, "    SØ ti´n c·c h’ mang theo khÙng ¸, khÙng th¨ ho‡n th‡nh nhiÆm v¯." )
		return
	end

	--ø€«Æ
	CostMoney( sceneId, selfId, x228904_g_MoneyCost )

	--ÃÌº”»ŒŒÒΩ±¿¯
	AddMoney( sceneId, selfId, x228904_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x228904_g_exp )

	DelMission( sceneId, selfId, x228904_g_MissionId )
	--…Ë÷√»ŒŒÒ“—æ≠±ªÕÍ≥…π˝
	MissionCom( sceneId, selfId, x228904_g_MissionId )

	-- ºÏ≤‚ÕÊº“ «≤ª «ÃÏ…Ω≈…µƒµ‹◊”
	if GetMenPai( sceneId, selfId ) == MP_TIANSHAN then
		-- ∏¯ÕÊº“‘ˆº”514∫≈ººƒ‹
		AddSkill( sceneId, selfId, 514 )
		x228904_NotifyFailTips( sceneId, selfId, "C·c h’ „ h˜c ﬂ˛c k€ nÂng \"Li≠u ¡m Hoa Minh\"." )
	end

	x228904_NotifyFailBox( sceneId, selfId, targetId, x228904_g_MissionComplete )
	Msg2Player( sceneId, selfId, "#YHo‡n th‡nh nhiÆm v¯: " .. x228904_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--…±À¿π÷ŒÔªÚÕÊº“
--**********************************
function x228904_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--Ω¯»Î«¯”Ú ¬º˛
--**********************************
function x228904_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µ¿æﬂ∏ƒ±‰
--**********************************
function x228904_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
-- ∂‘ª∞¥∞ø⁄–≈œ¢Ã· æ
--**********************************
function x228904_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x228904_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
