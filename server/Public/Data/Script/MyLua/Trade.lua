--=================================
--Code by Sun 0411
--=================================
x112000_g_ScriptId = 112000
x112000_g_RadioItemBonus1={{id=10553105,num=2345},{id=10553106,num=2345},{id=10553107,num=2345},{id=10553116,num=2345},{id=10553118,num=2345},{id=10553120,num=2345}}
x112000_g_RadioItemBonus2={{id=10553100,num=2345},{id=10553101,num=2345},{id=10553102,num=2345},{id=10553103,num=2345},{id=10553104,num=2345},{id=10553122,num=2345}}
x112000_g_RadioItemBonus3={{id=10553113,num=2345},{id=10553114,num=2345},{id=10553115,num=2345},{id=10553117,num=2345},{id=10553119,num=2345},{id=10553121,num=2345}}
x112000_g_RadioItemBonus4={{id=10553108,num=2345},{id=10553109,num=2345},{id=10553110,num=2345},{id=10553111,num=2345},{id=10553112,num=2345},{id=10553123,num=2345}}
x112000_g_RadioItemBonus4={{id=30311027,num=2345},{id=30311029,num=2345},{id=30311031,num=2345}}
x112000_g_RadioItemBonus8={{id=10553100,num=2345},{id=10553101,num=2345},{id=10553102,num=2345},{id=10553105,num=2345},{id=10553106,num=2345},{id=10553107,num=2345}}
x112000_g_RadioItemBonus9={{id=10553108,num=2345},{id=10553109,num=2345},{id=10553110,num=2345},{id=10553113,num=2345},{id=10553114,num=2345},{id=10553115,num=2345}}

--===========================================
--    		On Default Event
--===========================================
function x112000_OnDefaultEvent( sceneId, selfId, targetId )
	 BeginEvent(sceneId)
	 	AddText(sceneId,"#b#WTa có th¬ giúp gì cho các hÕ?")	
		AddNumText( sceneId, x112000_g_ScriptId, "Ð±i #GNgû Tuy®t KÛ Nång", 6, 5 )	 
		--AddNumText( sceneId, x112000_g_ScriptId, "Ð±i #GTrùng Lâu #YThü", 6, 1 )
		--AddNumText( sceneId, x112000_g_ScriptId, "Ð±i #GTrùng Lâu #YCông", 6, 2 )		
		--AddNumText( sceneId, x112000_g_ScriptId, "Nâng c¤p #cFF0000Chân - #GTrùng Lâu #YThü", 6, 3 )			
	        --AddNumText( sceneId, x112000_g_ScriptId, "Nâng c¤p #cFF0000Chân - #GTrùng Lâu #YCông", 6, 4 )	
		--AddNumText( sceneId, x112000_g_ScriptId, "Ð±i #GTrùng Lâu", 6, 8 )			
	        --AddNumText( sceneId, x112000_g_ScriptId, "Nâng c¤p #cFF0000Chân - #GTrùng Lâu", 6, 9 )				
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end

