--Ê¥»ð´«µÝNPC - ´«ËÍ

x050107_g_ScriptId = 050107; --½Å±¾ºÅ
x050107_g_name	="Châu Vô Úy";

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x050107_g_eventId_yes = 0;
x050107_g_eventId_no = 1;

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x050107_OnDefaultEvent( sceneId, selfId, targetId )
	x050107_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x050107_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "Ta có th¬ ðßa ngß½i ra ngoài, ngß½i có ch¡c mu¯n ði không?" );
		AddNumText( sceneId, x050107_g_ScriptId, "Duy®t", 9, x050107_g_eventId_yes);
		AddNumText( sceneId, x050107_g_ScriptId, "Hüy", 8, x050107_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x050107_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId then
		if selectEventId == x050107_g_eventId_yes then
			NewWorld( sceneId, selfId, 18, 244, 75) ;
		else
			return 0;
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x050107_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x050107_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
