-----ËÕÖÝ¾«Í¨NPC  

g_JTSupport_Item = {10210011,10210012,10210013,10210014,10210015,10210016,10210017,10210018,10210019,10210020,10210031,10210032,10210033,10210034,10210035,10210036,10210037,10210038,10210039,10210040,10210051,10210052,10210053,10210054,10210055,10210056,10210057,10210058,10210059,10210060,10211011,10211012,10211013,10211014,10211015,10211016,10211017,10211018,10211019,10211020,10211031,10211032,10211033,10211034,10211035,10211036,10211037,10211038,10211039,10211040,10211051,10211052,10211053,10211054,10211055,10211056,10211057,10211058,10211059,10211060,10212011,10212012,10212013,10212014,10212015,10212016,10212017,10212018,10212019,10212020,10212031,10212032,10212033,10212034,10212035,10212036,10212037,10212038,10212039,10212040,10212051,10212052,10212053,10212054,10212055,10212056,10212057,10212058,10212059,10212060,10213011,10213012,10213013,10213014,10213015,10213016,10213017,10213018,10213019,10213020,10213031,10213032,10213033,10213034,10213035,10213036,10213037,10213038,10213039,10213040,10213051,10213052,10213053,10213054,10213055,10213056,10213057,10213058,10213059,10213060,10214011,10214012,10214013,10214014,10214015,10214016,10214017,10214018,10214019,10214020,10215011,10215012,10215013,10215014,10215015,10215016,10215017,10215018,10215019,10215020,10220006,10220007,10220008,10220009,10220010,10220016,10220017,10220018,10220019,10220020,10221006,10221007,10221008,10221009,10221010,10221016,10221017,10221018,10221019,10221020,10222006,10222007,10222008,10222009,10222010,10222016,10222017,10222018,10222019,10222020,10222031,10222032,10222033,10222034,10222035,10222036,10223006,10223007,10223008,10223009,10223010,10223016,10223017,10223018,10223019,10223020,10223031,10223032,10223033,10223034,10223035,10223036,10553100,10553101,10553102,10553103,10553104,10553105,10553106,10553107,10553108,10553109,10553110,10553111,10553112,10553113,10553114,10410004,10410005,10410006,10410007,10410008,10410009,10410010,10410011,10410012,10410013,10410014,10410015,10410016,10410017,10410018,10410019,10410020,10410021,10410022,10410023,10410024,10410025,10410026,10410027,10410028,10410029,10410030,10410031,10410032,10410033,10410034,10410035 }

x890087_g_scriptId = 890087

function x890087_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x890087_EquipCuiLian( sceneId, selfId,mun,EQItem,sun1,sun2,sun3)

    if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 3 then
	x890087_Tips( sceneId, selfId,"Xin hãy ch×a tr¯ng 3 ô Nguyên Li®u" )
	return	
    end

    if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 3 then
	x890087_Tips( sceneId, selfId,"Xin hãy ch×a tr¯ng 3 Ô ÐÕo Cø" )
	return	
    end

if mun ==10 then 
     x890087_zhuanyun( sceneId, selfId  )

elseif mun ==20 then 
     x890087_getston( sceneId, selfId  )
	 
elseif mun ==30 then  
    x890087_chuilian( sceneId, selfId, EQItem,sun1,sun2,sun3 ) 
 
elseif mun ==40 then 
    x890087_shengji( sceneId, selfId, EQItem,sun1 )  ---×°±¸£¬Ñ¡ÔñÏî

elseif mun ==50 then --²ð½â×°±¸
    x890087_fenjie( sceneId, selfId, EQItem , sun1 )

elseif mun ==60 then --×ªÒÆEQItem,sun1
	x890087_zhuanyi( sceneId, selfId, EQItem ,sun1  )  ---×°±¸1  ×°±¸2

end

end 



