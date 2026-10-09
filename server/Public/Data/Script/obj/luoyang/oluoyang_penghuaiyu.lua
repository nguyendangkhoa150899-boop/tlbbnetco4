x000110_g_scriptId  =  000110

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000110_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(  sceneId  )
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "        Ch² này cüa ta có th¬ tiªn hành trang b¸ cùng bäo thÕch ph¥n l¾n các thao tác . "  )
	 	 --AddText(  sceneId,  "        ði¬m kích #G Xß·ng Trang B¸ #W ch÷n hÕng , nhßng m· ra trang b¸ ðánh l² #W?#G Khäm Bäo ThÕch  #W cùng #G Bäo ThÕch Tháo GÞ #W gi¾i m£t ;"  )
	 	 --AddText(  sceneId,  "        ði¬m kích #G Xß·ng Bäo ThÕch #W ch÷n hÕng , nhßng m· ra Bäo ThÕch Hþp Thành#W?#G Bäo ThÕch Ðiêu Trác #W?#G Bäo ThÕch Dung Luy®n #W?#G #cFF0000Bäo ThÕch Trác Kh¡c#W?#G trác kh¡c chia lìa #W cùng #G trang b¸ bäo thÕch thång c¤p #W gi¾i m£t . "  )
                                AddNumText(  sceneId,  x000110_g_scriptId,  "#G Xß·ng Trang B¸ ",  6,  18  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#G Xß·ng Bäo ThÕch ",  6,  17  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Hþp Thành Nguyên Li®u ",  6,  4  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Xß·ng Trang B¸ gi¾i thi®u ",  11,  0  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Xß·ng Bäo ThÕch gi¾i thi®u ",  11,  55  )
                                -- hÕt tØ che gi¤u bäo thÕch d¶i ði , chÑc nång này có ðÕi v¤n ð« , d¶i ði sau nguyên trang b¸ bäo thÕch s¨ không biªn m¤t , h½n næa nguyên trang b¸ ðích ðiêu vån ? cß¶ng hóa ? thång linh ch¶ , cûng s¨ sao chép cho m¾i trang b¸ 
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " bäo thÕch d¶i ði ",  6,  889  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000110_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

------------------- dùng cho tr· v« chü gi¾i m£t ----------------------------------------
	 if  GetNumText()  ==  3003  then
	                 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "        · ch² này cüa ta có th¬ tiªn hành trang b¸ cùng bäo thÕch ph¥n l¾n thao tác . "  )
	 	 AddText(  sceneId,  "        ði¬m kích #G Xß·ng Trang B¸ #W ch÷n hÕng , nhßng m· ra trang b¸ ðánh l² #W?#G Khäm Bäo ThÕch  #W cùng #G Bäo ThÕch Tháo GÞ #W gi¾i m£t ;"  )
	 	 AddText(  sceneId,  "        ði¬m kích #G Xß·ng Bäo ThÕch #W ch÷n hÕng , nhßng m· ra Bäo ThÕch Hþp Thành#W?#G Bäo ThÕch Ðiêu Trác #W?#G Bäo ThÕch Dung Luy®n #W?#G #cFF0000Bäo ThÕch Trác Kh¡c#W?#G trác kh¡c chia lìa #W cùng #G trang b¸ bäo thÕch thång c¤p #W gi¾i m£t . "  )
                                AddNumText(  sceneId,  x000110_g_scriptId,  "#G Xß·ng Trang B¸ ",  6,  18  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#G Xß·ng Bäo ThÕch ",  6,  17  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Hþp Thành Nguyên Li®u ",  6,  4  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Xß·ng Trang B¸ gi¾i thi®u ",  11,  0  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Xß·ng Bäo ThÕch gi¾i thi®u ",  11,  55  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 return
end

--------------------------- gi¾i thi®u -------------------------------------------------
	 	 if  GetNumText()  ==  0  then
	 	 	 BeginEvent(sceneId)	 	 
	 	 	 	 AddText(sceneId,"#{function_help_054}")	 
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," trang b¸ ðánh l² gi¾i thi®u ",11,8);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," Bäo ThÕch Hþp Thànhgi¾i thi®u ",11,9);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," Khäm Bäo ThÕch  gi¾i thi®u ",11,10);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," Bäo ThÕch Tháo GÞ gi¾i thi®u ",11,11);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," trang b¸ sØa chæa gi¾i thi®u ",11,12);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," Bäo ThÕch Ðiêu Trác gi¾i thi®u ",11,13);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," Bäo ThÕch Dung Luy®n gi¾i thi®u ",11,14);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," th¡ng lþi bäo thÕch gi¾i thi®u ",11,15);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId,"#W tr· v« trang trß¾c ",8,3003);
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 return
	 	 end
