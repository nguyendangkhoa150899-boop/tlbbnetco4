

-- ½Å±¾ºÅ
x890062_g_ScriptId	= 890062
x890062_g_ItemId = 39901003

--**********************************
-- ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x890062_OnDefaultEvent( sceneId, selfId )
	if GetNumText() == 20 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,150)
		LuaFnSetXinFaLevel(sceneId,selfId,32,150)
		LuaFnSetXinFaLevel(sceneId,selfId,33,150)
		LuaFnSetXinFaLevel(sceneId,selfId,34,150)
		LuaFnSetXinFaLevel(sceneId,selfId,35,150)
		LuaFnSetXinFaLevel(sceneId,selfId,36,150)
		LuaFnSetXinFaLevel(sceneId,selfId,60,150)
		LuaFnSetXinFaLevel(sceneId,selfId,77,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		--LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Tinh Túc.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Tinh Túc." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 21 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,150)
		LuaFnSetXinFaLevel(sceneId,selfId,50,150)
		LuaFnSetXinFaLevel(sceneId,selfId,51,150)
		LuaFnSetXinFaLevel(sceneId,selfId,52,150)
		LuaFnSetXinFaLevel(sceneId,selfId,53,150)
		LuaFnSetXinFaLevel(sceneId,selfId,54,150)
		LuaFnSetXinFaLevel(sceneId,selfId,63,150)
		LuaFnSetXinFaLevel(sceneId,selfId,80,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Tiêu Dao.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Tiêu Dao." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 22 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,150)
		LuaFnSetXinFaLevel(sceneId,selfId,2,150)
		LuaFnSetXinFaLevel(sceneId,selfId,3,150)
		LuaFnSetXinFaLevel(sceneId,selfId,4,150)
		LuaFnSetXinFaLevel(sceneId,selfId,5,150)
		LuaFnSetXinFaLevel(sceneId,selfId,6,150)
		LuaFnSetXinFaLevel(sceneId,selfId,55,150)
		LuaFnSetXinFaLevel(sceneId,selfId,72,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Thiªu Lâm.", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Thiªu Lâm." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 23 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,150)
		LuaFnSetXinFaLevel(sceneId,selfId,44,150)
		LuaFnSetXinFaLevel(sceneId,selfId,45,150)
		LuaFnSetXinFaLevel(sceneId,selfId,46,150)
		LuaFnSetXinFaLevel(sceneId,selfId,47,150)
		LuaFnSetXinFaLevel(sceneId,selfId,48,150)
		LuaFnSetXinFaLevel(sceneId,selfId,62,150)
		LuaFnSetXinFaLevel(sceneId,selfId,79,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Thiên S½n.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Thiên S½n." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 24 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,150)
		LuaFnSetXinFaLevel(sceneId,selfId,38,150)
		LuaFnSetXinFaLevel(sceneId,selfId,39,150)
		LuaFnSetXinFaLevel(sceneId,selfId,40,150)
		LuaFnSetXinFaLevel(sceneId,selfId,41,150)
		LuaFnSetXinFaLevel(sceneId,selfId,42,150)
		LuaFnSetXinFaLevel(sceneId,selfId,61,150)
		LuaFnSetXinFaLevel(sceneId,selfId,78,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Thiên Long.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Thiên Long." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 25 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,150)
		LuaFnSetXinFaLevel(sceneId,selfId,26,150)
		LuaFnSetXinFaLevel(sceneId,selfId,27,150)
		LuaFnSetXinFaLevel(sceneId,selfId,28,150)
		LuaFnSetXinFaLevel(sceneId,selfId,29,150)
		LuaFnSetXinFaLevel(sceneId,selfId,30,150)
		LuaFnSetXinFaLevel(sceneId,selfId,59,150)
		LuaFnSetXinFaLevel(sceneId,selfId,76,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Nga My.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Nga My." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 26 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,150)
		LuaFnSetXinFaLevel(sceneId,selfId,20,150)
		LuaFnSetXinFaLevel(sceneId,selfId,21,150)
		LuaFnSetXinFaLevel(sceneId,selfId,22,150)
		LuaFnSetXinFaLevel(sceneId,selfId,23,150)
		LuaFnSetXinFaLevel(sceneId,selfId,24,150)
		LuaFnSetXinFaLevel(sceneId,selfId,58,150)
		LuaFnSetXinFaLevel(sceneId,selfId,75,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Võ Ðang.", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Võ Ðang." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 27 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,150)
		LuaFnSetXinFaLevel(sceneId,selfId,8,150)
		LuaFnSetXinFaLevel(sceneId,selfId,9,150)
		LuaFnSetXinFaLevel(sceneId,selfId,10,150)
		LuaFnSetXinFaLevel(sceneId,selfId,11,150)
		LuaFnSetXinFaLevel(sceneId,selfId,12,150)
		LuaFnSetXinFaLevel(sceneId,selfId,56,150)
		LuaFnSetXinFaLevel(sceneId,selfId,73,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Minh Giáo.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Minh Giáo." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 28 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,150)
		LuaFnSetXinFaLevel(sceneId,selfId,14,150)
		LuaFnSetXinFaLevel(sceneId,selfId,15,150)
		LuaFnSetXinFaLevel(sceneId,selfId,16,150)
		LuaFnSetXinFaLevel(sceneId,selfId,17,150)
		LuaFnSetXinFaLevel(sceneId,selfId,18,150)
		LuaFnSetXinFaLevel(sceneId,selfId,57,150)
		LuaFnSetXinFaLevel(sceneId,selfId,77,150)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Cái Bang.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Cái Bang." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end

	if GetNumText() == 29 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 9)
		LuaFnSetXinFaLevel(sceneId,selfId,64,150)
		LuaFnSetXinFaLevel(sceneId,selfId,65,150)
		LuaFnSetXinFaLevel(sceneId,selfId,66,150)
		LuaFnSetXinFaLevel(sceneId,selfId,67,150)
		LuaFnSetXinFaLevel(sceneId,selfId,68,150)
		LuaFnSetXinFaLevel(sceneId,selfId,69,150)
		LuaFnSetXinFaLevel(sceneId,selfId,70,150)
		LuaFnSetXinFaLevel(sceneId,selfId,71,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--É¾³ýÎïÆ·
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GChúc m×ng  "..nam.." ð±i môn phái thành công sang phái Mµ Dung.", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#GCác hÕ ðã là ð® tØ phái Mµ Dung." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 0
	end


end

--**********************************
-- 
--**********************************
function x890062_IsSkillLikeScript( sceneId, selfId)
	return 0
end