---**************
---Àë»ðÁ·Â¯£¬²»ÐèÒªÆäËü²ÎÊý
---**************
function x890087_zhuanyun( sceneId, selfId  )
	local tt = {1,2,3,5,10}		 
	local nCount = floor(mod(GetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN),100)/10)
	local nLastDay = floor(GetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN)/100)
	local nToday = GetDayTime()

        if nToday ~= nLastDay then
           SetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN,nToday*100)
        end

	if nCount >=5 then 
	    x890087_Tips( sceneId, selfId,"Các hÕ hôm nay ðã chuy¬n v§n 5 l¥n r°i, Ly Höa ðü dùng, còn mu¯n l¤y næa thì mua xång t¾i ðây, có lØa ð¯t luôn ^^")
	    return
	else	
           SetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN, GetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN)+10 )	
			
	   local ss = random(1,5)
	   for i=1,tt[ss] do 	
	       TryRecieveItem( sceneId, selfId, 20700063, 1 )	
	   end	
	x890087_Tips( sceneId, selfId,"Chúc m×ng các hÕ chuy¬n v§n thu ðßþc "..tt[ss].." cái Ly Höa")	
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
    end
end	

---**************
---Á·Â¯È¡Ê¯£¬²»ÐèÒªÆäËü²ÎÊý
---**************
function x890087_getston( sceneId, selfId  )
	local tt = {1,2,3,5,10}		 	 
	local nCount = mod(GetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN),10)
	local nLastDay = floor(GetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN)/100)
	local nToday = GetDayTime()

        if nToday ~= nLastDay then
           SetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN,nToday*100)
        end

	if nCount >=5 then 
	    x890087_Tips( sceneId, selfId,"Các hÕ hôm nay l¤y ðá 5 l¥n r°i, l¤y hoài sÇn Tinh Kim ThÕch quång lüng ð¥u bây gi¶ ^^")
	    return
	else	
           SetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN, GetMissionData( sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN)+1 )	
			
	   local ss = random(1,5)
	   for i=1,tt[ss] do 	
		TryRecieveItem( sceneId, selfId, 20700053, 1 )	
	   end	
	   x890087_Tips( sceneId, selfId,"Chúc m×ng các hÕ l¤y ðá thu ðßþc "..tt[ss].." cái Tinh Kim ThÕch Toái Phiªn")
	   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
	end
end
	
---**************
---×°±¸´ãÁ·
---**************
function x890087_chuilian( sceneId, selfId, EQItem,sun1,sun2,sun3 )  
	if EQItem == nil then
		return
	end
          local  check = -1
	  local  lihuoID = 20700063
	  local whz = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EQItem )
      local iio =    GetItemEquipPoint(whz)
      local JTtable={}	---Ñª ÉÁ  ÌåÁ¦ Á¦Á¿ ÁéÆø ¶¨Á¦ Éí·¨  Îï·À ÄÚ·À       
	  JTtable[1]={"XS01","SB01","TL01","LL01","LQ01","DL01","SF01","WF01","NF01","LL01","LQ01","DL01"}
      JTtable[2]={"XS01","SB01","TL01","LL01","LQ01","DL01","SF01","WF01","NF01","LL01","LQ01","DL01"}
      JTtable[3]={"XS01","SB01","TL01","LL01","LQ01","DL01","SF01","WF01","NF01","LL01","LQ01","DL01"}
      JTtable[4]={"XS01","SB01","TL01","LL01","LQ01","DL01","SF01","WF01","NF01","LL01","LQ01","DL01"}
      JTtable[5]={"XS01","SB01","TL01","LL01","LQ01","DL01","SF01","WF01","NF01","LL01","LQ01","DL01"}
     JTtable[15]={"XS01","SB01","TL01","LL01","LQ01","DL01","SF01","WF01","NF01","LL01","LQ01","DL01"}
	  JTtable[6]={"MZ01","BG01","HG01","XG01","DG01","WG01","NG01","WG01","NG01","WG01","NG01","WG01"}  ---7
	  JTtable[7]={"MZ01","BG01","HG01","XG01","DG01","WG01","NG01","WG01","NG01","WG01","NG01","WG01"}  ---7
     JTtable[12]={"MZ01","BG01","HG01","XG01","DG01","WG01","NG01","WG01","NG01","WG01","NG01","WG01"}  ---7
     JTtable[14]={"MZ01","BG01","HG01","XG01","DG01","WG01","NG01","WG01","NG01","WG01","NG01","WG01"}
	  -----ÃüÖÐ£¬±ù¹¥£¬»ð¹¥£¬Ðþ¹¥£¬¶¾¹¥£¬ÄÚ¹¥£¬Íâ¹¥£¬

  if JTtable[iio] ==nil then 
    x890087_Tips( sceneId, selfId, "Trang B¸ này chßa ðßþc c¤p phép ð¬ Tinh Thông")
	return 
  end

  for i=1,getn(g_JTSupport_Item) do 
      if whz == g_JTSupport_Item[i] then 
	 check = 1
	 --break
      end 	
  end

  if check < 1 then
      x890087_Tips( sceneId, selfId, "Chï có trang b¸ chª trên 50, Trùng Lâu, nón Nhî Th¯ và các trang b¸ khác m¾i có th¬ Tinh Thông..... nhé!" )	
      return
 end

 if LuaFnGetAvailableItemCount(sceneId, selfId, lihuoID) <10 then
      x890087_Tips( sceneId, selfId, "[Ly Höa] không ðü ho£c ít h½n 10 cái nên không th¬ T¦y luy®n" )	
      return
 end
	
 if -1 == CostMoney(sceneId,selfId,1000000) then
		 x890087_Tips( sceneId, selfId, "Không ðü 100 Vàng Tr¶i à!" )
		return
