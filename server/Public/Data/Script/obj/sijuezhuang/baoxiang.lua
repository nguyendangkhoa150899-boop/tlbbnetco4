-- 893082 ±¦Ïä
-- .buffµÄ±¦Ïä

x893082_g_scriptId = 893082


--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±íÓÃID¼¯ºÏÊµÏÖ
x893082_g_LimitiBuffCollectionID = 75;

--¸ß¼¶²ÄÁÏ2¼¶£¬50%µôÂäËæ»ú 1 ¼ş
x893082_g_LootItem_3 = {

}

--15¼¶±¦Ê¯£¬100%µôÂäËæ»ú 1 ¼ş
x893082_g_LootItem_2 = {

}

x893082_g_LootItem_5 = {

}

--ÓÆ¾Ã±Ò£¬30%µôÂäËæ»ú 1 ¼ş
x893082_g_LootItem_1 = {

}

--ÖÕ¼«³èÎï£¬20%µôÂäËæ»ú 1 ¼ş
x893082_g_LootItem_4 = {

}
--ÎŞµĞbuff
x893082_g_BuffId_1 = 54

--ÎäÁÖÃËÖ÷buff
x893082_g_BuffId_2 = 8046

--ÇıÉ¢²»¸ÃÓĞµÄBUFFµÄĞ§¹û
x893082_g_BuffId_3 = 8055	--ĞÄÎŞÅÔæğ£¨¿ªÏäÇıÉ¢£©


--ĞÄÎŞÅÔæğBuffID
x893082_g_BuffId_4 = 8056	--ĞÄÎŞÅÔæğ£¨¿ªÏäÃâÒß£©

--Code Check Only
--QUALITY_CREATE_BY_BOSS =nil

--**********************************
--ÊÂ¼şÁĞ±í
--**********************************
function x893082_OnDefaultEvent( sceneId, selfId, targetId )
	
end

--**********************************
--ÌØÊâ½»»¥:Ìõ¼şÅĞ¶Ï
--**********************************
function x893082_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- ÏŞÖÆÉíÉÏµÄbuff
	local bOk = x893082_IsCanOpenBox( sceneId,activatorId )
	
	if bOk == 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"Ngß½i hi®n tÕi không th¬ m· bäo tß½ng");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
	end
	-- ÇıÉ¢²»¸ÃÓĞµÄBUFF²¢Ìí¼ÓĞÄÎŞÅÔæğBuff
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x893082_g_BuffId_3, 0);
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x893082_g_BuffId_4, 0);

	if bOk == 1  then
		local str = "#G[TÑ tuy®t trang]#W" .. GetName(sceneId, activatorId) .."#P"
		CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	end
	
	return bOk
end

--**********************************
-- ¼ì²âµ±Ç°Íæ¼ÒÉíÉÏµÄbuff£¬ÄÜ²»ÄÜ¿ªÆô±¦Ïä
--**********************************
function x893082_IsCanOpenBox( sceneId,activatorId )
		return 1
end

--**********************************
--ÌØÊâ½»»¥:ÏûºÄºÍ¿Û³ı´¦Àí
--**********************************
function x893082_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:¾ÛÆøÀà³É¹¦ÉúĞ§´¦Àí
--**********************************
function x893082_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
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
		if MosDataID == 14156 then
		--if GetName(sceneId, nObjId) == "»ÆÉ«±¦Ïä"  then
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
		nItemId_1 = x893082_g_LootItem_1[random( getn(x893082_g_LootItem_1))]
	end

	if random(1000) <= 50  then
		nItemCount = 4
	       nItemId_3 = x893082_g_LootItem_3[random( getn(x893082_g_LootItem_3) )]
	end	
	if random(1000) <= 150  then
		nItemCount = 5
	       nItemId_6 = x893082_g_LootItem_4[random( getn(x893082_g_LootItem_4) )]
	end

	nItemId_2 = x893082_g_LootItem_2[random( getn(x893082_g_LootItem_2) )]
	nItemId_4 = x893082_g_LootItem_2[random( getn(x893082_g_LootItem_2) )]
	nItemId_5 = x893082_g_LootItem_5[random( getn(x893082_g_LootItem_5) )]
	
	
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
			
			--#P [ÊÀ½ç]ÓÚ¾ÅÁ«´óº°£ºÌìÏÂÓ¢ĞÛÃÇ£¡Ç¿´óµÄAAAÒÑ¾­´ò¿ªÁËÎäÁÖÃËÖ÷µÄ±¦Ïä£¡Çë´ó¼ÒXXXµãÔÙÀ´Phong thi®n thaiÕù¶áÎäÁÖÃËÖ÷Ö®Î»°É£¡
			local str = format("#{SJZ_100129_109}",GetName(sceneId,activatorId))
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
			
		end
	end
	
	return 1
end

--**********************************
--ÌØÊâ½»»¥:Òıµ¼ÀàÃ¿Ê±¼ä¼ä¸ôÉúĞ§´¦Àí
--**********************************
function x893082_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥¿ªÊ¼Ê±µÄÌØÊâ´¦Àí
--**********************************
function x893082_OnActivateActionStart( sceneId, selfId, activatorId )
	--PrintNum(777)
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥³·ÏûÊ±µÄÌØÊâ´¦Àí
--**********************************
function x893082_OnActivateCancel( sceneId, selfId, activatorId )
	local str = "#G[Phong thi®n thai]#W" .. GetName(sceneId,activatorId) .. "#Pm· ra bäo tß½ng có g¡ng s¡ thành lÕi bÕi"
	CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	return 0
end

--**********************************
--ÌØÊâ½»»¥:½»»¥ÖĞ¶ÏÊ±µÄÌØÊâ´¦Àí
--**********************************
function x893082_OnActivateInterrupt( sceneId, selfId, activatorId )
	
	return 0
end

function x893082_OnActivateInterrupt( sceneId, selfId, activatorId )

end

function x893082_DealExp(sceneId, activatorId)

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
