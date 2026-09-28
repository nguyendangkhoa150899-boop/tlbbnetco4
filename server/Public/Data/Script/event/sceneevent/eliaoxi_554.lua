--ÁÉÎ÷ ÖØ½¨ÄÁ³¡
--MisDescBegin
--½Å±¾ºÅ
x212108_g_ScriptId = 212108

--ÈÎÎñºÅ
x212108_g_MissionId = 554

--ÈÎÎñ¹éÀà
x212108_g_MissionKind = 32

--ÈÎÎñµÈ¼¶
x212108_g_MissionLevel = 78

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212108_g_IfMissionElite = 0

--ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö**********************
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x212108_g_IsMissionOkFail = 0		--±äÁ¿µÄµÚ0Î»

--ÒÔÉÏÊÇ¶¯Ì¬**************************************************************

--ÈÎÎñĞèÒªµÃµ½µÄÎïÆ·
--x212108_g_DemandItem={{id=40002112,num=1}}		--±äÁ¿µÚ1Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x212108_g_MissionName="Xây dñng lÕi trang trÕi"
x212108_g_MissionInfo="#{Lua_liaoxi_002}"
x212108_g_MissionTarget="  Tìm th¤y 10 viên Hàn thiªt khoáng thÕch, 10 viên Kim khoáng thÕch và 10 ğ°ng vàng, hãy trao chúng cho #RGia Lu§t Kim #W · #GLiêu Tây Quäng Ninh Tr¤n #W#{_INFOAIM170,206,21, Gia Lu§t Kim}. "
x212108_g_ContinueInfo="  Các hÕ ğã tìm ğü nguyên li®u chßa?"
x212108_g_MissionComplete="  Ğa tÕ ngß½i ğã giúp ğŞ, ğşi khi trÕi chån nuôi ğßşc xây dñng lÕi, nh¤t ğ¸nh ta s¨ ğãi ngß½i món sæa dê tß½i nh¤t và món th¸t nß¾ng th½m ngon nh¤t"

x212108_g_DemandItem={{id=20103004,num=10},{id=20103005,num=10}}		--´Ó±³°üÖĞ¼ÆËã

--½±Àø
x212108_g_MoneyBonus=46000
x212108_g_Exp = 65000
--x212108_g_ItemBonus={{id=10401031,num=1}}

x212108_g_RadioItemBonus={{id=10405067 ,num=1},{id=10401067,num=1},{id=10400068,num=1}}


--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212108_OnDefaultEvent( sceneId, selfId, targetId )
	
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212108_g_Name then
			--·¢ËÍ½»ÈÎÎñÇ°µÄĞèÇóĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x212108_g_MissionName);
				AddText(sceneId,x212108_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212108_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId,done)
--		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif GetLevel( sceneId, selfId ) >= 78 then
	
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212108_g_MissionName);
			AddText(sceneId,x212108_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212108_g_MissionTarget);
			AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
			for i, item in x212108_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)

	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212108_OnEnumerate( sceneId, selfId, targetId )

	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
		AddNumText(sceneId, x212108_g_ScriptId,x212108_g_MissionName, 2, -1)

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212108_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212108_g_MissionName then
			AddNumText(sceneId, x212108_g_ScriptId, x212108_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--¼ì²â´¥·¢Ìõ¼ş
--**********************************
function x212108_CheckAccept( sceneId, selfId )
	--ĞèÒª60¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= 78 then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212108_OnAccept( sceneId, selfId )

	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­Íê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212108_g_MissionId) > 0   then
		return
	end
	
	if x212108_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local ret = AddMission( sceneId,selfId, x212108_g_MissionId, x212108_g_ScriptId, 0, 0, 0 )
	-- ĞèÒª¿¼ÂÇÍæ¼ÒÊÇ²»ÊÇÄÜ¹»½ÓÊÜµ½Õâ¸öÈÎÎñ
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)			--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ1 (ÈÎÎñÍê³ÉÇé¿ö)
	
	-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
	Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø  ".. x212108_g_MissionName, MSG2PLAYER_PARA )
	
	SetMissionEvent(sceneId, selfId, x212108_g_MissionId, 2)
	
	BeginEvent(sceneId)
		strText = "#YTiªp nh§n nhi®m vø  ".. x212108_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--·ÅÆú
