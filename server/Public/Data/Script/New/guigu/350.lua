--LÕc Dß½ng NPC
--Tr×u Tß·ng 
--Bình thß¶ng 
x760350_g_strGongGaoInfo = {
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
}
--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760350_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{AZJL_120803_20}")
		--AddText(sceneId,"#b#c6699ffChï c¥n Ngß½i Có ðßþc cûng ðü Cüa Th¥n gi¾i Chi ThÕch ,Ngã Li«n có th¬ Trþ Ngß½i Trang b¸ Phi thång .")
		--AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			--AddNumText(sceneId, x760350_g_scriptId,"Truy tìm Næ Oa ThÕch", 6, 2000)
			--AddNumText(sceneId, x760350_g_scriptId,"Truy tìm Næ Oa Th¥n thÕch", 6, 2000)
			AddNumText(sceneId, x760350_g_scriptId,"SØ døng Ma Huyªt ThÕch Chª tÕo Tø linh ThÕch", 6, 2001)
			--AddNumText(sceneId, x760350_g_scriptId,"20Phân C¯t Ph¤n Ð±i 1Cái Chuª Long thÕch #GBÕo", 6, 2003)
			--AddNumText(sceneId, x760350_g_scriptId,"20Phân C¯t Ph¤n Ð±i 1Cái Chuª Long thÕch #GThß½ng", 6, 2004)
			--AddNumText(sceneId, x760350_g_scriptId,"30Phân C¯t Ph¤n Ð±i 1Cái Chú Vån Huyªt ng÷c", 6, 2005)		
			--AddNumText(sceneId, x760350_g_scriptId,"60Phân C¯t Ph¤n Ð±i 1Cái Chú Vån Tinh Ng÷c", 6, 2006)	
			--AddNumText(sceneId, x760350_g_scriptId,"99Phân C¯t Ph¤n Ð±i 1Cái Chú Vån Long Ng÷c", 6, 2007)	
			AddNumText(sceneId, x760350_g_scriptId,"V« Ác chiªn CØu Lê", 11, 2008)	
			AddNumText(sceneId, x760350_g_scriptId,"V« Truy tìm Næ Oa Th¥n thÕch", 11, 2009)
			--AddNumText(sceneId, x760350_g_scriptId,"V« Truy tìm Næ Oa Th¥n thÕch", 11, 2010)			
		 --AddNumText(sceneId, x760350_g_ScriptId,"Vçn là L¥n sau LÕi ðªn Ba", 9, 4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760350_OnEventRequest(sceneId, selfId, targetId, eventId)

		--if	GetNumText()==60	then

			--BeginUICommand(sceneId)
			--UICommand_AddInt(sceneId,targetId)
			--EndUICommand(sceneId)
			--DispatchUICommand(sceneId,selfId, 1010)
			--return

		--end 

	if GetNumText() == 2008 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{AZJL_120803_21}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	
	if GetNumText() == 2009 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{HDYD_120822_167}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	if GetNumText() == 2010 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WHOATN_12103162_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	

	if GetNumText() == 108 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#c0066ffLuy®n hóa Tài li®u #WCó th¬ TÕi #YCác ÐÕi BOSS#WÐÕt ðßþc!")
		  AddText(sceneId,"#G(#cFF0000Th¥n Khí Ð±i #G)")
		  AddText(sceneId,"#G(#cFF0000Th¥n Khí Gia Tinh #G)")
		  AddText(sceneId,"#G(#cFF0000Th¥n Khí Bám vào ngß¶i #G)")
		   AddText(sceneId,"#cff99ffÐ« kÏ (#GM¶i Hüy ði Ðã Ðßþc khäm Cüa Ðá quý #cff99ff)")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif GetNumText() == 10 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Nh¤t giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W20#cff99ffCái Phi thång Nh¸ giai 40Cái Dî ThØ Suy tính")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Giáp", 6, 100)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Khôi", 6, 101)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Oän", 6, 102)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Thü", 6, 103)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Yêu", 6, 104)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Ngoa", 6, 105)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif GetNumText() == 2000 then
	local nStoneId0 = 20302999
	   	local nStoneId1 = 20302999
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=5 and c1>=5 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20302999,3)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20302999,2)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 30505814, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Truy tìm Ðªn Næ Oa Th¥n thÕch 1Cái ,Th§t là Th§t ðáng m×ng !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê Chân khí S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 2001 then
	local nStoneId0 = 30505813
	   	local nStoneId1 = 30505813
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=9 and c1>=9 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,30505813,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30505813,2)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 30505816, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công SØ døng 3Cái Ma Huyªt ThÕch Chª tÕo ra Tø linh ThÕch 1Cái ,Th§t là Th§t ðáng m×ng !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo Ma Huyªt ThÕch S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 2002 then
	local nStoneId0 = 20700067
	   	local nStoneId1 = 20700067
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=10 and c1>=10 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,10)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,10)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20310181, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Ð±i 1Cái Chuª Long thÕch #GNguyên !Th§t là Th§t ðáng m×ng ."
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê C¯t Ph¤n S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 2003 then
	local nStoneId0 = 20700067
	   	local nStoneId1 = 20700067
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=10 and c1>=10 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,10)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,10)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20310182, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Ð±i 1Cái Chuª Long thÕch #GNguyên !Th§t là Th§t ðáng m×ng ."
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê C¯t Ph¤n S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 2004 then
	local nStoneId0 = 20700067
	   	local nStoneId1 = 20700067
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=10 and c1>=10 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,10)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,10)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20310183, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Ð±i 1Cái Chuª Long thÕch #GThß½ng !Th§t là Th§t ðáng m×ng ."
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê C¯t Ph¤n S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end



	elseif GetNumText() == 2005 then
	local nStoneId0 = 20700067
	   	local nStoneId1 = 20700067
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=15 and c1>=15 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,15)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,15)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 38000184, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Ð±i 1Cái Chú Vån Huyªt ng÷c !Th§t là Th§t ðáng m×ng ."
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê C¯t Ph¤n S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end
			
			
			
	elseif GetNumText() == 2006 then
	local nStoneId0 = 20700067
	   	local nStoneId1 = 20700067
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=30 and c1>=30 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,30)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,30)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 38000185, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Ð±i 1Cái Chú Vån Tinh Ng÷c !Th§t là Th§t ðáng m×ng ."
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê C¯t Ph¤n S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end	



	elseif GetNumText() == 2007 then
	local nStoneId0 = 20700067
	   	local nStoneId1 = 20700067
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=45 and c1>=45 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,45)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700067,45)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 38000186, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Ð±i 1Cái Chú Vån Long Ng÷c !Th§t là Th§t ðáng m×ng ."
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo CØu Lê C¯t Ph¤n S¯ lßþng Không ðü Ho£c Ðã Gia Töa ,Vô pháp Ð±i Khen thß·ng ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end				
			

	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Nh¸ giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W40#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
		  --AddText(sceneId,"#GTß½ng Ð¯i Ñng Huy­n Thª Trang b¸ #W1#GKi®n")
		  --AddText(sceneId,"#b#GTrang b¸ Chi H°n #W100#cff99ffCái")
		  --AddText(sceneId,"#cFF0000Ð« kÏ: #b#c6699ffThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Nªu không s¨ Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Giáp", 6, 200)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Khôi", 6, 201)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Oän", 6, 202)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Thü", 6, 203)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Yêu", 6, 204)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Ngoa", 6, 205)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		
	elseif GetNumText() == 200 then
	local nStoneId0 = 10660000
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=40 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660000,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,40)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660024, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 201 then
	local nStoneId0 = 10660001
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=40 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660001,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,40)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660025, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 202 then
	local nStoneId0 = 10660002
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=40 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660002,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,40)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660026, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 203 then
	local nStoneId0 = 10660003
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=40 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660003,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,40)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660027, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 204 then
	local nStoneId0 = 10660004
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=40 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660004,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,40)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660028, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end



	elseif GetNumText() == 205 then
	local nStoneId0 = 10660005
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=40 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660005,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,40)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660029, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

		elseif GetNumText() == 30 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Tam giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W80#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Giáp", 6, 300)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Khôi", 6, 301)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Oän", 6, 302)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Thü", 6, 303)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Yêu", 6, 304)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Ngoa", 6, 305)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		
	elseif GetNumText() == 300 then
	local nStoneId0 = 10660024
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=80 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660024,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,80)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660048, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tam giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 301 then
	local nStoneId0 = 10660025
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=80 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660025,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,80)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660049, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tam giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 302 then
	local nStoneId0 = 10660026
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=80 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660026,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,80)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660050, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tam giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 303 then
	local nStoneId0 = 10660027
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=80 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660027,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,80)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660051, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tam giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 304 then
	local nStoneId0 = 10660028
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=80 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660028,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,80)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660052, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tam giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end



	elseif GetNumText() == 305 then
	local nStoneId0 = 10660029
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=80 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660029,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,80)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660053, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tam giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

			
	elseif GetNumText() == 40 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång TÑ giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W160#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Giáp", 6, 400)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Khôi", 6, 401)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Oän", 6, 402)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Thü", 6, 403)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Yêu", 6, 404)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Ngoa", 6, 405)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)


	elseif GetNumText() == 400 then
	local nStoneId0 = 10660048
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=160 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660048,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,160)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660072, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång TÑ giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


			
	elseif GetNumText() == 401 then
	local nStoneId0 = 10660049
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=160 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660049,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,160)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660073, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång TÑ giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

			
	elseif GetNumText() == 402 then
	local nStoneId0 = 10660050
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=160 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660050,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,160)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660074, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång TÑ giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 403 then
	local nStoneId0 = 10660051
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=160 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660051,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,160)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660075, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång TÑ giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 404 then
	local nStoneId0 = 10660052
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=160 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660052,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,160)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660076, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång TÑ giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end
	
	elseif GetNumText() == 405 then
	local nStoneId0 = 10660053
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=160 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660053,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,160)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660077, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång TÑ giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 50 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Ngû giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W320#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Giáp", 6, 500)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Khôi", 6, 501)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Oän", 6, 502)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Thü", 6, 503)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Yêu", 6, 504)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Ngoa", 6, 505)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)


	elseif GetNumText() == 500 then
	local nStoneId0 = 10660072
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=320 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660072,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,320)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660096, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ngû giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 501 then
	local nStoneId0 = 10660073
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=320 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660073,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,320)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660097, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ngû giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 502 then
	local nStoneId0 = 10660074
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=320 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660074,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,320)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660098, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ngû giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

			
	elseif GetNumText() == 503 then
	local nStoneId0 = 10660075
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=320 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660075,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,320)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660099, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ngû giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 504 then
	local nStoneId0 = 10660076
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=320 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660076,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,320)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660100, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ngû giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


			
	elseif GetNumText() == 505 then
	local nStoneId0 = 10660077
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=320 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660077,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,320)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660101, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ngû giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

			
	elseif GetNumText() == 60 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Løc giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W640#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Giáp", 6, 600)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Khôi", 6, 601)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Oän", 6, 602)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Thü", 6, 603)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Yêu", 6, 604)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Ngoa", 6, 605)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)


	elseif GetNumText() == 600 then
	local nStoneId0 = 10660096
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=640 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660096,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,640)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660120, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Løc giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 601 then
	local nStoneId0 = 10660097
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=640 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660097,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,640)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660121, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Løc giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end
	
	elseif GetNumText() == 602 then
	local nStoneId0 = 10660098
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=640 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660098,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,640)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660122, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Løc giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 603 then
	local nStoneId0 = 10660099
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=640 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660099,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,640)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660123, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Løc giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 604 then
	local nStoneId0 = 10660100
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=640 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660100,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,640)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660124, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Løc giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 605 then
	local nStoneId0 = 10660101
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=640 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660101,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,640)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660125, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Løc giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 70 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Th¤t giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W1000#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Giáp", 6, 700)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Khôi", 6, 701)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Oän", 6, 702)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Thü", 6, 703)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Yêu", 6, 704)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Ngoa", 6, 705)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

			
	elseif GetNumText() == 700 then
	local nStoneId0 = 10660120
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660120,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660144, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Th¤t giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 701 then
	local nStoneId0 = 10660121
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660121,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660145, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Th¤t giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


			
	elseif GetNumText() == 702 then
	local nStoneId0 = 10660122
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660122,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660146, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Th¤t giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

			
	elseif GetNumText() == 703 then
	local nStoneId0 = 10660123
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660123,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660147, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Th¤t giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 704 then
	local nStoneId0 = 10660124
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660124,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660148, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Th¤t giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 705 then
	local nStoneId0 = 10660125
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660125,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660149, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Th¤t giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 80 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Tiên giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W1000#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Giáp", 6, 800)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Khôi", 6, 801)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Oän", 6, 802)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Thü", 6, 803)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Yêu", 6, 804)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Ngoa", 6, 805)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
			

	elseif GetNumText() == 800 then
	local nStoneId0 = 10660144
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660144,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660168, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tiên giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end
			
	elseif GetNumText() == 801 then
	local nStoneId0 = 10660145
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660145,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660169, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tiên giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 802 then
	local nStoneId0 = 10660146
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660146,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660170, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tiên giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 803 then
	local nStoneId0 = 10660147
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660147,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660171, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tiên giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 804 then
	local nStoneId0 = 10660148
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660148,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660172, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tiên giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 805 then
	local nStoneId0 = 10660149
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660149,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660173, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Tiên giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 90 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Ph§t Giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W1000#cff99ffCái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Giáp", 6, 900)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Khôi", 6, 901)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Oän", 6, 902)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Thü", 6, 903)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Yêu", 6, 904)
			AddNumText(sceneId, x760350_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Ngoa", 6, 905)
			AddNumText(sceneId, x760350_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)		

	elseif GetNumText() == 900 then
	local nStoneId0 = 10660168
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660168,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660192, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Giáp !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 901 then
	local nStoneId0 = 10660169
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660169,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660193, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Khôi !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 902 then
	local nStoneId0 = 10660170
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660170,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660194, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Oän !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 903 then
	local nStoneId0 = 10660171
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660171,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660195, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Thü !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 904 then
	local nStoneId0 = 10660172
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660172,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660196, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Yêu !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end



	elseif GetNumText() == 905 then
	local nStoneId0 = 10660173
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1000 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10660173,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,1000)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660197, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760350_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Ngoa !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="#b#c66ccffTài li®u Không ðü !!"
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end			

 



		return
	end
end
--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760350_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760350_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

function x760350_ShowRandomSystemNotice(sceneId, selfId, strItemInfo)
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random(1, 4)
	local str
	if nMsgIndex == 1 then
		str = format(x760350_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format(x760350_g_strGongGaoInfo[2], PlayerName, strItemInfo)
	elseif nMsgIndex == 3 then
		str = format(x760350_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	else
		str = format(x760350_g_strGongGaoInfo[4], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
end
