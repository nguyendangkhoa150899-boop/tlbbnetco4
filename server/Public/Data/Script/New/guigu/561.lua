
--Tô Châu NPC
--Kim Løc gia 
--Bình thß¶ng ----

x760561_g_scriptId 	= 760561
x760561_g_gotoact		= 2
x760561_g_leave			= 20

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760561_OnDefaultEvent(sceneId, selfId,targetId)
		local	nam	= LuaFnGetName(sceneId, selfId)
		if LuaFnGetAvailableItemCount(sceneId, selfId, 59910051) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không th¬ nh§n danh hi®u · ðây, ð×ng có g¡ng làm gì !")	--#{WCBZ_180128_05}
			AddNumText(sceneId, x760561_g_scriptId,"Nh§n Thiên hÕ S¨ võ Khen thß·ng", 6, 100)	
			AddNumText(sceneId, x760561_g_scriptId,"Quan Kh¡p thiên hÕ S¨ võ Tái Chª", 11, 200)			
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
function x760561_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 100 and LuaFnGetName(sceneId,selfId)== 'HoaKiemLive' then
       	BeginEvent(sceneId)
			AddText(sceneId,"2018Nåm Thiên hÕ S¨ võ Tr§n chung kªt Trung Th¡ng ðßþc Cüa Ngß¶i xu¤t s¡c ,Có th¬ — ch² này Nh§n Danh hi®u Khen thß·ng .")					
		AddNumText(sceneId, x760561_g_ScriptId,"Chí khí ngút tr¶i #GVû dûng Hi®p Chúng",6,1000)		
		AddNumText(sceneId, x760561_g_ScriptId,"Bách chiªn bách th¡ng #GBách luy®n Tinh anh",6,1001)
		AddNumText(sceneId, x760561_g_ScriptId,"Vô cùng th¥n kÏ #GThiên kiêu KÏ Minh",6,1002)	
		AddNumText(sceneId, x760561_g_ScriptId,"Kinh thª Th¥n thông #GDûng sî Kiêu Doanh",6,1003)
		AddNumText(sceneId, x760561_g_ScriptId,"Ðánh ðâu th¡ng ðó, không gì cän n±i #GThiªt huyªt Cánh quân",6,1004)
		AddNumText(sceneId, x760561_g_ScriptId,"KÛ Quan Qu¥n hùng #GTh¥n Sách Thiên Quân",6,1005)		
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	elseif GetNumText() == 200 then
       	BeginEvent(sceneId)
	 AddText(sceneId,"#{WCBZ_180128_12}")
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	
	elseif GetNumText() == 1000 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #520")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Chí khí ngút tr¶i #GVû dûng Hi®p Chúng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Chí khí ngút tr¶i #GVû dûng Hi®p Chúng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Thuµc tính Danh hi®u ChÑng minh !!"
		  x760561_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1001 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #519")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Bách chiªn bách th¡ng #GBách luy®n Tinh anh Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Bách chiªn bách th¡ng #GBách luy®n Tinh anh", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Thuµc tính Danh hi®u ChÑng minh !!"
		  x760561_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1002 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #518")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Vô cùng th¥n kÏ #GThiên kiêu KÏ Minh Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Vô cùng th¥n kÏ #GThiên kiêu KÏ Minh", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Thuµc tính Danh hi®u ChÑng minh !!"
		  x760561_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1003 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #522")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Kinh thª Th¥n thông #GDûng sî Kiêu Doanh Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Kinh thª Th¥n thông #GDûng sî Kiêu Doanh", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Thuµc tính Danh hi®u ChÑng minh !!"
		  x760561_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1004 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #516")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Ðánh ðâu th¡ng ðó, không gì cän n±i #GThiªt huyªt Cánh quân Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Ðánh ðâu th¡ng ðó, không gì cän n±i #GThiªt huyªt Cánh quân", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Thuµc tính Danh hi®u ChÑng minh !!"
		  x760561_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1005 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #515")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n KÛ Quan Qu¥n hùng #GTh¥n Sách Thiên Quân Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u KÛ Quan Qu¥n hùng #GTh¥n Sách Thiên Quân", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Thuµc tính Danh hi®u ChÑng minh !!"
		  x760561_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end		
	end	
end
--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760561_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760561_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760561_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end

