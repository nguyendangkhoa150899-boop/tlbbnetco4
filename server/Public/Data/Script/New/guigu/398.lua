-- 760398 Trang phøc Trang Vû Thi 

-- Lß½ng Sß Thành 

--K¸ch bän g¯c Hào 
x760398_g_ScriptId = 760398

--S· có ðßþc Sñ ki®n IDDanh sách 
--x760398_g_eventList={889070}

x760398_g_EquipList={	
-- Tr÷ng lâu 
{n=1100,id=10553101},{n=1200,id=10553102},{n=1300,id=10553100},{n=1400,id=10553106},{n=1500,id=10553110},{n=1600,id=10553108},
--Hoa LoÕi Th¥n Khí 1
{n=4100,id=10305021},{n=4100,id=10305022},{n=4100,id=10305023},{n=4100,id=10305024},
{n=4100,id=10305025},{n=4100,id=10305026},{n=4100,id=10305027},{n=4100,id=10305028},
--Hoa LoÕi Th¥n Khí 2
{n=4200,id=10305029},{n=4200,id=10305030},{n=4200,id=10305031},{n=4200,id=10305032},
{n=4200,id=10305033},{n=4200,id=10305034},{n=4200,id=10305035},
}

x760398_g_StoneList={
{n=1,id=20310185,num=200,str="Tr÷ng lâu Chi L®"},
{n=2,id=20310186,num=200,str="Tr÷ng lâu Chi Mang"},
{n=3,id=20310187,num=200,str="Tr÷ng lâu Chi Thß½ng"},
{n=4,id=20310188,num=200,str="Tr÷ng lâu Chi Dß½ng"},
{n=5,id=20310189,num=200,str="Thiên ð¸a Minh châu"},
{n=6,id=20310190,num=200,str="Lßu li Minh châu"},

{n=8,id=20310195,num=10,str="Hoa h°ng Chi Luyªn"},
}

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760398_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{WHOATN_12103165_01}")
		--for i, eventId in x760398_g_eventList do
		--	CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		--end
		--AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Trang phøc", 6, 1000)
		--AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Hoa LoÕi Vû khí", 6, 4000)
		--AddNumText(sceneId, x760398_g_ScriptId,"#GTr÷ng lâu Trang b¸ Tiªn giäi", 6, 5000)
		AddText(sceneId, "#cFF0000Khi thñc hi®n chÑ nång yêu c¥u rß½ng nguyên li®u c¥n 4 ô")
		AddNumText(sceneId, x760398_g_ScriptId,"Huy­n SÑc Vû khí Rèn", 6, 6000)
		AddNumText(sceneId, x760398_g_ScriptId,"Huy­n SÑc Vû khí Tr÷ng T¦y", 6, 7000)
		AddNumText(sceneId, x760398_g_ScriptId,"R¶i ði ..", 0, 0)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760398_OnDefaultEvent(sceneId, selfId,targetId)
	x760398_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760398_OnEventRequest(sceneId, selfId, targetId, eventId)
	local nNumText = GetNumText()
	if nNumText == 0 then
		-- Ðóng cØa CØa s± 
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 then
		BeginEvent(sceneId)
			AddText(sceneId,"M¶i Lña ch÷n Ngài Yêu c¥u Ð±i Cüa Trang b¸ !")
			if nNumText == 1000 then
			AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Gi¾i", 6, nNumText+100)
			AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Ng÷c", 6, nNumText+200)
			AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Liên", 6, nNumText+300)
			AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Ðái", 6, nNumText+400)
			AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Giáp", 6, nNumText+500)
			AddNumText(sceneId, x760398_g_ScriptId,"Ð±i #cFF0000Tr÷ng lâu Kiên", 6, nNumText+600)
			end
			--if nNumText == 2000 then
			--AddNumText(sceneId, x760398_g_ScriptId,"#cFF0000Bång phách Th¥n châm", 6, nNumText+100)
			--end
			--if nNumText == 3000 then
			--AddNumText(sceneId, x760398_g_ScriptId,"#cFF0000Cao c¤p Hôn l­ Khoán", 6, nNumText+100)
			--end
			if nNumText == 4000 then
			AddNumText(sceneId, x760398_g_ScriptId,"#cFF0000Ð±i Hoa LoÕi Th¥n Khí #", 6, nNumText+100)
			AddNumText(sceneId, x760398_g_ScriptId,"#cFF0000Ð±i Hoa LoÕi Th¥n Khí #", 6, nNumText+200)
			end
			AddNumText(sceneId, x760398_g_ScriptId,"R¶i ði ..", 0, 0)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if nNumText == 5000 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,20150511)
		return
	end

	if nNumText == 6000 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20190728 )
		return
	end

	if nNumText == 7000 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, selfId)
        UICommand_AddInt(sceneId, 13)
        UICommand_AddInt(sceneId, 800000)---Yêu c¥u Ti«n 
		UICommand_AddInt(sceneId, 10000000) --Trang b¸ B¡t ð¥u 
		UICommand_AddInt(sceneId, 20000000) --Trang b¸ Kªt thúc 
		UICommand_AddInt(sceneId, 30505819) --V§t ph¦m id
		UICommand_AddString(sceneId,"#HHuy­n SÑc Vû khí Tr÷ng T¦y");
		UICommand_AddString(sceneId,"Tr÷ng t¦y yêu c¥u tiêu hao #Y1 #GTh¥n Binh Phù");
		UICommand_AddString(sceneId,"#YÐ¬ vào #GHuy­n SÑc Vû khí:");
		UICommand_AddString(sceneId,"#YÐ¬ vào #GTh¥n Binh Phù:");
		UICommand_AddString(sceneId,"WuhunMagicUp");
        UICommand_AddInt(sceneId, 895111)
        UICommand_AddInt(sceneId, 20)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 21090722)
		return
	end

	if nNumText> 1000 and nNumText <11000 then
		BeginEvent(sceneId)
			AddText(sceneId,"Không phäi BÕch c¤p Cüa ,Døng ThÑ này T¾i ð±i Cüa Nga !!")
			
			local nLevel = 0
			if nNumText == 1100 then
				nLevel = 1
			end
			if nNumText == 1200 then
				nLevel = 2
			end
			if nNumText == 1300 then
				nLevel = 3
			end
			if nNumText == 1400 then
				nLevel = 4
			end
			if nNumText == 1500 then
				nLevel = 5
			end
			if nNumText == 1600 then
				nLevel = 6
			end


			if nNumText == 4100 then
				nLevel = 8
			end
			if nNumText == 4200 then
				nLevel = 8
			end


			local szStr ="Yªu ÐÕt ðßþc Này ðó trang b¸ ,Ngß½i Nhu Phäi cho ta ".. x760398_g_StoneList[nLevel].str.."  ".. tostring(x760398_g_StoneList[nLevel].num).." Cái Cai V§t ph¦m Khä TÕi #GBOSSHo£c là Quái v§t #WTrung Tuôn ra....#r#GChú ý Khán Trang b¸ Thích hþp Môn phái nào ,Không c¥n ð±i Sai r°i Nga #W"
			AddText(sceneId, szStr)
			
			for i, item in x760398_g_EquipList do
				if item.n == nNumText then
					AddRadioItemBonus(sceneId, item.id, 4)
				end
			end
  EndEvent(sceneId)
  --DispatchMissionDemandInfo(sceneId,selfId,targetId, x760398_g_ScriptId, x210200_g_MissionId)
  DispatchMissionContinueInfo(sceneId,selfId,targetId, x760398_g_ScriptId, 0)
		
	end

	for i, findId in x760398_g_eventList do
		if eventId == findId then			
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
			return
		end
	end
