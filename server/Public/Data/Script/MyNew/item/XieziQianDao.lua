
x070053_g_ScriptId = 070053

--M²i tu¥n Ð£c Hu® 
x070053_g_WeekGift={}
x070053_g_WeekGift[0] = {{38002049,0},{20310177,0},{20301009,0},{20502008,0}} --Phøc Hy Ng÷c ,S½ c¤p C¦u Thiên tài ,Thánh thú Lân ,8C¤p Bí bÕc 
x070053_g_WeekGift[1] = {{38002041,0},{20310178,0},{30505806,0},{20501008,0}} --M®nh h°n Ng÷c ,Trung c¤p C¦u Thiên tài ,Tân Mãng Th¥n phù ,8C¤p Väi bông 
x070053_g_WeekGift[2] = {{38001106,0},{30600084,0},{30505813,0},{20310021,0}} --50Cß¶ng hóa ,TØ Vi Linh Phá ,Ma huyªt ThÕch ,Huy«n HÕo Ng÷c 
x070053_g_WeekGift[3] = {{20700055,0},{20310179,0},{38002047,0},{20800034,0}} --Tinh kim ThÕch ,Cao c¤p C¦u Thiên tài ,TØ Phü Tinh Tüy ,CØu thiên Ng÷c Tuª 

x070053_g_QianDaoGift = {}
x070053_g_QianDaoGift[1] = {{38000950,1},{38000397,1}} --Chân nguyên Tinh phách ,Thß½ng HÕc Dßþc Phách 
x070053_g_QianDaoGift[2] = {{38000950,1},{38000397,1},{38000399,1}} --Chú Vån Tinh Ng÷c ,TØ Vi Linh Phách ,Chí tôn Cß¶ng hóa Tinh hoa 
x070053_g_QianDaoGift[3] = {{38000950,1},{38000397,1},{38000400,1}}--Thích Linh D¸ch ,Ly höa ,Tinh kim ThÕch 
x070053_g_QianDaoGift[4] = {{38000951,1},{38000398,1},{38000400,1}} --Võ h÷c Tâm ð¡c ,Bí t¸ch Tàn Hi®t ,Kim lan Ph± 
x070053_g_QianDaoGift[5] = {{38000951,1},{38000398,1},{38000401,1}} --Tr÷ng lâu Chi L® ,Thích Linh Tüy ,Ðª quân Phong thß·ng L­ Bao 

--**********************************
--Vi­n trình Thuyên chuy¬n 
--**********************************
function x070053_WeekOpenGift(sceneId,selfId) --Ðä khai M²i tu¥n Ð£c Hu® 
  if floor(GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT)/1000) ~= GetWeekTime() then
   SetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT,GetWeekTime()*1000)
  end
  local myCheck = GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT)
  BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,1) ---Cái này là Khai quan ,C¥n thiªt Ðä khai 
	UICommand_AddInt(sceneId,myCheck)
  EndUICommand(sceneId)
  DispatchUICommand(sceneId,selfId,2017062802)
end


