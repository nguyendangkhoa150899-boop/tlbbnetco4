-- ¡È Øµƒ ’ºØ∫Õ≤È—Ø ˝¡ø

--************************************************************************
--MisDescBegin

-- Ω≈±æ∫≈
x600050_g_ScriptId = 600050

-- »ŒŒÒƒø±Í NPC
x600050_g_Name = "Thﬂ˛ng Quan BÂng"
x600050_g_Name2 = "Thﬂ˛ng Quan Tuy™t"

--∞Ô’Ω ˝æ›À˜“˝£¨∂‘”¶≥Ã–Ú÷–µƒ enum GUILDWAR_INT_ARRAY
x600050_g_A_LingShiIndex = 2
x600050_g_B_LingShiIndex = 7

--∏ˆ»Àª˝∑÷ ˝æ›À˜“˝£¨∂‘”¶≥Ã–Úenum GUILDWAR_INT_INDEX
x600050_g_Human_ResourceNumIndex = 4					--∏ˆ»ÀΩªƒ…◊ ‘¥∏ˆ ˝À˜“˝


x600050_g_LingShi = {"Thanh Long Th’ch","B’ch H± Th’ch","Chu Tﬂæc Th’ch","Huy´n V˚ Th’ch","B‡n C± Th’ch"}		--¡È Ø√˚◊÷
x600050_g_LingShiID = {30900051,30900052,30900053,30900054,30900055}	--¡È ØID

--∞Ô’Ω∏±±æΩ≈±æ
x600050_g_BangzhanScriptId	= 402047

x600050_g_GuildPoint_LingShi = 1						--ª˝∑÷πÊ‘ÚÀ˜“˝£¨±ÌGuildWarPoint.txtµƒID

--MisDescEnd
--************************************************************************

