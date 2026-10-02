------  dçn tß·ng NPC
x990010_XinFaList  =  {{1,2,3,4,5,6,55,72},{7,8,9,10,11,12,56,73},{13,14,15,16,17,18,57,74},
{19,20,21,22,23,24,58,75},{25,26,27,28,29,30,59,76},{31,32,33,34,35,36,60,77},
{37,38,39,40,41,42,61,78},{43,44,45,46,47,48,62,79},{49,50,51,52,53,54,63,80},{0,0,0,0,0,0,0,0},
{64,65,66,67,68,69,70,71},{81,82,83,84,85,86,87,88},{89,90,91,92,93,94,95,96},}

x990010_MenPaiShiZhuang  ={10124000,10124001,10124002,10124004,10124003,10124005,10124008,10124006,10124007,0,10124074,10124119,10124943}  

x990010_MenPaiName  ={" Thiªu Lâm "," Minh Giáo "," Cái Bang "," Võ Ðang "," Nga Mi "," Tinh Túc "," Thiên Long "," Thiên S½n "," Tiêu Dao "," không cØa phái "," Mµ Dung "," Ðß¶ng Môn "," QuÖ C¯c "}

x990010_g_scriptId  =  990010
x990010_g_VangNgay = 2000        -- [NetCo4 30/09] vang khong khoa mien phi moi ngay (1 lan / nhan vat / ngay)
x990010_g_VangDir = "./txt/NetCo4Web/"   -- trang thai <GUID>.vang = so ngay yyyymmdd
x990010_g_VangKhoaNgay = 8000    -- [NetCo4 01/10] vang KHOA mien phi moi ngay (1 lan / nhan vat / ngay), them ngoai 2.000 vang khong khoa. Trang thai <GUID>.vangkhoa
-- [NetCo4 30/09] Gio mo cua Hau Hoa Vien (scene 62/82/182). Mo tu HHV_Mo gio den truoc HHV_Dong gio. Mo=0, Dong=24 = mo ca ngay.
x990010_g_HHV_Mo = 22    -- [02/10] mo 22:00 - 23:59 moi ngay (chu server chot, ca ngay mo server)
x990010_g_HHV_Dong = 24
function x990010_HHV_DangMo()
	local h = GetHour()
	if h >= x990010_g_HHV_Mo and h < x990010_g_HHV_Dong then
		return 1
	end
	return 0
