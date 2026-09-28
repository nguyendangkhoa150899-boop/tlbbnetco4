--Ôª±¦ NPC
--×¢Òâ±¾½Å±¾º¬ÓÐËæÉíÔª±¦Ïà¹Ø¹¦ÄÜ£¬ÇëÒ»¶¨²ÎÕÕÏÖÓÐµÄÀý×Ó½øÐÐÐÞ¸Ä¡£

x181000_g_scriptId 	= 181000
x181000_g_buyrate 	= 1

x181000_g_shoptableindex=120
x181000_g_zengdianshop=121

x181000_g_goodact		= 1		--Ôª±¦ÉÌµê
x181000_g_buyact	 	= 2		--¶Ò»»Ôª±¦
x181000_g_ticketact = 3		--¶Ò»»Ôª±¦Æ±
x181000_g_zdianact	= 4		--ÔùµãÉÌµê
x181000_g_gotodali	= 5		--·µ»ØÂåÑô

x181000_g_normalzdianshop	= 6		--ÆÕÍ¨ÔöµãÉÌµê
x181000_g_lv1zdianshop	= 7			--Ò»¼¶²ÄÁÏ
x181000_g_lv2zdianshop	= 8			--¶þ¼¶²ÄÁÏ
x181000_g_lv3zdianshop	= 9			--Èý¼¶²ÄÁÏ
x181000_g_lv4zdianshop	= 10		--ËÄ¼¶²ÄÁÏ
x181000_g_lv5zdianshop	= 11		--Îå¼¶²ÄÁÏ
x181000_g_lv6zdianshop	= 12		--Áù¼¶²ÄÁÏ
x181000_g_lv7zdianshop	= 13		--Æß¼¶²ÄÁÏ
x181000_g_lv8zdianshop	= 14		--°Ë¼¶²ÄÁÏ
x181000_g_lv9zdianshop	= 15		--¾Å¼¶²ÄÁÏ
x181000_g_lv10zdianshop	= 16		--Ê®¼¶²ÄÁÏ
x181000_g_newprize	= 17		--²é¿´ÖÐ½±
x181000_g_YuanBaoIntro	= 18	--Ôª±¦½éÉÜ

x181000_g_leave			= 20	--Àë¿ª
x181000_g_return		= 21	--·µ»Ø(Ö÷²Ëµ¥)
--x181000_thoigiandatcua  = {75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96}
x181000_thoigiandatcua  = {75}
x181000_ketqualo  = {00,04,04,06,16,18,25,28,29,35,36,36,36,46,52,56,58,59,61,63,65,74,74,79,87,89,99}
x181000_ketquade  = {29}

x181000_thoigiantrathuong  = {76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96}
x999999_ketqualo  = {}
x999999_ketquade  = {}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x181000_OnDefaultEvent( sceneId, selfId, targetId )	
	BeginEvent( sceneId )
	        local NPCName = GetName(sceneId,targetId)
--		local strText = "    Có ti«n co´ thê? sai khiªn quÖ th¥n, m£c dù trong giang h° dùng vû lñc vì bên trên, nhßng là có ti«n có th¬ s¨ làm nguyên lai r¤t nhi«u tß½ng ð¯i khó xØ lý sñ tình biªn ð½n giän, cûng có th¬ ð¬ ngß½i h§u cung giai l® ba ngàn! Ngài mu¯n làm thÑ gì ðâu? Nhß v§y ði thØ mµt chút ti«n ch² t¯t ði?"
--		AddText( sceneId, strText )
--		AddText(sceneId, "Na?p tiê`n sau khi thành công, không c¥n hÕ tuyªn, trñc tiªp ði¬m kích änh chân dung bên cÕnh h¯i ðoái nút b¤m li«n có th¬. Bän phøc Kim Nguyên B?o tï l® 1:4000")
		AddText(sceneId, " #G Khi nÕp BÕc, quý b¢ng hæu không c¥n phäi thoát ra, nÕp ngoài web, nhân v§t trong game chï c¥n Kilck vào møc #cFF0000Ð±i [G¥n Cây Máu) #Glà ðßþc ho£c có th¬ ðªn ch² ta kéo phía dß¾i ð¬ #Yð±i BÕc ra KNB #G cûng ðßþc")
		AddText(sceneId, " Lßu ý: chï nh§p t¯i ða là #cFF000065000#W bÕc 1 l¥n ð±i. Trong quá trình ð±i nªu #cFF0000b¸ ðÑng#W ho£c #cFF0000không d¸ch map ðßþc#W, #ccc33ccvui lòng ch÷n máy chü vào lÕi! ")
		AddNumText( sceneId, x181000_g_scriptId, "Mua Thß½ng Ph¦m", 2, x181000_g_goodact)
		AddNumText( sceneId, x181000_g_scriptId, "#c00ffffÐ±i BÕc ra KNB", 2, x181000_g_buyact)
		if IsEnableYuanBaoPiao() == 1 then
			--AddNumText( sceneId, x181000_g_scriptId, "Ð±i Phiªu KNB", 2, x181000_g_ticketact)
		end
		--AddNumText( sceneId, x181000_g_scriptId, "#cFF0000Ð±i thë cào ði®n thoÕi", 3,19)
		AddNumText( sceneId, x181000_g_scriptId, "#GChþ Thª Gi¾i", 3,18)
		AddNumText( sceneId, x181000_g_scriptId, "CØa hàng T£ng Ði¬m", 2, x181000_g_zdianact)
		           if NPCName == "H° Ca" then
		AddNumText( sceneId, x181000_g_scriptId, "#YÐi Ti«n Trang ð±i Phiªu Bäo ThÕch", 9,111) 
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
           end		
		--AddNumText( sceneId, x181000_g_scriptId, "Gi¾i thi®u cØa Hàng KNB và T£ng Ði¬m", 11, x181000_g_YuanBaoIntro)
		--AddNumText( sceneId, x181000_g_scriptId, "#{CZSBS_81218_2}", 11, 19)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
