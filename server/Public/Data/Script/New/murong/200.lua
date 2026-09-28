--ÐÇËÞ
--ÎÊÂ·½Å±¾
x760100_g_scriptId = 760100

-- ÎÊÂ·ÀàÐÍ type: 1 Îª¶þ¼¶²Ëµ¥, 2 ÎªÖ±½ÓÎÊÂ·
x760100_g_Signpost = {
	{ type=2, name= "Bái kiªn chß·ng môn", x=68, y=108, tip= "Mµ Dung rû", desc= "#{GUSU_MENPAI_14}", eventId=-1 },
	{ type=2, name= "Gia nh§p Mµ Dung", x=48, y=144, tip= "Mµ Dung ki®t", desc= "#{GUSU_MENPAI_15}", eventId=-1 },
	{ type=2, name= "H÷c t§p Mµ Dung chiªn ð¤u kÛ nång", x=48, y=134, tip= "Mµ Dung thanh s½n", desc= "#{GUSU_MENPAI_16}", eventId=-1 },
	{ type=2, name= "H÷c t§p Mµ Dung sinh hoÕt kÛ nång", x=127, y=30, tip= "Vß½ng t¸ch hÕo", desc= "#{GUSU_MENPAI_17}", eventId=-1 },
	{ type=2, name= "H÷c t§p Mµ Dung phø trþ kÛ nång", x=132, y=31, tip= "Vß½ng chi lâm", desc= "#{GUSU_MENPAI_18}", eventId=-1 },
	{ type=2, name= "Mua s¡m t÷a kÜ", x=25, y=166, tip= "Phong ngàn d£m", desc= "#{GUSU_MENPAI_19}", eventId=-1 },
	{ type=2, name= "Mµ Dung nhi®m vø", x=69, y=125, tip= "Mµ Dung th¡ng", desc= "#{GUSU_MENPAI_20}", eventId=-1 },
	{ type=2, name= "Mµ Dung truy«n t¯ng ngß¶i", x=27, y=137, tip= "Ð£ng vÕn nh§n", desc= "#{GUSU_MENPAI_21}", eventId=-1 },
	{ type=2, name= "Tàng thß Thüy Các", x=159, y=163, tip= "Công dã Khôn", desc= "#{GUSU_MENPAI_22}", eventId=-1 },
	{ type=2, name= "H÷c t§p Mµ Dung khinh công", x=45, y=23, tip= "Mµ Dung theo gió", desc= "#{GUSU_MENPAI_23}", eventId=-1 },
}

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x760100_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x760100_g_Signpost do
		AddNumText(sceneId, x760100_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x760100_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x760100_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ":")
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
