--  891002
--  cao quá công   phï trÕi truy«n t¯ng ngß¶i 

-- chân v¯n s¯ 
x891002_g_scriptId  =  891002

-- có sñ ki®n ID li®t bi¬u 
x891002_g_eventList={891000}

--8 c¤p bäo thÕch 
x891002_g_LootItem_1  =  {

}
--GM tài li®u 
x891002_g_LootItem_2  =  {

}
--GM cÞi ngña th¶i trang 
x891002_g_LootItem_3  =  {

}
-- hµi viên chÑng 
x891002_g_LootItem_4  =  {

}
-- cu¯i cùng tài li®u 
x891002_g_LootItem_5  =  {

}


x891002_g_KaiQuTime  =  11281      -- khai khu th¶i gian 

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x891002_UpdateEventList(  sceneId,  selfId,targetId  )

	 BeginEvent(sceneId)
	 --local  today  =  GetDayTime()	 	 	 	 	 	 -- trß¾c m£t th¶i gian 
	 --AddText(sceneId," bây gi¶ th¶i gian là "..today.." li­u ! ")

	 --AddText(sceneId,"    v¯n dùng/u¯ng ðµc chª sinh tØ môn PK trò ch½i , #Y tß·ng thß·ng cñc kÏ trß¾c , #W cø th¬ m¶i xem c£n k¨ công lßþc . phàm là · #cFF0000 khai khu ngày ðó #Y cu¯i cùng ðÕt ðßþc bäo hµp ngß¶i , #W · v¯n NPC ð±i bäo rß½ng lúc ðem ðÕt ðßþc #cFF0000 nguyên bäo 100 vÕn #Y cu¯i cùng tß·ng thß·ng ! ! ")
	 AddText(sceneId," #GQuy t¡c:#W Ðång ký hàng ngày và tham gia Kích Sát Boss . ")
	 AddText(sceneId," #GTh¶i gian báo danh:#W Hàng ngày t× #Y20:45 - 21:45.#r#G Th¶i gian ðoÕt bäo: #W Hàng ngày vào#Y 22:00 - 22:30. ")
	 AddText(sceneId," #cFF0000Ph¥n Thß·ng : #B Bäo thÕch ngçu nhiên ")
	 AddText(sceneId," #cFF0000Ph¥n Thß·ng : #B KNB ngçu nhiên ")
	 AddText(sceneId," #cFF0000Ph¥n Thß·ng : #B Th¶i trang ho£c Thú cßÞi ngçu nhiên ")
	 AddText(sceneId," #cFF0000Ph¥n Thß·ng : #B Nguyên li®u ð±i quà ")

	 --AddText(sceneId," #cFF0000Chú ý : #BNguyên li®u ð±i quà s¨ m¤t sau 1 gi¶ khi nh£t ðßþc, nªu không ð±i k¸p s¨ không có cách nào b°i thß¶ng ")


	 --AddNumText(  sceneId,  x891002_g_scriptId,  "#GNguyên li®u ð±i quà ð±i thß·ng ",1  ,1    )
	 --AddNumText(  sceneId,  x891002_g_scriptId,  "#RGM th¶i trang ho£c ng°i kÜ ð±i thành tài li®u ",1  ,100    )
	 --AddNumText(  sceneId,  x891002_g_scriptId,  "#RNhuµm ",1  ,200    )
	 --AddNumText(  sceneId,  x891002_g_scriptId,  "#G sinh tØ h²n chiªn tß¶ng tình ",11  ,2    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "#ef12345#Y Phø bän tÕm ðóng, m¶i các hÕ ði ch² khác"    )	 
	 for  i,  eventId  in  x891002_g_eventList  do
	 	 --CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x891002_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x891002_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x891002_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 if  GetNumText()  ==  100  then
	 BeginEvent(sceneId)
	 AddText(sceneId,"    #Y chú ý #W : #G ðem không ð±i ðích trang b¸ m£c vào , dß th×a ði¬m trang b¸ ð¬ túi ðeo lßng ði¬m kích ð±i ")
	 AddText(sceneId,"    #Y tinh thÕch #W : #G thång c¤p GM th¶i trang ho£c ng°i kÜ ði¬m chü yªu tài li®u ")
	 AddText(sceneId,"    #Y ð±i #W : #G1 món có th¬ ð±i 10 cá GM tinh thÕch ")


	 AddNumText(  sceneId,  x891002_g_scriptId,  "#R tØ d§t sß½ng nhung           ð±i GM tinh thÕch ",1  ,101    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "#R phi long ng°i vân           ð±i GM tinh thÕch ",1  ,102    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "#R li®t höa kim cß½ng           ð±i GM tinh thÕch ",1  ,103    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "#R kim vû                   ð±i GM tinh thÕch ",1  ,104    )

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
            end

	 if  GetNumText()  ==  200  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  selfId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    0910281)
	 end

	 if  GetNumText()  ==  101  then
	               	 local  nStoneId  =  10453547
	 	 c1  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId)
	 	 if  c1  >=1  then
	 	 	 	 BeginEvent(  sceneId  )  
	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10453547,1)-- thü tiêu v§t ph¦m 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 strText  =  "#G chúc m×ng ngß½i , ð±i thành công ! ngß½i l¤y ðßþc 10 cá ?GM tinh thÕch ?"
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 --message  =  format("#cff99cc#b chúc m×ng #G#{_INFOUSR%s}#cff99cc thành công ðem tØ d§t sß½ng nhung , mau mau m£c vào , ð¬ cho chúng ta nhìn mµt chút ! ! ! ! ",  GetName(sceneId,  selfId),  szTransferEquip);
	 	 	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)

	 	 	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
                                        else
                              	 BeginEvent(  sceneId  )  
	 	 	 	 	 strText  =  "#Y ngß½i không có tØ d§t sß½ng nhung ! ! "
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 AddText(  sceneId,  "#Y xin/m¶i xác ð¸nh ngß½i   tØ d§t sß½ng nhung   không có thêm khóa , cûng ð«u ðã ð£t · túi trong túi xách !"  )
	 	 	 	 EndEvent(  sceneId  )
                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 end
	 end
	 if  GetNumText()  ==  102  then
	               	 local  nStoneId  =  10453544
	 	 c1  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId)
	 	 if  c1  >=1  then
	 	 	 	 BeginEvent(  sceneId  )  
	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10453544,1)-- thü tiêu v§t ph¦m 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 strText  =  "#G chúc m×ng ngß½i , ð±i thành công ! ngß½i l¤y ðßþc 10 cá ?GM tinh thÕch ?"
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 --message  =  format("#cff99cc#b chúc m×ng #G#{_INFOUSR%s}#cff99cc th¶i trang nhuµm s¡c thành công , mau mau m£c vào , ð¬ cho chúng ta nhìn mµt chút ! ! ! ! ",  GetName(sceneId,  selfId),  szTransferEquip);
	 	 	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)

	 	 	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
                                        else
                              	 BeginEvent(  sceneId  )  
	 	 	 	 	 strText  =  "#Y ngß½i không có phi long ng°i vân ! ! "
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 AddText(  sceneId,  "#Y xin/m¶i xác ð¸nh ngß½i   phi long ng°i vân   không có thêm khóa , cûng ð«u ðã ð£t · túi trong túi xách !"  )
	 	 	 	 EndEvent(  sceneId  )
                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 end
	 end
	 if  GetNumText()  ==  103  then
	               	 local  nStoneId  =  10453538
	 	 c1  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId)
	 	 if  c1  >=1  then
	 	 	 	 BeginEvent(  sceneId  )  
	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10453538,1)-- thü tiêu v§t ph¦m 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 strText  =  "#G chúc m×ng ngß½i , ð±i thành công ! ngß½i l¤y ðßþc 10 cá ?GM tinh thÕch ?"
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 --message  =  format("#cff99cc#b chúc m×ng #G#{_INFOUSR%s}#cff99cc th¶i trang nhuµm s¡c thành công , mau mau m£c vào , ð¬ cho chúng ta nhìn mµt chút ! ! ! ! ",  GetName(sceneId,  selfId),  szTransferEquip);
	 	 	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)

	 	 	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
                                        else
                              	 BeginEvent(  sceneId  )  
	 	 	 	 	 strText  =  "#Y ngß½i không có li®t höa kim cß½ng ! ! "
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 AddText(  sceneId,  "#Y xin/m¶i xác ð¸nh ngß½i   li®t höa kim cß½ng   không có thêm khóa , cûng ð«u ðã ð£t · túi trong túi xách !"  )
	 	 	 	 EndEvent(  sceneId  )
                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 end
	 end
	 if  GetNumText()  ==  104  then
	               	 local  nStoneId  =  10453541
	 	 c1  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId)
	 	 if  c1  >=1  then
	 	 	 	 BeginEvent(  sceneId  )  
	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10453541,1)-- thü tiêu v§t ph¦m 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  30004019,  1)-- cho v§t ph¦m 	 	 	 	 
	 	 	 	 	 strText  =  "#G chúc m×ng ngß½i , ð±i thành công ! ngß½i l¤y ðßþc 10 cá ?GM tinh thÕch ?"
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 --message  =  format("#cff99cc#b chúc m×ng #G#{_INFOUSR%s}#cff99cc th¶i trang nhuµm s¡c thành công , mau mau m£c vào , ð¬ cho chúng ta nhìn mµt chút ! ! ! ! ",  GetName(sceneId,  selfId),  szTransferEquip);
	 	 	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)

	 	 	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
                                        else
                              	 BeginEvent(  sceneId  )  
	 	 	 	 	 strText  =  "#Y ngß½i không có vàng vû ! ! "
	 	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 	 	 AddText(  sceneId,  "#Y xin/m¶i xác ð¸nh ngß½i   kim vû   không có thêm khóa , cûng ð«u ðã ð£t · túi trong túi xách !"  )
	 	 	 	 EndEvent(  sceneId  )
                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 end
	 end

	 if  GetNumText()  ==  1    then
	 	 local  nStoneId  =  40004645
	 	 local  nStoneCount  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId)
	 	 if  nStoneCount  ==  0    then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,"#B sinh tØ ðoÕt bäo ");
	 	 	 	 AddText(sceneId,"    xin/m¶i ngài mang theo (GM) ðµc hµp t¾i ðây ð±i ~ ! ðµc hµp · sinh tØ ðoÕt bäo l¤y ðßþc ! ");
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)	 	 
	 	 	 return  0
	 	 end

                local  nQuarter  =  mod(GetQuarterTime(),100);
                if  nQuarter  <  87  or  nQuarter  >=  92    then	 	 -- bäo rß½ng ð±i th¶i gian 

                        BeginEvent(sceneId)
                                AddText(sceneId,"#B sinh tØ ðoÕt bäo ");
                                AddText(sceneId,"    bây gi¶ không phäi là ð±i (GM) ðµc hµp ðích th¶i gian , xin/m¶i · 21 : 45-23 : 00 tìm ta ð±i . ");
                        EndEvent(sceneId)
                        DispatchEventList(sceneId,selfId,targetId)
                        
                        return
                end

	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  200)  ~=  0  then
                            LuaFnDelAvailableItem(sceneId,  selfId,  40004645,  100)

	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  "        phi pháp l¤y ðßþc bäo hµp , ðã thü tiêu . ")
	 	 return
	 end

	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  16115)  ~=  0  then
                            LuaFnDelAvailableItem(sceneId,  selfId,  40004645,  100)
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  "        phi pháp l¤y ðßþc bäo hµp , ðã thü tiêu . ")
	 	 return
	 end

	 if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  5  then
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  " Không ðü 5 ô ðÕo cø ")
	 	 return
	 end

	 if  LuaFnGetMaterialBagSpace(  sceneId,  selfId  )  <  5  then
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  "    Không ðü 5 ô nguyên li®u. "  )
	 	 return
	 end

	               local  today  =  GetDayTime()	 	 	 	 	 	 -- trß¾c m£t th¶i gian 
	               if  today  ==  x891002_g_KaiQuTime  then
	 	 	 local  bag01  =  TryRecieveItem(  sceneId,  selfId,  39910005,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 	 local  bag02  =  TryRecieveItem(  sceneId,  selfId,  39910005,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 	 local  bag03  =  TryRecieveItem(  sceneId,  selfId,  39910005,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 	 local  bag04  =  TryRecieveItem(  sceneId,  selfId,  39910005,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 	 local  bag05  =  TryRecieveItem(  sceneId,  selfId,  39910005,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 

	 	 	 LuaFnItemBind(  sceneId,  selfId,  bag01  )
	 	 	 LuaFnItemBind(  sceneId,  selfId,  bag02  )
	 	 	 LuaFnItemBind(  sceneId,  selfId,  bag03  )
	 	 	 LuaFnItemBind(  sceneId,  selfId,  bag04  )
	 	 	 LuaFnItemBind(  sceneId,  selfId,  bag05  )
                                end

	 	 local  ret  =  LuaFnDelAvailableItem(sceneId,  selfId,  40004645,  1)
	 	 if  ret  >  0      then

	 local  nItemCount  =  2
	 local  nItemId_1
	 local  nItemId_2
	 local  nItemId_3
	 local  nItemId_4
	 local  nItemId_5
	 local  nItemId_6
	 local  nItemId_7
	 local  nItemId_8

	 nItemId_1  =  x891002_g_LootItem_1[random(  getn(x891002_g_LootItem_1)  )]
	 nItemId_2  =  x891002_g_LootItem_5[random(  getn(x891002_g_LootItem_5)  )]
	 nItemId_3  =  x891002_g_LootItem_5[random(  getn(x891002_g_LootItem_5)  )]
	 nItemId_4  =  x891002_g_LootItem_1[random(  getn(x891002_g_LootItem_1)  )]
	 nItemId_5  =  x891002_g_LootItem_5[random(  getn(x891002_g_LootItem_5)  )]


	 if  random(1000)  <=  500    then
	 	 nItemCount  =  3
	 	 nItemId_4  =  x891002_g_LootItem_2[random(  getn(x891002_g_LootItem_2))]
	 end

	 if  random(1000)  <=  1000    then
	 	 nItemCount  =  4
	               nItemId_5  =  x891002_g_LootItem_3[random(  getn(x891002_g_LootItem_3)  )]
	 end	 
	 if  random(1000)  <=  50    then
	 	 nItemCount  =  5
	               nItemId_6  =  x891002_g_LootItem_4[random(  getn(x891002_g_LootItem_4)  )]
	 end

	 	 ZengDian(sceneId,selfId,targetId,1,1000000)        ---  dang xem


	 if  nItemCount  ==  2    then
	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  nItemId_1,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos02  =  TryRecieveItem(  sceneId,  selfId,  nItemId_2,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos03  =  TryRecieveItem(  sceneId,  selfId,  nItemId_3,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos07  =  TryRecieveItem(  sceneId,  selfId,  nItemId_7,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos08  =  TryRecieveItem(  sceneId,  selfId,  nItemId_8,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 

	               local  itemInfo1  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
	               local  itemInfo2  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos02  )
	               local  itemInfo3  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos03  )
	               local  itemInfo7  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos07  )
	               local  itemInfo8  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos08  )

	 	 --  cßÞng chª trói ð¸nh 	 	 	 	 	 	 	 	 	 	 
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos01  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos02  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos03  )

	 	 --  h® th¯ng thông báo 	 	 	 	 	 	 	 	 	 	 
	 	 local  playername  =  GetName(sceneId,  selfId)
	 	 local  strText  =  format("#gffff00#{_INFOUSR%s} träi qua mình thiên tân vÕn kh± ðoÕt ðßþc ðích sinh tØ bäo rß½ng , lái/m· ra li­u #Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}#W cùng #e0e8de5#G#{_INFOMSG%s}#W?",  playername,  itemInfo1,  itemInfo2,  itemInfo3)	 	 	 	 	 	 	 	 	 	 
	 	 local  Text  =  format("#Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s} các mµt .",    itemInfo7,  itemInfo8)	 	 	 	 	 	 	 	 	 	 
	 	 BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	 BroadMsgByChatPipe(sceneId,  selfId,  Text,  4)
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  " chúc m×ng ngài ð±i bäo hµp thành công , ðÕt ðßþc ðÕi lßþng tß·ng thß·ng , hy v÷ng ngài l¥n sau tiªp tøc c¯ g¡ng . "  )

	 elseif  nItemCount  ==  3    then
	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  nItemId_1,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos02  =  TryRecieveItem(  sceneId,  selfId,  nItemId_2,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos03  =  TryRecieveItem(  sceneId,  selfId,  nItemId_3,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos04  =  TryRecieveItem(  sceneId,  selfId,  nItemId_4,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos07  =  TryRecieveItem(  sceneId,  selfId,  nItemId_7,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos08  =  TryRecieveItem(  sceneId,  selfId,  nItemId_8,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 

	               local  itemInfo1  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
	               local  itemInfo2  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos02  )
	               local  itemInfo3  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos03  )
	               local  itemInfo4  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos04  )
	               local  itemInfo7  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos07  )
	               local  itemInfo8  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos08  )

	 	 --  cßÞng chª trói ð¸nh 	 	 	 	 	 	 	 	 	 	 
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos01  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos02  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos03  )

	 	 --  h® th¯ng thông báo 	 	 	 	 	 	 	 	 	 	 
	 	 local  playername  =  GetName(sceneId,  selfId)
	 	 local  strText  =  format("#gffff00 ðao ðao th¤y máu , ng÷a tân thß¶ng ðäm , kh± tçn cam lai , sinh tØ môn trung #{_INFOUSR%s} ðÕi hi¬n th¥n uy , lñc áp qu¥n hùng r¯t cøc thu ðßþc ?GM ðµc hµp ? · NPC ch² m· ra lÕi ðÕt ðßþc #G#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}?",  playername,  itemInfo1,  itemInfo2,  itemInfo3)	 	 	 	 	 	 	 	 	 	 
	 	 local  Text  =  format("#Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s} cùng cao c¤p v§t ph¦m #e0e8de5#G#{_INFOMSG%s} các mµt .",    itemInfo7,  itemInfo8,  itemInfo4)	 	 	 	 	 	 	 	 	 	 
	 	 BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	 BroadMsgByChatPipe(sceneId,  selfId,  Text,  4)
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  " chúc m×ng ngài ð±i bäo hµp thành công , ðÕt ðßþc ðÕi lßþng tß·ng thß·ng , hy v÷ng ngài l¥n sau tiªp tøc c¯ g¡ng . "  )

	 elseif  nItemCount  ==  4    then
	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  nItemId_1,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos02  =  TryRecieveItem(  sceneId,  selfId,  nItemId_2,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos03  =  TryRecieveItem(  sceneId,  selfId,  nItemId_3,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos04  =  TryRecieveItem(  sceneId,  selfId,  nItemId_4,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos05  =  TryRecieveItem(  sceneId,  selfId,  nItemId_5,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos07  =  TryRecieveItem(  sceneId,  selfId,  nItemId_7,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos08  =  TryRecieveItem(  sceneId,  selfId,  nItemId_8,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 

	               local  itemInfo1  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
	               local  itemInfo2  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos02  )
	               local  itemInfo3  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos03  )
	               local  itemInfo4  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos04  )
	               local  itemInfo5  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos05  )
	               local  itemInfo7  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos07  )
	               local  itemInfo8  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos08  )

	 	 --  cßÞng chª trói ð¸nh 	 	 	 	 	 	 	 	 	 	 
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos01  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos02  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos03  )

	 	 --  h® th¯ng thông báo 	 	 	 	 	 	 	 	 	 	 
	 	 local  playername  =  GetName(sceneId,  selfId)
	 	 local  strText  =  format("#gffff00 b¥u tr¶i ông ông lên tiªng , ch¤n thanh không tuy®t , sinh tØ môn trúng kiªm quang sèn so©t , chï th¤y #{_INFOUSR%s} hô to mµt tiªng , phäi , · sinh tØ bäo trong rß½ng cút ra khöi li­u #Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}?",  playername,  itemInfo1,  itemInfo2,  itemInfo3)	 	 	 	 	 	 	 	 	 	 
	 	 local  Text  =  format("#Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s} các mµt cùng #{_INFOMSG%s} cùng làm ngß¶i ta hâm mµ #{_INFOMSG%s}.",    itemInfo7,  itemInfo8,  itemInfo4,  itemInfo5)	 	 	 	 	 	 	 	 	 	 
	 	 BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	 BroadMsgByChatPipe(sceneId,  selfId,  Text,  4)
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  " chúc m×ng ngài ð±i bäo hµp thành công , ðÕt ðßþc ðÕi lßþng tß·ng thß·ng , hy v÷ng ngài l¥n sau tiªp tøc c¯ g¡ng . "  )

	 elseif  nItemCount  ==  5    then
	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  nItemId_1,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos02  =  TryRecieveItem(  sceneId,  selfId,  nItemId_2,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos03  =  TryRecieveItem(  sceneId,  selfId,  nItemId_3,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos04  =  TryRecieveItem(  sceneId,  selfId,  nItemId_4,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos05  =  TryRecieveItem(  sceneId,  selfId,  nItemId_5,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos06  =  TryRecieveItem(  sceneId,  selfId,  nItemId_6,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos07  =  TryRecieveItem(  sceneId,  selfId,  nItemId_7,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 
	 	 local  bagpos08  =  TryRecieveItem(  sceneId,  selfId,  nItemId_8,  QUALITY_MUST_BE_CHANGE  )	 --  không bö ðßþc cûng chßa có 

	               local  itemInfo1  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
	               local  itemInfo2  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos02  )
	               local  itemInfo3  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos03  )
	               local  itemInfo4  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos04  )
	               local  itemInfo5  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos05  )
	               local  itemInfo6  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos06  )
	               local  itemInfo7  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos07  )
	               local  itemInfo8  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos08  )

	 	 --  cßÞng chª trói ð¸nh 	 	 	 	 	 	 	 	 	 	 
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos01  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos02  )
	 	 LuaFnItemBind(  sceneId,  selfId,  bagpos03  )

	 	 --  h® th¯ng thông báo 	 	 	 	 	 	 	 	 	 	 
	 	 local  playername  =  GetName(sceneId,  selfId)
	 	 local  strText  =  format("#gffff00#{_INFOUSR%s} sinh tØ môn ngß¶i trong ph¦m bµc phát , lÕi thu ðßþc #Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}#W . ",  playername,  itemInfo1,  itemInfo2,  itemInfo3)	 	 	 	 	 	 	 	 	 	 
	 	 local  Text  =  format("#Y#{_INFOMSG%s}#W?#e0e8de5#G#{_INFOMSG%s}?#e0e8de5#G#{_INFOMSG%s}?#e0e8de5#W#{_INFOMSG%s}}?#e0e8de5#Y#{_INFOMSG%s} , m÷i ngß¶i cùng nhau chúc m×ng h¡n ði .",    itemInfo7,  itemInfo8,  itemInfo4,  itemInfo5,  itemInfo6)	 	 	 	 	 	 	 	 	 	 
	 	 BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	 BroadMsgByChatPipe(sceneId,  selfId,  Text,  4)
	 	 x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  " chúc m×ng ngài ð±i bäo hµp thành công , ðÕt ðßþc ðÕi lßþng tß·ng thß·ng , hy v÷ng ngài l¥n sau tiªp tøc c¯ g¡ng . "  )

	 end
	 	 end

	 	 return
	 end

	 if  GetNumText()  ==  2    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(sceneId," ðoÕt bäo th¶i gian là #Y21 : 00-21 : 45 , #W tiªn vào th¶i gian là #Y20 : 45-21 : 45 , #cFF0000 vßþt qua th¶i gian ðem không ðßþc ði vào , #Y21 : 45#G ðoÕt bäo th¶i gian sau khi kªt thúc #W nhà ch½i ðem truy«n ra bän ð° ! ")
	 	 	 AddText(sceneId," ðoÕt bäo bän ð° #Y21 : 00#W s¨ ðúng lúc cà ra mµt cái quái v§t , giªt chªt sau s¨ · bän ð° #Y v¸ trí trung tâm #G cà ra mµt #cFF0000 mang sinh tØ bäo hµp ðích túi , #W hÕ thü mau ngß¶i #Y ðem ðÕt ðßþc này túi . ")
	 	 	 AddText(sceneId,"#Y21:00-21:45#W vì th¶i gian chiªn ð¤u , giªt chªt #G l¤y ðßþc bäo hµp #W ðích nhà ch½i , #cFF0000 bäo hµp s¨ r½i xu¯ng , #W · #Y bän ð° v¸ trí trung tâm s¨ #W l¥n næa cà m¾i ra mµt túi , #W hÕ thü mau ngß¶i #Y ðem ðÕt ðßþc này túi . ")
	 	 	 AddText(sceneId," sinh tØ bän ð° #Y không th¬ ð¸nh v¸ , #G không th¬ sØ døng truy«n t¯ng kÛ nång , #W ðÕt ðßþc bäo hµp #Y trên ðß¶ng hÕ tuyªn , #W l¥n næa sau khi lên nªt s¨ #cFF0000 thü tiêu bäo hµp , mà bäo hµp s¨ #Y l¥n næa cà ra , #W nhæng khác nhà ch½i có th¬ ðÕt ðßþc , #G trên ðß¶ng không mu¯n chiªn ð¤u #W có th¬ #Y truy«n t¯ng ðªn LÕc Dß½ng ! ")
	 	 	 AddNumText(  sceneId,  x889063_g_scriptId,  " hüy bö ",  5,  4)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if  GetNumText()  ==  4  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  1000  )
	 	 return
	 end

	 for  i,  findId  in  x891002_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x891002_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x891002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x891002_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x891002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x891002_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x891002_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x891002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x891002_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x891002_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x891002_OnDie(  sceneId,  selfId,  killerId  )
end

--**********************************
--  ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x891002_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end