function x181000_UK_Call_YuanBao( sceneId, selfId)
  if GetLevel(sceneId, selfId) < 45 then
      x181000_g_Str_Tips(sceneId, selfId,"Chþ buôn bán trao ð±i KNB chï c¤p 45 tr· lên m¾i tham gia ðßþc, các hÕ vçn chßa ðü c¤p ðµ 45")
      return
  end
  local itemcon,allpagecon,UKstring = x181000_Goto_N_Page( sceneId, selfId, 1)
		 BeginUICommand(sceneId)
		 UICommand_AddInt( sceneId, allpagecon)
		 UICommand_AddInt( sceneId, 1)
		 UICommand_AddString(sceneId,UKstring);
	     EndUICommand( sceneId )
         DispatchUICommand(sceneId,selfId, 701900)	
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x181000_OnEventRequest( sceneId, selfId, targetId, eventId )
local k_dd = GetNumText() if k_dd == 19 or k_dd == 190 or k_dd == 191 or k_dd == 192 then return end -- [don-dep] tat doi the cao
	if GetNumText() == x181000_g_buyact then
                if GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD) <= 0 then
                   if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
                      x181000_g_Str_Tips(sceneId, selfId,"Xin ch×a tr¯ng 2 ô ðÕo cø và nguyên li®u")
                   return
                   end
                end
		--ÏÈÑ¯ÎÊ×Ô¼ºµÄÊ£ÓàµãÊý
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPoint", sceneId, selfId )
		
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, x181000_g_buyrate*1000)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2001 )

	elseif GetNumText() == x181000_g_newprize then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)

	elseif GetNumText() == x181000_g_return then
		x181000_OnDefaultEvent( sceneId, selfId, targetId )
	elseif GetNumText() == x181000_g_goodact then
