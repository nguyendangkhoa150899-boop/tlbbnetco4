
-- sØa chæa [ ChØ thiªu h½i 2008.5.29 tång thêm, ma binh thiên tß¾ng, cñc ph¦m trang b¸ thä ra. ]

-- 760601 trang phøc ð±i NPC

-- lß½ng sß thành

-- k¸ch bän g¯c hào
x760601_g_ScriptId = 760601

-- s· có ðßþc sñ ki®n ID danh sách
x760601_g_eventList={900021}

-- giäi quyªt xói mòn su¤t ð±i môn phái trang phøc sñ ki®n k¸ch bän g¯c
x760601_g_MenPaiTaoScriptId = 500617

x760601_g_EquipList={
-- tai thö
{n=110,id=10410004},
}

x760601_g_StoneList={
-- 1 c¤p cøc ðá
{n=1,id=38002554,num=50,str= "Thö tr¡ng tinh h°n" },

}

--**********************************
-- sñ ki®n danh sách
--**********************************
function x760601_UpdateEventList( sceneId, selfId,targetId )
BeginEvent(sceneId)
--AddText(sceneId, "#{JPZB_0610_01}" )
for i, eventId in x760601_g_eventList do
CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
end

AddText( sceneId, "A di ðà ph§t! Hi®n gi¶ loÕn thª, võ ngh® cao cß¶ng giä ch² nào cûng có, nhßng lÕi có m¤y ngß¶i thì ra hü vì tuy®t ðïnh cao thü? Ngß¶i t§p võ, Ñng mµt lòng hß¾ng thi®n, lòng dÕ rµng l¾n, m¾i có th¬ luy®n thành tuy®t h÷c. Nªu thí chü cûng có mµt viên hß¾ng thi®n chi tâm, có l¨ có th¬ · lão nÕp n½i này dùng #G50 cái thö tr¡ng tinh h°n #W ð±i l¤y thßþng c± th¥n binh trang b¸ tai thö." )
AddNumText( sceneId, x760601_g_ScriptId, "Ð±i tai thö", 6, 100 )
--AddNumText( sceneId, x760601_g_ScriptId, "Ð±i gi¾i thi®u", 11, 10000 )
AddNumText( sceneId, x760601_g_ScriptId, "R¶i ði..", 0, 0 )
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n lçn nhau nh§p kh¦u
--**********************************
function x760601_OnDefaultEvent( sceneId, selfId,targetId )
x760601_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- sñ ki®n danh sách lña ch÷n hÕng nh¤t
--**********************************
function x760601_OnEventRequest( sceneId, selfId, targetId, eventId )
local nNumText = GetNumText()

if eventId == x760601_g_MenPaiTaoScriptId then
if nNumText == 846 then
CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
return
elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
return
end
end

if nNumText == 0 then
-- ðóng cØa cØa s±
BeginUICommand(sceneId)
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId, 1000)
return
end

if nNumText == 100 or nNumText == 200 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000 then
BeginEvent(sceneId)
AddText(sceneId, "#I thïnh lña ch÷n ngài yêu c¥u ð±i mu¯n quyªt:" )
if nNumText == 100 then
AddNumText(sceneId, x889097_g_ScriptId, "Tai thö", 6, nNumText+10)
end
AddNumText( sceneId, x760601_g_ScriptId, "R¶i ði..", 0, 0 )
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
return
end

if nNumText > 100 and nNumText < 9000 then
BeginEvent(sceneId)
AddText(sceneId, "A di ðà ph§t! Ngã ph§t t× bi, thiªu hi®p thïnh nh¾ l¤y h÷c ðßþc này mu¯n quyªt sau nh¤t ð¸nh phäi tâm t°n thi®n ni®m, ch¾ có sát tâm a." )

local nLevel = 0
if nNumText > 100 then
nLevel = 1
end
if nNumText > 1000 then
nLevel = 1
end
if nNumText > 2000 then
nLevel = 2
end
if nNumText > 3000 then
nLevel = 3
end
if nNumText > 4000 then
nLevel = 4
end
if nNumText > 5000 then
nLevel = 5
end
if nNumText > 5700 then
nLevel = 16
end
if nNumText > 6000 then
nLevel = 6
end
if nNumText > 6100 then
nLevel = 7
end
if nNumText > 6200 then
nLevel = 8
end
if nNumText > 6300 then
nLevel = 9
end
if nNumText > 6400 then
nLevel = 10
end
if nNumText > 6500 then
nLevel = 11
end
if nNumText > 6600 then
nLevel = 15
end
if nNumText > 7000 then
nLevel = 12
end
if nNumText > 7100 then
nLevel = 12
end
if nNumText > 7200 then
nLevel = 12
end
if nNumText > 7300 then
nLevel = 12
end
if nNumText > 8000 then
nLevel = 13
end
if nNumText > 8100 then
nLevel = 13
end
if nNumText > 8200 then
nLevel = 13
end

