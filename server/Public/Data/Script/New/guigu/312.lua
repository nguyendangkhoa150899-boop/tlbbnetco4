--Tinh Túc 
--Höi ðß¶ng K¸ch bän g¯c 
x760312_g_scriptId = 760312

-- Höi ðß¶ng LoÕi hình type: 1 Vi Nh¸ c¤p Thñc ð½n, 2 Vi Trñc tiªp höi Lµ 
x760312_g_Signpost = {
	{ type=2, name="Bái kiªn Chß·ng môn nhân", x=96, y=52, tip="Vß½ng Hü Chi", desc="#{WHOATN_12103126_01}", eventId=-1 },
	{ type=2, name="Gia nh§p QuÖ C¯c", x=99, y=56, tip="Vß½ng Thi«n Nh¤t", desc="#{WHOATN_12103127_01}", eventId=-1 },
	{ type=2, name="H÷c t§p QuÖ C¯c Chiªn ð¤u KÛ nång", x=92, y=55, tip="Lý kª Long", desc="#{WHOATN_12103113_01}", eventId=-1 },
	{ type=2, name="H÷c t§p QuÖ C¯c Sinh hoÕt KÛ nång", x=50, y=63, tip="Trß½ng Di", desc="#{WHOATN_12103128_01}", eventId=-1 },
	{ type=2, name="H÷c t§p QuÖ C¯c Sinh hoÕt Phø trþ KÛ nång", x=41, y=140, tip="Ti¬u tiên Nhi", desc="#{WHOATN_12103129_01}", eventId=-1 },
	{ type=2, name="Mua s¡m T÷a kÜ", x=170, y=32, tip="Tô C¥m", desc="#{WHOATN_12103130_01}", eventId=-1 },
	{ type=2, name="QuÖ C¯c Nhi®m vø", x=100, y=64, tip="Vß½ng Huy«n Phong", desc="#{WHOATN_12103131_01}", eventId=-1 },
	{ type=2, name="QuÖ C¯c Truy«n t¯ng Nhân", x=126, y=68, tip="CØu Ngày Thông", desc="#{WHOATN_12103132_01}", eventId=-1 },
	{ type=2, name="Âm dß½ng Thiên", x=152, y=154, tip="Lý kª Long", desc="#{WHOATN_12103133_01}", eventId=-1 },
	{ type=2, name="H÷c t§p QuÖ c¯c khinh công", x=88, y=111, tip="Ngô Bành", desc="#{WHOATN_12103134_01}", eventId=-1 },
}

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760312_OnEnumerate(sceneId, selfId, targetId)
	for i, signpost in x760312_g_Signpost do
		AddNumText(sceneId, x760312_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760312_OnDefaultEvent(sceneId, selfId, targetId)
	signpost = x760312_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name..":")
			CallScriptFunction(signpost.eventId,"OnEnumerate", sceneId, selfId, targetId)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction(SCENE_SCRIPT_ID,"AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip)

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