--	ÐÂÔª±¦ÉÌµê
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 1 )
			UICommand_AddInt( sceneId, 1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 888902)

        elseif GetNumText() == 18 then
           if GetLevel(sceneId, selfId) < 45 then
              x181000_g_Str_Tips(sceneId, selfId,"Chþ buôn bán trao ð±i KNB chï c¤p 45 tr· lên m¾i tham gia ðßþc, các hÕ vçn chßa ðü c¤p ðµ 45")
              return
           end
           local itemcon,allpagecon,UKstring = x181000_Goto_N_Page( sceneId, selfId, 1)
	       BeginUICommand(sceneId)
		  UICommand_AddInt( sceneId, allpagecon)
		  UICommand_AddInt( sceneId, 1)
		  UICommand_AddString(sceneId,UKstring);
	       EndUICommand( sceneId )
               DispatchUICommand(sceneId,selfId, 701900)

	elseif GetNumText() == x181000_g_zdianact then
		BeginEvent( sceneId )
			strText = " Xin m¶i quý khách lña ch÷n cØa hàng T£ng Ði¬m mà quý khách yêu thích"
			AddText( sceneId, strText )
			--AddNumText( sceneId, x181000_g_scriptId, "CØa Hàng Ph± Thông T£ng Ði¬m", 7, x181000_g_normalzdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 1 ", 7, x181000_g_lv1zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 2", 7, x181000_g_lv2zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 3 ", 7, x181000_g_lv3zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 4 ", 7, x181000_g_lv4zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 5 ", 7, x181000_g_lv5zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 6 ", 7, x181000_g_lv6zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 7 ", 7, x181000_g_lv7zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 8 ", 7, x181000_g_lv8zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 9 ", 7, x181000_g_lv9zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, "Shop v§t li®u 10 ", 7, x181000_g_lv10zdianshop)
			AddNumText( sceneId, x181000_g_scriptId, " Tr· v« trß¾c", -1, x181000_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == x181000_g_gotodali then
		NewWorld(sceneId,selfId,0,200,177)

	elseif GetNumText() == x181000_g_ticketact then
		local _yes = LuaFnOpenPWBox(sceneId,selfId);
		if(_yes~=1)then
			local nYuanBao = YuanBao(sceneId,selfId,targetId,3,0)
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 2002 )
		end

	elseif GetNumText() == x181000_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	elseif GetNumText() == x181000_g_normalzdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 121 )
	elseif GetNumText() == x181000_g_lv1zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 122 )
	elseif GetNumText() == x181000_g_lv2zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 123 )
	elseif GetNumText() == x181000_g_lv3zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 124 )
	elseif GetNumText() == x181000_g_lv4zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 125 )
	elseif GetNumText() == x181000_g_lv5zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 126 )
	elseif GetNumText() == x181000_g_lv6zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 127 )
	elseif GetNumText() == x181000_g_lv7zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 128 )
	elseif GetNumText() == x181000_g_lv8zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 129 )
	elseif GetNumText() == x181000_g_lv9zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 130 )
	elseif GetNumText() == x181000_g_lv10zdianshop then
		x181000_NewDispatchShopItem( sceneId, selfId,targetId, 131 )
	
	elseif GetNumText() == x181000_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 19 then          -- »»Ôª±¦ËÍ±¦Ê¯
		BeginEvent( sceneId )
			AddText( sceneId, "#GChúng tôi cung c¤p d¸ch vø ð±i vàng ra thë cào ÐT các nhà mÕng , sau khi ð±i  xong vàng s¨ b¸ tr× . Ð¬ nh§n thë vui lòng ðång nh§p trên trang chü b¤m vào l¸ch sØ ð±i thë s¨ có thông tin thë sau khi ð±i hoàn t¤t " )
			AddNumText( sceneId, x181000_g_scriptId, "#Y20K vàng ð±i thë 10K", 3,190)
			AddNumText( sceneId, x181000_g_scriptId, "#Y40K vàng ð±i thë 20K", 3,191)
			AddNumText( sceneId, x181000_g_scriptId, "#Y100K vàng ð±i thë 50K", 3,192)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if GetNumText() == 190 then	
		local needMoney=200000000
		if GetMoney(sceneId,selfId) < needMoney then
			x181000_NotifyTip( sceneId, selfId, "Ngß½i không ðü vàng mà cûng mu¯n ð±i thë sao?" )
			
			return
		end
		
		AddMoney( sceneId, selfId, needMoney*-1 );
		x181000_NotifyTip( sceneId, selfId, "Chúc m×ng các hÕ ð±i thành công thë 20K , Quá trình ð±i thë ðang trong trÕng thái ch¶ duy®t, vui lòng ðång nh§p trên web ð¬ xem thông tin thë khi ðã duy®t xong " )
		local nam = GetName(sceneId,selfId)	
		local  nGuid  =  LuaFnGetGUID(  sceneId,  selfId)
		local handle3 = openfile("./Log2/the10.txt",  "a+")
		if nil ~= handle3 then
		write(handle3, "Nhan Vat:"..nam.." ID: "..nGuid.." ð±i thành công thë 10K")
		write(handle3,tostring("\n"))
		closefile(handle3)
		end
	end
	if GetNumText() == 191 then	
		local needMoney=400000000
		if GetMoney(sceneId,selfId) < needMoney then
			x181000_NotifyTip( sceneId, selfId, "Ngß½i không ðü vàng mà cûng mu¯n ð±i thë sao?" )
			
			return
		end
		
		AddMoney( sceneId, selfId, needMoney*-1 );
		x181000_NotifyTip( sceneId, selfId, "Chúc m×ng các hÕ ð±i thành công thë 20K , Quá trình ð±i thë ðang trong trÕng thái ch¶ duy®t, vui lòng ðång nh§p trên web ð¬ xem thông tin thë khi ðã duy®t xong " )
		local nam = GetName(sceneId,selfId)	
		local  nGuid  =  LuaFnGetGUID(  sceneId,  selfId)
		local handle3 = openfile("./Log2/the20.txt",  "a+")
		if nil ~= handle3 then
		write(handle3, "Nhan Vat:"..nam.." ID: "..nGuid.." ð±i thành công thë 20K")
		write(handle3,tostring("\n"))
		closefile(handle3)
		end
	end
			if  GetNumText()  ==  111  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 181,65,54)	
		end
	if GetNumText() == 192 then	
		local needMoney=1000000000
		if GetMoney(sceneId,selfId) < needMoney then
			x181000_NotifyTip( sceneId, selfId, "Ngß½i không ðü vàng mà cûng mu¯n ð±i thë sao?" )
			
			return
		end
		
		AddMoney( sceneId, selfId, needMoney*-1 );
		x181000_NotifyTip( sceneId, selfId, "Chúc m×ng các hÕ ð±i thành công thë 50K , Quá trình ð±i thë ðang trong trÕng thái ch¶ duy®t, vui lòng ðång nh§p trên web ð¬ xem thông tin thë khi ðã duy®t xong " )
		local nam = GetName(sceneId,selfId)	
		local  nGuid  =  LuaFnGetGUID(  sceneId,  selfId)
		local handle3 = openfile("./Log2/the50.txt",  "a+")
		if nil ~= handle3 then
		write(handle3, "Nhan Vat:"..nam.." ID: "..nGuid.." ð±i thành công thë 50K")
		write(handle3,tostring("\n"))
		closefile(handle3)
		end
	end
end

--**********************************
--¿Í»§¶Ë¹ºÂòÔª±¦½Ó¿Ú
--**********************************
function x181000_BuyYuanbao( sceneId, selfId, nYuanBao )
	if nYuanBao and nYuanBao >= 1200 then
		if LuaFnGetMaterialBagSpace(sceneId, selfId) <= 0 and GetMissionFlag(sceneId, selfId, MF_GEM_PRIZE_FLAG) == 0 then
			BeginEvent(sceneId);
				AddText(sceneId, "#{CZSBS_81218_3}");
			EndEvent(sceneId);
			DispatchMissionTips(sceneId, selfId);
			return
		end
	end
	
	if (nYuanBao * 400 +YuanBao(sceneId,selfId,targetId,3,0) ) > 21000000000 then
		BeginEvent(sceneId);
				AddText(sceneId, "Các hÕ ð±i phiªu KNB vßþt mÑc cho phép!");
			EndEvent(sceneId);
			DispatchMissionTips(sceneId, selfId);	
    return
	end		
	
	--¹ºÂòÔª±¦
	if nYuanBao then
		if nYuanBao > 0 and nYuanBao <= 10000000 then
			CallScriptFunction( PRIZE_SCRIPT_ID, "AskYuanBao", sceneId, selfId, nYuanBao, nYuanBao*x181000_g_buyrate*1)
		end
	end
end

--**********************************
--°´ÐèÀ´µ¯³öÉÌµê£¬·ÖÎªËæÉíÉÌµêºÍNPCÉÌµê
--**********************************
function x181000_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end

