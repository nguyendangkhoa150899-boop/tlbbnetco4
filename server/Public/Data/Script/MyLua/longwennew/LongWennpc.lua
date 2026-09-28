-- chân v¯n s¯ 

x892005_g_scriptId  =  892004
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x892004_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  " #W Tß½ng truy«n, nhæng ðß¶ng v¨ cüa #cFF0000 Long Vån#W u¯n lßþn trên c½ th¬, Ñng v¾i tråm huy®t kinh mÕch trên ngß¶i s¨ giúp ngß¶i luy®n võ giäm b¾t sát khí khi thi tri¬n võ công, tinh th¥n luôn sáng su¯t, b¤t khä xâm phÕm!  "  )
	 	 AddText(  sceneId,  " #ef12345#Y Tháo Ðiêu Vån ra trß¾c khi Thay Ð±i Thuµc tính h÷c t§p ho£c Tr÷ng T¦y Long Vån thuµc tính "  )
	 	AddNumText(sceneId,  x892005_g_scriptId," #cFF0000Hþp Thành Long Vån ",  6,  5)
	 	AddNumText(sceneId,  x892005_g_scriptId," #cFF0000H÷c T§p KÛ Nång ",  6,  1)
	 	AddNumText(sceneId,  x892005_g_scriptId," #cFF0000Tång C¤p KÛ Nång ",  6,  2)
		AddNumText(sceneId,  x892005_g_scriptId," #G Thay Ð±i Thuµc Tính H÷c T§p ",  6,  3)
	 	AddNumText(sceneId,  x892005_g_scriptId," #Y Tr÷ng T¦y Long vån thuµc tính ",  6,  4)	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x892004_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)
	 if  GetNumText()==1  then
	 BeginEvent(sceneId)	 
	 	 	AddNumText(sceneId,  x892005_g_scriptId," KÛ Nång Máu Thßþng HÕn ",  6,  10)
			AddNumText(sceneId,  x892005_g_scriptId," KÛ Nång Thuµc Tính Công Kích ",  6,  20)
	        AddNumText(sceneId,  x892005_g_scriptId," KÛ Nång Thuµc Tính Giäm Kháng ",  6,  30)	 
	 	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 	 elseif  GetNumText()==10  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,selfId  )
	 	 UICommand_AddInt(  sceneId,0  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20110729)
	 	 	 	 elseif  GetNumText()==20  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,targetId  )
	 	 UICommand_AddInt(  sceneId,2  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20110729)
	 	 	 	 elseif  GetNumText()==30  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,targetId  )
	 	 UICommand_AddInt(  sceneId,1  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20110729)
	 	 
	 	 
	 elseif  GetNumText()==2  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20110730)
	 elseif  GetNumText()==3  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20110727)
	 elseif  GetNumText()==4  then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,3)
	 	 EndUICommand(sceneId  )
	 	 DispatchUICommand(sceneId,selfId,  20090721    )
	 	 
	 elseif  GetNumText()==5  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20110725)
	 end

end

--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x892004_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end



--**********************************
function  x892004_SendParamToClient(sceneId,  selfId,  param1,param2)
	 if  param1  ==  1  then
	 	 BeginUICommand(sceneId)
	 	 	 UICommand_AddInt(sceneId,param2)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  201107281)
	 end
end
