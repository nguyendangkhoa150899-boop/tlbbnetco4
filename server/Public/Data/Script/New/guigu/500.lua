x760500_g_ScriptId = 760500
function x760500_GetGiftsForUI1(sceneId, selfId, index,idbox,iop)
	if index == nil or index <0 then
		return
	end
if index == 55 then
x760500_GetGiftsForLevelUq(sceneId, selfId, idbox, iop)
	return
end
end
function x760500_GetGiftsForLevelUq(sceneId, selfId, key, nIndex)
local Decoratemaozi_check = {10410004,10410005,10410006,10410007,10410008,10410009,10410010,10410011,10410012,10410013,10410014,10410015,10410016,10410017,10410018,10410019,10410020,10410021,10410022,10410023,10410024,10410025,10410026,10410027,10410028,10410029,10410030,10410031,10410032,10410033,10410034,10410035,10410036,10410037,10410038,10410039,10410040,10410041,10410042,10410043,10410044,10410045,10410046,10410047,10410048,10410049,10410050,}
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	if (moneyJZ + money <10) then	
		BeginEvent(sceneId)
			AddText(sceneId,"Yêu c¥u 0.1Ð°ng vàng M¾i có th¬ sØ døng B±n Công nång .");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

		local myequi = LuaFnGetItemTableIndexByIndex(sceneId, selfId, key)
		local checkFlag = 0
	for i=1, getn(Decoratemaozi_check) do
		if myequi == Decoratemaozi_check[i] then
            checkFlag = 1
            break
		end
	end
  if checkFlag == 0 then		
		x760500_Tips(sceneId, selfId,"Chï có Thö L² tai Có th¬ SØ døng B±n Công nång")
		return
	end
	if nIndex <1 and nIndex> 53 then
		x760500_Tips(sceneId, selfId,"Vì cái gì"..nIndex)
	return
	end
	LuaFnCostMoneyWithPriority(sceneId, selfId, 10)
	
	local bagpos01 = TryRecieveItem(sceneId, selfId, Decoratemaozi_check[nIndex], 1)
	--LuaFnEraseItem(sceneId, selfId, key)	
	CallScriptFunction(895111,"SHANG_BAOS", sceneId, selfId, key,bagpos01)

x760500_Tips(sceneId, selfId,"Ð° trang sÑc Ð±i m¾i Thành công !")	

end

function x760500_Tips(sceneId, selfId,msg)
	BeginEvent(sceneId)
	AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
