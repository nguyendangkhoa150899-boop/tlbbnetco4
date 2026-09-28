--¡ÀΩ‚æ≈¥Û√≈≈…Ãÿ…´

--Ω≈±æ∫≈
x210237_g_ScriptId	= 210237

--√≈≈…–≈œ¢(√≈≈…√˚≥∆£¨Ãÿ…´√Ë ˆ£¨Ω”“˝»À◊¯±Í£¨Ω”“˝»À√˚≥∆£¨¥´ÀÕ◊¯±Í)
x210237_g_mpInfo		= {}
x210237_g_mpInfo[0]	= { " [ThiÍn Long]", "#{OBJ_dali_0045}", 189, 124, "Ph· Tham",    185, 128 }
x210237_g_mpInfo[1]	= { " [Nga My]", "#{OBJ_dali_0046}", 192, 129, "Lµ Tam NﬂΩng",  185, 128 }
x210237_g_mpInfo[2]	= { " [C·i Bang]", "#{OBJ_dali_0047}", 126, 135, "Gi‰n Ninh",    133, 130 }
x210237_g_mpInfo[3]	= { " [Minh Gi·o]", "#{OBJ_dali_0048}", 130, 121, "Th’ch B‰o",    133, 130 }
x210237_g_mpInfo[4]	= { " [Thi™u L‚m]", "#{OBJ_dali_0049}", 187, 122, "TuÆ D∏ch ",    185, 128 }
x210237_g_mpInfo[5]	= { " [ThiÍn SΩn]", "#{OBJ_dali_0050}", 131, 124, "TrÏnh Thanh SﬂΩng",  133, 130 }
x210237_g_mpInfo[6]	= { " [Vı –ang]", "#{OBJ_dali_0051}", 127, 131, "TrﬂΩng Ho’ch",    133, 130 }
x210237_g_mpInfo[7]	= { " [TiÍu Dao]", "#{OBJ_dali_0052}", 188, 133, "–‡m –‡i Tÿ V˚",185, 128 }
x210237_g_mpInfo[8]	= { " [Tinh T˙c]", "#{OBJ_dali_0053}", 134, 120, "H‰i Phong Tÿ",  133, 130 }

--»ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x210237_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local	mp
	local	i		= 0
	
	--¡ÀΩ‚√≈≈…Ãÿ…´
	if key == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Cÿu ’i mÙn ph·i" )
			for i, mp in x210237_g_mpInfo do
				AddNumText( sceneId, x210237_g_ScriptId, mp[1], 11, i+1 )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--—°‘Ò∏˜√≈≈…
	elseif key >= 1 and key <= 9 then
		mp	= x210237_g_mpInfo[key-1]
		BeginEvent( sceneId )
			AddText( sceneId, mp[2] )
			AddNumText( sceneId, x210237_g_ScriptId, "–ﬂa ta i g£p ngﬂ∂i truy´n thÙng", 9, -1*key )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--ÀÕŒ“»•º˚¥´ÀÕ»À
	elseif key >= -9 and key <= -1 then
		mp	= x210237_g_mpInfo[-1*key-1]
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, mp[3], mp[4], mp[5] )
		SetPos( sceneId, selfId, mp[6], mp[7] )
		
		--πÿ±’ΩÁ√Ê
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	--∆‰À˚
	else
		return
	end
end

--**********************************
--¡–æŸ ¬º˛
--**********************************
function x210237_OnEnumerate( sceneId, selfId, targetId )
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210237_g_ScriptId, "TÏm hi¨u £c trﬂng Cÿu ’i mÙn ph·i", 11, 100 )
	end
end

--**********************************
--ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x210237_CheckAccept( sceneId, selfId )
	--–Ë“™10º∂≤≈ƒ‹Ω”
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		return 1
	else
		return 0
	end
end

--**********************************
--Ω” ‹
--**********************************
function x210237_OnAccept( sceneId, selfId )
end

--**********************************
--∑≈∆˙
--**********************************
function x210237_OnAbandon( sceneId, selfId )
end

--**********************************
--ºÃ–¯
--**********************************
function x210237_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x210237_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--Ã·Ωª
--**********************************
function x210237_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--…±À¿π÷ŒÔªÚÕÊº“
--**********************************
function x210237_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--Ω¯»Î«¯”Ú ¬º˛
--**********************************
function x210237_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µ¿æﬂ∏ƒ±‰
--**********************************
function x210237_OnItemChanged( sceneId, selfId, itemdataId )
end
