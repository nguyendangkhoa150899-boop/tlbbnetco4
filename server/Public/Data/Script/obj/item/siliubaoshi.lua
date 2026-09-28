--Ëæ»ú±¦Ïä

-- ½Å±¾ºÅ
x889060_g_ScriptId	= 889060
x889060_g_ItemId = 30505150
x889060_g_BaoShiId = {
50501001,
50501002,
50502005,
50502006,
50502007,
50502008,
50502005,
50502006,
50502007,
50502008,
50503001,
50504002,
50511001,
50511002,
50513001,
50513002,
50513003,
50513004,
50401001,
50401002,
50402005,
50402006,
50402007,
50402008,
50402005,
50402006,
50402007,
50402008,
50403001,
50404002,
50411001,
50411002,
50413001,
50413002,
50413003,
50413004,
50401001,
50401002,
50402001,
50402002,
50402003,
50402004,
50402005,
50402006,
50402007,
50402008,
50403001,
50404002,
50411001,
50411002,
50413001,
50413002,
50413003,
50413004,
}

--**********************************
-- ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x889060_OnDefaultEvent( sceneId, selfId)
	local	nam	= LuaFnGetName( sceneId, selfId )

	 --¼ì²é°üÄÚÊÇ·ñÓÐÎ»ÖÃ
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 3 then
	BeginEvent(sceneId)
		AddText(sceneId,"#YKhông gian ô nguyên li®u không ðü, không th¬ ð±i thß·ng cho.!")
	EndEvent( sceneId )
        DispatchEventList( sceneId, selfId, -1 )
	return
        end

	local ret = LuaFnDelAvailableItem(sceneId,selfId,x889060_g_ItemId,1)
	if ret < 1 then
	return
	end	

	local GiftId = 0   --±¦Ê¯ID
	local strtext
	
	for i=0,2 do
	--Ëæ»ú·¢·Å±¦Ê¯
