x890841_g_scriptId = 890841
BS ={5725,5726,5727,5728}
CreateTable = {
{855,256,272},
{856,292,244},
{857,215,241},
{858,256,250},
}

My_SCORE =MD_GUILDBATTLE_SCORE --- cá nhân ð® trình nguyên thÕch bäo t°n
x890841_g_MainItemId = 30900053
function x890841_OnDefaultEvent( sceneId, selfId,targetId )


BeginEvent(sceneId)
AddText(sceneId, "#cfff263 hoÕt ðµng tóm t¡t:" )
AddText(sceneId, "#cfff263 m²i ngày #G8 ði¬m #cfff263 ðªn #G23 ði¬m #cfff263 trong lúc, nhßng m· ra #G1 thÑ ch§u châu báu #cfff263. #G ch§u châu báu #cfff263 m· ra sau #G15 phút #cfff263 nµi, s· hæu thành viên ð«u nhßng ði trß¾c #G ( 100, 79 ) #R ch§u châu báu #cfff263 ch² hoa" )
AddText(sceneId, "#cfff263 phí #G bang hµi c¯ng hiªn ðµ #cfff263 tham dñ hoÕt ðµng, cûng cån cÑ hoÕt ðµng tham dñ tình hu¯ng, ðÕt ðßþc tång lên #G tÑ tßþng bäo châu #cfff263 trß·ng thành c¤p b§c s· c¥n #G phï thúy tâm tinh #cfff263." )
--- AddText(sceneId, "L¥n này hoÕt ðµng ð¥u nh§p nguyên thÕch t±ng s¯:"..LuaFnGetWorldGlobalData(93).. "Cái" )
AddText(sceneId, "Ngß½i ðã ð¥u nh§p nguyên thÕch s¯:"..GetMissionData(sceneId,selfId,My_SCORE).. "Cái" )
AddNumText( sceneId, x890841_g_scriptId, "Biªn thân ðào thþ mö ngß¶i", 6, 2 )
--AddNumText( sceneId, x890841_g_scriptId, "#G ð¥u nh§p khoáng thÕch", 6, 3 )
AddNumText( sceneId, x890841_g_scriptId, "Ð±i phï thúy tâm tinh", 6, 5 )
AddNumText( sceneId, x890841_g_scriptId, "Hüy bö biªn thân", 6, 4 )
--AddNumText( sceneId, x890841_g_scriptId, "Xoát quái", 6, 1 )
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n danh sách lña ch÷n hÕng nh¤t
--**********************************
function x890841_OnEventRequest( sceneId, selfId, targetId, eventId )
local key = GetNumText()
if key ==0 then
BeginEvent(sceneId)
AddText(sceneId, "#cfff263 hoÕt ðµng tóm t¡t:" )
AddText(sceneId, "#cfff263 m²i ngày #G8 ði¬m #cfff263 ðªn #G23 ði¬m #cfff263 trong lúc, nhßng m· ra #G1 thÑ ch§u châu báu #cfff263. #G ch§u châu báu #cfff263 m· ra sau #G15 phút #cfff263 nµi, s· hæu thành viên ð«u nhßng ði trß¾c #G ( 100, 79 ) #R ch§u châu báu #cfff263 ch² hoa" )
AddText(sceneId, "#cfff263 phí #G bang hµi c¯ng hiªn ðµ #cfff263 tham dñ hoÕt ðµng, cûng cån cÑ hoÕt ðµng tham dñ tình hu¯ng, ðÕt ðßþc tång lên #G tÑ tßþng bäo châu #cfff263 trß·ng thành c¤p b§c s· c¥n #G phï thúy tâm tinh #cfff263." )
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
return
elseif key ==1 then
for i,data in CreateTable do
-- x890841_OnCreate(sceneId,data[1],data[2],data[3])
end
elseif key ==2 then
local nowbuff = x890841_GetBuff( sceneId, selfId )
if nowbuff ==-1 then
LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,BS[1],0)
x890841_MsgList( sceneId, selfId,targetId, "Biªn thân thành công, có th¬ ði hái!" )
else
x890841_MsgList( sceneId, selfId,targetId, "Ngß½i ðã biªn quá thân, không c¥n l£p lÕi biªn thân!" )
end
elseif key ==3 then
local itemcont = LuaFnGetAvailableItemCount(sceneId,selfId,x890841_g_MainItemId)
if itemcont >0 then
LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,BS[1],0)
LuaFnDelAvailableItem(sceneId,selfId,x890841_g_MainItemId,itemcont)
--x890841_MsgBox( sceneId, selfId, "Ngß½i ð¥u nh§p"..itemcont.. "Cái khoáng thÕch ðªn ch§u châu báu trung" )
--local oldnum = LuaFnGetLifeTimeAttrRefix_DefencePhysics( sceneId, targetId )
--LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, targetId, oldnum+itemcont)
--SetMissionData(sceneId,selfId,My_SCORE,GetMissionData(sceneId,selfId,My_SCORE)+itemcont)
return
else
x890841_MsgBox( sceneId, selfId, "Ð¥u nh§p th¤t bÕi, trên ngß¶i cüa ngß½i cûng không có khoáng thÕch!" )
return
end
elseif key ==4 then
local nowbuff = x890841_GetBuff( sceneId, selfId )
if nowbuff >0 then
LuaFnCancelSpecificImpact(sceneId,selfId,nowbuff)
x890841_MsgList( sceneId, selfId,targetId, "Ðã hüy bö ngß½i biªn thân hi®u quä!" )
return
else
x890841_MsgList( sceneId, selfId,targetId, "Ngß½i có th¬ trß¾c ðào qu£ng biªn thân nha, lÕi ðªn l¤y tiêu, có phäi hay không choáng váng?" )
end
elseif key ==5 then
local yiguotime =GetMinute()-LuaFnGetLifeTimeAttrRefix_AttackPhysics( sceneId, targetId)
if yiguotime <15 then
x890841_MsgList( sceneId, selfId,targetId, "HoÕt ðµng ðang · tiªn hành trung, thïnh · hoÕt ðµng sau khi kªt thúc ð±i! Ly kªt thúc nhßng ð±i th¶i gian còn có"..(20-yiguotime).. "Phút!" )
return
end
local yuanshicount = GetMissionData(sceneId,selfId,My_SCORE)
if yuanshicount >0 then
for i=1, yuanshicount do
TryRecieveItem(sceneId,selfId, 38000930,1)
end
SetMissionData(sceneId,selfId,My_SCORE,0)
x890841_MsgList( sceneId, selfId,targetId, "Ngß½i ðã thành công ð±i"..yuanshicount.. "Cái phï thúy tâm tinh" )
return
else
x890841_MsgList( sceneId, selfId,targetId, "Ngß½i cûng không có ð¥u nh§p khoáng thÕch, vô pháp ð±i!" )
end
end

end

function x890841_OnCreate(sceneId,growPointType,x,y)
-- ð¬ vào ItemBox ð°ng th¶i ð¬ vào mµt cái v§t ph¦m
---local targetId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x890841_g_MainItemId) -- m²i cái tª bào sinh trß·ng ít nh¤t có th¬ ðßþc ðªn mµt cái v§t ph¦m, n½i này trñc tiªp ð¬ vào itembox trung mµt cái
LuaFnItemBoxEnterSceneEx(sceneId, x, y, growPointType, 55*1000);

---SetItemBoxMaxGrowTime( sceneId, targetId, 900000 )
end

function x890841_GetBuff( sceneId, selfId )
for i,data in BS do
if LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,data)==1 then
return data
end
end
return -1
end

function x890841_MsgList( sceneId, selfId,targetId, str )
BeginEvent(sceneId)
AddText(sceneId,str)
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end
function x890841_MsgBox( sceneId, selfId, str )
BeginEvent( sceneId )
AddText( sceneId, str )
EndEvent( sceneId )
DispatchMissionTips( sceneId, selfId )
end
--MRUPDJZVMRU làm thÑc trung l¤y

--QR khai ðÕi thßþng mu¯n phát ta chút tri¬n 58158
