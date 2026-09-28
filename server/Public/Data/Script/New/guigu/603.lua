x760603_g_scriptId = 760603

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760603_OnDefaultEvent(sceneId, selfId, targetId)
	BeginEvent(sceneId)
		BeginEvent(sceneId)
		AddText(sceneId," — ta n½i này Có th¬ Tiªn hành Tài li®u Hþp thành Hòa Chí tôn Tài li®u Ð±i .")
		--AddText(sceneId," Ði¬m ðánh #GTrang b¸ Xß·ng #WTuy¬n HÕng ,Khä Ðä khai Trang b¸ Khoan #W##GÐá quý Ðßþc khäm #WHòa #GÐá quý Bö ði #WGiao di®n ;")
		--AddText(sceneId," Ði¬m ðánh #GÐá quý Xß·ng #WTuy¬n HÕng ,Khä Ðä khai Ðá quý Hþp thành #W##GÐá quý TÕo hình #W##GÐá quý Luy®n #W##GÐá quý Trác Kh¡c #W##GTrác Kh¡c Chia lìa #WHòa #GTrang b¸ Ðá quý Thång c¤p #WGiao di®n .")
        --AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Xß·ng", 6, 18)
		--AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Xß·ng", 6, 17)
		AddNumText(sceneId, x760603_g_scriptId,"Nguyên li®u hþp thành", 6, 4)
		--AddNumText(sceneId, x760603_g_scriptId,"Chí tôn Tài li®u Ð±i", 6, 7000)		
		--AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Xß·ng Gi¾i thi®u", 11, 0)
		--AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Xß·ng Gi¾i thi®u", 11, 55)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760603_OnEventRequest(sceneId, selfId, targetId, eventId)

-------------------Dùng cho Phän h°i Chü Giao di®n ----------------------------------------
	if GetNumText() == 3003 then
	   BeginEvent(sceneId)
		AddText(sceneId," — ta n½i này Có th¬ Tiªn hành Trang b¸ Hòa Ðá quý ÐÕi bµ ph§n Thao tác .")
		AddText(sceneId," Ði¬m ðánh #GTrang b¸ Xß·ng #WTuy¬n HÕng ,Khä Ðä khai Trang b¸ Khoan #W##GÐá quý Ðßþc khäm #WHòa #GÐá quý Bö ði #WGiao di®n ;")
		AddText(sceneId," Ði¬m ðánh #GÐá quý Xß·ng #WTuy¬n HÕng ,Khä Ðä khai Ðá quý Hþp thành #W##GÐá quý TÕo hình #W##GÐá quý Luy®n #W##GÐá quý Trác Kh¡c #W##GTrác Kh¡c Chia lìa #WHòa #GTrang b¸ Ðá quý Thång c¤p #WGiao di®n .")
        AddNumText(sceneId, x760603_g_scriptId,"#GTrang b¸ Xß·ng", 6, 18)
		AddNumText(sceneId, x760603_g_scriptId,"#GÐá quý Xß·ng", 6, 17)
		AddNumText(sceneId, x760603_g_scriptId,"Tài li®u Hþp thành", 6, 4)
		AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Xß·ng Gi¾i thi®u", 11, 0)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Xß·ng Gi¾i thi®u", 11, 55)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return
end

