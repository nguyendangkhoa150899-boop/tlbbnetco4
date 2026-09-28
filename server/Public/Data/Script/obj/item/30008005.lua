-- 300053 
-- Ð¡Ï´Ëèµ¤
-- Ê¹ÓÃÖ®ºó¿ÉÒÔ½«Ñ¡ÔñÊôÐÔµÄ·ÖÅäµãÊýÖÐµÄ5µã±äÎªÇ±ÄÜ¡£


-- ½Å±¾ºÅ
x300053_g_scriptId = 300053
x300053_g_ItemId = 30008005  -- Ò©Ë®ID

--**********************************
-- ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x300053_OnDefaultEvent( sceneId, selfId )

	-- ³ÔÒ©Ï´µã
	if GetNumText() == 1  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 0) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y Ti¬u T¦y Tüy ðan")
				AddText(sceneId, "  Thuµc tính Cß¶ng Lñc không còn ði¬m phân ph¯i dß, không cách nào tiªn hành t¦y ði¬m.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 0, 5, "Cß¶ng Lñc")
		
		end
		return
		
	elseif GetNumText() == 2  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 1) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y Ti¬u T¦y Tüy ðan")
				AddText(sceneId, "  Thuµc tính Nµi lñc không còn ði¬m phân ph¯i dß, không cách nào tiªn hành t¦y ði¬m.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 1, 5, "Nµi Lñc")
			
		end
		return
		
	elseif GetNumText() == 3  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 2) ~= 1  then 
			BeginEvent(sceneId)
				AddText(sceneId, "#Y Ti¬u T¦y Tüy ðan")
				AddText(sceneId, "  Thuµc tính Th¬ Lñc không còn ði¬m phân ph¯i dß, không cách nào tiªn hành t¦y ði¬m.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 2, 5, "Th¬ lñc")
			
		end
		return
		
	elseif GetNumText() == 4  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 3) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y Ti¬u T¦y Tüy ðan")
				AddText(sceneId, "  Thuµc tính Trí Lñc không còn ði¬m phân ph¯i dß, không cách nào tiªn hành t¦y ði¬m.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 3, 5, "Trí Lñc")
			
		end
		return
		
	elseif GetNumText() == 5  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 4) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y Ti¬u T¦y Tüy ðan")
				AddText(sceneId, "  Thuµc tính Thân Pháp không còn ði¬m phân ph¯i dß, không cách nào tiªn hành t¦y ði¬m.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 4, 5, "Thân Pháp")
			
		end
		return 
	
	elseif GetNumText() == 6  then
		
		
		-- ¹Ø±Õ½çÃæ
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
		
	end
	
end

--**********************************
-- 
--**********************************
function x300053_IsSkillLikeScript( sceneId, selfId)
	return 0
end

function x300053_WashPoint(sceneId, selfId, nType, nPoint, szStr)
	-- ¿Û³ýÏà¹ØµÄÎïÆ·
	local ret = DelItem(sceneId, selfId, x300053_g_ItemId, 1)
	if ret == 1  then
		local nNumber = LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)
		
		BeginEvent(sceneId)
			AddText(sceneId, "#Y Ti¬u T¦y Tüy ðan")
			AddText(sceneId, "  Các hÕ phân ph¯i thành công #Y" .. tonumber(nNumber) .. " ði¬m thuµc tính " .. szStr.. "#W thành ði¬m ti«m nång")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end		

end