function x112000_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	if nNumText == 0  then		
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
		
	if nNumText == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, "#GDß¾i ðây là list hàng nóng mà ta có th¬ ð±i cho ngß½i")			
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang #H= #Y1 #GTrùng Lâu Giáp")		
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang #H= #Y1 #GTrùng Lâu Kiên")	
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang #H= #Y1 #GTrùng Lâu Ð¾i")
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang #H= #Y1 #GTrùng Lâu Thü")
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang #H= #Y1 #GTrùng Lâu Khôi")				
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang #H= #Y1 #GTrùng Lâu Hài")				
			local szStr = "Thiên Kiªm";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus1 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end

	if nNumText == 2 then
		BeginEvent(sceneId)
			AddText(sceneId, "#GDß¾i ðây là list hàng nóng mà ta có th¬ ð±i cho ngß½i")
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L® #H= #Y1 #GTrùng Lâu Liên")		
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L® #H= #Y1 #GTrùng Lâu Gi¾i")	
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L® #H= #Y1 #GTrùng Lâu Quy")			
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L® #H= #Y1 #GTrùng Lâu Ng÷c")	
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L® #H= #Y1 #GTrùng Lâu Tri®u")			
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L® #H= #Y1 #GTrùng Lâu Uy¬n")				
			local szStr = "Thiên Kiªm";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus2 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end	

	if nNumText == 3 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y1 #GTrùng Lâu #Wtß½ng Ñng")				
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi Mang")				
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Ðông)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Tây)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Nam)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (B¡c)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (HÕ)")	
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Thßþng)")				
			AddText(sceneId, "=> S¨ nâng c¤p lên ðßþc #YChân #GTrùng Lâu")							
			local szStr = "Thiên Kiªm";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus3 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 5 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end	
	
	if nNumText == 4 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y1 #GTrùng Lâu #Wtß½ng Ñng")				
			AddText(sceneId, "#Y50 #GTrùng Lâu Chi L®")				
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Ðông)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Tây)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Nam)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (B¡c)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (HÕ)")	
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Thßþng)")				
			AddText(sceneId, "=> S¨ nâng c¤p lên ðßþc #YChân #GTrùng Lâu")								
			local szStr = "Thiên Kiªm";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus5 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 5 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end
	
	if nNumText == 8 then
		BeginEvent(sceneId)
			AddText(sceneId, "#GDß¾i ðây là list hàng nóng mà ta có th¬ ð±i cho ngß½i")			
			AddText(sceneId, "Thu th§p")		
			AddText(sceneId, "#Y100 #GTrùng Lâu Chi Mang")	
			AddText(sceneId, "#Y100 #GTrùng Lâu Chi L®")			
			local szStr = "#b#H=> S¨ trao ð±i ðßþc #Y[1] #GTrùng Lâu";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus8 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end

	if nNumText == 9 then
		BeginEvent(sceneId)			
			AddText(sceneId, "#Y1 #GTrùng Lâu #Wtß½ng Ñng #r#b#cFF0000(Tháo Ng÷c + Ðiêu Vån + Di chuy¬n Tinh Thông)")				
			AddText(sceneId, "#Y100 #GTrùng Lâu Chi Mang #H+ #Y100 #GTrùng Lâu Chi L®")				
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Kim)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Mµc)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Thüy)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Höa)")
			AddText(sceneId, "#Y10 #GLøc Hþp L®nh Bài (Th±)")												
			local szStr = "#b#H=> S¨ nâng c¤p lên ðßþc #YChân #GTrùng Lâu";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus9 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 5 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end	

	if nNumText == 5 then
		BeginEvent(sceneId)
			AddText(sceneId, "#GDß¾i ðây là list hàng nóng mà ta có th¬ ð±i cho ngß½i")	
			AddText(sceneId, "#Y300 #GBí T¸ch Tàn Di®t")				
			AddText(sceneId, "=> Có th¬ trao ð±i l¤y #YNgû Tuy®t KÛ Nång")							
			local szStr = "Thiên Kiªm";
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_RadioItemBonus4 do
				if item.num == 2345  then
					AddRadioItemBonus( sceneId, item.id, 5 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)	
	end	
	
end

function x112000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
------------------------------------
--           Ngu Tong             --
------------------------------------

	if selectRadioId == 30311027 then		
		if GetItemCount(sceneId, selfId, 38000529) >= 300 then
		if LuaFnDelAvailableItem(sceneId,selfId, 38000529, 300) == 1 then
		TryRecieveItem( sceneId, selfId, 30311027, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Ðµc Cô CØu Kiªm" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü [ 300 ] Bí T¸ch Tàn Di®t" )
		return
		end
	end
	
	if selectRadioId == 30311029 then		
		if GetItemCount(sceneId, selfId, 38000529) >= 300 then
		if LuaFnDelAvailableItem(sceneId,selfId, 38000529, 300) == 1 then
		TryRecieveItem( sceneId, selfId, 30311029, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] CØu Âm Chân Kinh" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü [ 300 ] Bí T¸ch Tàn Di®t" )
		return
		end
	end

	if selectRadioId == 30311031 then		
		if GetItemCount(sceneId, selfId, 38000529) >= 300 then
		if LuaFnDelAvailableItem(sceneId,selfId, 38000529, 300) == 1 then
		TryRecieveItem( sceneId, selfId, 30311031, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Th¥n Chiªu Kinh" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü [ 300 ] Bí T¸ch Tàn Di®t" )
		return
		end
	end	

