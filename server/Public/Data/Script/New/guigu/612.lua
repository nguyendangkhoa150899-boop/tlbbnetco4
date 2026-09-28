x760612_g_ScriptId = 760612

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760612_UpdateEventList(sceneId, selfId,targetId)
	if sceneId ~= 195 then
	BeginEvent(sceneId)
		local msg ="#{DG_8724_17}"
		AddText(sceneId,msg);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	else
	BeginEvent(sceneId)
		AddText(sceneId,"Ngß½i Tìm ta Có chuy®n gì A ?")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 and HaveXinFa(sceneId,selfId,97) <1 then 
			--AddNumText(sceneId, x760612_g_scriptId,"Gia nh§p môn phái",6,0)
		end
		AddNumText(sceneId, 44603,"H÷c t§p KÛ nång", 12, 10)
		AddNumText(sceneId, x760612_g_scriptId,"V« Tâm pháp Gi¾i thi®u",8,130)
		AddNumText(sceneId, x760612_g_scriptId,"#{JZBZ_081031_02}",8,160)		--Chï Lµ Ðªn KÛ nång H÷c t§p Nhân 
		for i, eventId in x760612_g_eventList do
			CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760612_OnDefaultEvent(sceneId, selfId,targetId)
	x760612_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760612_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText()==160 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{JZBZ_081031_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		--CallScriptFunction(SCENE_SCRIPT_ID,"AskTheWay", sceneId, selfId, sceneId, 98, 51,"Thôi Løc Hoa")
		return
	end


	if GetNumText()==10 then
		DispatchXinfaLevelInfo(sceneId, selfId, targetId, 9)
		return
	end

	if GetNumText()==0	then

		x760612_g_MenPai = GetMenPai(sceneId, selfId)
		if x760612_g_MenPai == 9 and HaveXinFa(sceneId,selfId,97)> 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i LÕi t¾i Tiêu khi¬n Vi sß ,Ngß½i Ðã là Ta ð® tØ ,Hoàn Bái Cái gì Sß Ni .")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x760612_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i Ðã là Môn phái khác Cüa Cao ð° R°i ,Chúng ta Không thu Ngß½i .")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId,"Hoan nghênh Ði vào Ðào hoa Ðäo")
			AddNumText(sceneId, x760612_g_scriptId,"Ngã Xác ð¸nh mu¯n Bái nh§p Ðào hoa Ðäo",6,3)
			AddNumText(sceneId, x760612_g_scriptId,"Ngã TÕm th¶i Còn không Tß·ng Bái nh§p Môn phái",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
		return
	end

	if GetNumText()==3	then
		if LuaFnGetPropertyBagSpace(sceneId, selfId) <2 then
			BeginEvent(sceneId)
				AddText(sceneId,"SØa sang lÕi mµt chút Ba lô ,C¥n phäi có Hai cái Ch² tr¯ng ,Ta s¨ Có Khen thß·ng Cho ngß½i !!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel(sceneId, selfId) <10 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i Vçn là ch¶ Ðªn c¤p 10 Lúc sau LÕi ðªn Bái sß H÷c ngh® Ba !!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x760612_g_MenPai = GetMenPai(sceneId, selfId)
		if x760612_g_MenPai == 9 and HaveXinFa(sceneId,selfId,97)> 0 then
				BeginEvent(sceneId)
					AddText(sceneId,"Ngß½i LÕi t¾i Tiêu khi¬n Vi sß ,Ngß½i Ðã là Ta ð® tØ ,Hoàn Bái Cái gì Sß Ni .")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--Phän h°i Giá tr¸ vì 9Tö vë Không Có Phái 
			elseif x760612_g_MenPai==9 and HaveXinFa(sceneId,selfId,97) <1 then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
				LuaFnJoinMenpai(sceneId, selfId, targetId, 9)
SetMissionData(sceneId,selfId,204,1)
				-- Thiªt trí M¾i b¡t ð¥u Cüa NpcQuan h® Tr¸ 
				CallScriptFunction(200099,"InitRelation", sceneId, selfId)
				
				-- Bä Tß½ng quan Tâm pháp Thiªt trí Vi c¤p 10 b§c  25,28,29
		LuaFnSetXinFaLevel(sceneId,selfId,97,1)
		LuaFnSetXinFaLevel(sceneId,selfId,98,1)
		LuaFnSetXinFaLevel(sceneId,selfId,99,1)
		LuaFnSetXinFaLevel(sceneId,selfId,100,1)
		LuaFnSetXinFaLevel(sceneId,selfId,101,1)
		LuaFnSetXinFaLevel(sceneId,selfId,102,1)
		LuaFnSetXinFaLevel(sceneId,selfId,103,1)
		LuaFnSetXinFaLevel(sceneId,selfId,104,1)
				
		AddSkill(sceneId, selfId, 760)
		AddSkill(sceneId, selfId, 761)
		AddSkill(sceneId, selfId, 762)
		AddSkill(sceneId, selfId, 763)
		AddSkill(sceneId, selfId, 764)
		AddSkill(sceneId, selfId, 765)
		AddSkill(sceneId, selfId, 766)
		AddSkill(sceneId, selfId, 767)
		AddSkill(sceneId, selfId, 768)
		AddSkill(sceneId, selfId, 769)
		AddSkill(sceneId, selfId, 770)
		AddSkill(sceneId, selfId, 771)
		AddSkill(sceneId, selfId, 772)
		AddSkill(sceneId, selfId, 773)
		AddSkill(sceneId, selfId, 774)
		AddSkill(sceneId, selfId, 775)
		AddSkill(sceneId, selfId, 776)
		AddSkill(sceneId, selfId, 777)
		AddSkill(sceneId, selfId, 778)
		AddSkill(sceneId, selfId, 779)
		AddSkill(sceneId, selfId, 780)
				--C¤p Ngß¶i ch½i G·i thß tín,Nói cho h¡n Ðªn n½i nào Ðä Quái,Nhß thª nào Kiªm ti«n 
				LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId),"#{LevelMail_menpai_4}")
				--LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId),"#{OBJ_emei_0001}")
				
				--Môn phái Khen thß·ng Tri®u t§p l®nh 
				for i=1, 20 do
					TryRecieveItem(sceneId, selfId, 30501001, 1)
				end
				x760612_MsgBox(sceneId, selfId,"Ðßþc ðªn 20Mai Môn phái tri®u t§p l®nh .")
				
				if TryRecieveItem(sceneId, selfId, 10553190, 1)>= 0 then
					str		="#YNgß½i ÐÕt ðßþc"..GetItemName(sceneId, 10553190).."."
					x760612_MsgBox(sceneId, selfId, str)
				end

				if	LuaFnGetSex(sceneId, selfId)==0	then
					LuaFnMsg2Player(sceneId, selfId,"Ngß½i Ðã Gia nh§p Ðào hoa Ðäo !!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
					CallScriptFunction(226900,"OnDefaultEvent",sceneId, selfId, targetId)
				else
					LuaFnMsg2Player(sceneId, selfId,"Ngß½i Ðã Gia nh§p Ðào hoa Ðäo !!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
					CallScriptFunction(226900,"OnDefaultEvent",sceneId, selfId, targetId)
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ngß½i Ðã là Môn phái khác Cüa Cao ð° R°i ,Chúng ta Không thu Ngß½i .")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==130	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_xinfajieshao_001}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else	
	

		for i, findId in x760612_g_eventList do
			if eventId == findId then
				CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, MP_EMEI)
				return
			end
		end
	end
	--Chï Lµ 
	if GetNumText()==140 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{JZBZ_081031_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		--CallScriptFunction(SCENE_SCRIPT_ID,"AskTheWay", sceneId, selfId, sceneId, 98, 51,"Thôi Løc Hoa")
		return
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760612_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760612_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction(missionScriptId,"CheckAccept", sceneId, selfId)
			if ret> 0 then
				CallScriptFunction(missionScriptId,"OnAccept", sceneId, selfId)
			end
			return
		end
	end
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760612_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760612_g_eventList do
		if missionScriptId == findId then
			x760612_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760612_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760612_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760612_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760612_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760612_OnDie(sceneId, selfId, killerId)
end

--**********************************
--Tin tÑc Ð« kÏ 
--**********************************
function x760612_MsgBox(sceneId, selfId, str)
	Msg2Player(sceneId, selfId, str, MSG2PLAYER_PARA)
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
