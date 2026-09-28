--Éú³¤µã½Å±¾£¬²Ï¶¹2
--½Å±¾ºÅ
--g_ScriptId = 711028

--´ËÉú³¤µã±àºÅ
x711028_g_GpId = 529

--ÏÂÒ»¸öÉú³¤µãµÄ±àºÅ
x711028_g_GpIdNext = 530

function	 x711028_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711028_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,1,20104010)
	
	--µÃµ½Éú³¤µãµÄÖ÷ÈËID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--²ÎÊýÊÇSceneID£¬ItemBoxID
	--¸øItemBoxÉè¶¨Ö÷ÈË
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,600000)	--Éè¶¨°ó¶¨Ê±¼ä
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--±£»¤Ê±¼ä¿ªÊ¼¼ÆÊ±

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--Éè¶¨»ØÊÕÊ±¼ä

	--È¡µÃÉú³¤µãµÄ×ø±ê
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--ÏÂÈ¡Õû
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--ÅÐ¶ÏÖÖÖ²ÅÆµÄÎ»ÖÃÔÚÄÄ¸öÖÖÖ²ÅÆ¹ÜÏ½µÄ·¶Î§ÄÚ
	local num = 0
	for i, findid in PLANTNPC_ADDRESS do
		if	(GP_X >= findid.X_MIN)  and (GP_Z >= findid.Z_MIN) and (GP_X <= findid.X_MAX)  and (GP_Z <= findid.Z_MAX) and (sceneId == findid.Scene) then
			num = i	
			break
		end
	end
	
	--Èç¹ûÕÒ²»µ½ÕýÈ·µÄÎ»ÖÃÔò·µ»Ø
	if num == 0 then
		return
	end

	--ÅÐ¶ÏÖÖÖ²ÅÆÊÇ·ñÊÇ8£¬Èç¹ûÊÇ8ÔòÍ¨ÖªÍæ¼Ò
	if PLANTFLAG[num] == 8 then
		LuaFnSendMailToGUID(sceneId,ItemBoxOwnerGUID,"Thñc v§t do các hÕ tr°ng ðã chín t¾i, xin hãy thu hoÕch trong vòng 10 phút.")
	end
	--ÕÒµ½ÕýÈ·µÄ±àºÅ£¬°ÑÖÖÖ²ÅÆ-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1

	return 1
end
