x760553_g_ScriptId = 760553
function x760553_GetGiftsForUI2(sceneId, selfId, index,idbox,iop)
	if index == nil or index <0 then
		return
	end
if index == 55 then

	if LuaFnGetAvailableItemCount(sceneId, selfId, 30505819) < 10 then
			x760553_Tips( sceneId, selfId, "Ð¬ thay ð±i ngoÕi hình Th¥n khí c¥n 10 cái Th¥n Binh Phù" )
			return
		end

	x760553_GetGiftsForLevelUq(sceneId, selfId, idbox, iop)
	LuaFnDelAvailableItem(sceneId,selfId,30505819,10)
	return
end
end
function x760553_GetGiftsForLevelUq(sceneId, selfId, key, nIndex)
local Decoratejiuxingshenqi_check = {10300423,10300424,10300425
,10301444,10301445,10301446
,10301453,10301454,10301455
,10302449,10302450,10302451
,10302458,10302459,10302460
,10303440,10303441,10303442
,10303449,10303450,10303451
,10304427,10304428,10304429
,10305445,10305446,10305447
,10305454,10305455,10305456
,10306043,10306044,10306045
,10307043,10307044,10307045
,10102201,10102202,10102203
,10102204,10102205,10102206
,10102207,10102208,10102209
,10102210,10102211,10102212
,10102213,10102214,10102215
,10102216,10102217,10102218
,10102219,10102220,10102221
,10102222,10102223,10102224
,10102225,10102226,10102227
,10102228,10102229,10102230
,10102231,10102232,10102233
,10102234,10102235,10102236
,10102237,10102238,10102239
,10102240,10102241,10308043
,10308044,10308045,10102242
,10102243,10102244,10102245
,10102246,10102247
,}
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	if (moneyJZ + money <10) then	
		BeginEvent(sceneId)
			AddText(sceneId,"Yêu c¥u 0.1 Ð°ng vàng M¾i có th¬ sØ døng B±n Công nång .");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

		local myequi = LuaFnGetItemTableIndexByIndex(sceneId, selfId, key)
		local checkFlag = 0
	for i=1, getn(Decoratejiuxingshenqi_check) do
		if myequi == Decoratejiuxingshenqi_check[i] then
            checkFlag = 1
            break
		end
	end
  if checkFlag == 0 then		
		x760553_Tips(sceneId, selfId,"Chï có th¬ ð¬ vào Thái C± Th¥n Khí")
		return
	end
	if nIndex <1 and nIndex> 53 then
		x760553_Tips(sceneId, selfId,"Vì cái gì"..nIndex)
	return
	end
	LuaFnCostMoneyWithPriority(sceneId, selfId, 10)
	
	local bagpos01 = TryRecieveItem(sceneId, selfId, Decoratejiuxingshenqi_check[nIndex], 1)
	--LuaFnEraseItem(sceneId, selfId, key)	
	CallScriptFunction(895111,"SHANG_BAOS", sceneId, selfId, key,bagpos01)

x760553_Tips(sceneId, selfId,"Thay ð±i ngoÕi hình Th¥n Khí thành công")	

end

function x760553_Tips(sceneId, selfId,msg)
	BeginEvent(sceneId)
	AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
