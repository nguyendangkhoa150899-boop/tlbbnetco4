-- Áì½±NPC

x111997_g_scriptId = 111997

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x111997_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )	
		AddText(sceneId, "#RChào m×ng các hÕ ðªn v¾i Thiên Long Bát Bµ ta ðây có th¬ cho ngß½i danh hi®u biªn thân!")			
		--AddNumText( sceneId, x111997_g_scriptId, "Chuy¬n sinh", 2, 101 )
		--AddNumText( sceneId, x111997_g_scriptId, "#R[Alpha test thång c¤p vô hÕn]", 2, 102 )
		--AddNumText( sceneId, x111997_g_ScriptId, "Buff Thiên Long",6,103 )
		--AddNumText( sceneId, x111997_g_scriptId, "Biªn thân", 6, 104 )			
		AddNumText( sceneId, x111997_g_scriptId, "Nh§n danh hi®u", 6, 105 )
		AddNumText( sceneId, x111997_g_scriptId, "#GCh\170 h\224ng lo\213t \240\176 9x (10 c\225i)", 6, 9500 )   -- [NetCo4 08/10] NPC che do
		AddNumText( sceneId, x111997_g_scriptId, "#GGi\225m \240\184nh t\164t c\228 trang b\184 (Gi\225m \208\184nh Ph\249)", 6, 9501 )
		if GetName( sceneId, selfId ) == "bialk" then AddNumText( sceneId, x111997_g_scriptId, "#Y[GM] Xem trang thai giam dinh", 6, 9502 ) end
		--AddNumText( sceneId, x111997_g_scriptId, "#b#GNh§n danh hi®u TOP", 6, 106 )
	 
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x111997_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() >= 9500 and GetNumText() <= 9999 then   -- [NetCo4 08/10] NPC che do
		x111997_NetCo4CheDo( sceneId, selfId, targetId, GetNumText() )
		return
	end
	if GetNumText() == 101 then
    local 	nam	= LuaFnGetName( sceneId, selfId )
	local	uiPoint = GetHumanJuqingPoint(sceneId, selfId)
	BeginEvent(sceneId)
	      AddText(sceneId,"   #WChào #G"..nam.." #Wðªn g£p ta có chuy®n gì? Các hÕ mu¯n chuy¬n sinh à?")	
	      AddText(sceneId,"   #WCác hÕ ðã chuy¬n sinh #G"..uiPoint.." #Wl¥n r°i!")
			AddNumText( sceneId, x111997_g_ScriptId, "Ðúng ta mu¯n Chuy¬n sinh", 1, 1011 )
			AddNumText( sceneId, x111997_g_ScriptId, "V« chuy¬n sinh", 11, 1012 )
			AddNumText( sceneId, x111997_g_scriptId,"Quay lÕi", 8, 8888)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 102 then
		BeginAddItem(sceneId)
		AddItem( sceneId, 30900078, 7 )
		AddItem( sceneId, 30900079, 7 )
		AddItem( sceneId, 39999901, 2 )
		AddItem( sceneId, 30309090, 1 )
		AddItem( sceneId, 50813004, 2 )
		AddItem( sceneId, 10422016, 1 )
		AddItem( sceneId, 10423024, 1 )
		EndAddItem(sceneId,selfId)		
		AddItemListToHuman(sceneId,selfId)		
		--for i = 0,100 do
		--BeginEvent(sceneId)
		--LuaFnAddExp( sceneId, selfId,60000000)
		--LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
		--SetLevel( sceneId, selfId, 130)
	    --local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		--SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint+30000 )
		--AddText(sceneId,"Lînh ði¬m c¯ng hiªn môn phái thành công các hÕ ðßþc 30000 ði¬m công hiªn")
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
        --end

	elseif GetNumText() == 103 then
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 8039, 0) --tim
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Nh§n hi®u Ñng thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
    
	elseif GetNumText() == 104 then
             	BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000Gi¾i thi®u: #YM¶i các hÕ lña ch÷n loÕi hình biªn thân" )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YTh¯ Gia",7,8501 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YThö Ng÷c",7,8502 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YH¡c Hùng",7,8503 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YÐång Mê",7,8504 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YCây thông Noel",7,8505 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YChuông l¾n",7,8506 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YÐß¶ng quä hÕp",7,8507 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YPh¤n H°ng Hùng",7,8508 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YTi¬u H° Tiên",7,8509 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YÐÕi B±n Hùng",7,8510 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YCông Phu Hùng Miêu",7,8511 )
		AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YSiêu Nhân Hùng Miêu",7,8512 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#GSiêu c¤p biªn thân #W-- #YTest",7,8513 )
		AddNumText(sceneId, x111997_g_scriptId,"Quay lÕi", 8, 8888)
    	EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
    
	elseif GetNumText() == 105 then
		local strGUID = LuaFnGetGUID( sceneId, selfId )
        BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000Gi¾i thi®u: #YCác hÕ · ðây có th¬ lña ch÷n danh hi®u mà các hÕ thích." )
		AddNumText( sceneId, x111997_g_ScriptId, "#eDC4C18NetCo4",7,15 )
		AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0T¸ch M¸ch Cao Thü ",7,16 )
		AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Nh¤t ÐÕi Cao Thü",7,17 )
		AddNumText( sceneId, x111997_g_ScriptId, "#Y TÑ ÐÕi MÛ Nhân",7,18 )
		AddNumText( sceneId, x111997_g_ScriptId, "#Y TÑ ÐÕi MÛ Nam",7,19 )
		AddNumText( sceneId, x111997_g_ScriptId, "#YC¦m Y V®",7,20 )
		AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0TÑ ÐÕi Hµ V®",7,21 )
		AddNumText( sceneId, x111997_g_ScriptId, "#YChü T¸ch Phß¶ng #3 ",7,22 )
		AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Hùng Chþ L¾n",7,23 )
		AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Trß·ng Thôn  #1",7,24 )
		AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Trß·ng Công An Xã #3",7,25 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Phong Bøi",7,26 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Ng÷ng Ng² Ngáo",7,27 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Vþ Hùng Chþ L¾n",7,28 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#gff00f0Th¥n FA",7,29 )
		--AddNumText( sceneId, x111997_g_scriptId, "#gff00f0Quay lÕi", 8, 8888)
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
	elseif GetNumText() == 106 then
		local strGUID = LuaFnGetGUID( sceneId, selfId )	
        BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000Xin m¶i các cao thü lña ch÷n danh hi®u Top mu¯n nh§n!" )
		if strGUID == -1 then	
		AddNumText( sceneId, x111997_g_ScriptId, "Vô Thß¶ng",7,201 )
		end
		if strGUID == -1 then	
		AddNumText( sceneId, x111997_g_ScriptId, "Ð® Nh¤t Yêu Vþ",7,203 )
		end		
		if strGUID == -1 then
		AddNumText( sceneId, x111997_g_ScriptId, "Ð® Nh¤t Ðê Ti®n",7,204 )
		end
		if strGUID == -1 then
		AddNumText( sceneId, x111997_g_ScriptId, "Ð® Nh¤t Ðen Ðüi",7,205 )
		end
		--if strGUID == -1 then
		--AddNumText( sceneId, x111997_g_ScriptId, "Ð® Tam Thß Kiªm",7,204 )	
		--end
		--if strGUID == -1 then
		--AddNumText( sceneId, x111997_g_ScriptId, "Thß Kiªm Tinh Anh",7,206 )
		--end
		--if strGUID == -1 then
		--AddNumText( sceneId, x111997_g_ScriptId, "Kiªm Khách Tinh Anh",7,207 )
		--end	
		--if strGUID == -1 then
		--AddNumText( sceneId, x111997_g_ScriptId, "Kiªm Khách Tinh Anh",7,208 )
		--end
		--if strGUID == -1 then
		--AddNumText( sceneId, x111997_g_ScriptId, "Kiªm Khách Tinh Anh",7,209 )
		--end			
		--if strGUID == -1 then
		AddNumText( sceneId, x111997_g_ScriptId, "Tây Phß½ng Th¤t BÕi",7,210 )
		--AddNumText( sceneId, x111997_g_ScriptId, "Princess Of The Game",7,211 )
		--AddNumText( sceneId, x111997_g_ScriptId, "Princes Of The Game",7,212 )
		--AddNumText( sceneId, x111997_g_ScriptId, "Á Ðù",7,213 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#eDC4C18X¤u mà có #458",7,214 )
		--AddNumText( sceneId, x111997_g_ScriptId, "#eFF0000Chém Tàu #455",7,215 )
		--end)
		AddNumText( sceneId, x111997_g_scriptId, "Quay lÕi", 8, 8888)
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )		
	
	elseif GetNumText() == 1011 then
		x111997_ZhuanSheng( sceneId, selfId, targetId )	

	elseif GetNumText() == 1012 then
		BeginEvent( sceneId )
		  AddText(sceneId,"   #BV« chuy¬n sinh:")
		  AddText(sceneId,"#GL¥n chuy¬n sinh t× #W1 #Gðªn #W50 #Gyêu c¥u c¤p ðµ #W120#G.")
		  AddText(sceneId,"#GL¥n chuy¬n sinh t× #W51 #Gðªn 99 #Gyêu c¥u c¤p ðµ #W140#G.")
		  AddText(sceneId,"#GT× l¥n 100 tr· ði yêu c¥u c¤p ðµ #W149 #Gvà #W150 #Gviên #{_ITEM39910025}")
		  AddNumText( sceneId, x111997_g_scriptId,"Quay lÕi", 8, 8888)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
					

	elseif GetNumText() == 8501 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4878, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8502 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4867, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8503 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4828, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8504 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5723, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8505 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4863, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8506 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4864, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8507 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4865, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8508 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4866, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8509 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5710, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8510 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5006, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8511 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5708, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8512 then
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5709, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Biªn thân thành công, chúc các hÕ ch½i game vui vë!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		


	elseif GetNumText() == 15 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18#450NetCo4#451" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 16 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0T¸ch M¸ch Cao Thü" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		elseif GetNumText() == 17 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0#455Nh¤t ÐÕi Cao Thü#454" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 18 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#Y TÑ ÐÕi MÛ Nhân" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 19 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#Y TÑ ÐÕi MÛ Nam" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 20 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#YC¦m Y V®" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 21 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0TÑ ÐÕi Hµ V®" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 22 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#YChü T¸ch Phß¶ng #3" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 23 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0#455Hùng Chþ L¾n#454" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GGChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 24 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0Trß·ng Thôn  #1" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 25 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0Trß·ng Công An Xã #3" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 26 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0#455Phong Bøi#454" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 27 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0#477Ng÷ng Ng² Ngáo#478" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 28 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0#468Vþ Hùng Chþ L¾n#469" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText()  == 29 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#gff00f0#468Th¥n FA#469" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	

	elseif GetNumText() == 8888 then
		x111997_OnDefaultEvent( sceneId, selfId,targetId )	


	elseif GetNumText() == 201 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18#450Vô Thß¶ng#451" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 202 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Vô Thß¶ng" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	
		
	elseif GetNumText() == 203 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Ð® Nh¤t Yêu Vþ" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 204 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Ð® Nh¤t Ðê Ti®n" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
	elseif GetNumText() == 205 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Ð® Nh¤t Ðen Ðüi" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 206 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#G#450Thß Kiªm Tinh Anh#451" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 207 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#G#450Kiªm Khách Tinh Anh#451" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 208 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#G#450Kiªm Khách Tinh Anh#451" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 209 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#G#450Kiªm Khách Tinh Anh#451" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	elseif GetNumText() == 210 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "Tây Phß½ng Th¤t BÕi" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 211 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Princess Of The Game" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
	elseif GetNumText() == 212 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Princes Of The Game" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	
	elseif GetNumText() == 213 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18#460Á Ðù#461" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 214 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18X¤u mà có #458" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
	elseif GetNumText() == 215 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eFF0000Chém Tàu #455" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
			
	end	
