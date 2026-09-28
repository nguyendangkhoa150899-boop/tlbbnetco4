--  000131
--  
-- chân v¯n s¯ 
x000131_g_scriptId  =  000131

-- có sñ ki®n ID li®t bi¬u 
x000131_g_eventList  =  {  805029,  805030  }

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000131_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"    có câu nói , tß½ng t× sinh lòng , khách quan ð¯i v¾i mình dung mÕo có th¬ hay không hài lòng ðây , có mu¯n hay không thoáng làm chút sØa ð±i ? ")
	 	 AddNumText(  sceneId,  x000131_g_scriptId,  "Thay ð±i dung mÕo gi¾i thi®u ",  11,  10  )
	 	 AddNumText(sceneId,x000131_g_scriptId,"Thay ð±i dung mÕo ",6,1)
	 	 AddNumText(  sceneId,  x000131_g_scriptId,  "Thau ð±i bi¬u tßþng gi¾i thi®u ",  11,  14  )
	 	 AddNumText(sceneId,x000131_g_scriptId,"Thau ð±i bi¬u tßþng ",6,4)
	 	 AddNumText(  sceneId,  x000131_g_scriptId,  "Thay ð±i khuôn hình gi¾i thi®u ",  11,  16  )
	 	 AddNumText(sceneId,x000131_g_scriptId,"Thay ð±i khuôn hình ",6,6)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

function  x000131_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 if  GetNumText()  ==  10  then
	 	 BeginEvent(sceneId)	 
	 	 	 AddText(  sceneId,  "#{function_help_088}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 if  GetNumText()  ==  14  then
	 	 BeginEvent(sceneId)	 
	 	 	 AddText(  sceneId,  "#{INTERHEAD_XML_008}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 if  GetNumText()  ==  16  then
	 	 BeginEvent(sceneId)	 
	 	 	 AddText(  sceneId,  "#{TXKS_170208_03}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 if  GetNumText()  ==  1  then
	 	 --  sØa ð±i m£t hình 
	 	 CallScriptFunction(  805029,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 return
	 end
	 if  GetNumText()  ==  4  then
	 	 -- Thau ð±i bi¬u tßþng 
	 	 CallScriptFunction(  805030,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 return
	 end

	 if  GetNumText()  ==  6  then
	       BeginUICommand(sceneId)
	           UICommand_AddInt(sceneId,targetId);
	           EndUICommand(sceneId)
	       DispatchUICommand(sceneId,selfId,201702171)
	       return
	 end
end