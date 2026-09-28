
--Tô Châu NPC
--Kim Løc gia 
--Bình thß¶ng ----

x760560_g_scriptId 	= 760560
x760560_g_gotoact		= 2
x760560_g_leave			= 20

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760560_OnDefaultEvent(sceneId, selfId,targetId)
		local	nam	= LuaFnGetName(sceneId, selfId)
		if LuaFnGetAvailableItemCount(sceneId, selfId, 59910051) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XCZB_160105_13}")	
			AddNumText(sceneId, x760560_g_scriptId,"Nh§n danh hi®u Sß¾ng Tú Các", 6, 100)	
			AddNumText(sceneId, x760560_g_scriptId,"V« Sß¾ng Tú Các", 11, 200)			
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
function x760560_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 100 then
       	BeginEvent(sceneId)
		AddNumText(sceneId, x760560_g_ScriptId,"C¤p 2 Manh Tân Nhân",6,1000)		
		AddNumText(sceneId, x760560_g_ScriptId,"C¤p 4 Sî Tú Các",6,1001)
		AddNumText(sceneId, x760560_g_ScriptId,"C¤p 6 Danh Tú Hi®p",6,1002)	
		AddNumText(sceneId, x760560_g_ScriptId,"C¤p 8 Tiêu Dao Chü",6,1003)
		AddNumText(sceneId, x760560_g_ScriptId,"C¤p 10 Võ An H¥u",6,1004)		
		AddNumText(sceneId, x760560_g_ScriptId,"C¤p 12 Vô Song Ðª",6,1005)
		--AddNumText(sceneId, x760560_g_ScriptId,"C¤p 14 Phong vân Tiên",6,1006)
		--AddNumText(sceneId, x760560_g_ScriptId,"C¤p 16 Tung hoành Tú",6,1007)
		--AddNumText(sceneId, x760560_g_ScriptId,"C¤p 18 #GTú Các Ðµc tôn",6,1008)		
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	elseif GetNumText() == 200 then
       	BeginEvent(sceneId)
	 AddText(sceneId,"Chï c¥n Ngài Cüa Sß¾ng Tú Các Tài phú C¤p b§c ÐÕt t¾i Riêng C¤p b§c ,Có th¬ — ta n½i này Nh§n Hi hæu CüaNga !")
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	
	elseif GetNumText() == 1000 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#eaf0c14#Y#503Tân#504")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Lâm Tú Các Manh Tân nhân.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nLâm Tú Các Manh Tân nhân", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1001 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#eaf0c14#Y#505Sî#506")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Sî Tú Các.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nSî Tú Các", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1002 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#eaf0c14#Y#507Hi®p#508")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Danh Tú Hi®p.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nDanh Tú Hi®p", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1003 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#eaf0c14#Y#509Tiêu#510")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Tiêu Dao Chü.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nTiêu Dao Chü", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1004 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#eaf0c14#Y#511H¥u#512")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Võ An H¥u.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nVõ An H¥u", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1005 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId,"#eaf0c14#Y#513Ðª#514")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Vô Song Ðª.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nVô Song Ðª", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end	
	elseif GetNumText() == 1006 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #716")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Quát tháo Tú Các Phong vân Tiên.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nQuát tháo Tú Các Phong vân Tiên", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1007 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #717")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Tung hoành Tú Các Hoàn vû Th¥n.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nTung hoành Tú Các Hoàn vû Th¥n", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1008 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #521")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Ngß¶i trung Long phßþng #GTú Các Ðµc tôn.")
		local	nam	= LuaFnGetName(sceneId, selfId)
		--BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§nNgß¶i trung Long phßþng #GTú Các Ðµc tôn", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tínhChÑng minh !!"
		  x760560_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end		
	end	
end
--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760560_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760560_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760560_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end

