--Ð«×ÓÖÆ×÷ Ðé¿¨¼¤»î½Å±¾ QQ-718805400
x999999_g_scriptId = 999999
--**********************************
x999999_g_eventList={889050}
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************

x181000_thoigiantrathuong  = {76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96}
x999999_ketqualo  = {}
x999999_ketquade  = {}
function x999999_OnDefaultEvent( sceneId, selfId,targetId )
BeginEvent(sceneId) AddText(sceneId,"Chuc nang Gift Code / Lo De da tat.") EndEvent(sceneId) DispatchEventList(sceneId,selfId,targetId) if 1 then return end -- [don-dep]
	BeginEvent(sceneId)
							--AddText(sceneId,"#cFF0000  TÕm ðóng trong giây lát, vui lòng quay lÕi sau")
							--if LuaFnGetGUID( sceneId, selfId ) == 1010000010     then		---ID GM
          --AddText(sceneId,"#{CFKYH_120723_82}")
		  --AddText(sceneId," #ef12345#Y Ð¬ nh§n ðßþc code các bÕn vui lòng chia së + tag 10 ngß¶i bÕn bào viªt ðßþc ghim #r trên Fanpage ADM s¨ tñ ðµng gØi code vào tin nh¡n cho bÕn")
          --AddText(sceneId,"#G  PM Fanpgae NetCo4 tham gia sñ ki®n ð¬ nh§n Code chia s¨ và Code Tân Thü nhé m¤y bÕn")
				AddText(sceneId,"#e0080FF#g2E9AFF Code Chia Së chung: LYCHIASE ")	 
				AddText(sceneId,"#e0080FF#g2E9AFF Code Tân Thü chung: YQTANTHU ")	   
		  
          AddText(sceneId,"#Y  H® th¯ng lô ð« ðßþc ban BQT m· ra nh¢m møc ðích giäi töa ni«m ðam mê lô ð« cüa chß v¸ anh hùng, h® th¯ng s¨ cån cÑ kªt quä theo XSMB, các bÕn sau khi ðánh s¯ hãy theo dõi trên http://ketqua.net/ 18h30 h¢ng ngày!")		  
          AddText(sceneId,"#W  Th¶i gian ghi s¯ là 8h00 ðªn 18h00', th¶i gian nh§n thß·ng( nªu trúng) là 19h-24h")
				AddText(sceneId,"#cFF0000 -Kªt quä XSMB- ngày 12/9/2018: Lô:  ")
				AddText(sceneId,"#cFF0000 -Kªt quä XSMB- ngày 12/9/2018: Ð«:  ")	  
							--AddText(sceneId,"#cFF0000 Lô Ð« tÕm ðóng 2 hôm")		  
			AddNumText( sceneId, x999999_g_scriptId, "Kích HoÕt GiftCODE chia së Fanpage", 2, 11 )
			--AddNumText( sceneId, x999999_g_scriptId, "Kích HoÕt VIP CODE Th¥n Long", 2, 12 )
			AddNumText( sceneId, x999999_g_scriptId, "Kích H÷at CODE Tân Thü", 2, 13 )
							AddNumText( sceneId, x999999_g_scriptId, "Ghi Lô Ð«", 2, 14 )
							--AddNumText( sceneId, x999999_g_scriptId, "Nh§n Thß·ng Lô Ð«", 2, 15 )
								--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x999999_OnEventRequest( sceneId, selfId, targetId, eventId )
