--ÐÇËÞ
--ÎÊÂ·½Å±¾
x700000_g_scriptId = 700000

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x700000_g_Signpost = {
	{ type=2, name="°Bái kiªn Chß·ng Môn", x=66, y=29, tip="Chß·ng Môn", desc="#{XMPTM_130123_81}", eventId=-1 },
	{ type=2, name="Gia Nh§p Ðß¶ng Môn", x=78, y=35, tip="Ðß¶ng cûng phong", desc="#{XMPTM_130123_84}", eventId=-1 },
	{ type=2, name="H÷c kÛ nång chiªn ð¤u Ðß¶ng Môn", x=38, y=75, tip="Ðß¶ng nhÕc hß¾ng", desc="#{XMPTM_130123_87}", eventId=-1 },
	{ type=2, name="H÷c kÛ nång s¯ng ðß¶ng môn", x=40, y=142, tip="Ðß¶ng môn bà ngoÕi", desc="#{XMPTM_130123_90}", eventId=-1 },
	{ type=2, name="H÷c kÛ nång phø trþ", x=41, y=140, tip="Ðß¶ng nhßþc h«", desc="#{XMPTM_130123_93}", eventId=-1 },
	{ type=2, name="Mua t÷a kÜ", x=170, y=32, tip="Ðß¶ng chØ c½", desc="#{XMPTM_130123_96}", eventId=-1 },
	{ type=2, name="Nhi®m vø", x=100, y=64, tip="Ðß¶ng thanh thu", desc="#{XMPTM_130123_99}", eventId=-1 },
	{ type=2, name="truy«n t¯ng", x=126, y=68, tip="ß¶ng dß thành", desc="#{XMPTM_130123_102}", eventId=-1 },
	{ type=2, name="Di­n võ trß¶ng", x=152, y=154, tip="Ðß¶ng mµ tß¶ng", desc="#{XMPTM_130123_105}", eventId=-1 },
	{ type=2, name="H÷c Kinh công", x=88, y=111, tip="Ðß¶ng xuân", desc="#{XMPTM_130123_108}", eventId=-1 },
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x700000_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x700000_g_Signpost do
		AddNumText(sceneId, x700000_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x700000_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x700000_g_Signpost[GetNumText()]

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
