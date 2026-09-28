-- ËÕÖÝ
--Éú»î¼¼ÄÜ
--ÎÊÂ·½Å±¾
x500023_g_scriptId = 500023

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500023_g_Signpost = {
		{ type=2, name="ÐÕi sß tr°ng tr÷t", x=64, y=200, tip="Lâm Hoà T¸nh ", desc="Ra khöi Tô Châu Ðông Môn ði v« hß¾ng Nam, qua 1 cây c¥u nhö s¨ nhìn th¤y ÐÕi sß tr°ng tr÷t Lâm Hòa T¸nh (64, 200) . „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß khai thác mö", x=259, y=132, tip="Trß½ng Ti¬u Hà ", desc="ÐÕi sß khai khoáng Trß½ng Ti¬u Hà (259, 132) trong ti®m vû khí · Thành Ðông. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß hái thu¯c", x=106, y=109, tip="Vß½ng Th¦m Chi ", desc="ÐÕi sß hái thäo dßþc Vß½ng Th¦m Chi (106, 109) · Tây Th¸. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß câu cá", x=238, y=77, tip="Tß·ng Bình ", desc="ÐÕi sß câu cá Tß·ng Bình (238, 77) · bªn B¡c Ðông thành. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß mÛ ngh®", x=109, y=130, tip="T¢ng Tam Tïnh ", desc="ÐÕi sß công ngh® T¢ng Tam Tïnh (109, 130) · Tây Th¸. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß may vá", x=211, y=90, tip="Dß Hoá Long ", desc="ÐÕi sß may m£c Dß Hóa Long (211, 90) · g¥n B¡c Th¸. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß luy®n kim", x=251, y=151, tip="Tiªt Chúc ", desc="Ðúc kiªm ðÕi sß Tiªt Chúc (251, 151) · ti®m vû khí thành Ðông. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="ÐÕi sß n¤u ån", x=189, y=173, tip="Trí Hoá ", desc="ÐÕi sß n¤u nß¾ng Trí Hoá (189, 173) · cØa ti®m thu¯c phía B¡c TrÕng Viên Trß¶ng. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
		{ type=2, name="Trùng c¤u ph¯i phß½ng", x=96, y=127, tip="Ð¡¸ß", desc="Ti¬u Cao", desc="#GMua lÕi ph¯i phß½ng: #Wdo nhæng sai sót vô tình khiªn nhæng thÑ ngß¶i ch½i ðã h÷c nhß#G Ph¯i phß½ng gia công nguyên li®u, bánh bao ph¯i phß½ng, s½/trung/cao c¤p loÕi thñc tài ph¯i phß½ng, Chï Xích Thiên Nhai ph¯i phß½ng#W m¤t ði, có th¬ ðªn #GTô Châu", eventId=-1 },
		{ type=2, name="Gi¾i thi®u gia công nguyên li®u", x=-1, y=-1, tip="", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x500023_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500023_g_Signpost do
		AddNumText(sceneId, x500023_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x500023_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500023_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
