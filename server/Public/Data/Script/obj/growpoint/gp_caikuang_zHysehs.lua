--VÚng quay may m°n
--Author: Kenvin SÛi

--*********************--
x710589_g_scriptId = 710589
--********************--
x710589_g_Need_Item = 30070500
--********************--

--**********************************--
--*            On Update           *--
--**********************************--
function x710589_OnUpdate(sceneId,selfId,Request,Param_1,Param_2)

	--*********************--
	if Request==0 then
		x710589_ChooseGift(sceneId,selfId)
	end
	--*********************--
	if Request==1 then
		x710589_ChangeItemList(sceneId,selfId)
	end
	--*********************--
	if Request==2 then
		x710589_RecieveGift(sceneId,selfId,Param_1,Param_2)
	end
	--*********************--
	
end
--**********************************--
--*          Choose Gift           *--
--**********************************--
function x710589_ChooseGift(sceneId,selfId)

	--*********************--
	if GetMissionData(sceneId,selfId,LUCKY_GIFT)==1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C·c h’ cÛ ph•n thﬂ∑ng chﬂa nhßn!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	--*********************--
	if LuaFnDelAvailbleItemCount(sceneId,selfId,x710589_g_Need_Item,1)<1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C·c h’ khÙng cÛ H’nh Vßn Qu‰!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	--*********************--
	local nRandom=random(24)
	--*********************--
	SetMissionData(sceneId,selfId,LUCKY_GIFT,1)
	--*********************--
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,nRandom)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,2012816)
	--*********************--
	
end
--**********************************--
--*        Change Item List        *--
--**********************************--
function x710589_ChangeItemList(sceneId,selfId)

	--*********************--
	if GetMissionData(sceneId,selfId,LUCKY_GIFT)==1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C·c h’ cÛ ph•n thﬂ∑ng chﬂa nhßn!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	--*********************--
	BeginEvent(sceneId)
		AddText(sceneId,"L‡m mæi vßt ph¶m th‡nh cÙng!")
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
function x710589_RecieveGift(sceneId,selfId,Item_ID,Item_Number)

	--*********************--
	if GetMissionData(sceneId,selfId,LUCKY_GIFT)~=1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C·c h’ khÙng cÛ ph•n thﬂ∑ng cÛ th¨ nhßn!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	elseif TryRecieveItem(sceneId,selfId,Item_ID,1)<=0 then
		BeginEvent(sceneId)
			AddText(sceneId,"H„y s°p x™p l’i mµt kho‰ng trØng trong tay n‰i!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	--*********************--
	for i=1,Item_Number-1 do
		TryRecieveItem(sceneId,selfId,Item_ID,1)
	end
	--*********************--
	BeginEvent(sceneId)
		AddText(sceneId,"Nhßn ph•n thﬂ∑ng th‡nh cÙng!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId,-1)
	--*********************--
	SetMissionData(sceneId,selfId,LUCKY_GIFT,0)
	--*********************--
	
end