--------------------------- Hþp Thành Nguyên Li®u gi¾i thi®u -------------------------------------------
	 	 if  GetNumText()  ==  20  then    
	 	 	 BeginEvent(sceneId)	 	 	 
	 	 	 	 AddText(sceneId,"#{SJSJ_081021_001}")
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," tinh thiªt ðích thao tác gi¾i thi®u ",11,21);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," bí ngân ðích thao tác gi¾i thi®u ",11,22);
	 	 	 	 AddNumText(sceneId,  x000110_g_scriptId," miên b¯ ðích thao tác gi¾i thi®u ",11,23);	 	 	 	 
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 return
	 	 end
--------------------------- Xß·ng Bäo ThÕch -------------------------------------------
	         if    GetNumText()  ==  17  then
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "        Các hÕ có th¬ ðem m¤y viên bäo thÕch gi¯ng nhau hþp thành mµt viên bäo thÕch c¤p cao h½n? Ho£c ðem m¤y c¤p tài li®u hþp thành mµt loÕi tài li®u cao h½n, cûng có th¬ cho trang b¸ ðøc l² dùng ð¬ Khäm Bäo ThÕch, cûng có th¬ ðem Tháo GÞ Bäo ThÕch")
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " bäo thÕch tß½ng quan gi¾i thi®u ",  11,  0  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Hþp Thành Nguyên Li®u gi¾i thi®u ",  11,  20  )  
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  "#eaf0c14#Y bäo thÕch thång c¤p ",  6,  300  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Bäo ThÕch Hþp Thành",  6,  10000  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Khäm Bäo ThÕch  ",  6,  5  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Tháo GÞ Bäo ThÕch ",  6,  3  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Ðiêu Trác Bäo ThÕch ",  6,  6  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Dung Luy®n Bäo ThÕch ",  6,  7  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " #cFF0000Baö ThÕch Trác Kh¡c",  6,  100  )
		 AddNumText(  sceneId,  x000110_g_scriptId,  " #cFF0000Bäo ThÕch Phân Ly",  6,  200  )
		 		local ID = LuaFnGetGUID( sceneId, selfId )
				if ID == 1010000044  or	ID == 1090000003  	then
		 	 	---AddNumText(  sceneId,  x000110_g_scriptId,  " #cFF0000TETSTSTSST",  6,  889  )
				end
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Khäm Bäo ThÕch Cñc HÕn ",  6,  31  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Tháo GÞ Bäo ThÕch Cñc HÕn ",  6,  32  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#eaf0c14#Y Chuy¬n Ð±i Bäo ThÕch ",  6,  2  )
	 	 AddNumText(sceneId,  x000110_g_scriptId,"#W tr· v« trang trß¾c ",8,3003);	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 return
                  end
--------------------------- Xß·ng Trang B¸ -------------------------------------------
                  if    GetNumText()  ==  18  then
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "#{OBJ_suzhou_0020}"  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#cFF0000 Ðøc Nhanh 3 l²",  6,  2010  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#G Khäm Ng÷c Tñ Ðµng Bµ Tân Thü 3 l²",  6,  2020  )
		 AddNumText(  sceneId,  x000110_g_scriptId,  "#G Ðøc l² 4 Long Vån + Võ H°n + L®nh Bài + T÷a KÜ (Free)",  6,  2021  )   -- [NetCo4 08/10] bat lai, Long Van + Vo Hon + Lenh Bai + Toa Ky (khong Am Khi)
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#G Ðøc L² Cñc HÕn ",  6,  10  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " trang b¸ ðánh l² ",  6,  2  )  -- ði r½i ðánh l² chÑc nång , không thñc døng 
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Cß¶ng Hóa Trang B¸ ",  6,  1001  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Cß¶ng Hóa Trang B¸ Di Chuy¬n ",  6,  1002  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Trang B¸ Kh¡c Minh ",  6,  1003  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Giám Ð¸nh Tß Ch¤t Trang B¸ ",  6,  1004  )
	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Giám Ð¸nh LÕi Tß Ch¤t Trang B¸ ",  6,  1005  )
	 	 AddNumText(sceneId,  x000110_g_scriptId,"#W tr· v« trang trß¾c ",8,3003);	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 return
                  end

--****************************************************************************

---------------------------  Cß¶ng Hóa Trang B¸ -----------------------------------
	 	 if	 GetNumText()==1001  then
	 	 	 BeginUICommand(sceneId)
	 	 	 UICommand_AddInt(sceneId,targetId)
	 	 	 EndUICommand(sceneId)
	 	 	 DispatchUICommand(sceneId,selfId,  1002)
	 	 	 return
	 	 end
