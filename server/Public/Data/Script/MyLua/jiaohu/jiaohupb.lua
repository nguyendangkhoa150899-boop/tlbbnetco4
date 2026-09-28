--K¸ch bän g¯c Hào 
x044801_g_ScriptId = 044801


--S· có ðßþc Sñ ki®n IDDanh sách 
x044801_g_eventList={894000}
--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x044801_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId," Vân Thâm Bích lÕc Ký Tham Loan.#r  C§n Vån CØu Lê Dß nghi®t Phóng túng H÷a loÕn , Ý Thü Phßþng minh Ngû hành Cån nguyên.#r  Ðª Thành H§u nhân Thü #GTam Th¥n Äo giác #WTr¤n thü TÕi ðây , Phßþng minh Cüa Bát phß½ng Vân nghê Li«n t×  Lai Thü.")
		AddNumText(sceneId, x044801_g_ScriptId,"V« Tam Th¥n Äo cänh", 11, 300)		
		for i, eventId in x044801_g_eventList do
			CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x044801_OnDefaultEvent(sceneId, selfId,targetId)
	x044801_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x044801_OnEventRequest(sceneId, selfId, targetId, eventId)



    if LuaFnGetPropertyBagSpace(sceneId, selfId) <5 then
      x044801_NotifyTip(sceneId, selfId,"Tay näi c¥n 5 ô tr¯ng")
	 return	
    end

	if GetNumText() == 300 then
       	BeginEvent(sceneId)
	 AddText(sceneId,"#{GXHDZ_141121_103}")
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	
		return
	end


	for i, findId in x044801_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x044801_g_ScriptId)
		return
		end
	end
end

--**********************************
--B¡t m¡t Ð« kÏ 
--**********************************
function x044801_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
