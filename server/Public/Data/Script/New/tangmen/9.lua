-- sØ døng ph¯i phß½ng k¸ch bän g¯c

-- ChØ thiªu h½i 2008.5.20
-- sØa chæa, tång thêm 102 c¤p Th¥n Khí.

-- k¸ch bän g¯c hào
x760008_g_scriptId = 760008

x760008_g_RecipeItems = {}

-- ItemTable hào vì hß¾ng dçn tra cÑu

-- abilityId: Tª bào sinh trß·ng ð¯i Ñng kÛ nång
-- recipeId: H÷c t§p ð¯i Ñng ph¯i phß½ng hào
-- needLevel: H÷c t§p này ph¯i phß½ng yêu c¥u tß½ng Ñng sinh hoÕt kÛ nång c¤p b§c
-- specialEffectID: Ð£c hi®u hào
-- ChØ thiªu h½i 2008.5.20. 102 c¤p Th¥n Khí ðúc bän v¨.
x760008_g_RecipeItems[ 30307300 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1224, needLevel = 1, specialEffectID = 18}
x760008_g_RecipeItems[ 30307301 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1225, needLevel = 1, specialEffectID = 18}
x760008_g_RecipeItems[ 30307302 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1226, needLevel = 1, specialEffectID = 18}
x760008_g_RecipeItems[ 30307303 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1227, needLevel = 2, specialEffectID = 18}
x760008_g_RecipeItems[ 30307304 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1228, needLevel = 3, specialEffectID = 18}
x760008_g_RecipeItems[ 30307305 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1229, needLevel = 3, specialEffectID = 18}
x760008_g_RecipeItems[ 30307306 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1230, needLevel = 4, specialEffectID = 18}
x760008_g_RecipeItems[ 30307307 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1231, needLevel = 4, specialEffectID = 18}
x760008_g_RecipeItems[ 30307308 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1232, needLevel = 5, specialEffectID = 18}
x760008_g_RecipeItems[ 30307309 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1233, needLevel = 5, specialEffectID = 18}
x760008_g_RecipeItems[ 30307310 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1234, needLevel = 6, specialEffectID = 18}
x760008_g_RecipeItems[ 30307311 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1235, needLevel = 6, specialEffectID = 18}
x760008_g_RecipeItems[ 30307312 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1236, needLevel = 7, specialEffectID = 18}
x760008_g_RecipeItems[ 30307313 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1237, needLevel = 7, specialEffectID = 18}
x760008_g_RecipeItems[ 30307314 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1238, needLevel = 8, specialEffectID = 18}
x760008_g_RecipeItems[ 30307315 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1239, needLevel = 8, specialEffectID = 18}
x760008_g_RecipeItems[ 30307316 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1240, needLevel = 9, specialEffectID = 18}
x760008_g_RecipeItems[ 30307317 ] = { abilityId = ABILITY_ZHIDU, recipeId = 1241, needLevel = 10, specialEffectID = 18}
--**********************************
-- thông døng bµ ph§n: SØ døng ph¯i phß½ng, phän h°i 1 tö vë h÷c ðßþc
--**********************************
function x760008_ReadRecipe( sceneId, selfId, recipeIndex )
local RecipeFlag = IsPrescrLearned( sceneId, selfId, recipeIndex )

if RecipeFlag < 1 then
-- không có h÷c ðßþc
SetPrescription( sceneId, selfId, recipeIndex, 1 )
Msg2Player( sceneId, selfId, "Ngß½i h÷c ðßþc hÕng nh¤t tân ph¯i phß½ng", MSG2PLAYER_PARA )
return 1
else
-- ðã h÷c ðßþc
-- trß¾c m¡t SetPrescription là cái song ch¯t m·, h÷c xong lÕi thuyên chuy¬n s¨ vÑt bö, nhßng là không phá hüy ph¯i phß½ng th§t th¬. Thí nghi®m sØ døng
Msg2Player( sceneId, selfId, "Nên ph¯i phß½ng ðã h÷c ðßþc", MSG2PLAYER_PARA )
return 0
end

return 0
end

--**********************************
-- phän h°i 1: KÛ nång cùng loÕi v§t ph¦m, có th¬ tiªp tøc cùng loÕi kÛ nång ch¤p hành; phän h°i 0: Ch¤p hành OnDefaultEvent.
--**********************************
function x760008_IsSkillLikeScript( sceneId, selfId )
return 1
end

