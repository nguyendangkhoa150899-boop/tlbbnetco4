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
		--AddNumText( sceneId, x111997_g_scriptId, "#b#GNh§n danh hi®u TOP", 6, 106 )
	 
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x111997_OnEventRequest( sceneId, selfId, targetId, eventId )
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