--**********************************
--UK Ôª±¦½»Ò×ÊÐ³¡
--**********************************
function x181000_g_YUANBAOJIAOYI(sceneId, selfId)  --ÓÐÐ§Ê±¼ä2Ð¡Ê±
	local stringc =""
	local string =""
	local handle = openfile("./Config/YbMarket/YuanBaoJiaoYi.txt", "r")     --
	if handle ~= nil then 
	    local 	line = ""
		while line ~= nil do 
			 line =read(handle, "*l")
             if line ==nil then break end 	
	
		     local x,y,id,name,itm1,itm2,yb1,shijian,ybz,itemkeyid,number =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)")	
             if x ~= nil and y ~= nil then 
             if LuaFnGetCurrentTime()- tonumber(shijian) <7200  and  itm1 ~= "0" then
			  if yb1 ~= "0"  then 			 
	          stringc= stringc..name..","..itm1..","..yb1..","..itemkeyid..","..number..","
			  end
			  else
			  if   itm1 ~= "0" then 
			  line =id.."\t"..name.."\t0\t"..itm1.."\t"..yb1.."\t"..shijian.."\t"..ybz.."\t"..itemkeyid.."\t"..number
			  end
			 end
	         end
            string=string..line.."\n"
			end 
		  closefile(handle)	
	end
    x181000_UK_WiteFile( sceneId, selfId, string)   
	return stringc
end

