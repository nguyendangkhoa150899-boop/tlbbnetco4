
--Ã¿´Î´ò¿ª±Ø¶¨»ñµÃµÄ²úÆ·
x715031_g_MainItemId = 20103008
--¿ÉÄÜµÃµ½µÄ²úÆ·
x715031_g_SubItemId = 50513004
--½ÇÉ«ÉíÉÏ±ØĞëÓĞµÄÎïÆ·
x715031_g_MustHaveItemId = 20309009

function 	x715031_OnCreate(sceneId,growPointType,x,y)
	local targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715031_g_MainItemId)
	
	--80%¼¸ÂÊ£¬±¦ÏäÀï³öÏÖ1¸öÎïÆ·£¬³öÏÖµÄÎïÆ·µÄÅĞ¶¨µÈÓÚÍÚ±¦µÄÊ±ºò³öÏÖÎïÆ·µÄÅĞ¶¨¡£
	if random(100) <= 80 then
		local ItemSn, ItemName, bBroadCast = GetItemSnByDropRateOfItemTable()
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,ItemSn)
	end	
	
end


--´ò¿ªÇ°º¯Êı¿ªÊ¼&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715031_OnOpen(sceneId,selfId,targetId)
--·µ»ØÀàĞÍ
-- 0 ±íÊ¾´ò¿ª³É¹¦
	--PrintStr("OnOpen...")
	if HaveItem(sceneId,selfId, x715031_g_MustHaveItemId) > 0 then
		local Bagpos = GetBagPosByItemSn(sceneId,selfId,x715031_g_MustHaveItemId)
		if LuaFnIsItemAvailable(sceneId,selfId,Bagpos) == 1 then
			return OR_OK
		else
			Msg2Player(  sceneId, selfId,"Chìa khóa (dßşc chüy) cüa Bäo tàng chü nhân hi®n gi¶ hình nhß không th¬ sØ døng" ,MSG2PLAYER_PARA )	
			BeginEvent(sceneId)
				AddText(sceneId, "Chìa khóa (dßşc chüy) cüa Bäo tàng chü nhân hi®n gi¶ hình nhß không th¬ sØ døng")
			EndEvent()
			DispatchMissionTips(sceneId,selfId)
			return OR_ERROR	
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "C¥n phäi có chìa khóa (dßşc chüy) cüa Bäo tàng chü nhân m¾i có th¬ m· ğßşc");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_STUFF_LACK	
	end
end
--´ò¿ªÇ°º¯Êı½áÊø&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


function	x715031_OnProcOver(sceneId,selfId,targetId)
	--PrintStr("OnProcOver...")
	--´ò¿ª±¦Ïä»á100%»ñµÃÇ®£¬Ö±½Ó¼ÓÔÚÍæ¼ÒÉíÉÏ¼´¿É¡£
	--Ç®Êı=114£«£¨bossµÈ¼¶£­30£©¡Á16 -->bosslevel == playerlevel
	if 1 == LuaFnDelAvailableItem(sceneId,selfId, x715031_g_MustHaveItemId, 1) then
		local BonusMoney = 114 + (GetLevel(sceneId, selfId)-20) * 1600
		AddMoney(sceneId, selfId, BonusMoney)
		Msg2Player(  sceneId, selfId,"Các hÕ ğã nh§n ğßşc #{_MONEY" .. tostring(BonusMoney) .. "}" ,MSG2PLAYER_PARA )	
	else
		Msg2Player(  sceneId, selfId,"Chìa khóa (dßşc chüy) cüa Bäo tàng chü nhân hi®n gi¶ hình nhß không th¬ sØ døng" ,MSG2PLAYER_PARA )	
		return OR_ERROR
	end
	return OR_OK
end

--»ØÊÕº¯Êı¿ªÊ¼########################################################################
function	 x715031_OnRecycle(sceneId,selfId,targetId)
		return OR_OK
end
--»ØÊÕº¯Êı½áÊø########################################################################

function x715031_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
