
x910102_g_scriptId = 910102
--ð½½ð¡¢ÔÆË®¡¢½¨Ä¾¡¢Ìì»ð¡¢Ï¢ÍÁ
x910102_g_misssusu = {MD_BIAOJIAN_SUXING1,MD_BIAOJIAN_SUXING2,MD_BIAOJIAN_SUXING3,MD_BIAOJIAN_SUXING4,MD_BIAOJIAN_SUXING5,MD_BIAOJIAN_NUM}
x910102_g_tabytomaxnum = {}
x910102_g_tabytomaxnum[1] = 4
x910102_g_tabytomaxnum[2] = 8
x910102_g_tabytomaxnum[4] = 2
x910102_g_tabytomaxnum2 = {}
x910102_g_tabytomaxnum2[1] = MD_BIAOJIAN_SUXING1
x910102_g_tabytomaxnum2[2] = MD_BIAOJIAN_SUXING2
x910102_g_tabytomaxnum2[4] = MD_BIAOJIAN_SUXING4
x910102_g_BiaoYuToBuff = {}
x910102_g_BiaoYuToBuff[1] ={}
x910102_g_BiaoYuToBuff[2] ={}
x910102_g_BiaoYuToBuff[3] ={}
x910102_g_BiaoYuToBuff[4] ={}

--**********************************
--by UK QQ 2269169441
--**********************************
function x910102_UK_Cohesion( sceneId, selfId,targetId,targetId2 )
local FullNinJiLevel = GetMissionData(sceneId, selfId, x910102_g_misssusu[getn(x910102_g_misssusu)])
if FullNinJiLevel < 0 or FullNinJiLevel > 4 then
x910102_TipBox( sceneId, selfId, "Ngñng tø sai" )
return
end
if targetId2 == nil or x910102_g_tabytomaxnum[FullNinJiLevel+1] == nil or targetId2 < 1 or targetId2 > x910102_g_tabytomaxnum[FullNinJiLevel+1] then
return
end
local mynowNinJiLevel = GetMissionData(sceneId, selfId, x910102_g_misssusu[FullNinJiLevel+1])
local bElementsLevel = mod(mynowNinJiLevel,1000)
local mytaby = floor(mynowNinJiLevel/1000)
if (FullNinJiLevel ~= 0 and FullNinJiLevel ~= 1 and FullNinJiLevel ~= 3) or (mytaby ~= 0) then
x910102_TipBox( sceneId, selfId, "Các hÕ ðã lña ch÷n quá thuµc tính" )
return
end
SetMissionData(sceneId, selfId, x910102_g_misssusu[FullNinJiLevel+1],targetId2*1000+bElementsLevel)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
x910102_TipBox( sceneId, selfId, "Lña ch÷n thuµc tính thành công" )
CallScriptFunction( 892002, "AHa_ReMyBuff", sceneId, selfId);
end
--**********************************
--by UK QQ 2269169441
--**********************************
function x910102_UK_TypeSwitch( sceneId, selfId,targetId,targetId2,targetId3 )
if targetId == nil or targetId < 0 or targetId > 3 or targetId2 > x910102_g_tabytomaxnum[targetId+1] then
return
end
if targetId2 == nil or x910102_g_tabytomaxnum[targetId+1] == nil or targetId2 < 0 or targetId2 > x910102_g_tabytomaxnum[targetId+1] then
return
end
local FullNinJiLevel = GetMissionData(sceneId, selfId, x910102_g_misssusu[getn(x910102_g_misssusu)])
if FullNinJiLevel < 0 or FullNinJiLevel > 5 then
x910102_TipBox( sceneId, selfId, "Ngßng Tø Bäo Ng÷c sai" )
return
end
local mynowNinJiLevel = GetMissionData(sceneId, selfId, x910102_g_tabytomaxnum2[targetId+1])
local bElementsLevel = mod(mynowNinJiLevel,1000)
local mytaby = floor(mynowNinJiLevel/1000)
if targetId > FullNinJiLevel then
x910102_TipBox( sceneId, selfId, "Các hÕ bây gi¶ chßa th¬ tiªn hành Ngßng Tø Ngû Hành Ng÷c này, m¶i nâng tiªp Ngû Hành còn dang d· theo thÑ tñ" )
return
end
if (targetId ~= 0 and targetId ~= 1 and targetId ~= 3) or bElementsLevel < 1 then
x910102_TipBox( sceneId, selfId, "Các hÕ bây gi¶ chßa th¬ tiªn hành Ngßng Tø Ngû Hành Ng÷c này, m¶i nâng tiªp Ngû Hành còn dang d· theo thÑ tñ" )
return
end
if targetId2 == mytaby then
x910102_TipBox( sceneId, selfId, "Bäo Ng÷c không th¬ ngßng tø thuµc tính gi¯ng nhau, m¶i các hÕ lña ch÷n thuµc tính khác!" )
return
end
local itemcnom2 = 0
local delitemcom = 1
local itemcnom = LuaFnGetAvailableItemCount(sceneId, selfId, 38001454)
if itemcnom < delitemcom then
itemcnom2 = LuaFnGetAvailableItemCount(sceneId, selfId, 38001455)
end
if itemcnom + itemcnom2 < delitemcom then
x910102_TipBox( sceneId, selfId, "[#{_ITEM38001454}] không ðü "..delitemcom.." cái ð¬ thay ð±i" )
return
end
local myret = 1 
local myret2 = 1
if itemcnom > delitemcom then
myret = LuaFnDelAvailableItem(sceneId,selfId,38001454,delitemcom)
else
myret = LuaFnDelAvailableItem(sceneId,selfId,38001454,itemcnom)
end
if itemcnom2 ~= 0 then
myret2 = LuaFnDelAvailableItem(sceneId,selfId,38001455,delitemcom-itemcnom)
end
if myret ~= 1 and myret2 ~= 1 then
x910102_TipBox( sceneId, selfId, "tiêu hao [#{_ITEM38001454}] th¤t bÕi" )
return
end
SetMissionData(sceneId, selfId, x910102_g_tabytomaxnum2[targetId+1],targetId2*1000+bElementsLevel)
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
x910102_TipBox( sceneId, selfId, "Ngû Hành Ng÷c ngßng tø thành công" )
CallScriptFunction( 892002, "AHa_ReMyBuff", sceneId, selfId);
end





function x910102_UK_Add_Suxing( sceneId, selfId)
local misssusu = {MD_BIAOJIAN_SUXING1,MD_BIAOJIAN_SUXING2,MD_BIAOJIAN_SUXING3,MD_BIAOJIAN_SUXING5}
local misssusu2 = {12412,12413,12414,12415}
for i = 1,4 do	
local mynowNinJiLevel = GetMissionData(sceneId, selfId, misssusu[i])
local bElementsLevel = mod(mynowNinJiLevel,1000)
local mytaby = floor(mynowNinJiLevel/1000)
if bElementsLevel > 0 and bElementsLevel < 101 and mytaby > 0 and x910102_g_BiaoYuToBuff[i] ~= nil and x910102_g_BiaoYuToBuff[i][mytaby] ~= nil  then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,x910102_g_BiaoYuToBuff[i][mytaby][bElementsLevel] ) == 0 then
--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910102_g_BiaoYuToBuff[i][mytaby][bElementsLevel], 0 )
end
--else
--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, misssusu2[i], 0 )
end
end
end



function x910102_TipBox( sceneId, selfId, msg )

		BeginEvent(sceneId)
		AddText(sceneId,msg);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
end
