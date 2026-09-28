
x910100_g_scriptId = 910100
x910100_g_misssusu = {MD_BIAOJIAN_SUXING1,MD_BIAOJIAN_SUXING2,MD_BIAOJIAN_SUXING3,MD_BIAOJIAN_SUXING4,MD_BIAOJIAN_SUXING5,MD_BIAOJIAN_NUM}
x910100_g_CostItemCount = { 1 , 1 , 2 ,2 ,3 , 3 , 4 , 4 , 5 ,5}
x910100_g_itemiuid = {}
x910100_g_itemiuid[0] = 2015123194
x910100_g_itemiuid[1] = 2015123192
x910100_g_itemiuid[3] = 2015123196
--ð½½ð¡¢ÔÆË®¡¢½¨Ä¾¡¢Ìì»ð¡¢Ï¢ÍÁ
--**********************************
--by UK QQ 2269169441
--**********************************
function x910100_UK_Ninji( sceneId, selfId,targetId )

if targetId == nil or targetId < 0 or targetId >= 15000 then
return
end
local FullNinJiLevel = GetMissionData(sceneId, selfId, x910100_g_misssusu[getn(x910100_g_misssusu)])
if FullNinJiLevel < 0 or FullNinJiLevel > 4 then
x910100_TipBox( sceneId, selfId, "Không có cách nào ngßng tø" )
return
end
if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
x910100_TipBox( sceneId, selfId, "Sai L¥m M¤y chü" )
return
end
local mynowNinJiLevel = GetMissionData(sceneId, selfId, x910100_g_misssusu[FullNinJiLevel+1])
local bElementsLevel = mod(mynowNinJiLevel,1000)
local mytaby = floor(mynowNinJiLevel/1000)
local itemcnom = LuaFnGetAvailableItemCount(sceneId, selfId, 20800033)
local nLevelGrade = floor ( bElementsLevel / 10 )
local delitemcom = x910100_g_CostItemCount[nLevelGrade + 1]
local itemcnom2 = 0
if itemcnom < delitemcom then
itemcnom2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20800034)
end
if itemcnom + itemcnom2 < delitemcom then
x910100_TipBox( sceneId, selfId, "[#{_ITEM20800033}] không ðü "..delitemcom.." cái ð¬ tång lên" )
return
end
local myMoney = GetMoney(sceneId, selfId)
if myMoney < delitemcom*50000 then
x910100_TipBox( sceneId, selfId, " không ðü "..delitemcom.." Vàng" )
return
end
local delmoneyid = CostMoney(sceneId, selfId,delitemcom*50000)
if delmoneyid ~= 1 then
x910100_TipBox( sceneId, selfId, "tiêu hao Vàng th¤t bÕi" )
return
end
local myret = 1 
local myret2 = 1
if itemcnom > delitemcom then
myret = LuaFnDelAvailableItem(sceneId,selfId,20800033,delitemcom)
else
myret = LuaFnDelAvailableItem(sceneId,selfId,20800033,itemcnom)
end
if itemcnom2 ~= 0 then
myret2 = LuaFnDelAvailableItem(sceneId,selfId,20800034,delitemcom-itemcnom)
end
if myret ~= 1 and myret2 ~= 1 then
x910100_TipBox( sceneId, selfId, "tiêu hao [#{_ITEM20800033}] th¤t bÕi" )
return
end

if bElementsLevel+1 >= 100 then
SetMissionData(sceneId, selfId, x910100_g_misssusu[getn(x910100_g_misssusu)],FullNinJiLevel+1)
end
if FullNinJiLevel == 2 or FullNinJiLevel == 4 then
mytaby = 1
end
SetMissionData(sceneId, selfId, x910100_g_misssusu[FullNinJiLevel+1],mytaby*1000+bElementsLevel+1)
if (FullNinJiLevel == 0 or FullNinJiLevel == 1 or FullNinJiLevel == 3) and mytaby == 0 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x910100_g_itemiuid[FullNinJiLevel])
	return	
end

LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
x910100_TipBox( sceneId, selfId, "Ngßng Tø Thành Công" )
CallScriptFunction( 892002, "AHa_ReMyBuff", sceneId, selfId);
x910100_UK_Open_Ui( sceneId, selfId,targetId )

end
function x910100_UK_Open_Ui( sceneId, selfId,targetId )
	local misssusu = {MD_BIAOJIAN_SUXING1,MD_BIAOJIAN_SUXING2,MD_BIAOJIAN_SUXING3,MD_BIAOJIAN_SUXING4,MD_BIAOJIAN_SUXING5,MD_BIAOJIAN_NUM}
		BeginUICommand(sceneId)
		if targetId == -1 then
		UICommand_AddInt(sceneId,selfId)
		else
		UICommand_AddInt(sceneId,targetId)
		end
		for i = 1,getn(misssusu) do
		UICommand_AddInt(sceneId,GetMissionData(sceneId, selfId, misssusu[i]))
		end
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2015123198)
end

function x910100_TipBox( sceneId, selfId, msg )

		BeginEvent(sceneId)
		AddText(sceneId,msg);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
end
