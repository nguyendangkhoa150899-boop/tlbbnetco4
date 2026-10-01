--*****************************--
--*     001113           *--
--*****************************--
x001113_g_BufferId = 60--20001
x001113_Thoitrang ={10553200,10553201,10553202,10553203,10553204,10553205,10553206,10553207,10553208,10553209,10553210,10553211,10553212,10553213,10553214,10553215,10553216,10553217,10553218,10553219,10553220,10553221,10553222,10553223,10553224,10553225,10553226,10553227,10553228,10553229,10553230,10553231,10553232,10553233,10553234,10553235,10553236,10553237,10553238,10553239,10553240,10553241,10553242,10553243,10553244,10553245,10553246,10553247,10553248,10553249,10553250,10553251,10553252,10553253,10553254,10553255,10553256,10553257,10553258,10553259,10553260,10553261,10553262,10553263,10553264,10553265,10553266,10553267,10553268,10553269,10553270,10553271,10553272,10553273,10553274,10553275,10553276,10553277,10553278,10553279,10553280,10553281,10553282,10553283,10553284,10553285,10553286,10553287,10553288,10553289,10553290,10553291,10553292,10553293,10553294,10553295,10553296,10553297,10553298,10553299,10553300,10553301,10553302,10553303,10553304,10553305,10553306,10553307,10553308,10553309,10553310,10553311,10553312,10553313,10553314,10553315,10553316,10553317,10553318,10553319,10553320,10553321,10553322,10553323,10553324,10553325,10553326,10553327,10553328,10553329,10553330,10553331,10553332,10553333,10553334,10553335,10553336,10553337,10553338,10553339,10553340,10553341,10553342,10553343,10553344,10553345,10553346,10553347,10553348,10553349,10553350,10553351,10553352,10553353,10553354,10553355,10553356,10553357,10553358,10553359,10553360,10553361,10553362,10553363,10553364,10553365,10553366,10553367,10553368,10553369,10553370,10553371,10553372,10553373,10553374,10553375,10553376,10553377,10553378,10553379,10553380,10553381,10553382,10553383,10553384,10553385,10553386,10553387,10553388,10553389,10553390,10553391,10553392,10553393,10553394,10553395,10553396,10553397,10553398,10553399,10553400,10553401,10553402,10553403,10553404,10553405,10553406,10553407,10553408,10553409,10553410,10553411,10553412,10553413,10553414,10553415,10553416,10553417,10553418,10553419,10553420,10553421,10553422,10553423,10553424,10553425,10553426,10553427,10553428,10553429,10553430,10553431,10553432,10553433,10553434,10553435,10553436,10553437,10553438,10553439,10553440,10553441,10553442,10553443,10553444,10553445,10553446,10553447,10553448,10553449,10553450,10553451,10553452,10553453,10553454,10553455,10553456,10553457,10553458,10553459,10553460,10553461,10553462,10553463,10553464,10553465,10553466,10553467,10553468,10553469,10553470,10553471,10553472,10553473,10553474,10553475,10553476,10553477,10553478,10553479,10553480,10553481,10553482,10553483,10553484,10553485,10553486,10553487}
function x001113_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff 1.#cFF0000Chào m×ng các bÕn ðªn v¾i #ef12345#Y NetCo4 ")
    AddText(sceneId," #c66ccff 2.#cFF0000Các bÕn có th¬ nh§n#G Ði¬m T£ng#cFF0000 tÕi lão")

		--AddNumText( sceneId, x001113_g_scriptId, "#e0000ff#G Nh§n NgLi®u Trùng, HVQ, KTT (TEST)", 6, 4444 )		
		--AddNumText( sceneId, x001113_g_scriptId, "#e0000ff#G Nh§n EXP mi­n phí (TEST)", 6, 30000 )	
    	--AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Tr¸ Li®u", 6, 20 )
		--AddNumText( sceneId, x001113_g_scriptId, "#e0000ff#cFF0000Thanh lý Tay Näi(C¦n Th§n)", 6, 21 )
		--AddNumText( sceneId, x001113_g_scriptId, "#YThång c¤p ðµ nh§n lß½ng khi gi¾i thi®u bÕn bè", 6, 6666 )
		--AddNumText( sceneId, x001113_g_scriptId, "#YNh§n ti«n lß½ng gi¾i thi®u bÕn ch½i m²i ngày", 6, 9999 )
		--AddNumText( sceneId, x001113_g_scriptId, "#YNh§n quà ð£c bi®t khi c¤p lß½ng >=15", 6, 5555 )
		--AddNumText( sceneId, x001113_g_scriptId, "#cFF0000 Ð±i Th¶i Trang Thuµc Tính", 6, 10 )
		--AddNumText( sceneId, x001113_g_scriptId, "#e0000ff#G Nh§n Vàng + KNB (TEST)", 6, 7777 )
		  AddNumText( sceneId, x002084_g_scriptId, "HuÖ hi®u Ñng thß½ng nhân+ tào v§n", 6, 30030 )
		AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Nh\167n l\213i T\226n Th\252 Trang B\184 [10 c\164p] (set + v\251 kh\237, 1 l\165n duy nh\164t) ", 6, 8886 ) -- [NetCo4 01/10]
		if GetLevel( sceneId, selfId ) <= 99 then
		AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Nh§n quà Tân Thü (và level 99) ", 6, 8887 )
		end
