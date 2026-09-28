x000155_g_ScriptId = 000155

function x000155_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"#{ZBDW_091105_1}")
		AddText(sceneId, "#YChï có #cFF0000Trang b¸ chª 7x + 8x + 9x + Ám khí + Võ H°n + Th¥n binh häi vñc #Gm¾i có th¬ ðiêu vån#rBách Bäo , Long Vån , Võ H°n K th¬ ðiêu vån!")
		AddNumText(sceneId,x000155_g_ScriptId,"#{ZBDW_XML_1}",6,1) --hop thanh dieu van
		AddNumText(sceneId,x000155_g_ScriptId,"#{ZBDW_XML_2}",6,2) --dieu van thuc khac
		AddNumText(sceneId,x000155_g_ScriptId,"#{ZBDW_XML_3}",6,3) --cuong hoa dieu van
		AddNumText(sceneId,x000155_g_ScriptId,"#{ZBDW_XML_4}",6,4) --thao dieu van
		AddNumText(sceneId,x000155_g_ScriptId,"#{ZBDW_XML_6}",11,9) --ve dieu van
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000155_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 1 then  --hop thanh dieu van
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		UICommand_AddInt( sceneId, selfId )
		DispatchUICommand(sceneId,selfId, 1000156)
	elseif GetNumText() == 2 then  --dieu van thuc khac
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		UICommand_AddInt( sceneId, selfId )
		DispatchUICommand(sceneId,selfId, 2000156)
	elseif GetNumText() == 3 then  -- cuong hoa dieu van
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		UICommand_AddInt( sceneId, selfId )
		DispatchUICommand(sceneId,selfId, 3000156)
	elseif GetNumText() == 4 then  -- thao dieu van
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		UICommand_AddInt( sceneId, selfId )
		DispatchUICommand(sceneId,selfId, 4000156)
	elseif GetNumText() == 9 then  -- Gi¾i thi®u dieu van
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZBDW_091105_21}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end		