if 1 then return end -- [don-dep]

   if GetNumText() == 15 then
   BeginEvent(sceneId)
      	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " ch¸ ¤y "
	else
		PlayerSex = " anh ¤y "
	end
	          AddText(sceneId,"#b#YChào "..PlayerName..", b¢ng hæu hôm nay có trúng lô ð« không? nªu có trúng thì khao cho ta mµt ch¥u nh§u nhé!")
          --AddText(sceneId,"    GiftCODE là CODE phiên bän ðáp tÕ t¤t cä ngß¶i ch½i ðã tham gia Event chia s¨ quäng bá server NetCo4 ")
	   	AddNumText( sceneId, x999999_g_scriptId, "Nh§n thß·ng Lô", 2, 501 )
		--AddNumText( sceneId, x999999_g_scriptId, "test khung", 2, 104 )
	   	AddNumText( sceneId, x999999_g_scriptId, "Nh§n thß·ng Ð«", 2, 502 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end
   ------tra Lo
  if GetNumText() == 501 then
		 
		 local nHour	 = GetHour()--Ð¡Ê±
		local nQuarter = mod(GetQuarterTime(),100) 
		local  isok  =  x181000_GetIsInTime()
                if  0  ==  isok  then
		BeginEvent( sceneId )
			AddText( sceneId, "#GÐang trong th¶i gian ghi s¯ không th¬ nh§n thß·ng " )
			AddText( sceneId, "#GTh¶i gian nh§n thß·ng t× 19h ðªn 24h hàng ngày " )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
		end
		 
		 
		 
		 local  string  =""
		local  str  =0
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
                                str  =1
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
	 
	 if  str  ==1  then 
	 
	-- YuanBao(sceneId,selfId,-1,1,  tonumber(strnyb))
	 x999999_UK_WiteFile(  sceneId,  selfId,  string)
	 BeginEvent( sceneId )
			AddText( sceneId, "#b#c66ffff Chúc m×ng các hÕ nh§n thß·ng thành công, s¯ KNB ðánh Lô x3.3 l¥n r°i nhé!" )
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
			AddText( sceneId, "Các hÕ ghi Lô không trúng ho£c không có ghi mà  ðòi nh§n thß·ng" )
			AddText( sceneId, str )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	 
	 end 
	 
	 if GetNumText() == 502 then
		 
		 local nHour	 = GetHour()--Ð¡Ê±
		local nQuarter = mod(GetQuarterTime(),100) 
		local  isok  =  x181000_GetIsInTime()
                if  0  ==  isok  then
		BeginEvent( sceneId )
			AddText( sceneId, "#GÐang trong th¶i gian ghi s¯ không th¬ nh§n thß·ng " )
			AddText( sceneId, "#GTh¶i gian nh§n thß·ng t× 19h ðªn 24h hàng ngày " )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
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
			AddText( sceneId, "#b#c66ffffChúc m×ng các hÕ nh§n thß·ng thành công, s¯ KNB ðánh Ð« x70 l¥n r°i nhé!" )
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
   
   
   
   
   
   
   if GetNumText() == 11 then
	BeginEvent(sceneId)
        -- AddText(sceneId,"    GiftCODE là CODE phiên bän ðáp tÕ t¤t cä ngß¶i ch½i ðã tham gia Event chia s¨ quäng bá server NetCo4 ")
		AddText(sceneId,"#e0080FF#g2E9AFF Code Chia Së chung: LYCHIASE ")	
	   	AddNumText( sceneId, x999999_g_scriptId, "GiftCODE chia së Fanpage", 2, 101 )
		--AddNumText( sceneId, x999999_g_scriptId, "test khung", 2, 104 )
	   	AddNumText( sceneId, x999999_g_scriptId, "Liên quan t¾i GiftCODE chia së Fanpage", 11, 201 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end

   if GetNumText() == 12 then
       --x999999_tips( sceneId, selfId, "    VIP CODE Th¥n Long thë tÕm không m· ra, xin lßu ý trang web hoÕt ðµng")
	BeginEvent(sceneId)
          AddText(sceneId,"    VIP CODE Th¥n Long thë là CODE phiên bän ðáp tÕ nhæng ngß¶i ch½i có công v¾i server: quyên góp, üng hµ server, báo l²i, quäng cáo server nhi®t tình")
	   	AddNumText( sceneId, x999999_g_scriptId, "VIP CODE Th¥n Long thë kích hoÕt", 2, 102 )
	   	AddNumText( sceneId, x999999_g_scriptId, "Liên quan t¾i VIP CODE Th¥n Long thë", 11, 202 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end

   if GetNumText() == 13 then
	BeginEvent(sceneId)
          --AddText(sceneId,"    Code Tân Thü là CODE phiên bän chào m×ng nhæng ng×i m¾i ch½i tham gia l¥n ð¥u khi ðªn v¾i NetCo4 ")
		AddText(sceneId,"#e0080FF#g2E9AFF Code Tân Thü chung: YQTANTHU ")
	   	AddNumText( sceneId, x999999_g_scriptId, "Code Tân Thü kích hoÕt", 2, 103 )
	   	AddNumText( sceneId, x999999_g_scriptId, "Liên quan t¾i Code Tân Thü", 11, 203 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end

   if GetNumText() == 101 then
      BeginUICommand( sceneId )
        UICommand_AddInt( sceneId, targetId )
        EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20170430 )
   end
  -- if GetNumText() == 14 then
     -- BeginUICommand( sceneId )
       -- UICommand_AddInt( sceneId, targetId )
		--UICommand_AddString(sceneId,"#YKªt quä ngày hôm nay là : 56 #r Ð¬ 55 ");
       -- EndUICommand( sceneId )
     -- DispatchUICommand( sceneId, selfId, 60007414 )
   --end
      if GetNumText() == 14 then
      BeginUICommand( sceneId )
        UICommand_AddInt( sceneId, targetId )
        EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 771901 )
   end
   if GetNumText() == 104 then
      BeginUICommand( sceneId )
        UICommand_AddInt( sceneId, targetId )
        EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, "20140927" )
   end

   if GetNumText() == 102 then
      BeginUICommand( sceneId )
        UICommand_AddInt( sceneId, targetId )
        EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20170431 )
   end

   if GetNumText() == 103 then
      BeginUICommand( sceneId )
        UICommand_AddInt( sceneId, targetId )
        EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20170432 )
   end

   if GetNumText() == 201 then
	BeginEvent(sceneId)
          AddText(sceneId,"    GiftCODE là CODE phiên bän ðáp tÕ t¤t cä ngß¶i ch½i ðã tham gia Event chia s¨ quäng bá server NetCo4 web #GNetCo4 or NetCo4")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end

   if GetNumText() == 202 then
	BeginEvent(sceneId)
          AddText(sceneId,"     VIP CODE Th¥n Long thë là CODE phiên bän ðáp tÕ nhæng ngß¶i ch½i có công v¾i server: quyên góp, üng hµ server, báo l²i, quäng cáo server nhi®t tình")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end

   if GetNumText() == 203 then
	BeginEvent(sceneId)
          AddText(sceneId,"    Code Tân Thü là CODE phiên bän chào m×ng nhæng ng×i m¾i ch½i tham gia l¥n ð¥u khi ðªn v¾i NetCo4")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
   end




