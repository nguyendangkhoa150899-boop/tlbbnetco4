--洛阳NPC
--沈含香
--普通

--花店
x002094_g_scriptId=002094
x002094_g_shoptableindex=17--**********************************
--事件交互入口
--**********************************
function x002094_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  各种鲜花，低价甩卖。" )
		AddNumText( sceneId, x002094_g_scriptId, "看看你卖的东西", 7, 1 )
			--for i, eventId in x002094_g_eventList do
				--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId)
			--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x002094_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1	then
		DispatchShopItem( sceneId, selfId, targetId, x002094_g_shoptableindex)
	end
end