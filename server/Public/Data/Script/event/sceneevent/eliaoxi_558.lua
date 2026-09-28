--ÁÉÎ÷ ÓÂÊ¿µÄ¼ÒÊé
--MisDescBegin
--½Å±¾ºÅ
x212112_g_ScriptId = 212112

--ÈÎÎñºÅ
x212112_g_MissionId = 558

--ÈÎÎñ¹éÀà
x212112_g_MissionKind = 32

--ÈÎÎñµÈ¼¶
x212112_g_MissionLevel = 80

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212112_g_IfMissionElite = 0

--ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö**********************
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x212112_g_IsMissionOkFail = 0		--±äÁ¿µÄµÚ0Î»

--ÒÔÉÏÊÇ¶¯Ì¬**************************************************************

--ÈÎÎñĞèÒªµÃµ½µÄÎïÆ·
x212112_g_DemandItem={{id=40002071,num=1}}		--±äÁ¿µÚ1Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x212112_g_MissionName="Thß nhà cüa dûng sî"
x212112_g_MissionInfo="#{Mis_S_Liaoxi_1010091}"
x212112_g_MissionTarget="  Hãy mang #YDûng sî gia thß#W trao cho #RLı Lão Thái Thái#W · #G Nam Häi #W#{_INFOAIM214,243,34, Lı lão thái thái}. "
x212112_g_ContinueInfo="  Các hÕ tìm ta có vi®c gì?"
x212112_g_MissionComplete="  Con trai ta tuy ğã chªt, nhßng nó không làm m¤t m£t t± phø nó"

--»õÎïID
x212112_g_ItemID = 40002071

--ÊÕ»õÈË
x212112_g_Name = "LÛ lão thái thái"

x212112_g_MoneyBonus=54500
x212112_g_Exp = 35000

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212112_OnDefaultEvent( sceneId, selfId, targetId )

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x212112_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212112_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212112_g_Name then
			--·¢ËÍ½»ÈÎÎñÇ°µÄĞèÇóĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x212112_g_MissionName);
				AddText(sceneId,x212112_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212112_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId,done)
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif GetLevel( sceneId, selfId ) >= x212112_g_MissionLevel then
	
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212112_g_MissionName);
			AddText(sceneId,x212112_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212112_g_MissionTarget);
			AddMoneyBonus( sceneId, x212112_g_MoneyBonus )
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId)

	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212112_OnEnumerate( sceneId, selfId, targetId )
	-- add by zchw
	if IsMissionHaveDone( sceneId, selfId, x212112_g_MissionId ) > 0 and targetId == -1 then
		AddText(sceneId, "  Ngß½i ğã hoàn t¤t nhi®m vø này");
		return 
	elseif IsHaveMission(sceneId,selfId,x212112_g_MissionId) > 0  then
		if targetId == -1 then
		AddText(sceneId, "  Ngß½i ğã nh§n nhi®m vø này");
	  elseif GetName(sceneId,targetId) == x212112_g_Name then
			AddNumText(sceneId, x212112_g_ScriptId,x212112_g_MissionName, 2, -1)
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212112_CheckAccept(sceneId,selfId) > 0 then
	  if targetId == -1 then
			AddNumText(sceneId, x212112_g_ScriptId, x212112_g_MissionName, 1, -1);
		elseif GetName(sceneId,targetId) ~= x212112_g_Name then
			AddNumText(sceneId, x212112_g_ScriptId, x212112_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--¼ì²â´¥·¢Ìõ¼ş
--**********************************
function x212112_CheckAccept( sceneId, selfId )
	--ĞèÒª60¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= 80 then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212112_OnMissionAccept( sceneId, selfId )

	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­Íê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212112_g_MissionId) > 0   then
		return
	end
	
	if x212112_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- Éú³ÉÒ»¸öÈÎÎñµÀ¾ß
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002071, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#YTay näi nhi®m vø ğã ğ¥y", MSG2PLAYER_PARA )
		return 
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local ret = AddMission( sceneId,selfId, x212112_g_MissionId, x212112_g_ScriptId, 0, 0, 0 )
	-- ĞèÒª¿¼ÂÇÍæ¼ÒÊÇ²»ÊÇÄÜ¹»½ÓÊÜµ½Õâ¸öÈÎÎñ
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
		return
	end

	-- ¼ÓÈÎÎñÎïÆ·
	AddItemListToHuman(sceneId,selfId)
	-- É¾³ıÆÕÍ¨µÀ¾ß
	DelItem( sceneId, selfId, 30505060, 1 )
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212112_g_MissionId)			--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ1 (ÈÎÎñÍê³ÉÇé¿ö)
	
	-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
	Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø ".. x212112_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#YTiªp nh§n nhi®m vø ".. x212112_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--·ÅÆú
--**********************************
function x212112_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212112_g_MissionId )
	
	-- É¾³ıÈÎÎñµÀ¾ß
	DelItem( sceneId, selfId, 40002071, 1 )
	
end

--**********************************
--ÒÑ¾­½ÓÁËÈÎÎñÔÙ¸ø³öµÄÌáÊ¾
--**********************************
function x212112_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212112_g_MissionName)
		AddText(sceneId,x212112_g_MissionComplete)
		AddMoneyBonus( sceneId, x212112_g_MoneyBonus )
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212112_CheckSubmit( sceneId, selfId )

	itemNum = GetItemCount( sceneId, selfId, x212112_g_ItemID );
	if itemNum > 0 then
		return 1;
	end
	return 0
end

--**********************************
--Ìá½»£¨Íê³É£©
--**********************************
function x212112_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212112_g_MissionId) <= 0 then
		return
	end
	-- 2¡¢ÆäËû¼ì²â
	if x212112_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	for i, item in x212112_g_DemandItem do
		DelItem( sceneId, selfId, item.id, item.num )
	end
	
	AddExp(sceneId,selfId,x212112_g_Exp)
	AddMoney(sceneId,selfId,x212112_g_MoneyBonus );

	ret = DelMission( sceneId, selfId, x212112_g_MissionId )
	if ret > 0 then
		MissionCom( sceneId, selfId, x212112_g_MissionId )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212112_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212112_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212112_OnItemChanged( sceneId, selfId, itemdataId )
end

