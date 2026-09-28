-- 210535 ±¦Ïä
-- »ñÈ¡buffµÄ±¦Ïä

x210535_g_scriptId = 210535


--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±íÓÃID¼¯ºÏÊµÏÖ
x210535_g_LimitiBuffCollectionID = 75;

--ÖÕ¼«ÎäÆ÷£¬50%µôÂäËæ»ú 1 ¼ş
x210535_g_LootItem_3 = {
39910001,39910002,39910003,39910004,
}

--15¼¶±¦Ê¯£¬100%µôÂäËæ»ú 1 ¼ş
x210535_g_LootItem_2 = {
50701001,50701002,50702005,
50702006,50702007,50702008,50703001,50704002,50711001,50711002,50712005,
50712006,50712007,50712008,50713001,50713002,50713003,50713004,50713005,
50713006,50714001,
}


x210535_g_LootItem_5 = {
50801001,50801002,50802005,50802006,50802007,50802008,50803001,50804002,
50811001,50811002,50812005,50812006,50812007,50812008,50813001,50813002,
50813003,50813004,50813005,50813006,50814001,
}
--ÖÕ¼«³èÎï£¬30%µôÂäËæ»ú 1 ¼ş
x210535_g_LootItem_1 = {
10300100,10300101,10300102,10301100,10301101,10301102,10301200,10301201,
10301202,10300101,10300102,10302100,10302101,10302102,10303100,10303101,
10303102,10303200,10303201,10303202,10304100,10304101,10304102,10305100,
10305101,10305102,10305200,10305201,10305202,
}
--ÖÕ¼«±¦Ê¯£¬20%µôÂäËæ»ú 1 ¼ş
x210535_g_LootItem_4 = {
30302527,30302528,30302529,30302530,30302531,30302532,
}
--ÎŞµĞbuff
x210535_g_BuffId_1 = 54

--ÎäÁÖÃËÖ÷buff
x210535_g_BuffId_2 = 8046

--ÇıÉ¢²»¸ÃÓĞµÄBUFFµÄĞ§¹û
x210535_g_BuffId_3 = 8055	--ĞÄÎŞÅÔæğ£¨¿ªÏäÇıÉ¢£©


--ĞÄÎŞÅÔæğBuffID
x210535_g_BuffId_4 = 8056	--ĞÄÎŞÅÔæğ£¨¿ªÏäÃâÒß£©

--Code Check Only
--QUALITY_CREATE_BY_BOSS =nil

--**********************************
--ÊÂ¼şÁĞ±í
--**********************************
function x210535_OnDefaultEvent( sceneId, selfId, targetId )
	
end

--**********************************
--ÌØÊâ½»»¥:Ìõ¼şÅĞ¶Ï
--**********************************
function x210535_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- ÏŞÖÆÉíÉÏµÄbuff
	local bOk = x210535_IsCanOpenBox( sceneId,activatorId )
	
	if bOk == 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"Các hÕ hi®n tÕi không th¬ m· Bäo Sß½ng này.");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
	end
	-- ÇıÉ¢²»¸ÃÓĞµÄBUFF²¢Ìí¼ÓĞÄÎŞÅÔæğBuff
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x210535_g_BuffId_3, 0);
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x210535_g_BuffId_4, 0);

	if GetUnitCampID(sceneId, activatorId, activatorId) < 500   then
    BeginEvent(sceneId)
      AddText(sceneId,"Ngß½i hi®n tÕi chiªn ğ¤u tr§n doanh xác thñc b¤t chính, không th¬ m· ra bäo sß½ng.");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
		bOk = 0
	end
	
	if bOk == 1  then
		local str = "#G[Phong Thi«n Ğài]#W" .. GetName(sceneId, activatorId) .."#PĞang có ı ğ° m· ra bäo sß½ng!"
		CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	end
	
	return bOk
end

--**********************************
-- ¼ì²âµ±Ç°Íæ¼ÒÉíÉÏµÄbuff£¬ÄÜ²»ÄÜ¿ªÆô±¦Ïä
--**********************************
function x210535_IsCanOpenBox( sceneId,activatorId )
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId,activatorId, x210535_g_BuffId_2)==1  then
		return 0
	end

	return 0==LuaFnHaveImpactInSpecificCollection(sceneId, activatorId, x210535_g_LimitiBuffCollectionID)
end