end

--*********************************
--Ê¹ÓÃÎäÊ¥¿¨
--*********************************
function x999999_XuKaJiHuo1( sceneId,selfId,k1,k2,k3,k4,k5,k6)
if 1 then return end -- [don-dep]

if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 11 then 
      x999999_tips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cu ít nh¤t 11 ô")
   return
end
if GetMissionData( sceneId, selfId, MD_Codechiase ) == 2 then 
      x999999_tips( sceneId, selfId, "CÁc hÕ ðã kích hoÕt 1 l¥n r°i")
   return
end
if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 3 then 
      x999999_tips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô nguyên li®u ít nh¤t 3 ô!")
   return
end

k1=strchar(k1)
k2=strchar(k2)
k3=strchar(k3)
k4=strchar(k4)
k5=strchar(k5)
k6=strchar(k6)
local num = 0
local mak = 0

local nkey = "LY"..k1..k2..k3..k4..k5..k6
local handle1 = openfile("../Public/Data/Script/CDK/Codechiase.txt", "r")
local MyName111 = nkey
      if nil ~= handle1 then
		for i=1, 20000 do
			local line=read(handle1, "*l")
			if line==nil then
				break
			end
			if line==MyName111 then
				num=1
				break
			end
		end
	closefile(handle1)	
	end

--local handle2 = openfile("../Public/Data/Script/CDK/Codechiasedadung.txt", "r")
--local MyName222 = nkey
     -- if handle2 and nil ~= handle2 then
		--for i=1, 20000 do
			--local line=read(handle2, "*l")
			--if line==nil then
				--break
			--end
			--if line==MyName222 then
				--mak=1
				--break
			--end
		--end
	--closefile(handle2)
      --else
	  -- mak=1	
	--end