--if GetLevel( sceneId, selfId ) <= 90 then
		AddNumText( sceneId, x001113_g_scriptId, "#G Nh§n BUFF 2.5 mi­n phí (Level 105)", 6, 15000 )
		--end		
		--AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Nh§n Ði¬m T£ng ", 6, 8888 )
		--AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Ki¬m tra ðång nh§p", 6, 8889 )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
function x001113_OnEventRequest(sceneId,selfId,targetId,eventId)
local nam = LuaFnGetName(sceneId,selfId)
	local strGUID = LuaFnGetGUID( sceneId, selfId )

	local key = GetNumText()
if key ~= 8886 and key ~= 8887 and key ~= 15000 and key ~= 30030 then return end -- [don-dep] chan qua cua server cu ([NetCo4 01/10] them 8886)
	if key == 8886 then -- [NetCo4 01/10] nhan lai Tan Thu Trang Bi [10 cap], 1 lan/ngay
		x001113_TanThuTrangBi( sceneId, selfId, targetId )
		return
	end
	if key == 8887 then
	local menpai = GetMenPai( sceneId, selfId )
if menpai == 9 then 
 x990010_NotifyTip(  sceneId,  selfId,  " xin hãy gia nh§p môn phái trß¾c khi nh§n quà... "  )
      return