end

local  shuiji = 12

local ret = LuaFnDelAvailableItem(sceneId,selfId, lihuoID, 10)    
if ret ~= 1 then
	return   --¼ÙÈçÉ¾³ý²ÙÊ§°Ü,ÔòÖÐ¶Ï²Ù×÷,²»»á¸øÓèÍæ¼ÒÈÎºÎÎïÆ·
end


local _, myname = LuaFnGetItemCreator(sceneId, selfId,EQItem);
local JTsre ="" 
if myname == nil then 
JTsre ="&JT"..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))] 
else
  if strfind(myname,"&JT") ~=nil then   
	
if sun1 ==0 and sun2 ==0 and sun3 ==0 then  --È«²¿²»Ñ¡Ôñ	
JTsre = gsub(myname,"&JT"..strrep("%w",12),"&JT"..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))] )	
end
if sun1 ==1 then  --µ¥ÏîÑ¡Ôñ
JTsre = gsub(myname,"(&JT%w%w%w%w)"..strrep("%w",8),"%1"..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))] )			 
elseif sun2 ==1 then 
JTsre = gsub(myname,"&JT%w%w%w%w(%w%w%w%w)"..strrep("%w",4),"&JT"..JTtable[iio][(random(shuiji))].."%1"..JTtable[iio][(random(shuiji))] )			
elseif sun3 ==1 then 
JTsre = gsub(myname,"&JT"..strrep("%w",8).."(%w%w%w%w)","&JT"..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))].."%1" )			
end
if sun1 ==1 and sun2 ==1  then 
JTsre = gsub(myname,"(&JT"..strrep("%w",8)..")"..strrep("%w",4),"%1"..JTtable[iio][(random(shuiji))] )		
end 	
if sun1 ==1 and sun3 ==1  then 
JTsre = gsub(myname,"(&JT"..strrep("%w",4)..")"..strrep("%w",4).."("..strrep("%w",4)..")","%1"..JTtable[iio][(random(shuiji))].."%2" )		
end 
if sun3 ==1 and sun2 ==1  then 
JTsre = gsub(myname,"&JT"..strrep("%w",4).."("..strrep("%w",8)..")","&JT"..JTtable[iio][(random(shuiji))].."%1" )			
end 

else
JTsre = myname.."&JT"..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))]..JTtable[iio][(random(shuiji))] 		
end
end 

LuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )
LuaFnRefreshItemInfo( sceneId, selfId, EQItem )	
x890087_Tips( sceneId, selfId, "Chúc m×ng các hÕ T¦y Luy®n thành công, lßu ý nh¾ Khóa nút ðö ð¬ khöi m¤t dòng thuµc tính mình yêu thích")
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
end	



