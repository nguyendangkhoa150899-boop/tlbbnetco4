--ÕÒÈËÈÎÎñ
--ÕÔÌìÊ¦Ñ°ÕÒËï°ËÒ¯
--MisDescBegin
--½Å±¾ºÅ
x210210_g_ScriptId = 210210

--½ÓÊÜÈÎÎñNPCÊôÐÔ
x210210_g_Position_X=172.7304
x210210_g_Position_Z=146.4640
x210210_g_SceneID=2
x210210_g_AccomplishNPC_Name="Tôn Bát Gia"

--ÈÎÎñºÅ
x210210_g_MissionId = 450

--ÉÏÒ»¸öÈÎÎñµÄID
--g_MissionIdPre = 

--Ä¿±êNPC
x210210_g_Name	="Tôn Bát Gia"

--ÈÎÎñ¹éÀà
x210210_g_MissionKind = 13

--ÈÎÎñµÈ¼¶
x210210_g_MissionLevel = 3

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x210210_g_IfMissionElite = 0

--ÈÎÎñÃû
x210210_g_MissionName="Mµt l¥n làm ðÕi hi®p"
x210210_g_MissionInfo_1="#{event_dali_0012}"
x210210_g_MissionInfo_2="#W, l¨ nào các hÕ không nên ði giúp các hÕ ¤y ß?"
x210210_g_MissionTarget="— #GÐÕi Lý Thành Ngû Hoa Ðàn#W tìm th¤y #Rmµt trong TÑ ðÕi thi®n nhân #RTôn Bát Gia #W#{_INFOAIM173,146,2, Tôn Bát Gia}. #b#G(Nh¤p trái vào t÷a ðµ NPC có gÕch chân s¨ giúp các hÕ tìm ðªn NPC ðó)"
x210210_g_MissionComplete="  Ái chà, bÕn cû cüa ta à, ta biªt là các hÕ s¨ ðªn giúp ta"
x210210_g_MoneyBonus=72
x210210_g_SignPost = {x = 173, z = 147, tip = "Tôn Bát Gia"}

x210210_g_Custom	= { {id="Ðã tìm th¤y Tôn Bát Gia",num=1} }

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x210210_OnDefaultEvent( sceneId, selfId, targetId )
  --Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210210_g_Name then
			x210210_OnContinue( sceneId, selfId, targetId )
		end
		
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x210210_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210210_g_Name then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x210210_g_MissionName)
				AddText(sceneId,x210210_g_MissionInfo_1..PlayerName..x210210_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210210_g_MissionTarget)
				AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x210210_OnEnumerate( sceneId, selfId, targetId )
    --Èç¹ûÍæ¼Ò»¹Î´Íê³ÉÉÏÒ»¸öÈÎÎñ
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
    if IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 then
    	return 
    --Èç¹ûÒÑ½Ó´ËÈÎÎñ
    elseif IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210210_g_Name then
			AddNumText(sceneId, x210210_g_ScriptId,x210210_g_MissionName,2,-1);
		end
    --Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
    elseif x210210_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) ~= x210210_g_Name then
				AddNumText(sceneId,x210210_g_ScriptId,x210210_g_MissionName,1,-1);
			end
    end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x210210_CheckAccept( sceneId, selfId )
	--ÐèÒª3¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x210210_OnAccept( sceneId, selfId )
	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	AddMission( sceneId,selfId, x210210_g_MissionId, x210210_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh§n nhi®m vø#W: l¥n ð¥u làm ðÕi hi®p",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210210_g_SignPost.x, x210210_g_SignPost.z, x210210_g_SignPost.tip )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x210210_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--·ÅÆú
--**********************************
function x210210_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
    DelMission( sceneId, selfId, x210210_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210210_g_SignPost.tip )
end

--**********************************
--¼ÌÐø
--**********************************
function x210210_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
    BeginEvent(sceneId)
		AddText(sceneId,x210210_g_MissionName)
		AddText(sceneId,x210210_g_MissionComplete)
		AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x210210_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210210_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x210210_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210210_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--Ìí¼ÓÈÎÎñ½±Àø
		AddMoney(sceneId,selfId,x210210_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,100)
		DelMission( sceneId,selfId,  x210210_g_MissionId )
		--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ý
		MissionCom( sceneId,selfId,  x210210_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHoàn t¤t nhi®m vø: l¥n ð¥u làm ðÕi hi®p",MSG2PLAYER_PARA )
		CallScriptFunction( 210211, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x210210_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x210210_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x210210_OnItemChanged( sceneId, selfId, itemdataId )
end
