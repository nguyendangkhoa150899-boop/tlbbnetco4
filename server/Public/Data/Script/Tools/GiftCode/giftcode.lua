--Powered by TLBB-LuaEditor
--Giftcode

--******************************--
x990900_g_ScriptId = 990900
--******************************--
x990900_g_MD_GiftCode = MD_GIFTCODE_TYPE
--******************************--
x990900_g_GiftCodeType = {
    [255] = "Test",
}
--******************************--
x990900_g_ClassType = {
    [-1] = "Toàn bµ",
    [0] = "Thiªu Lâm",
    [1] = "Minh Giáo",
    [2] = "Cái Bang",
    [3] = "Võ Ðang",
    [4] = "Nga My",
    [5] = "Tinh Túc",
    [6] = "Thiên Long",
    [7] = "Thiên S½n",
    [8] = "Tiêu Dao",
    [9] = "Tân thü",
    [10] = "Mµ Dung",
    [11] = "Ðß¶ng Môn",
    [12] = "QuÖ C¯c",
}
--******************************--
x990900_g_Awards = {
    -- DO NOT REMOVE THE TEST AWARD
    ["Test"] = {
        --Conditions
        Class = -1,
        Level = 1,
        FreePropertyBagSlot = 1,
        FreeMaterialBagSlot = 1,
        --End

        --List item normal
        NormalAward = {
            MaxItem = 1,
            List = {
                {   ItemID = 20101001,  Number = 1, Rate = 100  },
            },
        },
        --End
        --List item vip
        VipAward = {
            MaxItem = 1,
            List = {
                {   ItemID = 20101002,  Number = 1, Rate = 100  },
            },
        },
        --End
    },
    -- TODO add your award type below like that form
}
--******************************--

--**********************************************--
--* This function is called to check the condition before adding awards.
--**********************************************--
function x990900_OnCheckCondition(sceneId, playerId)

    --******************************--
    local codeType = GetMissionData(sceneId, playerId, x990900_g_MD_GiftCode)
    --******************************--
    if x990900_g_GiftCodeType[codeType] == nil then
        x990900_ShowNotify(sceneId, playerId, "Các hÕ không có ph¥n thß·ng ð¬ nh§n!")
        return 0
    end
    --******************************--
    local nAward = x990900_g_Awards[x990900_g_GiftCodeType[codeType]]
    --******************************--
    local nClass = GetMenPai(sceneId, playerId)
    if x990900_g_ClassType[nClass] == nil then
        x990900_ShowNotify(sceneId, playerId, "L²i không xác ð¸nh ðßþc môn phái ngß¶i ch½i. Hãy liên h® v¾i GM ð¬ thông báo!")
        return 0
    elseif nAward.Class ~= -1 and nClass ~= nAward.Class then
        x990900_ShowNotify(sceneId, playerId, "Chï có ngß¶i ch½i thuµc "..x990900_g_ClassType[nClass].." m¾i có th¬ nh§n loÕi ph¥n thß·ng này!")
        return 0
    end
    --******************************--
    local nLevel = GetLevel(sceneId, playerId)
    if nLevel < nAward.Level then
        x990900_ShowNotify(sceneId, playerId, "C¥n c¤p ðµ t¯i thi¬u ðÕt c¤p "..nAward.Level.." m¾i có th¬ nh§n loÕi ph¥n thß·ng này!")
        return 0
    end
    --******************************--
    if LuaFnGetPropertyBagSpace(sceneId, playerId) < nAward.FreePropertyBagSlot then
        x990900_ShowNotify(sceneId, playerId, "C¥n s¡p xªp lÕi t¯i thi¬u "..nAward.FreePropertyBagSlot.." khoäng tr¯ng trong ô ðÕo cø!")
        return 0
    elseif LuaFnGetMaterialBagSpace(sceneId, playerId) < nAward.FreeMaterialBagSlot then
        x990900_ShowNotify(sceneId, playerId, "C¥n s¡p xªp lÕi t¯i thi¬u "..nAward.FreeMaterialBagSlot.." khoäng tr¯ng trong ô nguyên li®u!")
        return 0
    end
    --******************************--
    return 1
    --******************************--

end

--**********************************************--
--* This function is called to add award to player
--**********************************************--
function x990900_AddGiftCodeAward(sceneId, playerId)

    --******************************--
    local checkResult = x990900_OnCheckCondition(sceneId, playerId)
    if checkResult ~= 1 then
        return
    end
    --******************************--
    local codeType = GetMissionData(sceneId, playerId, x990900_g_MD_GiftCode)
    --******************************--
    SetMissionData(sceneId, playerId, x990900_g_MD_GiftCode, 0)
    --******************************--
    local nAward = x990900_g_Awards[x990900_g_GiftCodeType[codeType]]
    --******************************--
    BeginAddItem(sceneId)
        local normalList = nAward.NormalAward
        local totalNormalItem = normalList.MaxItem
        for i = 1, totalNormalItem do
            for j, item in normalList.List do
                local nRate = random(100)
                if nRate <= item.Rate then
                    AddItem(sceneId, item.ItemID, item.Number)
                    break
                end
            end
        end

        local vipList = nAward.VipAward
        local totalVipItem = vipList.MaxItem
        for i = 1, totalVipItem do
            for j,item in vipList.List do
                local nRate = random(100)
                if nRate <= item.Rate then
                    AddItem(sceneId, item.ItemID, item.Number)
                    break
                end
            end
        end
    EndAddItem(sceneId, playerId)
    AddItemListToHuman(sceneId, playerId)
    --******************************--
    local nNotice = format("#{_INFOUSR%s}#R ðã kích hoÕt thành công gói GiftCode #Y[%s]#R. Xin chúc m×ng!", GetName(sceneId, playerId), x990900_g_GiftCodeType[codeType])
    AddGlobalCountNews(sceneId, nNotice)
    --******************************--
    LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 147, 0)
    --******************************--

end

--**********************************************--
--* This function is called to notify player tips
--**********************************************--
function x990900_ShowNotify(sceneId, playerId, nString)

    --******************************--
    BeginEvent(sceneId)
        AddText(sceneId, nString)
    EndEvent(sceneId)
    DispatchMissionTips(sceneId, playerId)
    --******************************--

end
