
x391901_g_BUFFID = {}
x391901_g_BUFFID[5627]={"Ly Nhân Ngçu",11,48322,"Ly Nhân Ngçu",120000}

function x391901_OnImpactFadeOut(sceneId, selfId, impactId)
	if GetHp(sceneId, selfId) == 0 then
		return
	end
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 1147) == 1 then
x391901_Tips(sceneId, selfId,"30 giây Nµi Chï có th¬ Phóng Mµt loÕi Tinh tr§n")
end

local PlayerX,PlayerZ = GetWorldPos(sceneId,selfId)
SetMissionData(sceneId, selfId, GUIGU_XINGZHEN,x391901_g_BUFFID[impactId][2]*1000000+floor(PlayerX)*1000+floor(PlayerZ))
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 1176, 460);
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5654, 0)
end

--**********************************
--Ngß¶i ch½i Trong màn hình Gian Ð« kÏ 
--**********************************
function x391901_Tips(sceneId, selfId, str)
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
--MRUTác ThÑc R°i Trung Dî Ngã Ta Khai Tác Thßþng 703
function x391901_OnCharacterTimer(sceneId, objId, dataId, uTime)
local targetId = LuaFnGetNpcIntParameter(sceneId,objId,0)
if LuaFnIsObjValid(sceneId, targetId) ~= 1 or LuaFnIsCanDoScriptLogic(sceneId, targetId) ~= 1 or LuaFnIsCharacterLiving(sceneId, targetId) ~= 1 then
SetCharacterDieTime(sceneId, objId, 3)
return
end
end
