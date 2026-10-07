-- 112000 Ì××°¶Ò»»NPC

-- ÁºÊ¦³É

--½Å±¾ºÅ
x112000_g_ScriptId = 112000
x112000_Thoitrang ={10553200,10553201,10553202,10553203,10553204,10553205,10553206,10553207,10553208,10553209,10553210,10553211,10553212,10553213,10553214,10553215,10553216,10553217,10553218,10553219,10553220,10553221,10553222,10553223,10553224,10553225,10553226,10553227,10553228,10553229,10553230,10553231,10553232,10553233,10553234,10553235,10553236,10553237,10553238,10553239,10553240,10553241,10553242,10553243,10553244,10553245,10553246,10553247,10553248,10553249,10553250,10553251,10553252,10553253,10553254,10553255,10553256,10553257,10553258,10553259,10553260,10553261,10553262,10553263,10553264,10553265,10553266,10553267,10553268,10553269,10553270,10553271,10553272,10553273,10553274,10553275,10553276,10553277,10553278,10553279,10553280,10553281,10553282,10553283,10553284,10553285,10553286,10553287,10553288,10553289,10553290,10553291,10553292,10553293,10553294,10553295,10553296,10553297,10553298,10553299,10553300,10553301,10553302,10553303,10553304,10553305,10553306,10553307,10553308,10553309,10553310,10553311,10553312,10553313,10553314,10553315,10553316,10553317,10553318,10553319,10553320,10553321,10553322,10553323,10553324,10553325,10553326,10553327,10553328,10553329,10553330,10553331,10553332,10553333,10553334,10553335,10553336,10553337,10553338,10553339,10553340,10553341,10553342,10553343,10553344,10553345,10553346,10553347,10553348,10553349,10553350,10553351,10553352,10553353,10553354,10553355,10553356,10553357,10553358,10553359,10553360,10553361,10553362,10553363,10553364,10553365,10553366,10553367,10553368,10553369,10553370,10553371,10553372,10553373,10553374,10553375,10553376,10553377,10553378,10553379,10553380,10553381,10553382,10553383,10553384,10553385,10553386,10553387,10553388,10553389,10553390,10553391,10553392,10553393,10553394,10553395,10553396,10553397,10553398,10553399,10553400,10553401,10553402,10553403,10553404,10553405,10553406,10553407,10553408,10553409,10553410,10553411,10553412,10553413,10553414,10553415,10553416,10553417,10553418,10553419,10553420,10553421,10553422,10553423,10553424,10553425,10553426,10553427,10553428,10553429,10553430,10553431,10553432,10553433,10553434,10553435,10553436,10553437,10553438,10553439,10553440,10553441,10553442,10553443,10553444,10553445,10553446,10553447,10553448,10553449,10553450,10553451,10553452,10553453,10553454,10553455,10553456,10553457,10553458,10553459,10553460,10553461,10553462,10553463,10553464,10553465,10553466,10553467,10553468,10553469,10553470,10553471,10553472,10553473,10553474,10553475,10553476,10553477,10553478,10553479,10553480,10553481,10553482,10553483,10553484,10553485,10553486,10553487}

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
--x112000_g_eventList={889070}

x112000_g_EquipList={	
-- ÖØÂ¥
{n=1100,id=10553101},{n=1200,id=10553102},{n=1300,id=10553100},{n=1400,id=10553106},{n=1500,id=10553110},{n=1600,id=10553108},
--»¨ÀàÉñÆ÷1
{n=4100,id=10305021},{n=4100,id=10305022},{n=4100,id=10305023},{n=4100,id=10305024},
{n=4100,id=10305025},{n=4100,id=10305026},{n=4100,id=10305027},{n=4100,id=10305028},
--»¨ÀàÉñÆ÷2
{n=4200,id=10305029},{n=4200,id=10305030},{n=4200,id=10305031},{n=4200,id=10305032},
{n=4200,id=10305033},{n=4200,id=10305034},{n=4200,id=10305035},
}

