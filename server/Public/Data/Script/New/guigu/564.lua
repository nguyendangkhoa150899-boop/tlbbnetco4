
--Tô Châu NPC
--Kim Løc gia 
--Bình thß¶ng ----

x760564_g_scriptId 	= 760564

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760564_OnDefaultEvent(sceneId, selfId,targetId)
		local	nam	= LuaFnGetName(sceneId, selfId)
		if LuaFnGetAvailableItemCount(sceneId, selfId, 59910051) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{GXHDZ_141121_100}")	
			AddNumText(sceneId, x760564_g_scriptId,"Ðä khai D¸ch dung Các", 6, 600)	
			AddNumText(sceneId, x760564_g_scriptId,"V« D¸ch dung Các", 11, 200)			
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
function x760564_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 600 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 8893837)
		return
	end
	if GetNumText() == 200 then
       	BeginEvent(sceneId)
	 AddText(sceneId,"#{GXHDZ_141121_103}")
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	
		return
	end	
end
--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760564_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760564_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760564_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end