function  x181000_TuiBing_A(  sceneId,  selfId,  idx,  strun,jiage,Count  )    -- yêu c¥u ðµi trß·ng khai   thä không ít 4 ngß¶i ð«u · ðây trong 
if idx == 9999 or idx == 31 then return end -- [don-dep] tat lo de

    if  idx  ==9999  then
	 --local nHour	 = GetHour()--Ð¡Ê±
		--local nQuarter = mod(GetQuarterTime(),100) 
		--local  isok  =  x181000_GetIsInTime()
       --         if  0  ==  isok  then
		--BeginEvent( sceneId )
		--	AddText( sceneId, "#GÐang trong th¶i gian ghi s¯ không th¬ nh§n thß·ng " )
		--	AddText( sceneId, "#GTh¶i gian nh§n thß·ng t× 19h ðªn 24h hàng ngày " )
		--	EndEvent( sceneId )
		--DispatchEventList( sceneId, selfId, targetId )
	--	return
		--end
		local  string  =""
		local  str1  =0
		local  strn  =0
		local  strnyb  =0
		local  account  =0
		local  handle  =  openfile("./LoDe/Lo.txt",  "r")
		 
		 if  handle  ~=  nil  then  
	         local  line  =  ""
	 	 while  line  ~=  nil  do
                line  =read(handle,  "*l")	 	 
	 	 if  	 line  ==nil  then  
	 	 break
	 	 end 
				 
	 	 --local  x,y,id,name,itm1,itm2,yb1,shijian,ybz,itemkeyid,number  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)")
		 local  x,y,id,name,sodanh,cuoc  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)")
                                --if  number  ~=  nil  then
                                --      account  =  tonumber(number)
	                 --end
					 
	 	 if  x  ~=  nil  and  y  ~=  nil  then  
	 	      for i = 1,getn(x999999_ketqualo) do 
			  if  tostring(LuaFnGetGUID(  sceneId,  selfId))  ==  id and x999999_ketqualo[i] == tonumber(sodanh)   then
			     
								local	nam	= LuaFnGetName( sceneId, selfId )
								BroadMsgByChatPipe( sceneId, selfId, "Lô Ð« H÷c: #GCon nghi®n c¶ bÕc #H "..nam.." #Y ðã trúng Lô .#c00ffff s¯ "..tonumber(sodanh).." Hãy chúc m×ng anh ¤y nào !", 4 )
                                str1  =1
								strnyb  =cuoc
								YuanBao(sceneId,selfId,-1,1,  tonumber(strnyb)*3.3)
								
						
								
				line  =""
				
	 	       end 
			end			   
	 	     
	 	        
	 	 end  	 
	 	 if  line  ==""  then  
	 	string=string..line
	 	 else
	 	 string=string..line.."\n"	 
	 	 end
	 	 end
	 	 closefile(handle)	 
	 end
	 
	 if  str1  ==1  then 
	 
	-- YuanBao(sceneId,selfId,-1,1,  tonumber(strnyb))
	 x999999_UK_WiteFile(  sceneId,  selfId,  string)
	-- BeginEvent( sceneId )
	--		AddText( sceneId, "#b#c66ffff Chúc m×ng các hÕ nh§n thß·ng thành công, s¯ KNB ðánh Lô x3.3 l¥n r°i nhé!" )
	--		EndEvent( sceneId )
	--	DispatchEventList( sceneId, selfId, targetId )
	--	local	nam	= LuaFnGetName( sceneId, selfId )
		--local  ketqua = 0
				--for i=1,getn(x999999_ketqualo) do 
				 -- if  x999999_ketqualo[i]  ==  ketqua  then
				--BroadMsgByChatPipe( sceneId, selfId, "Lô Ð« H÷c: #GCon nghi®n c¶ bÕc #H "..nam.." #Y ðã trúng Lô .#c00ffff s¯  Hãy chúc m×ng anh ¤y nào !", 4 )
					--end 
					--end
	-- return
	 end
	 local  string  =""
		local  str  =0
		local  strn  =0
		local  strnyb  =0
		local  account  =0
		local  handle  =  openfile("./LoDe/De.txt",  "r")
		 
		 if  handle  ~=  nil  then  
	         local  line  =  ""
	 	 while  line  ~=  nil  do
                line  =read(handle,  "*l")	 	 
	 	 if  	 line  ==nil  then  
	 	 break
	 	 end 
				 
	 	 --local  x,y,id,name,itm1,itm2,yb1,shijian,ybz,itemkeyid,number  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)")
		 local  x,y,id,name,sodanh,cuoc  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)")
                                --if  number  ~=  nil  then
                                --      account  =  tonumber(number)
	                 --end
					 
	 	 if  x  ~=  nil  and  y  ~=  nil  then  
	 	      for i = 1,getn(x999999_ketquade) do 
			  if  tostring(LuaFnGetGUID(  sceneId,  selfId))  ==  id and x999999_ketquade[i] == tonumber(sodanh)   then
			     
								local	nam	= LuaFnGetName( sceneId, selfId )
								BroadMsgByChatPipe( sceneId, selfId, "Lô Ð« H÷c: #GCon nghi®n c¶ bÕc #H "..nam.." #Y ðã trúng Ð« .#c00ffff s¯ "..tonumber(sodanh).." Hãy chúc m×ng anh ¤y nào !", 4 )
                                str  =1
								strnyb  =cuoc
								YuanBao(sceneId,selfId,-1,1,  tonumber(strnyb)*70)
								
						
								
				line  =""
				
	 	       end 
			end			   
	 	     
	 	        
	 	 end  	 
	 	 if  line  ==""  then  
	 	string=string..line
	 	 else
	 	 string=string..line.."\n"	 
	 	 end
	 	 end
	 	 closefile(handle)	 
	 end
	 
	 if  str  ==1  then 
	 
	-- YuanBao(sceneId,selfId,-1,1,  tonumber(strnyb))
	 x999999_UK_WiteFile1(  sceneId,  selfId,  string)

	 BeginEvent( sceneId )
			AddText( sceneId, "#b#c66ffffChúc m×ng các hÕ nh§n thß·ng thành công " )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		--local  ketqua = 0
				--for i=1,getn(x999999_ketqualo) do 
				 -- if  x999999_ketqualo[i]  ==  ketqua  then
				--BroadMsgByChatPipe( sceneId, selfId, "Lô Ð« H÷c: #GCon nghi®n c¶ bÕc #H "..nam.." #Y ðã trúng Lô .#c00ffff s¯  Hãy chúc m×ng anh ¤y nào !", 4 )
					--end 
					--end
	 return
	 end
	 
	 
	 BeginEvent( sceneId )
			AddText( sceneId, "Các hÕ ghi Ð« không trúng ho£c không có ghi mà  ðòi nh§n thß·ng" )
			AddText( sceneId, str )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )	
	
	end
	
	
	if  idx  ==31  then      -- chßng bày v§t ph¦m   strun so tien cuoc   ,jiage so danh   ,Count loai hinh

       local nHour	 = GetHour()--Ð¡Ê±
		local nQuarter = mod(GetQuarterTime(),100) 
		local  isok  =  x181000_GetIsInTime()
                if  0  <  isok  then
		BeginEvent( sceneId )
			AddText( sceneId, "#GÐang trong th¶i gian trä thß·ng không th¬ ghi s¯ " )
			AddText( sceneId, "#GTh¶i gian ghi s¯ t× 0h hàng ngày ðªn 18h " )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
		end

	if YuanBao(sceneId,selfId,-1,3,0) < strun then
	x181000_g_Str_Tips(sceneId,  selfId,"Không có ðü KNB cûng ðòi d£t cßþc sao")
                return
	 end


	   if  Count  ==  nil  or  Count  <  1  or  Count  >  2  then
	 x181000_g_Str_Tips(sceneId,  selfId,"BÕn chßa ch÷n loÕi hình ghi s¯")
                return
	 end
	 if  jiage  >  100  then
	 x181000_g_Str_Tips(sceneId,  selfId,"S¯ ghi không hþp l®")
                return
	 end


        if  strun  ==  nil  or  strun  <  2  or  strun  >  999998  then
	 x181000_g_Str_Tips(sceneId,  selfId,"#G S¯ ti«n ð£t cßþc không hþp l®")
	 return
	 end
	 local  string  =  ""  
	 if  not  jiage  or  jiage  ==-1  then 
	 x181000_g_Str_Tips(sceneId,  selfId,"#GS¯ ð£t cßþc không hþp l©")
	 return  end
	   
	 if   Count == 1 then 

	 local	nam	= LuaFnGetName( sceneId, selfId )
				BroadMsgByChatPipe( sceneId, selfId, "Lô Ð« H÷c: #GCOn Nghi®n #H "..nam.." #Y ðã ð£t cßþc  #HLô s¯ "..jiage.." v¾i ti«n cßþc "..strun.." #Y Hãy chúc anh ¤y may m¡n nào #3", 4 )
		local nam = GetName(sceneId,selfId)	
		local  nGuid  =  LuaFnGetGUID(  sceneId,  selfId)
		local handle3 = openfile("./LoDe/Lo.txt",  "a+")
		if nil ~= handle3 then
		write(handle3, ""..nGuid.."\t"..nam.."\t"..jiage.."\t"..strun.."")
		write(handle3,tostring("\n"))
		closefile(handle3)
		end
		YuanBao(sceneId,selfId,-1,2,strun)
		return
		end 
	if   Count == 2 then 

	 local	nam	= LuaFnGetName( sceneId, selfId )
				BroadMsgByChatPipe( sceneId, selfId, "Lô Ð« H÷c: #GCOn Nghi®n #H "..nam.." #Y ðã ð£t cßþc  #HÐ« s¯ "..jiage.." v¾i ti«n cßþc "..strun.." #Y Hãy chúc anh ¤y may m¡n nào #3", 4 )
		local nam = GetName(sceneId,selfId)	
		local  nGuid  =  LuaFnGetGUID(  sceneId,  selfId)
		local handle3 = openfile("./LoDe/De.txt",  "a+")
		if nil ~= handle3 then
		write(handle3, ""..nGuid.."\t"..nam.."\t"..jiage.."\t"..strun.."")
		write(handle3,tostring("\n"))
		closefile(handle3)
		end
		YuanBao(sceneId,selfId,-1,2,strun)
		return
		end 
		
		x181000_g_Str_Tips(sceneId,  selfId,jiage)
		x181000_g_Str_Tips(sceneId,  selfId,strun)
		x181000_g_Str_Tips(sceneId,  selfId,Count)
	
	 
                

                
    end	
	
	if  idx  ==40  then      -- quän lý v§t ph¦m 	 
    
    x181000_g_Str_Tips(sceneId,  selfId,  "Shop tÕm khóa"  )
    return
    end
	
	----------------------------------------------------------------------------------------------------------------
	 

    if  idx  ==40  then      -- quän lý v§t ph¦m 	 
    if  strun  ==  nil  or  strun  <  1  then
    x181000_g_Str_Tips(sceneId,  selfId,  "phi pháp v§t ph¦m"  )
    return
    end

	 local  string  =""
	 local  str  =  ""
	 local  handle  =  openfile("./Config/YbMarket/YuanBaoJiaoYi.txt",  "r")
	 if  handle  ~=  nil  then  
	 	 local  	 line  =  ""
	 	 local  copyline  =  0
	 	 while  line  ~=  nil  do  
	 	 line  =read(handle,  "*l")
	 	 if  	 line  ==nil  then  
	 	 break
	 	 end
	 	 local  x,y,id,name,itm1,itm2,yb1,shijian,ybz,itemkeyid,number  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)")	 
	 	 if  x  ~=  nil  and  y  ~=  nil  then  
	 	       if  tostring(LuaFnGetGUID(  sceneId,  selfId))  ==  id  then
	 	           if  tonumber(itm1)  >0  then  
	 	 	 itm1  =itm1
	 	 	 else
	 	 	 itm1  =itm2	 
	 	 	   end
	 	 if  yb1  ==  "0"    then  
	 	 	 yb1  =  ybz
	 	 str  ="#cFF0000ðã bán"	 
	 	 else
	 	   if  LuaFnGetCurrentTime()-  tonumber(shijian)  <7200  then
	 	   str  ="#cFF0000trßng bày"	 
	 	   else
	 	 str  ="#cFF0000ðã qua hÕn "	 
	 	   end
	 	 end  
	 	   
	 	   
	 	   copyline  =  copyline  +  1
	 	   if  copyline  >=  (strun-1)*10  and  copyline  <=  strun*10  then
	 	   string  =  string..""..itm1..","..yb1..","..str..","..itemkeyid..","
	 	   end
	 	       end  
	 	 end	 
                if  	 copyline  >=  strun*10  then
                break
                end	 	 
	 	 end
	 	 
	 	 closefile(handle)	 
	 end	 
	 
	 	   BeginUICommand(sceneId)
	 	   if  string  ==  ""  then
	 	   UICommand_AddInt(  sceneId,  0)
	 	   else
	 	   UICommand_AddInt(  sceneId,  1)
	 	   end
	 	   UICommand_AddInt(  sceneId,  strun)
	           UICommand_AddString(sceneId,tostring(string  ));
	           EndUICommand(  sceneId  )
                  DispatchUICommand(sceneId,selfId,  701902)	 	 	 
      end

    if  idx  ==50  then      -- l¤y v§t ph¦m cùng ti«n 
        if  strun  ==  nil  or  strun  <  1  then
	 x181000_g_Str_Tips(sceneId,  selfId,  " phi pháp v§t ph¦m "  )
        return
	 end
	 local  string  =""
	 local  str  =0
	 local  strn  =0
	 local  strnyb  =0
	 local  account  =0
	 local  handle  =  openfile("./Config/YbMarket/YuanBaoJiaoYi.txt",  "r")	 
	 if  handle  ~=  nil  then  
	         local  line  =  ""
	 	 while  line  ~=  nil  do
                line  =read(handle,  "*l")	 	 
	 	 if  	 line  ==nil  then  
	 	 break
	 	 end  
	 	 local  x,y,id,name,itm1,itm2,yb1,shijian,ybz,itemkeyid,number  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)")
                                --if  number  ~=  nil  then
                                --      account  =  tonumber(number)
	                 --end
	 	 if  x  ~=  nil  and  y  ~=  nil  then  
	 	       if  tostring(LuaFnGetGUID(  sceneId,  selfId))  ==  id  and  strun  ==  tonumber(itemkeyid)  then
	 	       if  yb1  ==  "0"    then  
                                str  =1      -- ði bán ra lßu trình 
	 	 	 strnyb  =ybz  
	 	       else
	 	           if  tonumber(itm1)  >0  then  
	 	 	 itm1  =itm1
	 	 	 else
	 	 	 itm1  =itm2	 
	 	 	   end
	 	       strn  =  itm1
                                      account  =  tonumber(number)    --- hÕt tØ khäo nghi®m gia nh§p 
	 	       end  
	 	     line  =""
	 	       end  
	 	 end  	 
	 	 if  line  ==""  then  
	 	 string=string..line
	 	 else
	 	 string=string..line.."\n"	 
	 	 end
	 	 end
	 	 closefile(handle)	 
	 end	 
	 if  str  ==0  then      -- thu h°i lßu trình 
	 	 if  tonumber(strn)  ~=  nil  then  
	 	 	 if  tonumber(strn)    >100000  then  