if num == 1 and mak == 0 then
local nam = GetName(sceneId,selfId)	
local handle3 = openfile("../Public/Data/Script/CDK/Codechiasedadung.txt", "a+")
      if nil ~= handle3 then
		write(handle3, nkey)
		write(handle3,tostring("\n"))
		closefile(handle3)
      end
	 
x999999_tips( sceneId, selfId, "Ngài GiftCODE thë kích hoÕt thành công!")
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10155005,1 ) ) --- Mai Hoa tieu
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10156100,1 ) ) --- ngu dao ban 0
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10156200,1 ) ) --- luu li diem 0
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10157001,1 ) ) --- long van +1
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30309852,1 ) ) --- pet ho tieu tien
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30008014,1 ) ) --- x5 huyen linh dan 
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30008014,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30008014,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30008014,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30008014,1 ) )

LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) ) --- x10 han bang tinh tiet
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20310113,1 ) )

for i =1,100 do
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20501007,1 ) ) --- vai bong 7
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20502007,1 ) ) --- bi ngan 7
end
--YuanBao(sceneId,selfId,targetId,1,100000)
BroadMsgByChatPipe(sceneId, selfId, "#H Chúc m×ng ngß¶i ch½i #Y["..nam.."] Thành công kích hoÕt #cFF0000 GiftCODE Chia së thành công nh§n ðc  100 nguyên li®u chª ð° các l÷a", 4)
SetMissionData( sceneId, selfId, MD_Codechiase,2 )
else
x999999_tips( sceneId, selfId, "Code vô hi®u ho£c ðã ðßþc dùng")
end
end


--*********************************
--Ê¹ÓÃÍÀÁú¿¨
--*********************************
function x999999_XuKaJiHuo2( sceneId,selfId,k1,k2,k3,k4,k5,k6)
if 1 then return end -- [don-dep]

if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 5 then 
      x999999_tips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cø ít nh¤t 5 ô!")
   return
end
if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 16 then 
      x999999_tips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô nguyên li®u ít nh¤t 13 ô!")
   return
end
if GetMissionData( sceneId, selfId, MD_Codevip) == 1 then 
      x999999_tips( sceneId, selfId, "CÁc hÕ ðã kích hoÕt 1 l¥n r°i")
   return
end

k1=strchar(k1)
k2=strchar(k2)
k3=strchar(k3)
k4=strchar(k4)
k5=strchar(k5)
k6=strchar(k6)
local check = 0
local mak = 0
local nkey = "TL"..k1..k2..k3..k4..k5..k6
local handle2 = openfile("../Public/Data/Script/CDK/Vipcode.txt", "r")
local MyName222 = nkey
      if handle2 and nil ~= handle2 then
		for i=1, 20000 do
			local line=read(handle2, "*l")
			if line==nil then
				break
			end
			if line==MyName222 then
				check=1
				break
			end
		end
	closefile(handle2)
      else
	   check=1	
	end

local handle2 = openfile("../Public/Data/Script/CDK/Vipcodedadung.txt", "r")
local MyName222 = nkey
      if handle2 and nil ~= handle2 then
		for i=1, 20000 do
			local line=read(handle2, "*l")
			if line==nil then
				break
			end
			if line==MyName222 then
				mak=1
				break
			end
		end
	closefile(handle2)
      else
	   mak=1	
	end

if check == 1 and mak == 0 then
local nam = GetName(sceneId,selfId)	
local handle3 = openfile("../Public/Data/Script/CDK/Vipcodedadung.txt", "a+")
      if nil ~= handle3 then
		write(handle3, nkey)
		write(handle3,tostring("\n"))
		closefile(handle3)
      end

x999999_tips( sceneId, selfId, "ngài VIP CODE Th¥n Long thë kích hoÕt thành công!")
for i=1,50 do 
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20501008,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 20502008,1 ) )
end
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50721201,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50721201,1 ) )
YuanBao(sceneId,selfId,targetId,1,50000)
BroadMsgByChatPipe(sceneId, selfId, "#HChúc m×ng ngß¶i ch½i #Y["..nam.."] kích hoÕt #cFF0000 VIP CODE Th¥n Long thành công nh§n ðc 50.000KNB và 100 nguyên li®u chª ð° ", 4)
SetMissionData( sceneId, selfId, MD_Codevip,1)
else
x999999_tips( sceneId, selfId, "Code Vip vô hi®u ho£c ðã ðßþc dùng")
x999999_tips( sceneId, selfId, check)
x999999_tips( sceneId, selfId, mak)
x999999_tips( sceneId, selfId, nkey)
end
end