local szStr = "Mu¯n ðÕt ðßþc cái này trang b¸, ngài yêu c¥u cho ta #G ".. x760601_g_StoneList[nLevel].str
.." ".. tostring(x760601_g_StoneList[nLevel].num).. " #W cái. #r "
AddText(sceneId, szStr)

for i, item in x760601_g_EquipList do
if item.n == nNumText then
AddRadioItemBonus( sceneId, item.id, 4 )
end
end
EndEvent(sceneId)
--DispatchMissionDemandInfo(sceneId,selfId,targetId, x760601_g_ScriptId, x210200_g_MissionId)
DispatchMissionContinueInfo(sceneId,selfId,targetId, x760601_g_ScriptId, 0)

end

for i, findId in x760601_g_eventList do
if eventId == findId then
CallScriptFunction( eventId," OnDefaultEvent ",sceneId, selfId, targetId )
return
end
end
-- ChØ thiªu h½i, 2008.5.29. Cñc ph¦m trang b¸ thä ra. Tång thêm hai cái cái nút xØ lý sñ ki®n
if nNumText == 9000 then
BeginEvent(sceneId)
local szStr =" #{JPZB_0610_06} "
AddText(sceneId, szStr)
for i, item in x760601_g_EquipList do
if item.n == 9100 then
AddRadioItemBonus( sceneId, item.id, 4 )
end
end
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
DispatchMissionContinueInfo(sceneId,selfId,targetId, x760601_g_ScriptId, 0)
end
-- ma binh tr¶i giáng gi¾i thi®u
if nNumText == 10000 then
BeginEvent(sceneId)
--AddText( sceneId," #{JPZB_20080523_01} ")
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

end

--**********************************
-- tiªp thu này NPC nhi®m vø
--**********************************
function x760601_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
for i, findId in x760601_g_eventList do
if missionScriptId == findId then
ret = CallScriptFunction( missionScriptId," CheckAccept ", sceneId, selfId )
if ret > 0 then
CallScriptFunction( missionScriptId," OnAccept ", sceneId, selfId )
end
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
ret = CallScriptFunction( missionScriptId," CheckAccept ", sceneId, selfId )
if ret > 0 then
CallScriptFunction( missionScriptId," OnAccept ", sceneId, selfId )
end
return
end
end
end

--**********************************
-- cñ tuy®t này NPC nhi®m vø
--**********************************
function x760601_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
-- cñ tuy®t lúc sau, mu¯n phän h°i NPC sñ ki®n danh sách
for i, findId in x760601_g_eventList do
if missionScriptId == findId then
x760601_UpdateEventList( sceneId, selfId, targetId )
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
x760601_UpdateEventList( sceneId, selfId, targetId )
return
end
end
end

--**********************************
-- tiªp tøc ( ðã tiªp nhi®m vø )
--**********************************
function x760601_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
for i, findId in x760601_g_eventList do
if missionScriptId == findId then
CallScriptFunction( missionScriptId," OnContinue ", sceneId, selfId, targetId )
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
CallScriptFunction( missionScriptId," OnContinue ", sceneId, selfId, targetId )
return
end
end
end

--**********************************
-- ð® trình ðã làm xong nhi®m vø
--**********************************
function x760601_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

-- xØ lý ð® trình sau bi¬u hi®n tình hu¯ng
-- vì an toàn, n½i này mu¯n c¦n th§n, không th¬ làm l²i
local nItemIndex = -1

if missionScriptId == x760601_g_MenPaiTaoScriptId then
CallScriptFunction( missionScriptId," OnMissionSubmit ", sceneId, selfId, targetId, missionScriptId, selectRadioId )
return 0
end

for i, item in x760601_g_EquipList do
if item.id == selectRadioId then
nItemIndex = i
end
end

if nItemIndex == -1 then
return
end