---**************
---¾«Í¨Éý¼¶
---**************
function x890087_shengji( sceneId, selfId, EQItem,sun1 )  ---×°±¸£¬Ñ¡ÔñÏî
	if EQItem == nil then
		return
	end
	local jingjingshitouID = 20700055   ----½ð¾«Ê¯
	local _, myname = LuaFnGetItemCreator(sceneId, selfId,EQItem);
	if strfind(myname,"&JT") ==nil then 
	    x890087_Tips( sceneId, selfId, "Trang b¸ nên Tinh Thông ho£c t¦y Tinh Thông trß¾c m¾i thång c¤p ðßþc, các hÕ nhé!")	
		return
	end
    
 if LuaFnGetAvailableItemCount(sceneId, selfId, jingjingshitouID) <sun1*8 then
      x890087_Tips( sceneId, selfId, "[Kim Tinh ThÕch] ít h½n "..(sun1*8).." cái, không th¬ Tinh Thông" )	
     return
 end	
  if -1 == CostMoney(sceneId,selfId,600000) then
	 x890087_Tips( sceneId, selfId, "không ðü 60 Vàng nha! " )
	 return
  end

local ret = LuaFnDelAvailableItem(sceneId,selfId, jingjingshitouID, sun1*8 )    
if ret ~= 1 then
	x890087_Tips( sceneId, selfId, "tiêu hao th¤t bÕi")
	return    
end

	local a ,b , JTA, JTB, JTC = strfind(myname,"&JT%w%w(%d%d)%w%w(%d%d)%w%w(%d%d)")	
	if a ==nil or b ==nil then 
	x890087_Tips( sceneId, selfId, "Trâng B¸ không có thông tin, không cách nào thång c¤p ")		
		return
	end	

	if sun1 == 1 then 
		if tonumber(JTA) >=10 then
		    x890087_Tips( sceneId, selfId, "Trß¾c m¡t Tinh Thông Trang B¸ chï gi¾i hÕn t¾i 10!")		
			return
		end
		
    if tonumber(JTA) <9 then 
	JTsre = gsub(myname,"(&JT"..strrep("%w",2)..")%d%d("..strrep("%w",8)..")","%10"..tostring(tonumber(JTA)+1).."%2" ) 
	else
	JTsre = gsub(myname,"(&JT"..strrep("%w",2)..")%d%d("..strrep("%w",8)..")","%1"..tostring(tonumber(JTA)+1).."%2" ) 
	end 
    LuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )
    LuaFnRefreshItemInfo( sceneId, selfId, EQItem )	
    x890087_Tips( sceneId, selfId, "Chúc M×ng các hÕ thång c¤p tinh thông thành công!")
    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 150, 0)
		
	elseif sun1 == 2 then
			if tonumber(JTB) >=10 then
		    x890087_Tips( sceneId, selfId, "Trß¾c m¡t Tinh Thông Trang B¸ chï gi¾i hÕn t¾i 10!")		
			return
		    end 
    if tonumber(JTB) <9 then 
	JTsre = gsub(myname,"(&JT"..strrep("%w",6)..")%d%d("..strrep("%w",4)..")","%10"..tostring(tonumber(JTB)+1).."%2" ) 
	else
	JTsre = gsub(myname,"(&JT"..strrep("%w",6)..")%d%d("..strrep("%w",4)..")","%1"..tostring(tonumber(JTB)+1).."%2" ) 
	end 
    LuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )
    LuaFnRefreshItemInfo( sceneId, selfId, EQItem )	
    x890087_Tips( sceneId, selfId, "Chúc M×ng các hÕ thång c¤p tinh thông thành công!")			
	
	elseif sun1 == 3 then
			if tonumber(JTC) >=10 then
		    x890087_Tips( sceneId, selfId, "Trß¾c m¡t Tinh Thông Trang B¸ chï gi¾i hÕn t¾i 10!")		
			return
		    end 
    if tonumber(JTC) <9 then 
	JTsre = gsub(myname,"(&JT"..strrep("%w",10)..")%d%d","%10"..tostring(tonumber(JTC)+1) ) 
	else
	JTsre = gsub(myname,"(&JT"..strrep("%w",10)..")%d%d","%1"..tostring(tonumber(JTC)+1) ) 
	end 
    LuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )
    LuaFnRefreshItemInfo( sceneId, selfId, EQItem )	
    x890087_Tips( sceneId, selfId, "Chúc M×ng các hÕ thång c¤p tinh thông thành công!")
    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 150, 0)	
	end
	
	