---------------------------Gi¾i thi®u -------------------------------------------------
		if GetNumText() == 0 then
			BeginEvent(sceneId)		
				AddText(sceneId,"#{function_help_054}")	
				AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Khoan Gi¾i thi®u",11,8);
				AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Hþp thành Gi¾i thi®u",11,9);
				AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Ðßþc khäm Gi¾i thi®u",11,10);
				AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Bö ði Gi¾i thi®u",11,11);
				AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ SØa chæa Gi¾i thi®u",11,12);
				AddNumText(sceneId, x760603_g_scriptId,"Ðá quý TÕo hình Gi¾i thi®u",11,13);
				AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Luy®n Gi¾i thi®u",11,14);
				AddNumText(sceneId, x760603_g_scriptId,"Th¡ng lþi Ðá quý Gi¾i thi®u",11,15);
				AddNumText(sceneId, x760603_g_scriptId,"#WPhän h°i Trang trß¾c",8,3003);
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
---------------------------Tài li®u Hþp thành Gi¾i thi®u -------------------------------------------
		if GetNumText() == 20 then 
			BeginEvent(sceneId)			
				AddText(sceneId,"#{SJSJ_081021_001}")
				AddNumText(sceneId, x760603_g_scriptId,"Tinh thiªt Cüa Thao tác Gi¾i thi®u",11,21);
				AddNumText(sceneId, x760603_g_scriptId,"Bí bÕc Cüa Thao tác Gi¾i thi®u",11,22);
				AddNumText(sceneId, x760603_g_scriptId,"Väi bông Cüa Thao tác Gi¾i thi®u",11,23);				
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
---------------------------Ðá quý Xß·ng -------------------------------------------
	 if GetNumText() == 17 then
		BeginEvent(sceneId)
		AddText(sceneId," Ngß½i Có th¬ ðem M¤y viên Tß½ng ð°ng Ðá quý Hþp Tr· thành mµt Khöa Cao mµt b§c Cüa Ðá quý #Bä M¤y cái C¤p th¤p Tài li®u Hþp Tr· thành mµt cái Cao mµt b§c Cüa Tài li®u ,Cûng có th¬ C¤p Trang b¸ Ðánh cái Kh±ng Dùng ð¬ Ðßþc khäm Ðá quý ,Dã Có th¬ ðem Ðá quý Bö ði .")
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Tß½ng quan Gi¾i thi®u", 11, 0)
		AddNumText(sceneId, x760603_g_scriptId,"Tài li®u Hþp thành Gi¾i thi®u", 11, 20) 
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Thång c¤p", 6, 300) --Cái này Không có làm Hoàn ,TÕm Không khai Khäi 
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Hþp thành", 6, 10000)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Ðßþc khäm", 6, 5)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Bö ði", 6, 3)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý TÕo hình", 6, 6)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Luy®n", 6, 7)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Trác Kh¡c", 6, 100)
		AddNumText(sceneId, x760603_g_scriptId,"Trác Kh¡c Chia lìa", 6, 200)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Cñc hÕn Ðßþc khäm", 6, 31)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Cñc hÕn Bö ði", 6, 32)
		AddNumText(sceneId, x760603_g_scriptId,"Ðá quý Thay ð±i", 6, 2)
		AddNumText(sceneId, x760603_g_scriptId,"#WPhän h°i Trang trß¾c",8,3003);	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return
     end
---------------------------Trang b¸ Xß·ng -------------------------------------------
     if GetNumText() == 18 then
		BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0020}")
		AddNumText(sceneId, x760603_g_scriptId,"Nh¤t Ki®n TÑ Kh±ng", 6, 2010)
		--AddNumText(sceneId, x760603_g_scriptId,"Nh¤t Ki®n Ðßþc khäm", 6, 2020)
		AddNumText(sceneId, x760603_g_scriptId,"Cñc hÕn Khoan", 6, 10)
		AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Cß¶ng hóa", 6, 1001)
		AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Kh¡c Minh", 6, 1003)
		AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Tß ch¤t Giám ð¸nh", 6, 1004)
		AddNumText(sceneId, x760603_g_scriptId,"Trang b¸ Tß ch¤t Tr÷ng Giám", 6, 1005)
		AddNumText(sceneId, x760603_g_scriptId,"#WPhän h°i Trang trß¾c",8,3003);	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return
     end

--****************************************************************************

