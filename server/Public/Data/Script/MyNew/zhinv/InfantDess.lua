

--×÷Õß By UK QQ 2269169441 


x900079_g_scriptId = 900079
x900079_g_missmosterdata = MD_MISS_MOSTER_DATA
x900079_g_missmosterobjandscene = MD_MISS_MOSTER_OBJ
function x900079_OnDefaultEvent( sceneId, selfId, nItemIndex)

	local SXCLHR = GetMissionData(sceneId,selfId,MD_INFANTSXCLHR)
	local SXCLHR2 =format("%05d",SXCLHR)
	local IFLV = tonumber(strsub(SXCLHR2,2,4))
	if  IFLV == nil or IFLV < 91 then
		x890547_Tips (sceneId, selfId,"Hài TØ chßa ðÕt t¾i c¤p 91 , không th¬ m£c Th¶i Trang Baby")
		return
	end

	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId >= 30008401 and nItemId <= 30008407  then
	local nUseCount	= GetBagItemParam(sceneId, selfId, nItemIndex, 0, 2)
	local ret = EraseItem(sceneId, selfId, nItemIndex)
	if ret ~= 1 then
	return
	end
	local shisuanid = GetMissionData(sceneId,selfId,x900079_g_missmosterdata)
	if shisuanid >= 1 and shisuanid <= 63 then
    local sisuang = floor((shisuanid-1)/9)+1
    local shisuang = tonumber("3000840"..sisuang)
    if shisuang ~= nil and shisuang >=30008401 and shisuang <=30008507 then
    local mypos = TryRecieveItem( sceneId, selfId, shisuang, 1 )
    if mypos >= 0 then
	SetBagItemParam(sceneId, selfId, mypos, 0, 2, shisuanid)
    x890547_Tips (sceneId, selfId,shisuanid)
	x890547_Tips (sceneId, selfId,shisuang)
	LuaFnItemBind( sceneId, selfId, mypos )
    SetMissionData(sceneId,selfId,x900079_g_missmosterdata,0)
    end
    end
	end
	if nUseCount == 0 then
	nUseCount = (mod(nItemId,10)-1)*9+1
	end
	SetMissionData(sceneId,selfId,x900079_g_missmosterdata,nUseCount)
	--CallScriptFunction( (910052), "Openinfant", sceneId, selfId, 0)
	x900079_reapInfant( sceneId, selfId)
	return
    end

end

function x900079_IsSkillLikeScript( sceneId, selfId)
	return 0
end

function x900079_DelInfantDess( sceneId, selfId)
    local shisuanid = GetMissionData(sceneId,selfId,x900079_g_missmosterdata)
	if shisuanid < 1 or shisuanid > 63 then
	return
	end
	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1  then
	x900079_MsgBox( sceneId, selfId, "túi ðeo thiªu không gian" )
    return
    end
    local sisuang = floor((shisuanid-1)/9)+1
    local shisuang = tonumber("3000840"..sisuang)
    if shisuang ~= nil and shisuang >=30008401 and shisuang <=30008407 then
    local mypos = TryRecieveItem( sceneId, selfId, shisuang, 1 )
    if mypos >= 0 then
	SetBagItemParam(sceneId, selfId, mypos, 0, 2, shisuanid)
    LuaFnItemBind( sceneId, selfId, mypos )
    SetMissionData(sceneId,selfId,x900079_g_missmosterdata,0)
	--CallScriptFunction( (910052), "Openinfant", sceneId, selfId, 0)
	x900079_reapInfant( sceneId, selfId)
    end
    end

end
function x900079_reapInfant( sceneId, selfId)
local myIance2 = GetMissionData(sceneId, selfId,x900079_g_missmosterobjandscene)
if myIance2 <= 0 then
return
end
local objceasence = mod(myIance2,1000)-1
myIance2 = floor(myIance2/1000)
local targetId = LuaFnGetNpcIntParameter( sceneId,myIance2,0)
if LuaFnIsObjValid(sceneId, myIance2) == 1 and LuaFnIsCharacterLiving(sceneId, myIance2) == 1 and targetId == selfId and objceasence == sceneId  then
CallScriptFunction( (890547), "CreateIance", sceneId, selfId)
end

end
function x900079_MsgBox( sceneId, selfId, txt )
		BeginEvent(sceneId)
			AddText(sceneId,txt)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end
