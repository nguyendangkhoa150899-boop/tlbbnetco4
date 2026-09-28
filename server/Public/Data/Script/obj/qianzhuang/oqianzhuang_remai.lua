--ÈÈÂôÔª±¦ NPC
--×¢Òâ±¾½Å±¾º¬ÓÐËæÉíÔª±¦Ïà¹Ø¹¦ÄÜ£¬ÇëÒ»¶¨²ÎÕÕÏÖÓÐµÄÀý×Ó½øÐÐÐÞ¸Ä¡£

x181002_g_scriptId 	= 181002
x181002_g_buyrate 	= 0.5

x181002_g_shoptableindex=151 --ÒÑ¾­·ÏÆúÁË£¬ÏÖÔÚÓÃ188ºÍ189
x181002_g_goodact		= 1		--ÈÈÂôÔª±¦ÉÌµê
x181002_g_YuanBaoIntro	= 18	--Ôª±¦½éÉÜ
x181002_g_Baoshis={
[1]={30900131,50501001,50501002,50502001,50502002,50502003,50502004,50503001,50512001,50512002,50512003,50512004,50513004},
[2]={30900132,50601001,50601002,50602001,50602002,50602003,50602004,50603001,50612001,50612002,50612003,50612004,50613004},
[3]={30900133,50701001,50701002,50702001,50702002,50702003,50702004,50703001,50712001,50712002,50712003,50712004,50713004},
}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x181002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "HoÕt ðµng ra m¡t Ð±i Phù l¤y Bäo ThÕch tuy®t ð¯i có giá tr¸, bäo ðäm các hÕ mua v« sau t¯i nay n¢m m½ ð«u s¨ cß¶i th¥m!"
		AddText( sceneId, strText )
		AddNumText( sceneId, x181002_g_scriptId, "B¡t ð¥u Ð±i Bäo ThÕch", 7, x181002_g_goodact)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x181002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181002_g_goodact then
	BeginEvent( sceneId )
		strText = "#Y M¶i lña ch÷n bäo thÕch c¥n ð±i, #B Ð±i sai không ch¸u trách nhi®m #r#Y M²i l¥n ð±i c¥n có Bäo ThÕch Ðoái Hoán Khoán c¤p ðµ"
		AddText( sceneId, strText )
		for i=1,3 do
		AddNumText( sceneId, x181002_g_scriptId, "Ð±i Bäo thÕch C¤p "..tostring(tonumber(4+i)).."", 7, 1+i)
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2	then -- 5
		BeginEvent( sceneId )
		AddText( sceneId, "" )
		for i = 2 , 13 do 
	    AddNumText( sceneId, x181002_g_scriptId, "Ð±i "..GetItemName( sceneId,x181002_g_Baoshis[1][i]), 7, 10+i)
		end	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 3	then -- 6
		BeginEvent( sceneId )
		AddText( sceneId, "" )
		for i = 2 , 13 do 
	    AddNumText( sceneId, x181002_g_scriptId, "Ð±i "..GetItemName( sceneId,x181002_g_Baoshis[2][i]), 7, 50+i)
		end	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4	then -- 7
		BeginEvent( sceneId )
		AddText( sceneId, "" )
		for i = 2 , 13 do 
	    AddNumText( sceneId, x181002_g_scriptId, "Ð±i "..GetItemName( sceneId,x181002_g_Baoshis[3][i]), 7, 100+i)
		end	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
    end
   for j= 12 ,24 do 	
	if GetNumText() == j	then
		local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ch² tr¯ng trong tay näi không ðü."
		      x181002_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ô nguyên li®u không gian không ðü."
		      x181002_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
     	if LuaFnGetAvailableItemCount(sceneId, selfId, x181002_g_Baoshis[1][1]) <1 then
		x181002_Tips(sceneId,selfId,"Các hÕ không có "..tostring( GetItemName( sceneId,x181002_g_Baoshis[1][1])))
		return
		end
	 local umn = LuaFnDelAvailableItem(sceneId,selfId,x181002_g_Baoshis[1][1], 1)
	if umn ~= 1 then 
		return
	end	
	local  pos = TryRecieveItem( sceneId, selfId, x181002_g_Baoshis[1][j-10], 1 )
	LuaFnItemBind( sceneId, selfId,pos)
	x181002_Tips(sceneId,selfId,"Thành công ð±i ðßþc "..GetItemName( sceneId,x181002_g_Baoshis[1][j-10]))
					local playerName = GetName(sceneId,selfId)
		local strText = format("#W#{_INFOUSR%s} TÕi #cFF0000Ti«n Trang#cFF0000 g£p #cFF0000Ti«n Phu Nhân[68,45] #cff66cc ðã dùng #{_ITEM30900131}#c00FFFF ð±i thành công "..GetItemName( sceneId,x181002_g_Baoshis[1][j-50]).."xin chúc m×ng ", 
					playerName, sceneName)

		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	end
	end

	for j= 52 ,64 do 	
	if GetNumText() == j	then
		local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ch² tr¯ng trong tay näi không ðü."
		      x181002_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ô nguyên li®u không gian không ðü."
		      x181002_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
     	if LuaFnGetAvailableItemCount(sceneId, selfId, x181002_g_Baoshis[2][1]) <1 then
		x181002_Tips(sceneId,selfId,"Các hÕ không có "..tostring( GetItemName( sceneId,x181002_g_Baoshis[2][1])))
		return
		end
	 local umn = LuaFnDelAvailableItem(sceneId,selfId,x181002_g_Baoshis[2][1], 1)
	if umn ~= 1 then 
		return
	end	
	local  pos = TryRecieveItem( sceneId, selfId, x181002_g_Baoshis[2][j-50], 1 )
	LuaFnItemBind( sceneId, selfId,pos)
	x181002_Tips(sceneId,selfId,"Thành công ð±i ðßþc "..GetItemName( sceneId,x181002_g_Baoshis[2][j-50]))
					local playerName = GetName(sceneId,selfId)
		local strText = format("#W#{_INFOUSR%s} TÕi #cFF0000Ti«n Trang#cFF0000 g£p #cFF0000Ti«n Phu Nhân[68,45] #cff66cc ðã dùng #{_ITEM30900132}#c00FFFF ð±i thành công "..GetItemName( sceneId,x181002_g_Baoshis[2][j-50]).."xin chúc m×ng", 
					playerName, sceneName)

		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	end
   end

	for j= 102 ,114 do 	
	if GetNumText() == j	then
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ch² tr¯ng trong tay näi không ðü."
		      x181002_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ô nguyên li®u không gian không ðü."
		      x181002_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
     	if LuaFnGetAvailableItemCount(sceneId, selfId, x181002_g_Baoshis[3][1]) <1 then
		x181002_Tips(sceneId,selfId,"Các hÕ không có "..tostring( GetItemName( sceneId,x181002_g_Baoshis[3][1])))
		return
		end
	 local umn = LuaFnDelAvailableItem(sceneId,selfId,x181002_g_Baoshis[3][1], 1)
	if umn ~= 1 then 
		return
	end	
	local  pos = TryRecieveItem( sceneId, selfId, x181002_g_Baoshis[3][j-100], 1 )
	LuaFnItemBind( sceneId, selfId,pos)
	x181002_Tips(sceneId,selfId,"Thành công ð±i ðßþc "..GetItemName( sceneId,x181002_g_Baoshis[3][j-100]))
					local playerName = GetName(sceneId,selfId)
		local strText = format("#W#{_INFOUSR%s} TÕi #cFF0000Ti«n Trang#cFF0000 g£p #cFF0000Ti«n Phu Nhân[68,45]  #cff66cc ðã dùng #{_ITEM30900133}#c00FFFF ð±i thành công "..GetItemName( sceneId,x181002_g_Baoshis[3][j-100]).."xin chúc m×ng", 
					playerName, sceneName)

		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	end
   end

end

--**********************************
--°´ÐèÀ´µ¯³öÉÌµê£¬·ÖÎªËæÉíÉÌµêºÍNPCÉÌµê
--**********************************
function x181002_Tips(sceneId,selfId,msg)
     BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
function x181002_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function  x181002_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
function x181002_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
