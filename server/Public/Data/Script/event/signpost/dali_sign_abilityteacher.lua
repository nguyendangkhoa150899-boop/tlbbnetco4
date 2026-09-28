-- ´óÀí
--Éú»î¼¼ÄÜ´óÊ¦
--ÎÊÂ·½Å±¾
x500046_g_scriptId = 500046

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500046_g_Signpost = {
	{ type=2, name="ÐÕi sß tr°ng tr÷t", x=277, y=167, tip="Công Tôn ÐÕi Thúc ", desc="Mu¯n h÷c làm ruµng xin t¾i ruµng cüa Công Tôn ÐÕi Thúc g¥n Ðông Môn Nµi, ông ta · ðó. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß khai thác mö", x=214, y=117, tip="Ð°ng Hoá Kim ", desc="Mu¯n h÷c khai khoáng xin tìm Ð°ng Hoá Kim, ông · phía sau ti®m binh khí, ¤n TAB chính là ch² viªt chæ \"Thiªt\" trên bän ð°", eventId=-1 },
	{ type=2, name="ÐÕi sß hái thu¯c", x=99, y=133, tip="Lßu Ký Nô ", desc="ÐÕi sß làm thu¯c Lßu Ký Nô · ti®m dßþc n¢m trên ðß¶ng l¾n phía Tây. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Ngß phu", x=103, y=157, tip="Møc TØ Lång ", desc="Ngß phu Møc TØ Lång · hß¾ng Nam ðß¶ng l¾n phía Tây, cÕnh tØu ðiªm. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß mÛ ngh®", x=207, y=195, tip="L² Minh Nguy®t ", desc="ÐÕi sß công ngh® L² Minh Nguy®t · phía sau Thß½ng Ph¯ . „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß may vá", x=240, y=171, tip="Hoàng Lång Ba ", desc="ÐÕi sß may vá Hoàng Lång Ba · hß¾ng Nam ðß¶ng l¾n phía Ðông. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß luy®n kim", x=216, y=109, tip="Quá Tam ChuÏ ", desc="ÐÕi sß lò rèn Quá Tam Chùy · phía sau ti®m binh khí. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß n¤u ån", x=117, y=157, tip="Ð² TØ Phi ", desc="ÐÕi sß n¤u nß¾ng Ð² TØ Phi · hß¾ng Nam ðß¶ng l¾n phía Tây. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ÐÕi sß chª duþc", x=99, y=128, tip="Phó Ðß½ng Quy ", desc="ÐÕi sß chª dßþc Phó Ðß½ng Quy · hß¾ng B¡c ðß¶ng l¾n phía Tây. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Trùng c¤u ph¯i phß½ng", x=141, y=133, tip="Ti¬u Cao", desc="#GMua lÕi ph¯i phß½ng: #Wdo nhæng sai sót vô tình khiªn nhæng thÑ ngß¶i ch½i ðã h÷c nhß#G Ph¯i phß½ng gia công nguyên li®u, bánh bao ph¯i phß½ng, s½/trung/cao c¤p loÕi thñc tài ph¯i phß½ng, Chï Xích Thiên Nhai ph¯i phß½ng#W m¤t ði, có th¬ ðªn #GTô Châu", eventId=-1 },
	{ type=2, name="Gi¾i thi®u gia công nguyên li®u", x=-1, y=-1, tip="Phùng Chú Thiªt", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x500046_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500046_g_Signpost do
		AddNumText(sceneId, x500046_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x500046_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500046_g_Signpost[GetNumText()]

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
