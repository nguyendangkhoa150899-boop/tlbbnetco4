
-- Lang hoàn Phúc ð¸a Danh hi®u 
x760555_g_scriptId = 760555

--Vô Nhai Ðan thanh 
x760555_g_XuanFuID = 38001750

--Ð±i Nhu c¥u 
x760555_g_Cost = {10,30,80,200}
--Danh hi®u id
x760555_g_TitleID = {101,102,103,104}
--B¤t ð°ng C¤p b§c Th¤t bÕi Ð« kÏ 
x760555_g_FailMsg = {"#{LHFD_160203_114}","#{LHFD_160203_115}","#{LHFD_160203_116}","#{LHFD_160203_117}"}
--Danh hi®u C¤p b§c 
x760555_g_TitleLvNum = 4;
--Danh hi®u idx Trình tñ Døng 
x760555_g_TitleIndex = 3;


function x760555_ChangePiaoMiaoTitle(sceneId, selfId, targetId,titleLv)
	
	--DeleteTitle(sceneId,selfId,x760555_g_TitleIndex);
	--Tính hþp pháp Ki¬m tra 
	if titleLv <1 and titleLv> x760555_g_TitleLvNum then
		return
	end
	
	--Nhân v§t Hi®n có Danh hi®u 	
	local HadTitleID = GetTitle(sceneId,selfId,x760555_g_TitleIndex)
	
	if (titleLv == 1) then
		--Hay không Ðã có Danh hi®u 
		if (HadTitleID == x760555_g_TitleID[1]
				or HadTitleID == x760555_g_TitleID[2]
				or HadTitleID == x760555_g_TitleID[3]
				or HadTitleID == x760555_g_TitleID[4]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId,"#{PMF_REMINDINF_001}")	
			return
		end
	end
	
	if (titleLv == 2) then
		--Hay không Ðã có Danh hi®u 
		if (HadTitleID == x760555_g_TitleID[2]
				or HadTitleID == x760555_g_TitleID[3]
				or HadTitleID == x760555_g_TitleID[4]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId,"#{PMF_REMINDINF_001}")	
			return
		end
		--Hay không Có Thßþng Nh¤t C¤p b§c Danh hi®u 
		if (HadTitleID ~= x760555_g_TitleID[1]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId, x760555_g_FailMsg[titleLv])
			return
		end
	end
	
	if (titleLv == 3) then
		--Hay không Ðã có Danh hi®u 
		if (HadTitleID == x760555_g_TitleID[3]
				or HadTitleID == x760555_g_TitleID[4]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId,"#{PMF_REMINDINF_001}")	
			return
		end
		--Hay không Có Thßþng Nh¤t C¤p b§c Danh hi®u 
		if (HadTitleID ~= x760555_g_TitleID[2]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId, x760555_g_FailMsg[titleLv])
			return
		end
	end
	
	if (titleLv == 4) then
		--Hay không Ðã có Danh hi®u 
		if (HadTitleID == x760555_g_TitleID[4]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId,"#{PMF_REMINDINF_001}")	
			return
		end
		--Hay không Có Thßþng Nh¤t C¤p b§c Danh hi®u 
		if (HadTitleID ~= x760555_g_TitleID[3]) then
			x760555_NotifyFailBox(sceneId, selfId, targetId, x760555_g_FailMsg[titleLv])
			return
		end
	end
	
	--Ki¬m tra V§t Huy«n Phù Lßþng 
	local checkRet = x760555_CheckXuanFu(sceneId,selfId,targetId,x760555_g_Cost[titleLv]);
	if (checkRet ~= 1) then
			x760555_NotifyFailBox(sceneId, selfId, targetId, x760555_g_FailMsg[titleLv])
			return
	end
	
	--Kh¤u tr× Huy«n Phù 
	local costRet = x760555_CostXuanFu(sceneId,selfId,targetId,x760555_g_Cost[titleLv]);
	if (costRet ~= 1) then
		x760555_NotifyFailBox(sceneId, selfId, targetId,"Kh¤u tr× V§t ph¦m Th¤t bÕi !")
		return
	end
	
	--Cho Danh hi®u 
	AwardTitle(sceneId, selfId, x760555_g_TitleIndex, x760555_g_TitleID[titleLv])
	--Tä auditNh§t ký add by zhangguoxin 090226
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	local LogInfo = format("LUAAUDIT_TITLE_GET,0X%08X,%d,",guid,x760555_g_TitleID[titleLv]);
	LuaFnAuditGeneralLog(LogInfo);
	--Ð±i m¾i Hµ khách Ðoan 
	DispatchAllTitle(sceneId,selfId)
	--Thiªt trí Trß¾c m£t Danh hi®u 
	SetCurTitle(sceneId,selfId,60,x760555_g_TitleID[titleLv])
	--Ðóng cØa Ð¯i thoÕi Khuông 
	x760555_CloseWindow(sceneId,selfId, targetId)
	--GØi ði Thông cáo 
	x760555_SendNotice(sceneId, selfId, targetId,titleLv)
	--Phóng Ð£c hi®u 
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	--B¡t m¡t Ð« kÏ 
	x760555_MsgBox(sceneId, selfId,"#{PMF_090302_6}")
end

