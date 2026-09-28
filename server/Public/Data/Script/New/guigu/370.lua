--LÕc Dß½ng NPC
--Tr×u Tß·ng 
--Bình thß¶ng 
x760370_g_strGongGaoInfo = {
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt  Cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt  Cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt  Cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
"#HPhßþng minh Bên trong thành Nh¤t ÐÕo kim quang Hi®n lên ,Chï th¤y #{_INFOUSR%s}#HTay Trung Xu¤t hi®n Mµt  Cái Hi hæu v§t Ph¦m #{_INFOMSG%s},Xem ra Nhân gian LÕi mu¯n Nghênh ðón Mµt h°i Huyªt vû tinh phong R°i !", 
}
--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760370_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId," Lúc trß¾c Cüa Thª ngoÕi T¸nh th± Hi®n gi¶ Chiªn loÕn Bay tán loÕn ,Tam ðÕi C± thành Giai Hüy ,Ngày xßa Thª tµc Dã Ðã Tan thành mây khói .G£p phäi Thßþng c± Cß¶ng ð¸ch Dæ Vô thßþng Vß½ng quy«n ,C± Cänh Lu§t pháp Tái Vô ¿¾c thúc Chi uy Nång .#r  Nhi Chß v¸ Anh hùng Hào ki®t ,Chï có Ðoàn kªt TÕi C± Cänh nµi NgoÕi Ð°ng sinh cµng tØ Cüa Huynh ð® ,M¾i có th¬ Ngßng tø ra Nh¤t Không gì phá n±i Cß¶ng lñc .")
		AddText(sceneId," #GM²i tu¥n Nh¸ #W,#GThÑ nåm Vãn 21 Ði¬m #WChí #G21 Ði¬m 30 Phân #WÐúng là CØu Lê Ðóng giæ Hß không Là lúc .Nªu Thiªu hi®p Mang theo Có #YCØu Lê Quân Bài #W,Ngã Li«n có th¬ Trþ Ngß½i Lçn vào #GQuân Thiên #W,#GTri«u Kinh #W,#GLa Phù #WTam Thành Bên trong ,Ngh¸ch t§p CØu Lê ,CÑu v¾t C± Cänh Thß½ng sinh .")
			--AddNumText(sceneId, x760370_g_scriptId,"Nghi«n nát CØu Lê C¯t Ph¤n", 6, 2000)
			AddNumText(sceneId, x760370_g_ScriptId,"Ngh¸ch t§p Quân Thiên Thành", 9, 2001)
			AddNumText(sceneId, x760370_g_ScriptId,"Ngh¸ch t§p La Phù Thành", 9, 2002)
			AddNumText(sceneId, x760370_g_ScriptId,"Ngh¸ch t§p Tri«u Kinh thành", 9, 2003)
			AddNumText(sceneId, x760370_g_ScriptId,"V« Nghi«n nát CØu Lê C¯t Ph¤n", 11, 2004)		
			AddNumText(sceneId, x760370_g_ScriptId,"V« Ngh¸ch t§p CØu Lê", 11, 2005)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760370_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 2001 then		--Quân Thiên Thành 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 560, 57, 75, 10)
		return
	end		
	if GetNumText() == 2002 then		--La Phù Thành 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 561, 78, 200, 10)
		return
	end
	if GetNumText() == 2003 then		--Tri«u Kinh thành 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 562, 196,188, 10)
		return
	end		
	if GetNumText() == 2004 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{NXJL_140210_22}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText() == 2005 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{NXJL_140210_21}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	

	if GetNumText() == 2000 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#{WHOATN_12103146_01}")
			AddNumText(sceneId, x760370_g_scriptId,"Tß½ng 1 Cái C¯t Ðiêu Nghi«n nát Vi 1 Phân C¯t Ph¤n", 6, 3001)
			AddNumText(sceneId, x760370_g_scriptId,"Tß½ng 10 Cái C¯t Ðiêu Nghi«n nát Vi 11 Phân C¯t Ph¤n", 6, 3002)
			AddNumText(sceneId, x760370_g_scriptId,"Tß½ng 50 Cái C¯t Ðiêu Nghi«n nát Vi 65 Phân C¯t Ph¤n", 6, 3003)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif GetNumText() == 3001 then
	local nStoneId0 = 20700066
	   	local nStoneId1 = 20700066
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=1 and c1>=1 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700066,1)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700066,0)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760370_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Nghi«n nát Xu¤t 1 Phân C¯t Ph¤n ,Th§t là Th§t ðáng m×ng !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo C¯t Ðiêu S¯ lßþng Không ðü A ,Chï sþ Nghi«n nát Không ra  Cái này  Phân lßþng C¯t Ph¤n ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end


	elseif GetNumText() == 3002 then
	local nStoneId0 = 20700066
	   	local nStoneId1 = 20700066
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=10 and c1>=10 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700066,5)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700066,5)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760370_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Nghi«n nát Xu¤t 11 Phân C¯t Ph¤n ,Th§t là Th§t ðáng m×ng !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo C¯t Ðiêu S¯ lßþng Không ðü A ,Chï sþ Nghi«n nát Không ra  Cái này  Phân lßþng C¯t Ph¤n ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end

	elseif GetNumText() == 3003 then
	local nStoneId0 = 20700066
	   	local nStoneId1 = 20700066
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
      if c0>=50 and c1>=50 then
				BeginEvent(sceneId) 
					LuaFnDelAvailableItem(sceneId,selfId,20700066,25)--C¡t bö V§t ph¦m 
					LuaFnDelAvailableItem(sceneId,selfId,20700066,25)--C¡t bö V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 
					local bagpos01 = TryRecieveItem(sceneId, selfId, 20700067, 1)--Cho V§t ph¦m 					
				   local szItemTransfer = GetBagItemTransfer(sceneId, selfId, bagpos01)
					x760370_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
					strText ="#GChúc m×ng Ngài ,Thành công Nghi«n nát Xu¤t 65 Phân C¯t Ph¤n ,Th§t là Th§t ðáng m×ng !"
					AddText(sceneId, strText)
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
          else
        	BeginEvent(sceneId) 
					strText ="Ngß½i S· mang theo C¯t Ðiêu S¯ lßþng Không ðü A ,Chï sþ Nghi«n nát Không ra  Cái này  Phân lßþng C¯t Ph¤n ."
					AddText(sceneId, strText)					
				EndEvent(sceneId)
        	DispatchEventList(sceneId, selfId, targetId)
			end
			

	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
		  AddText(sceneId,"#cFF0000Ð« kÏ Phi thång Nh¸ giai Trang phøc Yêu c¥u Tiêu hao Ð¯i Ñng Trang b¸ 1Ki®n")
		  AddText(sceneId,"#b#GTh¥n gi¾i Chi ThÕch #W40#cff99ff Cái")
		  AddText(sceneId,"#cFF0000Ð« kÏ: #GThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Ð¬ tránh Ðá quý Biªn m¤t .")
		  --AddText(sceneId,"#GTß½ng Ð¯i Ñng Huy­n Thª Trang b¸ #W1#GKi®n")
		  --AddText(sceneId,"#b#GTrang b¸ Chi H°n #W100#cff99ff Cái")
		  --AddText(sceneId,"#cFF0000Ð« kÏ: #b#c6699ffThao tác Ti«n ,M¶i Tiên Bö ði Ðá quý ,Nªu không s¨ Biªn m¤t .")
			AddNumText(sceneId, x760370_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Giáp", 6, 200)
			AddNumText(sceneId, x760370_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Khôi", 6, 201)
			AddNumText(sceneId, x760370_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Oän", 6, 202)
			AddNumText(sceneId, x760370_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Thü", 6, 203)
			AddNumText(sceneId, x760370_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Yêu", 6, 204)
			AddNumText(sceneId, x760370_g_scriptId,"Phi thång Nh¸ giai Thanh Long #GBång #GNgßng Ngoa", 6, 205)
			AddNumText(sceneId, x760370_g_scriptId,"#b#GTa là Tao Niên hÕ ThÑ LÕi ðªn", 9, 4)
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
					x760370_ShowRandomSystemNotice(sceneId, selfId, szItemTransfer)
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

		return
	end
end
--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760370_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760370_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

function x760370_ShowRandomSystemNotice(sceneId, selfId, strItemInfo)
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random(1, 4)
	local str
	if nMsgIndex == 1 then
		str = format(x760370_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format(x760370_g_strGongGaoInfo[2], PlayerName, strItemInfo)
	elseif nMsgIndex == 3 then
		str = format(x760370_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	else
		str = format(x760370_g_strGongGaoInfo[4], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
end
