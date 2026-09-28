
--Tô Châu NPC
--Kim Løc gia 
--Bình thß¶ng ----

x760640_g_scriptId 	= 760640
x760640_g_gotoact		= 2
x760640_g_leave			= 20

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760640_OnDefaultEvent(sceneId, selfId,targetId)
		local	nam	= LuaFnGetName(sceneId, selfId)
		if LuaFnGetAvailableItemCount(sceneId, selfId, 59910051) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WCBZ_180128_05}")	
			AddNumText(sceneId, x760640_g_scriptId,"Di­n võ Tái Chu Khen thß·ng", 6, 100)	
			AddNumText(sceneId, x760640_g_scriptId,"Quan Kh¡p thiên hÕ S¨ võ Tái Chª", 11, 200)			
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
function x760640_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 100 then
       	BeginEvent(sceneId)
			AddText(sceneId,"2018Nåm Thiên hÕ S¨ võ Tr§n chung kªt Trung Th¡ng ðßþc Cüa Ngß¶i xu¤t s¡c ,Có th¬ — ch² này Lînh Danh hi®u Khen thß·ng .")					
		AddNumText(sceneId, x760640_g_ScriptId,"Kiªm Túng Giang h° Thùy Ð¸ch thü",6,1000)		
		AddNumText(sceneId, x760640_g_ScriptId,"Kiªm Li®t Ðàn anh Hi®p khách hành",6,1001)
		AddNumText(sceneId, x760640_g_ScriptId,"Kiªm Hàn CØu Châu Ðµng TÑ phß½ng",6,1002)	
		AddNumText(sceneId, x760640_g_ScriptId,"Thiên Phàm CÕnh Kh·i Tranh Kiªm Danh",6,1003)
		AddNumText(sceneId, x760640_g_ScriptId,"Kiªm Cái Kinh Hoa Lu§n Anh hùng",6,1004)
		AddNumText(sceneId, x760640_g_ScriptId,"Kiªm Danh Mµt phß½ng ºng Gió n±i lên",6,1005)		
		AddNumText(sceneId, x760640_g_ScriptId,"Chí tôn Thiên Ðoàn #GCµng Chiªn Giang h°",6,1006)	
		AddNumText(sceneId, x760640_g_ScriptId,"Phi Lµc Kinh h°ng #GThß¶ng Th¡ng Chi Quân",6,1007)	
		AddNumText(sceneId, x760640_g_ScriptId,"Ðß½ng th¶i Qu¥n hào",6,1008)	
		AddNumText(sceneId, x760640_g_ScriptId,"H± báo Truân KÏ #GTuy®t ð¸a Chiªn Læ",6,1009)	
		AddNumText(sceneId, x760640_g_ScriptId,"KÏ lân Táp ÐÕp #GUy Gia TÑ häi",6,1010)	
		AddNumText(sceneId, x760640_g_ScriptId,"Long ð¢ng Vu Dã #GNgñ Vû Chí tôn",6,1011)			
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
					LuaFnAwardSpouseTitle(sceneId, selfId,"#530")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Kiªm Túng Giang h° Thùy Ð¸ch thü Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Kiªm Túng Giang h° Thùy Ð¸ch thü", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1001 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#531")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Kiªm Li®t Ðàn anh Hi®p khách hành Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Kiªm Li®t Ðàn anh Hi®p khách hành", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1002 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#532")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Kiªm Hàn CØu Châu Ðµng TÑ phß½ng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Kiªm Hàn CØu Châu Ðµng TÑ phß½ng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1003 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#533")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Thiên Phàm CÕnh Kh·i Tranh Kiªm Tên Hào .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Thiên Phàm CÕnh Kh·i Tranh Kiªm Danh", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1004 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#534")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Kiªm Cái Kinh Hoa Lu§n Anh hùng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Kiªm Cái Kinh Hoa Lu§n Anh hùng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1005 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#535")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Kiªm Danh Mµt phß½ng ºng Gió n±i lên Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Kiªm Danh Mµt phß½ng ºng Gió n±i lên", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1006 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#536")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Chí tôn Thiên Ðoàn #GCµng Chiªn Giang h° Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Chí tôn Thiên Ðoàn #GCµng Chiªn Giang h°", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1007 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#537")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Phi Lµc Kinh h°ng #GThß¶ng Th¡ng Chi Quân Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Phi Lµc Kinh h°ng #GThß¶ng Th¡ng Chi Quân", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1008 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#538")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Ðß½ng th¶i Qu¥n hào Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Ðß½ng th¶i Qu¥n hào", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1009 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#539")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh H± báo Truân KÏ #GTuy®t ð¸a Chiªn Læ Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u H± báo Truân KÏ #GTuy®t ð¸a Chiªn Læ", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1010 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#540")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh KÏ lân Táp ÐÕp #GUy Gia TÑ häi Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u KÏ lân Táp ÐÕp #GUy Gia TÑ häi", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1011 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#541")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Lînh Long ð¢ng Vu Dã #GNgñ Vû Chí tôn Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00"..nam.." #gff00f0Thành công Lînh Danh hi®u Long ð¢ng Vu Dã #GNgñ Vû Chí tôn", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!!!"
		  x760640_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end		
	end	
end
--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760640_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760640_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760640_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end

