--²ÔÉ½ ÀÇÑ¨´óÓª Ì½Ë÷ÀàÈÎÎñ
--212121


--MisDescBegin
--½Å±¾ºÅ
x212121_g_ScriptId = 212121

--½ÓÊÜÈÎÎñNPCÊôÐÔ
x212121_g_Position_X=154
x212121_g_Position_Z=205
x212121_g_SceneID=25
x212121_g_AccomplishNPC_Name="Tát Mã"

--ÈÎÎñºÅ
x212121_g_MissionId = 932

--Ä¿±êNPC
x212121_g_Name	="Tát Mã"

--ÈÎÎñ¹éÀà
x212121_g_MissionKind = 35

--ÈÎÎñµÈ¼¶
x212121_g_MissionLevel = 41

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212121_g_IfMissionElite = 0

--ÈÎÎñÃû
x212121_g_MissionName="Lang huy®t ðÕi doanh"
x212121_g_MissionInfo="#{Mis_30_60_desc_007}"
x212121_g_MissionTarget="    Tát Mã · Thß½ng S½n #{_INFOAIM155,205,25, Tát Mã} yêu c¥u các hÕ ði dò thám Lang huy®t ðÕi doanh."
x212121_g_MissionContinue="  Các hÕ ðã dò thám Lang huy®t ðÕi doanh chßa ?"
x212121_g_MissionComplete="  Xem ra Tát L² ðang mu¯n tiªn hành thêm 1 hành ðµng! Ta cûng phäi chu¦n b¸ r°i!"

x212121_g_MoneyBonus=8500
x212121_g_exp=10000

x212121_g_Custom	= { {id="Ðã dò thám Lang huy®t ðÕi doanh",num=1} }
x212121_g_IsMissionOkFail = 0

--MisDescEnd

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x212121_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212121_g_MissionId) > 0)  then
			--x212121_OnContinue( sceneId, selfId, targetId )
			local bDone = x212121_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				AddText(sceneId,x212121_g_MissionName)
				AddText(sceneId,x212121_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId,bDone)		
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212121_CheckAccept(sceneId,selfId) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212121_g_MissionName)
			AddText(sceneId,x212121_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212121_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212121_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId)
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x212121_OnEnumerate( sceneId, selfId, targetId )

	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212121_g_MissionId) > 0 then
			AddNumText(sceneId, x212121_g_ScriptId,x212121_g_MissionName,2,-1);
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212121_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x212121_g_ScriptId,x212121_g_MissionName,1,-1);
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212121_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ý
	if (IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 ) then
		return 0
	end
		
	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < x212121_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212121_OnAccept( sceneId, selfId, targetId )
	if x212121_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- ¼ì²éÍæ¼ÒµÄÐÄ·¨ÊÇ²»ÊÇ´ïµ½ÁËÒªÇó£¨Ç°ÁùÖÖÐÄ·¨µÈ¼¶´óÓÚµÈÓÚ20¼¶£©
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 20 ) == 0  then  -- zchw
   	BeginEvent(sceneId)
			local strText = format("Nhi®m vø này yêu c¥u 6 loÕi tâm pháp ð«u ðÕt c¤p 20.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	local ret = AddMission(sceneId,selfId, x212121_g_MissionId, x212121_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YNh§t ký nhi®m vø cüa các hÕ ðã ð¥y")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#YTiªp nh§n nhi®m vø: Lang huy®t ðÕi doanh")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212121_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- Íæ¼Ò¹ØÐÄ½øÈëÇøÓò
	SetMissionEvent( sceneId,selfId,x212121_g_MissionId, 1 )
	
end

--**********************************
--·ÅÆú
--**********************************
function x212121_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212121_g_MissionId )
end

--**********************************
--¼ÌÐø
--**********************************
function x212121_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
  BeginEvent(sceneId)
	AddText(sceneId,x212121_g_MissionName)
	AddText(sceneId,x212121_g_MissionComplete)
	AddMoneyBonus( sceneId, x212121_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212121_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212121_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212121_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212121_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212121_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--Ìí¼ÓÈÎÎñ½±Àø
		AddMoney(sceneId,selfId, x212121_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212121_g_exp)
		DelMission( sceneId, selfId, x212121_g_MissionId )
		MissionCom( sceneId, selfId, x212121_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHoàn thành nhi®m vø: Lang huy®t ðÕi doanh",MSG2PLAYER_PARA )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212121_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x212121_OnEnterArea( sceneId, selfId, zoneId )
	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212121_OnItemChanged( sceneId, selfId, itemdataId )
end