--**********************************
-- phän h°i 1: Ðã hüy bö ð¯i Ñng hi®u quä, không h« ch¤p hành kª tiªp thao tác; phän h°i 0: Không có ki¬m tra ðo lß¶ng ðªn tß½ng quan hi®u quä, tiªp tøc ch¤p hành.
--**********************************
function x760008_CancelImpacts( sceneId, selfId )
return 0
end

--**********************************
-- ði«u ki®n ki¬m tra ðo lß¶ng nh§p kh¦u: Phän h°i 1: Ði«u ki®n ki¬m tra ðo lß¶ng thông qua, có th¬ tiªp tøc ch¤p hành; phän h°i 0: Ði«u ki®n ki¬m tra ðo lß¶ng th¤t bÕi, gián ðoÕn kª tiªp ch¤p hành.
--**********************************
function x760008_OnConditionCheck( sceneId, selfId )
-- ki¬m tra sØ døng v§t ph¦m
if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
return 0
end

-- tìm ðßþc ph¯i phß½ng ði«u møc
local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
local recipeItem = x760008_g_RecipeItems[itemTblIndex]
if not recipeItem then
return
end

local AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, recipeItem.abilityId )
-- nªu kÛ nång không ðü sØ døng yêu c¥u
if AbilityLevel < recipeItem.needLevel then
x760008_NotifyFailTips( sceneId, selfId, "KÛ nång c¤p b§c không ðü" )
return 0
end

if LuaFnIsPrescrLearned( sceneId, selfId, recipeItem.recipeId ) > 0 then
x760008_NotifyFailTips( sceneId, selfId, "Cái này ph¯i phß½ng ðã h÷c xong" )
return 0
end

return 1
end

--**********************************
-- tiêu hao ki¬m tra ðo lß¶ng c§p xØ lý nh§p kh¦u, phø trách tiêu hao ki¬m tra ðo lß¶ng cùng ch¤p hành:
-- phän h°i 1: Tiêu hao xØ lý thông qua, có th¬ tiªp tøc ch¤p hành; phän h°i 0: Tiêu hao ki¬m tra ðo lß¶ng th¤t bÕi, gián ðoÕn kª tiªp ch¤p hành.
--**********************************
function x760008_OnDeplete( sceneId, selfId )
if LuaFnDepletingUsedItem( sceneId, selfId ) > 0 then
return 1
end

return 0
end

--**********************************
-- chï biªt ch¤p hành mµt l¥n nh§p kh¦u:
-- tø khí cùng thu¤n phát kÛ nång s¨ · tiêu hao hoàn thành sau thuyên chuy¬n cái này tiªp l¶i ( tø chán nän thúc h½n næa các loÕi ði«u ki®n ð«u thöa mãn th¶i ði¬m ), mà dçn ðß¶ng
-- kÛ nång cûng s¨ · tiêu hao hoàn thành sau thuyên chuy¬n cái này tiªp l¶i ( kÛ nång ngay t× ð¥u, tiêu hao thành công ch¤p hành lúc sau ).
-- phän h°i 1: XØ lý thành công; phän h°i 0: XØ lý th¤t bÕi.
-- chú: N½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u
--**********************************
function x760008_OnActivateOnce( sceneId, selfId )
-- tìm ðßþc ph¯i phß½ng ði«u møc
local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
local recipeItem = x760008_g_RecipeItems[itemTblIndex]
if not recipeItem then
return 0
end

-- thuyên chuy¬n thông døng ph¯i phß½ng h÷c t§p
x760008_ReadRecipe( sceneId, selfId, recipeItem.recipeId )
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, recipeItem.specialEffectID, 0 )
return 1
end

--**********************************
-- dçn ðß¶ng tim ð§p xØ lý nh§p kh¦u:
-- dçn ðß¶ng kÛ nång s¨ · m²i l¥n tim ð§p kªt thúc ði®u hát th¸nh hành dùng cái này tiªp l¶i.
-- phän h°i: 1 tiªp tøc l¥n sau tim ð§p; 0: Gián ðoÕn dçn ðß¶ng.
-- chú: N½i này là kÛ nång tim ð§p khi có hi®u lñc nh§p kh¦u
--**********************************
function x760008_OnActivateEachTick( sceneId, selfId )
return 1
end

--**********************************
-- b¡t m¡t th¤t bÕi nh¡c nh·
--**********************************
function x760008_NotifyFailTips( sceneId, selfId, Tip )
BeginEvent( sceneId )
AddText( sceneId, Tip )
EndEvent( sceneId )
DispatchMissionTips( sceneId, selfId )
end
