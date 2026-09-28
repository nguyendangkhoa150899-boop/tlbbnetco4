
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

AddText(sceneId,"    Dß¾i mít NhÕn Môn Quan ngoÕi chiªn höa ph¥n tr¶i, thiên tri«u dûng sî cûng là b¸ quän chª tÕi gi¢ng co chiªn cuµc, bíc chinh chi thª khó tiªn thêm næa. Ngày trß¾c lÕi truy«n m§t báo nói Khiªt Ðan nh¤t tµc ðem mang theo kÏ tr§n mà ðªn, t× là quan chi, ÐÕi T¯ng chi binh ðã nguy c½ s¾m t¯i.#r    #Y B·i vì binh thánh phó bän tß½ng ð¯i phÑc tÕp khó khån, ð« ngh¸ ngß¶i ch½i ðªn bän phøc trang web readmore công lßþc, ð¬ t¯t h½n trò ch½i.")


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
    AddText(sceneId,"Binh thánh kÏ tr§n hoàn mÛ quan phß½ng phó bän, chü yªu r½i xu¯ng long vån thång c¤p v§t li®u, m²i ngày ba l¥n, cu¯i cùng thành công ðánh giªt chung cñc BOSS Sau co´ thê? ðÕt ðßþc ðÕi lßþng ban thß·ng, #r#Y    Chú ý: BOSS KÛ nång hoàn mÛ cùng quan phß½ng gi¯ng nhau, c¦n th§n a, ð« ngh¸ ðªn nh¤t ð¸nh c¤p b§c lÕi tiªn hành phó bän trò ch½i!")
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
