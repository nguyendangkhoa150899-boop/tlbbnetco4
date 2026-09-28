--Â¥À¼NPC....
--çÎç¿·å½ÓÒýÊ¹....

--½Å±¾ºÅ
x001159_g_ScriptId = 001159


--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x001159_g_eventList={402276,402263,402305}--402289

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x001159_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#GPhiêu Mi­u Phong#W là n½i vô cùng nguy hi¬m nhßng nªu nhß v¸ anh hùng nào ðó ðánh bÕi #GLý Thu Thüy#W, s¨ nh§n ðßþc r¤t nhi«u v§t ph¦m cao c¤p ðó. C¯ lên...")
		--AddText(sceneId,"#ef12345#Y  #115 Phø bän này chï có Cao C¤p Hþp Thành Phù, ngày ði 3 l¥n.")

		for i, eventId in x001159_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x001159_OnDefaultEvent( sceneId, selfId,targetId )
	x001159_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001159_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001159_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001159_g_ScriptId )
		return
		end
	end
end