-- xem xong gia có phäi hay không ðü tài li®u ð® trình
local nLevel = 0
if x760601_g_EquipList[nItemIndex].n > 100 then
nLevel = 1
end
if x760601_g_EquipList[nItemIndex].n > 1000 then
nLevel = 1
end
if x760601_g_EquipList[nItemIndex].n > 2000 then
nLevel = 2
end
if x760601_g_EquipList[nItemIndex].n > 3000 then
nLevel = 3
end
if x760601_g_EquipList[nItemIndex].n > 4000 then
nLevel = 4
end
if x760601_g_EquipList[nItemIndex].n > 5000 then
nLevel = 5
end
if x760601_g_EquipList[nItemIndex].n > 6000 then
nLevel = 6
end
if x760601_g_EquipList[nItemIndex].n > 6100 then
nLevel = 7
end
if x760601_g_EquipList[nItemIndex].n > 6200 then
nLevel = 8
end
if x760601_g_EquipList[nItemIndex].n > 6300 then
nLevel = 9
end
if x760601_g_EquipList[nItemIndex].n > 6400 then
nLevel = 10
end
if x760601_g_EquipList[nItemIndex].n > 6500 then
nLevel = 11
end
if x760601_g_EquipList[nItemIndex].n > 6600 then
nLevel = 15
end
if x760601_g_EquipList[nItemIndex].n > 7000 then
nLevel = 12
end
if x760601_g_EquipList[nItemIndex].n > 7100 then
nLevel = 12
end
if x760601_g_EquipList[nItemIndex].n > 7200 then
nLevel = 12
end
if x760601_g_EquipList[nItemIndex].n > 7300 then
nLevel = 12
end
if x760601_g_EquipList[nItemIndex].n > 8000 then
nLevel = 13
end
if x760601_g_EquipList[nItemIndex].n > 8100 then
nLevel = 13
end
if x760601_g_EquipList[nItemIndex].n > 8200 then
nLevel = 13
end

-- ChØ thiªu h½i, 2008.5.29. Cñc ph¦m trang b¸ thä ra.
if x760601_g_EquipList[nItemIndex].n == 9100 then
if selectRadioId == 10422016 then
nLevel = 9
else
if selectRadioId == 10423024 then
nLevel = 10
end
end
end

local bStoneOk = 0
if GetItemCount(sceneId, selfId, x760601_g_StoneList[nLevel].id) >= x760601_g_StoneList[nLevel].num then
bStoneOk = 1
end

if bStoneOk == 0 then
BeginEvent(sceneId)
if nLevel == 9 then
strText =" #{JPZB_0610_07} "
elseif nLevel == 10 then
strText =" #{JPZB_0610_08} "
else
strText =" ngß½i ba lô Thö tr¡ng tinh h°n không ðü 50 cái, ð±i l¤y th¤t bÕi. "
end
AddText(sceneId,strText);
EndEvent(sceneId)
DispatchMissionTips(sceneId,selfId)
return
end

-- ki¬m tra có phäi hay không có cûng ðü cøc ðá có th¬ kh¤u tr×
if LuaFnGetAvailableItemCount(sceneId, selfId, x760601_g_StoneList[nLevel].id) < x760601_g_StoneList[nLevel].num then
BeginEvent(sceneId)
-- ChØ thiªu h½i, 2008.5.29. Cñc ph¦m trang b¸ thä ra.
if nLevel == 9 then
strText =" #{JPZB_0610_07} "
elseif nLevel == 10 then
strText =" #{JPZB_0610_08} "
else
strText =" ngß½i không có ðü tài li®u có th¬ b¸ kh¤u tr×, thïnh ki¬m tra v§t ph¦m hay không khóa lÕi. "
end

AddText(sceneId,strText);
EndEvent(sceneId)
DispatchMissionTips(sceneId,selfId)
return

end

-- ki¬m tra ba lô không gian
BeginAddItem(sceneId)
AddItem(sceneId, selectRadioId, 1)
local bBagOk = EndAddItem(sceneId, selfId)

if bBagOk < 1 then
BeginEvent(sceneId)
strText =" #{JPZB_0610_11} "
AddText(sceneId,strText);
EndEvent(sceneId)
DispatchMissionTips(sceneId,selfId)
return
end
local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x760601_g_StoneList[nLevel].id)
local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)

-- c¡t bö tß½ng quan cøc ðá
local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x760601_g_StoneList[nLevel].id, x760601_g_StoneList[nLevel].num)

if bDelOk < 1 then
BeginEvent(sceneId)
strText =" kh¤u tr× tài li®u th¤t bÕi. "
AddText(sceneId,strText);
EndEvent(sceneId)
DispatchMissionTips(sceneId,selfId)
return
else
-- c¤p xong gia ð° v§t, hoàn thành
-- AddItemListToHuman(sceneId,selfId)
--
local nBagIndex = TryRecieveItem( sceneId, selfId, x760601_g_EquipList[nItemIndex].id, 1 );