--**********************************
function x212108_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212108_g_MissionId )
	
end

--**********************************
--ÒÑ¾­½ÓÁËÈÎÎñÔÙ¸ø³öµÄÌáÊ¾
--**********************************
function x212108_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212108_g_MissionName)
		AddText(sceneId,x212108_g_MissionComplete)
		AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
		for i, item in x212108_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212108_CheckSubmit( sceneId, selfId )
	--¼ì²â¿´Íæ¼ÒÉíÉÏÊÇ²»ÊÇ¹»ÁËÕâĞ©ÎïÆ·
	if  GetItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 0
	end
	
	if  GetItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 0
	end
	
	if  GetMoney(sceneId, selfId)  < 100000   then 
		return 0
	end
	
	return 1
end

--**********************************
--Ìá½»£¨Íê³É£©
--**********************************
function x212108_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212108_g_MissionId) <= 0 then
		return
	end
	-- 2¡¢ÆäËû¼ì²â
	if x212108_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	--¼ì²âÇ®ÊÇ²»ÊÇ»¹¹»¿Û
	if  GetMoney(sceneId, selfId)  < 100000  then
		return
	end
	
	--¼ì²é²ÄÁÏÊÇ²»ÊÇ»¹ÔÚ
	if  LuaFnGetAvailableItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 
	end
	
	if  LuaFnGetAvailableItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 
	end
	
	
	BeginAddItem(sceneId)
		for i, item in x212108_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
		
	ret = EndAddItem(sceneId,selfId)
	--Ìí¼ÓÈÎÎñ½±Àø
	if ret > 0 then		
		--Ïú»Ù²ÄÁÏ
		DelItem( sceneId, selfId, 20103005, 10 )
		DelItem( sceneId, selfId, 20103004, 10 )
		
		AddExp(sceneId,selfId,x212108_g_Exp)
		
		--¿ÛÇ®¿©
		CostMoney(sceneId,selfId, 100000)

		--¸øÇ®
		AddMoney(sceneId,selfId,x212108_g_MoneyBonus );
				
		ret = DelMission( sceneId, selfId, x212108_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x212108_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
		end
	else
	--ÈÎÎñ½±ÀøÃ»ÓĞ¼Ó³É¹¦
		BeginEvent(sceneId)
			strText = "Không th¬ hoàn t¤t nhi®m vø"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212108_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212108_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212108_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 20103005  then		-- ½ğ¿óÊ¯
		-- »ñµÃÍæ¼ÒÉíÉÏÓĞµÄ ½ğ¿óÊ¯ µÄÊıÁ¿£¬Èç¹ûĞ¡Óã£½10 £¬¾ÍÌáÊ¾
		if  GetItemCount( sceneId, selfId, 20103005 ) <= 10   then
			BeginEvent(sceneId)
				strText = "ĞÕt ğßşc Kim khoáng thÕch: " .. tostring(GetItemCount( sceneId, selfId, 20103005 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	
	if itemdataId == 20103004  then		-- º®Ìú¿óÊ¯
		-- »ñµÃÍæ¼ÒÉíÉÏÓĞµÄ º®Ìú¿óÊ¯ µÄÊıÁ¿£¬Èç¹ûĞ¡Óã£½10 £¬¾ÍÌáÊ¾
		if  GetItemCount( sceneId, selfId, 20103004 ) <= 10   then
			BeginEvent(sceneId)
				strText = "ĞÕt ğßşc Hàn Thiªt khoáng thÕch: " .. tostring(GetItemCount( sceneId, selfId, 20103004 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

end

