--ÑÎºþNPC
--ÑîÔª

x041504_g_ScriptId	= 041504

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x041504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_001}" )
		--AddNumText(sceneId, x041504_g_scriptId,"#{YANHU_20070924_002}", 9, 1)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x041504_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	arg	= GetNumText()
	if arg == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 26, 180,161 )
		return
	end
end