end
--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760398_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760398_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction(missionScriptId,"CheckAccept", sceneId, selfId)
			if ret> 0 then
				CallScriptFunction(missionScriptId,"OnAccept", sceneId, selfId)
			end
			return
		end
	end
	for i, findId in g_eventListTest do
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
function x760398_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760398_g_eventList do
		if missionScriptId == findId then
			x760398_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x760398_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760398_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760398_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760398_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)

	--XØ lý Ð® trình H§u Cüa Bi¬u hi®n Tình hu¯ng 
	--Vì An toàn ,N½i này Mu¯n c¦n th§n ,Không th¬ ra Thác 
	local nItemIndex = -1
	
	for i, item in x760398_g_EquipList do
		if item.id == selectRadioId then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1 then
		return
	end
	
	-- Xem xong Gia Có phäi hay không Cú Tài li®u Ð® trình 
	local nLevel = 0
	if x760398_g_EquipList[nItemIndex].n == 1100 then
		nLevel = 1
	end
	if x760398_g_EquipList[nItemIndex].n == 1200 then
		nLevel = 2
	end
	if x760398_g_EquipList[nItemIndex].n == 1300 then
		nLevel = 3
	end
	if x760398_g_EquipList[nItemIndex].n == 1400 then
		nLevel = 4
	end
	if x760398_g_EquipList[nItemIndex].n == 1500 then
		nLevel = 5
	end
	if x760398_g_EquipList[nItemIndex].n == 1600 then
		nLevel = 6
	end


	if x760398_g_EquipList[nItemIndex].n == 4100 then
		nLevel = 8
	end
	if x760398_g_EquipList[nItemIndex].n == 4200 then
		nLevel = 8
	end

	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x760398_g_StoneList[nLevel].id)>= x760398_g_StoneList[nLevel].num then
		bStoneOk = 1
	end
	
	if bStoneOk == 0 then
		BeginEvent(sceneId)
			strText ="Ngß½i Không có ðü Cüa Ð±i V§t ph¦m ,Không th¬ Ð±i l¤y Trang b¸ ."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- Ki¬m tra Có phäi hay không Có cûng ðü Cøc ðá Có th¬ Kh¤u tr× 
	if LuaFnGetAvailableItemCount(sceneId, selfId, x760398_g_StoneList[nLevel].id) <x760398_g_StoneList[nLevel].num  then
		BeginEvent(sceneId)
			strText ="Ngß½i Không có ðü Cüa Ð±i V§t ph¦m Có th¬ B¸ Kh¤u tr× ,M¶i Ki¬m tra V§t ph¦m là Phü Khóa lÕi ."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- Ki¬m tra Ba lô Không gian 
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk <1 then
		BeginEvent(sceneId)
			strText ="Ngß½i b¯i Bao Không có không gian R°i ."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x760398_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- C¡t bö Tß½ng quan Cøc ðá 
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x760398_g_StoneList[nLevel].id, x760398_g_StoneList[nLevel].num)
	
	if bDelOk <1 then
		BeginEvent(sceneId)
			strText ="Kh¤u Xu¤t Cøc ðá Th¤t bÕi ."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--C¤p Hoàn Gia Ð° v§t ,Hoàn thành 
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem(sceneId, selfId, x760398_g_EquipList[nItemIndex].id, 1);
		
		BeginEvent(sceneId)
			strText ="Ð±i Thành công ."
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x760398_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		 	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#IT¤t cung t¤t kính Ðßa ðªn #GLÕc Dß½ng #RTrang Vû Thi #ICß¶i ha ha: R¤t t¯t ,Cái này #{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x760398_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}	#IÐßa ðªn #GLÕc Dß½ng #RTrang Vû Thi #ICh¡p tay: Làm phi«n Làm phi«n ,#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x760398_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#GLÕc Dß½ng #RTrang Vû Thi #IPhüng #Y%d#cffffccKhöa #W#{_INFOMSG%s}#cffffccTñ ðáy lòng Cüa Khen: #W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x760398_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x760398_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760398_OnDie(sceneId, selfId, killerId)
end
