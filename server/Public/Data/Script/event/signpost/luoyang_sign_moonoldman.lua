-- ÂåÑô
--ÔÂÏÂÀÏÈË
--ÎÊÂ·½Å±¾
x500007_g_scriptId = 500007

-- ÎÊÂ·ÀàĞÍ type: 1 Îª¶ş¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500007_g_Signpost = {
	{ type=2, name="Nguy®t lão lão nhân", x=46, y=62, tip="Nguy®t Lão", desc="Nguy®t lão lão nhân · góc Tây B¡c trong thành LÕc Dß½ng. mu¯n ngß¶i m¾i t± chÑc hôn l­, cÑ tìm ông. „n phím TAB, trên bän ğ° có kı hi®u nh¤p nháy", eventId=-1 },
}

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x500007_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500007_g_Signpost do
		AddNumText(sceneId, x500007_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x500007_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500007_g_Signpost[GetNumText()]

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