end
------**********************************
------ sñ ki®n ðóng h² nh§p kh¦u 
------**********************************
function  x990010_OnDefaultEvent(  sceneId,  selfId,  targetId  )

                RestoreHp(  sceneId,  selfId  )  ------ mãn máu 
                RestoreMp(  sceneId,  selfId  )  ------ mãn khí 
                RestoreRage(  sceneId,  selfId  )  ------ mãn gi§n 
	 --LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  18,  0)

	 BeginEvent(  sceneId  )
	 AddText(sceneId,"#YHoan nghênh b¢ng hæu ðªn v¶i NetCo4 . Sau khi gia nh§p môn phái vui lòng ðªn các NPC môn phái ð¬ nâng c¤p tâm pháp!")
	 AddText(sceneId,"#r#G[ Nªu có v¤n ð« gì xin vui lòng liên h® fanpage ho£c GM ð¬ giäi ðáp]")
	 	 AddNumText(  sceneId,  x990010_g_scriptId,  "#cFF0000Gia Nh§p + chuy¬n ð±i Môn Phái ",  6,  200)
	 	--AddNumText(  sceneId,  x990010_g_scriptId,  "#cffcc00 v¯n dùng/u¯ng ð£c s¡c ",  6,  300)
		AddNumText(  sceneId,  x990010_g_scriptId,  "#GH§u Hoa Viên( sån vàng+Ng.li®u) ",  6,  600)
	 	 AddNumText(  sceneId,  x990010_g_scriptId,  "#cff6633Tuy«n T¯ng T±ng Hþp",  6,  400)
	 	 AddNumText(  sceneId,  x990010_g_scriptId,  "#GTr¸ li®u",  3,  500)
		 AddNumText(sceneId, x990010_g_scriptId, "#c66ccccNh§n Skill S½ C¤p", 6, 918)
		 AddNumText(sceneId, x990010_g_scriptId, "#GNh§n 80.000 Ði¬m T£ng (mi­n phí)", 6, 919) -- [NetCo4 30/09]
		 AddNumText(sceneId, x990010_g_scriptId, "#YNh§n 2.000 vàng hôm nay (1 l¥n/ngày)", 6, 920) -- [NetCo4 30/09]
		 AddNumText(sceneId, x990010_g_scriptId, "#YNh\167n 8.000 v\224ng kh\243a h\244m nay (1 l\165n/ng\224y)", 6, 921) -- [NetCo4 01/10]
		 AddNumText(sceneId, x990010_g_scriptId, "#cFF00FFT\244ng B\237 T\184ch (xem / x\170p / \240\177i)", 6, 922) -- [NetCo4 01/10]
		 
		--if LuaFnGetGUID( sceneId, selfId ) == 1010000020     then
		--AddNumText(sceneId,x990010_g_scriptId,"#Y add diem GM",6,916)
		--end
		
		--if LuaFnGetGUID( sceneId, selfId ) == 1010000020     then
		--AddNumText(sceneId, x990010_g_scriptId, "#c66ccccNh§n danh hi®u TESTTTTT", 6, 2000)
		--end
		
		--if LuaFnGetGUID( sceneId, selfId ) == 1010000020     then
		--AddNumText(sceneId, x990010_g_scriptId, "#c66ccccÐ±i Danh Hi®u", 6, 3000)
		--end		
		
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

