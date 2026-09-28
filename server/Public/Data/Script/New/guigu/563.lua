
--Tô Châu NPC
--Kim Løc gia 
--Bình thß¶ng ----

x760563_g_scriptId 	= 760563
x760563_g_gotoact		= 2
x760563_g_leave			= 20

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760563_OnDefaultEvent(sceneId, selfId,targetId)
		local	nam	= LuaFnGetName(sceneId, selfId)
		if LuaFnGetAvailableItemCount(sceneId, selfId, 59910051) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{YG_20100809_01}")	
			AddNumText(sceneId, x760563_g_scriptId,"Nh§n Danh hi®u", 6, 100)	
			AddNumText(sceneId, x760563_g_scriptId,"#{YG_20100809_05}", 11, 200)			
		 EndEvent(sceneId)
		 DispatchEventList(sceneId,selfId,targetId)
	  else
		 BeginEvent(sceneId)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760563_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 100 then
       	BeginEvent(sceneId)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Có 102",6,1000)		
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Hoa Màu Th§p S¡c",6,1001)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Lång la Bách NÕp",6,1002)	
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u C¦m Hüy Thiên Ba",6,1003)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Khï La VÕn Hoa",6,1004)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Vân Nhung Xäo NÕp",6,1005)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Tinh ÐoÕn C¦m Tú",6,1006)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Tháng Hoàn Hoa T¯",6,1007)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Kim Lû Lßu Quang",6,1008)
		AddNumText(sceneId, x760563_g_ScriptId,"Nh§n danh hi®u Tiên M® Ng÷c C×u",6,1009)		
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	elseif GetNumText() == 200 then
       	BeginEvent(sceneId)
	 AddText(sceneId,"#{YG_20100809_06}")
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	
	elseif GetNumText() == 1000 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#e330099#915 Có 102#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Có 102 Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Có 102", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1001 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#gE0E0E0#915Hoa Màu Th§p S¡c#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Hoa Màu Th§p S¡c Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Hoa Màu Th§p S¡c", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1002 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#e330099#915Lång la Bách NÕp#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Lång la Bách NÕp Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Lång la Bách NÕp", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1003 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#gE0E0E0#915 C¦m Hüy Thiên Ba#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n C¦m Hüy Thiên Ba Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u C¦m Hüy Thiên Ba", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1004 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#e330099#915Khï La VÕn Hoa#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Khï La VÕn Hoa Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Khï La VÕn Hoa", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1005 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#gE0E0E0#915Vân Nhung Xäo NÕp#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Vân Nhung Xäo NÕp Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Vân Nhung Xäo NÕp", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1006 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#e330099#915Tinh ÐoÕn C¦m Tú#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Tinh ÐoÕn C¦m Tú Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Tinh ÐoÕn C¦m Tú", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1007 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#gE0E0E0#915Tháng Hoàn Hoa T¯#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Tháng Hoàn Hoa T¯ Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Tháng Hoàn Hoa T¯", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1008 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#e330099#915 Kim Lû Lßu Quang#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Kim Lû Lßu Quang Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Kim Lû Lßu Quang", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1009 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#gE0E0E0#915Tiên M® Ng÷c C×u#916")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Tiên M® Ng÷c C×u Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Tiên M® Ng÷c C×u", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760563_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end		
	end	
end
--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760563_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760563_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760563_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end

