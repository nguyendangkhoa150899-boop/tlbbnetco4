--Mµ Dung NPC
--Mµ Dung Tùy phong 
--Bình thß¶ng 

x760300_g_ScriptId = 760300

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760300_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{XMPGG_160823_62}")
		AddNumText(sceneId, x760300_g_ScriptId,"H÷c t§p QuÖ c¯c khinh công",12,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760300_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText()==0	then
		
		if GetMenPai(sceneId, selfId) == 12 then
			if	HaveSkill(sceneId, selfId, 103)<0	then
				-- Kh¤u Ti«n 
				if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) <STUDY_MENPAI_QINGGONG_SPEND then
					BeginEvent(sceneId)
						AddText(sceneId,"Ngài Trên ngß¶i Ti«n m£t Không ðü 1#-15,B·i v§y Vô pháp H÷c t§p B±n môn Khinh công .")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
				end
				-- Kh¤u Ti«n 
				LuaFnCostMoneyWithPriority(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)
				
				AddSkill(sceneId, selfId, 103)
				DelSkill(sceneId, selfId, 34)
				BeginEvent(sceneId)
					AddText(sceneId,"Chúc m×ng Ngß½i H÷c ðßþc B±n môn Cüa Khinh công ,Hy v÷ng Vi B±n môn Cüa Phát dß½ng quang ðÕi Tiªp tøc n² lñc .")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ngß½i Không phäi Ðã H÷c xong MÕ ?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		elseif GetMenPai(sceneId, selfId) == 12 then
			BeginEvent(sceneId)
				AddText(sceneId,"H÷c t§p QuÖ c¯c khinh công Yêu c¥u Tiên Gia nh§p QuÖ C¯c Môn phái !")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i Không phäi B±n Môn phái Ð® tØ ,Ngã Là không th¬ Giáo Ngß½i QuÖ C¯c Cüa Khinh công")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end	
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760300_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760300_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760300_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760300_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760300_OnDie(sceneId, selfId, killerId)
end
