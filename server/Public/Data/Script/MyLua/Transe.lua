--*****************************--
--*     Code by MrSun 0411    *--
--*****************************--
x990012_g_ScriptId = 990012

function x990012_OnDefaultEvent( sceneId, selfId, targetId)
                RestoreHp(  sceneId,  selfId  )   
                RestoreMp(  sceneId,  selfId  ) 
                RestoreRage(  sceneId,  selfId  )  
	 	BeginEvent(sceneId)     
	 	--AddText(sceneId,"#b#WTa có th¬ giúp gì cho các hÕ?")	
	 	AddText(sceneId,"#b#WCác hÕ mu¯n ði ðâu?")
	 	--AddText(sceneId,"#b#GD¸ch chuy¬n Nhanh h² trþ TEST - Open s¨ ðóng d¸ch chuy¬n nhanh")		
		--AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Môn Phái", 9, 7991)
		--AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸", 9, 2)
		AddNumText(sceneId, x990012_g_ScriptId, "#GMôn Phái", 9, 1 )		
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YÐÕi Lý", 9, 26)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YLÕc Dß½ng", 9, 20)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YLÕc Dß½ng - CØu Châu Thß½ng Hµi", 9, 21)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YTô Châu", 9, 22)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YTô Châu - Thiªt Tßþng Ph¯", 9, 23)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YLâu Lan", 9, 24)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YThúc Hà C± Tr¤n", 9, 25)
		AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - #YPhøng Minh Tr¤n", 9, 29)		
		--AddNumText(sceneId, x990012_g_scriptId, "#GLuy®n C¤p", 9, 5555)
		--AddNumText(sceneId, x990012_g_scriptId, "#GMap BOSS Dã NgoÕi", 9, 5558)
		--AddNumText( sceneId, x990012g_ScriptId, "#cFF0000H§u Hoa Viên #Y[PK Tñ Do]", 9, 101 )
		--AddNumText( sceneId, x900006_g_ScriptId, "#cFF0000 Hàn Ng÷c C¯c PK #Y[#YNLi®u Th¥n Khí]", 9, 114 )
		--AddNumText( sceneId, x990012g_ScriptId, "#GThiên Kiªp Lâu - [#YNLi®u Long Vån]", 9, 103 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--**********************************
function x990012_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()

	if key == 7991 then
		BeginEvent( sceneId )
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
			AddNumText(sceneId, x990012_g_ScriptId, "#GMôn Phái", 9, 1 )
			--AddNumText( sceneId, x990012g_ScriptId, "#GThành Th¸", 9, 2 )
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - ÐÕi Lý", 9, 26)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - LÕc Dß½ng", 9, 20)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - LÕc Dß½ng - CØu Châu Thß½ng Hµi", 9, 21)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Tô Châu", 9, 22)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Tô Châu - Thiªt Tßþng Ph¯", 9, 23)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Lâu Lan", 9, 24)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Thúc Hà C± Tr¤n", 9, 25)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Phßþng Minh Tr¤n", 9, 29)			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end

	if key == 1 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn môn phái nào ?")
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Thiªu Lâm", 9, 10)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Minh Giáo", 9, 11)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Cái Bang", 9, 12)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Võ Ðang", 9, 13)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Nga My", 9, 14)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Tinh Túc", 9, 15)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Thiên Long", 9, 16)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Thiên S½n", 9, 17)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Tiêu Dao", 9, 18)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Mµ Dung", 9, 115)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Ðß¶ng Môn", 9, 116)
			AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - QuÖ C¯c", 9, 117)
			--AddNumText(sceneId, x990012_g_scriptId, "#GMôn Phái - Ðào Hoa Ðäo", 9, 118)			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end

	if key == 2 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn thành th¸ nào ?")
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - ÐÕi Lý", 9, 26)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - LÕc Dß½ng", 9, 20)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - LÕc Dß½ng - CØu Châu Thß½ng Hµi", 9, 21)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Tô Châu", 9, 22)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Tô Châu - Thiªt Tßþng Ph¯", 9, 23)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Lâu Lan", 9, 24)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Thúc Hà C± Tr¤n", 9, 25)
			AddNumText(sceneId, x990012_g_scriptId, "#GThành Th¸ - Phßþng Minh Tr¤n", 9, 29)			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end

	if key == 3 then
		BeginEvent( sceneId )
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
			AddNumText( sceneId, x990012g_ScriptId, "#GTân Thü #cFF0000[40   - 100]", 9, 5555 )
			AddNumText( sceneId, x990012g_ScriptId, "#GCao Thü #cFF0000[100 - 120]", 9, 5556 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end
	
	if key == 5555 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
			AddNumText(sceneId, x990012_g_scriptId, "#GYªn Vß½ng C± Mµ 1                     #cFF0000[ 40 - 90 ]", 9, 43)
			AddNumText(sceneId, x990012_g_scriptId, "#GYªn Vß½ng C± Mµ 7                     #cFF0000[ 40 - 90 ]", 9, 44)
			AddNumText(sceneId, x990012_g_scriptId, "#GT¥n Hoàng Ð¸a Cung 1                  #cFF0000[ 40 - 90 ]", 9, 45)
			AddNumText(sceneId, x990012_g_scriptId, "#GT¥n Hoàng Ð¸a Cung 2                  #cFF0000[ 40 - 90 ]", 9, 46)
			AddNumText(sceneId, x990012_g_scriptId, "#GT¥n Hoàng Ð¸a Cung 3                  #cFF0000[ 40 - 90 ]", 9, 47)
			--AddNumText(sceneId, x990012_g_scriptId, "#GThánh Höa Cung                          #cFF0000[ 90 - 120 ]", 9, 31)
			AddNumText(sceneId, x990012_g_scriptId, "#GHÕn Huyªt Lînh                            #cFF0000[ 90 - 120 ]", 9, 36)
			AddNumText(sceneId, x990012_g_scriptId, "#GTháp Kh¡c LÕp Mã Cãn                  #cFF0000[ 90 - 120 ]", 9, 34)			
			AddNumText(sceneId, x990012_g_scriptId, "#GHöa Di®m C¯c                              #cFF0000[ 90 - 120 ]", 9, 33)
			AddNumText(sceneId, x990012_g_scriptId, "#GCao Xß½ng Mê Cung                     #cFF0000[ 90 - 120 ]", 9, 32)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end

	if key == 5556 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
			AddNumText(sceneId, x990012_g_scriptId, "#GHÕn Huyªt Lînh", 9, 36)
			AddNumText(sceneId, x990012_g_scriptId, "#GTháp Kh¡c LÕp Mã Cãn", 9, 34)			
			AddNumText(sceneId, x990012_g_scriptId, "#GCao Xß½ng Mê Cung", 9, 32)
			AddNumText(sceneId, x990012_g_scriptId, "#GHöa Di®m C¯c", 9, 33)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end
	
	if key == 5 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
		        --AddText(sceneId,"#ccc33cc[ Lßu Ý ] #YMap BOSS tân thü #HQuân Thiên Vß½ng Lång #Ychï ðÆng c¤p #Hnhö h½n ho£c b¢ng 99 #GVà yêu c¥u #HThoát khöi trÕng thái #GT± Ðµi #Y #Ym¾i có th¬ tiªn vào")

			AddNumText(sceneId, x990012_g_scriptId, "#GMap BOSS Tñ Do", 9, 5557)
			AddNumText(sceneId, x990012_g_scriptId, "#GMap BOSS Dã NgoÕi", 9, 5558)
		        if GetLevel(sceneId,selfId) < 1 and LuaFnHasTeam( sceneId, selfId ) < 1 and LuaFnGetDRideFlag(sceneId, selfId) < 1 then
			AddNumText(sceneId, x990012_g_scriptId, "#GMap BOSS Tân Thü - QTVL", 9, 113)
                        end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end

	if key == 5557 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
		        AddText(sceneId,"#ccc33cc[ Lßu Ý ] #YMap BOSS tân thü #HQuân Thiên Vß½ng Lång #Ychï ðÆng c¤p #Hnhö h½n ho£c b¢ng 99 #Ym¾i có th¬ tiªn vào")
			AddNumText( sceneId, x990012g_ScriptId, "#GH§u Hoa Viên", 9, 101 )
			AddNumText( sceneId, x990012g_ScriptId, "#GMa Nhai Ðµng", 9, 102 )
			AddNumText( sceneId, x990012g_ScriptId, "#GThiên Kiªp Lâu - 1h xu¤t hi®n k¬ t× lúc BOSS chªt", 9, 103 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end

	if key == 5558 then
		BeginEvent(sceneId)     
			AddText(sceneId,"#GNgß½i mu¯n ðªn n½i nào ?")
			AddNumText( sceneId, x990012g_ScriptId, "#GVõ Di [#YDã NgoÕi]", 9, 107 )
			AddNumText( sceneId, x990012g_ScriptId, "#GThß½ng S½n [#YDã NgoÕi]", 9, 108 )
			AddNumText( sceneId, x990012g_ScriptId, "#GThäo Nguyên [#YDã NgoÕi]", 9, 109 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
	end
	
	if key >= 10 and key <= 19 then
		local MonPhai = {}
			MonPhai[10] = {9, 96, 127}
			MonPhai[11] = {11, 98, 167}
			MonPhai[12] = {10, 91, 116}
			MonPhai[13] = {12, 103, 140}
			MonPhai[14] = {15, 89, 139}
			MonPhai[15] = {16, 96, 152}
			MonPhai[16] = {13, 96, 120}
			MonPhai[17] = {17, 95, 120}
			MonPhai[18] = {14, 67, 145}
			MonPhai[19] = {435, 152, 166}			
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,MonPhai[key][1],MonPhai[key][2],MonPhai[key][3])
	end
	
	if key >= 20 and key <= 29 then
		local ThanhThi = {}
			ThanhThi[20] = {0, 231, 322}
			ThanhThi[21] = {0, 326, 271}
			ThanhThi[22] = {1, 204, 259}
			ThanhThi[23] = {1, 331, 226}
			ThanhThi[24] = {186, 287, 133}
			ThanhThi[25] = {420, 200, 211}
			ThanhThi[26] = {2, 160, 149}
			ThanhThi[27] = {2, 160, 132}
			ThanhThi[28] = {0, 255, 118}
			ThanhThi[29] = {580, 158, 121}		
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,ThanhThi[key][1],ThanhThi[key][2],ThanhThi[key][3])
	end
	
	if key >= 30 and key <= 49 then
		local MapTrain = {}
			MapTrain[31] = {537, 24, 102}
			MapTrain[32] = {520, 100, 100}
			MapTrain[33] = {519, 71, 29}
			MapTrain[34] = {427, 36, 23}
			MapTrain[35] = {541, 110, 20}
			MapTrain[36] = {432, 92, 92}
			MapTrain[37] = {536, 40, 220}
			MapTrain[38] = {544, 255, 375}
			MapTrain[39] = {545, 255, 375}
			MapTrain[40] = {546, 255, 355}
			MapTrain[41] = {547, 260, 300}
			MapTrain[42] = {548, 253, 251}
			MapTrain[43] = {159, 75, 91}
			MapTrain[44] = {165, 29, 106}
			MapTrain[45] = {400, 226, 220}
			MapTrain[46] = {401, 176, 167}
			MapTrain[47] = {402, 229, 216}
			
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,MapTrain[key][1],MapTrain[key][2],MapTrain[key][3])
	end

	if key >= 100 and key <= 120 then
		local CuongDao = {}
			CuongDao[101] = {62, 33, 50}
			CuongDao[102] = {170, 209, 175}
			CuongDao[103] = {533, 70, 78}
			CuongDao[104] = {179, 110, 225}
			CuongDao[105] = {167, 65, 55}
			CuongDao[106] = {5, 138, 111}
			CuongDao[107] = {32, 99, 85}
			CuongDao[108] = {25, 165, 54}
			CuongDao[109] = {20, 65, 165}
			CuongDao[110] = {39, 100, 85}
			CuongDao[111] = {158, 199, 30}
			CuongDao[112] = {188, 78, 47}
			CuongDao[113] = {553, 40, 26}
			CuongDao[114] = {194, 39, 39}
			CuongDao[115] = {435, 29, 136}
			CuongDao[116] = {495, 125, 70}
			CuongDao[117] = {197, 86, 148}
			CuongDao[118] = {195, 258, 169}			

		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,CuongDao[key][1],CuongDao[key][2],CuongDao[key][3])
	end

	if key >= 60 and key <= 64 then
		local NguyenLieu = {}
			NguyenLieu[60] = {517, 97, 94}
			NguyenLieu[61] = {179, 110, 220}
			NguyenLieu[63] = {534, 15, 15}
			NguyenLieu[64] = {566, 32, 62}

		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,NguyenLieu[key][1],NguyenLieu[key][2],NguyenLieu[key][3])
	end
       
	if key == 6 then
		x990012_CloseMe( sceneId, selfId )
	end
end

function x990012_CloseMe( sceneId, selfId )
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
end
function x990012_NotifyFailTips( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


