--Éú³¤µã½Å±¾£¬³ñ3
--½Å±¾ºÅ
--g_ScriptId = 711044

--´ËÉú³¤µã±àºÅ
x711044_g_GpId = 545

--Éú³¤µãÐèÒªµÄµÈ¼¶
x711044_g_ItemBoxNeedLevel = 3

function	x711044_OnOpen(sceneId,selfId,targetId)
	--µÃµ½Éú³¤µãµÄÖ÷ÈËGUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--²ÎÊýÊÇSceneID£¬ItemBoxID
	--µÃµ½µã»÷Éú³¤µãµÄÍæ¼ÒµÄguid
	PlayerGuid = GetHumanGUID(sceneId,selfId)
	if ItemBoxOwnerGUID~= PlayerGuid then
		BeginEvent(sceneId)
	  		AddText(sceneId,"Tùy ti®n thu lúa gÕo cüa ngß¶i khác là không ðßþc!");
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		return OR_INVALID_TARGET_POS
	end
	--µÃµ½¼¼ÄÜµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711044_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711044_OnProcOver(sceneId,selfId,targetId)
	return OR_OK
end

function	 x711044_OnRecycle(sceneId,selfId,targetId)
	local num = 0
	--È¡µÃÉú³¤µãµÄ×ø±ê
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--ÏÂÈ¡Õû
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--ÅÐ¶ÏÖÖÖ²ÅÆµÄÎ»ÖÃÔÚÄÄ¸öÖÖÖ²ÅÆ¹ÜÏ½µÄ·¶Î§ÄÚ
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
	--ÕÒµ½ÕýÈ·µÄ±àºÅ£¬°ÑÖÖÖ²ÅÆ-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1
	return 1
end