--------------------------- Trang b¸ Cß¶ng hóa -----------------------------------
		if	GetNumText()==1001 then
		   BeginEvent(sceneId)
		   AddText(sceneId,"#{ZBQHJ_130508_1}")
		   AddNumText(sceneId,x760603_g_ScriptId,"#cffcc00SØ døng #GCß¶ng hóa ÐÕo cø #cffcc00Cß¶ng hóa Trang b¸",6,1599)
		   AddNumText(sceneId,x760603_g_ScriptId,"#cffcc00SØ døng #GCß¶ng hóa Quy¬n trøc #cffcc00Cß¶ng hóa Trang b¸",6,1699)
		   AddNumText(sceneId,x760603_g_ScriptId,"#cffcc00Cß¶ng hóa D¶i ði",6,1002)
		   AddNumText(sceneId,x760603_g_ScriptId,"#cffcc00Trang b¸ Cß¶ng hóa Gi¾i thi®u",11,3333)
		   AddNumText(sceneId,x760603_g_ScriptId,"#cffcc00Cß¶ng hóa D¶i ði Gi¾i thi®u",11,3334)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if GetNumText()== 1599 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1002)
			return
		end

		if GetNumText() == 1699 then
	 	   BeginUICommand(sceneId)
		   UICommand_AddInt(sceneId, selfId)
            UICommand_AddInt(sceneId, 11)
            UICommand_AddInt(sceneId, 50000)---Yêu c¥u Ti«n 
	       UICommand_AddInt(sceneId, 10000000) --Trang b¸ B¡t ð¥u 
	       UICommand_AddInt(sceneId, 20000000) --Trang b¸ Kªt thúc 
	       UICommand_AddInt(sceneId, -1) --V§t ph¦m id
		   UICommand_AddString(sceneId,"Trang b¸ Cß¶ng hóa #GQuy¬n trøc");
		   UICommand_AddString(sceneId,"#{ZBQHJ_130508_7}");
		   UICommand_AddString(sceneId,"M¶i Tß½ng Trang b¸ Ð¬ vào ThØ Khuông");
		   UICommand_AddString(sceneId,"M¶i Tß½ng Cß¶ng hóa Quy¬n trøc Ð¬ vào ThØ Khuông");
		   EndUICommand(sceneId)
		   DispatchUICommand(sceneId,selfId,21090722)
			return
		end

--------------------------- Trang b¸ Cß¶ng hóa D¶i ði -------------------------------

		if GetNumText() == 1002 then
          BeginUICommand(sceneId)
		 UICommand_AddInt(sceneId,targetId);
		 EndUICommand(sceneId)
		 DispatchUICommand(sceneId,selfId, 20130521)
          return
        end


--------------------------- Trang b¸ Kh¡c Minh ------------------------------------
		if	GetNumText()==1003 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1005)
			return
		end


-------------------------Trang b¸ Tß ch¤t Giám ð¸nh -----------------------------------
		if GetNumText() == 1004 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId, selfId, 1001)
			return
		end
		
	if GetNumText() == 7000 then
       	BeginEvent(sceneId)
		AddNumText(sceneId, x760603_g_ScriptId,"Ð±i Chí tôn Väi bông",6,7001)	
		AddNumText(sceneId, x760603_g_ScriptId,"Ð±i Chí tôn Bí bÕc",6,7002)		
  	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)	

	elseif GetNumText() == 7001 then
	local nStoneId0 = 20501004
	   	local nStoneId1 = 20501004
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=10 and c1>=10 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20501004,5)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20501004,5)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20501005, 1)--Cho V§t ph¦m 
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng Ngài Thành công Ð±i Chí tôn Väi bông")
		local	nam	= LuaFnGetName(sceneId, selfId)
		DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü M¶i Ki¬m tra Hay không Ba lô Có 10Cái B¤t Gia Töa Cüa 4C¤p Väi bông !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end
	elseif GetNumText() == 7002 then
	local nStoneId0 = 20502004
	   	local nStoneId1 = 20502004
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=10 and c1>=10 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20502004,5)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20502004,5)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20502005, 1)--Cho V§t ph¦m 
		DispatchAllTitle(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"#GChúc m×ng Ngài Thành công Ð±i Chí tôn Bí bÕc")
		local	nam	= LuaFnGetName(sceneId, selfId)
		DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü M¶i Ki¬m tra Hay không Ba lô Có 10Cái B¤t Gia Töa Cüa 4C¤p Bí bÕc !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end		
			end				

--------------------- Mµt l¥n næa Giám ð¸nh Trang b¸ Tß ch¤t -----------------------------------
		if	GetNumText()==1005 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 112233)
			return
		end
