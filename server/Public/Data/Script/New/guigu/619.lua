--Biên NÕp Thu§t KÛ nång H÷c t§p 

--K¸ch bän g¯c Hào 
x760619_g_ScriptId = 760619

--ThØ npcCó th¬ Lên t¾i Cüa T¯i cao c¤p b§c 
x760619_g_nMaxLevel = 5

--H÷c t§p Giao di®n Yªu L¶i nói 
x760619_g_MessageStudy ="Nªu Ngß½i ÐÕt t¾i C¤p %d H½n næa KhÆng Tiêu phí #{_EXCHG%d} Li«n có th¬ H÷c ðßþc Truy nguyên Chi thu§t KÛ nång .Ngß½i Quyªt ð¸nh H÷c t§p Ma ?"


--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760619_OnDefaultEvent(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId)
	--Ngß¶i ch½i KÛ nång Cüa C¤p b§c 
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIDU)
	--Ngß¶i ch½i Biên NÕp Thu§t KÛ nång Cüa Thu¥n thøc ðµ 
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIDU)
	--Nhi®m vø Phán ðoán 

	--Phán ðoán Hay không là Ðß¶ng Môn Phái Ð® tØ,Không phäi Ðß¶ng môn ð® tØ Không th¬ H÷c t§p 
		if GetMenPai(sceneId,selfId) ~=9 then
			BeginEvent(sceneId)
    		AddText(sceneId,"Ngß½i Không phäi B±n phái Ð® tØ ,Ngã Không th¬ Giáo Ngß½i .");
    	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Phán ðoán Hay không Ðã H÷c xong Biên NÕp Thu§t,Nªu H÷c xong,T¡c Ð« kÏ Ðã H÷c xong 
	if AbilityLevel>= 1 then
		BeginEvent(sceneId)
    	AddText(sceneId,"Ngß½i Ðã H÷c ðßþc Ðào hoa Ðäo Truy nguyên Chi thu§t KÛ nång");
    	EndEvent(sceneId)
    DispatchMissionTips(sceneId,selfId)
		return
	end

	--Nªu Ði¬m ðánh Chính là "H÷c t§p KÛ nång "#TÑc Tham s¯ =0#
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x760619_g_MessageStudy)
			local addText = format(x760619_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--Xác ð¸nh H÷c t§p Cái nút 
					AddNumText(sceneId,x760619_g_ScriptId,"Ngã Xác ð¸nh mu¯n H÷c t§p", 6, 2)
			--Hüy bö H÷c t§p Cái nút 
					AddNumText(sceneId,x760619_g_ScriptId,"Ta chï Th¸ Ðªn xem", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Nªu Ði¬m ðánh Chính là "Ngã Xác ð¸nh mu¯n H÷c t§p "
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			--Ki¬m tra Ngß¶i ch½i Hay không Có Mµt ð°ng bÕc Cüa Ti«n m£t 
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) <demandMoney then			
				BeginEvent(sceneId)
					AddText(sceneId,"Ngß½i Ti«n vàng Không ðü");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--Ki¬m tra Ngß¶i ch½i C¤p b§c là Phü ÐÕt t¾i Yêu c¥u 
			if GetLevel(sceneId,selfId) <limitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"Ngß½i c¤p b§c Không ðü");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--C¡t bö Ti«n vàng 
			LuaFnCostMoneyWithPriority(sceneId,selfId,demandMoney)
			--KÛ nång Tång lên t¾i 1
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_ZHIDU,10)
			--TÕi npcNói chuy®n phiªm cØa s± Thông tri Ngß¶i ch½i Ðã H÷c xong 
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i H÷c xong Ðào hoa Ðäo Truy nguyên Chi thu§t KÛ nång")
			EndEvent()
			DispatchEventList(sceneId,selfId,targetId)
		end
	else --Nªu Ði¬m ðánh "Ta chï Th¸ Ðªn xem "
		CallScriptFunction(g_Npc_ScriptId,"OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760619_OnEnumerate(sceneId, selfId, targetId)
		--Nªu Không ðªn C¤p b§c T¡c Không hi®n KÏ Tuy¬n HÕng 
		--if GetLevel(sceneId,selfId)>= 10 then
			AddNumText(sceneId,x760619_g_ScriptId,"H÷c t§p Truy nguyên Chi thu§t Ph¯i phß½ng", 12, 0)
		--end
		return
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760619_CheckAccept(sceneId, selfId)
end

--**********************************
--Tiªp thu 
--**********************************
function x760619_OnAccept(sceneId, selfId, ABILITY_CAIKUANG)
end