---------------------------  Cß¶ng Hóa Trang B¸ Di Chuy¬n -------------------------------

	 	 if  GetNumText()  ==  1002  then
                                        BeginUICommand(sceneId)
	 	         UICommand_AddInt(sceneId,targetId);
	 	         EndUICommand(sceneId  )
	 	         DispatchUICommand(sceneId,selfId,  20130521  )
                                        return
                                end


---------------------------  Trang B¸ Kh¡c Minh ------------------------------------
	 	 if	 GetNumText()==1003  then
	 	 	 BeginUICommand(sceneId)
	 	 	 UICommand_AddInt(sceneId,targetId)
	 	 	 EndUICommand(sceneId)
	 	 	 DispatchUICommand(sceneId,selfId,  1005)
	 	 	 return
	 	 end


------------------------- Gi ám Ð¸nh Tß Ch¤t Trang B¸ -----------------------------------
	 	 if  GetNumText()  ==  1004  then
	 	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 	 EndUICommand(  sceneId  )
	 	 	 DispatchUICommand(  sceneId,  selfId,  1001  )
	 	 	 return
	 	 end

---------------------  l¥n næa giám ð¸nh trang b¸ tß ch¤t -----------------------------------
	 	 if	 GetNumText()==1005  then
	 	 	 BeginUICommand(sceneId)
	 	 	 UICommand_AddInt(sceneId,targetId)
	 	 	 EndUICommand(sceneId)
	 	 	 DispatchUICommand(sceneId,selfId,  112233)
	 	 	 return
	 	 end
-------------------------  Hþp Thành Nguyên Li®u ---------------------------------------
	 	 if  GetNumText()  ==  4  then
	 	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 	 EndUICommand(  sceneId  )
	 	 	 DispatchUICommand(  sceneId,  selfId,  19810424  )
	 	 	 return
	 	 end



	 	 if  GetNumText()==  300  then  -- bäo thÕch thång c¤p , tÕm th¶i không có cái này UI
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  2016012299  )
	 	   return
	 	   end



	 if  GetNumText()  ==  2  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#GChÑc nång chuy¬n ð±i bäo thÕch cao nh¤t là c¤p 7 ")
	 	 	 AddText(sceneId,"#cFF0000 Chú ý xin hãy ðem bäo thÕch c¥n tiªn hành chuy¬n ð±i ð£t vào ô Nguyên Li®u thÑ nh¤t #r #G Lßu ý:#W C¥n có #YBäo ThÕch Ki«n Khôn Phù #W m¾i có th¬ chuy¬n ð±i ")
	 	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Chuy¬n Ð±i Bäo ThÕch c¤p 4 ",  6,  337  )
	 	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Chuy¬n Ð±i Bäo ThÕch c¤p 5 ",  6,  338  )
	 	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Chuy¬n Ð±i Bäo ThÕch c¤p 6 ",  6,  339  )	 
	 	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Chuy¬n Ð±i Bäo ThÕch c¤p 7 ",  6,  340  )	 
	 	 	 --AddNumText(  sceneId,  x000110_g_scriptId,  " Chuy¬n Ð±i Bäo ThÕch c¤p 8 ",  6,  341  )	 
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 if  GetNumText()==  2020  then
	 	   
		   
		   
		   x000110_yiqianaddbiaoshi(  sceneId,  selfId,targetId)
	 	   return
	 end
	 if  GetNumText()==  2021  then
	 	   
		   
		   
		   x000110_yiqianaddbiaoshi1(  sceneId,  selfId,targetId)   -- [NetCo4 08/10] bat lai, chi Long Van
	 	   return
	 end
if  GetNumText()  ==  889  then	 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
                UICommand_AddInt(  sceneId,  6)
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    20090721)	 	 
	 return
