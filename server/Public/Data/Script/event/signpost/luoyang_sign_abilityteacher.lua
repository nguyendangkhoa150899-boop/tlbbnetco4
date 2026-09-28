-- ÂåÑô
--Éú»î¼¼ÄÜµ¼Ê¦
--ÎÊÂ·½Å±¾
x500005_g_scriptId = 500005

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500005_g_Signpost = {
	{ type=2, name="ÐÕi sß tr°ng tr÷t", x=219, y=262, tip="Lßu Di®c Nông", desc="Ði ra khöi LÕc Dß½ng, Nam Môn, qua c¥u phía trß¾c, ði v« hß¾ng Ðông, tìm ðÕi sß tr°ng tr÷t Lßu Di®c Nông · thØa ruµng [219,262]. „n phímTAB ð¬ xem trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß khai thác mö", x=212, y=151, tip="Vi Ð°ng ChuÏ", desc="ÐÕi sß khai khoáng Vi Ð°ng Chùy (212, 151) trong ti®m vû khí · Ðông Th¸. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß hái thu¯c", x=120, y=169, tip="Nghiêm Bách Thäo", desc="ÐÕi sß hái thu¯c Nghiêm Bách Thäo (120, 169) · ðß¶ng l¾n phía Ðông Tây Th¸, ¤n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Ngß phu", x=207, y=184, tip="Khß½ng Ngß", desc="Ngß phu Khß½ng Ngß (207, 184) · Nam Môn Ðông Th¸, ¤n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß mÛ ngh®", x=60, y=146, tip="Long Tam Thiªu", desc="ÐÕi sß công ngh® Long Tam Thiªu · (60, 146) · ðß¶ng l¾n phía Tây. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß may vá", x=193, y=172, tip="Phù Mçn Chi", desc="ÐÕi sß may vá Phù Mçn Chi (193, 172) · Ðông Th¸. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß luy®n kim", x=213, y=160, tip="Vß½ng ÐÑc Phúc", desc="Ðúc kiªm ðÕi sß Vß½ng ÐÑc Phúc (213, 160) · trong ti®m binh khí · Ðông Th¸. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß n¤u ån", x=134, y=152, tip="Lý ÐÕi ChuÖ", desc="ÐÕi sß n¤u nß¾ng Lý ÐÕi Chüy (134, 152) · trong tØu ðiªm ch² giao nhau giæa Tây Th¸ và ðß¶ng l¾n phía Tây. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß chª duþc", x=138, y=164, tip="Trß½ng Minh Cänh", desc="ÐÕi sß chª dßþc Trß½ng Minh Cänh (138, 164) · ti®m thu¯c giæa Tây Th¸ và ðß¶ng l¾n phía Nam. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß dßÞng sinh pháp", x=132, y=156, tip="Tß¶ng Vy", desc="ÐÕi sß dßÞng sinh pháp Tß¶ng Vy (132, 156) · ti®m thu¯c ch² giao nhau giæa Tây Th¸ và ðß¶ng l¾n phía Tây. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß dßþc lý h÷c", x=136, y=169, tip="BÕch Dînh Minh", desc="ÐÕi sß dßþc lý h÷c BÕch Dînh Minh (136, 169) · ti®m thu¯c giæa Tây Th¸ và ðß¶ng l¾n phía Nam. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Trùng c¤u ph¯i phß½ng", x=141, y=133, tip="Ti¬u Cao", desc="#GMua lÕi ph¯i phß½ng: #Wdo nhæng sai sót vô tình khiªn nhæng thÑ ngß¶i ch½i ðã h÷c nhß#G Ph¯i phß½ng gia công nguyên li®u, bánh bao ph¯i phß½ng, s½/trung/cao c¤p loÕi thñc tài ph¯i phß½ng, Chï Xích Thiên Nhai ph¯i phß½ng#W m¤t ði, có th¬ ðªn #GTô Châu", eventId=-1 },
	{ type=2, name="Gi¾i thi®u gia công nguyên li®u", x=153, y=171, tip="Phùng Chú Thiªt", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x500005_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500005_g_Signpost do
		AddNumText(sceneId, x500005_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x500005_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500005_g_Signpost[GetNumText()]

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
