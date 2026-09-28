-- 210537 ±¦Ïä
-- »ñÈ¡buffµÄ±¦Ïä

x210537_g_scriptId = 210537


--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±íÓÃID¼¯ºÏÊµÏÖ
x210537_g_LimitiBuffCollectionID = 75;

--ÖÕ¼«ÎäÆ÷£¬50%µôÂäËæ»ú 1 ¼ş
x210537_g_LootItem_1 = {30505167,30505167,
}

--15¼¶±¦Ê¯£¬100%µôÂäËæ»ú 1 ¼ş
x210537_g_LootItem_2 = {30505167,30505167,
}

--ÖÕ¼«³èÎï£¬30%µôÂäËæ»ú 1 ¼ş
x210537_g_LootItem_3 = {30505167,30505167,
}

--ÎŞµĞbuff
x210537_g_BuffId_1 = 54

--ÎäÁÖÃËÖ÷buff
x210537_g_BuffId_2 = 8046

--ÇıÉ¢²»¸ÃÓĞµÄBUFFµÄĞ§¹û
x210537_g_BuffId_3 = 8055	--ĞÄÎŞÅÔæğ£¨¿ªÏäÇıÉ¢£©

-- ÖÕ½áÕßÔÚ Ë«Êı´ÎË¢
x210537_g_Npc_9_1={	{id=39779,x=81,y=99,script=210539,pp=4,camp=110,ai=21,af=253},
										{id=39779,x=82,y=98,script=210539,pp=4,camp=110,ai=21,af=253},

}

--ĞÄÎŞÅÔæğBuffID
x210537_g_BuffId_4 = 8056	--ĞÄÎŞÅÔæğ£¨¿ªÏäÃâÒß£©

--Code Check Only
--QUALITY_CREATE_BY_BOSS =nil

--**********************************
--ÊÂ¼şÁĞ±í
--**********************************
function x210537_OnDefaultEvent( sceneId, selfId, targetId )
	
end

--**********************************
--ÌØÊâ½»»¥:Ìõ¼şÅĞ¶Ï
--**********************************
function x210537_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- ÏŞÖÆÉíÉÏµÄbuff
	local bOk = x210537_IsCanOpenBox( sceneId,activatorId )
	
	if bOk == 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"Các hÕ hi®n tÕi không th¬ m· Bäo Sß½ng này.");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
	end
	-- ÇıÉ¢²»¸ÃÓĞµÄBUFF²¢Ìí¼ÓĞÄÎŞÅÔæğBuff
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x210537_g_BuffId_3, 0);
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x210537_g_BuffId_4, 0);

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
function x210537_IsCanOpenBox( sceneId,activatorId )
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId,activatorId, x210537_g_BuffId_2)==1  then
		return 0
	end

	return 0==LuaFnHaveImpactInSpecificCollection(sceneId, activatorId, x210537_g_LimitiBuffCollectionID)
end