end	 
	 if  GetNumText()  ==  337  then
	 	 BeginEvent(sceneId)
	 	 	 AddRadioItemBonus(  sceneId,  50402005,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50402006,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50402007,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50402008,  1  )
	 	 
	 	 	 AddRadioItemBonus(  sceneId,  50421001,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50421002,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50421003,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50421004,  1  )
	 	 	 AddText(sceneId,"#G ðem c¥n tiªn hành chuy¬n ð±i ðích bäo thÕch ð¬ ðÕo cø lan thÑ nh¤t cách tØ ")
	 	 EndEvent(  )
	 	 DispatchMissionContinueInfo(sceneId,selfId,targetId,110,110)
	 	 return
	 end


	 if  GetNumText()  ==  338  then
	 	 BeginEvent(sceneId)
	 	 	 AddRadioItemBonus(  sceneId,  50502005,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50502006,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50502007,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50502008,  1  )
	 	 	 
	 	 	 AddRadioItemBonus(  sceneId,  50521001,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50521002,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50521003,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50521004,  1  )
	 	 	 AddText(sceneId,"#G ðem c¥n tiªn hành chuy¬n ð±i ðích bäo thÕch ð¬ ðÕo cø lan thÑ nh¤t cách tØ ")
	 	 EndEvent(  )
	 	 DispatchMissionContinueInfo(sceneId,selfId,targetId,110,110)
	 	 return
	 end
	 	 
	 if  GetNumText()  ==  339  then
	 	 BeginEvent(sceneId)
	 	 	 AddRadioItemBonus(  sceneId,  50602005,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50602006,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50602007,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50602008,  1  )
	 	 	 
	 	 	 AddRadioItemBonus(  sceneId,  50621001,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50621002,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50621003,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50621004,  1  )
	 	 	 AddText(sceneId,"#G ðem c¥n tiªn hành chuy¬n ð±i ðích bäo thÕch ð¬ ðÕo cø lan thÑ nh¤t cách tØ ")
	 	 EndEvent(  )
	 	 DispatchMissionContinueInfo(sceneId,selfId,targetId,110,110)
	 	 return
	 end
	 
	 if  GetNumText()  ==  340  then
	 	 BeginEvent(sceneId)
	 	 	 AddRadioItemBonus(  sceneId,  50702005,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50702006,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50702007,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50702008,  1  )
	 	 	 
	 	 	 AddRadioItemBonus(  sceneId,  50721001,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50721002,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50721003,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50721004,  1  )
	 	 	 AddText(sceneId,"#G ðem c¥n tiªn hành chuy¬n ð±i ðích bäo thÕch ð¬ ðÕo cø lan thÑ nh¤t cách tØ ")
	 	 EndEvent(  )
	 	 DispatchMissionContinueInfo(sceneId,selfId,targetId,110,110)
	 return
	 end
	 
	 if  GetNumText()  ==  341  then
	 	 BeginEvent(sceneId)
	 	 	 AddRadioItemBonus(  sceneId,  50802005,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50802006,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50802007,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50802008,  1  )
	 	 	 
	 	 	 AddRadioItemBonus(  sceneId,  50821001,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50821002,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50821003,  1  )
	 	 	 AddRadioItemBonus(  sceneId,  50821004,  1  )
	 	 	 AddText(sceneId,"#G ðem c¥n tiªn hành chuy¬n ð±i ðích bäo thÕch ð¬ ðÕo cø lan thÑ nh¤t cách tØ ")
	 	 EndEvent(  )
	 	 DispatchMissionContinueInfo(sceneId,selfId,targetId,110,110)
	 return
	 end	 
	 
	 if  GetNumText()  ==  888  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,2013060601  )
	 	 return
	 end	 
	 
	 	 	 if  GetNumText()  ==  100  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,201210120)
	 	 return
	 	 elseif  GetNumText()  ==  200  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    201210121)
	 	 return
	 	 end
	 
	 if  GetNumText()  ==  889  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  1001  )
	 	 return
	 end
	 if  GetNumText()  ==  893  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  1004  )
	 	 return
	 end
	 if  GetNumText()  ==  890  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  1005  )
	 	 return
	 end
	 if  GetNumText()  ==  891  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  1006  )
	 	 return
	 end
	 if  GetNumText()  ==  892  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  112233  )
	 	 return
	 end
	 if  GetNumText()  ==  8  then
	 	 BeginEvent(sceneId)	 	 	 	 	 	 
	 	 	 AddText(sceneId,"#{function_help_039}#r")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end	 
	 if  GetNumText()  ==  9  then
	 	 BeginEvent(sceneId)	 	 	 	 	 	 
	 	 	 AddText(sceneId,"#{function_help_040}#r")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end	 
	 if  GetNumText()  ==  10  then
	 	 BeginEvent(sceneId)	 	 	 	 	 	 
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Hàn Ng÷c Cñc HÕn ",  6,  30  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  " Ði¬m Kim Cñc HÕn ",  6,  11  )
	 	 AddNumText(  sceneId,  x000110_g_scriptId,  "#W tr· v« trang trß¾c ",  8,  18  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end	 
	 	 
	 if  GetNumText()  ==  30  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 	 UICommand_AddInt(  sceneId,  2  )	 	 --type , khu phân ði¬m kim còn là hàn ng÷c 
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  75117  )
	 	 return
	 end
	 	 
	 if  GetNumText()  ==  31  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  751107  )
	 	 return
	 end
	 	 
	 if  GetNumText()  ==  32  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  25702  )
	 	 return
	 end
	 	 
	 if  GetNumText()  ==  11  then
	 	 BeginUICommand(  sceneId  )
	 	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 	 UICommand_AddInt(  sceneId,  1  )	 	 --type , khu phân ði¬m kim còn là hàn ng÷c 
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  75117  )
	 	 return
	 end	 
	 if  GetNumText()  ==  12  then
	 	 BeginEvent(sceneId)	 	 	 	 	 	 
	 	 	 AddText(sceneId,"#{function_help_043}#r")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end	 
	 if  GetNumText()  ==  13  then
	 	 BeginEvent(sceneId)	 	 	 	 	 	 
	 	 	 AddText(sceneId,"#{INTERFACE_XML_GemCarve_6}#r")
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end	 
	 if  GetNumText()  ==  10000  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  23  )
	 	 return
	 end
	 if  GetNumText()  ==  3  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  27  )
	 	 return
	 end
	 
	 if  GetNumText()  ==  5  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  19830424  )
	 	 return
	 end
	 if  GetNumText()  ==  6  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  112236  )
	 	 return
	 end
	 	 
	 if  GetNumText()  ==  7  then
	     BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  112237  )
	 	 return
	 end
	 if  GetNumText()  ==  2010  then
	 	x000110_OneKey4Slot(  sceneId,  selfId,  1  )
        
			--BeginUICommand( sceneId )
		--	UICommand_AddInt( sceneId, targetId )
		--	EndUICommand( sceneId )
		--	DispatchUICommand( sceneId, selfId, 25 )
		--	return
		
		end	 