if  LuaFnGetMaterialBagSpace(sceneId,  selfId)  <  3    then
x181000_g_Str_Tips(  sceneId,  selfId,  "C¥n 3 ô tr¯ng tay näi"  )
return
end
if  LuaFnGetPropertyBagSpace(sceneId,  selfId)  <  3    then
x181000_g_Str_Tips(  sceneId,  selfId,  " C¥n 3 ô tr¯ng tay näi"  )
return
end
                        BeginAddItem(sceneId)
						--for  i  =  1,account  do
	 	        -- TryRecieveItem(  sceneId,  selfId,tonumber(strn),  i  )
						AddItem( sceneId,tonumber(strn),account)
                      --  end
						EndAddItem(sceneId,selfId)
						AddItemListToHuman(sceneId,selfId)		
	 	 x181000_g_Str_Tips(sceneId,  selfId," v§t ph¦m thu h°i thành công ")
	 	 x181000_UK_WiteFile(  sceneId,  selfId,  string)    	 
	 	 end
	 end
        return
	 end
	 if  str  ==1  then      -- bán ra lßu trình 
	 	 if  tonumber(strnyb)  ~=  nil  then  
	 	 	 if  tonumber(strnyb)    >1  then  
	 	 	 	 YuanBao(sceneId,selfId,-1,1,  tonumber(strnyb))
	 	 	         x181000_g_Str_Tips(sceneId,  selfId," thu h°i "..tonumber(strnyb).." nguyên bäo thành công ")
	 	 	 x181000_UK_WiteFile(  sceneId,  selfId,  string)    	 
	 	 	 end
	 	 end
        return
	 end
        x181000_UK_Call_YuanBao(  sceneId,  selfId)	 