x112000_g_StoneList={
{n=1,id=20310185,num=300,str="Trùng Lâu Chi L®"},
{n=2,id=20310186,num=300,str="Trùng Lâu Chi Mang"},
{n=3,id=20310187,num=300,str="Trùng Lâu Chi Thß½ng"},
{n=4,id=20310188,num=300,str="Trùng Lâu Chi Dß½ng"},
{n=5,id=20310189,num=300,str="Thiên Ð¸a Minh Châu"},
{n=6,id=20310190,num=300,str="Lßu Ly Minh Châu"},

{n=8,id=20310195,num=10,str="Ãµ¹åÖ®Áµ"},
}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function  x112000_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"    #cffffccXin m¶i lña ch÷n ph¥n thß·ng phía dß¾i c¥n ð±i ! ")
	 	 AddNumText(  sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000Trùng Lâu Ma Gi¾i ",  6,  1000  )
	 	 --AddNumText(  sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000Cá Tính Vû Khí ",  6,  4000  )
		 		AddNumText( sceneId, x112000_g_scriptId, "Ð±i #cFF0000Th¶i Trang Thuµc Tính", 6, 10 )
	 	 AddNumText(  sceneId,  x112000_g_ScriptId,  "#GTrùng Lâu Thång C¤p",  6,  5000  )
	 	 AddNumText(  sceneId,  x112000_g_ScriptId,  "#GT¦y Chân-Trùng Lâu ",  6,  5500  )
	 	-- AddNumText(  sceneId,  x112000_g_ScriptId,  "#H huy­n sÑc vû khí ðoán tÕo ",  6,  6000  )
	 	-- AddNumText(  sceneId,  x112000_g_ScriptId,  "#H huy­n sÑc vû khí tr÷ng t¦y ",  6,  6500  )
	 	 AddNumText(  sceneId,  x112000_g_ScriptId,  "R¶i ði",  0,  0  )

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x112000_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x112000_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x112000_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
local nam = LuaFnGetName(sceneId,selfId)
	local strGUID = LuaFnGetGUID( sceneId, selfId )

	local key = GetNumText()
	if key == 10 then
	BeginEvent( sceneId )
	AddText(sceneId," #c66ccff 1.#cFF0000Có th¬ dùng 20 nguyên li®u trùng các loÕi ð¬ ð±i th¶i trang thuµc tính")
	AddNumText( sceneId, x112000_g_scriptId, "#g0f0ff0Trùng Lâu Chi L® ð±i Th·i trang ", 6, 101 )
	AddNumText( sceneId, x112000_g_scriptId, "#g0f0ff0Trùng Lâu Chi Mang ð±i Th·i trang ", 6, 102 )
	AddNumText( sceneId, x112000_g_scriptId, "#g0f0ff0Trùng Lâu Chi Thß½ng ð±i Th·i trang ", 6, 103 )
	AddNumText( sceneId, x112000_g_scriptId, "#g0f0ff0Trùng Lâu Chi Dß½ng ð±i Th·i trang ", 6, 104 )
	AddNumText( sceneId, x112000_g_scriptId, "#g0f0ff0Thiên Ð¸a Minh Châu ð±i Th·i trang ", 6, 105 )
	AddNumText( sceneId, x112000_g_scriptId, "#g0f0ff0Lßu Ly Minh Châu ð±i Th·i trang ", 6, 106 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 101 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310185) < 20   then
	x112000_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x112000_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310185,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x112000_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x112000_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi LÕc Dß½ng ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #GXin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
		x112000_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 102 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310186) < 20   then
	x112000_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x112000_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310186,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x112000_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x112000_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi LÕc Dß½ng ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #GXin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
		x112000_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 103 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310187) < 20   then
	x112000_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x112000_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310187,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x112000_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x112000_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi LÕc Dß½ng ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #GXin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
		x112000_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return	
	end
	
	if key == 104 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310188) < 20   then
	x112000_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x112000_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310188,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x112000_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x112000_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi LÕc Dß½ng ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #GXin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
			x112000_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 105 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310189) < 20   then
	x112000_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x112000_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310189,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x112000_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x112000_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi LÕc Dß½ng ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #GXin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
			x112000_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	
	if key == 106 then
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310190) < 20   then
	x112000_NotifyFailTips(sceneId, selfId, "Các hÕ không ðü 20 cái không th¬ ð±i")
	return 
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then 
      x112000_NotifyFailTips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 1 ô")
   return
	end
	local item = random(1,280)
	LuaFnDelAvailableItem(sceneId, selfId, 20310190,20)
	local nBagIndex = TryRecieveItem(sceneId,selfId, x112000_Thoitrang[item],1)
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	local sItemName = GetItemName(sceneId,  x112000_Thoitrang[item])
	local name = LuaFnGetName(sceneId, selfId)
	str = format( "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff TÕi LÕc Dß½ng ðã ð±i thành công ðßþc #cFF0000#{_INFOMSG%s} #GXin chúc m×ng ", GetName(sceneId,selfId),szTransferEquip )
	BroadMsgByChatPipe(sceneId, selfId, str, 4);
			x112000_NotifyFailBox( sceneId, selfId, selfId, "#YÐ±i Thành Công")
	return
	end
	 local  nNumText  =  GetNumText()
	 if  nNumText  ==  0    then
	 	 --  t¡t cØa s± 
	 	 BeginUICommand(sceneId)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  1000)
	 	 return
	 end
	 
	 if  nNumText  ==  1000  or  nNumText  ==  2000  or  nNumText  ==  3000  or  nNumText  ==  4000  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  "    Xin m¶i các hÕ lña ch÷n Trùng Lâu c¥n ð±i: ")
	 	 	 if  nNumText  ==  1000    then
	 	 	 AddNumText(sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000 Trùng Lâu Gi¾i ",  6,  nNumText+100)
	 	 	 AddNumText(sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000 Trùng Lâu Ng÷c ",  6,  nNumText+200)
	 	 	 AddNumText(sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000 Trùng Lâu Liên ",  6,  nNumText+300)
	 	 	 AddNumText(sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000 Trùng Lâu Ðái ",  6,  nNumText+400)
	 	 	 AddNumText(sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000 Trùng Lâu Giáp ",  6,  nNumText+500)
	 	 	 AddNumText(sceneId,  x112000_g_ScriptId,  "Ð±i #cFF0000 Trùng Lâu Kiên ",  6,  nNumText+600)
	 	 	 end

	 	 	 if  nNumText  ==  4000    then
	 	 	-- AddNumText(sceneId,  x112000_g_ScriptId,  "#cFF0000Ð±ihoa loÕi th¥n khí ?",  6,  nNumText+100)
	 	 	-- AddNumText(sceneId,  x112000_g_ScriptId,  "#cFF0000Ð±ihoa loÕi th¥n khí ?",  6,  nNumText+200)
	 	 	 end
	 	 	 AddNumText(  sceneId,  x112000_g_ScriptId,  " R¶i ði",  0,  0  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	if nNumText == 5000  then
		-- [NetCo4 08/10] bang 20150511 cua client chi nhan Trung Lau Lien/Gioi/Ngoc (Dai/Vai/Giap khong keo vao duoc).
		-- Dung bang chung 21090722 nhu menu 5500: nhan ID 10553100-10553114, 100 Thien Dia Huyen Tinh 39901012, goi 895111 nhanh 36 (WuhunMagicUp).
		-- Ban cu: BeginUICommand / UICommand_AddInt(sceneId,targetId) / DispatchUICommand(sceneId,selfId,20150511). Rollback tag truoc-trunglau-ui-08-10
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		UICommand_AddInt( sceneId, 500 )
		UICommand_AddInt( sceneId, 0 )
		UICommand_AddInt( sceneId, 10422016 )   -- [NetCo4 08/10] tu 10422016 de nhan ca Trung Lau Gioi/Ngoc cu (server tu loai mon khac)
		UICommand_AddInt( sceneId, 10553114 )
		UICommand_AddInt( sceneId, 39901012 )
		UICommand_AddString( sceneId, "#cFF0000Tr\249ng L\226u Th\229ng C\164p" )
		UICommand_AddString( sceneId, "    #Y\208\163t Tr\249ng L\226u (Li\234n, Gi\190i, Ng\247c, \208ai, Vai, Gi\225p) v\224 500 Thi\234n \208\184a Huy\171n Tinh \240\172 n\226ng l\234n Ch\226n Tr\249ng L\226u. Gi\230 nguy\234n l\178, b\228o th\213ch, c\223\182ng h\243a." )
		UICommand_AddString( sceneId, "#YTr\249ng L\226u:" )
		UICommand_AddString( sceneId, "#YThi\234n \208\184a Huy\171n Tinh:" )
		UICommand_AddString( sceneId, "WuhunMagicUp" )
		UICommand_AddInt( sceneId, 895111 )
		UICommand_AddInt( sceneId, 36 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 21090722 )
		return
	end

	if nNumText == 5500  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
                UICommand_AddInt( sceneId, 13)
                UICommand_AddInt( sceneId, 800000)---ÐèÒªµÄÇ®
		UICommand_AddInt( sceneId, 10553103) --×°±¸¿ªÊ¼
		UICommand_AddInt( sceneId, 10553111)  --×°±¸½áÊø
		UICommand_AddInt( sceneId, 30505813)  --ÎïÆ·id
		UICommand_AddString(sceneId,"#cFF0000Tr÷ng t¦y Trùng Lâu");
		UICommand_AddString(sceneId,"    #YN½i ðây ta chuy®n tr÷ng t¦y thuµc tính các loÕi trùng");
		UICommand_AddString(sceneId,"#YTr÷ng lâu:");
		UICommand_AddString(sceneId,"#YNguyên li®u:");
		UICommand_AddString(sceneId,"WuhunMagicUp");
                UICommand_AddInt( sceneId, 895111)
                UICommand_AddInt( sceneId, 23)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  21090722)
		return
	end

	if nNumText == 6000  then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 891787 )
		return
	end

	if nNumText == 6500  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
                UICommand_AddInt( sceneId, 13)
                UICommand_AddInt( sceneId, 800000)---ÐèÒªµÄÇ®
		UICommand_AddInt( sceneId, 10000000) --×°±¸¿ªÊ¼
		UICommand_AddInt( sceneId, 20000000)  --×°±¸½áÊø
		UICommand_AddInt( sceneId, 30505813)  --ÎïÆ·id
		UICommand_AddString(sceneId,"#H»ÃÊÎÎäÆ÷ÖØÏ´");
		UICommand_AddString(sceneId,"    #YÈç¹ûÄã¶Ô#G»ÃÊÎÎäÆ÷#YµÄÊôÐÔ²»ÂúÒâ£¬¿ÉÒÔÀ´ÎÒÕâÀï½øÐÐÖØÏ´¡£Ã¿´ÎÖØÏ´ÐèÒªÏûºÄ#GÄ§ÑªÊ¯#YÒ»Ã¶¡£ÖØÏ´Ö®ºó£¬ÓÐ¼¸ÂÊµÃµ½ÊôÐÔ¸üÇ¿´óµÄ»ÃÊÎÎäÆ÷¡£#r    #Y»ÃÊÎÎäÆ÷ÖØÏ´Ö®ºó£¬±¦Ê¯ºÍµñÎÆµÈ¾ù²»»á¶ªÊ§£¬¿ÉÒÔ¶à´ÎÊ¹ÓÃÄ§ÑªÊ¯¶ÔÆäÖØÏ´¡£#r    #cFF0000×¢Òâ£º#RÎÒÕâÀïÖ»ÄÜÖØÏ´»ÃÊÎÎäÆ÷£¬ÆÕÍ¨ÉñÆ÷¿ÉÍ¨¹ýÁ¶»êÖØÖÃÊôÐÔ¡£");
		UICommand_AddString(sceneId,"#Y·ÅÈëÒªÖØÏ´µÄ»ÃÊÎÎäÆ÷:");
		UICommand_AddString(sceneId,"#YÇë·ÅÈëÄ§ÑªÊ¯:");
		UICommand_AddString(sceneId,"WuhunMagicUp");
                UICommand_AddInt( sceneId, 895111)
                UICommand_AddInt( sceneId, 20)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  21090722)
		return
	end

	if nNumText > 1000 and nNumText < 11000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ²»ÊÇ°×¸øµÄ£¬ÓÃÕâ¸ö¶«Î÷À´»»µÄÅ¶£¡£¡")
			
			local nLevel = 0
			if nNumText == 1100 then
				nLevel = 1
			end
			if nNumText == 1200 then
				nLevel = 2
			end
			if nNumText == 1300 then
				nLevel = 3
			end
			if nNumText == 1400 then
				nLevel = 4
			end
			if nNumText == 1500 then
				nLevel = 5
			end
			if nNumText == 1600 then
				nLevel = 6
			end


			if nNumText == 4100 then
				nLevel = 8
			end
			if nNumText == 4200 then
				nLevel = 8
			end


			local szStr = "  Òª»ñµÃÕâÐ©×°±¸£¬ÄãÐèÒª¸øÎÒ¡°" .. x112000_g_StoneList[nLevel].str.. "¡±¡°".. tostring(x112000_g_StoneList[nLevel].num) .. "¡±¸ö  ¸ÃÎïÆ·¿ÉÔÚ#GBOSS»òÕß¹ÖÎï#WÖÐ±¬³ö....#r  #G×¢Òâ¿´×°±¸ÊÊºÏÊ²Ã´ÃÅÅÉ£¬²»Òª»»´íÁËÅ¶#W"
			AddText(sceneId, szStr)
			
			for i, item in x112000_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x112000_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x112000_g_ScriptId, 0)
		
	end

	for i, findId in x112000_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x112000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x112000_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end
--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x112000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x112000_g_eventList do
		if missionScriptId == findId then
			x112000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x112000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x112000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x112000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x112000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--´¦ÀíÌá½»ºóµÄÏÔÊ¾Çé¿ö
	--ÎªÁË°²È«£¬ÕâÀïÒª×ÐÏ¸£¬²»ÄÜ³ö´í
	local nItemIndex = -1
	
	for i, item in x112000_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ¿´Íê¼ÒÊÇ²»ÊÇ¹»²ÄÁÏÌá½»
	local nLevel = 0
	if x112000_g_EquipList[nItemIndex].n == 1100 then
		nLevel = 1
	end
	if x112000_g_EquipList[nItemIndex].n == 1200 then
		nLevel = 2
	end
	if x112000_g_EquipList[nItemIndex].n == 1300 then
		nLevel = 3
	end
	if x112000_g_EquipList[nItemIndex].n == 1400 then
		nLevel = 4
	end
	if x112000_g_EquipList[nItemIndex].n == 1500 then
		nLevel = 5
	end
	if x112000_g_EquipList[nItemIndex].n == 1600 then
		nLevel = 6
	end


	if x112000_g_EquipList[nItemIndex].n == 4100 then
		nLevel = 8
	end
	if x112000_g_EquipList[nItemIndex].n == 4200 then
		nLevel = 8
	end

	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x112000_g_StoneList[nLevel].id) >= x112000_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "ÄãÃ»ÓÐ×ã¹»µÄ¶Ò»»ÎïÆ·£¬²»ÄÜ»»È¡×°±¸¡£"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ¼ì²éÊÇ²»ÊÇÓÐ×ã¹»µÄÊ¯Í·¿ÉÒÔ¿Û³ý
	if LuaFnGetAvailableItemCount(sceneId, selfId, x112000_g_StoneList[nLevel].id) < x112000_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "ÄãÃ»ÓÐ×ã¹»µÄ¶Ò»»ÎïÆ·¿ÉÒÔ±»¿Û³ý£¬Çë¼ì²éÎïÆ·ÊÇ·ñÉÏËø¡£"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- ¼ì²é±³°ü¿Õ¼ä
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "ÄãµÄ±³°üÃ»ÓÐ¿Õ¼äÁË¡£"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x112000_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- É¾³ýÏà¹ØµÄÊ¯Í·
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x112000_g_StoneList[nLevel].id, x112000_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "¿Û³öÊ¯Í·Ê§°Ü¡£"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--¸øÍê¼Ò¶«Î÷£¬Íê³É
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x112000_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "¶Ò»»³É¹¦¡£"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x112000_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#I±Ï¹§±Ï¾´ËÍµ½#GÂåÑô#R¶Ò»»NPC#I¹þ¹þ´óÐ¦£º¡°ÉõºÃ£¬Õâ¸ö#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x112000_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}	#IËÍµ½#GÂåÑô#R¶Ò»»NPC#I¹°ÁË¹°ÊÖ£º¡°ÓÐÀÍÓÐÀÍ£¬#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x112000_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#GÂåÑô#R¶Ò»»NPC#IÅõ×Å#Y%d#cffffcc¿Å#W#{_INFOMSG%s}#cffffccÓÉÖÔµÄÔÞµÀ£º¡°#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x112000_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x112000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x112000_OnDie( sceneId, selfId, killerId )
end
-------------
function x112000_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
function x112000_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
function x112000_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end