--**********************************
--ÌØÊâ½»»¥:ÏûºÄºÍ¿Û³ı´¦Àí
--**********************************
function x210537_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:¾ÛÆøÀà³É¹¦ÉúĞ§´¦Àí
--**********************************
function x210537_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- selfId == ±¦ÏäId
	-- activatorId == ¿ªÆôÈËId
	
	local x
	local z
	
	x,z = GetWorldPos(sceneId, selfId)
	
	local nCount = GetMonsterCount(sceneId)
	local bDelOk = 0
	for i=0, nCount-1  do
		local tempCamp = random(449) + 50
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 39777 then
			bDelOk = 1
			LuaFnDeleteMonster(sceneId, nObjId)
		       nObjID = LuaFnCreateMonster(sceneId, 39779, 81, 99, 1, 253, 210547);
			SetCharacterTitle(sceneId, nObjID, "Minh Chü Ğ£c SÑ");
		       SetMonsterFightWithNpcFlag(sceneId, nObjID, 0)
		       SetUnitCampID(sceneId, nObjID, nObjID, tempCamp)
		end
	end

	-- ¸ø¿ªÆô³É¹¦µÄÍæ¼ÒÒ»¸öµôÂä°ü
	local nItemCount = 2
	local nItemId_1
	local nItemId_2
	local nItemId_3

	if random(1000) <= 125  then
		nItemCount = 3
		nItemId_1 = x210537_g_LootItem_1[random( getn(x210537_g_LootItem_1))]
	end

	if random(1000) <= 50  then
		nItemCount = 4
	       nItemId_3 = x210537_g_LootItem_3[random( getn(x210537_g_LootItem_3) )]
	end	

	nItemId_2 = x210537_g_LootItem_2[random( getn(x210537_g_LootItem_2) )]
	
	
	if bDelOk == 1  then
		local nBoxId = DropBoxEnterScene(	x,z,sceneId )
		if nBoxId > -1  then
			if nItemCount == 3  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,4,
								nItemId_1,nItemId_2,nItemId_2,nItemId_2)
			elseif nItemCount == 2  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,3,
								nItemId_2,nItemId_2,nItemId_2)
			elseif nItemCount == 4  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,4,
								nItemId_2,nItemId_3,nItemId_2,nItemId_2)
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
			--local str = format("#YVu CØu Liên #cff99cc hô to: Thiên hÕ anh hùng! #{_INFOUSR%s}#cff99cc ğã m· CÕnh KÛ Trß¶ng Bäo Sß½ng! M· Bäo Sß½ng s¨ ğÕt ğßşc ĞÕt ğßşc Ti«m Nång Ğan, vû khí B±ng B±ng ğß¶ng, trân thú Huy­n Hóa, võ h°n ám khí, trang b¸ Trùng Lâu, Bäo ThÕch C¤p 9 #Y. Các v¸ anh hùng, ğªn %d gi¶ ta hãy ğşi d¸p khác tiªp tøc ğoÕt l¤y báu v§t nào!",GetName(sceneId,activatorId),nCurHour)
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
			
		end
	end
	
	-- ÔÚÕâÀï¼ÇÂ¼¿ªÆô±¦ÏäµÄÈÕÖ¾
	LuaFnAuditPlayerBehavior(sceneId, activatorId, "M· ra minh chü bäo sß½ng");

	
	-- ¸øÕâ¸öÍæ¼ÒÒ»¸öbuff
	LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x210537_g_BuffId_1, 100 )
	
	LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x210537_g_BuffId_2, 100 )
										
	x210537_DealExp(sceneId, activatorId)

	x210537_TipAllHuman(sceneId, "Chú ı, có kë ğang c¯ tình phá hoÕi Bäo Sß½ng, m÷i ngß¶i hãy ğªn ngån cän h¡n lÕi!")
	x210537_TipAllHuman(sceneId, "Chú ı, có kë ğang c¯ tình phá hoÕi Bäo Sß½ng, m÷i ngß¶i hãy ğªn ngån cän h¡n lÕi!")
	x210537_TipAllHuman(sceneId, "Chú ı, có kë ğang c¯ tình phá hoÕi Bäo Sß½ng, m÷i ngß¶i hãy ğªn ngån cän h¡n lÕi!")
	x210537_TipAllHuman(sceneId, "Chú ı, có kë ğang c¯ tình phá hoÕi Bäo Sß½ng, m÷i ngß¶i hãy ğªn ngån cän h¡n lÕi!")
	x210537_TipAllHuman(sceneId, "Chú ı, có kë ğang c¯ tình phá hoÕi Bäo Sß½ng, m÷i ngß¶i hãy ğªn ngån cän h¡n lÕi!")
	x210537_TipAllHuman(sceneId, "Chú ı, có kë ğang c¯ tình phá hoÕi Bäo Sß½ng, m÷i ngß¶i hãy ğªn ngån cän h¡n lÕi!")
	
	return 1
end

--**********************************
--ÌØÊâ½»»¥:Òıµ¼ÀàÃ¿Ê±¼ä¼ä¸ôÉúĞ§´¦Àí
--**********************************
function x210537_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥¿ªÊ¼Ê±µÄÌØÊâ´¦Àí
--**********************************
function x210537_OnActivateActionStart( sceneId, selfId, activatorId )
	--PrintNum(777)
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥³·ÏûÊ±µÄÌØÊâ´¦Àí
--**********************************
function x210537_OnActivateCancel( sceneId, selfId, activatorId )
	local str = "#G[Phong Thi«n Ğài]#W" .. GetName(sceneId,activatorId) .. "#PM· ra bäo sß½ng  c¯ g¡ng s¡p thành lÕi bÕi!"
	CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	return 0
end

function x210537_CreateMonster_7_3(sceneId)
	local posX, posZ;
	posX, posZ = LuaFnGetWorldPos(sceneId, selfId)
	for i, Npc in x210537_g_Npc_9_1  do
		local nNpcId = x210537_CreateNpc(sceneId, Npc.id, posX, posZ, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
--ÌáÊ¾ËùÓĞ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x210537_TipAllHuman( sceneId, Str )
	-- »ñµÃ³¡¾°ÀïÍ·µÄËùÓĞÈË
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- Ã»ÓĞÈËµÄ³¡¾°£¬Ê²Ã´¶¼²»×ö
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end
--**********************************
--ÌØÊâ½»»¥:½»»¥ÖĞ¶ÏÊ±µÄÌØÊâ´¦Àí
--**********************************
function x210537_OnActivateInterrupt( sceneId, selfId, activatorId )
	
	return 0
end

function x210537_OnActivateInterrupt( sceneId, selfId, activatorId )

end

function x210537_DealExp(sceneId, activatorId)

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
