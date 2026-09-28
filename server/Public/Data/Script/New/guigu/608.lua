--Tinh Túc 
--Höi ðß¶ng K¸ch bän g¯c 
x760608_g_scriptId = 760608

-- Höi ðß¶ng LoÕi hình type: 1 Vi Nh¸ c¤p Thñc ð½n, 2 Vi Trñc tiªp höi Lµ 
x760608_g_Signpost = {
	{ type=2, name="Bái kiªn Chß·ng môn nhân", x=160, y=51, tip="ch¦m mµng quy", desc="#{THD_190613_31}", eventId=-1 },
	{ type=2, name="Gia nh§p Ðào hoa Ðäo", x=207, y=72, tip="quân hoàn châu", desc="#{THD_190613_33}", eventId=-1 },
	{ type=2, name="H÷c t§p Ðào hoa Ðäo Chiªn ð¤u KÛ nång", x=207, y=66, tip="yªn phän", desc="#{THD_190613_35}", eventId=-1 },
	{ type=2, name="H÷c t§p Ðào hoa Ðäo Sinh hoÕt KÛ nång", x=105, y=73, tip="túc h°i chi", desc="#{THD_190613_37}", eventId=-1 },
	{ type=2, name="H÷c t§p Ðào hoa Ðäo Sinh hoÕt Phø trþ KÛ nång", x=108, y=71, tip="lâm hÕ phong", desc="#{THD_190613_39}", eventId=-1 },
	{ type=2, name="Mua s¡m T÷a kÜ", x=103, y=138, tip="hoàng trí tri", desc="#{THD_190613_41}", eventId=-1 },
	{ type=2, name="Ðào hoa Ðäo Nhi®m vø", x=160, y=72, tip="tiêu thanh yªt", desc="#{THD_190613_43}", eventId=-1 },
	{ type=2, name="Ðào hoa Ðäo Truy«n t¯ng Nhân", x=256, y=169, tip="ðào ân", desc="#{THD_190613_45}", eventId=-1 },
	--{ type=2, name="Âm dß½ng Thiên", x=152, y=154, tip="Lý kª Long", desc="#{WHOATN_12103133_01}", eventId=-1 },
	{ type=2, name="H÷c t§p Ðào hoa Ðäo Khinh công", x=207, y=78, tip="tÕ xuân hàn", desc="#{THD_190613_49}", eventId=-1 },
}

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760608_OnEnumerate(sceneId, selfId, targetId)
	for i, signpost in x760608_g_Signpost do
		AddNumText(sceneId, x760608_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760608_OnDefaultEvent(sceneId, selfId, targetId)
	signpost = x760608_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name.."#")
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