function x070053_WeekBuyGift(sceneId,selfId,index) --Mua s¡m M²i tu¥n Ð£c Hu® 
  if index <1 or index> 3 then
   return
  end

  local pos = -1
  local nWeek = mod(GetWeekTime(),4)
  local nGift={}
  for i = 1,4 do
   nGift[i] = x070053_g_WeekGift[nWeek][i][1]*10 + x070053_g_WeekGift[nWeek][i][2]
  end

  local myYB = YuanBao(sceneId,selfId,targetId,3,0)
  if myYB <100000 then
    x070053_NotifyTips(sceneId, selfId,"Ngài Nguyên bäo Không ðü 100000 Ði¬m ,Không ðü ð¬ Mua s¡m Ð£c Hu® Thß½ng ph¦m")	
    return
  end	

  if LuaFnGetPropertyBagSpace(sceneId, selfId) <3 then
   x070053_NotifyTips(sceneId, selfId,"ÐÕo cø Lan Ít nh¤t Dñ Lßu 3Cái Không gian")	
   return
  end

  if LuaFnGetMaterialBagSpace(sceneId, selfId) <3 then
   x070053_NotifyTips(sceneId, selfId,"Tài li®u Lan Ít nh¤t Dñ Lßu 3Cái Không gian")	
   return
  end

  if index == 1 then
   if floor(mod(GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT),1000)/100) ~= 0 then
     x070053_NotifyTips(sceneId, selfId,"Ngß½i Ðã Mua s¡m Quá Cai Ð£c Hu® R°i ,M¶i Cu¯i tu¥n Tái T¾i mua s¡m .")	
     return
   end
   if YuanBao(sceneId,selfId,targetId,2,100000) ~= 0 then
	x070053_NotifyTips(sceneId, selfId,"Ngài Nguyên bäo Kh¤u tr× Th¤t bÕi ,B·i v§y Ngài Không th¬ ÐÕt ðßþc Ð£c Hu® Thß½ng ph¦m")	
	return
   end
   SetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT,GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT)+100)
   ---------------------------------
   --C¤p Khen thß·ng 
   for i = 1,x070053_g_WeekGift[nWeek][1][2] do
     pos = TryRecieveItem(sceneId,selfId,x070053_g_WeekGift[nWeek][1][1],1)
	if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	  LuaFnItemBind(sceneId,selfId,pos)
	end
   end
   x070053_NotifyTips(sceneId,selfId,"Chúc m×ng Ngß½i ,Mua s¡m Thành công .")
   x070053_WeekOpenGift(sceneId,selfId) --Mµt l¥n næa Ðä khai M²i tu¥n Ð£c Hu® 
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --Ð£c hi®u 
   ---------------------------------
   return
  end

  if index == 2 then
   if floor(mod(GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT),100)/10) ~= 0 then
     x070053_NotifyTips(sceneId, selfId,"Ngß½i Ðã Mua s¡m Quá Cai Ð£c Hu® R°i ,M¶i Cu¯i tu¥n Tái T¾i mua s¡m .")	
     return
   end
   if YuanBao(sceneId,selfId,targetId,2,100000) ~= 0 then
	x070053_NotifyTips(sceneId, selfId,"Ngài Nguyên bäo Kh¤u tr× Th¤t bÕi ,B·i v§y Ngài Không th¬ ÐÕt ðßþc Ð£c Hu® Thß½ng ph¦m")	
	return
   end
   SetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT,GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT)+10)
   ---------------------------------
   --C¤p Khen thß·ng 
   for i = 1,x070053_g_WeekGift[nWeek][2][2] do
     pos = TryRecieveItem(sceneId,selfId,x070053_g_WeekGift[nWeek][2][1],1)
	if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	  LuaFnItemBind(sceneId,selfId,pos)
	end
   end
   for j = 1,x070053_g_WeekGift[nWeek][3][2] do
     pos = TryRecieveItem(sceneId,selfId,x070053_g_WeekGift[nWeek][3][1],1)
	if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	  LuaFnItemBind(sceneId,selfId,pos)
	end
   end
   x070053_NotifyTips(sceneId,selfId,"Chúc m×ng Ngß½i ,Mua s¡m Thành công .")
   x070053_WeekOpenGift(sceneId,selfId) --Mµt l¥n næa Ðä khai M²i tu¥n Ð£c Hu® 
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --Ð£c hi®u 
   ---------------------------------
   return
  end

  if index == 3 then
   if mod(GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT),10) ~= 0 then
     x070053_NotifyTips(sceneId, selfId,"Ngß½i Ðã Mua s¡m Quá Cai Ð£c Hu® R°i ,M¶i Cu¯i tu¥n Tái T¾i mua s¡m .")	
     return
   end
   if YuanBao(sceneId,selfId,targetId,2,100000) ~= 0 then
	x070053_NotifyTips(sceneId, selfId,"Ngài Nguyên bäo Kh¤u tr× Th¤t bÕi ,B·i v§y Ngài Không th¬ ÐÕt ðßþc Ð£c Hu® Thß½ng ph¦m")	
	return
   end
   SetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT,GetMissionData(sceneId,selfId,MD_XIEZI_WEEKGIFT)+1)
   ---------------------------------
   --C¤p Khen thß·ng 
   for i = 1,x070053_g_WeekGift[nWeek][4][2] do
     pos = TryRecieveItem(sceneId,selfId,x070053_g_WeekGift[nWeek][4][1],1)
	if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	  LuaFnItemBind(sceneId,selfId,pos)
	end
   end
   x070053_NotifyTips(sceneId,selfId,"Chúc m×ng Ngß½i ,Mua s¡m Thành công .")
   x070053_WeekOpenGift(sceneId,selfId) --Mµt l¥n næa Ðä khai M²i tu¥n Ð£c Hu® 
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --Ð£c hi®u 
   ---------------------------------
   return
  end
