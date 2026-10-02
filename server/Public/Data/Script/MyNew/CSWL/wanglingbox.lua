--±¦Ïä½Å±¾ ³àÉ°¤ÎĞ« QQ-718805400
--Çë×ğÖØÔ­´´£¬×ªÔØÇë×¢Ã÷³ö´¦£¬Ğ»Ğ»~

--½Å±¾ºÅ
x900071_g_ScriptId = 900071

--µôÂäËæ»úÁúÎÆ 1-3¼¶ ¼ş
x900071_g_LootItem_1 = {10157001,10157002,10157003}

--µôÂäËæ»úÖıÎÆÑªÓñ¡¢ÖıÎÆ¾«Óñ¡¢ÖıÎÆÁúÓñ
x900071_g_LootItem_2 = {38000184,38000185,38000186}

--µôÂä¸÷ÖÖ¹»Ìì²Å
x900071_g_LootItem_3 = {20310177,20310178,20310179}

--µôÂä¸÷ÖÖ×·ÁúÊ¯
x900071_g_LootItem_4 = {20310181,20310182,20310183}

--µôÂä ½õÔÆË®¡¢ÓñÁúËê
x900071_g_LootItem_5 = {20310180,20310176,30509014}

--ÊÜÏŞbuff....
x900071_g_LimitiBuff = {}

--**********************************
--ÌØÊâ½»»¥:Ìõ¼şÅĞ¶Ï
--**********************************
function x900071_OnActivateConditionCheck( sceneId, selfId, activatorId )
     if LuaFnGetAvailableItemCount(sceneId, activatorId, 38000126) < 1 then
	BeginEvent(sceneId)
	      AddText(sceneId,"Các hÕ không có  chìa khóa không th¬ m· rß½ng")
	      EndEvent(sceneId)
	DispatchMissionTips(sceneId,activatorId)
        return 0
     end
   return 1
end

--**********************************
--ÌØÊâ½»»¥:ÏûºÄºÍ¿Û³ı´¦Àí
--**********************************
function x900071_OnActivateDeplete( sceneId, selfId, activatorId )

	return 1
end

--**********************************
--ÌØÊâ½»»¥:¾ÛÆøÀà³É¹¦ÉúĞ§´¦Àí
--**********************************
function x900071_OnActivateEffectOnce( sceneId, selfId, activatorId )

	local x
	local z
	
	x,z = GetWorldPos(sceneId, selfId)

	if LuaFnDelAvailableItem(sceneId,activatorId,38000126, 1) ~= 1 then
	   BeginEvent(sceneId)
	      AddText(sceneId,"    Xóa v§t ph¦m th¤t bÕi")
	      EndEvent(sceneId)
	   DispatchMissionTips(sceneId,activatorId)
           return
        end

	        LuaFnGmKillObj( sceneId, activatorId, selfId )
	        SetCharacterDieTime(sceneId, selfId, 2000)


	-- ¸ø¿ªÆô³É¹¦µÄÍæ¼ÒÒ»¸öµôÂä°ü
	local nItemCount = 2
	local nItemId_1
	local nItemId_2
	local nItemId_3
	local nItemId_4
	local nItemId_5
	local nItemId_6

        local suijiNum = random(1000)
	if suijiNum >= 500 and suijiNum <= 900 then
		nItemCount = 3
		nItemId_1 = x900071_g_LootItem_1[random(getn(x900071_g_LootItem_1))]
	end

	if suijiNum >= 100 and suijiNum <= 400 then
		nItemCount = 4
	        nItemId_3 = x900071_g_LootItem_2[random(getn(x900071_g_LootItem_2))]
	end
	
	if suijiNum >= 300 and suijiNum <= 700 then
		nItemCount = 5
	        nItemId_6 = x900071_g_LootItem_3[random(getn(x900071_g_LootItem_3))]
	end

	nItemId_2 = x900071_g_LootItem_5[random( getn(x900071_g_LootItem_5) )]
	nItemId_4 = x900071_g_LootItem_5[random( getn(x900071_g_LootItem_5) )]
	nItemId_5 = x900071_g_LootItem_4[random( getn(x900071_g_LootItem_4) )]

	local nBoxId = DropBoxEnterScene(	x,z,sceneId )
	local ds = { nItemId_2, nItemId_4, nItemId_5 }   -- [NetCo4 02/10] cu: so 401-700 -> 5 mon nhung nItemId_3 = nil (30% lan mo)
		if nItemId_1 then ds[getn(ds)+1] = nItemId_1 end
if nItemId_3 then ds[getn(ds)+1] = nItemId_3 end
	if nItemId_6 then ds[getn(ds)+1] = nItemId_6 end
		local nSo = getn( ds )
if nSo == 3 then
	AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,3,ds[1],ds[2],ds[3])
		elseif nSo == 4 then
AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,4,ds[1],ds[2],ds[3],ds[4])
	else
		AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,5,ds[1],ds[2],ds[3],ds[4],ds[5])
	end
			
	-- °ÑÕâ¸öµôÂä°ó¶¨¸øÖÆ¶¨Íæ¼Ò
	SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,activatorId))

	return 1
end

--**********************************
--ÌØÊâ½»»¥:Òıµ¼ÀàÃ¿Ê±¼ä¼ä¸ôÉúĞ§´¦Àí
--**********************************
function x900071_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥¿ªÊ¼Ê±µÄÌØÊâ´¦Àí
--**********************************
function x900071_OnActivateActionStart( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥³·ÏûÊ±µÄÌØÊâ´¦Àí
--**********************************
function x900071_OnActivateCancel( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥ÖĞ¶ÏÊ±µÄÌØÊâ´¦Àí
--**********************************
function x900071_OnActivateInterrupt( sceneId, selfId, activatorId )

	local strText = "ğang m·"
	BeginEvent(sceneId)
	      AddText(sceneId,strText)
	      EndEvent(sceneId)
	DispatchMissionTips(sceneId,activatorId)
	return 1
end