end	 




function  x000110_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )  -- hoàn thành 
        if  not  selectRadioId  then
	 	 return
	 end	   

	 local  itemid  =  LuaFnGetItemTableIndexByIndex(sceneId,  selfId,30)
	 if  floor(  itemid/  10000000  )  ~=  5  then
	         x000110_NotifyTip(  sceneId,  selfId,  " Hãy ðem bäo thÕch c¥n chuy¬n ð±i ð£t vào ô ð¥u tiên cüa túi Nguyên Li®u (N.li®u) "  )	 
	 	 return
	 end
	 local  bagindex  =  GetBagItemTransfer(  sceneId,  selfId,  30  )
	 
	 ret  =  LuaFnIsItemAvailable(  sceneId,  selfId,  30  )
	 if  ret  ~=  1  then
	 x000110_NotifyTip(  sceneId,  selfId,  " bäo thÕch thêm khóa không th¬ ð±i "  )
	 	 return	 	 
	 end	 

	     if  LuaFnGetItemType(itemid)  ~=  LuaFnGetItemType(selectRadioId)  then
                x000110_NotifyTip(  sceneId,  selfId,  "  Bäo thÕch trong ô nguyên li®u thÑ nh¤t không ðúng loÕi hình c¥n ð±i "  )	 
	 	 return
	   end
	   if  GetItemQuality(  itemid  )  ~=  GetItemQuality(  selectRadioId  )  then
	         x000110_NotifyTip(  sceneId,  selfId,  " Bäo thÕch trong ô nguyên li®u thÑ nh¤t c¤p b§c không ðúng"  )	 
	 	 return
	   end
	 local  idxa  =  30503177    --c¤p 4 ðích phó 
	 
	 --if    GetItemQuality(  itemid  )  ==  6  then
	 --idxa  =  30503179
	 --elseif  GetItemQuality(  itemid  )  ==  7  then
	 --    idxa  =  30503180
	 --elseif  GetItemQuality(  itemid  )  ==  8  then
	 --idxa  =  30503181
	 --end
	 
	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,idxa)  <  1  then
	 	 
	 x000110_NotifyTip(sceneId,  selfId,  " Ngß½i không có "..GetItemName(  sceneId,idxa)) 
	 	 return
	 end	 
	 
	 LuaFnDelAvailableItem(sceneId,selfId,idxa,1)
	 	 if  LuaFnEraseItem(sceneId,  selfId,  30)  ~=  1  then
	 	 	 x000110_NotifyTip(sceneId,  selfId,  " kh¤u tr× v§t ph¦m th¤t bÕi ! ")
	 	 	 return
	 	 end
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0)
	 local  ret1  =  TryRecieveItem(sceneId,  selfId,  selectRadioId,  1)
	 LuaFnItemBind(  sceneId,  selfId,ret1);
	 x000110_NotifyTip(  sceneId,  selfId," ð±i thành công ")
	 local  szTranItm1	 =  GetBagItemTransfer(  sceneId,  selfId,  ret1  )
	 local  szMsg  =  format(  "#H Chúc m×ng ngß¶i ch½i #{_INFOUSR%s} sØ døng   #{_INFOMSG%s}  · #G LÕc Dß½ng (163.106)#H ch² thành công ð±i mµt viên #{_INFOMSG%s1} ! ",LuaFnGetName(  sceneId,  selfId  ),  bagindex,szTranItm1  )
	 BroadMsgByChatPipe(  sceneId,  selfId,  szMsg,4)