end
				--AddMoneyJZ( sceneId, selfId, 20000000 )		
				local	nam	= LuaFnGetName( sceneId, selfId )
			local level =GetLevel(sceneId,selfId)
		if level < 99 then
		SetLevel(sceneId,selfId,99)
		x001113_NotifyFailTips( sceneId, selfId, "Nh§n lev  thành công !" )
		else
		x001113_NotifyFailTips( sceneId, selfId, "Ngß½i C¤p cao r°i nh§n gì næa" )
		end
		
	local t_newXuYuanCount=LuaFnGetWorldGlobalData(55)+1
	local capluong = GetMissionData(sceneId, selfId, MD_Capluong );
	if capluong ==2 then
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff Các hÕ ðã nh§n 1 l¥n r°i không th¬ nh§n lÕi ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end 
	if t_newXuYuanCount >=100 then
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff Ðã ðü 100 ngß¶i nh§n r°i các hÕ không th¬ nh§n tiªp ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end
	
		LuaFnSetWorldGlobalData(55, t_newXuYuanCount)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50613004,1 ) )
	LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50601001,1 ) )
	LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50601002,1 ) )
	SetMissionData(sceneId, selfId,MD_Capluong,2)
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff Chúc m×ng các hÕ nh§n thành công ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	--BroadMsgByChatPipe(sceneId, selfId, "#H Chúc m×ng ngß¶i ch½i #Y["..nam.."] là ngß¶i thÑ "..t_newXuYuanCount.." nh§n quà kh·i tÕo 100 nhân v§t ð¥u tiên thành công", 4)
	BroadMsgByChatPipe(sceneId, selfId, "#H Chúc m×ng ngß¶i ch½i #Y["..nam.."] nh§n quà tân thü khi tham gia NetCo4", 4)

	end
	
	local capluong = GetMissionData(sceneId, selfId, MD_Capluong );
	if key == 8889 then
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	local b		=GetHostIP(sceneId, selfId)
	local c =IsSameMAC(sceneId, selfId)
	local a =IsSameMAC(sceneId,tid1,tid2)
	x001113_NotifyFailTips( sceneId, selfId,"IP may ban la:"..b)
	x001113_NotifyFailTips( sceneId, selfId, c)
	x001113_NotifyFailTips( sceneId, selfId, tid1)
	x001113_NotifyFailTips( sceneId, selfId, tid2)
	if strGUID == -1 then
	AddMoney( sceneId, selfId, 1000000000 )
	LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 38001099,10 ) )
	end
	
	end
	if key == 6666 then
	if strGUID ~=  1010000965 then 
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff Ð¬ thång c¤p ðµ nh§n lß½ng KNB vui lòng liên h® Fanpage ð¬ GM xác nh§n ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end 
	if capluong>= 22 then 
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff Ð¬ thång c¤p ðµ nh§n lß½ng KNB vui lòng liên h® Fanpage ð¬ GM xác nh§n ")
	AddText(sceneId," #c66ccff C¤p nh§n lß½ng các hÕ hi®n tÕi là "..capluong.." c¤p ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end
	SetMissionData(sceneId, selfId,MD_Capluong, GetMissionData(sceneId, selfId, MD_Capluong )+1 );
	x001113_NotifyFailTips( sceneId, selfId, "Chúc m×ng các hÕ nh§n lß½ng gi¾i thi®u  bÕn bè thành công")
	end
	if key == 5555 then
	if capluong < 15 then 
	--if strGUID ~=  1010000324 then --1010000324
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff C¤p nh§n lß½ng chßa ðü ð¬ nh§n quà ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end 
	--if GetMissionData( sceneId, selfId, MD_Codevip) == 2 then 
     --x001113_NotifyFailTips( sceneId, selfId, "CÁc hÕ ðã nh§n 1 l¥n r°i")
	--return
	--end
	LuaFnAwardTitle( sceneId, selfId,  6,273,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,6,273)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
    --LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50721103,1 ) )
	--LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50721203,1 ) )
	--LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50721303,1 ) )
	--LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50721403,1 ) )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7536, 0)	--¸øBUFF
	x001113_NotifyFailTips( sceneId, selfId,"nh§n thành công"  )
	SetMissionData( sceneId, selfId, MD_Codevip,2)
	end
		if key == 4444 then
        		BeginAddItem(sceneId)
			AddItem(sceneId,20310185,20)
			AddItem(sceneId,20310186,20)
			AddItem(sceneId,20310187,20)
			AddItem(sceneId,20310188,20)
			AddItem(sceneId,20310189,20)
			AddItem(sceneId,20310190,20)
			AddItem(sceneId,30070501,20)
			AddItem(sceneId,20310168,1000)
			
			EndAddItem(sceneId,selfId)
			AddItemListToHuman(sceneId,selfId)
			local str = "#e000066#gFFF5EENh§n Thành Công"
			x001113_ShowNotice( sceneId, selfId, str )
	end	
	if key == 9999 then
			local day = GetTime2Day();
			local lastDay = GetMissionData(sceneId, selfId, MD_Nhanluong );
	
            if lastDay == day then	x001113_NotifyFailBox( sceneId, selfId, targetId, "#GM²i ngày chï nh§n  mµt l¥n.#r#YHãy quay lÕi vào hôm sau." )
			return
            end
				
				local KNB = GetMissionData(sceneId, selfId, MD_Capluong );
				local	nam	= LuaFnGetName( sceneId, selfId )
				local KNB1= KNB*5000
				YuanBao(sceneId,selfId,targetId,1,KNB1)
				BroadMsgByChatPipe( sceneId, selfId, "#g0f0ff0"..nam.." #Hðã nh§n thành công ti«n lß½ng gi¾i thi®u bÕn bè ðc "..KNB1.." KNB", 4 )
				SetMissionData(sceneId, selfId, MD_Nhanluong, day);
	
	
	x001113_NotifyFailTips( sceneId, selfId, "Chúc m×ng các hÕ nh§n lß½ng gi¾i thi®u  bÕn bè thành công")
	end
	
	
	
	if key == 21 then
		BeginEvent( sceneId )
			AddText(sceneId," #c66ccff 1.#cFF0000Sau khi sØ døng chÑc nång này toàn bµ v§t ph¦m trong tay näi s¨ b¸ xóa s± sÕch sành sanh, xin hãy th§n tr÷ng trß¾c khi li«u")
			AddText(sceneId," - M²i l¥n sØ døng chÑc nång này #Gtiêu hao 100 vàng")
			AddText(sceneId,"#Y [ Chúc các hÕ ch½i game vui vë! ]")
				AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Ð°ng Ý XÓA t¤t cä Ô ÐÕo Cø ", 6, 211 )
				AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Ð°ng Ý XÓA t¤t cä Ô Nguyên Li®u ", 6, 212 )
				AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0 Ð°ng Ý XÓA t¤t cä Ô Nhi®m Vø ", 6, 213 )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
		if key == 211 then	
			if GetMoney(sceneId,selfId) + GetMoneyJZ(sceneId,selfId) >= 1000000 then
			for i=0,29 do
				--LuaFnDelAvailableItem(sceneId,selfId,GetItemTableIndexByIndex( sceneId, selfId, i ),LuaFnGetAvailableItemCount(sceneId, selfId, GetItemTableIndexByIndex( sceneId, selfId, i )))--Xoa y Item x
			LuaFnEraseItem(  sceneId,  selfId,  i)
			end
			LuaFnCostMoneyWithPriority(sceneId,selfId,1000000)
			x001113_NotifyFailBox( sceneId, selfId, selfId, "#YToàn bµ ô ðÕo cø ðã ðßþc xóa tr¯ng thành công")
	        else
			x001113_ShowNotice( sceneId, selfId, "không ðü 100 vàng!")
            return
			end
		end
		if key == 212 then
			if GetMoney(sceneId,selfId) + GetMoneyJZ(sceneId,selfId) >= 1000000 then
			for i=30,59 do
				--LuaFnDelAvailableItem(sceneId,selfId,GetItemTableIndexByIndex( sceneId, selfId, i ),LuaFnGetAvailableItemCount(sceneId, selfId, GetItemTableIndexByIndex( sceneId, selfId, i )))--Xoa y Item x
			LuaFnEraseItem(  sceneId,  selfId,  i)
			end
			LuaFnCostMoneyWithPriority(sceneId,selfId,1000000)
			x001113_NotifyFailBox( sceneId, selfId, selfId, "#YToàn bµ ô nguyên li®u ðã ðßþc xóa tr¯ng thành công")
	        else
			x001113_ShowNotice( sceneId, selfId, "không ðü 100 vàng!")
            return
			end
		end
		if key == 213 then
			if GetMoney(sceneId,selfId) + GetMoneyJZ(sceneId,selfId) >= 1000000 then
			for i=60,79 do
				--LuaFnDelAvailableItem(sceneId,selfId,GetItemTableIndexByIndex( sceneId, selfId, i ),LuaFnGetAvailableItemCount(sceneId, selfId, GetItemTableIndexByIndex( sceneId, selfId, i )))--Xoa y Item x
			LuaFnEraseItem(  sceneId,  selfId,  i)
			end
			LuaFnCostMoneyWithPriority(sceneId,selfId,1000000)
			x001113_NotifyFailBox( sceneId, selfId, selfId, "#YToàn bµ ô nhi®m vø ðã ðßþc xóa tr¯ng thành công")
	        else
			x001113_ShowNotice( sceneId, selfId, "không ðü 100 vàng!")
            return
			end
		end		
	if key == 10 then
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff 1.#cFF0000Có th¬ dùng 20 nguyên li®u trùng các loÕi ð¬ ð±i th¶i trang thuµc tính")
	AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0Trùng Lâu Chi L® ð±i Th·i trang ", 6, 101 )
	AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0Trùng Lâu Chi Mang ð±i Th·i trang ", 6, 102 )
	AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0Trùng Lâu Chi Thß½ng ð±i Th·i trang ", 6, 103 )
	AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0Trùng Lâu Chi Dß½ng ð±i Th·i trang ", 6, 104 )
	AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0Thiên Ð¸a Minh Châu ð±i Th·i trang ", 6, 105 )
	AddNumText( sceneId, x001113_g_scriptId, "#g0f0ff0Lßu Ly Minh Châu ð±i Th·i trang ", 6, 106 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 101 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310185) < 20   then
	x001113_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x001113_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310185,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x001113_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x001113_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi Ngû Hoa Ðàn ÐÕi Lý ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #G Xin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
		x001113_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 102 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310186) < 20   then
	x001113_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x001113_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310186,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x001113_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x001113_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi Ngû Hoa Ðàn ÐÕi Lý ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #G Xin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
		x001113_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 103 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310187) < 20   then
	x001113_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x001113_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310187,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x001113_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x001113_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi Ngû Hoa Ðàn ÐÕi Lý ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #G Xin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
		x001113_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return	
	end
	
	if key == 104 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310188) < 20   then
	x001113_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x001113_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310188,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x001113_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x001113_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi Ngû Hoa Ðàn ÐÕi Lý ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #G Xin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
			x001113_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 105 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310189) < 20   then
	x001113_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x001113_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310189,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x001113_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x001113_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi Ngû Hoa Ðàn ÐÕi Lý ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #G Xin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
			x001113_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 106 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310190) < 20   then
	x001113_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x001113_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310190,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x001113_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x001113_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi Ngû Hoa Ðàn ÐÕi Lý ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #G Xin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
			x001113_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	if key == 20 then
		RestoreHp( sceneId, selfId )
		RestoreMp( sceneId, selfId )
		RestoreRage( sceneId, selfId )
		ZengDian(sceneId,selfId,targetId,1, - 10000)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x001113_NotifyFailTips(sceneId, selfId, "Done")
	end
	

	--Phuc Loi
	if GetNumText() == 7777 then
        	--local day = GetTime2Day();
        --local lastDay = GetMissionData(sceneId, selfId, MD_AddMoneyJZ );
          --  if lastDay == day then	x001113_NotifyFailBox( sceneId, selfId, targetId, "#GM²i ngày chï nh§n #G#{_EXCHG10000000} mµt l¥n.#r#YHãy quay lÕi vào hôm sau." )
		--	return
          --  end
				
				
				AddMoney( sceneId, selfId, 1000000000 )
				YuanBao(sceneId,selfId,targetId,1,1000000)			
				local	nam	= LuaFnGetName( sceneId, selfId )
				--BroadMsgByChatPipe( sceneId, selfId, "#H #Y"..nam.." #Hðã nh§n thành công : #G#{_EXCHG10000000}", 4 )
				--SetMissionData(sceneId, selfId, MD_AddMoneyJZ, day);
				local str = "Xin chúc m×ng, các hÕ ðã nh§n ðßþc 1000000 KNB và 10000 Vàng"
			x001113_ShowNotice( sceneId, selfId, str )
	end
	if GetNumText() == 30000 then
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)
					AddExp(sceneId,selfId, 700000)					
									local	nam	= LuaFnGetName( sceneId, selfId )
	end								
	if GetNumText() == 8888 then
	ZengDian(sceneId,selfId,targetId,1,300000)
	if strGUID == -1 then 
				--TryRecieveItem(sceneId,selfId, 38001111,1)
				--TryRecieveItem(sceneId,selfId, 38001111,1)
				end
			local str = "Xin chúc m×ng, các hÕ ðã nh§n ðßþc 300000 Ði¬m T£ng"
			x001113_ShowNotice( sceneId, selfId, str )
	end
	
		if GetNumText() == 30030 then --huy hieu ung tam hoai co chu
		local ketqua = LuaFnCancelSpecificImpact(sceneId,selfId,113)
		BeginEvent(sceneId)
			if ketqua ~=0 then
				AddText(sceneId,"Kªt quä : "..ketqua.." #rÐã huÖ thành công hi®u Ñng")
			else
				AddText(sceneId,"Kªt quä : "..ketqua.." #rCác hÕ không có hi®u Ñng thß½ng nhân ho£c tào v§n nên không th¬ huÖ.")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
		local NumText = GetNumText()
	if GetNumText() == 15000 then
			BeginEvent(sceneId)
						AddText(sceneId," #cFF0000 Chào m×ng các bÕn tham gia server NetCo4, xin kính chúc các b¢ng hæu có nhñng phút giây vui vë cùng Server ")
			AddNumText( sceneId, x001113_g_ScriptId, "Nh§n buff 2.5-Huy«n Linh Ðan", 8, 15001 )

		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 15001	then
		--È·¶¨
		x001113_GiveBuff( sceneId, selfId, targetId )
	end	