------------------------------------
--            Trung               --
------------------------------------

	if selectRadioId == 10553105 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553105, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Giáp" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553106 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553106, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Kiên" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end
	
	if selectRadioId == 10553107 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553107, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Ð¾i" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553116 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553116, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Khôi" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553118 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553118, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Thü" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553120 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553120, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Hài" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end	

	if selectRadioId == 10553100 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553100, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Liên" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end
	
	if selectRadioId == 10553101 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553101, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Gi¾i" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553102 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553102, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Ng÷c" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553103 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553103, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Quy" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553104 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553104, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Tri®u" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

	if selectRadioId == 10553122 then		
		if GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 20310185) >= 100 then
		if LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 then
		TryRecieveItem( sceneId, selfId, 10553122, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Trùng Lâu Uy¬n" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "BÕn chßa ðü #r[ 100 ] Trùng Lâu Chi Mang #r[ 100 ] Trùng Lâu Chi L®" )
		return
		end
	end

------------------------------------
--          Chan - Trung          --
------------------------------------

	if selectRadioId == 10553113 then		
		if GetItemCount(sceneId, selfId, 10553105) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553105, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553113, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Giáp" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Giáp #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end	

	if selectRadioId == 10553114 then		
		if GetItemCount(sceneId, selfId, 10553106) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553106, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553114, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Kiên" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Kiên #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end

	if selectRadioId == 10553115 then		
		if GetItemCount(sceneId, selfId, 10553107) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553107, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553115, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Ð¾i" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Ð¾i #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end	

	if selectRadioId == 10553117 then		
		if GetItemCount(sceneId, selfId, 10553116) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553116, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553117, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Khôi" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Khôi #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end	
	
	if selectRadioId == 10553119 then		
		if GetItemCount(sceneId, selfId, 10553118) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553118, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553119, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Thü" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Thü #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end	

	if selectRadioId == 10553121 then		
		if GetItemCount(sceneId, selfId, 10553120) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553120, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553121, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Hài" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Hài #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end

	if selectRadioId == 10553108 then		
		if GetItemCount(sceneId, selfId, 10553100) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553100, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553108, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Liên" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Liên #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end

	if selectRadioId == 10553109 then		
		if GetItemCount(sceneId, selfId, 10553101) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553101, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553109, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Gi¾i" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Gi¾i #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end
	
	if selectRadioId == 10553110 then		
		if GetItemCount(sceneId, selfId, 10553102) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553102, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553110, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Ng÷c" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Ng÷c #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end

	if selectRadioId == 10553111 then		
		if GetItemCount(sceneId, selfId, 10553103) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553103, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553111, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Quy" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Quy #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end

	if selectRadioId == 10553112 then		
		if GetItemCount(sceneId, selfId, 10553104) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553104, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553112, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Tri®u" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Tri®u #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end

	if selectRadioId == 10553123 then		
		if GetItemCount(sceneId, selfId, 10553122) >= 1 and GetItemCount(sceneId, selfId, 20310185) >= 100 and GetItemCount(sceneId, selfId, 20310186) >= 100 and GetItemCount(sceneId, selfId, 30504101) >= 10 and GetItemCount(sceneId, selfId, 30504102) >= 10 and GetItemCount(sceneId, selfId, 30504103) >= 10 and GetItemCount(sceneId, selfId, 30504104) >= 10 and GetItemCount(sceneId, selfId, 30504105) >= 10 then
		if LuaFnDelAvailableItem(sceneId,selfId, 10553122, 1) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310185, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 20310186, 100) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504101, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504102, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504103, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504104, 10) == 1 and LuaFnDelAvailableItem(sceneId,selfId, 30504105, 10) == 1 then
		TryRecieveItem( sceneId, selfId, 10553123, 4 );
		x112000_MsgBox( sceneId, selfId, targetId, "Trao ð±i thành công ! Nh§n l¤y [ 1 ] Chân - Trùng Lâu Uy¬n" )
		return
		end
		else
		x112000_MsgBox( sceneId, selfId, targetId, "Vui lòng ki¬m tra lÕi nguyên li®u - c¥n : #r1 Trùng Lâu Uy¬n #r50 Trùng Lâu Chi Mang #r50 Trùng Lâu Chi L® #r10 Løc Hþp L®nh Bài [Kim] #r10 Løc Hþp L®nh Bài [Mµc] #r10 Løc Hþp L®nh Bài [Thüy] #r10 Løc Hþp L®nh Bài [Höa] #r10 Løc Hþp L®nh Bài [Th±]" )
		return
		end
	end	







	
end
--===========================================
--    		Show A Message Box
--===========================================
function x112000_MsgBox( sceneId, selfId, targetId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end