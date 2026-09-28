
--Tô Châu NPC
--Kim Løc gia 
--Bình thß¶ng ----

x760558_g_scriptId 	= 760558
x760558_g_gotoact		= 2
x760558_g_leave			= 20

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760558_OnDefaultEvent(sceneId, selfId,targetId)
		local	nam	= LuaFnGetName(sceneId, selfId)
		if LuaFnGetAvailableItemCount(sceneId, selfId, 59910051) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SXRW_090119_043}")	
			AddNumText(sceneId, x760558_g_scriptId,"Nh§n danh hi®u Sát tinh", 6, 100)	
--			AddNumText(sceneId, x760558_g_scriptId,"Nh§n Danh hi®u Trþ giúp", 11, 200)			
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
function x760558_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 100 then
       	BeginEvent(sceneId)
		AddNumText(sceneId, x760558_g_ScriptId,"Quäng Møc Thiên Vß½ng",1,1000)		
		AddNumText(sceneId, x760558_g_ScriptId,"Biªt Nhi«u Thiên Vß½ng",1,1001)
		AddNumText(sceneId, x760558_g_ScriptId,"Tång Trß·ng Thiên vß½ng",1,1002)	
		AddNumText(sceneId, x760558_g_ScriptId,"Trì Qu¯c Thiên vß½ng",1,1003)
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	elseif GetNumText() == 200 then
       	BeginEvent(sceneId)
	 AddText(sceneId,"#{SXRW_090119_109}")
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	
	elseif GetNumText() == 1000 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #942Quäng Møc Thiên Vß½ng#943")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Quäng Møc Thiên Vß½ng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Quäng Møc Thiên Vß½ng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760558_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1001 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #942Biªt Nhi«u Thiên Vß½ng#943")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Biªt Nhi«u Thiên Vß½ng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Biªt Nhi«u Thiên Vß½ng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760558_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1002 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #942Tång Trß·ng Thiên vß½ng#943")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Tång Trß·ng Thiên vß½ng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Tång Trß·ng Thiên vß½ng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760558_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end
	elseif GetNumText() == 1003 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 59910051)
       if c0 <1 then
				BeginEvent(sceneId) 
					LuaFnAwardSpouseTitle(sceneId, selfId," #942Trì Qu¯c Thiên vß½ng#943")
					LuaFnDelAvailableItem(sceneId,selfId,59910051,1)--C¡t bö V§t ph¦m 
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, -1, 0)
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng ,Ngài Thành công Nh§n Trì Qu¯c Thiên vß½ng Danh hi®u .")
		local	nam	= LuaFnGetName(sceneId, selfId)
		BroadMsgByChatPipe(sceneId, selfId,"#gff00f0Chúc m×ng Ngß¶i ch½i #gffff00 "..nam.." #gff00f0Thành công Nh§n Danh hi®u Trì Qu¯c Thiên vß½ng", 4)	
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
       else
		  strNotice ="#GM¶i Ki¬m tra Ngài Bao vây Thuµc tính Danh hi®u ChÑng minh !!"
		  x760558_ShowNotice(sceneId, selfId, targetId, strNotice);
	  end		
	end	
end
--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760558_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760558_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760558_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end