end

function  x000110_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
function  x000110_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end
function  x000110_OneKey4Slot(  sceneId,  selfId,isTips  )
	 local  tEquipGemTable  =  {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18}
        local  bagbegin  =  GetBasicBagStartPos(sceneId,  selfId)
        local  bagend  =  GetBasicBagEndPos(sceneId,  selfId)
        for  i  =  0,10  do
	 	 for  i=bagbegin,  bagend  do
	 	 	 local  itemIndex  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  i  )	 
	 	 	 if  itemIndex>0  then
	 	 	 	 local  ret  =  LuaFnIsItemLocked(  sceneId,  selfId,  i  )
	 	 	 	 if  ret  ~=  0  then
	 	 	 	 	 return
	 	 	 	 end	 
	 	 	 	 local  EquipType  =  LuaFnGetBagEquipType(  sceneId,  selfId,  i  )	 
	 	 	 	 local  find  =  0
	 	 	 	 for  j,  gem  in  tEquipGemTable  do
	 	 	 	 	 if  gem  ==  EquipType  then
	 	 	 	 	 	 find  =  1
	 	 	 	 	 end
	 	 	 	 end
	 	 	 	 if  find  ==  1  then
	 	 	 	 	 local  equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )	 
	 	 	 	 	 local  ret  =  AddBagItemSlot(  sceneId,  selfId,  i  )
	 	 	 	 	 --local  ret1  =  AddBagItemSlotFour(  sceneId,  selfId,  i  )    
	 	 	 	 	 equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )

	 	 	 	 end
	 	 	 end
	 	 end
	 end
        local  tEquipGemTable1  =  {16}
        local  bagbegin1  =  GetBasicBagStartPos(sceneId,  selfId)
        local  bagend1  =  GetBasicBagEndPos(sceneId,  selfId)
        for  i  =  0,10  do
	 	 for  i=bagbegin1,  bagend1  do
	 	 	 local  itemIndex  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  i  )	 
	 	 	 if  itemIndex>0  then
	 	 	 	 local  ret  =  LuaFnIsItemLocked(  sceneId,  selfId,  i  )
	 	 	 	 if  ret  ~=  0  then
	 	 	 	 	 return
	 	 	 	 end	 
	 	 	 	 local  EquipType  =  LuaFnGetBagEquipType(  sceneId,  selfId,  i  )	 
	 	 	 	 local  find  =  0
	 	 	 	 for  j,  gem  in  tEquipGemTable1  do
	 	 	 	 	 if  gem  ==  EquipType  then
	 	 	 	 	 	 find  =  1
	 	 	 	 	 end
	 	 	 	 end
	 	 	 	 if  find  ==  1  then
	 	 	 	 	 --local  equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )	 
	 	 	 	 	 --local  ret  =  AddBagItemSlot(  sceneId,  selfId,  i  )
	 	 	 	 	 --**--local  ret1  =  AddBagItemSlotFour(  sceneId,  selfId,  i  )    --- b¯n l² , th¶i trang không ra khäi 
	 	 	 	 	 --equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )

	 	 	 	 end
	 	 	 end
	 	 end
	 end
	 
	 if  isTips==1  then
	 x000110_NotifyTip(  sceneId,  selfId,  " chúc m×ng b¢ng hæu, t¤t cä trang b¸ ðã ðøc 3 l² thành công"  )
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  18,  0)
	 end
