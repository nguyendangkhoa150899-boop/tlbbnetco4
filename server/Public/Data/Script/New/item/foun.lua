

--*********************--
x930041_g_scriptId = 930041
--********************--
x930041_g_Need_Item = 20308130 
--********************--

--**********************************--
--*                       *--
--**********************************--
function x930041_OnUpdate(sceneId,selfId,Request,Param_1,Param_2)

	--*********************--
	if Request==0 then
		x930041_ChooseGift(sceneId,selfId)
	end
	--*********************--
	if Request==1 then
		x930041_ChangeItemList(sceneId,selfId)
	end
	--*********************--
	if Request==2 then
		x930041_RecieveGift(sceneId,selfId,Param_1,Param_2)
	end
	--*********************--
	
end
--**********************************--
--*                    *--
--**********************************--
function x930041_ChooseGift(sceneId,selfId)

	--*********************--
	if GetMissionData(sceneId,selfId,LUCKY_GIFT)==2 then
		BeginEvent(sceneId)
		AddText(sceneId,"")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	--*********************--
	if LuaFnDelAvailableItem(sceneId,selfId,x930041_g_Need_Item,1)<1 then
		BeginEvent(sceneId)
			AddText(sceneId,"")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	--*********************--
	local nRandom=random(24)
	--*********************--
	SetMissionData(sceneId,selfId,LUCKY_GIFT,2)
	--*********************--
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,nRandom)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,2012816)
	--*********************--
	
end
--**********************************--
--*                *--
--**********************************--
function x930041_ChangeItemList(sceneId,selfId)

	--*********************--
	if GetMissionData(sceneId,selfId,LUCKY_GIFT)==2 then
		BeginEvent(sceneId)
		AddText(sceneId,"")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		SetMissionData(sceneId,selfId,LUCKY_GIFT,0)
	end
	--*********************--
	BeginEvent(sceneId)
	AddText(sceneId,"")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId,-1)
	
	--*********************--
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,20120817)
	--*********************--
	
end
--**********************************--
--*          Recieve Gift          *--
--**********************************--
function x930041_RecieveGift(sceneId,selfId,Item_ID,Item_Number)

	--*********************--
	if GetMissionData(sceneId,selfId,LUCKY_GIFT)~=2 then
		BeginEvent(sceneId)
			AddText(sceneId,"")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	elseif TryRecieveItem(sceneId,selfId,Item_ID,1)< 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end	

	
	--*********************--
	
	
	local  bagpos01= TryRecieveItem(sceneId,selfId,Item_ID,1)
	
	LuaFnDelAvailableItem(sceneId,selfId,Item_ID,1)
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	

	
	--*********************--
	BeginEvent(sceneId)
	AddText(sceneId,"")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId,-1)
	
	--*********************--
	SetMissionData(sceneId,selfId,LUCKY_GIFT,0)
	--*********************--
	
end