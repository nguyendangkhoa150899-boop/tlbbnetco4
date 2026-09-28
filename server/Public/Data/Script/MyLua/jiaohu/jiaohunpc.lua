--Phßþng minh NPC
--Tiêu H± 
--Trang b¸ Thång Linh 
x044800_g_scriptId = 044800
--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x044800_OnDefaultEvent(sceneId, selfId,targetId)
  local myLevel = GetLevel(sceneId, selfId)
  if myLevel <85 then
    BeginEvent(sceneId)
		AddText(sceneId,"#rHãy ðÕt ðªn #GC¤p 80 #Wr°i ðªn g£p ta")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   return
  end

	BeginEvent(sceneId)
		AddText(sceneId,"#b#WTa có th¬ giúp gì cho các hÕ?")		
		--AddText(sceneId,"#{ZZZB_150811_109}")
		AddText(sceneId,"#cFF0000ChÑc nång chßa m·")
		--AddNumText(sceneId, x044800_g_ScriptId,"Thång Linh #GVß½ng Quy«n",6,1)
		--AddNumText(sceneId, x044800_g_ScriptId,"Tiªn C¤p #GThiên ÐÕo",6,3)		
		--AddNumText(sceneId, x044800_g_ScriptId,"Thång Linh #GThiên ÐÕo",6,2)
		--AddNumText(sceneId, x044800_g_ScriptId,"Di Chuy¬n #GThång Linh",6,4)
		AddNumText(sceneId, x044800_g_ScriptId,"V« Trang b¸ Thång Linh",11,5)					
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x044800_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 1 then
	 BeginUICommand(sceneId)
	  UICommand_AddInt(sceneId,targetId);
	  EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId, 201708093)
      return
    end

	if GetNumText() == 2 then
	 BeginUICommand(sceneId)
	  UICommand_AddInt(sceneId,targetId);
	  EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId, 201708097)
      return
    end

	if GetNumText() == 3 then
	 BeginUICommand(sceneId)
	  UICommand_AddInt(sceneId,targetId);
	  EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId, 20170526)
      return
    end

	if GetNumText() == 4 then
	 BeginUICommand(sceneId)
	  UICommand_AddInt(sceneId,targetId);
       UICommand_AddInt(sceneId,8)
	  EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId, 20090721)
      return
    end


	if GetNumText()>= 5 then
	 BeginEvent(sceneId)
		AddText(sceneId,"#{ZZZB_150811_294}")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
      return
    end	
end