--GØi ði Thông cáo 
function x760555_SendNotice(sceneId, selfId, targetId,lv)

	--Tính hþp pháp Ki¬m tra 
	if lv <1 and lv> x760555_g_TitleLvNum then
		return
	end
	
	local strformat;
	
	if (lv == 1) then
		strformat	="#{LHFD_160203_118}#W#{_INFOUSR%s}#{LHFD_160203_119}"
	end
	if (lv == 2) then
		strformat	="#{LHFD_160203_121}#W#{_INFOUSR%s}#{LHFD_160203_122}"
	end
	if (lv == 3) then
		strformat	="#{LHFD_160203_123}#W#{_INFOUSR%s}#{LHFD_160203_124}"
	end
	if (lv == 4) then
		strformat	="#{LHFD_160203_125}#W#{_INFOUSR%s}#{LHFD_160203_126}"
	end
	
	local strText = format(strformat, GetName(sceneId,selfId))	
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
end

--Ki¬m tra V§t ph¦m 
function x760555_CheckXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x760555_g_XuanFuID)
	
	if (nCount <num) then
		return 0;
	end
	
	return 1;
end

--Kh¤u tr× V§t ph¦m 
function x760555_CostXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x760555_g_XuanFuID, num)
	if (ret1 <1) then
		return 0;
	end
	
	return 1;
end

--Ðóng cØa Ð¯i thoÕi Khuông 
function x760555_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
end

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760555_OnEventRequest(sceneId, selfId, targetId)
	local nNum = GetNumText()
	
	--T¥ng thÑ nh¤t Giao di®n 
	if (nNum == 10) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{LHFD_160203_120}")
			AddNumText(sceneId, x760555_g_scriptId,"#{LHFD_160203_106}", 6, 21)
			AddNumText(sceneId, x760555_g_scriptId,"#{LHFD_160203_107}", 6, 22)
			AddNumText(sceneId, x760555_g_scriptId,"#{LHFD_160203_108}", 6, 23)
			AddNumText(sceneId, x760555_g_scriptId,"#{LHFD_160203_109}", 6, 24)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--V« 
	if (nNum == 11) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090220_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--T¥ng thÑ hai Giao di®n 
	if (nNum == 21) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{LHFD_160203_110}")
			AddNumText(sceneId, x760555_g_scriptId,"Ta mu¯n Ð±i", 6, 1)
			AddNumText(sceneId, x760555_g_scriptId,"Vçn là Tính", 0, 100)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x760555_g_scriptId,0)
	end
	
	if (nNum == 22) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{LHFD_160203_111}")
			AddNumText(sceneId, x760555_g_scriptId,"Ta mu¯n Ð±i", 6, 2)
			AddNumText(sceneId, x760555_g_scriptId,"Vçn là Tính", 0, 100)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x760555_g_scriptId,0)
	end
	
	if (nNum == 23) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{LHFD_160203_112}")
			AddNumText(sceneId, x760555_g_scriptId,"Ta mu¯n Ð±i", 6, 3)
			AddNumText(sceneId, x760555_g_scriptId,"Vçn là Tính", 0, 100)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x760555_g_scriptId,0)
	end
	
	if (nNum == 24) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{LHFD_160203_113}")
			AddNumText(sceneId, x760555_g_scriptId,"Ta mu¯n Ð±i", 6, 4)
			AddNumText(sceneId, x760555_g_scriptId,"Vçn là Tính", 0, 100)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x760555_g_scriptId,0)
	end
	
	if (nNum == 100) then
		--Ðóng cØa Ð¯i thoÕi Khuông 
		x760555_CloseWindow(sceneId,selfId, targetId)
	end
	
	--Xác nh§n Ð±i 
	if nNum>= 1 and nNum <= x760555_g_TitleLvNum then
		x760555_ChangePiaoMiaoTitle(sceneId, selfId, targetId,nNum)
	end
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760555_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x760555_g_scriptId,"Ð±i Lang hoàn Phúc ð¸a Danh hi®u", 6, 10)	
	--AddNumText(sceneId, x760555_g_scriptId,"#{PMF_090220_01}", 11, 11)	
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760555_CheckAccept(sceneId, selfId)
	return 1
end

--**********************************
--Tiªp thu 
--**********************************
function x760555_OnAccept(sceneId, selfId)
end

--**********************************
--T× bö 
--**********************************
function x760555_OnAbandon(sceneId, selfId)
end

--**********************************
--Tiªp tøc 
--**********************************
function x760555_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--Ki¬m tra ðo lß¶ng Hay không có th¬ Ð® trình 
--**********************************
function x760555_CheckSubmit(sceneId, selfId)
end

--**********************************
--Ðßa ra Süng v§t Ðän Cüa Thông cáo 
--**********************************
function x760555_ShowSystemNotice(sceneId, selfId, strItemInfo,iIndex)
		
end

--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760555_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--B¡t m¡t Tin tÑc Ð« kÏ 
--**********************************
function x760555_MsgBox(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ð® trình 
--**********************************
function x760555_OnSubmit(sceneId, selfId, targetId, selectRadioId)
end

--**********************************
--Giªt chªt Quái v§t Ho£c Ngß¶i ch½i 
--**********************************
function x760555_OnKillObject(sceneId, selfId, objdataId,objId)
end

--**********************************
--Tiªn vào Khu vñc Sñ ki®n 
--**********************************
function x760555_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--ÐÕo cø Thay ð±i 
--**********************************
function x760555_OnItemChanged(sceneId, selfId, itemdataId)
end


