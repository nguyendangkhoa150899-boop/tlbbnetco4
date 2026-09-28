--Câu cá KÛ nång H÷c t§p 

--K¸ch bän g¯c Hào 
x760446_g_ScriptId = 760446

--H÷c t§p Giao di®n Yªu L¶i nói 
x760446_g_MessageStudy ="Nªu Ngß½i ÐÕt t¾i %dC¤p H½n næa KhÆng Tiêu phí #{_EXCHG%d}Li«n có th¬ H÷c ðßþc Câu cá KÛ nång .Ngß½i Quyªt ð¸nh H÷c t§p Ma ?"

--KÛ nång Ðánh s¯ 
x760446_g_AbilityID = ABILITY_DIAOYU

--KÛ nång Tên 
x760446_g_AbilityName ="Câu cá"

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760446_OnDefaultEvent(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	--Ngß¶i ch½i KÛ nång Cüa C¤p b§c 
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x760446_g_AbilityID)
	--Ngß¶i ch½i Gia công KÛ nång Cüa Thu¥n thøc ðµ 
	ExpPoint = GetAbilityExp(sceneId, selfId, x760446_g_AbilityID)
	--Nhi®m vø Phán ðoán 

	--Phán ðoán Hay không Ðã H÷c xong Câu cá,Nªu H÷c xong,T¡c Ð« kÏ Ðã H÷c xong 
	if AbilityLevel>= 1 then
		BeginEvent(sceneId)
    	AddText(sceneId,"Ngß½i Ðã H÷c ðßþc"..x760446_g_AbilityName.."KÛ nång");
    	EndEvent(sceneId)
    DispatchMissionTips(sceneId,selfId)
		return
	end

	--TÕi Trong thành th¸ H÷c t§p Cái này kÛ nång 
	if bid then
		x760446_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end
	
	--Nªu Ði¬m ðánh Chính là "H÷c t§p KÛ nång "(TÑc Tham s¯ =0)
	if ButtomNum == 0 then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_DIAOYU, 1);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			local addText = format(x760446_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId, addText)
			--Xác ð¸nh H÷c t§p Cái nút 
					AddNumText(sceneId,x760446_g_ScriptId,"Ngã Xác ð¸nh mu¯n H÷c t§p", 6, 2)
			--Hüy bö H÷c t§p Cái nút 
					AddNumText(sceneId,x760446_g_ScriptId,"Ta chï Th¸ Ðªn xem", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Nªu Ði¬m ðánh Chính là "Ngã Xác ð¸nh mu¯n H÷c t§p "
	--Ki¬m tra Ngß¶i ch½i Hay không Có Mµt ð°ng bÕc Cüa Ti«n m£t 
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_DIAOYU, 1);
		if ret and ret == 1 then
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
			LuaFnCostMoneyWithPriority(sceneId, selfId, demandMoney)
			--KÛ nång Tång lên t¾i 1
			SetHumanAbilityLevel(sceneId,selfId,x760446_g_AbilityID,10)
			--TÕi npcNói chuy®n phiªm cØa s± Thông tri Ngß¶i ch½i Ðã H÷c xong 
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i H÷c xong"..x760446_g_AbilityName.."KÛ nång")
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
function x760446_OnEnumerate(sceneId, selfId, targetId, bid)
		if bid then
			local ret = CallScriptFunction(CITY_BUILDING_ABILITY_SCRIPT,"OnCityCheck",sceneId, selfId, x760446_g_AbilityID, bid, 5)
			if ret> 0 then AddNumText(sceneId,x760446_g_ScriptId,"H÷c t§p"..x760446_g_AbilityName.."KÛ nång", 12, 0) end
			return
		end
		--Nªu Không ðªn C¤p b§c T¡c Không hi®n KÏ Tuy¬n HÕng 
		--if GetLevel(sceneId,selfId)>= LEVELUP_ABILITY_DIAOYU[1].HumanLevelLimit then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_DIAOYU, 1);
		--if ret and ret == 1 and GetLevel(sceneId,selfId)>= limitLevel then
		if ret and ret == 1 then
			AddNumText(sceneId,x760446_g_ScriptId,"H÷c t§p"..x760446_g_AbilityName.."KÛ nång", 12, 0)
		end
		return
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760446_CheckAccept(sceneId, selfId)
end

--**********************************
--Tiªp thu 
--**********************************
function x760446_OnAccept(sceneId, selfId, x760446_g_AbilityID)
end

--TÕi Trong thành th¸ H÷c t§p Cuµc ð¶i này HoÕt KÛ nång Th¶i Yêu c¥u Ch¤p hành Cüa Hàm s¯ 
function x760446_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--Ki¬m tra Thành th¸ là Phü — vào Ðê Giæ gìn TrÕng thái 
			if CallScriptFunction(CITY_BUILDING_ABILITY_SCRIPT,"CheckCityStatus",sceneId, selfId,targetId) <0 then
				return
			end
			--Tång thêm Ði«u ki®n Bi¬u hi®n Nµi dung 
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction(CITY_BUILDING_ABILITY_SCRIPT,"OnCityAction",sceneId, selfId, targetId, x760446_g_AbilityID, bid, 4)
			local studyMsg = format("Nªu Ngß½i ÐÕt t¾i %dC¤p H½n næa KhÆng Tiêu phí #{_EXCHG%d}Hòa %dÐi¬m Bang C¯ng Li«n có th¬ H÷c ðßþc"..x760446_g_AbilityName.."KÛ nång .Ngß½i Quyªt ð¸nh H÷c t§p Ma ?", lv, money, con)
			AddText(sceneId,studyMsg)
			--Xác ð¸nh H÷c t§p Cái nút 
					AddNumText(sceneId,x760446_g_ScriptId,"Ngã Xác ð¸nh mu¯n H÷c t§p", 6, 2)
			--Hüy bö H÷c t§p Cái nút 
					AddNumText(sceneId,x760446_g_ScriptId,"Ta chï Th¸ Ðªn xem", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction(CITY_BUILDING_ABILITY_SCRIPT,"OnCityCheck",sceneId, selfId, x760446_g_AbilityID, bid, 1)
			if ret> 0 then
				CallScriptFunction(CITY_BUILDING_ABILITY_SCRIPT,"OnCityAction",sceneId, selfId, targetId, x760446_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction(g_Npc_ScriptId,"OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end