--**********************************
--ÌØÊâ½»»¥:ÏûºÄºÍ¿Û³ı´¦Àí
--**********************************
function x210535_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:¾ÛÆøÀà³É¹¦ÉúĞ§´¦Àí
--**********************************
function x210535_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- selfId == ±¦ÏäId
	-- activatorId == ¿ªÆôÈËId
	
	local x
	local z
	
	x,z = GetWorldPos(sceneId, selfId)
	
	local nCount = GetMonsterCount(sceneId)
	local bDelOk = 0
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 39775 then
			bDelOk = 1
			LuaFnDeleteMonster(sceneId, nObjId)
		end
	end
	
	-- ¸ø¿ªÆô³É¹¦µÄÍæ¼ÒÒ»¸öµôÂä°ü
	local nItemCount = 2
	local nItemId_1
	local nItemId_2
	local nItemId_3
	local nItemId_4
	local nItemId_5
	local nItemId_6

	if random(1000) <= 900  then
		nItemCount = 3
		nItemId_1 = x210535_g_LootItem_1[random( getn(x210535_g_LootItem_1))]
	end

	if random(1000) <= 50  then
		nItemCount = 4
	       nItemId_3 = x210535_g_LootItem_3[random( getn(x210535_g_LootItem_3) )]
	end	
	if random(1000) <= 150  then
		nItemCount = 5
	       nItemId_6 = x210535_g_LootItem_4[random( getn(x210534_g_LootItem_4) )]
	end

	nItemId_2 = x210535_g_LootItem_2[random( getn(x210535_g_LootItem_2) )]
	nItemId_4 = x210535_g_LootItem_2[random( getn(x210535_g_LootItem_2) )]
	nItemId_5 = x210535_g_LootItem_5[random( getn(x210535_g_LootItem_5) )]
	
	
	if bDelOk == 1  then
		local nBoxId = DropBoxEnterScene(	x,z,sceneId )
		if nBoxId > -1  then
			if nItemCount == 3  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,4,
								nItemId_1,nItemId_2,nItemId_4,nItemId_5)
			elseif nItemCount == 2  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,3,
								nItemId_2,nItemId_4,nItemId_5)
			elseif nItemCount == 4  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,4,
								nItemId_2,nItemId_3,nItemId_4,nItemId_5)

			elseif nItemCount == 5  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,5,
								nItemId_2,nItemId_3,nItemId_4,nItemId_5,nItemId_6)
			end
			
			-- °ÑÕâ¸öµôÂä°ó¶¨¸øÖÆ¶¨Íæ¼Ò
			SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,activatorId))
			
			-- ·¢ËÍÏµÍ³¹«¸æ
			local nCurHour = GetHour()
			if nCurHour==0 or nCurHour==2 or nCurHour==4 or
				 nCurHour==6 or nCurHour==8 or nCurHour==10 or
				 nCurHour==12 or nCurHour==14 or nCurHour==16 or
				 nCurHour==18 or nCurHour==20 or nCurHour==22  then
				
					nCurHour = nCurHour + 2
			else
					nCurHour = nCurHour + 1
			
			end
			
			if nCurHour >= 2 and nCurHour < 10  then
				nCurHour = 10
			end
			
			if nCurHour == 24  then
				nCurHour = 0
			end
			
			--#P [ÊÀ½ç]ÓÚ¾ÅÁ«´óº°£ºÌìÏÂÓ¢ĞÛÃÇ£¡Ç¿´óµÄAAAÒÑ¾­´ò¿ªÁËÎäÁÖÃËÖ÷µÄ±¦Ïä£¡Çë´ó¼ÒXXXµãÔÙÀ´Phong Thi«n ĞàiÕù¶áÎäÁÖÃËÖ÷Ö®Î»°É£¡
			local str = format("#YVu CØu Liên #Phô to: Thiên hÕ các nhóm anh hùng! Cß¶ng ğÕi #{_INFOUSR%s}#P ğã mu¯n m· ra võ lâm minh chü bäo stß½ng! Thïnh m÷i ngß¶i #Y%s ği¬m 45 phân #Pğªn #GPhong Thi«n Ğài#P tranh ğoÕt danh v¸ võ lâm minh chü ği!",GetName(sceneId,activatorId),nCurHour)
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
			
		end
	end
	
	-- ÔÚÕâÀï¼ÇÂ¼¿ªÆô±¦ÏäµÄÈÕÖ¾
	LuaFnAuditPlayerBehavior(sceneId, activatorId, "M· ra minh chü bäo sß½ng");
	
	-- ¸øÕâ¸öÍæ¼ÒÒ»¸öbuff
	LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x210535_g_BuffId_1, 100 )
	
	LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x210535_g_BuffId_2, 100 )
										
	x210535_DealExp(sceneId, activatorId)
	
	return 1
end

--**********************************
--ÌØÊâ½»»¥:Òıµ¼ÀàÃ¿Ê±¼ä¼ä¸ôÉúĞ§´¦Àí
--**********************************
function x210535_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥¿ªÊ¼Ê±µÄÌØÊâ´¦Àí
--**********************************
function x210535_OnActivateActionStart( sceneId, selfId, activatorId )
	--PrintNum(777)
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥³·ÏûÊ±µÄÌØÊâ´¦Àí
--**********************************
function x210535_OnActivateCancel( sceneId, selfId, activatorId )
	local str = "#G[Phong Thi«n Ğài]#W" .. GetName(sceneId,activatorId) .. "#PM· ra bäo sß½ng  c¯ g¡ng s¡p thành lÕi bÕi!"
	CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	return 0
end

--**********************************
--ÌØÊâ½»»¥:½»»¥ÖĞ¶ÏÊ±µÄÌØÊâ´¦Àí
--**********************************
function x210535_OnActivateInterrupt( sceneId, selfId, activatorId )
	
	return 0
end

function x210535_OnActivateInterrupt( sceneId, selfId, activatorId )

end

function x210535_DealExp(sceneId, activatorId)

	local nPlayerCamp = GetUnitCampID(sceneId, activatorId, activatorId)

	-- ¿ªÆô±¦ÏäµÄÍ¬Ê±£¬·ÖÅäExp
	local nHumanIdList = {}
	
	for i=1, 10  do
		nHumanIdList[i] = -1
	end
	
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local j=1
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) == nPlayerCamp   then
			nHumanIdList[j] = nHumanId
			j = j+1
		end
	end
	
	j = j-1
	
	for i=1, j  do
		if nHumanIdList[i] ~= -1  then
			AddExp(sceneId, nHumanIdList[i], floor(10000000/j))
		end
	end
	
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) ~= nPlayerCamp   then
			AddExp(sceneId, nHumanId, floor(10000000/(nHumanCount-j)))
		end
	end
	
end

--¾­Ñé£¬
--ºÍ¿ª±¦ÏäµÄÈËÏàÍ¬ÕóÓªµÄÈËÆ½·Ö 10 Íò
--ÔÚ³¡µÄ³ıÕâĞ©ÈËÒÔÍâµÄÈËÆ½·Ö 10 Íò