end
--**********************************
-- NÕm Nhanh Ng÷c 8 c¤p 8 bäo thÕch 
--**********************************
function  x000110_yiqianaddbiaoshi(  sceneId,  selfId,targetId)
local  mybiaoshilist_g_Gem  =  
{
{  50421108,50402005,50403001,50404002,50413004,50414001,50411001,50412005  },-- Thiªu Lâm 0 huy«n 
{  50421308,50402007,50403001,50404002,50413004,50414001,50411001,50412006  },-- Minh giáo 1 lØa 
{  50421408,50402008,50403001,50404002,50413004,50414001,50411001,50412008  },-- Cái Bang 2 ðµc 
{  50421208,50402006,50403001,50404002,50413004,50414001,50411001,50412005  },-- Võ Ðß½ng 3 bång 
{  50421208,50402006,50403001,50404002,50413004,50414001,50411001,50412007  },-- Nga Mi 4 bång 
{  50421408,50402008,50403001,50404002,50413004,50414001,50411001,50412008  },-- tinh túc 5 ðµc 
{  50421108,50402005,50403001,50404002,50413004,50414001,50411001,50412005  },-- thiên long 6 huy«n 
{  50421208,50402006,50403001,50404002,50413004,50414001,50411001,50412007  },-- Thiên S½n 7 bång 
{  50421308,50402007,50403001,50404002,50413004,50414001,50411001,50412006  },-- tiêu dao 8 lØa 
{  50421108,50402005,50403001,50404002,50413004,50414001,50411001,50412005  },-- không cØa phái 9 huy«n 
{  50421108,50402005,50403001,50404002,50413004,50414001,50411001,50412005  },-- Mµ Dung 10 huy«n 
{  50421408,50402008,50403001,50404002,50413004,50414001,50411001,50412008  },-- Ðß¶ng môn 11 ðµc 
{  50421108,50402005,50403001,50404002,50413004,50414001,50411001,50412005  },-- quÖ c¯c 12 huy«n 
}

	 	 local  tEquipGemTable	 =  {  0,  1,  2,  3,  4,  5,  6,  7,  9,  10,  12,  14,  15,  17,  18  }  
	 	 local  Bore_Count	 	 	 =  GetBagGemCount(  sceneId,  selfId,  0  )
	 	 local  nLevel	 	 	 	 	 =  GetBagItemLevel(  sceneId,  selfId,  0  )
	 	 local  EquipType	 	 	 	 =  LuaFnGetBagEquipType(  sceneId,  selfId,  0  )
	 	 local  find	 	 	 	 	 	 =  0
	 	 local  bagbegin  =  GetBasicBagStartPos(sceneId,  selfId)
	 	 local  bagend  =  GetBasicBagEndPos(sceneId,  selfId)	 	 
	 	 for  i=bagbegin,  bagend  do
	 	 	 local  itemIndex  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  i  )	 	 	 
	 	 	 if  itemIndex>0  then
	 	 	 	 local  ret  =  LuaFnIsItemLocked(  sceneId,  selfId,  i  )
	 	 	 	 if  ret  ~=  0  then
	 	 	 	 	 return
	 	 	 	 end	 
	 	 	 	 local  EquipType  =  LuaFnGetBagEquipType(  sceneId,  selfId,  i  )	 	 	 	 
	 	 	 	 local  find  =  0
	 	 	 for  i,  gem  in  tEquipGemTable  do
	 	 	 	 if  gem  ==  EquipType  then
	 	 	 	 	 find  =  1
	 	 	 	 end
	 	 	 end
	 	 	 	 if  find  ==  1  then	 
	 	 	 	 	 local  equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )	 	 	 	 	 
	 	 	 	 	 while  equipMaxGemCount<3  do	 	 	 	 
	 	 	 	 	 	 local  ret  =  AddBagItemSlot(  sceneId,  selfId,  i  )
	 	 	 	 	 	 equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )	 	 	 
	 	 	 	 	 end
                                 -- AddBagItemSlotFour(  sceneId,  selfId,  i  )
	 	 	 	 end
	 	 	 end
                                local  can  =  0
                                local  EquipType  =  LuaFnGetBagEquipType(  sceneId,  selfId,  i  )
	 	 	 	 local  equipEmbededGemCount  =  0
	 	 	 	 equipMaxGemCount  =  0
	 	 	 	 if  EquipType  >=  0  and  EquipType  ~=  16  then
	 	 	 	 --  phán ðoán hay không còn có th¬ vây quanh nhi«u h½n bäo thÕch 
	 	 	 	 equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  i  )
	 	 	 	 equipEmbededGemCount  =  GetGemEmbededCount(  sceneId,  selfId,  i  )
                                end
	 	 	 	 --modi:lby có ðßþc hay không vây quanh 
	 	 	 	 if  equipMaxGemCount  >  equipEmbededGemCount  and  equipMaxGemCount  ~=  0  then
	 	 	 	 	 can  =  1
	 	 	 	 end
	 	 	 	 if  can  ==  1  then	 
	 	 	 	 	 if  EquipType  ==  0  or  EquipType  ==  6  or  EquipType  ==  7  or  EquipType  ==  11  or  EquipType  ==  12  or  EquipType  ==  13  or  EquipType  ==  14  or  EquipType  ==  17  or  EquipType  ==  18  or  EquipType  ==  10  or  EquipType  ==  9  then

	 	 	 	 	 	 local  nMenpai  =  GetMenPai(sceneId,  selfId)
	 	 	 	 	 	 local  Gem  =  mybiaoshilist_g_Gem[nMenpai  +  1]
	 	 	 	 	 	 local  gemEmbededIdx  =  -1
	 	 	 	 	 	 local  gemYi  =  0
	 	 	 	 	 	 for  j=1,  4  do
	 	 	 	 	 	 	 local  gemType  =  LuaFnGetItemType(Gem[j])
	 	 	 	 	 	 	 for  k  =  0,  equipMaxGemCount  -  1  do
	 	 	 	 	 	 	 	 gemEmbededIdx  =  GetGemEmbededType(  sceneId,  selfId,  i,  k  )
	 	 	 	 	 	 	 	 local  Type  =  LuaFnGetItemType(  gemEmbededIdx  )
	 	 	 	 	 	 	 	 if  Type  ==  gemType  then
	 	 	 	 	 	 	 	 	 --  so sánh hai viên bäo thÕch loÕi hình ( bäo thÕch loÕi l¾n )
	 	 	 	 	 	 	 	 	 gemYi  =  1
	 	 	 	 	 	 	 	 end
	 	 	 	 	 	 	 end
	 	 	 	 	 	 	 if  gemYi  ==  0  then
	 	 	 	 	 	 	 	 local  BagIndex  =  TryRecieveItem(  sceneId,  selfId,  Gem[j],  QUALITY_MUST_BE_CHANGE)
	 	 	 	 	 	 	 	 GemEnchasing(  sceneId,  selfId,  BagIndex,  i  )
	 	 	 	 	 	 	 end
	 	 	 	 	 	 end
	 	 	 	 	 	 
	 	 	 	 	 elseif  EquipType  ==  1  or  EquipType  ==  2  or  EquipType  ==  3  or  EquipType  ==  4  or  EquipType  ==  5  or  EquipType  ==  15    then
	 	 	 	 	 	 local  nMenpai  =  GetMenPai(sceneId,  selfId)
	 	 	 	 	 	 local  Gem  =  mybiaoshilist_g_Gem[nMenpai  +  1]
	 	 	 	 	 	 local  gemEmbededIdx  =  -1
	 	 	 	 	 	 local  gemYi  =  0
	 	 	 	 	 	 for  j=5,  8  do
	 	 	 	 	 	 	 local  gemType  =  LuaFnGetItemType(Gem[j])
	 	 	 	 	 	 	 for  k  =  0,  equipMaxGemCount  -  1  do
	 	 	 	 	 	 	 	 gemEmbededIdx  =  GetGemEmbededType(  sceneId,  selfId,  i,  k  )
	 	 	 	 	 	 	 	 local  Type  =  LuaFnGetItemType(  gemEmbededIdx  )
	 	 	 	 	 	 	 	 if  Type  ==  gemType  then
	 	 	 	 	 	 	 	 	 --  so sánh hai viên bäo thÕch loÕi hình ( bäo thÕch loÕi l¾n )
	 	 	 	 	 	 	 	 	 gemYi  =  1
	 	 	 	 	 	 	 	 end
	 	 	 	 	 	 	 end
	 	 	 	 	 	 	 if  gemYi  ==  0  then
	 	 	 	 	 	 	 	 local  BagIndex  =  TryRecieveItem(  sceneId,  selfId,  Gem[j],  QUALITY_MUST_BE_CHANGE)
	 	 	 	 	 	 	 	 GemEnchasing(  sceneId,  selfId,  BagIndex,  i  )
	 	 	 	 	 	 	 end
	 	 	 	 	 	 end
	 	 	 	 	 end
	 	 	 	 end
	 end
	 	 x000110_NotifyTip(  sceneId,  selfId,  "    chúc m×ng b¢ng hæu , trong túi ðÕo cø t¤t cä trang b¸ ð«u ðã khäm nÕm 3 l² các loÕi ng÷c 4 . "    )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  18,  0)

end

function  x000110_yiqianaddbiaoshi1(  sceneId,  selfId,targetId)
local tEquipGemTable = {8,9,10,18}   -- [NetCo4 08/10] Long Van + Vo Hon + Lenh Bai + Toa Ky (8: bang client Duc Lo Cuc Han khong nhan toa ky) (goc {9 Lenh Bai,10 Vo Hon,17 Am Khi,18 Long Van}) --8ºÅ×øÆï¡¢16ºÅÊ±×°²»¿ª¿×£¬·Â¹Ù
    local bagbegin = GetBasicBagStartPos(sceneId, selfId)
    local bagend = GetBasicBagEndPos(sceneId, selfId)
    for i = 0,10 do
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )	
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )	
				local find = 0
				for j, gem in tEquipGemTable do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )	
					local ret = AddBagItemSlot( sceneId, selfId, i )
					local ret1 = AddBagItemSlotFour( sceneId, selfId, i )  --4¿Õ²»¿ª
					equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )
				end
			end
		end
	end
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )

end