------------------------- Tài li®u Hþp thành ---------------------------------------
		if GetNumText() == 4 then
			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId, selfId, 19810424)
			return
		end



		if GetNumText()== 300 then --Ðá quý Thång c¤p ,TÕm th¶i Không có Cái này UI
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 201408140)
		return
		end

	if GetNumText() == 2 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,0);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 201302201)
	 return
	end

	if GetNumText()== 2020 then
		x760603_yiqianaddbiaoshi(sceneId, selfId,targetId)
		return
	end

    if GetNumText() == 889 then	
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
        UICommand_AddInt(sceneId, 6)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 20090721)		
	return
    end	

	
	if GetNumText() == 888 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId,2013060601)
		return
	end	
	
	if GetNumText() == 100 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId,201210120)
		return
	elseif GetNumText() == 200 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 201210121)
		return
	end
	
	if GetNumText() == 889 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1001)
		return
	end
	if GetNumText() == 893 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1004)
		return
	end
	if GetNumText() == 890 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1005)
		return
	end
	if GetNumText() == 891 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1006)
		return
	end
	if GetNumText() == 892 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 112233)
		return
	end
	if GetNumText() == 8 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_039}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 9 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_040}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 10 then
		BeginEvent(sceneId)						
		AddNumText(sceneId, x760603_g_scriptId,"Hàn Ng÷c Cñc hÕn", 6, 30)
		AddNumText(sceneId, x760603_g_scriptId,"Ði¬m Kim Cñc hÕn", 6, 11)
		AddNumText(sceneId, x760603_g_scriptId,"#WPhän h°i Trang trß¾c", 8, 18)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
		
	if GetNumText() == 30 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
			UICommand_AddInt(sceneId, 2)		--type,Phân chia Ði¬m Kim Vçn là Hàn Ng÷c 
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 75117)
		return
	end
		
	if GetNumText() == 31 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 751107)
		return
	end
		
	if GetNumText() == 32 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 25702)
		return
	end
		
	if GetNumText() == 11 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
			UICommand_AddInt(sceneId, 1)		--type,Phân chia Ði¬m Kim Vçn là Hàn Ng÷c 
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 75117)
		return
	end	
	if GetNumText() == 12 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_043}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 13 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{INTERFACE_XML_GemCarve_6}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	if GetNumText() == 10000 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 23)
		return
	end
	if GetNumText() == 3 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 27)
		return
	end
	
	if GetNumText() == 5 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 19830424)
		return
	end
	if GetNumText() == 6 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 112236)
		return
	end
		
	if GetNumText() == 7 then
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 112237)
		return
	end
	if GetNumText() == 2010 then
		x760603_OneKey4Slot(sceneId, selfId, 1)
  end	
end	




function x760603_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId) --Hoàn thành 
  if not selectRadioId then
		return
	end	

	local itemid = LuaFnGetItemTableIndexByIndex(sceneId, selfId,30)
	if floor(itemid/ 10000000) ~= 5 then
	 x760603_NotifyTip(sceneId, selfId,"Tß½ng Nhu Phäi tiªn hành Thay ð±i Cüa Ðá quý Phóng ÐÕo cø Lan Cái thÑ nh¤t Ô vuông")	
		return
	end
	local bagindex = GetBagItemTransfer(sceneId, selfId, 30)
	
	ret = LuaFnIsItemAvailable(sceneId, selfId, 30)
	if ret ~= 1 then
	x760603_NotifyTip(sceneId, selfId,"Gia Töa Ðá quý Không th¬ Ð±i")
		return		
	end	

	if LuaFnGetItemType(itemid) ~= LuaFnGetItemType(selectRadioId) then
    x760603_NotifyTip(sceneId, selfId,"Lña ch÷n Hòa Tài li®u Lan Cái thÑ nh¤t Cüa LoÕi hình B¤t XÑng ðôi")	
		return
	end
	if GetItemQuality(itemid) ~= GetItemQuality(selectRadioId) then
	 x760603_NotifyTip(sceneId, selfId,"Lña ch÷n Hòa Tài li®u Lan Cái thÑ nh¤t Cüa C¤p b§c B¤t XÑng ðôi")	
		return
	end
	local idxa = 30503177 --4C¤p Cüa Phó 
	
	--if GetItemQuality(itemid) == 6 then
	--idxa = 30503179
	--elseif GetItemQuality(itemid) == 7 then
	-- idxa = 30503180
	--elseif GetItemQuality(itemid) == 8 then
	--idxa = 30503181
	--end
	
	
	if LuaFnGetAvailableItemCount(sceneId, selfId,idxa) <1 then
		
	x760603_NotifyTip(sceneId, selfId,"Ngß½i Khuyªt thiªu"..GetItemName(sceneId,idxa))	
		return
	end	
	
	LuaFnDelAvailableItem(sceneId,selfId,idxa,1)
		if LuaFnEraseItem(sceneId, selfId, 30) ~= 1 then
			x760603_NotifyTip(sceneId, selfId,"Kh¤u tr× V§t ph¦m Th¤t bÕi !")
			return
		end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	local ret1 = TryRecieveItem(sceneId, selfId, selectRadioId, 1)
	LuaFnItemBind(sceneId, selfId,ret1);
	x760603_NotifyTip(sceneId, selfId,"Ð±i Thành công")
	local szTranItm1	= GetBagItemTransfer(sceneId, selfId, ret1)
	local szMsg = format("#HChúc m×ng Ngß¶i ch½i #{_INFOUSR%s}SØ døng #{_INFOMSG%s} TÕi #GLÕc Dß½ng (163.106)#HXØ Thành công Ð±i Mµt viên #{_INFOMSG%s1}!",LuaFnGetName(sceneId, selfId), bagindex,szTranItm1)
	BroadMsgByChatPipe(sceneId, selfId, szMsg,4)
