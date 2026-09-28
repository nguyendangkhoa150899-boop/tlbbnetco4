-- ÖĞÇïÈÎÎñ

--************************************************************************
--MisDescBegin

-- ½Å±¾ºÅ
x050009_g_ScriptId = 050009

-- ÈÎÎñºÅ
x050009_g_MissionId = 395					-- 395 - 399

--ÉÏmµt cáiÈÎÎñtoÕ ğµ ID
x050009_g_MissionIdNext = 396

-- Møc tiêu nhi®m vønpc
x050009_g_Name = "NhÕc Thß¶ng Viên"

--ÈÎÎñ¹éÀà
x050009_g_MissionKind = 3

--ĞÆng c¤p nhi®m vø 
x050009_g_MissionLevel = 10000

-- ÈÎÎñÎÄ±¾ÃèÊö
x050009_g_MissionName = "Nhi®m vø trung thu"
x050009_g_MissionInfo = "    Nghe giang h° ğ°n r¢ng, g¥n ğây có mµt s¯ cao thü nh¤t ph¦m ğß¶ng s¨ t¾i dñ l­ trung thu" ..
				"T¤n công ĞÕi T¯ng ta, lúc ğó ğã b¸ tß¾ng quân Dß½ng Vån Quäng phong töa tÕi" ..
				"Ğôn Hoàng, các hÕ ch¤p nh§n vì nß¾c quyªt ğ¤u?"								-- ÈÎÎñÃèÊö

x050009_g_MissionTarget = "    Bây gi¶ mau ğªn Ğôn Hoàng (252, 144) Tß¾ng quân Dß½ng Vån Quäng n½i ğó vi®n trş h¡n ch¯ng ğŞ sñ tiªn công cüa Nh¤t Ph¦m Ğß¶ng cao thü. "	-- Møc tiêu nhi®m vø

x050009_g_ContinueInfo = "    "				-- Î´Hoàn t¤t nhi®m vøtoÕ ğµ npc¶Ô»°
x050009_g_MissionComplete = ""				-- Hoàn t¤t nhi®m vønpcËµtoÕ ğµ »°

-- ÈÎÎñ½±Àø

--MisDescEnd
--************************************************************************

x050009_g_NumText_Mission = 1				-- ÖĞÇïÈÎÎñ
x050009_g_NumText_Intro = 2					-- ÈÎÎñ½éÉÜ
x050009_g_NumText_ViewMoon = 3				-- È¥ÍùTây H°ÉÍÔÂ

--**********************************
--ÅĞ¶ÏĞúng·ñÖĞÇïÊ±¼ä
--**********************************
function x050009_IsMidAutumnPeriod( sceneId, selfId )
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()						--µ±Ç°Ê±¼ä
	--CurTime = CurTime-36500 --Cái này Êı¾İÃ¿Äê¶¼ÒªÎ¬»¤
	local CurTime = GetQuarterTime();
	
	--local today = floor( CurTime/100 )						--µ±Ç°Ê±¼ä(Ìì)
	local today = mod(floor( CurTime/100 ), 1000)		--µ±Ç°Ê±¼ä(Ìì)
	local CurQuarterTime = mod( CurTime, 100 )			--µ±Ç°Ê±¼ä(¿Ì)
	--end modified by zhangguoxin 090207

	local firstDay = 257								-- 2008Äê9 ÔÂ 14 ÈÕ,°üº¬µ±ÈÕ
	local lastDay = 283									-- 2008Äê10 ÔÂ 9 ÈÕ,°üº¬µ±ÈÕ

	if today == firstDay and CurQuarterTime < 48 then
		return 0
	end

	if today == lastDay and CurQuarterTime > 47 then
		return 0
	end

	if today < firstDay or today > lastDay then
		return 0
	end

	return 1
end

--**********************************
--ÅĞ¶ÏÖĞÇïÎïÆ·Ğúng·ñÓĞĞ§
--**********************************
function x050009_IsItemValid( sceneId, itemSN )--ÓÉÎïÆ·toÕ ğµ ½Å±¾ÔæÄàÏÚÔÂ±ı¡¢±¡ºÉÏÚÔÂ±ı¡¢¶¹É³ÏÚÔÂ±ıµÈµÈµ÷ÓÃµ½ÕâÀï,ÒÑ¾­Ã»ÓĞÊ¹ÓÃ
	local today = GetDayTime()							--µ±Ç°Ê±¼ä(Ìì)
	local lastDay = 6303								-- 10 ÔÂ 31 ÈÕ

	-- 10 ÔÂ 31 ÈÕÒÔºóÊ§Ğ§
	if today > lastDay then
		return 0
	end

	return 1
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x050009_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050009_g_Name then		--ÅĞ¶Ï¸ÃnpcĞúng·ñĞúng¶ÔÓ¦ÈÎÎñtoÕ ğµ npc
		return
	end

	if x050009_IsMidAutumnPeriod( sceneId, selfId ) == 0 then
		return
	end

	if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) <= 0 then
		AddNumText( sceneId, x050009_g_ScriptId, "Nhi®m vø trung thu", -1, x050009_g_NumText_Mission )
	else
		AddNumText( sceneId, x050009_g_ScriptId, "T¾i Tây H° thß·ng nguy®t", -1, x050009_g_NumText_ViewMoon )
	end

	AddNumText( sceneId, x050009_g_ScriptId, "Nhi®m vø gi¾i thi®u", -1, x050009_g_NumText_Intro )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x050009_OnDefaultEvent( sceneId, selfId, targetId )	-- ği¬m»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
	if GetNumText() == x050009_g_NumText_Mission then
		x050009_AssignMission( sceneId, selfId, targetId )
	elseif GetNumText() == x050009_g_NumText_Intro then
		x050009_MissionIntro( sceneId, selfId, targetId )
	elseif GetNumText() == x050009_g_NumText_ViewMoon then
		x050009_ViewMoon( sceneId, selfId, targetId )
	else
		return
	end
