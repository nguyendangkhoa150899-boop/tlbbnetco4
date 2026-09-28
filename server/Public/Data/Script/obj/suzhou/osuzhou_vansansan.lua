x001087_g_ScriptId = 001087

function x001087_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"#{ZSZB_090421_09}")
		AddNumText(sceneId,x001087_g_ScriptId,"#{ZSZBSJ_090706_07}",6,1) --thao trang bi tran thu
		AddNumText(sceneId,x001087_g_ScriptId,"Ð±i Bµ Trang Phøc Trân Thú",6,2)
		AddNumText(sceneId,x001087_g_ScriptId,"#{ZSZB_090421_08}",11,4)
		

		
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001087_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 4 then
		BeginEvent( sceneId )
			AddNumText(sceneId,x001087_g_ScriptId,"#{ZSZB_XML_1}",11,5)
			AddNumText(sceneId,x001087_g_ScriptId,"#{ZSZBSJ_090706_13}",11,6)
			AddNumText(sceneId,x001087_g_ScriptId,"#{ZSZBSJ_090706_15}",11,7)
			AddNumText(sceneId,x001087_g_ScriptId,"#{ZSZB_091027_1}",11,8)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 5 then --gioi thieu
		BeginEvent( sceneId )
			AddText(sceneId,"#{ZSZB_090820_1}")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 6 then --gioi thieu
		BeginEvent( sceneId )
			AddText(sceneId,"#ZSZBSJ_090706_14}")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 7 then  --gioi thieu
		BeginEvent( sceneId )
			AddText(sceneId,"#{ZSZBSJ_090706_16}")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then  --gioi thieu
		BeginEvent( sceneId )
			AddText(sceneId,"#{ZSZB_091027_2}")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		


	elseif GetNumText() == 1 then  --
		BeginEvent( sceneId )
			AddNumText(sceneId,x001087_g_ScriptId,"Tính nång chßa m·")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then  --
		BeginEvent( sceneId )
			AddNumText(sceneId,x001087_g_ScriptId,"Tính nång chßa m·")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	end
end		
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