------**********************************
------ sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
------**********************************
function  x990010_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
if GetNumText() == 3000 then --danh hieu
         BeginEvent( sceneId )
		AddNumText( sceneId, x990010_g_ScriptId, "#eDC4C18#cFFFF00Kim Xà Lang Quân",7,3001 )
		AddNumText( sceneId, x990010_g_ScriptId, "#e333033#gf33f88Höa Vân Tà Th¥n",7,3002 )
		AddNumText( sceneId, x990010_g_ScriptId, "#eAE00AE#gFF60AFH²n Thª Ma Vß½ng",7,3003 )	
		AddNumText( sceneId, x990010_g_ScriptId, "#eFFFFFF#g28004 B¡c Hoang Ðª Quân  ",7,3004 )
		AddNumText( sceneId, x990010_g_ScriptId, "#eFFFF00#c663366 Ðông Thiên Vß½ng ",7,3005 )
		AddNumText( sceneId, x990010_g_ScriptId, "#e0080FF#g2E9AFFÐông Hoa Ðª Quân",7,3006 )
		AddNumText( sceneId, x990010_g_ScriptId, "#eFFFFFF#gD94600Tây Thiên Vß½ng",7,3007 )	
		AddNumText( sceneId, x990010_g_ScriptId, "#eFFFFFF#g660000Nam NhÕc Ðª Qu§n",7,3008 )
		AddNumText( sceneId, x990010_g_ScriptId, "#e8181F7Nguy®t Hoa Thánh Mçu",7,3009 )
		AddNumText( sceneId, x990010_g_ScriptId, "#effffff#cff11ffTØ Y Thßþng Th¥n",7,3010 )	
		AddNumText( sceneId, x990010_g_ScriptId, "#effffff#c0066ff DÕ Du Th¥n",7,3011 )	
		AddNumText( sceneId, x990010_g_ScriptId, "#eD0A9F5 M¸ch Trån Tiên TØ",7,3012 )			
		AddNumText( sceneId, x990010_g_scriptId, "#gff00f0Quay lÕi", 8, 8888)
		
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
			elseif GetNumText() == 3001 then
			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eDC4C18#cFFFF00Kim Xà Lang Quân" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
			elseif GetNumText() == 3002 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e333033#gf33f88Höa Vân Tà Th¥n" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			elseif GetNumText() == 3003 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eAE00AE#gFF60AFH²n Thª Ma Vß½ng" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )	
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
			elseif GetNumText() == 3004 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eFFFFFF#g28004 B¡c Hoang Ðª Quân" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )			
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )	
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
			elseif GetNumText() == 3005 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eFFFF00#c663366Ðông Thiên Vß½ng" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
			elseif GetNumText() == 3006 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, " #e0080FF#g2E9AFFÐông Hoa Ðª Quân" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			elseif GetNumText() == 3007 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eFFFFFF#gD94600 Tây Thiên Vß½ng" )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			elseif GetNumText() == 3008 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eFFFFFF#g660000 Nam NhÕc Ðª Qu§n" )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
			elseif GetNumText() == 3009 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e8181F7Nguy®t Hoa Thánh Mçu" )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
			elseif GetNumText() == 3010 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#effffff#cff11ffTØ Y Thßþng Th¥n" )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	
			elseif GetNumText() == 3011 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#effffff#c0066ff DÕ Du Th¥n" )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	
			elseif GetNumText() == 3012 then			
		LuaFnAwardSpouseTitle( sceneId, selfId, "#eD0A9F5 M¸ch Trån Tiên TØ" )
		BeginEvent( sceneId )	
		AddText( sceneId, "#GChúc m×ng bÕn ðã nh§n danh hi®u thành công" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
		end
if GetNumText() == 2000 then --danh hieu
         BeginEvent( sceneId )
		AddNumText( sceneId, x990010_g_scriptId, "B¸ l²i nh§n lÕi",6,2001 )
		AddNumText( sceneId, x990010_g_scriptId, "Nh§n l¥n ð¥u",6,2002 )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
		
		elseif GetNumText() == 2001 then
		LuaFnAwardSpouseTitle( sceneId, selfId, " #707" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bOn da nh§n danh hi®u thành công111" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2002 then
		LuaFnAwardSpouseTitle( sceneId, selfId, " #706" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúc m×ng bOn da nh§n danh hi®u thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		end
	if GetNumText() == -916 then
				 local RemainPoint=GetPlayerRemainPoints(sceneId,selfId) 
    RemainPoint=RemainPoint+10000 
    SetPlayerRemainPoints(sceneId,selfId,RemainPoint) 
    --********************-- 
    BeginEvent(sceneId) 
        AddText(sceneId,"Các hO da gia tång 10000 di¬m Ti«m Nång!") 
    EndEvent(sceneId) 
    DispatchMissionTips(sceneId,selfId) 
				
									local	nam	= LuaFnGetName( sceneId, selfId )
	end	
          if  GetNumText()  ==  200  then
	     BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,GetSex(sceneId,  selfId))
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    2017101501)
          end
				if GetNumText() == 600 then		
			    BeginEvent( sceneId )
				AddText(sceneId,"Map #cFF0000H§u Hoa Viên #Wm· cØa t× #Y"..x990010_g_HHV_Mo.."h#W ðªn #Y"..x990010_g_HHV_Dong.."h#W h¢ng ngày, #Wmap trian chü yªu r½i #GVäi Bông, Bí Ngân các loÕi, Nguyên Li®u Tinh Thông, Nguyên Li®u Ngû Hành Ng÷c, vàng khóa và vàng không không khóa!")
					AddNumText( sceneId, x990010_g_ScriptId, "Ði ðªn H§u Hoa Viên",9,601)
					AddNumText( sceneId, x990010_g_ScriptId, " Quay lÕi",8,602)
		    	EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )	
			elseif GetNumText() == 601 then
			if x990010_HHV_DangMo() == 0 then -- [NetCo4 30/09]
				x990010_NotifyFailBox( sceneId, selfId, targetId, "H§u Hoa Viên chï m· t× #Y"..x990010_g_HHV_Mo.."h#W ðªn #Y"..x990010_g_HHV_Dong.."h#W. Các hÕ quay lÕi sau nhé." )
				return
			end
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 182,50,50)			
		end
			    if GetNumText() == 602 then  
				x990010_OnDefaultEvent( sceneId, selfId, targetId )  
				end 
          if  GetNumText()  ==  400  then
	     BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,GetSex(sceneId,  selfId))
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    20170503)
          end
	if  GetNumText()  ==  920  then -- [NetCo4 30/09] vang mien phi moi ngay
	 x990010_VangNgay( sceneId, selfId, targetId )
	 return
	 end
	if  GetNumText()  ==  921  then -- [NetCo4 01/10] vang khoa mien phi moi ngay
	 x990010_VangKhoaNgay( sceneId, selfId, targetId )
	 return
	 end
	if  GetNumText()  ==  922  then -- [NetCo4 01/10] Tong Bi Tich: xem tong hien tai + chon tong (goi nhanh 201-205 cua 900048 Kim Uc Phong)
	 x990010_TongBiTich( sceneId, selfId, targetId )
	 return
	 end
	if  GetNumText()  ==  919  then -- [NetCo4 30/09] Diem Tang mien phi, khong gioi han
	 ZengDian( sceneId, selfId, targetId, 1, 80000 )
	 LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
	 x990010_NotifyFailBox( sceneId, selfId, targetId, "Các hÕ ðã nh§n #Y80.000 #GÐi¬m T£ng#W. B¤m lÕi ð¬ nh§n tiªp." )
	 return
	 end
	if  GetNumText()  ==  918  then
	 AddSkill( sceneId, selfId, 21 )
	 AddSkill( sceneId, selfId, 22 )
	 AddSkill( sceneId, selfId, 34 )
	 AddSkill( sceneId, selfId, 35 )
	 AddSkill( sceneId, selfId, 241 )
	 AddSkill( sceneId, selfId, 242 )
	 AddSkill( sceneId, selfId, 243 )
	 AddSkill( sceneId, selfId, 244 )
	 AddSkill( sceneId, selfId, 245 )
	 AddSkill( sceneId, selfId, 246 )
	 AddSkill( sceneId, selfId, 247 )
	 AddSkill( sceneId, selfId, 248 )
	 AddSkill( sceneId, selfId, 249 )
	 AddSkill( sceneId, selfId, 239 )
	 AddSkill( sceneId, selfId, 279 )	
	 AddSkill( sceneId, selfId, 280 )	 	 
	 x990010_NotifyFailBox( sceneId, selfId, targetId, "Các hÕ ðã h÷c ðßþc kÛ nång \"Skill c½ bän s½ c¤p\"." )
	 return
	 end		  

          if  GetNumText()  ==  300  then
	     BeginUICommand(  sceneId  )
                    UICommand_AddString(sceneId,"#cffcc00 bän b±n gi¾i thi®u ");
	     UICommand_AddInt(  sceneId,11)
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS1}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS2}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS3}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS4}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS5}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS6}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS7}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS8}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS9}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS10}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS11}");
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    20151024)
          end


          if  GetNumText()  ==  500  then
                local  WuYiLev  =  mod(GetMissionData(sceneId,selfId,WUYI_LEVEL),10000)
                if  WuYiLev  >=  10  then
                      x990010_NotifyTip(  sceneId,selfId," này hÕng chÑc nång dùng cho tu chánh vû ý 5 c¤p không có nh§n l¤y ðªn b°i nguyên ði¬m ðªm ðích v¤n ð« , vßþt qua 10 c¤p không có hi®u quä ")
                      return
                end

                local  jiance  =  0
                local  TianFuSkill  =  {}
                            TianFuSkill[0]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_A)/10000)    -- b°i nguyên ði¬m ðªm 
                            TianFuSkill[1]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_A),10000)                    -- thÑ 1 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[2]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_BC)/10000)                -- thÑ 2 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[3]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),10000)                    -- thÑ 3 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[4]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_DE)/10000)                -- thÑ 4 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[5]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10000)                    -- thÑ 5 quy¬n sách kÛ nång c¤p b§c 

                if  TianFuSkill[0]  ~=  0  then
                      jiance  =  1
                end

                for  i=1,5  do
                        if  TianFuSkill[i]  ~=  0  then
                              jiance  =  1
                        end
                end

                if  jiance  >  0  then
                      x990010_NotifyTip(  sceneId,selfId," Các hÕ khí huyªt lßu thông sinh lñc d°i dào, sinh lý cao, sinh lý cao không c¥n phäi chæa tr¸ næa! ")
                      return
                end

                SetMissionData(sceneId,selfId,WUYI_SKILL_A,10000)
                      x990010_NotifyTip(  sceneId,selfId," Các hÕ h°i phøc nguyên khí thành công! ")
                return
          end

