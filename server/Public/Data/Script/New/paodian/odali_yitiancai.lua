-- ÐÕi Lý NPC
-- rút ra tß·ng 
-- bình thß¶ng 
x830000_g_scriptId  =  830000
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x830000_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"        #W · ch² này cüa ta có th¬ ð¯i v¾i ngài mình th¶i trang tiªn hành #G nhuµm s¡c #W?#G trä lÕi nhß cû #W?#G ði¬m chuª xÑng sÑc #W , còn có th¬ ðem ngài ðích th¶i trang #G ti­n tài #W vì #Y con gái th¶i trang #W , cûng vì con gái th¶i trang tiªn hành #G nhuµm s¡c #W nga ~  ")
                              --  AddText(sceneId,"        ta ID là "..LuaFnGetGUID(sceneId,  selfId).."  ")
	 	 AddNumText(  sceneId,  x830000_g_ScriptId,  "#GNhuµm th¶i trang +Baby",6,111  )
		-- AddNumText(  sceneId,  x830000_g_ScriptId,  "Nhuµm th¶i trang Con",6,116  )
	 	 AddNumText(  sceneId,  x830000_g_ScriptId,  "Th¶i trang c¡t may ",6,112  )
	 	 AddNumText(  sceneId,  x830000_g_ScriptId,  "Th¶i trang xÑng sÑc gia công ",6,113  )
	 	 AddNumText(  sceneId,  x830000_g_ScriptId,  "Th¶i trang xÑng sÑc ði¬m chuª ",6,114  )
	 	 AddNumText(  sceneId,  x830000_g_ScriptId,  "Th¶i trang xÑng sÑc tháo xu¯ng ",6,115  )
	 	 --AddNumText(  sceneId,  x830000_g_ScriptId,  "#G nh§n l¤y kim toa ",6,222  )

	 	 AddNumText(  sceneId,  x830000_g_ScriptId,  " liên quan t¾i th¶i trang nhuµm s¡c ",  11,  444  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x830000_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

local  isMarried  =  LuaFnIsMarried(sceneId,  selfId)
	 	 --if  isMarried  >  0  then
	 	 	 --BeginEvent(sceneId)
	 	 	 	 --AddText(  sceneId,  "#{ZXD_20080312_03}"  )	 	 
	 	 	 --EndEvent(sceneId)
	 	 	 --DispatchEventList(sceneId,selfId,targetId)
	 	 	 --return
	 	 --end

	if  GetNumText()  ==  116  then
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    8909851)
	 --DispatchUICommand(  sceneId,  selfId,    0147000)
	 end
	
	 if  GetNumText()  ==  111  then
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    0910281)
	 --DispatchUICommand(  sceneId,  selfId,    0147000)
	 end

	 if  GetNumText()  ==  112  then
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    2015043098)
	 end

	 if  GetNumText()  ==  113  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  2015050799  )	 
	 end

	 if  GetNumText()  ==  114  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  2015050199  )	 
	 end

	 if  GetNumText()  ==  115  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  20170828  )
	 end


	 if  GetNumText()  ==  222  then
                                TryRecieveItem(  sceneId,  selfId,  30503134,  1)  
                                TryRecieveItem(  sceneId,  selfId,  30503135,  1)  
                              --  TryRecieveItem(  sceneId,  selfId,  30503136,  1)  -- th¶i trang xÑng sÑc thanh tr× phù không h« næa sØ døng , trñc tiªp dùng bäo thÕch tháo xu¯ng phù thay thª 
                                TryRecieveItem(  sceneId,  selfId,  30503137,  1)    
                                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
                                end



	 if  GetNumText()  ==  444  then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(sceneId,"#Y b¤t ð°ng s¡c thái chß½ng hi¬n ngß½i ð£c bi®t ðích lúc thßþng thß·ng thÑc , hoa mÛ s¡c thái cho ngß½i vô hÕn th¸ giác hß·ng thø ! ")
	 	 	 AddText(sceneId," th¶i trang nhuµm s¡c   #r th¶i trang ðang sØ døng h°ng di®u thÕch h§u là có th¬ biªn hóa màu s¡c , m²i l¥n nhuµm s¡c cûng s¨ ngçu nhiên nhuµm s¡c thành mµt khoän dÕng thÑc , h½i l½ là còn có th¬ có th¬ th¤t bÕi nga . th¤t bÕi sau th¶i trang cùng h°ng di®u thÕch cûng s¨ biªn m¤t . ")
	 	 	 AddText(sceneId," còn không biªt nhæng th¶i trang có th¬ nhuµm s¡c sao ? nhìn hÕ mình th¶i trang phía dß¾i bi¬u hi®n ðích nói rõ li«n có th¬ biªt , có th¬ nhuµm s¡c ðích th¶i trang phía dß¾i có rõ ràng ð« kÏ ðích nga . ")
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

end

--**********************************
-- tin tÑc ð« kÏ 
--**********************************
function  x830000_MsgBox(  sceneId,  selfId,  str  )	 
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end