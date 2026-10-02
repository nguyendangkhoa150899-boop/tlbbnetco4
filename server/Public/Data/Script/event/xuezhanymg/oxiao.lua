
-- SØa chæa [ ChØ ít h½i 2008.5.29 Tång thêm, ma binh thiên tß¾ng, cñc ph¦m trang b¸ thä ra.]

-- 391201 Sáo trang h¯i ðoái NPC

-- Lß½ng sß thành

-- K¸ch bän g¯c hào
x391201_g_ScriptId = 391201

-- Có sñ ki®n ID Li®t bi¬u
x391201_g_eventList={391200}

--**********************************
-- Sñ ki®n li®t bi¬u
--**********************************
function x391201_UpdateEventList( sceneId, selfId,targetId )
BeginEvent(sceneId)
for i, eventId in x391201_g_eventList do
CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
end

AddText(sceneId,"    Ngo\224i Nh\213n M\244n Quan kh\243i l\216a ng\250t tr\182i, d\251ng s\238 \208\213i T\175ng b\184 c\165m ch\226n trong th\170 gi\162ng co, kh\243 ti\170n th\234m b\223\190c n\224o. M\167t b\225o truy\171n v\171: Khi\170t \208an mang k\207 tr\167n k\233o t\190i, qu\226n T\175ng nguy trong s\190m t\175i.") AddText(sceneId,"#r#Y    Huy\170t Chi\170n Nh\213n M\244n Quan kh\225 kh\243, n\234n l\167p t\177 \240\181i \240\252 m\213nh tr\223\190c khi ti\170n v\224o.") -- [NetCo4 02/10] chu cu noi ve Binh Thanh + trang web -> gioi thieu Nhan Mon (tach 2 AddText cho <= 254 byte)


AddNumText( sceneId, x391201_g_ScriptId, "Liên quan t¾i NhÕn Môn Quan", 0, 500 )
AddNumText( sceneId, x391201_g_ScriptId, "R¶i ði......", 0, 0 )

EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- Sñ ki®n lçn nhau cØa vào
--**********************************
function x391201_OnDefaultEvent( sceneId, selfId,targetId )
x391201_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Sñ ki®n li®t bi¬u ch÷n trúng mµt hÕng
--**********************************
function x391201_OnEventRequest( sceneId, selfId, targetId, eventId )
local nNumText = GetNumText
if eventId == x391201_g_MenPaiTaoScriptId then
if nNumText == 846 then
CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
return
elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
return
end
end
if nNumText == 0  then
-- Ðóng cØa s±
BeginUICommand(sceneId)
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId, 1000)
return
end

if nNumText == 500  then
BeginEvent(sceneId)
    AddText(sceneId,"Huy\170t Chi\170n Nh\213n M\244n Quan: t\177 \240\181i t\215 c\164p 108, m\178i ng\224y t\175i \240a 5 l\223\254t. L\165n l\223\254t \240\166y lui qu\226n Li\234u, h\213 Gia Lu\167t T\226n, Gia Lu\167t Uy\172n, Gia Lu\167t Nguy\234n v\224 cu\175i c\249ng l\224 Gia Lu\167t H\176ng C\189 \240\172 nh\167n th\223\183ng.") AddText(sceneId,"#r#Y    Ch\250 \253: k\219 n\229ng BOSS r\164t m\213nh, h\227y chu\166n b\184 k\219 tr\223\190c khi khi\234u chi\170n!") -- [NetCo4 02/10] chu cu noi Binh Thanh "ba lan" -> Nhan Mon, 5 luot/ngay (code exiao.lua: >= 5)
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
return
end
end

--**********************************
-- Tiªp nh§n này NPC Nhi®m vø
--**********************************
function x391201_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
for i, findId in x391201_g_eventList do
if missionScriptId == findId then
ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
if ret > 0 then
CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
end
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
if ret > 0 then
CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
end
return
end
end
end

--**********************************
-- Cñ tuy®t này NPC Nhi®m vø
--**********************************
function x391201_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
-- Cñ tuy®t v« sau, mu¯n tr· v« NPC Sñ ki®n li®t bi¬u
for i, findId in x391201_g_eventList do
if missionScriptId == findId then
x391201_UpdateEventList( sceneId, selfId, targetId )
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
x391201_UpdateEventList( sceneId, selfId, targetId )
return
end
end
end

--**********************************
-- Tiªp tøc ( Ðã tiªp nhi®m vø )
--**********************************
function x391201_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
for i, findId in x391201_g_eventList do
if missionScriptId == findId then
CallScriptFunction( missionScriptId, "OnDefaultEvent", sceneId, selfId, targetId )
return
end
end
for i, findId in g_eventListTest do
if missionScriptId == findId then
CallScriptFunction( missionScriptId, "OnDefaultEvent", sceneId, selfId, targetId )
return
end
end
end
function x391201_OnDefaultEvent( sceneId, selfId,targetId )
	x391201_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--????????
--**********************************
function x391201_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x391201_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x391201_g_ScriptId )
		return
		end
	end
end
--**********************************
--**********************************
-- TØ vong sñ ki®n
--**********************************
function x391201_OnDie( sceneId, selfId, killerId )
end
