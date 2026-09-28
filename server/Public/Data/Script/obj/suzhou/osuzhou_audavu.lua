x001085_g_ScriptId = 001085

function x001085_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"  Lþi khí th¥n binh trong th¥n khí trong truy«n thuyªt sÑc mÕnh vô song cñc kÏ lþi hÕi.")
		AddText(sceneId,"  Luy®n h°n th¥n khí làm tång thuµc tính và màu s¡c ð©p h½n")
		AddText(sceneId,"  #b#GLßu ý:")
		AddText(sceneId,"  #YC¥n tháo hªt ng÷c trß¾c khi luy®n h°n")
		AddNumText(sceneId,x001085_g_ScriptId,"#GTh¥n Khí Luy®n H°n",6,3)
		AddNumText(sceneId,x001085_g_ScriptId,"#{SQSJ_XML_04}",11,4)
		

		
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001085_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 4 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{SQSJ_0708_01}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )


	elseif GetNumText() == 3 then  -- than khi 102
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		UICommand_AddInt( sceneId, selfId )
		DispatchUICommand(sceneId,selfId, 2012080922)
	
	end
end		
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