end

if  idx  ==60  then      -- mua v§t ph¦m 
	 
if  strun  ==  nil  or  strun  <  1  then
x181000_g_Str_Tips(sceneId,  selfId,  " phi pháp v§t ph¦m "  )
return
end

local  string  =""
local  str  =  0  
local  struna  =  0
local  account  =0
local  handle  =  openfile("./Config/YbMarket/YuanBaoJiaoYi.txt",  "r")          
	 if  handle  ~=  nil  then
	         local  line  =  ""
	 	 while  line  ~=  nil  do
	 	 line  =read(handle,  "*l")
	 	 if  	 line  ==nil  then  
	 	 break
	 	 end  
	 	 local  x,y,id,name,itm1,itm2,yb1,shijian,ybz,itemkeyid,number  =strfind(line,"(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)\t(.*)")
	 	 if  x  ~=  nil  and  y  ~=  nil  then  
	 	   if  tonumber(itemkeyid)  ==  strun    then
                                        str  =  tonumber(yb1)
	 	   struna  =  tonumber(itm1)
                                  account  =  tonumber(number)
	 	     line  =id.."\t"..name.."\t0\t"..itm1.."\t0\t"..shijian.."\t"..yb1.."\t"..itemkeyid.."\t"..number
	 	     end  
	 	 end  	 
	 	 string=string..line.."\n"
	 	 end
	 	 closefile(handle)	 
	 end	 

if  LuaFnGetMaterialBagSpace(sceneId,  selfId)  <  3    then
x181000_g_Str_Tips(  sceneId,  selfId,  "C¥n 3 ô tr¯ng tay näi"  )
return
end
if  LuaFnGetPropertyBagSpace(sceneId,  selfId)  <  3    then
x181000_g_Str_Tips(  sceneId,  selfId,  " C¥n 3 ô tr¯ng tay näi"  )
return
end

	 if  str  >0  then  
	 	 	 if  str  >  YuanBao(sceneId,selfId,-1,3,0)    then  
	 	 	 x181000_g_Str_Tips(sceneId,  selfId,  " không ðü "..(str  ).." nguyên bäo không cách nào mua "  )
	 	 	 return
	 	       end  	 	 
	 end  
	 if  struna  >0  then  
                      for  i  =  1,account  do
	             TryRecieveItem(  sceneId,  selfId,tonumber(struna),  i  )
                      end
	       x181000_g_Str_Tips(sceneId,  selfId," v§t ph¦m mua thành công ")	 
                else
	       x181000_g_Str_Tips(sceneId,  selfId," ngß¶i khác cß¾p mua  r°i , ngß½i không có mua ðßþc . yên tâm , không có kh¤u tr× ngß½i nguyên bäo ! ")	 
	 end
	   YuanBao(sceneId,selfId,-1,2,str)  	 
	 x181000_UK_WiteFile(  sceneId,  selfId,  string)

                x181000_UK_Call_YuanBao(  sceneId,  selfId)

      end	 
	 
	 
if  idx  ==70  then      -- thÑ N  page
if  strun  ==  nil  or  strun  <  1  then
x181000_g_Str_Tips(sceneId,  selfId,  "phi pháp v§t ph¦m"  )
return
end
    local  itemcon,allpagecon,UKstring  =  x181000_Goto_N_Page(  sceneId,  selfId,  strun)
    if  itemcon  ==  0  or  allpagecon  ==  0  then
    x181000_g_Str_Tips(sceneId,  selfId,  "phi pháp v§t ph¦m "  )
    end
	 	   BeginUICommand(sceneId)
	 	   UICommand_AddInt(  sceneId,  allpagecon)
	 	   UICommand_AddInt(  sceneId,  strun)
	 	   UICommand_AddString(sceneId,UKstring);
	           EndUICommand(  sceneId  )
                  DispatchUICommand(sceneId,selfId,  701900)	 