end

function x760603_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
function x760603_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
function x760603_OneKey4Slot(sceneId, selfId,isTips)
	local tEquipGemTable = {0,1,3,4,5,6,7,9,10,11,12,13,14,15,16,17,18}
  local bagbegin = GetBasicBagStartPos(sceneId, selfId)
  local bagend = GetBasicBagEndPos(sceneId, selfId)
  for i = 0,10 do
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)	
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked(sceneId, selfId, i)
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType(sceneId, selfId, i)	
				local find = 0
				for j, gem in tEquipGemTable do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then
					local equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)	
					local ret = AddBagItemSlot(sceneId, selfId, i)
					local ret1 = AddBagItemSlotFour(sceneId, selfId, i) 
					equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)

				end
			end
		end
	end
  local tEquipGemTable1 = {2}
  local bagbegin1 = GetBasicBagStartPos(sceneId, selfId)
  local bagend1 = GetBasicBagEndPos(sceneId, selfId)
  for i = 0,10 do
		for i=bagbegin1, bagend1 do
			local itemIndex = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)	
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked(sceneId, selfId, i)
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType(sceneId, selfId, i)	
				local find = 0
				for j, gem in tEquipGemTable1 do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then
					--local equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)	
					--local ret = AddBagItemSlot(sceneId, selfId, i)
					--**--local ret1 = AddBagItemSlotFour(sceneId, selfId, i) ---TÑ Kh±ng ,Th¶i trang Không khai Khäi 
					--equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)

				end
			end
		end
	end
	
	if isTips==1 then
	x760603_NotifyTip(sceneId, selfId,"Chúc m×ng Ngài ,Ngài Bao vây S· hæu Trang b¸ Ðã Thành công Khai TÑ Kh±ng")
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	end
end
--**********************************
--Nh¤t Ki®n Ðßþc khäm 8C¤p Ðá quý 
--**********************************
function x760603_yiqianaddbiaoshi(sceneId, selfId,targetId)
local mybiaoshilist_g_Gem = 
{
{ 50621106,50602005,50603001,50604002,50613004,50614001,50611001,50612005 },--Thiªu Lâm 0Huy«n 
{ 50621306,50602007,50603001,50604002,50613004,50614001,50611001,50612006 },--Minh Giáo 1Höa 
{ 50621406,50602008,50603001,50604002,50613004,50614001,50611001,50612008 },--Cái Bang 2Ðµc 
{ 50621206,50602006,50603001,50604002,50613004,50614001,50611001,50612005 },--Võ Ðang 3Bång 
{ 50621206,50602006,50603001,50604002,50613004,50614001,50611001,50612007 },--Nga Mi 4Bång 
{ 50621406,50602008,50603001,50604002,50613004,50614001,50611001,50612008 },--Tinh Túc 5Ðµc 
{ 50621106,50602005,50603001,50604002,50613004,50614001,50611001,50612005 },--Thiên Long 6Huy«n 
{ 50621206,50602006,50603001,50604002,50613004,50614001,50611001,50612007 },--Thiên S½n 7Bång 
{ 50621306,50602007,50603001,50604002,50613004,50614001,50611001,50612006 },--Tiêu Dao 8Höa 
{ 50621106,50602005,50603001,50604002,50613004,50614001,50611001,50612005 },--Không Có Phái 9Huy«n 
{ 50621106,50602005,50603001,50604002,50613004,50614001,50611001,50612005 },--Mµ Dung 10Huy«n 
{ 50621406,50602008,50603001,50604002,50613004,50614001,50611001,50612008 },--Ðß¶ng Môn 11Ðµc 
{ 50621106,50602005,50603001,50604002,50613004,50614001,50611001,50612005 },--QuÖ C¯c 12Huy«n 
}

		local tEquipGemTable	= { 0, 1, 3, 4, 5, 6, 7, 9, 10, 12, 14, 15, 16, 17, 18 } 
		local Bore_Count			= GetBagGemCount(sceneId, selfId, 0)
		local nLevel					= GetBagItemLevel(sceneId, selfId, 0)
		local EquipType				= LuaFnGetBagEquipType(sceneId, selfId, 0)
		local find						= 0
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend = GetBasicBagEndPos(sceneId, selfId)		
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked(sceneId, selfId, i)
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType(sceneId, selfId, i)				
				local find = 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end
			end
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)					
					while equipMaxGemCount<3 do				
						local ret = AddBagItemSlot(sceneId, selfId, i)
						equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)			
					end
         AddBagItemSlotFour(sceneId, selfId, i)
				end
			end
        local can = 0
        local EquipType = LuaFnGetBagEquipType(sceneId, selfId, i)
				local equipEmbededGemCount = 0
				equipMaxGemCount = 0
				if EquipType>= 0 and EquipType ~= 2 then
				-- Phán ðoán Hay không còn Có th¬ Ðßþc khäm Càng nhi«u Ðá quý 
				equipMaxGemCount = GetBagGemCount(sceneId, selfId, i)
				equipEmbededGemCount = GetGemEmbededCount(sceneId, selfId, i)
        end
				--modi:lbyHay không có th¬ Ðßþc khäm 
				if equipMaxGemCount> equipEmbededGemCount and equipMaxGemCount ~= 0 then
					can = 1
				end
				if can == 1 then	
					if EquipType == 0 or EquipType == 6 or EquipType == 7 or EquipType == 11 or EquipType == 12 or EquipType == 13 or EquipType == 14 or EquipType == 17 or EquipType == 18 or EquipType == 10 or EquipType == 9 then

						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=1, 4 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType(sceneId, selfId, i, k)
								local Type = LuaFnGetItemType(gemEmbededIdx)
								if Type == gemType then
									-- Ð¯i l§p LßÞng Khöa Ðá quý LoÕi hình (Ðá quý ÐÕi loÕi )
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem(sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing(sceneId, selfId, BagIndex, i)
							end
						end
						
					elseif EquipType == 1 or EquipType == 16 or EquipType == 3 or EquipType == 4 or EquipType == 5 or EquipType == 15 then
						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=5, 8 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType(sceneId, selfId, i, k)
								local Type = LuaFnGetItemType(gemEmbededIdx)
								if Type == gemType then
									-- Ð¯i l§p LßÞng Khöa Ðá quý LoÕi hình (Ðá quý ÐÕi loÕi )
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem(sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing(sceneId, selfId, BagIndex, i)
							end
						end
					end
				end
	end
		x760603_NotifyTip(sceneId, selfId,"Chúc m×ng Ngài ,Ngài Ba lô S· hæu Trang b¸ Quân Ðã Toàn bµ Ðßþc khäm R°i [#R6C¤p Ðá quý #Y].")
    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)

end
