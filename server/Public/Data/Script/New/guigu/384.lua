--不归NPC
--弟子
--普通

--商店
x760384_g_scriptId=760384
x760384_g_shoptableindex=285--**********************************
--事件交互入口
--**********************************
function x760384_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{WLMZ_150812_804}" )
		AddNumText( sceneId, x760384_g_scriptId, "战盟时装", 6, 1 )
		AddNumText( sceneId, x760384_g_scriptId, "关于战盟时装", 11, 2 )		
			--for i, eventId in x760384_g_eventList do
				--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId)
			--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x760384_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1	then
		DispatchShopItem( sceneId, selfId, targetId, x760384_g_shoptableindex)
	end
	if GetNumText()==2 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{WLMZ_150812_508}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	
end