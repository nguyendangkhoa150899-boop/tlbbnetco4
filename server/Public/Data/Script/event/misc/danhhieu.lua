-- Áì½±NPC

x944444_g_scriptId = 944444
x944444_g_MaxBagSize	= 60
--½±Àø±ê¼Ç

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x944444_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"#RChào mØng bÕn ðªn v¾i #ecc33ccThiên Long Tám Bµ#W")		
		AddText( sceneId, strText )
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n New - Style", 6, 98 )
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n Ti«m Nång Chân Ðan", 6, 1000 )
			AddNumText( sceneId, x944444_g_scriptId, "#GH°i phøc khí huyªt", 5, 101 )
			--AddNumText( sceneId, x944444_g_scriptId, "#b#YKhoan 4 l² - Cß¶ng Hóa +9", 6, 106 )
		   -- AddNumText( sceneId, x944444_g_scriptId, "#b#GNh§n danh hi®u", 6, 105 )
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n LV 119", 6, 99 )
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n Tâm Pháp 119", 6, 96 )			
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n Nguyên Li®u Chª Ð°", 6, 100 )
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n Bí T¸ch Tàn Ði®p", 6, 97 )
			--AddNumText( sceneId, x944444_g_scriptId, "Nh§n Trân Thú Huy­n Hóa Toái Phiªn", 6, 95 )
			AddNumText( sceneId, x944444_g_scriptId, "Nh§n HBTK", 6, 94 )
            AddNumText( sceneId, x944444_g_scriptId, "#GNh§n Vàng+ÐT+KNB", 6, 103 )
			AddNumText( sceneId, x944444_g_ScriptId, "#GNh§n Th¥n Binh Phù",6,109 )
			--AddNumText( sceneId, x944444_g_ScriptId, "#GNh§n H°n Bång Châu, Linh H°n Toái Phiªn",6,110 )
			--AddNumText( sceneId, x944444_g_ScriptId, "#GNh§n Long Vån Nguyên Li®u",6,111 )
			--AddNumText( sceneId, x944444_g_ScriptId, "#GNh§n Huy«n HÕo Ng÷c, Hàn Bång Tinh Thiªt",6,112 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x944444_OnEventRequest( sceneId, selfId, targetId, eventId )	
      if GetNumText() == 105 then --danh hieu
             	BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000Gi¾i thi®u: #YCác hÕ · ðây có th¬ lña ch÷n danh hi®u mà các hÕ thích." )
		AddNumText( sceneId, x944444_g_ScriptId, "#eDC4C18Forever Alone",12,200 ) --450-451
		AddNumText( sceneId, x944444_g_ScriptId, "#ecc33ccXì Teen",12,201 ) --453-453
		AddNumText( sceneId, x944444_g_ScriptId, "#ecc33ccHoàng TØ Công Chúa",12,202 )  --455-454
		AddNumText( sceneId, x944444_g_ScriptId, "#ecc33ccMÛ nhân",12,203 ) --481-482
		AddNumText(sceneId, x944444_g_scriptId,"Quay lÕi", 8, 8888)
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	elseif GetNumText() == 110 then	--nhan nguyen lieu vo hon
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,20310117,5)
			AddItem(sceneId,20310118,5)
			AddItem(sceneId,20310119,5)
			AddItem(sceneId,20310120,5)
			AddItem(sceneId,20310121,5)
			AddItem(sceneId,30700230,150)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công!")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 98 then	--nhan pet
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddRadioItemBonus(sceneId,30309978,4)
			AddRadioItemBonus(sceneId,30309979,4)
			AddRadioItemBonus(sceneId,30309980,4)
			AddRadioItemBonus(sceneId,30309981,4)
			AddRadioItemBonus(sceneId,10141481,4)
			AddRadioItemBonus(sceneId,10141482,4)
			AddRadioItemBonus(sceneId,10141483,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x944444_g_ScriptId,0)
	elseif GetNumText() == 1000 then	--tiem nang chan dan
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddRadioItemBonus(sceneId,30900078,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x944444_g_ScriptId,0)
	elseif GetNumText() == 94 then	--thu cuoi moi
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,20310113,40)
			--AddItem(sceneId,20310021,40)
			--AddItem(sceneId,20310113,50)
			--AddItem(sceneId,20310114,50)
			--AddItem(sceneId,10157005,1)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công!")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 111 then	--nguyen lieu long van
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,38000184,1)
			AddItem(sceneId,38000185,1)
			AddItem(sceneId,38000186,1)
			AddItem(sceneId,10157005,1)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công!")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )	
	
	elseif GetNumText() == 99 then	--lv 119
			local Level = GetLevel( sceneId, selfId )
			if Level >=119 then
			 BeginEvent(sceneId)
			  strText = format("Ngß½i ðã 119 r°i nh§n gì næa!")
			  AddText(sceneId,strText)
 		  EndEvent(sceneId)

 		  DispatchMissionTips(sceneId,selfId)

				return 0
				end
			
             BeginEvent( sceneId )	
			SetLevel(sceneId,selfId,119)	
			AddText( sceneId, "Thành Công!")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 96 then	--tp 119
					BeginEvent( sceneId )	
				local MenPai=GetMenPai(sceneId, selfId)
				if MenPai ==9 then
					BeginEvent( sceneId )	
					AddText( sceneId, "Các hÕ chßa gia nh§p phái nào!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==0 then
					LuaFnSetXinFaLevel(sceneId,selfId,1,119)
					LuaFnSetXinFaLevel(sceneId,selfId,2,119)
					LuaFnSetXinFaLevel(sceneId,selfId,3,119)
					LuaFnSetXinFaLevel(sceneId,selfId,4,119)
					LuaFnSetXinFaLevel(sceneId,selfId,5,119)
					LuaFnSetXinFaLevel(sceneId,selfId,6,119)
					LuaFnSetXinFaLevel(sceneId,selfId,55,119)
					LuaFnSetXinFaLevel(sceneId,selfId,72,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==1 then
					LuaFnSetXinFaLevel(sceneId,selfId,7,119)
					LuaFnSetXinFaLevel(sceneId,selfId,8,119)
					LuaFnSetXinFaLevel(sceneId,selfId,9,119)
					LuaFnSetXinFaLevel(sceneId,selfId,10,119)
					LuaFnSetXinFaLevel(sceneId,selfId,11,119)
					LuaFnSetXinFaLevel(sceneId,selfId,12,119)
					LuaFnSetXinFaLevel(sceneId,selfId,56,119)
					LuaFnSetXinFaLevel(sceneId,selfId,73,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==2 then
					LuaFnSetXinFaLevel(sceneId,selfId,13,119)
					LuaFnSetXinFaLevel(sceneId,selfId,14,119)
					LuaFnSetXinFaLevel(sceneId,selfId,15,119)
					LuaFnSetXinFaLevel(sceneId,selfId,16,119)
					LuaFnSetXinFaLevel(sceneId,selfId,17,119)
					LuaFnSetXinFaLevel(sceneId,selfId,18,119)
					LuaFnSetXinFaLevel(sceneId,selfId,57,119)
					LuaFnSetXinFaLevel(sceneId,selfId,74,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==3 then
					LuaFnSetXinFaLevel(sceneId,selfId,19,119)
					LuaFnSetXinFaLevel(sceneId,selfId,20,119)
					LuaFnSetXinFaLevel(sceneId,selfId,21,119)
					LuaFnSetXinFaLevel(sceneId,selfId,22,119)
					LuaFnSetXinFaLevel(sceneId,selfId,23,119)
					LuaFnSetXinFaLevel(sceneId,selfId,24,119)
					LuaFnSetXinFaLevel(sceneId,selfId,58,119)
					LuaFnSetXinFaLevel(sceneId,selfId,75,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==4 then
					LuaFnSetXinFaLevel(sceneId,selfId,25,119)
					LuaFnSetXinFaLevel(sceneId,selfId,26,119)
					LuaFnSetXinFaLevel(sceneId,selfId,27,119)
					LuaFnSetXinFaLevel(sceneId,selfId,28,119)
					LuaFnSetXinFaLevel(sceneId,selfId,29,119)
					LuaFnSetXinFaLevel(sceneId,selfId,30,119)
					LuaFnSetXinFaLevel(sceneId,selfId,59,119)
					LuaFnSetXinFaLevel(sceneId,selfId,76,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==5 then
					LuaFnSetXinFaLevel(sceneId,selfId,31,119)
					LuaFnSetXinFaLevel(sceneId,selfId,32,119)
					LuaFnSetXinFaLevel(sceneId,selfId,33,119)
					LuaFnSetXinFaLevel(sceneId,selfId,34,119)
					LuaFnSetXinFaLevel(sceneId,selfId,35,119)
					LuaFnSetXinFaLevel(sceneId,selfId,36,119)
					LuaFnSetXinFaLevel(sceneId,selfId,60,119)
					LuaFnSetXinFaLevel(sceneId,selfId,77,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==6 then
					LuaFnSetXinFaLevel(sceneId,selfId,37,119)
					LuaFnSetXinFaLevel(sceneId,selfId,38,119)
					LuaFnSetXinFaLevel(sceneId,selfId,39,119)
					LuaFnSetXinFaLevel(sceneId,selfId,40,119)
					LuaFnSetXinFaLevel(sceneId,selfId,41,119)
					LuaFnSetXinFaLevel(sceneId,selfId,42,119)
					LuaFnSetXinFaLevel(sceneId,selfId,61,119)
					LuaFnSetXinFaLevel(sceneId,selfId,78,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==7 then
					LuaFnSetXinFaLevel(sceneId,selfId,43,119)
					LuaFnSetXinFaLevel(sceneId,selfId,44,119)
					LuaFnSetXinFaLevel(sceneId,selfId,45,119)
					LuaFnSetXinFaLevel(sceneId,selfId,46,119)
					LuaFnSetXinFaLevel(sceneId,selfId,47,119)
					LuaFnSetXinFaLevel(sceneId,selfId,48,119)
					LuaFnSetXinFaLevel(sceneId,selfId,62,119)
					LuaFnSetXinFaLevel(sceneId,selfId,79,119)
					AddText( sceneId, "Thành Công!")
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
				elseif MenPai ==8 then
					LuaFnSetXinFaLevel(sceneId,selfId,49,119)
					LuaFnSetXinFaLevel(sceneId,selfId,50,119)
					LuaFnSetXinFaLevel(sceneId,selfId,51,119)
					LuaFnSetXinFaLevel(sceneId,selfId,52,119)
					LuaFnSetXinFaLevel(sceneId,selfId,53,119)
					LuaFnSetXinFaLevel(sceneId,selfId,54,119)
					LuaFnSetXinFaLevel(sceneId,selfId,63,119)
					LuaFnSetXinFaLevel(sceneId,selfId,80,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )

				elseif MenPai ==10 then
					LuaFnSetXinFaLevel(sceneId,selfId,64,119)
					LuaFnSetXinFaLevel(sceneId,selfId,65,119)
					LuaFnSetXinFaLevel(sceneId,selfId,66,119)
					LuaFnSetXinFaLevel(sceneId,selfId,67,119)
					LuaFnSetXinFaLevel(sceneId,selfId,68,119)
					LuaFnSetXinFaLevel(sceneId,selfId,69,119)
					LuaFnSetXinFaLevel(sceneId,selfId,70,119)
					LuaFnSetXinFaLevel(sceneId,selfId,71,119)
					AddText( sceneId, "Thành Công!")
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					end

	elseif GetNumText() == 95 then	--tran thu huyen hoa
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,20310115,100)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )

		
	elseif GetNumText() == 97 then	--bi tich tan diep
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,30308332,100)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 109 then	--nhan nguyen lieu
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			--AddItem(sceneId,30505816,15)
			--AddItem(sceneId,30505817,20)
			AddItem(sceneId,30505908,50)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 100 then	--nhan nguyen lieu
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,20500008,50)
			AddItem(sceneId,20501008,500)
			AddItem(sceneId,20502008,500)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 112 then	--nhan nguyen lieu
             BeginEvent( sceneId )			
			BeginAddItem(sceneId)
			AddItem(sceneId,20310020,50)
			AddItem(sceneId,20310113,100)
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)			
			AddText( sceneId, "#GNh§n Thành Công")
			EndEvent( sceneId )
            DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() ==103  then		
		AddMoney(sceneId,selfId,100000000) --add  vang
		ZengDian(sceneId,selfId,targetId,1,3000000) --add diem tang
		YuanBao(sceneId,selfId,targetId,1,3000000) --add knb
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent( sceneId )
			AddText( sceneId, "Chúc m×ng các hÕ nh§n thành công!" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	 elseif GetNumText()==106 then
		local tEquipGemTable	= { 0,1,2,3,4,5,6,7,10,11,12,13,14,15,16,17,18}
		local	Bore_Count			= GetBagGemCount( sceneId, selfId, 0 )
		local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		local find						= 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end			
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, 0 )					
					while equipMaxGemCount<3 do				
						local ret = AddBagItemSlot( sceneId, selfId, 0 )
						equipMaxGemCount = GetBagGemCount( sceneId, selfId, 0 )			
					end
                                                             AddBagItemSlotFour( sceneId, selfId, 0 )
				end			
								for i = 0,9  do
								LuaFnEquipEnhance( sceneId, selfId, 0, 0 )											
								end
						end		
		
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x944444_MsgBox( sceneId, selfId, "#YTrang b¸ khoan thành công!" )
		--danh hieu
	elseif GetNumText() == 200 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18Forever Alone" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 201 then
		local Name	= LuaFnGetName( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#ecc33cc"..Name.." Xì Teen" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 202 then
			local  PlayerSex=GetSex(sceneId,selfId)
			local Name	= LuaFnGetName( sceneId, selfId )
			if PlayerSex == 0 then
				LuaFnAwardSpouseTitle( sceneId, selfId, "#ecc33cc"..Name.." Công Chúa" )
				DispatchAllTitle( sceneId, selfId )
				else
				LuaFnAwardSpouseTitle( sceneId, selfId, "#ecc33cc"..Name.." Hoàng TØ" )
				DispatchAllTitle( sceneId, selfId )
				end		
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 203 then
			local  PlayerSex=GetSex(sceneId,selfId)
			if PlayerSex == 0 then
				LuaFnAwardSpouseTitle( sceneId, selfId, "#ecc33ccÐ® Nh¤t MÛ Nhân" )
				DispatchAllTitle( sceneId, selfId )
				else
				LuaFnAwardSpouseTitle( sceneId, selfId, "#ecc33ccÐ® Nh¤t MÛ Nam" )
				DispatchAllTitle( sceneId, selfId )
				end		
			BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 101 then	--tri lieu
              x944444_Restore_hpmp( sceneId, selfId, targetId )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
			AddText(sceneId,"Tr¸ li®u thành công!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	end	
end
--**********************************
--¶Ô»°ÌáÊ¾
--**********************************
function x944444_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x944444_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--»Ö¸´ÑªºÍÆø
--**********************************
function x944444_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	RestoreRage( sceneId, selfId )
end
function x944444_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end
function x944444_OnMissionSubmit(sceneId,selfId,targetId,missionScriptId,selectRadioId)

	--*****************--
	TryRecieveItem(sceneId,selfId,selectRadioId,1);
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	x000223_NotifyFailTips(sceneId,selfId,"Nh§n thß·ng thành công!")
	--*****************--
	
end