--**********************************
-- »ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x600050_OnDefaultEvent( sceneId, selfId, targetId )	-- µ„ª˜∏√»ŒŒÒ∫Û÷¥––¥ÀΩ≈±æ
--	if GetName( sceneId, targetId ) ~= x600050_g_Name then		-- ≈–∂œ∏√npc «∑Ò «∂‘”¶»ŒŒÒµƒnpc
--		return
--	end

	local numText = GetNumText()
	
	if numText == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_39}")
			AddNumText(sceneId, x600050_g_ScriptId, "DuyÆt", 8, 3 )
			AddNumText(sceneId, x600050_g_ScriptId, "H¸y", 8, 4 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_63}")
			AddNumText(sceneId, x600050_g_ScriptId, "DuyÆt", 8, 5 )
			AddNumText(sceneId, x600050_g_ScriptId, "H¸y", 8, 6 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == 3 then
		x600050_AcceptLingshi( sceneId, selfId, targetId )
	elseif numText == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif numText == 5 then
		x600050_QueryLingshi( sceneId, selfId, targetId )
	elseif numText == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
-- ¡–æŸ ¬º˛
--**********************************
function x600050_OnEnumerate( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x600050_g_Name then		--≈–∂œ∏√npc «∑Ò «∂‘”¶»ŒŒÒµƒnpc
--		return
--	end
	
	AddNumText( sceneId, x600050_g_ScriptId, "#{BHXZ_081103_38}", 4, 1 ) --Ωªƒ…¡È Ø
	AddNumText( sceneId, x600050_g_ScriptId, "#{BHXZ_081103_62}", 4, 2 )	--≤Èø¥¡È Ø∏ˆ ˝
end

--**********************************
-- ≤È—Ø¡È Ø ˝¡ø
--**********************************
function x600050_QueryLingshi( sceneId, selfId, targetId )

	-- «∑Ò «∏±±æ
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end

	-- «∑Ò «À˘–Ë“™µƒ∏±±æ
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end
	
	-- «∑Òø™ º∞Ô’Ωª˝∑÷
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_157}" )
		return
	end
	
	local name = GetName( sceneId, targetId )
	local humanguildid = GetHumanGuildID(sceneId, selfId)
	
	if name == x600050_g_Name then
		local msg = "#{BHXZ_081103_140}"
		
		for i = 1, getn( x600050_g_LingShi ) do
			local num = GetGuildIntNum( sceneId, humanguildid, x600050_g_A_LingShiIndex+i-1 )
			msg = msg.."#r"..x600050_g_LingShi[i]..": "..num
		end
		
		x600050_NotifyFailBox( sceneId, selfId, targetId, msg )
	elseif name == x600050_g_Name2 then
		local msg = "#{BHXZ_081103_140}"
		
		for i = 1, getn( x600050_g_LingShi ) do
			local num = GetGuildIntNum( sceneId, humanguildid, x600050_g_B_LingShiIndex+i-1 )
			msg = msg.."#r"..x600050_g_LingShi[i]..": "..num
		end
		
		x600050_NotifyFailBox( sceneId, selfId, targetId, msg )
	end
	
end

--**********************************
-- Ω” ’¡È Ø ˝¡ø
--**********************************
function x600050_AcceptLingshi( sceneId, selfId, targetId )

	-- «∑Ò «∏±±æ
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end

	-- «∑Ò «À˘–Ë“™µƒ∏±±æ
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end
	
	-- «∑Òø™ º∞Ô’Ωª˝∑÷
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_37}" )
		return
	end
	
	local name = GetName( sceneId, targetId )
	local humanguildid = GetHumanGuildID(sceneId, selfId)
	local LingShiPerPoint = GetGuildWarPoint(sceneId, x600050_g_GuildPoint_LingShi)
	
	if name == x600050_g_Name then --A∞Ô
		local msg = ""
		local point = 0
		local totalnum = 0
		local NumPerType = {0,0,0,0,0}
		
		for i = 1, getn( x600050_g_LingShiID ) do
			local num = LuaFnGetAvailableItemCount( sceneId, selfId, x600050_g_LingShiID[i] )
			local alreadynum = GetGuildIntNum( sceneId, humanguildid, x600050_g_A_LingShiIndex+i-1 ) --“—”– ˝¡ø
			if num > 0 and alreadynum ~= -1 then --≤ªµ»”⁄-1µƒ≈–∂œø…“‘≈–∂œ≥ˆÕÊº“‘⁄’˝»∑µƒ∞Ô≈…÷–
				if LuaFnDelAvailableItem( sceneId, selfId, x600050_g_LingShiID[i], num ) > 0 then
					point = point + num*LingShiPerPoint
					totalnum = totalnum + num
					NumPerType[i] = num
					SetGuildIntNum( sceneId, humanguildid, x600050_g_A_LingShiIndex+i-1, num+alreadynum )
					msg = msg.."#r"..x600050_g_LingShi[i]..": "..num
				end
			end
		end
		
		if point > 0 then
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_141}"..msg )
			
			--‘ˆº”ª˝∑÷
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddAGuildPoint", sceneId, selfId, humanguildid, point )
--			--‘ˆº”∞Ôπ±£¨√ø5∏ˆ¡È Ø‘ˆº”“ªµ„∞Ôπ±
--			local alreadyResource = GetHumanGuildInt( sceneId, selfId, x600050_g_Human_ResourceNumIndex )
--			local alreadymod = mod(alreadyResource, 5)
--			local addbanggong = floor((alreadymod+totalnum) / 5)
--			if addbanggong > 0 then
--				CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, addbanggong )
--			end
			Msg2Player(sceneId, selfId, "#{BHXZ_081103_142}"..totalnum.."#{BHXZ_081103_143}" , MSG2PLAYER_PARA)
			--‘ˆº”∏ˆ»Àª˝∑÷
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, selfId, x600050_g_Human_ResourceNumIndex, totalnum )
			--Õ≥º∆»’÷æ
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("qinglong=%d,baihu=%d,zhuque=%d,xuanwu=%d,pangu=%d,total=%d", NumPerType[1], NumPerType[2], NumPerType[3], NumPerType[4], NumPerType[5], totalnum)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_RESOURCE, guid, log)
		else
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_144}" )
		end
	elseif name == x600050_g_Name2 then --B∞Ô
		local msg = ""
		local point = 0
		local totalnum = 0
		local NumPerType = {0,0,0,0,0}
		
		for i = 1, getn( x600050_g_LingShiID ) do
			local num = LuaFnGetAvailableItemCount( sceneId, selfId, x600050_g_LingShiID[i] )
			local alreadynum = GetGuildIntNum( sceneId, humanguildid, x600050_g_B_LingShiIndex+i-1 ) --“—”– ˝¡ø
			if num > 0 and alreadynum ~= -1 then --≤ªµ»”⁄-1µƒ≈–∂œø…“‘≈–∂œ≥ˆÕÊº“‘⁄’˝»∑µƒ∞Ô≈…÷–
				if LuaFnDelAvailableItem( sceneId, selfId, x600050_g_LingShiID[i], num ) > 0 then
					point = point + num*LingShiPerPoint
					totalnum = totalnum + num
					NumPerType[i] = num
					SetGuildIntNum( sceneId, humanguildid, x600050_g_B_LingShiIndex+i-1, num+alreadynum )
					msg = msg.."#r"..x600050_g_LingShi[i]..": "..num
				end
			end
		end
		
		if point > 0 then
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_141}"..msg )
			
			--‘ˆº”ª˝∑÷
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddBGuildPoint", sceneId, selfId, humanguildid, point )
--			--‘ˆº”∞Ôπ±£¨√ø5∏ˆ¡È Ø‘ˆº”“ªµ„∞Ôπ±
--			local alreadyResource = GetHumanGuildInt( sceneId, selfId, x600050_g_Human_ResourceNumIndex )
--			local alreadymod = mod(alreadyResource, 5)
--			local addbanggong = floor((alreadymod+totalnum) / 5)
--			if addbanggong > 0 then
--				CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, addbanggong )
--			end
			Msg2Player(sceneId, selfId, "#{BHXZ_081103_142}"..totalnum.."#{BHXZ_081103_143}" , MSG2PLAYER_PARA)
			--‘ˆº”∏ˆ»Àª˝∑÷
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, selfId, x600050_g_Human_ResourceNumIndex, totalnum )
			--Õ≥º∆»’÷æ
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("qinglong=%d,baihu=%d,zhuque=%d,xuanwu=%d,pangu=%d,total=%d", NumPerType[1], NumPerType[2], NumPerType[3], NumPerType[4], NumPerType[5], totalnum)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_RESOURCE, guid, log)
		else
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_144}" )
		end
	end
	
end

--**********************************
-- ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x600050_CheckAccept( sceneId, selfId, targetId )
	return 1
end

--**********************************
--Ω” ‹
--**********************************
function x600050_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--ºÃ–¯
--**********************************
function x600050_OnContinue( sceneId, selfId, targetId )
--	BeginEvent( sceneId )
--		AddText( sceneId, x600050_g_MissionName )
--		AddText( sceneId, "good ºÃ–¯" )
--	EndEvent( )
--	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600050_g_ScriptId, x600050_g_MissionId )
end

--**********************************
--∑≈∆˙
--**********************************
function x600050_OnAbandon( sceneId, selfId )
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x600050_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--Ã·Ωª
--**********************************
function x600050_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
-- ∂‘ª∞¥∞ø⁄–≈œ¢Ã· æ
--**********************************
function x600050_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ∆¡ƒª÷–º‰–≈œ¢Ã· æ
--**********************************
function x600050_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
