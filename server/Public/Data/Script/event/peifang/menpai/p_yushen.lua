

x990000_g_scriptId = 990000




x990000_g_ItemData = 
{


{ItemIndex = 30310119, GiveItem = 30504036, ImpactId = 28626}, --bang lam luu van
{ItemIndex = 30310120, GiveItem = 30504036, ImpactId = 28601}, --tu vi tinh quang
{ItemIndex = 30310121, GiveItem = 30504036, ImpactId = 28606}, --thuy ngoc tinh tran
{ItemIndex = 30310122, GiveItem = 30504036, ImpactId = 28611}, --tranh anh nhu mong
{ItemIndex = 30310123, GiveItem = 30504036, ImpactId = 28616}, --hoa lac hong tran
{ItemIndex = 30310124, GiveItem = 30504036, ImpactId = 28623}, --diep anh tam hoa
{ItemIndex = 30310125, GiveItem = 30504036, ImpactId = 28633}, --thuoc vu hong lien
{ItemIndex = 30310126, GiveItem = 30504036, ImpactId = 28637}, --dieu vu phuong lan
}

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x990000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»C¥n Cái này ½Ó¿Ú,±£Áô¿Õº¯Êý
end

function x990000_IsSkillLikeScript( sceneId, selfId)
	return 1; --Cái này ½Å±¾C¥n ¶¯×÷Ö§³Ö
end

function x990000_CancelImpacts( sceneId, selfId )
	return 0; --²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý,²¢ÇÒÊ¼ÖÕTr· v«0.
end

function x990000_OnConditionCheck( sceneId, selfId )

	--Ð£ÑéÊ¹ÓÃtoÕ ðµ Îï?
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "Ô ðÕo cø ðã ð¥y, xin hãy ch×a tr¯ng 1 khoän không gian."
		      x990000_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	local nItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local nGiveItemIndex = 0
	local nGiveImpactId = 0
	for i = 1, getn(x990000_g_ItemData) do
		if x990000_g_ItemData[i].ItemIndex == nItemIndex then
			nGiveItemIndex = x990000_g_ItemData[i].GiveItem
			nGiveImpactId = x990000_g_ItemData[i].ImpactId
			break
		end
	end
	
	if nGiveItemIndex == 0 or nGiveImpactId == 0 then
		return 0;
	end
	
	local nHaveImpact = 0
	for i = 1, getn(x990000_g_ItemData) do
		local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x990000_g_ItemData[i].ImpactId)
		if nRet == 1 then
			nHaveImpact = 1
		end
	end
	
	if nHaveImpact == 1 then
		local strNotice = "Trên ngß¶i ðã có hi®u Ñng r°i"
		x990000_ShowNotice( sceneId, selfId, strNotice)
		return 0;
	end
	
	return 1; --²»C¥n ÈÎºÎÌõ¼þ,²¢ÇÒÊ¼ÖÕTr· v«1.
end
function x990000_OnDeplete( sceneId, selfId )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

function x990000_OnActivateOnce( sceneId, selfId )

	local nItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local nGiveItemIndex = 0
	local nGiveImpactId = 0
	for i = 1, getn(x990000_g_ItemData) do
		if x990000_g_ItemData[i].ItemIndex == nItemIndex then
			nGiveItemIndex = x990000_g_ItemData[i].GiveItem
			nGiveImpactId = x990000_g_ItemData[i].ImpactId
			break
		end
	end
	
	if nGiveItemIndex == 0 or nGiveImpactId == 0 then
		return 0;
	end
	
	local nHaveImpact = 0
	for i = 1, getn(x990000_g_ItemData) do
		local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x990000_g_ItemData[i].ImpactId)
		if nRet == 1 then
			nHaveImpact = 1
		end
	end
	if nHaveImpact == 1 then
		local strNotice = "Trên ngß¶i ðã có hi®u Ñng r°i"
		x990000_ShowNotice( sceneId, selfId, strNotice)
		return 0;
	end
	
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, nGiveImpactId, 0)

	BeginAddItem(sceneId)                --¸øÎïÆ·
		AddItem(sceneId, nGiveItemIndex, 1)
	local canAdd = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )

    if canAdd > 0 then
		LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
		local ItemName = GetItemName(sceneId, nGiveItemIndex)
		local strNotice = "ÐÕt ðßþc "..ItemName
		x990000_ShowNotice( sceneId, selfId, strNotice)
	end
	
	return 1;
end

function x990000_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÐúngÒýµ¼ÐÔ½Å±¾, Ö»±£Áô¿Õº¯Êý.
end

function x990000_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x990000_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	
	
end
