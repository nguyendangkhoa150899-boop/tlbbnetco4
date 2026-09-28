-- ÂåÑô
--Ñ­»·ÈÎÎñÓë¸±±¾
--ÎÊÂ·½Å±¾
x500006_g_scriptId = 500006

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500006_g_Signpost = {
	{ type=2, name="LÕc Dß½ng Tào v§n sÑ", x=228, y=175, tip="Tri®u Minh Thành", desc="LÕc Dß½ng Tào v§n SÑ Tri®u Minh Thành [227,177]. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Trân Long kÏ cuµc", x=271, y=88, tip="Vß½ng Tích Tân", desc="Tìm t¾i KÏ Thánh Vß½ng Tích Tân · vß½ng phü nµi phía Ðông B¡c thành LÕc Dß½ng (271, 88) . „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x500006_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500006_g_Signpost do
		AddNumText(sceneId, x500006_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x500006_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500006_g_Signpost[GetNumText()]

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
