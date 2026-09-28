--VÕn v§t 3Thu v« Công nång SØa ð±i 
function x760604_HY_HUISou(sceneId, selfId, g_Zhen_chonglouhuishou_ItemPos)
	if g_Zhen_chonglouhuishou_ItemPos ==-1 then
  return		
	end
local GemItemID1 = LuaFnGetItemTableIndexByIndex(sceneId, selfId, g_Zhen_chonglouhuishou_ItemPos)
--B¡t ð¥u Ð±i ti«n 
	if 	GemItemID1 == 30509014 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30509014, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30900015 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30900015, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 19
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30900013 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30900013, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
		
 elseif 	GemItemID1 == 30505800 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505800, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 750
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505801 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505801, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505802 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505802, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1750
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505803 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505803, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505804 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505804, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2750
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505805 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505805, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505806 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505806, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3750
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30900016 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30900016, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 199
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20500003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20500003, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20501003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20501003, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20502003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20502003, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310185 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310185, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310186 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310186, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310187 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310187, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310188 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310188, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310189 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310189, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310190 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310190, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20500004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20500004, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20501004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20501004, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20502004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20502004, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000951 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000951, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 50000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000952 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000952, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 50000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000199 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000199, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38002015 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002015, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 4000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38002016 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002016, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 4000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 10157001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,10157001, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 120
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000184 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000184, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1700
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000185 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000185, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000186 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000186, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310181 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310181, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310182 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310182, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310183 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310183, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 20310180 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310180, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 40
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001111 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001111, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001121 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001121, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001131 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001131, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001141 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001141, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001151 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001151, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001161 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001161, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001211 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001211, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001221 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001221, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 331001231 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001231, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001241 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001241, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001251 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001251, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001261 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001261, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001311 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001311, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001321 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001321, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001331 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001331, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001341 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001341, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001351 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001351, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001361 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001361, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001411 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001411, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001431 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001431, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001441 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001441, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001451 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001451, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 31001461 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001461, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000946 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000946, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000949 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000949, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000947 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000947, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 10000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000950 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000950, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 10000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000396 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000396, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 225
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000397 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000397, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 675
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000398 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000398, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2640
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000399 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000399, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 450
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000400 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000400, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 38000401 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000401, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 39999901 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,39999901, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 75
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
 elseif 	GemItemID1 == 30505814 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505814, 1)--San 
		if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
		
		---------------------------------------------------------
		
		
   elseif 	GemItemID1 == 38000531 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000531, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
		
	   elseif 	GemItemID1 == 38001554 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001554, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 340
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
		  elseif 	GemItemID1 == 30008048 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30008048, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
		  elseif 	GemItemID1 == 31001470 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001470, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 31001471 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001471, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 31001472 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001472, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 31001473 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001473, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 31001474 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001474, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 31001469 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001469, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 31001468 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001468, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 31001467 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001467, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001097 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001097, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1200
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001098 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001098, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001099 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001099, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 4500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001100 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001100, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001021 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001021, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1250
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001103 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001103, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 4500
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 38001104 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001104, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 4600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001105 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001105, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001106 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001106, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 6600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001107 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001107, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 7600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001108 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001108, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 8600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001109 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001109, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 9600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001110 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001110, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 10600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001111 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001111, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 11600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 20310166 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310166, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 100
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 20310167 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310167, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 100
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 20310168 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310168, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 100
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38000448 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000448, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 100
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20309101 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20309101, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20309102 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20309102, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 120
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20309103 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20309103, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20309104 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20309104, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20309105 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20309105, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 15000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30505816 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505816, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 10000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310123 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310123, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 144
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310124 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310124, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 432
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310125 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310125, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1296
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310126 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310126, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3888
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 20310132 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310132, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 144
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310133 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310133, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 432
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310134 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310134, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1296
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310135 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310135, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3888
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310141 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310141, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 144
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310142 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310142, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 432
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310143 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310143, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1296
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310144 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310144, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3888
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310150 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310150, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 144
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310151 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310151, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 432
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310152 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310152, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1296
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310153 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310153, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3888
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002041 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002041, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 90
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002043 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002043, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 90
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002045 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002045, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 90
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002049 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002049, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 115
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30505815 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505815, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 60
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310177 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310177, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 175
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 20310178 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310178, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 275
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310179 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310179, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 425
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310196 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310196, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 600
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20700055 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20700055, 1)--San --Ðªn n½i ðây 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 150
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20700063 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20700063, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 150
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 31001475 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001475, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 199
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 31001476 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,31001476, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002011 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002011, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002012 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002012, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 400
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38002013 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002013, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38002014 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38002014, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001000 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001000, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 38001009 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001009, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001010 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001010, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001011 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001011, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001012 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001012, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001013 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001013, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001014 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001014, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001015 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001015, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001016 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001016, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001017 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001017, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001018 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001018, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38001019 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38001019, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 2000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38000639 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000639, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 800
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38000200 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000200, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 8000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30505817 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505817, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 170
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30505818 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505818, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30505819 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505819, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 420
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 38000571 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,38000571, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 125
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310159 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310159, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 40
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310113 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310113, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 175
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310114 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310114, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 175
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 20310020 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310020, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 25
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20310021 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20310021, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 25
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30501318 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30501318, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 100
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30503034 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30503034, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 225
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30503043 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30503043, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 225
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30503052 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30503052, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 225
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30503061 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30503061, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 225
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30503176 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30503176, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 225
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 20301009 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,20301009, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 72
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30505258 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30505258, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 50
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 30600084 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30600084, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 120
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 30103040 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,30103040, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 425
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50301001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50301001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50301002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50301002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50302007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50302008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50302008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50303001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50303001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50303002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50303002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50311001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50311001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50311002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50311002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50312008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50312008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 270
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50313001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50313001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50313002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50313002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50313003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50313003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50313004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50313004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50313005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50313005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50313006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50313006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50314001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50314001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50321001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50321001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 860
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50321002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50321002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 860
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50321003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50321003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 860
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50321004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50321004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 860
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 10156100 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,10156100, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 90
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 10156200 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,10156200, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 90
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 10157002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,10157002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 240
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50401001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50401001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50401002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50401002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50402001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50402008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50402008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50403001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50403001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50404002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50404002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50411001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50411001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50411002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50411002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50412007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50412008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50412008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1169
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50413001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50413001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50413002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50413002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50413003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50413003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50413004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50413004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50413005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50413005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50413006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50413006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50414001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50414001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 1069
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50421001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50421001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3557
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50421002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50421002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3557
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50421003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50421003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3557
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50421004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50421004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 3557
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50501001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50501001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50501002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50501002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50502001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50502002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50502003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50502004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50502005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50502006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50502007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50502008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50502008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50503001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50503001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50504002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50504002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50511001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50511001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50511002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50511002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50512005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50512008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50512008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5724
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50513001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50513001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50513002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50513002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50513003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50513003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50513004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50513004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50513005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50513005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50513006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50513006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		
		  elseif 	GemItemID1 == 50514001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50514001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 5544
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50521001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50521001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 17272
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50521002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50521002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 17272
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50521003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50521003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 17272
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50521004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50521004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 17272
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50601001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50601001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50601002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50601002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50602001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50602002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50602003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)	
		  elseif 	GemItemID1 == 50602004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50602005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50602006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50602007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50602008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50602008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50603001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50603001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50604002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50604002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50611001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50611001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50611002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50611002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612007 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612007, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50612008 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50612008, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24300
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50613001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50613001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50613002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50613002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50613003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50613003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50613004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50613004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50613005 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50613005, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50613006 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50613006, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50614001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50614001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 24000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50621001 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50621001, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 73000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50621002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50621002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 73000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50621003 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50621003, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 73000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50621004 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50621004, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 73000
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		  elseif 	GemItemID1 == 50304002 then
	local	aa1 = LuaFnDelAvailableItem(sceneId,selfId,50304002, 1)--San 
	if aa1 == -1 then
			x760604_NotifyFailTips(sceneId, selfId,"V§t ph¦m Kh¤u l¤y Th¤t bÕi")
			return
		end
   local YB = 210
	YuanBao(sceneId,selfId,-1,1,YB)
	local str =""
			str = format("#GChúc m×ng Ngß¶i ch½i ".." [#{_INFOUSR%s}] #YSØ døng Tùy thân Nguyên bäo Thu v« Công nång Thành công Hoán Ðßþc #G["..YB.."] #YNguyên bäo .#56#56", GetName(sceneId,selfId),bagindex)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,148, 0)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)		


		
	end		
end

function x760604_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