end

------**********************************
------ sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
------**********************************
function  x990010_AddMenPai(  sceneId,  selfId,  MenPaiId  )

if  GetMenPai(sceneId,selfId)  ~=  9  then
 --x990010_NotifyTip(  sceneId,  selfId,  " Các hÕ ðã gia nh§p môn phái, mu¯n chuy¬n phái sao? R¤t tiªc là ta chßa cho chuy¬n phái... "  )
 x990010_NotifyTip(  sceneId,  selfId,  " Các hÕ ðã gia nh§p môn phái, Mu¯n chuy¬n ð±i môn phái hay mua 1 phiªu KNB 200.000, tâm pháp s¨ v« 90 lßu ý nhé "  )
 if LuaFnDelAvailableItem(sceneId,selfId,39900000,1)<1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không có KNB phiªu 200.000 ko th¬ chuy¬n phái!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId,-1)
		return
	end
	x990010_NotifyTip(  sceneId,  selfId,  " Chuy¬n ð±i môn phái thành công"  )
	LuaFnJoinMenpai(sceneId,  selfId,  1,  MenPaiId)
	LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][1],90)
	LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][2],90)
	LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][3],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][4],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][5],90)
	LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][6],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][7],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][8],90)
	 local	 nam	 =  LuaFnGetName(  sceneId,  selfId  )
	 BroadMsgByChatPipe(  sceneId,  selfId,  " #985 #G Chúc m×ng#cFF0000 ["..nam.."] #G Chuy¬n ð±i  môn phái #cFF0000"..x990010_MenPaiName[MenPaiId+1].."#Gtoàn th¬ giang h° cùng truy sát! #411 ",  4  )	
     return
