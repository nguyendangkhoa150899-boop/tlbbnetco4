--ÕÒÈËÈÎÎñ
--Ðþ¼ÅÑ°ÕÒ»Û·½
--MisDescBegin
--½Å±¾ºÅ
x220900_g_ScriptId = 220900

--ÈÎÎñºÅ
x220900_g_MissionId = 1064

--ÉÏÒ»¸öÈÎÎñµÄID
--g_MissionIdPre = 

--Ä¿±êNPC
x220900_g_Name	="Tu® Phß½ng"

--ÈÎÎñ¹éÀà
x220900_g_MissionKind = 20

--ÈÎÎñµÈ¼¶
x220900_g_MissionLevel = 10

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x220900_g_IfMissionElite = 0

--ÈÎÎñÃû
x220900_g_MissionName="Chiªn ð¤u vì sß môn"
x220900_g_MissionInfo="#{event_shaolin_0001}"
x220900_g_MissionTarget="    — Thiªu Lâm Tñ tìm Tu® Phß½ng #{_INFOAIM96,82,9, Tu® Phß½ng}. "
x220900_g_MissionComplete="  Các hÕ là ð°ng môn m¾i ðªn phäi không. Các hÕ làm tuy®t l¡m. Ta · ðây có nhi«u vi®c c¥n các hÕ giúp ðÞ"
x220900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x220900_OnDefaultEvent( sceneId, selfId, targetId )
    --Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
    if (IsMissionHaveDone(sceneId,selfId,x220900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x220900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x220900_g_Name then
			x220900_OnContinue( sceneId, selfId, targetId )
		end
    --Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
    elseif x220900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x220900_g_Name then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x220900_g_MissionName)
				AddText(sceneId,x220900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x220900_g_MissionTarget)
				AddMoneyBonus( sceneId, x220900_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x220900_g_ScriptId,x220900_g_MissionId)
		end
    end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x220900_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x220900_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x220900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x220900_g_Name then
			AddNumText(sceneId, x220900_g_ScriptId,x220900_g_MissionName,2,-1);
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x220900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x220900_g_Name then
			AddNumText(sceneId,x220900_g_ScriptId,x220900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x220900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 0 then
		return 0
	else
		return 1
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x220900_OnAccept( sceneId, selfId )
	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	AddMission( sceneId,selfId, x220900_g_MissionId, x220900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh§n nhi®m vø: chiªn ð¤u vì sß môn",MSG2PLAYER_PARA )
end

--**********************************
--·ÅÆú
--**********************************
function x220900_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
    DelMission( sceneId, selfId, x220900_g_MissionId )
end

--**********************************
--¼ÌÐø
--**********************************
function x220900_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
    BeginEvent(sceneId)
		AddText(sceneId,x220900_g_MissionName)
		AddText(sceneId,x220900_g_MissionComplete)
		AddMoneyBonus( sceneId, x220900_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220900_g_ScriptId,x220900_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x220900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x220900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x220900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x220900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x220900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x220900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x220900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#YHoàn t¤t nhi®m vø: chiªn ð¤u vì sß môn",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x220900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x220900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x220900_OnItemChanged( sceneId, selfId, itemdataId )
end
