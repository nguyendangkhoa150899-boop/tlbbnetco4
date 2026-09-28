x001086_g_ScriptId = 001086

function x001086_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"Xin chào, ngß½i có giæ Th¥n khí và nguyên li®u?  Ngß½i có biªt sß huynh ta còn s¯ng hay không? xin hãy cho ta biªt, ta s¨ hi®p trþ ngß½i phß½ng pháp luy®n #cDC4C18#cffcc00#YTh¥n Khí#W mÕnh më ")
		AddNumText(sceneId,x001086_g_ScriptId,"Hþp Thành #Y Th¥n Binh Phù 1",6,1)
		AddNumText(sceneId,x001086_g_ScriptId,"Hþp Thành #Y Th¥n Binh Phù 2",6,2)
		AddNumText(sceneId,x001085_g_ScriptId,"V« Hþp Thành Th¥n Binh Phù",11,4)
		
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001086_OnEventRequest( sceneId, selfId, targetId, eventId )
	
		
	if GetNumText() == 4 then
		BeginEvent( sceneId )
			AddText( sceneId, "#YTh¥n Binh Phù#W dùng ð¬ luy®n h°n th¥n khí ð¬ tr· nên mÕnh m¨" )
			AddText( sceneId, "Có th¬ l¤y #Y5#W cái cùng ðÆng c¤p ð¬ hþp thành ð¬ #GLuy®n h°n th¥n khí#W tß½ng Ñng." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1 then  --than binh 82
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 30505816)--than binh phu 1
		if c0>=5 then
			BeginEvent( sceneId )
			LuaFnDelAvailableItem(sceneId,selfId,30505816,5)--xoa than binh phu 1	
			local bagpos01 = TryRecieveItem( sceneId, selfId, 30505817, 1)--add than binh phu 2
			local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
			strText = "#GHþp thành th¥n binh phù thành công"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			 else
		     strNotice = "#GKhông ðü #W#Y[Th¥n Binh Phù (c¤p 1)]#W#G không th¬ ð±i"
		     x001086_ShowNotice(sceneId, selfId, targetId, strNotice);
		     
	      end
	elseif GetNumText() == 2 then  --than khi 92
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 30505817)--than binh phu 2
			if c0>=5 then
			BeginEvent( sceneId )
			LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--xoa than binh phu 2	
			local bagpos01 = TryRecieveItem( sceneId, selfId, 30505908, 1)--add than binh phu 3
			local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
			strText = "#GHþp thành th¥n binh phù thành công"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKhông ðü #W#Y[Th¥n Binh Phù (c¤p 2)]#W#G không th¬ ð±i"
		     x001086_ShowNotice(sceneId, selfId, targetId, strNotice);		
	
	
	end
end	
end	
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************

function x001086_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end