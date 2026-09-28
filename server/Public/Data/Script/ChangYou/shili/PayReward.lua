
--½Å±¾ºÅ
x889853_g_ScriptId	= 889853

--**********************************
--
--**********************************
function x889853_OnDefaultEvent(sceneId,selfId,targetId)


	BeginEvent( sceneId )

		   AddNumText( sceneId, x990010_g_scriptId, "#cffcc00NÕp m²i ngày", 6, 1)
		   AddNumText( sceneId, x990010_g_scriptId, "#GThu v« trang b¸", 6, 2)

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x889853_OnEventRequest(sceneId,selfId,targetId,eventId)


if	GetNumText() == 1	then
	    BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 8898532)
	end

	if	GetNumText() == 2	then
		
	--TryRecieveItem( sceneId, selfId, 10553217, 1)
    --TryRecieveItem( sceneId, selfId, 10553218, 1)
    --TryRecieveItem( sceneId, selfId, 10553219, 1)
   -- TryRecieveItem( sceneId, selfId, 10412000, 1)	
		
	        BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20180209)
	end
end



function x889853_UpdateGetPrizeBtnState(sceneId, selfId)
local faldata = {MF_CHONGSHI_FL1,MF_CHONGSHI_FL2,MF_CHONGSHI_FL3,MF_CHONGSHI_FL4,MF_CHONGSHI_FL5}
local duhuangv = {10,20,50,100,200}
local AAddB = {0,0,0,0,0}
local mymissdata = GetMissionData(sceneId, selfId,MD_MISS_CHONGSHIDATA)
local myissvalue = GetMissionData(sceneId, selfId,MD_MISS_CHONGSHIVALUE)
local CurDayTime = GetDayTime()
if CurDayTime > mymissdata then
	myissvalue = 0
end
for i = 1,5 do
if myissvalue >= duhuangv[i] then
AAddB[i] = 1 + GetMissionFlag(sceneId, selfId, faldata[i])
end
end

		BeginUICommand( sceneId )
		for i = 1,5 do
		UICommand_AddInt( sceneId, AAddB[i])
		end
		UICommand_AddInt( sceneId, 0)
		UICommand_AddInt( sceneId, myissvalue)	
		UICommand_AddString(sceneId,"PayReward");		
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 88985321 )

end
--**********************************
--
--**********************************
function x889853_GetNewPrizes( sceneId, selfId, targetId, param2, param3, param4, param5 )
if targetId == nil or targetId < 1 or targetId > 5 then
return
end
local faldata = {MF_CHONGSHI_FL1,MF_CHONGSHI_FL2,MF_CHONGSHI_FL3,MF_CHONGSHI_FL4,MF_CHONGSHI_FL5}
local duhuangv ={10,20,50,100,200}
local AAddB = {0,0,0,0,0}
local mymissdata = GetMissionData(sceneId, selfId,MD_MISS_CHONGSHIDATA)
local myissvalue = GetMissionData(sceneId, selfId,MD_MISS_CHONGSHIVALUE)
local CurDayTime = GetDayTime()
if CurDayTime > mymissdata then
	myissvalue = 0
end
if myissvalue < duhuangv[targetId] then
x889853_TipBox( sceneId, selfId, "Ngài còn không có ðÕt ðßþc, cái này khen thß·ng" )
return
end
local mymissMF = GetMissionFlag(sceneId, selfId, faldata[targetId])
if mymissMF ~= 0 then
x889853_TipBox( sceneId, selfId, "Ngài ðã lînh, nên khen thß·ng" )
return
end
local g_myitemlist = {}

	g_myitemlist[ 1 ] = {20800033,20310176,38000930,20800031}
	g_myitemlist[ 2 ] = {20800033,20310176,38000930,20800031}
	g_myitemlist[ 3 ] = {20800033,20310176,38000930,20800031}
	g_myitemlist[ 4 ] = {20310179,30008090,38000930,20800031}
	g_myitemlist[ 5 ] = {20310179,30008090,38000930,20800031}
local itemnum = {}
	itemnum[ 1 ] = {5,5,5,5}
	itemnum[ 2 ] = {10,10,10,10}
	itemnum[ 3 ] = {10,10,10,10}
	itemnum[ 4 ] = {5,1,20,20}
	itemnum[ 5 ] = {10,2,30,30}

BeginAddItem(sceneId)
for i = 1,4 do
AddItem( sceneId, g_myitemlist[targetId][i], itemnum[targetId][i] )
end
local ret = EndAddItem(sceneId,selfId)
if ret <= 0 then
		return
end
AddItemListToHuman(sceneId,selfId)
SetMissionFlag(sceneId, selfId, faldata[targetId],1)
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
x889853_TipBox( sceneId, selfId, "Chúc m×ng ngài, thành công lînh ["..duhuangv[targetId].. "] nguyên ðÕi l­ bao" )
local sNameBroad = GetName(sceneId, selfId)
local message = format("#W#{_INFOUSR%s}#P lînh #G m²i ngày ð¥u sung #R%s#P nguyên ðÕi l­ bao #Y#e0000ff M²i ngày ð¥u sung · màn hình góc trên bên phäi ði¬m ðánh xem xét ", sNameBroad,duhuangv[targetId]);
BroadMsgByChatPipe(sceneId, selfId, message, 4);
x889853_UpdateGetPrizeBtnState(sceneId, selfId)
end


function x889853_TipBox( sceneId, selfId, msg )

		BeginEvent(sceneId)
		AddText(sceneId,msg);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
end



function x889853_Shop_Dress(sceneId,selfId,idxxxx,lianxing,faxing,fase,touxiang)

local shuju = {lianxing,faxing,fase,touxiang}


--x889853_TipBox( sceneId, selfId, "²âÊÔ£º"..shuju[1]..","..shuju[2]..","..shuju[3]..","..shuju[4] )

--if idxxxx == 1  then

ChangeHumanFaceModel( sceneId, selfId, lianxing )

--end

--if idxxxx == 2 then
LuaFnChangeHumanHairModel( sceneId, selfId, touxiang )
--end

--if idxxxx == 3 then
--SetHumanHairColor( sceneId, selfId, fase )
--end 

--if idxxxx == 4 then
ChangePlayerHeadImage( sceneId, selfId, fase )	
--end



end