end




function x070053_QianDaoOpen(sceneId,selfId) --Ðä khai Ðánh d¤u Giao di®n 
  x070053_MonthCheck(sceneId, selfId) ---Tiên Ki¬m tra ðo lß¶ng Trß¾c m£t Tháng 
  local nMonth,nDays,nQianDao = x070053_ReadTxt(sceneId,selfId)
  local QiandaoBiaoji = GetMissionData(sceneId,selfId,MD_XIEZI_QIANDAO)
  local nToday = GetTodayDate()

  BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,nToday); --Hôm nay 
	UICommand_AddInt(sceneId,nMonth); --M¤y tháng 
	UICommand_AddInt(sceneId,nDays);  --B±n nguy®t T±ng S¯ tr¶i 
	UICommand_AddInt(sceneId,QiandaoBiaoji);
    UICommand_AddString(sceneId,nQianDao);
	EndUICommand(sceneId)
  DispatchUICommand(sceneId,selfId, 89110604)
end


function x070053_QianDaoWrite(sceneId,selfId) --B¡t ð¥u Ðánh d¤u 
  x070053_MonthCheck(sceneId,selfId) ---Tiên Ki¬m tra ðo lß¶ng Trß¾c m£t Tháng 
  local nMonth,nDays,nQianDao = x070053_ReadTxt(sceneId,selfId)
  local nToday = GetTodayDate() --Hôm nay Ngày 
  local myGuid = LuaFnGetGUID(sceneId, selfId)

  if tonumber(strsub(nQianDao,nToday,nToday)) ~= 0 then
   x070053_NotifyTips(sceneId,selfId,"Hôm nay bÕn ðã ði¬m danh r°i")
   return
  end

  local string =""
  local handle = openfile("./Config/QianDao/QD"..tostring(myGuid)..".txt","r")
  if nil ~= handle then
	for i=1, nDays do
		local line=read(handle,"*l")
		if line==nil then
			line=0
		end
    if nToday == i then
		 line=1
		end
    string = string..tonumber(line).."\n"
	end
   closefile(handle)
  end

  local handle = openfile("./Config/QianDao/QD"..tostring(myGuid)..".txt","wb")
  if nil ~= handle then
	  write(handle,tostring(string))
	  closefile(handle)
  end		

  x070053_NotifyTips(sceneId,selfId,"Ði¬m danh thành công")
  x070053_QianDaoOpen(sceneId,selfId) --Mµt l¥n næa Ðä khai Ðánh d¤u Giao di®n 
  LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --Ð£c hi®u 
  return
end


function x070053_QianDaoReWrite(sceneId,selfId) --B± Thiêm 
  x070053_NotifyTips(sceneId,selfId,"TÕm th¶i không th¬ Ði¬m danh bù")
  return
end


