--√≈≈…÷∏“˝

--MisDescBegin
--Ω≈±æ∫≈
x210241_g_ScriptId	= 210241
--MisDescEnd

--√≈≈…–≈œ¢£∫√≈≈…√˚≥∆£¨Ãÿ…´√Ë ˆ£¨NumText£¨Ω”“˝»À◊¯±Í£¨Ω”“˝»À√˚≥∆
x210241_g_MPInfo		=
{
	{ nam="Ph·i Thi™u L‚m", des="#{event_dali_mp_sl}", key=1020, x=156, z=132, npc="TuÆ D∏ch"},
	{ nam="Ph·i Minh Gi·o",   des="#{event_dali_mp_mj}", key=1021, x=164, z=141, npc="Th’ch B‰o"},
	{ nam="Ph·i C·i Bang",   des="#{event_dali_mp_gb}", key=1022, x=156, z=135, npc="Gi‰n Ninh"},
	{ nam="Ph·i Ph·i Vı –ang", des="#{event_dali_mp_wd}", key=1023, x=156, z=129, npc="TrﬂΩng Ho’ch"},
	{ nam="Ph·i Nga My", des="#{event_dali_mp_em}", key=1024, x=156, z=138, npc="Lµ Tam NﬂΩng"},
	{ nam="Ph·i Tinh T˙c", des="#{event_dali_mp_xx}", key=1025, x=164, z=135, npc="H‰i Phong Tÿ"},
	{ nam="Ph·i ThiÍn Long", des="#{event_dali_mp_tl}", key=1026, x=164, z=132, npc="Ph· Tham"},
	{ nam="Ph·i ThiÍn SΩn", des="#{event_dali_mp_ts}", key=1027, x=164, z=138, npc="TrÏnh Thanh SﬂΩng"},
	{ nam="Ph·i TiÍu Dao", des="#{event_dali_mp_xy}", key=1028, x=164, z=129, npc="–‡m –‡i Tÿ V˚"},	},
}

--**********************************
--»ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x210241_OnDefaultEvent( sceneId, selfId, targetId )
  
	local	key	= GetNumText()
	local	MP

	if key == 1010 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{event_dali_mp_dlg}" )
			for _, MP in x210241_g_MPInfo do
				AddNumText( sceneId, x210241_g_ScriptId, MP.nam, 11, MP.key )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	else
		for _, MP in x210241_g_MPInfo do
			if key == MP.key then
				x210241_MsgBox( sceneId, selfId, targetId, MP.des )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, MP.x, MP.z, MP.npc )
				break
			end
		end
	end

end

--**********************************
--¡–æŸ ¬º˛
--**********************************
function x210241_OnEnumerate( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210241_g_ScriptId, "TÏm g£p cÿu ’i mÙn ph·i", 11, 1010 )
	end

end

--**********************************
--ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x210241_CheckAccept( sceneId, selfId )
end

--**********************************
--Ω” ‹
--**********************************
function x210241_OnAccept( sceneId, selfId )
end

--**********************************
--∑≈∆˙
--**********************************
function x210241_OnAbandon( sceneId, selfId )
end

--**********************************
--ºÃ–¯
--**********************************
function x210241_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x210241_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ã·Ωª
--**********************************
function x210241_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--…±À¿π÷ŒÔªÚÕÊº“
--**********************************
function x210241_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--Ω¯»Î«¯”Ú ¬º˛
--**********************************
function x210241_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µ¿æﬂ∏ƒ±‰
--**********************************
function x210241_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--Message Box
--**********************************
function x210241_MsgBox( sceneId, selfId, targetId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end
