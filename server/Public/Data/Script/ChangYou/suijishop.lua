--洛阳NPC
--瑞福祥
--普通

--药店

x895107_g_scriptId = 895107

x895107_g_shoptableindex=80

--**********************************
--事件交互入口
--**********************************
function x895107_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  众人熙熙，皆为利来，众人攘攘，皆为利往。" )
		AddNumText( sceneId, x895107_g_scriptId, "随机商店", 7, 1 )
			--for i, eventId in x895107_g_eventList do
				--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId)
			--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x895107_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1	then
		DispatchShopItem( sceneId, selfId, targetId, x895107_g_shoptableindex)
	end
end

--PDJZVMRU作式了中以我些开

--代上了要发我些展58158148