end


function x111997_ZhuanSheng( sceneId, selfId, targetId )
 	local	lev	= GetLevel( sceneId, selfId )
	local	uiPoint = GetHumanJuqingPoint(sceneId, selfId)
	local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
    if uiPoint >= 300 then
        BeginEvent( sceneId )
            AddText( sceneId, "Các hÕ ðã chuy¬n sinh ðªn cñc hÕng không c¥n chuy¬n sinh næa, th§t là là bá ðÕo #22" )
        EndEvent( sceneId )
        DispatchEventList( sceneId, selfId, targetId )
        
        return -1
    end
 
    if uiPoint >= 100 then
        if lev < 149 then
            BeginEvent( sceneId )
            AddText( sceneId, "ÐÆng c¤p nhö h½n #G149#W. Hãy quay lÕi khi ðÕt c¤p ðµ #G149#W." )
            EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
            return -1
        end
        local number = LuaFnGetAvailableItemCount(sceneId, selfId, 39910025)
        if number<150 then
            BeginEvent( sceneId )
            AddText( sceneId, "#GCác hÕ c¥n thu th§p ðü #Y150 #Gviên #W#{_ITEM39910025} #Gð¬ có th¬ chuy¬n sinh." )
            EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
            return -1
        else
            local reply = LuaFnDelAvailableItem(sceneId,selfId,39910025,150)
        end
    end
    
    if uiPoint >50 then
        if lev < 140 then
            BeginEvent( sceneId )
            AddText( sceneId, "ÐÆng c¤p nhö h½n #G140#W. Hãy quay lÕi khi ðÕt c¤p ðµ #G140.#W " )
            EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
        return -1
        end
        
    end
    if lev < 120 then
        BeginEvent( sceneId )
        AddText( sceneId, "ÐÆng c¤p nhö h½n #G120#W. Hãy quay lÕi khi ðÕt c¤p ðµ #G120#W " )
        EndEvent( sceneId )
        DispatchEventList( sceneId, selfId, targetId )
        return -1
    end

 	SetLevel( sceneId, selfId, 35)
	if uiPoint == 1 then
	ZengDian(sceneId,selfId,targetId,1,50000)
	end
	SetHumanJuqingPoint(sceneId, selfId, uiPoint+1)
	AddExp(sceneId,selfId,GetExp(sceneId,selfId)*-1)	
 	BeginEvent(sceneId)
		AddText(sceneId, "Chúc m×ng các hÕ, chuy¬n sinh thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	uiPoint = uiPoint + 1	
        AddText(sceneId,"#GChúc m×ng, chuy¬n sinh l¥n #Y"..uiPoint.. " #Gthành công!!!")
        AddText( sceneId, "#WServer gi¾i hÕn s¯ l¥n chuy¬n sinh là #Y300" )
    EndEvent(sceneId)
    DispatchEventList( sceneId, selfId, targetId )
	uiPoint = uiPoint + 0
	BroadMsgByChatPipe( sceneId, selfId, "#ga099ff "..nam.."#ga099ff chuy¬n sinh thành công! ðây là l¥n chuy¬n sinh thÑ: #ga099ff "..uiPoint.."!#r#212", 4 ) 
end

-- [NetCo4 08/10] NPC CHE DO (Muc Thanh Danh). docs/TRANG-THAI.md muc 08/10 auto che do.
--  9500 chon vi tri -> 9510+s chon mon -> 9600+10s+k che 10 cai: tru 10 ban ve + 10 vat lieu cap 8 (Mien Bo 8 giap / Bi Ngan 8 trang suc),
--  TryRecieveItem(mon, 16) = cot "duc bang vat lieu cap 8" (ty le VL8 C8 65% / C9 35%). Truoc 08/10 toi dung 7 (khong vat lieu, C2-C3) - SAI.
--  (cu: cot "che khong nguyen lieu",
--  ItemCompound cot 31 = 7, giong che tay Tinh Cong / Cong Nghe cap 1). Tao thieu thi tra lai ban ve.
--  9501 giam dinh tat ca: moi trang bi chua giam dinh (GetBagItemIdent = 0) tru 1 Giam Dinh Phu du cap. 9502 [GM] xem.
x111997_NetCo4SoLuong = 10
x111997_NetCo4Phu = { 30505050, 30505051, 30505052, 30505053, 30505054, 30505055, 30505056, 30505057, 30505058, 30505059 }
x111997_NetCo4ViTri = {
	{ ten = "M\251", banve = 20308070, vl = 20501008, vlten = "Mi\234n B\175 c\164p 8", mon = { { 10210020, "Huy\173n Th\170 Th\225nh C\226n" }, { 10210040, "Ph\174 L\226n Th\225nh Quan" }, { 10210060, "Hung M\213ch Th\225nh Kh\244i" } } },   -- 1 Mu
	{ ten = "\193o", banve = 20308080, vl = 20501008, vlten = "Mi\234n B\175 c\164p 8", mon = { { 10213020, "Huy\173n Th\170 Ma Y" }, { 10213040, "Ph\174 L\226n Th\225nh C\215u" }, { 10213060, "Hung M\213ch Th\225nh Gi\225p" } } },   -- 2 Ao
	{ ten = "Bao tay", banve = 20308090, vl = 20501008, vlten = "Mi\234n B\175 c\164p 8", mon = { { 10212020, "Huy\173n Th\170 Th\252 S\225o" }, { 10212040, "Ph\174 L\226n Huy\171n Th\252" }, { 10212060, "Hung M\213ch Th\225nh Ch\223\183ng" } } },   -- 3 Bao tay
	{ ten = "Gi\224y", banve = 20308100, vl = 20501008, vlten = "Mi\234n B\175 c\164p 8", mon = { { 10211020, "Huy\173n Th\170 Th\225nh Ngoa" }, { 10211040, "Ph\174 L\226n Th\225nh L\253" }, { 10211060, "Hung M\213ch Th\225nh Ngoa" } } },   -- 4 Giay
	{ ten = "H\181 uy\172n", banve = 20308140, vl = 20501008, vlten = "Mi\234n B\175 c\164p 8", mon = { { 10214020, "Huy\173n Th\170 Ma O\228n" } } },   -- 6 Ho uyen
	{ ten = "H\181 ki\234n", banve = 20308150, vl = 20501008, vlten = "Mi\234n B\175 c\164p 8", mon = { { 10215020, "Huy\173n Th\170 Ma Ki\234n" } } },   -- 7 Ho kien
	{ ten = "D\226y chuy\171n", banve = 20308110, vl = 20502008, vlten = "B\237 Ng\226n c\164p 8", mon = { { 10220020, "\208i\174p Luy\170n" } } },   -- 8 Day chuyen
	{ ten = "H\181 ph\249", banve = 20308130, vl = 20502008, vlten = "B\237 Ng\226n c\164p 8", mon = { { 10223020, "Phi Tuy\170t" }, { 10223035, "B\237ch L\226u" }, { 10223036, "Thi\172n L\227ng" } } },   -- 9 Ho phu
	{ ten = "Nh\231n", banve = 20308120, vl = 20502008, vlten = "B\237 Ng\226n c\164p 8", mon = { { 10222020, "Ph\167t Ng\230" }, { 10222035, "Kinh T\226m" }, { 10222036, "Ho\224nh \208\184ch" } } },   -- 10 Nhan
}

function x111997_NetCo4Bao( sceneId, selfId, s )
	BeginEvent( sceneId )
		AddText( sceneId, s )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x111997_NetCo4CheDo( sceneId, selfId, targetId, so )
	local sl = x111997_NetCo4SoLuong
	if so == 9500 then
		BeginEvent( sceneId )
			AddText( sceneId, "Ch\247n lo\213i trang b\184 9x mu\175n ch\170. M\178i l\165n ch\170 10 c\225i, c\165n 10 b\228n v\168 \208\228 T\213o \208\176 c\164p 10 c\249ng lo\213i + 10 v\167t li\174u c\164p 8 (Mi\234n B\175 8 cho gi\225p, B\237 Ng\226n 8 cho trang s\209c) v\224 10 \244 tr\175ng trong t\250i." )
			for s = 1, getn( x111997_NetCo4ViTri ) do
				AddNumText( sceneId, x111997_g_scriptId, x111997_NetCo4ViTri[s].ten, 6, 9510 + s )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	if so >= 9511 and so <= 9510 + getn( x111997_NetCo4ViTri ) then
		local v = x111997_NetCo4ViTri[so - 9510]
		BeginEvent( sceneId )
			AddText( sceneId, v.ten .. ": ch\247n m\243n. M\178i l\165n tr\215 10 b\228n v\168 + 10 " .. v.vlten .. ", ra 10 c\225i." )
			for k = 1, getn( v.mon ) do
				AddNumText( sceneId, x111997_g_scriptId, v.mon[k][2] .. " (10)", 6, 9600 + ( so - 9510 ) * 10 + k )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	if so >= 9611 and so <= 9709 then
		local v = x111997_NetCo4ViTri[floor( ( so - 9600 ) / 10 )]
		if not v then return end
		local m = v.mon[mod( so - 9600, 10 )]
		if not m then return end
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < sl then
			x111997_NetCo4Bao( sceneId, selfId, "T\250i c\165n \237t nh\164t 10 \244 tr\175ng." )
			return
		end
		if LuaFnGetAvailableItemCount( sceneId, selfId, v.banve ) < sl then
			x111997_NetCo4Bao( sceneId, selfId, "C\165n 10 b\228n v\168 \208\228 T\213o \208\176 c\164p 10 lo\213i " .. v.ten .. " (kh\244ng kh\243a)." )
			return
		end
		if LuaFnGetAvailableItemCount( sceneId, selfId, v.vl ) < sl then   -- [08/10] vat lieu cap 8 nhu che tay
			x111997_NetCo4Bao( sceneId, selfId, "C\165n 10 " .. v.vlten .. " (kh\244ng kh\243a)." )
			return
		end
		if LuaFnDelAvailableItem( sceneId, selfId, v.banve, sl ) ~= 1 then
			x111997_NetCo4Bao( sceneId, selfId, "Tr\215 b\228n v\168 th\164t b\213i, th\216 l\213i." )
			return
		end
		if LuaFnDelAvailableItem( sceneId, selfId, v.vl, sl ) ~= 1 then
			for k = 1, sl do TryRecieveItem( sceneId, selfId, v.banve, QUALITY_MUST_BE_CHANGE ) end   -- tru vat lieu loi -> tra ban ve
			x111997_NetCo4Bao( sceneId, selfId, "Tr\215 v\167t li\174u th\164t b\213i, \240\227 tr\228 b\228n v\168." )
			return
		end
		local n = 0
		for k = 1, sl do
			local pos = TryRecieveItem( sceneId, selfId, m[1], 16 )   -- 16 = duc bang vat lieu cap 8
			if pos and pos >= 0 then n = n + 1 end
		end
		for k = n + 1, sl do
			TryRecieveItem( sceneId, selfId, v.banve, QUALITY_MUST_BE_CHANGE )   -- tao thieu -> tra ban ve + vat lieu
			TryRecieveItem( sceneId, selfId, v.vl, QUALITY_MUST_BE_CHANGE )
		end
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		x111997_NetCo4Bao( sceneId, selfId, "\208\227 ch\170 " .. n .. "/" .. sl .. " " .. m[2] )
		return
	end
	if so == 9501 or so == 9502 then
		local bb = GetBasicBagStartPos( sceneId, selfId )
		local be = GetBasicBagEndPos( sceneId, selfId )
		local xem, n, thieu, khoa = "", 0, 0, 0
		for i = bb, be do
			local id = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )
			if id >= 10000000 and id < 20000000 then
				local gd = GetBagItemIdent( sceneId, selfId, i )
				local lv = GetBagItemLevel( sceneId, selfId, i )
				if so == 9502 then
					xem = xem .. "o " .. i .. ": " .. id .. " cap " .. lv .. " ident " .. gd .. "#r"
				elseif gd == 0 then
					if LuaFnIsItemLocked( sceneId, selfId, i ) ~= 0 then
						khoa = khoa + 1
					else
						local phu = 0
						for c = 1, 10 do
							if phu == 0 and c * 10 >= lv and LuaFnGetAvailableItemCount( sceneId, selfId, x111997_NetCo4Phu[c] ) > 0 then phu = x111997_NetCo4Phu[c] end
						end
						if phu == 0 then
							thieu = thieu + 1
						elseif LuaFnDelAvailableItem( sceneId, selfId, phu, 1 ) == 1 then
							SetBagItemIdent( sceneId, selfId, i )
							LuaFnRefreshItemInfo( sceneId, selfId, i )
							n = n + 1
						end
					end
				end
			end
		end
		if so == 9502 then
			if not ( GetName( sceneId, selfId ) == "bialk" ) then return end
			BeginEvent( sceneId )
				AddText( sceneId, "[GM] Trang thai giam dinh (ident) trang bi trong tui:#r" .. xem )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		if n > 0 then LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 ) end
		x111997_NetCo4Bao( sceneId, selfId, "\208\227 gi\225m \240\184nh " .. n .. " m\243n. Thi\170u ph\249: " .. thieu .. ". \208ang kh\243a: " .. khoa )
		return
	end
end