--*********************************
--Ê¹ÓÃÑûÇë¿¨
--*********************************
function x999999_XuKaJiHuo3( sceneId,selfId,k1,k2,k3,k4,k5,k6)
if 1 then return end -- [don-dep]

if GetMissionData( sceneId, selfId, MD_Codetanthu) ==1 then 
      x999999_tips( sceneId, selfId, "Các hÕ chï ðßþc kích hoÕt 1 l¥n")
   return
end
if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 5 then 
      x999999_tips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô nguyên li®u ít nh¤t 5 ô!")
   return
end
if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 5 then 
      x999999_tips( sceneId, selfId, "B¢ng hæu không ðü ch² tr¯ng, c¥n chßa ô ðÕo cø ít nh¤t 5 ô!")
   return
end


k1=strchar(k1)
k2=strchar(k2)
k3=strchar(k3)
k4=strchar(k4)
k5=strchar(k5)
k6=strchar(k6)
local check = 0
local mak = 0

local nkey = "YQ"..k1..k2..k3..k4..k5..k6
local handle2 = openfile("../Public/Data/Script/CDK/TanThu.txt", "r")
local MyName222 = nkey
      if handle2 and nil ~= handle2 then
		for i=1, 2000 do
			local line=read(handle2, "*l")
			if line==nil then
				break
			end
			if line==MyName222 then
				check=1
				break
			end
		end
	closefile(handle2)
      else
	   check=1	
	end

--local handle2 = openfile("../Public/Data/Script/CDK/TanThuOK.txt", "r")
--local MyName222 = nkey
      --if handle2 and nil ~= handle2 then
		--for i=1, 2000 do
			--local line=read(handle2, "*l")
			--if line==nil then
				--break
			--end
			--if line==MyName222 then
				--mak=1
				--break
			--end
		--end
	--closefile(handle2)
     -- else
	  -- mak=1	
	--end

if check == 1 and mak == 0 then
local nam = GetName(sceneId,selfId)	
local handle3 = openfile("../Public/Data/Script/CDK/TanThuOK.txt", "a+")
      if nil ~= handle3 then
		write(handle3, nkey)
		write(handle3,tostring("\n"))
		closefile(handle3)
      end
	 
x999999_tips( sceneId, selfId, "Ngài Code Tân Thü kích hoÕt thành công!")
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30900016,1 ) )-- 1 cai cchtp
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50613004,1 ) )-- 3 vien ngoc the 6
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50613004,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 50613004,1 ) )
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 38000187,1 ) )-- ai tam ngoan cu
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 30900132,1 ) )-- item doi bao thach 6
for i=1,119 do 
LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 31001467,1 ) )--x120 giang tu tien lo
end

SetMissionData( sceneId, selfId, MD_Codetanthu,1)
BroadMsgByChatPipe(sceneId, selfId, "#H Chúc m×ng ngß¶i ch½i #Y["..nam.."]#H Thành công kích hoÕt #cFF0000 Code Tân Thü ", 4)
else
x999999_tips( sceneId, selfId, "Code Tân Thü vô hi®u ho£c ðã ðßþc dùng")
x999999_tips( sceneId, selfId, nkey)
x999999_tips( sceneId, selfId, mak)
x999999_tips( sceneId, selfId, check)
end
end


--**********************************
--ÆÁÄ»ÖÐ¼äÌáÊ¾
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
function  x181000_GetIsInTime()

	local  nDay  =  GetTodayWeek()
	local  nQuarter  =  mod(GetQuarterTime(),100);
	local  isok  =  0

          for  i  =  1,21  do
                  if  x181000_thoigiantrathuong[i]  ==  nQuarter  then
                        
                              isok  =  i
                              
                  end
          end

	return  isok
end
function x999999_tips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

