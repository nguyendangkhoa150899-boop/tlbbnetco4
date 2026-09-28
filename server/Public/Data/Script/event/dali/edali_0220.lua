--’“»À»ŒŒÒ
--’‘ÃÏ ¶—∞’“‘∆∆Æ∆Æ
--MisDescBegin
--Ω≈±æ∫≈
x210220_g_ScriptId = 210220

--Ω” ‹»ŒŒÒNPC Ù–‘
x210220_g_Position_X=265.4445
x210220_g_Position_Z=128.5832
x210220_g_SceneID=2
x210220_g_AccomplishNPC_Name="V‚n PhiÍu PhiÍu"

--»ŒŒÒ∫≈
x210220_g_MissionId = 700

--…œ“ª∏ˆ»ŒŒÒµƒID
--g_MissionIdPre = 

--ƒø±ÍNPC
x210220_g_Name	="V‚n PhiÍu PhiÍu"

--»ŒŒÒπÈ¿‡
x210220_g_MissionKind = 13

--»ŒŒÒµ»º∂
x210220_g_MissionLevel = 7

-- «∑Ò «æ´”¢»ŒŒÒ
x210220_g_IfMissionElite = 0

--»ŒŒÒ√˚
x210220_g_MissionName="L‡m sao b°t tr‚n th˙ ‚y?"
x210220_g_MissionInfo="#{event_dali_0027}"
x210220_g_MissionTarget="    –™n #YTr˘ng –i¨u phﬂ∂ng#W ∑ #Gﬂ∂ng læn phÌa –Ùng c¸a th‡nh –’i L˝#W tÏm phﬂ∂ng ch¸ #RV‚n PhiÍu PhiÍu #W#{_INFOAIM265,129,2, V‚n PhiÍu PhiÍu}. #b#G(Nh§p tr·i v‡o t˜a µ NPC cÛ g’ch ch‚n s® gi˙p c·c h’ tÏm ™n NPC Û)"
x210220_g_MissionComplete="#{event_dali_0028}"
x210220_g_MoneyBonus=72
x210220_g_SignPost = {x = 263, z = 129, tip = "V‚n PhiÍu PhiÍu"}


--MisDescEnd
--**********************************
--»ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x210220_OnDefaultEvent( sceneId, selfId, targetId )
    --»Áπ˚ÕÊº“ÕÍ≥…π˝’‚∏ˆ»ŒŒÒ
    if (IsMissionHaveDone(sceneId,selfId,x210220_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210220_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210220_g_Name then
			x210220_OnContinue( sceneId, selfId, targetId )
		end
    --¬˙◊„»ŒŒÒΩ” ’Ãıº˛
    elseif x210220_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210220_g_Name then
			--∑¢ÀÕ»ŒŒÒΩ” ‹ ±œ‘ æµƒ–≈œ¢
			BeginEvent(sceneId)
				AddText(sceneId,x210220_g_MissionName)
				AddText(sceneId,x210220_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210220_g_MissionTarget)
				AddMoneyBonus( sceneId, x210220_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210220_g_ScriptId,x210220_g_MissionId)
		end
    end
end

--**********************************
--¡–æŸ ¬º˛
--**********************************
function x210220_OnEnumerate( sceneId, selfId, targetId )
    --»Áπ˚ÕÊº“ªπŒ¥ÕÍ≥……œ“ª∏ˆ»ŒŒÒ
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --»Áπ˚ÕÊº“ÕÍ≥…π˝’‚∏ˆ»ŒŒÒ
    if IsMissionHaveDone(sceneId,selfId,x210220_g_MissionId) > 0 then
    	return 
    --»Áπ˚“—Ω”¥À»ŒŒÒ
    elseif IsHaveMission(sceneId,selfId,x210220_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210220_g_Name then
			AddNumText(sceneId, x210220_g_ScriptId,x210220_g_MissionName,2,-1);
		end
    --¬˙◊„»ŒŒÒΩ” ’Ãıº˛
    elseif x210220_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210220_g_Name then
			AddNumText(sceneId,x210220_g_ScriptId,x210220_g_MissionName,1,-1);
		end
    end
end

--**********************************
--ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x210220_CheckAccept( sceneId, selfId )
	--–Ë“™7º∂≤≈ƒ‹Ω”
	if GetLevel( sceneId, selfId ) >= 7 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ω” ‹
--**********************************
function x210220_OnAccept( sceneId, selfId )
	--º”»Î»ŒŒÒµΩÕÊº“¡–±Ì
	AddMission( sceneId,selfId, x210220_g_MissionId, x210220_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNhßn nhiÆm v¯: L‡m sao b°t tr‚n th˙",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210220_g_SignPost.x, x210220_g_SignPost.z, x210220_g_SignPost.tip )
end

--**********************************
--∑≈∆˙
--**********************************
function x210220_OnAbandon( sceneId, selfId )
	--…æ≥˝ÕÊº“»ŒŒÒ¡–±Ì÷–∂‘”¶µƒ»ŒŒÒ
    DelMission( sceneId, selfId, x210220_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210220_g_SignPost.tip )
end

--**********************************
--ºÃ–¯
--**********************************
function x210220_OnContinue( sceneId, selfId, targetId )
	--Ã·Ωª»ŒŒÒ ±µƒÀµ√˜–≈œ¢
    BeginEvent(sceneId)
		AddText(sceneId,x210220_g_MissionName)
		AddText(sceneId,x210220_g_MissionComplete)
		AddMoneyBonus( sceneId, x210220_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210220_g_ScriptId,x210220_g_MissionId)
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x210220_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210220_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ã·Ωª
--**********************************
function x210220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210220_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--ÃÌº”»ŒŒÒΩ±¿¯
		AddMoney(sceneId,selfId,x210220_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,500)
		DelMission( sceneId,selfId,  x210220_g_MissionId )
		--…Ë÷√»ŒŒÒ“—æ≠±ªÕÍ≥…π˝
		MissionCom( sceneId,selfId,  x210220_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo‡n t§t nhiÆm v¯: L‡m sao b°t tr‚n th˙",MSG2PLAYER_PARA )
		CallScriptFunction( 210221, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--…±À¿π÷ŒÔªÚÕÊº“
--**********************************
function x210220_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--Ω¯»Î«¯”Ú ¬º˛
--**********************************
function x210220_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µ¿æﬂ∏ƒ±‰
--**********************************
function x210220_OnItemChanged( sceneId, selfId, itemdataId )
end
