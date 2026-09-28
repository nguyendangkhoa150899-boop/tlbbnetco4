
--By UK QQ 2269169441
--½Å±¾ºÅ
x891176_g_scriptId = 891176

x891176_g_RelationEventList={806001,806002,806000}
x891176_g_My_MD = {MD_ZENG_FA1,MD_ZENG_FA2,MD_ZENG_FA3,MD_ZENG_FA4}
x891176_g_Qing_Yi = MD_ZENG_JING_YI
x891176_g_Qing_Yi_DATA = MD_ZENG_DATA_JING_YI
x891176_g_XuiWei = MD_ZENG_XIUWEI
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x891176_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Mu¯n cùng ngß¶i khác kªt bái sao? Ta có th¬ cho các ngß½i biªt Kim Lan Tr§n Pháp vô ð¸ch thiên hÕ là nhß thª nào.")
		
		AddNumText( sceneId, x891176_g_scriptId, "Gi¾i thi®u kªt bái", 11, 10 )
		AddNumText( sceneId, x891176_g_scriptId, " #cFF0000Nâng C¤p Tr§n Pháp ", 13, 1000 )
		for i, eventId in x891176_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x891176_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1000 then
local MyQingYi = GetMissionData(sceneId, selfId, x891176_g_Qing_Yi)
local QingYiDATA = GetMissionData(sceneId, selfId, x891176_g_Qing_Yi_DATA)
local QingYiValue = mod(QingYiDATA,10000)
local myMissData = floor(QingYiDATA/10000)
local NowXuiWei = GetMissionData(sceneId, selfId, x891176_g_XuiWei)	
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,MyQingYi)
		UICommand_AddInt(sceneId,QingYiValue)
		for i = 1,4 do
		UICommand_AddInt(sceneId,GetMissionData(sceneId, selfId, x891176_g_My_MD[i]))
		end
		UICommand_AddInt(sceneId,NowXuiWei)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20150526)
			return
	end
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_067}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	local i
	local findId
	for i, findId in x891176_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x891176_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x891176_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x891176_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x891176_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x891176_g_RelationEventList do
		if missionScriptId == findId then
			x891176_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end