end	 
	 
	 
	 
	   --x181000_g_Str_Tips(sceneId,  selfId,getn(shujubiao).."|"..strun.."|"..jiage)	 
	 

end

function  x181000_Goto_N_Page(  sceneId,  selfId,  Pageidx)
	 local  shujubiao  ={}
	 local  stringc    =    x181000_g_YUANBAOJIAOYI(sceneId,  selfId)
	 shujubiao=lua_string_split(stringc,  ",")
	 local  allstirng  =  getn(shujubiao)
	 local  itemnum  =  floor(allstirng/5)
	 if  itemnum  <  1  then
	 return  0,0,""
	 end
	 local  allpagenum  =  floor(itemnum/10)
	 local  buiguopage  =  mod(itemnum,10)
	 if  buiguopage  ~=  0  then
	 allpagenum  =  allpagenum  +  1
	 end
	 if  itemnum  >  0  and  allpagenum  <  1  then
	 allpagenum  =  1
	 end
	 if  Pageidx  >  allpagenum  or  Pageidx  ==  nil  or  Pageidx  <  1  then
	 return  0,0,""
	 end
	 local  gotopageitem  =  (Pageidx-1)*10*5+1
	 local  mystring  =  ""
	 local  maxitemcon  =  gotopageitem+50
	 if  allstirng  <  maxitemcon  then
	 maxitemcon  =  allstirng
	 end
	 for  i  =  gotopageitem,maxitemcon  do
	 mystring  =  mystring..shujubiao[i]..","
	 end
	 return  itemnum,allpagenum,mystring
end

function  x181000_UK_WiteFile(  sceneId,  selfId,  Filestring)
          if  Filestring  ==  nil  then
	   Filestring  =  ""
	   end
          local  handle  =  openfile("./Config/YbMarket/YuanBaoJiaoYi.txt",  "wb")
          if  nil  ~=  handle    then
	   write(handle,tostring(  Filestring))
	   closefile(handle)
          end	 
end

function  x181000_g_Str_Tips(  sceneId,  selfId,  str  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end



--**********************************
-- khách hàng bßng UI cái nút hß·ng Ñng 
--**********************************
function  x181000_DuiHuan_GN(  sceneId,  selfId,  indexx)-- cái này sØ døng th¶i ði¬m ð×ng quên sØa ð±i 

          if  indexx  <  0  or  indexx  >  12  then
                return
          end

          if  indexx  ==  1  then
                if  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_ZENGD)  <=  0  then
                        if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
                              x181000_g_Str_Tips(sceneId,  selfId," tay näi c¥n tr¯ng 2 ô ")
                              return
                        end
                end
                CallScriptFunction(  PRIZE_SCRIPT_ID,  "AskPoint",  sceneId,  selfId  )
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 	 UICommand_AddInt(  sceneId,  1*1000)
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  2001  )	 
	 return
          end
	 
          if  indexx  ==  2  then
        	   LUR  =  "NetCo4"                              -- cái này là sung tr¸ giá ð¸a chï 
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddString(  sceneId,  LUR)
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  20151126  )	 
	 return	 
          end	 

          if  indexx  ==  3  then
        	   LUR  =  "NetCo4"          -- cái này là khách phøc QQ s¯ ph± biªn rµng rãi 
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddString(  sceneId,  LUR)
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  20151126  )	 
	   return	 
          end

          if  indexx  ==  4  then
        	 LUR  =  "NetCo4"                              -- cái này là quan võng ð¸a chï 
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddString(  sceneId,  LUR)
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  20151126  )	 
	 return	 
          end

          if  indexx  ==  5  then
        	   LUR  =  "NetCo4"          -- cái này là QQ b¥y ph± biªn rµng rãi 
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddString(  sceneId,  LUR)
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  20151126  )	 
	   return	 
          end

          if  indexx  ==  11  then
	-- BeginUICommand(sceneId)
	-- EndUICommand(sceneId)
	-- DispatchUICommand(sceneId,selfId,  20170825  )
	 x181000_g_Str_Tips(sceneId,  selfId,  "ChÑc nång tÕm chßa m·"  )
                return
          end

          if  indexx  ==  12  then
	-- BeginUICommand(sceneId)
	-- EndUICommand(sceneId)
	-- DispatchUICommand(sceneId,selfId,  20170826  )
	 x181000_g_Str_Tips(sceneId,  selfId,  "ChÑc nång tÕm chßa m·"  )
                return
          end

end



--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x181000_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end

function  x181000_GetIsInTime()

	local  nDay  =  GetTodayWeek()
	local  nQuarter  =  mod(GetQuarterTime(),100);
	local  isok  =  0

          for  i  =  1,26  do
                  if  x181000_thoigiandatcua[i]  ==  nQuarter  then
                        
                              isok  =  i
                              
                  end
          end

	return  isok
end
--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************

function  x999999_UK_WiteFile(  sceneId,  selfId,  Filestring)
          if  Filestring  ==  nil  then
	   Filestring  =  ""
	   end
          local  handle  =  openfile("./LoDe/Lo.txt",  "wb")
          if  nil  ~=  handle    then
	   write(handle,tostring(  Filestring))
	   closefile(handle)
          end	 
end
function  x999999_UK_WiteFile1(  sceneId,  selfId,  Filestring)
          if  Filestring  ==  nil  then
	   Filestring  =  ""
	   end
          local  handle  =  openfile("./LoDe/De.txt",  "wb")
          if  nil  ~=  handle    then
	   write(handle,tostring(  Filestring))
	   closefile(handle)
          end	 
end
function  x181000_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
