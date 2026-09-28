--ÂåÑôNPC
--³Â·òÖ®
--ÆÕÍ¨

--½Å±¾ºÅ
x300104_g_scriptId = 300104

--Ä¿±êNPC
x300104_g_name	="ÕÅÊ¿Ôª"

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í {ÕæÔªÄý¾Û,ÕæÔªÆô·â}
x300104_g_RelationEventList={}
x300104_g_zhenyuandata = {MD_ZHENYUANMISS1,MD_ZHENYUANMISS2,MD_ZHENYUANMISS3,MD_ZHENYUANMISS4,MD_ZHENYUANMISS5,MD_ZHENYUANMISS6}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x300104_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{ZYXT_120528_01}")
		--AddText(sceneId,"#ef12345#YChÑc nång tÕm chßa m· ")
           if GetLevel( sceneId, selfId ) >= 80 then
		   
		AddNumText( sceneId, x300104_g_scriptId, "Chân Nguyên Giäi Phong", 6, 1 )
		AddNumText( sceneId, x300104_g_scriptId, "Chân Nguyên Ngßng Nguyên", 6, 2 )
		for i, eventId in x300104_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
           else
	        AddText(sceneId, "#r   #cFF0000 ÐÆng c¤p cüa b¢ng hæu không ðü 80, không th¬ m· Chân Nguyên")
           end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x300104_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 1 then
	local suipian = GetMissionData( sceneId, selfId, SY_PA)
	local  PlayerSex=GetSex(sceneId,selfId)+1
	local data = GetMissionData( sceneId, selfId, MD_ZHENYUANJEIFENG1)
    local str = format("%06d",data)
	if str == nil then
	str = "000000"
	end
	local data2 = GetMissionData( sceneId, selfId, MD_ZHENYUANJEIFENG2)
    local str2 = format("%06d",data2)
	if str2 == nil then
	str2 = "000000"
	end
	local mystring = ""
	local datasws = 0
	local strswd =""
    for i = 1,getn(x300104_g_zhenyuandata) do
	datasws = GetMissionData( sceneId, selfId, x300104_g_zhenyuandata[i])
	strswd =  format("%08d",datasws)
	if strswd == nil then
	strswd = strrep("0",8)
	end
	mystring = mystring..strswd
	end
	if mystring == nil then
	mystring = strrep("0",48)
	end
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
	UICommand_AddInt( sceneId, suipian )
	UICommand_AddInt( sceneId, PlayerSex )
	UICommand_AddString( sceneId, str..str2)
	UICommand_AddString( sceneId, mystring)
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId,  88990099)
			return
	end
	if GetNumText() == 2 then
	local suipian = GetMissionData( sceneId, selfId, SY_PA)
	local yuanjing = GetMissionData( sceneId, selfId, SY_SUI)
	local  PlayerSex=GetSex(sceneId,selfId)+1
	local data = GetMissionData( sceneId, selfId, MD_ZHENYUANJEIFENG1)
    local str = format("%06d",data)
	if str == nil then
	str = "000000"
	end
	local data2 = GetMissionData( sceneId, selfId, MD_ZHENYUANJEIFENG2)
    local str2 = format("%06d",data2)
	if str2 == nil then
	str2 = "000000"
	end
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
	UICommand_AddInt( sceneId, yuanjing )
	UICommand_AddInt( sceneId, suipian )
	UICommand_AddInt( sceneId, suipian )
	UICommand_AddInt( sceneId, suipian )
	UICommand_AddString( sceneId, str)
	UICommand_AddString( sceneId, str2)
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId,  88990001)
			return
	end	

	local i
	local findId
	for i, findId in x300104_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x300104_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
--**********************************
-- 
--**********************************
function x300104_AddUI(sceneId, selfId,type)
if not type or type == nil then
return
end
if type < 103 or type > 104 then

return
end
	local  PlayerSex=GetSex(sceneId,selfId)+1
	local data = GetMissionData( sceneId, selfId, MD_ZHENYUANJEIFENG1)
    local str = format("%06d",data)
	if str == nil then
	str = "000000"
	end
	local data2 = GetMissionData( sceneId, selfId, MD_ZHENYUANJEIFENG2)
    local str2 = format("%06d",data2)
	if str2 == nil then
	str2 = "000000"
	end
	local mystring = ""
	local datasws = 0
	local strswd =""
    for i = 1,getn(x300104_g_zhenyuandata) do
	datasws = GetMissionData( sceneId, selfId, x300104_g_zhenyuandata[i])
	strswd =  format("%08d",datasws)
	if strswd == nil then
	strswd = strrep("0",8)
	end
	mystring = mystring..strswd
	end
	if mystring == nil then
	mystring = strrep("0",48)
	end

			local suipian = GetMissionData( sceneId, selfId, SY_PA)
	        local yuanjing = GetMissionData( sceneId, selfId, SY_SUI)
        	BeginUICommand( sceneId )
        	UICommand_AddInt(sceneId,yuanjing)
			UICommand_AddInt(sceneId,PlayerSex)
	        UICommand_AddInt(sceneId,suipian)
		UICommand_AddString( sceneId, "o" )
		UICommand_AddString( sceneId, str..str2 )
		UICommand_AddString( sceneId, mystring )
		EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  2015070299)

end
--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x300104_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x300104_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x300104_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x300104_g_RelationEventList do
		if missionScriptId == findId then
			x300104_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
