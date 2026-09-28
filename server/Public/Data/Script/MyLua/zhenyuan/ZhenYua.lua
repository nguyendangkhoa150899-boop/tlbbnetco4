
x889900_g_scriptId = 889900

--**********************************
--
--**********************************
x889900_data1 = MY_ZHENYUANDATA1
x889900_data2 = MY_ZHENYUANDATA2
x889900_data3 = MY_ZHENYUANDATA3
x889900_ZhenYuanPa = MY_ZHENYUANPA
x889900_txtof = {"真元·厚体","真元·迅捷","真元·沉冰","真元·炽火","真元·印玄","真元·蛊毒","真元·百步穿杨","真元·滑不沾衣","真元·暴猛如焰","真元·坚韧如岳","真元·厚体","真元·厚体"}
x889900_delitemcom = {3000,6000,9000,12000,15000,18000,21000,24000,27000,30000}
function x889900_OnUpgradeClicked( sceneId, selfId, targetId, targetId1)
if targetId <= 0 or targetId > 12 then
return
end
if targetId1 < 0 or targetId1 > 1 then
return
end
local mysujidata = targetId+(targetId1*6)
local tapey = floor((mysujidata-1)/4)+1
local missdata = x889900_data1
if tapey == 2 then 
missdata = x889900_data2
elseif tapey == 3 then
missdata = x889900_data3
end
local data = GetMissionData(sceneId, selfId, missdata)   --GetMissionData(sceneId, selfId, MY_ZHENYUANPA)
local uptaby = mod((mysujidata-1),4)+1
local data1 = mod(data,(100^uptaby))
local data2 = floor(data1/(100^(uptaby-1)))
data2 = data2 + 1
if data2 > 10 then
x889900_NotifyTip( sceneId, selfId, "["..x889900_txtof[mysujidata].."]等级已经达到最高级" )
return
end
local ZhenYuanPa = GetMissionData(sceneId, selfId, x889900_ZhenYuanPa)
if ZhenYuanPa < x889900_delitemcom[data2] then
x889900_NotifyTip( sceneId, selfId, "拥有[元晶]不足"..x889900_delitemcom[data2].."点，无法提升真元等级" )
return
end
local bingendata = floor(data/(100^uptaby))*(100^uptaby)
local enddata = mod(data,(100^(uptaby-1)))
local zhlong = data2*(100^(uptaby-1))
local alldata = bingendata+enddata+zhlong
SetMissionData(sceneId, selfId, missdata,alldata)
SetMissionData(sceneId, selfId, x889900_ZhenYuanPa,ZhenYuanPa-x889900_delitemcom[data2])
x889900_UPZhenYuanData( sceneId, selfId)
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
x889900_NotifyTip( sceneId, selfId, "恭喜您成功将["..x889900_txtof[mysujidata].."]提升到["..data2.."]级" )
x889900_OpenZhenYuan( sceneId, selfId, "u")
end

function x889900_GetZhenYuanData( sceneId, selfId)
local ZhenYuanData1 = GetMissionData(sceneId, selfId,MY_ZHENYUANDATA1)
local ZhenYuanData2 = GetMissionData(sceneId, selfId,MY_ZHENYUANDATA2)
local ZhenYuanData3 = GetMissionData(sceneId, selfId,MY_ZHENYUANDATA3)
local ZhenYuanBUFFF = {mod(ZhenYuanData1,100),floor(mod(ZhenYuanData1,100^2)/100),floor(mod(ZhenYuanData1,100^3)/100^2),floor(mod(ZhenYuanData1,100^4)/100^3),mod(ZhenYuanData2,100),floor(mod(ZhenYuanData2,100^2)/100),floor(mod(ZhenYuanData2,100^3)/100^2),floor(mod(ZhenYuanData2,100^4)/100^3),mod(ZhenYuanData3,100),floor(mod(ZhenYuanData3,100^2)/100),floor(mod(ZhenYuanData3,100^3)/100^2),floor(mod(ZhenYuanData3,100^4)/100^3)}
return ZhenYuanData1,ZhenYuanData2,ZhenYuanData3,ZhenYuanBUFFF
end
x889900_BUFFList = {25820,25850,25900,25910,25920,25930,25860,25870,25880,25890,25820,25820}
function x889900_UPZhenYuanData( sceneId, selfId)
local _,_,_,SuSulist = x889900_GetZhenYuanData( sceneId, selfId)
local tili = 0
for i = 1,getn(SuSulist) do
if i == 1 or i == getn(SuSulist)-1 or i == getn(SuSulist) then
if SuSulist[i] > 0 then
tili = tili+SuSulist[i]
end
else
if SuSulist[i] > 0 and x889900_BUFFList[i]+(SuSulist[i]-1) >= x889900_BUFFList[i] and  x889900_BUFFList[i]+(SuSulist[i]-1) <= x889900_BUFFList[i] + 10 then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x889900_BUFFList[i]+(SuSulist[i]-1)) == 0 then
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x889900_BUFFList[i]+(SuSulist[i]-1), 0 )
end
end
end
end

if tili > 0 and x889900_BUFFList[1]+(tili-1) >= x889900_BUFFList[1] and x889900_BUFFList[1]+(tili-1) <= x889900_BUFFList[1]+30 then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x889900_BUFFList[1]+(tili-1)) == 0 then
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x889900_BUFFList[1]+(tili-1), 0 )
end
end

end
function x889900_OpenZhenYuan( sceneId, selfId, key)
local  PlayerSex=GetSex(sceneId,selfId)
local Data1 = GetMissionData(sceneId, selfId,MY_ZHENYUANDATA1)
local Data2 = GetMissionData(sceneId, selfId,MY_ZHENYUANDATA2)
local Data3 = GetMissionData(sceneId, selfId,MY_ZHENYUANDATA3)
local ZhenYuanPa = GetMissionData(sceneId, selfId, MY_ZHENYUANPA)
local Data1 = format("%08d",Data1)
local Data2 = format("%08d",Data2)
local Data3 = format("%08d",Data3)
if Data1 == nil then
Data1 = "00000000"
end
if Data2 == nil then
Data2 = "00000000"
end
if Data3 == nil then
Data3 = "00000000"
end

	      BeginUICommand(sceneId)
	      UICommand_AddInt(sceneId,ZhenYuanPa)
		  UICommand_AddInt(sceneId,PlayerSex+1)
		  UICommand_AddString(sceneId,key)
		  UICommand_AddString(sceneId,Data1)
	      UICommand_AddString(sceneId,Data2)
	      UICommand_AddString(sceneId,Data3)
	      EndUICommand( sceneId )
	      DispatchUICommand(sceneId,selfId,2015070299)
end
--**********************************
--
--**********************************
function x889900_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end