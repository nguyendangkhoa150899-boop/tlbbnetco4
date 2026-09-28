--ÐÇËÞNPC
--³ö³¾×Ó
--ÆÕÍ¨

--½Å±¾ºÅ
x017505_g_ScriptId = 017505

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x017505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ta có th¬ truy«n thø cho ngß½i b±n phái ðµc môn kinh công, c¥n hao phí 1#-15")
		AddNumText(sceneId, x017505_g_ScriptId, "H÷c t§p Ðß¶ng Môn kinh công",12,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x017505_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		
		if GetMenPai(sceneId, selfId) == 11 then
			if	HaveSkill( sceneId, selfId, 817)<0	then
				-- ¼ì²éÇ®
				if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < STUDY_MENPAI_QINGGONG_SPEND  then
					BeginEvent(sceneId)
						AddText(sceneId,"Ngân lßþng trên ngß¶i ngß½i không ðü, không th¬ h÷c !")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
				end
				-- ¿ÛÇ®
				LuaFnCostMoneyWithPriority(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)

				AddSkill( sceneId, selfId, 817 )
				DelSkill( sceneId, selfId, 34 )
				BeginEvent(sceneId)
					AddText(sceneId,"Chúc m×ng các hÕ h÷c ðßþc b±n môn kinh công !")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"ChÆng phäi ngß½i ðã h÷c r°i sao?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		elseif GetMenPai(sceneId, selfId) == 11 then
			BeginEvent(sceneId)
				AddText(sceneId,"H÷c khinh công Ðß¶ng Môn trß¾c tiên c¥n gia nh§p phái Ðß¶ng Môn!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i không phäi là ð® tØ cüa b±n bang, ta không th¬ dÕy ngß½i khinh công cüa Ðß¶ng Môn")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end	
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x017505_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x017505_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x017505_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x017505_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x017505_OnDie( sceneId, selfId, killerId )
end