local odds = random(1,520)
	  if( odds >= 1 and odds <= 10 ) then
	    GiftId = x889060_g_BaoShiId[1]
	    strtext = "Miêu Nhãn ThÕch(c¤p 4)"
	  elseif( odds >= 11 and odds <= 20 ) then
	    GiftId = x889060_g_BaoShiId[2]
	    strtext = "H± Nhãn ThÕch(c¤p 4)"
	  elseif( odds >= 21 and odds <= 30 ) then
	    GiftId = x889060_g_BaoShiId[3]
	    strtext = "Hoàng Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 31 and odds <= 40 ) then
	    GiftId = x889060_g_BaoShiId[4]
	    strtext = "Lam Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 41 and odds <= 50 ) then
	    GiftId = x889060_g_BaoShiId[5]
	    strtext = "H°ng Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 51 and odds <= 60 ) then
	    GiftId = x889060_g_BaoShiId[6]
	    strtext = "Løc Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 61 and odds <= 70 ) then
	    GiftId = x889060_g_BaoShiId[7]
	    strtext = "Thu¥n Hoàng Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 71 and odds <= 80 ) then
	    GiftId = x889060_g_BaoShiId[8]
	    strtext = "Thu¥n Lam Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 81 and odds <= 90 ) then
	    GiftId = x889060_g_BaoShiId[9]
	    strtext = "Thu¥n H°ng Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 91 and odds <= 100 ) then
	    GiftId = x889060_g_BaoShiId[10]
	    strtext = "Thu¥n Løc Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 101 and odds <= 110 ) then
	    GiftId = x889060_g_BaoShiId[11]
	    strtext = "TØ Ng÷c(c¤p 4)"
	  elseif( odds >= 111 and odds <= 120 ) then
	    GiftId = x889060_g_BaoShiId[12]
	    strtext = "Biªn ThÕch(c¤p 4)"
	  elseif( odds >= 121 and odds <= 130 ) then
	    GiftId = x889060_g_BaoShiId[13]
	    strtext = "ThÕch Lñu ThÕch(c¤p 4)"
	  elseif( odds >= 131 and odds <= 140 ) then
	    GiftId = x889060_g_BaoShiId[14]
	    strtext = "Tiêm Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 141 and odds <= 150 ) then
	    GiftId = x889060_g_BaoShiId[15]
	    strtext = "Miêu Nhãn ThÕch(c¤p 7)"
	  elseif( odds >= 151 and odds <= 160 ) then
	    GiftId = x889060_g_BaoShiId[16]
	    strtext = "H± Nhãn ThÕch(c¤p 7)"
	  elseif( odds >= 161 and odds <= 170 ) then
	    GiftId = x889060_g_BaoShiId[17]
	    strtext = "TØ Ng÷c(c¤p 7)"
	  elseif( odds >= 171 and odds <= 180 ) then
	    GiftId = x889060_g_BaoShiId[18]
	    strtext = "Biªn ThÕch(c¤p 7)"
	  elseif( odds >= 181 and odds <= 190 ) then
	    GiftId = x889060_g_BaoShiId[19]
	    strtext = "Thu¥n Hoàng Ng÷c(c¤p 4)"
	  elseif( odds >= 191 and odds <= 200 ) then
	    GiftId = x889060_g_BaoShiId[20]
	    strtext = "Thu¥n HÕo ThÕch(c¤p 4)"
	  elseif( odds >= 201 and odds <= 210 ) then
	    GiftId = x889060_g_BaoShiId[21]
	    strtext = "Thu¥n Nguy®t Quang ThÕch(c¤p 4)"
	  elseif( odds >= 211 and odds <= 220 ) then
	    GiftId = x889060_g_BaoShiId[22]
	    strtext = "Thu¥n Bích Tï(c¤p 4)"
	  elseif( odds >= 221 and odds <= 230 ) then
	    GiftId = x889060_g_BaoShiId[23]
	    strtext = "Hoàng Bäo ThÕch(c¤p 4)"
	  elseif( odds >= 231 and odds <= 240 ) then
	    GiftId = x889060_g_BaoShiId[24]
	    strtext = "Ng÷c Bích(c¤p 4)"
	  elseif( odds >= 241 and odds <= 250 ) then
	    GiftId = x889060_g_BaoShiId[25]
	    strtext = "Luc Bäo ThÕch(c¤p 4)"
	  elseif( odds >= 251 and odds <= 260 ) then
	    GiftId = x889060_g_BaoShiId[26]
	    strtext = "T± Løc(c¤p 4)"
	  elseif( odds >= 261 and odds <= 270 ) then
	    GiftId = x889060_g_BaoShiId[27]
	    strtext = "H¡c Bäo ThÕch(c¤p 4)"
	  elseif( odds >= 271 and odds <= 280 ) then
	    GiftId = x889060_g_BaoShiId[28]
	    strtext = "Huyªt Tinh ThÕch(c¤p 4)"
	  elseif( odds >= 281 and odds <= 290 ) then
	    GiftId = x889060_g_BaoShiId[29]
	    strtext = "Løc Bäo ThÕch(c¤p 4)"
	  elseif( odds >= 291 and odds <= 300 ) then
	    GiftId = x889060_g_BaoShiId[30]
	    strtext = "Løc Bäo ThÕch(c¤p 5)"
	  elseif( odds >= 301 and odds <= 310 ) then
	    GiftId = x889060_g_BaoShiId[31]
	    strtext = "Biªn ThÕch(c¤p 5)"
	  elseif( odds >= 311 and odds <= 320 ) then
	    GiftId = x889060_g_BaoShiId[32]
	    strtext = "TØ Ng÷c(c¤p 5)"
	  elseif( odds >= 321 and odds <= 330 ) then
	    GiftId = x889060_g_BaoShiId[33]
	    strtext = "ThÕch Lñu ThÕch(c¤p 5)"
	  elseif( odds >= 331 and odds <= 340 ) then
	    GiftId = x889060_g_BaoShiId[34]
	    strtext = "Miêu Nhãn ThÕch(c¤p 5)"
	  elseif( odds >= 341 and odds <= 350 ) then
	    GiftId = x889060_g_BaoShiId[35]
	    strtext = "H± Nhãn ThÕch(c¤p 5)"
	  elseif( odds >= 351 and odds <= 360 ) then
	    GiftId = x889060_g_BaoShiId[36]
	    strtext = "Hoàng Tinh ThÕch(c¤p 5)"
	  elseif( odds >= 361 and odds <= 370 ) then
	    GiftId = x889060_g_BaoShiId[37]
	    strtext = "Lam Tinh ThÕch(c¤p 5)"
	  elseif( odds >= 371 and odds <= 380 ) then
	    GiftId = x889060_g_BaoShiId[38]
	    strtext = "H°ng Tinh ThÕch(c¤p 5)"
	  elseif( odds >= 381 and odds <= 390 ) then
	    GiftId = x889060_g_BaoShiId[39]
	  elseif( odds >= 391 and odds <= 400 ) then
	    GiftId = x889060_g_BaoShiId[40]
	  elseif( odds >= 401 and odds <= 410 ) then
	    GiftId = x889060_g_BaoShiId[41]
	  elseif( odds >= 411 and odds <= 420 ) then
	    GiftId = x889060_g_BaoShiId[42]
	  elseif( odds >= 421 and odds <= 430 ) then
	    GiftId = x889060_g_BaoShiId[43]
	  elseif( odds >= 431 and odds <= 440 ) then
	    GiftId = x889060_g_BaoShiId[44]
	  elseif( odds >= 441 and odds <= 450 ) then
	    GiftId = x889060_g_BaoShiId[45]
	  elseif( odds >= 451 and odds <= 460 ) then
	    GiftId = x889060_g_BaoShiId[46]
	  elseif( odds >= 461 and odds <= 470 ) then
	    GiftId = x889060_g_BaoShiId[47]
	  elseif( odds >= 471 and odds <= 480 ) then
	    GiftId = x889060_g_BaoShiId[48]
	  elseif( odds >= 481 and odds <= 490 ) then
	    GiftId = x889060_g_BaoShiId[49]
	  elseif( odds >= 491 and odds <= 500 ) then
	    GiftId = x889060_g_BaoShiId[50]
	  elseif( odds >= 501 and odds <= 510 ) then
	    GiftId = x889060_g_BaoShiId[51]
	  elseif( odds >= 511 and odds <= 520 ) then
	    GiftId = x889060_g_BaoShiId[52]
	  elseif( odds >= 521 and odds <= 530 ) then
	    GiftId = x889060_g_BaoShiId[53]
	  elseif( odds >= 531 and odds <= 540 ) then
	    GiftId = x889060_g_BaoShiId[54]
	  end

           BeginAddItem(sceneId)
		   AddItem( sceneId, GiftId, 1 )
	local Ret = EndAddItem(sceneId,selfId)
	if Ret > 0 then
	    AddItemListToHuman(sceneId,selfId)
           --LuaFnDelAvailableItem(sceneId,selfId,x889060_g_ItemId,1)
           local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
		local str = ""
		local rand = random(7)
				
		if rand == 1  then
			str = format("#Y#{_INFOUSR%s}#gff00f0b¸ th¤t thäi ð©p m¡t quang mang h¤p dçn, nguyên lai là bäo thÕch thùng trung có d¤u mµt cái#gffff00#{_INFOMSG%s}#gff00f0", GetName(sceneId,selfId), szItemTransfer)
		elseif rand == 2  then
			str = format("#Y#{_INFOUSR%s}#gff00f0nh© nhàng r¾t ra trong truy«n thuyªt  bäo hÕp, · bên trong phát hi®n mµt cái#{_INFOMSG%s}#gff00f0", GetName(sceneId,selfId), szItemTransfer)
		elseif rand == 3  then
			str = format("#{_INFOUSR%s}#gff00f0 m· ra  Bäo thÕch thùng #gff00f0 sau, cß nhiên là mµt viên #gffff00#{_INFOMSG%s}#gff00f0Trang ði lên sau trang b¸  tr¸ s¯ nhßng là th§t to gia tång không ít a!", GetName(sceneId,selfId), szItemTransfer)
		elseif rand == 4  then
			str = format("#Y#{_INFOUSR%s}#gff00f0 trong tay   Bäo thÕch thùng #gff00f0 k¸ch li®t run run ðÑng lên, th¤t s¡c quang mang theo thÑ tñ hi®n lên, mµt cái #gffff00#{_INFOMSG%s}#gff00f0 xu¤t hi®n · tÕi trong tay", GetName(sceneId,selfId), szItemTransfer)
		elseif rand == 5  then
			str = format("#Y#{_INFOUSR%s}#gffff00 nhìn nhß thª tinh xäo   Bäo thÕch thùng #gff00f0, ki«m chª không ðßþc  m· ra, cß¶ng ðÕi  h½i th· trào ra, ðßþc ðªn mµt cái #gffff00#{_INFOMSG%s}#gff00f0", GetName(sceneId,selfId), szItemTransfer)
		elseif rand == 6  then
			str = format("#GBäo thÕch thùng hóa làm nhi«u ði¬m tinh quang · không trung t± hþp#Y#{_INFOUSR%s}#gff00f0 phát hi®n là cái #gffff00#{_INFOMSG%s}#gff00f0kìm lòng không ð§u hß¾ng v« phía trß¾c mµt träo, thª nhßng biªn thành  th§t sñ", GetName(sceneId,selfId), szItemTransfer)
		else
			str = format("#Y#{_INFOUSR%s}#gff00f0 th§t c¦n th§n m· ra  Bäo thÕch thùng #gff00f0, hßu  nhäy ra mµt viên #gffff00#{_INFOMSG%s}#gff00f0, lóng lánh vô cùng  bäo thÕch lµ ra ánh sáng, hi¬n lµ ra này giá tr¸ phi phàm!", GetName(sceneId,selfId), szItemTransfer)
		end
				
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
	end
		
end

		BeginEvent(sceneId)
		AddText(sceneId,"#YChúc m×ng các hÕ thành công m· ra bäo tß½ng ðÕt ðßþc bäo thÕch 3 cái!")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--**********************************
-- 
--**********************************
function x889060_IsSkillLikeScript( sceneId, selfId)
	return 0
end