end
if  MenPaiId  ==9  or  MenPaiId  <  0  or  MenPaiId  >  12  then
      return
end
if  GetLevel(sceneId,  selfId)  <  10  then
      x990010_NotifyTip(  sceneId,selfId,"T× c¤p 10 tr· lên m¾i có th¬ Gia Nh§p Môn Phái ")
      return
end
if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  3  then
      x990010_NotifyTip(  sceneId,selfId," Xin ch×a tr¯ng ô ðÕo cø, nguyên ít nh¤t 3 ch² ! ")
      return
end
				AddMoneyJZ( sceneId, selfId, 30000000 )		
				--local	nam	= LuaFnGetName( sceneId, selfId )
			--local level =GetLevel(sceneId,selfId)
		--if level < 70 then
		--SetLevel(sceneId,selfId,70)
		--x001113_NotifyFailTips( sceneId, selfId, "Nh§n lev  thành công !" )
		--else
		--x001113_NotifyFailTips( sceneId, selfId, "Ngß½i C¤p cao r°i nhÕn gì næa" )
		--end
	 LuaFnJoinMenpai(sceneId,  selfId,  1,  MenPaiId)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][1],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][2],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][3],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][4],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][5],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][6],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][7],90)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][8],90)

	 local	 nam	 =  LuaFnGetName(  sceneId,  selfId  )
	 BroadMsgByChatPipe(  sceneId,  selfId,  " #985 #G Chúc m×ng#cFF0000 ["..nam.."] #G gia nh§p thành công vào môn phái #cFF0000"..x990010_MenPaiName[MenPaiId+1].." #G và nh§n ðßþc #cFF0000#{_EXCHG30000000} #Gtoàn th¬ giang h° k¸ch li®t phän ð¯i! #411 ",  4  )	 	 
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  168,  0)
                SetMissionData(sceneId,selfId,MY_JIARUMENPAI,1)    --1 vì ðã gia nh§p môn phái phán ðoán tiªp l¶i 
	 SetMissionData(sceneId,selfId,MD_SHUANGXIANGPAO_LASTTIME,GetDayTime())    -- ghi chép gia nh§p môn phái nh§t kÏ 
                SetMissionData(sceneId,selfId,XIEZI_XINFA_SCORE,107)    -- thiªt trí m¾i b¡t ð¥u tâm pháp bình phân --20+6+6+30+30+6+8+1

	 -- môn phái tß·ng thß·ng tri®u t§p làm 
	 for  i=1,20  do
	         TryRecieveItem(sceneId,selfId,30501001,1)
	 end
                TryRecieveItem(sceneId,selfId,x990010_MenPaiShiZhuang[MenPaiId+1],1)    -- cho th¶i trang 
                x990010_NotifyTip(sceneId,selfId," chúc m×ng ngß½i gia nh§p "..x990010_MenPaiName[MenPaiId+1].." , nh§n ðßþc #{_ITEM"..x990010_MenPaiShiZhuang[MenPaiId+1].."}?#{_ITEM30501001}*20")
	 LuaFnSendSystemMail(  sceneId,  GetName(sceneId,selfId),  "        #W chúc m×ng Các hÕ ðã tr· thành #gfff0f0"..x990010_MenPaiName[MenPaiId+1].."#g000000#W ðích ð® tØ , Các hÕ có th¬ m²i ngày làm nhi®m vø , #gfff0f0 c¤p b§c b¤t ð°ng #g000000#W làm sß môn nhi®m vø th¶i ði¬m #gfff0f0 nhi«u l¥n kinh nghi®m tß·ng thß·ng s¯ l¥n cûng b¤t ð°ng #g000000#W nga ! còn có th¬ tìm #gfff0f0 LÕc Dß½ng #g000000#W d¸ch trÕm ch² ðích #gfff0f0 khâu ðßþc lÕc [232,319] giúp mµt tay ðßa tin #g000000#W , kiªm mµt chút ti«n linh hoa . Các hÕ cûng có th¬ t× LÕc Dß½ng bên trái ðích cØa thành ði ra ngoài , ðªn #gfff0f0 ðôn hoàng #g000000#W giªt trách luy®n c¤p , nªu nhß không biªt cø th¬ phß½ng v¸ , có th¬ tìm dß½ng vån nghi­m tß¾ng quân thü hÕ ðích v® binh höi thåm . "  )
        return
