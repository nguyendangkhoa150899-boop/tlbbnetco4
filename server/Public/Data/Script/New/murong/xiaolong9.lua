--LÕc Dß½ng NPC
--Tr×u Tß·ng 
--Bình thß¶ng 
x402323_g_strGongGaoInfo = {
 --"#HTô Châu Thành Vân Tuyªt Nhi XØ Nh¤t ÐÕo kim quang Hi®n lên ,#{_INFOUSR%s}#HDøng 50Cái Thánh thú Lân Ð±i Xu¤t #{_INFOMSG%s},Th§t là Ti®n sát Ngß¶i khác !", 
 --"#HTô Châu Thành Vân Tuyªt Nhi XØ Nh¤t ÐÕo kim quang Hi®n lên ,#{_INFOUSR%s}#HDøng 50Cái Thánh thú Lân Ð±i Xu¤t #{_INFOMSG%s},Th§t là Ti®n sát Ngß¶i khác !", 
 --"#HTô Châu Thành Vân Tuyªt Nhi XØ Nh¤t ÐÕo kim quang Hi®n lên ,#{_INFOUSR%s}#HDøng 50Cái Thánh thú Lân Ð±i Xu¤t #{_INFOMSG%s},Th§t là Ti®n sát Ngß¶i khác !", 
 --"#HTô Châu Thành Vân Tuyªt Nhi XØ Nh¤t ÐÕo kim quang Hi®n lên ,#{_INFOUSR%s}#HDøng 50Cái Thánh thú Lân Ð±i Xu¤t #{_INFOMSG%s},Th§t là Ti®n sát Ngß¶i khác !", 
}
--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x402323_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"Mµt ki®n Bäo bäo Sáo Cûng có th¬ Hóa giäi Xu¤t 30Cái Thánh thú Lân .")
		--AddText(sceneId,"#b#c6699ffChï c¥n Ngß½i Có ðßþc cûng ðü Cüa Th¥n gi¾i Chi ThÕch ,Ngã Li«n có th¬ Trþ Ngß½i Trang b¸ Phi thång .")
		--AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi ¿ng Tß¶ng Không Thú [Hóa giäi]", 6, 10)
			AddNumText(sceneId, x402323_g_scriptId,"Mãnh h± Hám S½n Thú [Hóa giäi]", 6, 20)
			AddNumText(sceneId, x402323_g_scriptId,"Cñ hùng Hao Lµ Thú [Hóa giäi]", 6, 30)
			--AddNumText(sceneId, x402323_g_scriptId,"TÑ giai Trang phøc [Chu Tß¾c]", 6, 40)
			--AddNumText(sceneId, x402323_g_scriptId,"Ngû giai Trang phøc [Chu Tß¾c]", 6, 50)
			--AddNumText(sceneId, x402323_g_scriptId,"Løc giai Trang phøc [Chu Tß¾c]", 6, 60)		
			--AddNumText(sceneId, x402323_g_scriptId,"Th¤t giai Trang phøc [Chu Tß¾c]", 6, 70)	
			--AddNumText(sceneId, x402323_g_scriptId,"Tiên giai Trang phøc [Chu Tß¾c]", 6, 80)	
			--AddNumText(sceneId, x402323_g_scriptId,"Ph§t Giai Trang phøc [Chu Tß¾c]", 6, 90)				
		 --AddNumText(sceneId, x402323_g_ScriptId,"Vçn là L¥n sau LÕi ðªn Ba", 9, 4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x402323_OnEventRequest(sceneId, selfId, targetId, eventId)

		--if	GetNumText()==60	then

			--BeginUICommand(sceneId)
			--UICommand_AddInt(sceneId,targetId)
			--EndUICommand(sceneId)
			--DispatchUICommand(sceneId,selfId, 1010)
			--return

		--end 



	if GetNumText() == 108 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#c0066ffLuy®n hóa Tài li®u #WCó th¬ TÕi #YCác ÐÕi BOSS#WÐÕt ðßþc!")
		  AddText(sceneId,"#G(#cFF0000Th¥n Khí Ð±i)")
		  AddText(sceneId,"#G(#cFF0000Th¥n Khí Gia Tinh)")
		  AddText(sceneId,"#G(#cFF0000Th¥n Khí Bám vào ngß¶i)")
		   AddText(sceneId,"#cff99ffÐ« kÏ (#GM¶i Hüy ði Ðã Ðßþc khäm Cüa Ðá quý #cff99ff)")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif GetNumText() == 10 then
		BeginEvent(sceneId)
		  AddText(sceneId,"Mµt ki®n Bäo bäo Sáo Cûng có th¬ Hóa giäi Xu¤t 30Cái Thánh thú Lân .")
		  --AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W20#cff99ffCái Phi thång Nh¸ giai 40Cái Dî ThØ Suy tính")
		  --AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Phi ¿ng Tß¶ng Không Thú Träo #GKhiªp [Hóa giäi]", 6, 100)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Phi ¿ng Tß¶ng Không Thú Khôi #GKhiªp [Hóa giäi]", 6, 101)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Phi ¿ng Tß¶ng Không Thú Giáp #GKhiªp [Hóa giäi]", 6, 102)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Phi ¿ng Tß¶ng Không Vòng #GKhiªp [Hóa giäi]", 6, 103)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Phi ¿ng Tß¶ng Không Thú SÑc #GKhiªp [Hóa giäi]", 6, 104)
			--AddNumText(sceneId, x402323_g_scriptId,"Phi thång Nh¤t giai Chu Tß¾c #GHöa #GNgßng Ngoa", 6, 105)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif GetNumText() == 100 then
	local nStoneId0 = 39999911
	   	local nStoneId1 = 39999911
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999911,0)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999911,1)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 						
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Phi ¿ng Tß¶ng Không Thú Träo #GKhiªp"
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


	elseif GetNumText() == 101 then
	local nStoneId0 = 39999921
	   	local nStoneId1 = 39999921
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999921,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999921,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Phi ¿ng Tß¶ng Không Thú Khôi #GKhiªp !"
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

	elseif GetNumText() == 102 then
	local nStoneId0 = 39999931
	   	local nStoneId1 = 39999931
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999931,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999931,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Phi ¿ng Tß¶ng Không Thú Giáp #GKhiªp !"
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


	elseif GetNumText() == 103 then
	local nStoneId0 = 39999941
	   	local nStoneId1 = 39999941
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999941,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999941,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Phi ¿ng Tß¶ng Không Vòng #GKhiªp !"
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

	elseif GetNumText() == 104 then
	local nStoneId0 = 39999951
	   	local nStoneId1 = 39999951
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999951,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999951,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Phi ¿ng Tß¶ng Không Thú SÑc #GKhiªp !"
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



	elseif GetNumText() == 105 then
	local nStoneId0 = 10554655
	   	local nStoneId1 = 30004031
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=20 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,10554655,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,30004031,20)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 10660005, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Phi thång Nh¤t giai Thanh Long #GBång #GNgßng Ngoa !"
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


	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
		  AddText(sceneId,"Mµt ki®n Bäo bäo Sáo Cûng có th¬ Hóa giäi Xu¤t 30Cái Thánh thú Lân .")
		  --AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W40#cff99ffCái")
		  --AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
		  --AddText(sceneId,"#GTß½ng Ð¯i Ñng Huy­n Thª Trang b¸ #W1#GKi®n")
		  --AddText(sceneId,"#b#GTrang b¸ Chi H°n #W100#cff99ffCái")
		  --AddText(sceneId,"#cFF0000Ð« kÏ :#b#c6699ffThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Nªu không s¨ Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Mãnh h± Hám S½n Thú Träo #GDûng [Hóa giäi]", 6, 200)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Mãnh h± Hám S½n Thú Khôi #GDûng [Hóa giäi]", 6, 201)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Mãnh h± Hám S½n Thú Giáp #GDûng [Hóa giäi]", 6, 202)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Mãnh h± Hám S½n Vòng #GDûng [Hóa giäi]", 6, 203)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Mãnh h± Hám S½n Thú SÑc #GDûng [Hóa giäi]", 6, 204)
			--AddNumText(sceneId, x402323_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Ngoa", 6, 205)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		
	elseif GetNumText() == 200 then
	local nStoneId0 = 39999912
	   	local nStoneId1 = 39999912
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999912,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999912,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Mãnh h± Hám S½n Thú Träo #GDûng !"
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
	local nStoneId0 = 39999922
	   	local nStoneId1 = 39999922
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999922,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999922,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Mãnh h± Hám S½n Thú Khôi #GDûng !"
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
	local nStoneId0 = 39999932
	   	local nStoneId1 = 39999932
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999932,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999932,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Mãnh h± Hám S½n Thú Giáp #GDûng !"
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
	local nStoneId0 = 39999942
	   	local nStoneId1 = 39999942
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999942,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999942,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Mãnh h± Hám S½n Vòng #GDûng !"
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
	local nStoneId0 = 39999952
	   	local nStoneId1 = 39999952
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999952,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999952,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 						
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Mãnh h± Hám S½n Thú SÑc #GDûng !"
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"Mµt ki®n Bäo bäo Sáo Cûng có th¬ Hóa giäi Xu¤t 30Cái Thánh thú Lân .")
		  --AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W80#cff99ffCái")
		  --AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Cñ hùng Hao Lµ Thú Träo #GTrung [Hóa giäi]", 6, 300)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Cñ hùng Hao Lµ Thú Khôi #GTrung [Hóa giäi]", 6, 301)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Cñ hùng Hao Lµ Thú Giáp #GTrung [Hóa giäi]", 6, 302)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Cñ hùng Hao Lµ Vòng #GTrung [Hóa giäi]", 6, 303)
			AddNumText(sceneId, x402323_g_scriptId,"#cff6633Cñ hùng Hao Lµ Thú SÑc #GTrung [Hóa giäi]", 6, 304)
			--AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tam giai Thanh Long #GBång #GNgßng Ngoa", 6, 305)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		
	elseif GetNumText() == 300 then
	local nStoneId0 = 39999913
	   	local nStoneId1 = 39999913
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999913,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999913,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Cñ hùng Hao Lµ Thú Träo #GTrung !"
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
	local nStoneId0 = 39999923
	   	local nStoneId1 = 39999923
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999923,0)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999923,1)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Cñ hùng Hao Lµ Thú Khôi #GTrung !"
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
	local nStoneId0 = 39999933
	   	local nStoneId1 = 39999933
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999933,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999933,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Cñ hùng Hao Lµ Thú Giáp #GTrung !"
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
	local nStoneId0 = 39999943
	   	local nStoneId1 = 39999943
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999943,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999943,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Cñ hùng Hao Lµ Vòng #GTrung !"
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
	local nStoneId0 = 39999953
	   	local nStoneId1 = 39999953
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,39999953,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,39999953,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 		
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 	
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20301009, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Hóa giäi #cff6633Cñ hùng Hao Lµ Thú SÑc #GTrung !"
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Giáp", 6, 400)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Khôi", 6, 401)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Oän", 6, 402)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Thü", 6, 403)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Yêu", 6, 404)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång TÑ giai Thanh Long #GBång #GNgßng Ngoa", 6, 405)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Giáp", 6, 500)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Khôi", 6, 501)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Oän", 6, 502)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Thü", 6, 503)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Yêu", 6, 504)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ngû giai Thanh Long #GBång #GNgßng Ngoa", 6, 505)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Giáp", 6, 600)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Khôi", 6, 601)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Oän", 6, 602)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Thü", 6, 603)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Yêu", 6, 604)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Løc giai Thanh Long #GBång #GNgßng Ngoa", 6, 605)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Giáp", 6, 700)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Khôi", 6, 701)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Oän", 6, 702)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Thü", 6, 703)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Yêu", 6, 704)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Th¤t giai Thanh Long #GBång #GNgßng Ngoa", 6, 705)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Giáp", 6, 800)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Khôi", 6, 801)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Oän", 6, 802)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Thü", 6, 803)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Yêu", 6, 804)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Tiên giai Thanh Long #GBång #GNgßng Ngoa", 6, 805)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
		  AddText(sceneId,"#cFF0000Ð« kÏ :#GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Giáp", 6, 900)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Khôi", 6, 901)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Oän", 6, 902)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Thü", 6, 903)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Yêu", 6, 904)
			AddNumText(sceneId, x402323_g_scriptId,"Phi thång Ph§t Giai Thanh Long #GBång #GNgßng Ngoa", 6, 905)
			AddNumText(sceneId, x402323_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
					x402323_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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
function x402323_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x402323_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

function x402323_ShowRandomSystemNotice(sceneId, selfId, strItemInfo)
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random(1, 4)
	local str
	if nMsgIndex == 1 then
		str = format(x402323_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format(x402323_g_strGongGaoInfo[2], PlayerName, strItemInfo)
	elseif nMsgIndex == 3 then
		str = format(x402323_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	else
		str = format(x402323_g_strGongGaoInfo[4], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
end
