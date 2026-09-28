--Ê¯ÁÖ 
--MisDescBegin
--½Å±¾ºÅ
x212103_g_ScriptId = 212103

--ÈÎÎñºÅ
x212103_g_MissionId = 602

--ÈÎÎñÄ¿±ênpc
x212103_g_Name	="Viên Nguy®t Thôn Thôn Trß·ng Tr¸nh Huy«n" 

--ÈÎÎñ¹éÀà
x212103_g_MissionKind = 37

--ÈÎÎñµÈ¼¶
x212103_g_MissionLevel = 55

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212103_g_IfMissionElite = 0

--******ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x212103_g_IsMissionOkFail = 0		--±äÁ¿µÄµÚ0Î»

--******ÒÔÉÏÊÇ¶¯Ì¬*****

--ÈÎÎñÎÄ±¾ÃèÊö
x212103_g_MissionName="Vùng ğ¤t tuy®t v÷ng"
x212103_g_MissionInfo="#{Lua_Shilin_001}"
x212103_g_MissionTarget="Nghe câu chuy®n Tr¸nh Huy«n k¬ #{_INFOAIM182,163,26, Tr¸nh Huy«n}."
x212103_g_ContinueInfo="....."
x212103_g_MissionComplete="Chuy®n cüa ta ğã k¬ xong, ngß½i hãy suy nghî ği"

x212103_g_MoneyBonus=21000
x212103_g_Exp = 6000

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212103_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_ContinueInfo)
		EndEvent()
		bDone = x212103_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId,bDone)
		--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212103_g_MissionTarget)
			AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
		
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212103_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 2, -1);
		--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 1, -1);
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212103_CheckAccept( sceneId, selfId )
	-- Èç¹ûÍæ¼Ò×ö¹ıÕâ¸öÈÎÎñ£¬²»ÄÜÔÙ×ö
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 0
	end
	--ĞèÒª1¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= x212103_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212103_OnAccept( sceneId, selfId )
	-- Èç¹ûÍæ¼Ò×ö¹ıÕâ¸öÈÎÎñ£¬²»ÄÜÔÙ×ö
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	-- ¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local ret = AddMission( sceneId,selfId, x212103_g_MissionId, x212103_g_ScriptId, 1, 0, 0 )

	-- ĞèÒª¿¼ÂÇÍæ¼ÒÊÇ²»ÊÇÄÜ¹»½ÓÊÜµ½Õâ¸öÈÎÎñ
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
		return
	end

	-- Íæ¼ÒÒÑ¾­½Óµ½ÁËÕâ¸öÈÎÎñ
	misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)		--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ0 (ÈÎÎñÍê³ÉÇé¿ö)
	
	-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
	Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø ".. x212103_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#YTiªp nh§n nhi®m vø " .. x212103_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--·ÅÆú
--**********************************
function x212103_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212103_g_MissionId )
end

--**********************************
--¼ÌĞø
--**********************************
function x212103_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212103_g_MissionName)
		AddText(sceneId,x212103_g_MissionComplete)
		AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
				
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212103_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ìá½»
--**********************************
function x212103_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) <= 0 then
		return
	end
	-- 2¡¢ÆäËû¼ì²â
	if x212103_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	--Ìí¼ÓÈÎÎñ½±Àø
	AddMoney(sceneId, selfId, x212103_g_MoneyBonus )
	AddExp(sceneId, selfId, x212103_g_Exp)
	DelMission( sceneId, selfId, x212103_g_MissionId )
	--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
	MissionCom( sceneId,selfId, x212103_g_MissionId )
	
	-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
	
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212103_OnKillObject( sceneId, selfId, objdataId ,objId)

end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212103_OnEnterArea( sceneId, selfId, zoneId )

end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212103_OnItemChanged( sceneId, selfId, itemdataId )

end
