--Trong truy«n thuyªt Cüa Mao mao 
x891027_g_scriptId = 891027

x891027_m_ActionItemList = {38000396,38000399,20310185,20310186,38000948,38001111,30505819,30505107}


function x891027_OnDefaultEvent(sceneId, selfId,targetId)
x891027_OpenWindowRequest(sceneId, selfId,targetId)
end


function x891027_OnEventRequest(sceneId, selfId, targetId, eventId)
end

function x891027_OpenWindowRequest(sceneId, selfId,targetId)
		local mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_DATA)
		local misstimes = floor(mylevel/100)
		local g_RollCount = floor(mod(mylevel,100)/10)
		local g_ItemInd = mod(mylevel,10)
		local NowTime = GetTime2Day()
		if NowTime ~= misstimes then
		g_RollCount = 0
		end
		if targetId == nil then
		targetId = selfId
		end
	  BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,2);
		UICommand_AddInt(sceneId,1-g_RollCount);
		UICommand_AddInt(sceneId,1)
		UICommand_AddInt(sceneId,targetId);
	  UICommand_AddInt(sceneId,g_ItemInd);
	  EndUICommand(sceneId)
	  DispatchUICommand(sceneId,selfId,891027)
end
function x891027_ChunfenItemRoll(sceneId, selfId)

		local mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_XIAN_TIME)
		local nowtimes = mod(LuaFnGetCurrentTime(),(10^8))
		local misstimes = floor(mylevel/10)
		local havexianli = mod(mylevel,10)
		if nowtimes-misstimes <6 then
		x891027_Tips(sceneId, selfId,"Hoàn thành Vòng Quay May M¡n - ðþi mµt chút sau ðó nh§n thß·ng")
		return
		end
		local mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_DATA)
		local datamisstimes = floor(mylevel/100)
		local g_RollCount = floor(mod(mylevel,100)/10)
		local g_ItemInd = mod(mylevel,10)
		local NowTime = GetTime2Day()
		if NowTime ~= datamisstimes then
		g_RollCount = 0
		datamisstimes = NowTime
		end
		if g_RollCount>= 1 then
		x891027_Tips(sceneId, selfId,"Hôm nay ðã ðã tham gia, ngày mai hãy quay lÕi")
		return
		end
		if g_ItemInd ~= 0 and g_ItemInd>= 1 and g_ItemInd <= 8 and havexianli == 1 then
		x891027_Tips(sceneId, selfId,"BÕn còn có v§t ph¦m chßa lînh thß·ng")
		return
		end
		g_RollCount = g_RollCount + 1
		g_ItemInd = random(1,8)
		SetMissionData(sceneId, selfId, MD_CHUNFEN_DATA,datamisstimes*(10^2)+g_RollCount*10+g_ItemInd)
		SetMissionData(sceneId, selfId, MD_CHUNFEN_XIAN_TIME,nowtimes*10)
	    BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,3);
		UICommand_AddInt(sceneId,2);
	  UICommand_AddInt(sceneId,g_ItemInd);
	  EndUICommand(sceneId)
	  DispatchUICommand(sceneId,selfId,891027)
end

function x891027_GivePrize(sceneId, selfId, impactId)

		local mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_XIAN_TIME)
		local nowtimes = mod(LuaFnGetCurrentTime(),(10^8))
		local misstimes = floor(mylevel/10)
		local havexianli = mod(mylevel,10)
		if nowtimes-misstimes <6 then
		x891027_Tips(sceneId, selfId,"Ch¶ mµt chút sau ðó m¾i có th¬ nh§n thß·ng")
		return
		end
		mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_DATA)
		local datamisstimes = floor(mylevel/100)
		local g_RollCount = floor(mod(mylevel,100)/10)
		local g_ItemInd = mod(mylevel,10)
		local NowTime = GetTime2Day()
		if NowTime ~= datamisstimes then
		g_RollCount = 0
		datamisstimes = NowTime
		end
		if g_RollCount>= 2 then
		x891027_Tips(sceneId, selfId,"Hôm nay các hÕ ðã nh§n thß·ng 1 l¥n!")
		return
		end
		if havexianli == 0 and nowtimes-misstimes>= 6 then
		havexianli = 1
		end
		if havexianli ~= 1 or g_ItemInd <1 or g_ItemInd> 8 then
		x891027_Tips(sceneId, selfId,"Hôm nay các hÕ ðã nh§n thß·ng!")
		return
		end
		BeginAddItem(sceneId)
		--local xianliitemid = x891027_m_ActionItemList[g_ItemInd]
		--AddItem(sceneId, xianliitemid, 1)
		local xianliitemid = TryRecieveItem(sceneId, selfId, x891027_m_ActionItemList[g_ItemInd], 1)
		LuaFnItemBind(sceneId, selfId, xianliitemid)
		local UKret = EndAddItem(sceneId,selfId)
		if UKret ~= 1 then
		return
		end
		g_ItemInd = 0
		SetMissionData(sceneId, selfId, MD_CHUNFEN_DATA,datamisstimes*(10^2)+g_RollCount*10)
		SetMissionData(sceneId, selfId, MD_CHUNFEN_XIAN_TIME,0)
		TryRecieveItemListToHuman(sceneId,selfId)
		--AddItemListToHuman(sceneId,selfId)
	    x891027_Tips(sceneId, selfId,"Nh§n thß·ng thành công!")
		local message = format("#W#{_INFOUSR%s}#PNh§n ðßþc 1 cái [#{_ITEM"..x891027_m_ActionItemList[g_ItemInd].."}]!!", GetName(sceneId,selfId));
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
	    BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,4);
		UICommand_AddInt(sceneId,2);
	  EndUICommand(sceneId)
	  DispatchUICommand(sceneId,selfId,891027)
	
end

function x891027_LuckyRollEnd(sceneId, selfId, impactId, impactId2)
		local mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_XIAN_TIME)
		if mylevel <1 then
		return
		end
		local nowtimes = mod(LuaFnGetCurrentTime(),(10^8))
		local misstimes = floor(mylevel/10)
		local havexianli = mod(mylevel,10)
		if nowtimes-misstimes <5 then
		return
		end
		mylevel = GetMissionData(sceneId, selfId, MD_CHUNFEN_DATA)
		local datamisstimes = floor(mylevel/100)
		local g_RollCount = floor(mod(mylevel,100)/10)
		local g_ItemInd = mod(mylevel,10)
		local NowTime = GetTime2Day()
		if NowTime ~= datamisstimes then
		g_RollCount = 0
		datamisstimes = NowTime
		end
     if g_ItemInd <1 or g_ItemInd> 8 or g_RollCount ~= 1 then
		x891027_Tips(sceneId, selfId, g_ItemInd.."Hành vi phi pháp" ..g_RollCount)
		return
		end
     SetMissionData(sceneId, selfId, MD_CHUNFEN_XIAN_TIME,nowtimes*10+1)
		x891027_Tips(sceneId, selfId,"Ðã Hoàn thành Vòng Quay May M¡n - M¶i nh§n thß·ng")
end


function x891027_Tips(sceneId, selfId, str)
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
