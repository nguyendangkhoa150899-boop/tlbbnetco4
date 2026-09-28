-- 212133
-- ÎÞµÐÏÀ¿Í

-- Ö±½Ó½ÓÈÎÎñ£¬Íê³ÉÈÎÎñ

--MisDescBegin
--½Å±¾ºÅ
x212133_g_ScriptId = 212133

--½ÓÊÜÈÎÎñNPCÊôÐÔ
x212133_g_Position_X=267
x212133_g_Position_Z=116
x212133_g_SceneID=1
x212133_g_AccomplishNPC_Name="Vß½ng An ThÕch"

--ÈÎÎñºÅ
x212133_g_MissionId = 255
--Ç°ÐøÈÎÎñºÅ
x212133_g_PreMissionId = 389

--Ä¿±êNPC
x212133_g_Name	="Vß½ng An ThÕch"

--ÈÎÎñ¹éÀà
x212133_g_MissionKind = 55

--ÈÎÎñµÈ¼¶
x212133_g_MissionLevel = 75

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212133_g_IfMissionElite = 0

--ÈÎÎñÃû
x212133_g_MissionName="Vô ð¸ch hi®p khách"
x212133_g_MissionInfo="#{Mis_Hero_songxin_03}"
x212133_g_MissionTarget="    Tìm Vß½ng An ThÕch · thành Tô Châu #{_INFOAIM267,116,1, Vß½ng An ThÕch}. "
x212133_g_MissionComplete="  Võ công và danh v÷ng cüa các hÕ ð«u ðã ðµc bá giang h°, cách danh hi®u anh hùng không còn bao xa."

x212133_g_MoneyBonus=50000
x212133_g_exp=700000

x212133_g_Custom	= { {id="Ðã tìm th¤y Vß½ng An ThÕch",num=1} }
x212133_g_IsMissionOkFail = 0

x212133_g_RadioItemBonus={{id=10520087 ,num=1},{id=10522067,num=1}}


--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x212133_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212133_g_MissionId) > 0)  then
		x212133_OnContinue( sceneId, selfId, targetId )
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212133_CheckAccept(sceneId,selfId) > 0 then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212133_g_MissionName)
			AddText(sceneId,x212133_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212133_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212133_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212133_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212133_g_ScriptId,x212133_g_MissionId)
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x212133_OnEnumerate( sceneId, selfId, targetId )

	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212133_g_MissionId) > 0 then
		AddNumText(sceneId, x212133_g_ScriptId,x212133_g_MissionName,2,-1);

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212133_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212133_g_ScriptId,x212133_g_MissionName,1,-1);
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212133_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ý
	if (IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 ) then
		return 0
	end

	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < x212133_g_MissionLevel then
		return 0
	end	
	
	--¼ì²âÇ°ÐøÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212133_g_PreMissionId ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212133_OnAccept( sceneId, selfId, targetId )
	if x212133_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- ¼ì²éÍæ¼ÒµÄÐÄ·¨ÊÇ²»ÊÇ´ïµ½ÁËÒªÇó£¨Ç°ÁùÖÖÐÄ·¨µÈ¼¶´óÓÚµÈÓÚ30¼¶£©
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 70 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("Nhi®m vø này yêu c¥u 6 loÕi tâm pháp ð«u ðÕt c¤p 70.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	local ret = AddMission(sceneId,selfId, x212133_g_MissionId, x212133_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YNh§t ký nhi®m vø cüa các hÕ ðã ð¥y")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#YTiªp nh§n nhi®m vø: Hi®p khách vô ð¸ch")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212133_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--·ÅÆú
--**********************************
function x212133_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212133_g_MissionId )
end

--**********************************
--¼ÌÐø
--**********************************
function x212133_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
  BeginEvent(sceneId)
		AddText(sceneId,x212133_g_MissionName)
		AddText(sceneId,x212133_g_MissionComplete)
		AddMoneyBonus( sceneId, x212133_g_MoneyBonus )
		for i, item in x212133_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212133_g_ScriptId,x212133_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212133_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212133_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212133_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212133_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--Ìí¼ÓÈÎÎñ½±Àø
		BeginAddItem(sceneId)
		for i, item in x212133_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		
		if ret < 1 then
			--ÈÎÎñ½±ÀøÃ»ÓÐ¼Ó³É¹¦
			BeginEvent(sceneId)
				strText = "Không th¬ hoàn t¤t nhi®m vø"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)
		
		AddMoney(sceneId,selfId, x212133_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212133_g_exp)
		DelMission( sceneId, selfId, x212133_g_MissionId )
		MissionCom( sceneId, selfId, x212133_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHoàn thành nhi®m vø: Hi®p khách vô ð¸ch",MSG2PLAYER_PARA )

		-- ¸øÍæ¼ÒÌí¼Ó³ÆºÅ
		LuaFnAwardTitle( sceneId, selfId,  11, 235)
		SetCurTitle(sceneId, selfId,  11, 235)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212133_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x212133_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212133_OnItemChanged( sceneId, selfId, itemdataId )
end