end
--**********************************
function x001113_GiveBuff( sceneId, selfId, targetId )
		--Èç¹ûÍæ¼ÒµÈ¼¶Ð¡ÓÚ30²»Óè»»È¡ºØ¿¨
	if	GetLevel( sceneId, selfId) > 105 then
		BeginEvent(sceneId)
			AddText( sceneId, "Các hÕ có c¤p ðµ trên 105 không th¬ nh§n 2.5 ðßþc næa" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	--Èç¹ûÍæ¼ÒÓÐ»î¶¯µÄBUFF
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x001113_g_BufferId ) == 1 then
	   BeginEvent(sceneId)
			 AddText( sceneId, "Các hÕ hi®n ðang còn th¶i gian sØ døng 2.5 xin hãy ch¶ hªt th¶i gian buff r°i hãy tiªp tøc ðªn nh§n" )
		 EndEvent(sceneId)
		 DispatchEventList(sceneId,selfId,targetId)
		 return
	end	
	
	 --¸øÓèÍæ¼Ò»î¶¯BUFF
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x001113_g_BufferId, 0)	
   
   BeginEvent(sceneId)
			AddText( sceneId, "Xin chúc m×ng, ðã nh§n buff 2.5 thành công" )
	 EndEvent(sceneId)
	 DispatchMissionTips( sceneId, selfId )