function x070053_QianDaoGetGift(sceneId,selfId,type) --Ðánh d¤u Lînh Quà t£ng 
  if type <1 or type> 5 then
   return
  end
  local nMonth,nDays,nQianDao = x070053_ReadTxt(sceneId,selfId)
  local BiaoJi = mod(GetMissionData(sceneId,selfId,MD_XIEZI_QIANDAO),10^6)
  local QianDaoNum = 0
  for i = 1,31 do
   if tonumber(strsub(nQianDao,i,i)) ~= 0 then
     QianDaoNum = QianDaoNum + 1
   end
  end
  if floor(QianDaoNum/5) <type then
   x070053_NotifyTips(sceneId,selfId,"Phát hi®n khä nghi - liên h® GM")
   return
  end
  if tonumber(strsub(BiaoJi,type+1,type+1)) ~= 0 then
   x070053_NotifyTips(sceneId,selfId,"BÕn ðã Lînh thß·ng quá "..QianDaoNum.."")
   return
  end
  if LuaFnGetPropertyBagSpace(sceneId, selfId) <5 then
   x070053_NotifyTips(sceneId, selfId,"Tay näi c¥n 5 ô tr¯ng")	
   return
  end

  if LuaFnGetMaterialBagSpace(sceneId, selfId) <5 then
   x070053_NotifyTips(sceneId, selfId,"Tay näi c¥n 5 ô tr¯ngn")	
   return
  end

  SetMissionData(sceneId,selfId,MD_XIEZI_QIANDAO,GetMissionData(sceneId,selfId,MD_XIEZI_QIANDAO)+10^(5-type))
  ------------------------------------------------------------------
  --Lînh Ph¥n thß·ng 
  local itemlist = x070053_g_QianDaoGift[type]
  local cnt = getn(itemlist)
  for i = 1,cnt do
   for j = 1,x070053_g_QianDaoGift[type][i][2] do
     pos = TryRecieveItem(sceneId,selfId,x070053_g_QianDaoGift[type][i][1],1)
	if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
	  LuaFnItemBind(sceneId,selfId,pos)
	end
   end
  end
  ------------------------------------------------------------------
  x070053_NotifyTips(sceneId,selfId,"Lînh thß·ng thành công")
  x070053_QianDaoOpen(sceneId,selfId) --Mµt l¥n næa Ðä khai Ðánh d¤u Giao di®n 
  LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --Ð£c hi®u 
  return
end




function x070053_ReadTxt(sceneId,selfId) --Ðµc Bi¬u 

 local nMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
 local nYear = GetTodayYear()
 local nMonthDay = tonumber(GetTodayMonth()+1)
 local myGuid = LuaFnGetGUID(sceneId, selfId)
 local myQianDao =""
 local QianDaoDays = 0
 if floor(nYear/4) == 0 and nMonthDay == 2 then --Nåm nhu§n 2Tháng Phán ðoán .Con bò cÕp C¥n thiªt Nghiêm c¦n 
   nMonth[nMonthDay] = nMonth[nMonthDay] + 1
 end
 local handle = openfile("./Config/QianDao/QD"..tostring(myGuid)..".txt","r")
  if nil ~= handle then
		for i=1, nMonth[nMonthDay] do
			local line=read(handle,"*l")
			if line==nil then
				line=0
			end
			myQianDao = myQianDao..tonumber(line)
            if tonumber(line) == 1 then 
              QianDaoDays = QianDaoDays +1
            end
		end
	closefile(handle)
   else
    for j =1,nMonth[nMonthDay] do 
      string = string.."0".."\n"
      myQianDao = myQianDao.."0"
    end
    local handle = openfile("./Config/QianDao/QD"..tostring(myGuid)..".txt","wb")
    if nil ~= handle then
	 write(handle,tostring(string))
	 closefile(handle)
    end		
   end
   --x070053_NotifyTips(sceneId, selfId,"Hi®n tÕi Tháng Th¸"..nMonthDay.."Tháng ,B±n nguy®t Cùng s· hæu"..nMonth[nMonthDay].."Thiên ,Ðã m®t Kª Ðánh d¤u"..QianDaoDays.."Thiên")
  return nMonthDay,nMonth[nMonthDay],myQianDao  --M¤y tháng ,T±ng S¯ tr¶i ,Ðánh d¤u Tình hu¯ng 
end


function x070053_MonthCheck(sceneId, selfId) ---Tiên Ki¬m tra ðo lß¶ng Trß¾c m£t Tháng 
  local myGuid = LuaFnGetGUID(sceneId,selfId)
  if floor(GetMissionData(sceneId,selfId,MD_XIEZI_QIANDAO)/10^5) ~= tonumber(GetTodayMonth()+1) then
    SetMissionData(sceneId,selfId,MD_XIEZI_QIANDAO,tonumber(GetTodayMonth()+1)*10^5)
    local string =""
    for j =1,31 do 
      string=string.."0".."\n"
    end
    local handle = openfile("./Config/QianDao/QD"..tostring(myGuid)..".txt","wb")
    if nil ~= handle then
	 write(handle,tostring(string))
	 closefile(handle)
    end		
  end
end



--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x070053_NotifyTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end