-- ChØ thiªu h½i, 2008.5.29. Cñc ph¦m trang b¸ thä ra. Này hai cái cñc ph¦m trang b¸ vô pháp khoan, cßÞng chª kh¡c minh
-- LuaFnEquipLock( sceneId, selfId, nBagIndex )

BeginEvent(sceneId)
strText =" #{JPZB_0610_13} "
AddText(sceneId,strText);
EndEvent(sceneId)
DispatchMissionTips(sceneId,selfId)

local message;
local randMessage = random(3);
local sItemName = GetItemName(sceneId, x760601_g_EquipList[nItemIndex].id)

local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)

if randMessage == 1 then
message = format(" #G Tân Thü Thôn #R tai thö th¥n npc#I c¥m #Y%d#I cái #W#{_INFOMSG%s}#I tñ ðáy lòng ni®m ðªn: #W#{_INFOUSR%s} th§t là võ h÷c kÏ tài, v÷ng thiªu hi®p ðßþc ðªn cái này thßþng c± th¥n binh trang b¸ #{_INFOMSG%s} sau mu¯n mµt lòng hß¾ng thi®n, ch¾ tÕo quá nhi«u giªt chóc.", x760601_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
elseif randMessage == 2 then
message = format( "#G Tân Thü Thôn #R tai thö th¥n npc#I c¥m #Y%d#I cái #W#{_INFOMSG%s}#I tñ ðáy lòng ni®m ðªn: #W#{_INFOUSR%s} th§t là võ h÷c kÏ tài, v÷ng thiªu hi®p ðßþc ðªn cái này thßþng c± th¥n binh trang b¸ #{_INFOMSG%s} sau mu¯n mµt lòng hß¾ng thi®n, ch¾ tÕo quá nhi«u giªt chóc.", x760601_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
else
message = format( "#G Tân Thü Thôn #R tai thö th¥n npc#I c¥m #Y%d#I cái #W#{_INFOMSG%s}#I tñ ðáy lòng ni®m ðªn: #W#{_INFOUSR%s} th§t là võ h÷c kÏ tài, v÷ng thiªu hi®p ðßþc ðªn cái này thßþng c± th¥n binh trang b¸ #{_INFOMSG%s} sau mu¯n mµt lòng hß¾ng thi®n, ch¾ tÕo quá nhi«u giªt chóc.", x760601_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
end

-- ChØ thiªu h½i, 2008.5.29. Cñc ph¦m trang b¸ thä ra.
if nLevel == 6 then
--message = format( "#G ðÕi lý ( 180, 183 ) #R quét rác tång #I c¥m #Y%d#I trß½ng #W#{_INFOMSG%s}#I tñ ðáy lòng ni®m ðªn: #W#{_INFOUSR%s} th§t là võ h÷c kÏ tài, v÷ng thiªu hi®p h÷c ðßþc này b±n #{_INFOMSG%s} sau mu¯n mµt lòng hß¾ng thi®n, c¥n thêm luy®n t§p a.", GetName(sceneId, selfId), szTransferEquip);
end
if nLevel == 7 then
--message = format( "#G ðÕi lý ( 180, 183 ) #R quét rác tång #I c¥m #Y%d#I trß½ng #W#{_INFOMSG%s}#I tñ ðáy lòng ni®m ðªn: #W#{_INFOUSR%s} th§t là võ h÷c kÏ tài, v÷ng thiªu hi®p h÷c ðßþc này b±n #{_INFOMSG%s} sau mu¯n mµt lòng hß¾ng thi®n, c¥n thêm luy®n t§p a.", GetName(sceneId, selfId), szTransferEquip);
end
if nLevel == 8 then
--message = format( "#G ðÕi lý ( 180, 183 ) #R quét rác tång #I c¥m #Y%d#I trß½ng #W#{_INFOMSG%s}#I tñ ðáy lòng ni®m ðªn: #W#{_INFOUSR%s} th§t là võ h÷c kÏ tài, v÷ng thiªu hi®p h÷c ðßþc này b±n #{_INFOMSG%s} sau mu¯n mµt lòng hß¾ng thi®n, c¥n thêm luy®n t§p a.", GetName(sceneId, selfId), szTransferEquip);
end

BroadMsgByChatPipe(sceneId, selfId, message, 4);

return
end

for i, findId in x760601_g_eventList do
if missionScriptId == findId then
CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
return
end
end
end

--**********************************
-- tØ vong sñ ki®n
--**********************************
function x760601_OnDie( sceneId, selfId, killerId )
end