end
function x001113_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
function x001113_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
-- [NetCo4 01/10] Nhan lai hop Tan Thu Trang Bi [10 cap] (30008080, obj/item/UBagsongtim.lua): mo ra 12 mon set Tan Thu + Thanh Dong Dao, tat ca khoa.
-- 1 lan / nhan vat / ngay, trang thai ./txt/NetCo4Web/<GUID>.tanthu = yyyymmdd (giong vang moi ngay o NPC NetCo4). Ghi ngay TRUOC khi phat.
function x001113_TanThuTrangBi( sceneId, selfId, targetId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local path = "./txt/NetCo4Web/"..guid..".tanthu"
	local today = GetTodayYear() * 10000 + GetTodayMonth() * 100 + GetTodayDate()
	local h = openfile( path, "r" )
	if h then
		local s = read( h, "*l" )
		closefile( h )
		if s and tonumber( s ) ~= nil and tonumber( s ) > 0 then -- [mo-server] 1 lan duy nhat (goc: == today). Phat loi ghi "0" nen van nhan lai duoc
			x001113_NotifyFailBox( sceneId, selfId, targetId, "C\225c h\213 \240\227 nh\167n T\226n Th\252 Trang B\184 r\176i (m\178i nh\226n v\167t ch\239 1 l\165n)." )
			return
		end
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x001113_NotifyFailBox( sceneId, selfId, targetId, "Tay n\228i c\165n 1 \244 tr\175ng." )
		return
	end
	h = openfile( path, "w" )
	if h == nil then
		x001113_NotifyFailBox( sceneId, selfId, targetId, "L\178i ghi file, b\225o GM." )
		return
	end
	write( h, today.."\n" )
	closefile( h )
	local idx = TryRecieveItem( sceneId, selfId, 30008080, 1 )
	if idx == nil or idx < 0 then
		h = openfile( path, "w" )
		if h then
			write( h, "0" )
			closefile( h )
		end
		x001113_NotifyFailBox( sceneId, selfId, targetId, "Tay n\228i c\165n 1 \244 tr\175ng." )
		return
	end
	LuaFnItemBind( sceneId, selfId, idx )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
	x001113_NotifyFailBox( sceneId, selfId, targetId, "\208\227 \240\223a #YT\226n Th\252 Trang B\184 [10 c\164p]#W. C\165n c\164p 10, \240\227 v\224o m\244n ph\225i v\224 14 \244 tr\175ng \240\172 m\183, ra set 12 m\243n + Thanh \208\176ng \208ao (kh\243a)." )
end

function x001113_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end