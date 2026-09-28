--Mµ Dung NPC
--Mµ Dung Tùy phong 
--Bình thß¶ng 

x760627_g_ScriptId = 760627

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760627_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{THD_190613_103}")
		AddNumText(sceneId, x760627_g_ScriptId,"Lînh Giao Nhân Y",12,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760627_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText()==0	then
				if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) <STUDY_MENPAI_QINGGONG_SPEND then
					BeginEvent(sceneId)
						AddText(sceneId,"Ngài Trên ngß¶i Ti«n m£t Không ðü 1#-15,B·i v§y không th¬ Lînh Giao Nhân Y .")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
				end
				-- Kh¤u Ti«n 
				LuaFnCostMoneyWithPriority(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)
				
    TryRecieveItem(sceneId, selfId, 38004033, 1)
				BeginEvent(sceneId)
					AddText(sceneId,"#{THD_190613_132}")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
	end	
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760627_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760627_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760627_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760627_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760627_OnDie(sceneId, selfId, killerId)
end
