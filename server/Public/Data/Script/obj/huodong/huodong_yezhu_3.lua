-- 402104
-- ³¡¾°ÖĞ»î¶¯¿ªÊ¼ºóË¢³öÀ´µÄNpc

-- 
x402104_g_scriptId = 402104

--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x402104_g_eventList={402105}

--**********************************
--ÊÂ¼şÁĞ±í
--**********************************
function x402104_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ğáng gi§n dã trß vß½ng ğào t¦u! Không biªt các ngß½i có hay không mµt ít manh m¾i có th¬ tìm ğßşc dã trß vß½ng?")
		for i, eventId in x402104_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x402104_OnDefaultEvent( sceneId, selfId,targetId )
	x402104_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x402104_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402104_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
