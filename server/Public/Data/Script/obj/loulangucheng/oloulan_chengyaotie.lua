--Â¥À¼NPC....
--ÎäÆ÷Ïà¹Ø¹¦ÄÜ....

--½Å±¾ºÅ
x001101_g_ScriptId = 001101

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x001101_OnDefaultEvent( sceneId, selfId, targetId )

	
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLGC_20080324_13}" )
		AddNumText( sceneId, x001101_g_ScriptId, "Giám Ð¸nh Tß Ch¤t Trang B¸", 6, 1 )
		AddNumText( sceneId, x001101_g_ScriptId, "Ðøc l± trang b¸ cñc hÕng", 6, 2 )
		AddNumText( sceneId, x001101_g_ScriptId, "Khäm nÕm trang b¸ cñc hÕng", 6, 3 )
		AddNumText( sceneId, x001101_g_ScriptId, "Trích tr× Bäo ThÕch cñc hÕng", 6, 4 )
		AddNumText( sceneId, x001101_g_ScriptId, "Trþ giúp liên quan ðªn khäm nÕm cñc hÕng", 11, 5 )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001101_OnEventRequest( sceneId, selfId, targetId, eventId )

	
	if GetNumText() == 1 then

		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )

	elseif GetNumText() == 2 then

--		BeginUICommand( sceneId )
--		UICommand_AddInt( sceneId, targetId )
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 75117 )

	BeginEvent( sceneId )
		AddText( sceneId, "Xin lña ch÷n phß½ng thÑc ðøc l± cñc hÕng:" )
		AddNumText( sceneId, x001101_g_ScriptId, "SØ døng Ði¬m Kim Chi Ti­n ð¬ ðøc l±", 6, 10 )
		AddNumText( sceneId, x001101_g_ScriptId, "SØ døng Hàn Ng÷c Tinh Tuý ð¬ ðøc l±", 6, 11 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		
	elseif GetNumText() == 3 then
	
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 751107 )
	
	elseif GetNumText() == 4 then

		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 25702 )
		
	elseif GetNumText() == 5 then

		BeginEvent( sceneId )
		AddText( sceneId, "#{XQC_20080509_34}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif GetNumText() == 10 then
	
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, 1 )		--type£¬Çø·Öµã½ð»¹ÊÇº®Óñ
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 75117 )
	
	elseif GetNumText() == 11 then
	
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, 2 )		--type£¬Çø·Öµã½ð»¹ÊÇº®Óñ
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 75117 )
		
	end

end
