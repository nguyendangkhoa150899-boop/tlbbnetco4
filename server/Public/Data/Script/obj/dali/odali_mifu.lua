--大理NPC
--米芾
--普通

--**********************************
--事件交互入口
--**********************************
function x002002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
        local NPCName = GetName(sceneId,targetId)
           if NPCName == "巢绝谷" then
		AddText(sceneId,"#{KVKTTT_110712_06}")
		AddNumText(sceneId,002002,"进入通天塔",6,2)
		AddNumText(sceneId,002002,"关于通天塔",11,22);
           else
		AddText(sceneId,"  苍山不墨千秋画，洱海无弦万古琴。这大理国果然是个好地方，王大将军真有眼力，竟然会选此地隐居。")
           end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x002002_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 2 then
	   local nQuarter = mod(GetQuarterTime(),100);
           if nQuarter < 80 or nQuarter > 88 then
	      BeginEvent(sceneId)
		AddText(sceneId,"#{KVKTTT_110712_10}")
	        EndEvent(sceneId)
	      DispatchEventList(sceneId,selfId,targetId)
              return
           end
	   BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,070051);
		UICommand_AddInt(sceneId,8551);
		UICommand_AddString(sceneId, "XieziQuickly");
		UICommand_AddString(sceneId, "#{KVKTTT_110712_11}");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
	   return
	 end

	if GetNumText() == 22 then
	   BeginEvent(sceneId)
	       AddText(sceneId,"#{KVKTTT_110712_09}")
	       EndEvent(sceneId)
	   DispatchEventList(sceneId,selfId,targetId)
           return
        end
end


--**********************************
--进塔
--**********************************
function x002002_GotoTour( sceneId, selfId, targetId )
	CallScriptFunction((400900),"TransferFunc",sceneId,selfId,581,252,359,85);
	return
end