end
---**************
---¾«Í¨×ªÒÆ
---**************
function x890087_zhuanyi( sceneId, selfId, EQItem ,sun1  )  ---×°±¸1  ×°±¸2
   	if EQItem == nil or sun1 == nil  then
		  return
	end
	
	
	local whz = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EQItem )
	local whf = LuaFnGetItemTableIndexByIndex( sceneId, selfId, sun1)	
	local iio =    GetItemEquipPoint(whz)
	local iii =    GetItemEquipPoint(whf) 
    if iio ~= iii then
	    x890087_NotifyTips( sceneId, selfId, "Trang b¸ c¥n chuy¬n qua không cùng loÕi hình, không th¬ di chuy¬n" )	
		return
	end	
	
	local _, myname = LuaFnGetItemCreator(sceneId, selfId,EQItem);
	if strfind(myname,"&JT") ==nil then 
	x890087_Tips( sceneId, selfId, "Trang b¸ chßa tinh thông nên không có cách nào di chuy¬n")	
		return
	end

    local x,y,a,b,c = strfind(myname,"&JT(%w%w%w%w)(%w%w%w%w)(%w%w%w%w)") 
    if x ==nil or y ==nil then 
    x890087_Tips( sceneId, selfId, "Trang b¸ c¥n di d¶i chua...nên không có nào di chuy¬n")	
	return
    end	


     if a =="0000" or b =="0000" or c =="0000" then 
     x890087_Tips( sceneId, selfId, "Trang b¸ c¥n di d¶i chua... nên không có nào di chuy¬n")	
	 return
     end	
		
	
    if -1 == CostMoney(sceneId,selfId,500000) then
	 x890087_Tips( sceneId, selfId, "Không ðü 50 vàng" )
		return
    end
	 		
    local JTsre = gsub(myname,"&JT"..strrep("%w",12),"" )		--1hao
	
	
	local _, myname1 = LuaFnGetItemCreator(sceneId, selfId,sun1);	
	local JTsre1
	if myname1 ==nil then myname1 ="" end 
		
	if strfind(myname1,"&JT") ==nil then 
	JTsre1 = myname1.."&JT"..a..b..c	
	else
	JTsre1 = gsub(myname1,"&JT"..strrep("%w",12),"&JT"..a..b..c )		--1hao		
	end	
	LuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )
    LuaFnRefreshItemInfo( sceneId, selfId, EQItem )	
	LuaFnSetItemCreator( sceneId, selfId, sun1, JTsre1 )
    LuaFnRefreshItemInfo( sceneId, selfId, sun1 )		
    x890087_Tips( sceneId, selfId, "Di chuy¬n Tinh Thông thành công" )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
end

---**************
---×°±¸·Ö½â
---**************
function x890087_fenjie( sceneId, selfId, EQItem , sun1 )
	if EQItem == nil then
	  return
	end
	
 local cc = 1
 if sun1 ==7 then 
  cc =1 
 elseif sun1 ==8 then
  cc =3 	
 elseif sun1 ==9 then
  cc =5 		
 end

 if -1 == CostMoney(sceneId,selfId,500000) then
		 x890087_Tips( sceneId, selfId, "không ðü 50 vàng, thánh th¥n ½i" )
		return
 end  
    local cjcg =LuaFnEraseItem( sceneId, selfId, EQItem )
	if cjcg == 1 then
		
        for i = 1, cc do
	     LuaFnItemBind( sceneId, selfId, TryRecieveItem( sceneId, selfId, 20700063, 1 ))
         LuaFnItemBind( sceneId, selfId, TryRecieveItem( sceneId, selfId, 20700055, 1 ))
	    end
		x890087_Tips( sceneId, selfId, "Trang B¸ phân giäi thành công"..cjcg  )
	        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
    else
		AddGlobalCountNews( sceneId, "chª "..GetName(sceneId,selfId).." ðã làm nên kÏ tích, phân giäi thành công" )
	end
   
end