-- ´óÀí
--³ÇÃÅ
--ÎÊÂ·½Å±¾
x500045_g_scriptId = 500045

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500045_g_Signpost = {
	{ type=2, name="Nam Môn", x=160, y=257, tip="Nam Môn", desc="Nam Môn n¯i li«n Nhî Häi, nªu chßa t¾i c¤p 25, ð×ng nên ði t¾i ðó", eventId=-1 },
	{ type=2, name="Ðông Môn", x=288, y=152, tip="Ðông Môn", desc="Ðông Môn n¯i li«n Vô Lßþng S½n, ngß¶i ch½i dß¾i c¤p 10 có th¬ t¾i ðây", eventId=-1 },
	{ type=2, name="Tây Môn", x=31, y=151, tip="Tây Môn", desc="Tây Môn n¯i li«n Kiªm Các, ngß¶i ch½i dß¾i c¤p 10 có th¬ t¾i ðây", eventId=-1 },
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x500045_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500045_g_Signpost do
		AddNumText(sceneId, x500045_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x500045_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500045_g_Signpost[GetNumText()]

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
