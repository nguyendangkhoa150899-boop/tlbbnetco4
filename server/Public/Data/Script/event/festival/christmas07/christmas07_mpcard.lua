--»î¶¯¡ª¡ª
--Ê¥µ®½ÚÔªµ©»î¶¯-ÊÕ¼¯ÃÅÅÉµÀ¾ß»»½±Àø

--½Å±¾ºÅ
x050025_g_ScriptId = 050025

--x050025_g_EndDayTime = 7290   --»î¶¯½áÊøÊ±¼ä 2007-10-18

x050025_g_FuJieId = 20310010			--·û½ÚID
x050025_g_HeKaId = {
	                 20310011,
	                 20310017,
	                 20310012,
	                 20310019,
	                 20310014,
	                 20310018,
	                 20310015,
	                 20310016,
	                 20310013,	
}			                                   --ºØ¿¨ID


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x050025_OnDefaultEvent( sceneId, selfId, targetId, menpaiId )

	local isTime = x050025_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()
	if NumText == 111 then
	  x050025_GivePlayerFuJie( sceneId, selfId, targetId, menpaiId )
	elseif NumText == 112 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{CHRISTMAS_SHIMEN_HTJS}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x050025_OnEnumerate( sceneId, selfId, targetId )
  
  --¼ì²âÊ±¼äÊÇ·ñÕýÈ·
	local isTime = x050025_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050025_g_ScriptId, "Ð±i Thi®p chúc ngày l­ cüa môn phái", 6, 111 )
	AddNumText(sceneId, x050025_g_ScriptId, "Gi¾i thi®u liên quan ðªn Thi®p chúc ngày l­ cüa môn phái", 11, 112 )													
end

--**********************************
--¼ì²â»î¶¯Ê±¼äÊÇ·ñÕýÈ·
--**********************************
function x050025_CheckRightTime()

	local today = GetDayTime()						--µ±Ç°Ê±¼ä
	--local firstDay = 7357								-- 2007Äê 12 ÔÂ 24 ÈÕ
	--local lastDay = 8007								-- 2008Äê 1  ÔÂ 8  ÈÕ
	local firstDay = 8357								-- 2008Äê 12 ÔÂ 23 ÈÕ
	local lastDay = 9007								-- 2009Äê 1  ÔÂ 8  ÈÕ
	
	-- 12 ÔÂ 31 ÈÕ 0 Ê± ~ 1 ÔÂ 7 ÈÕ 24 Ê±
	if today <= firstDay or today >= lastDay then
		return 0
	end

	return 1

end

--**********************************
--¸øÍæ¼Ò½ÚÈÕºØÌû
--**********************************
function x050025_GivePlayerFuJie( sceneId, selfId, targetId, menpaiId )

	--¹Ø±Õ¶Ô»°´°¿Ú....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

  --Èç¹ûÍæ¼Ò²»ÊÇ¸Ã±¾ÃÅÅÉµÄ²»Óè»»È¡ºØ¿¨
	if menpaiId ~= GetMenPai( sceneId, selfId ) then 
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_004}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--Èç¹ûÍæ¼ÒµÈ¼¶Ð¡ÓÚ25²»Óè»»È¡ºØ¿¨
	if	GetLevel( sceneId, selfId) < 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_005}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--·ñÓÐ1¸ö½ÚÈÕ·û½Ú....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050025_g_FuJieId)
	if itemCount < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_006}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	 
	--¼ì²â²ÄÁÏ°üÊÇ·ñÓÐµØ·½....
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_007}" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--ÊÇ·ñÉ¾³ýÊ§°Ü....
	if 0 == LuaFnDelAvailableItem(sceneId, selfId, x050025_g_FuJieId, 1) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_006}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--¸øÃÅÅÉºØÌû
	if menpaiId == MP_SHAOLIN then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Thiªu Lâm."
	   hekaid = x050025_g_HeKaId[1]
	elseif menpaiId == MP_MINGJIAO then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Minh Giáo."
	   hekaid = x050025_g_HeKaId[2]
	elseif menpaiId == MP_GAIBANG then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Cái Bang."
	   hekaid = x050025_g_HeKaId[3]
	elseif menpaiId == MP_WUDANG then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Võ Ðang."
	   hekaid = x050025_g_HeKaId[4]
	elseif menpaiId == MP_EMEI then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Nga My."
	   hekaid = x050025_g_HeKaId[5]
	elseif menpaiId == MP_XINGSU then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Tinh Túc."
	   hekaid = x050025_g_HeKaId[6]
	elseif menpaiId == MP_DALI then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Thiên Long."
	   hekaid = x050025_g_HeKaId[7]
	elseif menpaiId == MP_TIANSHAN then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Thiên S½n."
	   hekaid = x050025_g_HeKaId[8]
	elseif menpaiId == MP_XIAOYAO then
	   strtext = "Các hÕ thu ðßþc 1 t¤m Thi®p chúc ngày l­ phái Tiêu Dao."
	   hekaid = x050025_g_HeKaId[9]
	end
	
	BeginAddItem( sceneId )
		nIndex = AddItem( sceneId, hekaid, 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	--ÈÕÖ¾Í³¼Æ
	local guid = LuaFnObjId2Guid(sceneId,selfId)
	local log = format("menpaiId=%d", menpaiId)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MPCARD_EXCHANGE, guid, log)
	
	BeginEvent( sceneId )
			AddText( sceneId, strtext )
		EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	--local BagIndex = TryRecieveItem( sceneId, selfId, hekaid, QUALITY_MUST_BE_CHANGE )
	--if BagIndex ~= -1 then
		--BeginEvent( sceneId )
			--AddText( sceneId, strtext )
		--EndEvent( sceneId )
		--DispatchMissionTips( sceneId, selfId )
	--end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x050025_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x050025_OnAccept( sceneId, selfId )
end

--**********************************
--·ÅÆú
--**********************************
function x050025_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x050025_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x050025_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x050025_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x050025_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x050025_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x050025_OnItemChanged( sceneId, selfId, itemdataId )
end
