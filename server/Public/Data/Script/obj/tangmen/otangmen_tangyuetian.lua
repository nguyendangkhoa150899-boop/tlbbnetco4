--ÐÇËÞNPC
--ÕÆÃÅÈË
--¶¡´ºÇï
--ÆÕÍ¨

x017500_g_scriptId = 017500        
x017500_g_eventList={}

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x017500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Lão phu vçn cäm th¤y, trong võ lâm l¤y thß½ng b²ng l¦n ðánh nhau, th§t sñ là vô cùng tàn nhçn. Nªu dùng ðµc ðã thß½ng làm cho ngß¶i ta an nhàn, hÕnh phúc ðªn tØ vong thì th§t là t¯t")
		
		for i, eventId in x017500_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x017500_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x017500_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_XINGSU )
			return
		end
	end
end