end

function x990010_OnSceneTimer(sceneId)

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1  then
		local nHour	 = GetHour()--Ð¡Ê±
		local nQuarter = mod(GetQuarterTime(),100); 
		if  x990010_HHV_DangMo() == 0 then -- [NetCo4 30/09] truoc: nHour < 20 or nHour > 22
		x990010_NotifyTip( sceneId, nHumanId, "Th¶i gian m· cØa Map ðã hªt xin các hÕ lßþng thÑ " )
		CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 0,198,325)
		end
		
		end
	end

end
-- [NetCo4 30/09] Vang khong khoa mien phi moi ngay. Ghi ngay TRUOC khi phat -> khong bao gio phat 2 lan.
-- AddMoney tinh bang dong: 1 vang = 10000 dong.
function x990010_VangNgay( sceneId, selfId, targetId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local path = x990010_g_VangDir..guid..".vang"
	local today = GetTodayYear() * 10000 + GetTodayMonth() * 100 + GetTodayDate()
	local h = openfile( path, "r" )
	if h then
		local s = read( h, "*l" )
		closefile( h )
		if s and tonumber( s ) == today then
			x990010_NotifyFailBox( sceneId, selfId, targetId, "Hôm nay ðã nh§n r°i, mai quay lÕi nhé." )
			return
		end
	end
	h = openfile( path, "w" )
	if h == nil then
		x990010_NotifyFailBox( sceneId, selfId, targetId, "L²i ghi file, báo GM." )
		return
	end
	write( h, today.."\n" )
	closefile( h )
	AddMoney( sceneId, selfId, x990010_g_VangNgay * 10000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
	x990010_NotifyFailBox( sceneId, selfId, targetId, "Các hÕ ðã nh§n #Y"..x990010_g_VangNgay.." vàng không khóa#W hôm nay." )
end

-- [NetCo4 01/10] Vang KHOA mien phi moi ngay (AddMoneyJZ, giong AddMenPai). Ghi ngay TRUOC khi phat -> khong bao gio phat 2 lan.
function x990010_VangKhoaNgay( sceneId, selfId, targetId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local path = x990010_g_VangDir..guid..".vangkhoa"
	local today = GetTodayYear() * 10000 + GetTodayMonth() * 100 + GetTodayDate()
	local h = openfile( path, "r" )
	if h then
		local s = read( h, "*l" )
		closefile( h )
		if s and tonumber( s ) == today then
			x990010_NotifyFailBox( sceneId, selfId, targetId, "H\244m nay \240\227 nh\167n v\224ng kh\243a r\176i, mai quay l\213i nh\233." )
			return
		end
	end
	h = openfile( path, "w" )
	if h == nil then
		x990010_NotifyFailBox( sceneId, selfId, targetId, "L\178i ghi file, b\225o GM." )
		return
	end
	write( h, today.."\n" )
	closefile( h )
	AddMoneyJZ( sceneId, selfId, x990010_g_VangKhoaNgay * 10000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
	x990010_NotifyFailBox( sceneId, selfId, targetId, "C\225c h\213 \240\227 nh\167n #Y8.000 v\224ng kh\243a#W h\244m nay." )
end

-- [NetCo4 01/10] Tong Bi Tich (mission 443 = tong x 1.000.000 + sach). Cac muc chon goi x900048_OnEventRequest key 201-205.
function x990010_TongBiTich( sceneId, selfId, targetId )
	local ten = { "Ph\167t t\244ng", "Kh\237 t\244ng", "Ki\170m t\244ng", "Ma t\244ng", "Nho t\244ng" }
	local tong = floor( GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ) / 1000000 )
	local hien = "ch\223a v\224o t\244ng n\224o"
	if tong >= 1 and tong <= 5 then
		hien = ten[tong]
	end
	BeginEvent( sceneId )
	AddText( sceneId, "#cFF0000T\244ng hi\174n t\213i: #W"..hien.."#r#YCh\247n t\244ng cho B\237 T\184ch. L\165n \240\165u mi\173n ph\237. \208\177i t\244ng t\175n 800 V\245 H\247c T\226m \208\161c v\224 m\164t tuy\174t h\247c \240\227 h\247c." )
	AddNumText( sceneId, 900048, "X\170p v\224o Ph\167t t\244ng", 6, 201 )
	AddNumText( sceneId, 900048, "X\170p v\224o Kh\237 t\244ng", 6, 202 )
	AddNumText( sceneId, 900048, "X\170p v\224o Ki\170m t\244ng", 6, 203 )
	AddNumText( sceneId, 900048, "X\170p v\224o Ma t\244ng", 6, 204 )
	AddNumText( sceneId, 900048, "X\170p v\224o Nho t\244ng", 6, 205 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x990010_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end


function  x990010_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
