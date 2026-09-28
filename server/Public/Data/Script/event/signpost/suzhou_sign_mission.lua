-- ËÕÖÝ
--Ñ­»·ÈÎÎñ
--ÎÊÂ·½Å±¾
x500024_g_scriptId = 500024

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x500024_g_Signpost = {
	{ type=2, name="Tô Châu Tào v§n sÑ", x=234, y=78, tip="Løc Sî Tranh", desc="Tô Châu Tào v§n SÑ Løc Sî Tranh (234, 78) · bên cÕnh bªn phía Ðông B¡c thành Tô Châu. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="ThuÖ lao", x=243, y=215, tip="Hô Diên Báo", desc="Hô Diên Báo (243, 215) · trß¾c phü nha Thành Ðông Nam, tìm t¾i ông có th¬ Nh§n nhi®m vø bình phän loÕn thuÖ trÕi. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Nhi®m vø tr× hung", x=127, y=133, tip="Ngô Gi¾i", desc="T±ng b± ð¥u Tô Châu Vß½ng Gi¾i [127,133] · ðß¶ng Phøng Ki«u, ông ðang tìm ngß¶i giúp ông tr×ng tr¸ hung ð°, có khä nång l¤y ðßþc bän ð° Bäo ThÕch. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Ván c¶", x=174, y=147, tip="Trß½ng D¸ch Qu¯c", desc="KÏ cuµc hoÕt ðµng sÑ Trß½ng D¸ch Qu¯c [174,147] · TrÕng Nguyên Trß¶ng. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Hoa S½n lu§n kiªm", x=194, y=139, tip="Tô Kiªm Lînh", desc="Lu§n kiªm sÑ Hoa S½n Tô Kiªm Lînh (194, 139) · TrÕng Nguyên Trß¶ng. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
	{ type=2, name="Liên hoàn phó bän", x=62, y=162, tip="Ti«n H°ng Vû", desc="Hi®u úy Tô Châu Ti«n H°ng Vû (62, 162) · ngoài Ðông Môn thành Tô Châu, có th¬ tìm ông lãnh nhi®m vø phø bän liên hoàn. „n phím TAB, trên bän ð° có ký hi®u nh¤p nháy", eventId=-1 },
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x500024_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500024_g_Signpost do
		AddNumText(sceneId, x500024_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x500024_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500024_g_Signpost[GetNumText()]

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