end

--**********************************
--·¢²¼ÈÎÎñ
--**********************************
function x050009_AssignMission( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050009_g_MissionName )
		AddText( sceneId, x050009_g_MissionInfo )
	EndEvent( )
	DispatchMissionInfo( sceneId, selfId, targetId, x050009_g_ScriptId, x050009_g_MissionId )
end

--**********************************
--ÈÎÎñ½éÉÜ
--**********************************
function x050009_MissionIntro( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    TÕi Tô Châu (193, 148) hãy kích hoÕt nhi®m vø NhÕc Thß¶ng Viên - ğã tìm th¤y" ..
						"Ğôn Hoàng (252, 144) tß¾ng quân Dß½ng Vån Quäng ği vào tr§n chiªn phø bän - tiêu di®t" ..
						"BOSS ğoÕt ğßşc ği¬m tích lûy trung thu (nhß: l®nh bài nh¤t ph¦m ğß¶ng, có th¬ giao cho Dß½ng" ..
						"Vån Quäng ğoÕt ğßşc m¤y món quà quı) - hãy ği t¾i ba tØu l¥u · ba thành th¸ l¾n" ..
						"Ông chü · ğây dùng ği¬m tích lûy ğ±i l¤y nguyên li®u thñc ph¦m (bµt mì tinh, hß½ng li®u loÕi ßu, ğß¶ng thßşng hÕng)," )
		AddText( sceneId, "Ğªn Ngß¶i công b¯ nhi®m vø có th¬ chuy¬n t¾i Tây H° thß·ng nguy®t, hãy tìm ğªn Tô cüa DÕ Tây H° (280" ..
						", 184) dùng 3 cái v§t li®u ThÑc ån ğ±i l¤y mµt bánh trung thu (ngçu nhiên khác nhau" ..
						"Kh¦u v¸: Bánh trung thu nhân MÑt Táo, Bánh trung thu nhân BÕc Hà, bánh trung thu nhân Ğ§u, Nhãn" ..
						"Nhân bánh trung thu...bánh trung thu, huyªt khí ğ°ng th¶i ğßşc nÕp ğ¥y, ğ°ng th¶i cûng tång thêm các loÕi h² trş khác nhau" ..
						"Th¶i hÕn bäo hành ğµ tß½i ngon cüa bánh Trung thu t¾i 31 tháng 10. Ğ°ng th¶i m²i l¥n thay mµt hµi trung thu" )
		AddText( sceneId, "L¤y ğßşc t£ng thß·ng kinh nghi®m tß½ng Ñng. Có th¬ t¾i DÕ Tây H° mua quà trung thu" ..
						"Hoa, th¶i gian hoa trong l­ trung thu có hi®u lñc t¾i ngày 31 tháng 10" )
	EndEvent( )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--È¥ÍùTây H°ÉÍÔÂ
--**********************************
function x050009_ViewMoon( sceneId, selfId, targetId )
	local scene, x, z = 121, 272, 181
	NewWorld( sceneId, selfId, scene, x, z )
end

--**********************************
--¼ì²âTiªp thøÌõ¼ş
--**********************************
function x050009_CheckAccept( sceneId, selfId )
	if x050009_IsMidAutumnPeriod( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--Tiªp thø
--**********************************
function x050009_OnAccept( sceneId, selfId, targetId )
	--¼ì²âĞúng·ñÈÎÎñÒÑ¾­´ïµ½20cái,Èç¹ûµ½ÁË,Ôò²»ÄÜ½Ó
	if GetMissionCount( sceneId, selfId ) == 20 then
		x050009_NotifyFailTips( sceneId, selfId, "Không th¬ tiªp nh§n nhi«u nhi®m vø" )
		return
	end

	if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) <= 0 then
		AddMission( sceneId, selfId, x050009_g_MissionId, x050009_g_ScriptId, 0, 0, 0 )		-- kill¡¢area¡¢item
		if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) <= 0 then
			return
		end
	end

	x050009_NotifyFailBox( sceneId, selfId, targetId, x050009_g_MissionTarget )
end

--**********************************
--·ÅÆúÈÎÎñ
--**********************************
function x050009_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) == 0 then
		return
	end

	if IsHaveMission( sceneId, selfId, x050009_g_MissionIdNext ) > 0 then
		x050009_NotifyFailTips( sceneId, selfId, "Xin vÑt bö nhi®m vø nh¤t ph¦m ğß¶ng trß¾c!" )
		return
	end

	DelMission( sceneId, selfId, x050009_g_MissionId )
end

--**********************************
--¶Ô»°´°¿ÚĞÅÏ¢ÌáÊ¾
--**********************************
function x050009_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ĞÑÄ¿ĞÅÏ¢ÌáÊ¾
--**********************************
function x050009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
