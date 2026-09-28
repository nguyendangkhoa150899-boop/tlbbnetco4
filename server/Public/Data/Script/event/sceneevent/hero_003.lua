-- 212130
-- ÌìÏÂÓ¢ÐÛË­µÐÊÖ

--MisDescBegin
--½Å±¾ºÅ
x212130_g_ScriptId = 212130

--½ÓÊÜÈÎÎñNPCÊôÐÔ
x212130_g_Position_X=267
x212130_g_Position_Z=116
x212130_g_SceneID=1
x212130_g_AccomplishNPC_Name="Vß½ng An ThÕch"

--ÈÎÎñºÅ
x212130_g_MissionId = 252

--Ä¿±êNPC
x212130_g_Name	="Vß½ng An ThÕch"

--ÈÎÎñ¹éÀà
x212130_g_MissionKind = 55

--ÈÎÎñµÈ¼¶
x212130_g_MissionLevel = 75

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212130_g_IfMissionElite = 0

--ÈÎÎñÃû
x212130_g_MissionName="Thiên hÕ anh hùng ai ð¸ch thü"
x212130_g_MissionInfo="#{Mis_75_desc_003}"
x212130_g_MissionTarget="    Tìm Vß½ng An ThÕch · thành Tô Châu #{_INFOAIM267,116,1, Vß½ng An ThÕch}. "
--x212130_g_MissionContinue="  ÉúÃüÈç¹ûÄÜ¹»ÖØÀ´Ò»´Î£¬ÎÒ»áÔõÃ´Ñ¡ÔñÄØ£¿¼ÈÈ»ÕæÊµºÍÐé»ÃÎÞ´Ó·Ö±æ£¬ÎªºÎ²»Ìý´ÓÐÄÁéµÄÕÙ»½×ö³ö¾ñÔñÄØ¡£"
x212130_g_MissionComplete="  Dân giàu nß¾c mÕnh, bách tính an cß lÕc nghi®p là tâm nguy®n cä ð¶i ta, so v¾i ði«u này thì sñ vinh hoa cüa bän thân có ðáng là gì chÑ!"

x212130_g_MoneyBonus=5000
x212130_g_exp=50000

x212130_g_Custom	= { {id="Ðã tìm th¤y Vß½ng An ThÕch",num=1} }
x212130_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x212130_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212130_g_Name then
			x212130_OnContinue( sceneId, selfId, targetId )
		end
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212130_g_MissionName)
				AddText(sceneId,x212130_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212130_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x212130_OnEnumerate( sceneId, selfId, targetId )

	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212130_g_Name then
			AddNumText(sceneId, x212130_g_ScriptId,x212130_g_MissionName,2,-1);
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			AddNumText(sceneId,x212130_g_ScriptId,x212130_g_MissionName,1,-1);
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212130_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ý
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < 10 then
		return 0
	end
	
	return 1
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212130_CheckAcceptEx( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ý
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < x212130_g_MissionLevel then
		return 0
	end
	return 1
end


--**********************************
--½ÓÊÜ
--**********************************
function x212130_OnAccept( sceneId, selfId, targetId )
--PrintNum(1)
	if x212130_CheckAcceptEx(sceneId, selfId) < 1   then
		BeginEvent(sceneId)
			AddText( sceneId, "  Nhi®m vø này yêu c¥u ðÆng c¤p nhân v§t ðÕt c¤p 75, và 6 loÕi tâm pháp ð«u ðÕt c¤p 70 m¾i có th¬ tiªp nh§n." )
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return 
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
	
	-- ÐèÒªÍøÍæ¼ÒÉíÉÏ¶ªÒ»¸öÎïÆ·
	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	local ret = AddMission(sceneId,selfId, x212130_g_MissionId, x212130_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YNh§t ký nhi®m vø cüa các hÕ ðã ð¥y")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#YTiªp nh§n nhi®m vø: Anh hùng thiên hÕ ai là ð¸ch thü.")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212130_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--·ÅÆú
--**********************************
function x212130_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212130_g_MissionId )
end

--**********************************
--¼ÌÐø
--**********************************
function x212130_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
  BeginEvent(sceneId)
	AddText(sceneId,x212130_g_MissionName)
	AddText(sceneId,x212130_g_MissionComplete)
	AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212130_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212130_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212130_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212130_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--Ìí¼ÓÈÎÎñ½±Àø
		AddMoney(sceneId,selfId, x212130_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212130_g_exp)
		DelMission( sceneId, selfId, x212130_g_MissionId )
		MissionCom( sceneId, selfId, x212130_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHoàn thành nhi®m vø: Anh hùng thiên hÕ ai là ð¸ch thü",MSG2PLAYER_PARA )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212130_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x212130_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212130_OnItemChanged( sceneId, selfId, itemdataId )
end

