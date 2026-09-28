--ÁÉÎ÷ Çı¸ÏºÚ·ä
--MisDescBegin
--½Å±¾ºÅ
x212107_g_ScriptId = 212107

--ÈÎÎñºÅ
x212107_g_MissionId = 552

--ÈÎÎñ¹éÀà
x212107_g_MissionKind = 32

--ÈÎÎñµÈ¼¶
x212107_g_MissionLevel = 75

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212107_g_IfMissionElite = 0

--ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö**********************
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x212107_g_IsMissionOkFail = 0		--±äÁ¿µÄµÚ0Î»
x212107_g_Custom	= { {id="Ğã ğ¯t phân sói khô",num=1} }

--ÒÔÉÏÊÇ¶¯Ì¬**************************************************************

--ÈÎÎñĞèÒªµÃµ½µÄÎïÆ·
--x212107_g_DemandItem={{id=40002112,num=1}}		--±äÁ¿µÚ1Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x212107_g_MissionName="Ğu±i theo H¡c Phong"
x212107_g_MissionInfo="#{Lua_liaoxi_001}"
x212107_g_MissionTarget="  Dùng lØa ğ¯t phân sói khô, xua ğu±i H¡c Phong, sau ğó ğªn #GQuäng Ninh Tr¤n#W, báo cáo cho #RBá Nhan #W#{_INFOAIM164,199,21, Bá Nhan} phát hi®n cüa các hÕ."
x212107_g_ContinueInfo="  Ngß½i ğã ğu±i H¡c Phong ği chßa?"
x212107_g_MissionComplete="  Ngß¶i trë tu±i, ngß½i chính là cÑu tinh cüa chúng ta. Thay m£t t¤t cä tµc nhân ta, ta xin cäm tÕ sñ giúp ğŞ cüa các hÕ. Chúng ta s¨ mãi không quên"

--½±Àø
x212107_g_MoneyBonus=49800
x212107_g_Exp = 45000
--x212107_g_ItemBonus={{id=30003007,num=5}}
x212107_g_RadioItemBonus={{id=10411081 ,num=1},{id=10412074,num=1}}


--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212107_OnDefaultEvent( sceneId, selfId, targetId )
	
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212107_g_Name then
			--·¢ËÍ½»ÈÎÎñÇ°µÄĞèÇóĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x212107_g_MissionName);
				AddText(sceneId,x212107_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212107_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId,done)
--		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif GetLevel( sceneId, selfId ) >= 75 then
	
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212107_g_MissionName);
			AddText(sceneId,x212107_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212107_g_MissionTarget);
			AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
			for i, item in x212107_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)

	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212107_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
		AddNumText(sceneId, x212107_g_ScriptId,x212107_g_MissionName, 2, -1)

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212107_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212107_g_MissionName then
			AddNumText(sceneId, x212107_g_ScriptId, x212107_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--¼ì²â´¥·¢Ìõ¼ş
--**********************************
function x212107_CheckAccept( sceneId, selfId )
	--ĞèÒª60¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= 75 then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212107_OnAccept( sceneId, selfId )

	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­Íê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212107_g_MissionId) > 0   then
		return
	end
	
	if x212107_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- Éú³ÉÒ»¸öÈÎÎñµÀ¾ß
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002070, 1)
		--AddItem( sceneId, 40002069, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#YTay näi nhi®m vø ğã ğ¥y", MSG2PLAYER_PARA )
		return 
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local ret = AddMission( sceneId,selfId, x212107_g_MissionId, x212107_g_ScriptId, 0, 0, 0 )
	-- ĞèÒª¿¼ÂÇÍæ¼ÒÊÇ²»ÊÇÄÜ¹»½ÓÊÜµ½Õâ¸öÈÎÎñ
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
		return
	end

	-- ¼ÓÈÎÎñÎïÆ·
	AddItemListToHuman(sceneId,selfId)
	
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 2)
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ1 (ÈÎÎñÍê³ÉÇé¿ö)
	
	-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
	Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø ".. x212107_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#YTiªp nh§n nhi®m vø ".. x212107_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--·ÅÆú
--**********************************
function x212107_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212107_g_MissionId )
	
	-- É¾³ıÈÎÎñµÀ¾ß
	DelItem( sceneId, selfId, 40002070, 1 )
	DelItem( sceneId, selfId, 40002069, 1 )

end

--**********************************
--ÒÑ¾­½ÓÁËÈÎÎñÔÙ¸ø³öµÄÌáÊ¾
--**********************************
function x212107_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212107_g_MissionName)
		AddText(sceneId,x212107_g_MissionComplete)
		AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
		for i, item in x212107_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212107_CheckSubmit( sceneId, selfId )
	--¼ì²âÌõ¼şÊÇ¿´ÈÎÎñÖĞµÄ±ê¼ÇÊÇ²»ÊÇ±»¸ÄÎª1ÁË
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0  then
		return 1
	end
	return 0
end

--**********************************
--Ìá½»£¨Íê³É£©
--**********************************
function x212107_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212107_g_MissionId) <= 0 then
		return
	end
	-- 2¡¢ÆäËû¼ì²â
	if x212107_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212107_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	--Ìí¼ÓÈÎÎñ½±Àø
	if ret > 0 then		
		-- É¾³ıÈÎÎñµÀ¾ß
		DelItem( sceneId, selfId, 40002070, 1 )
		DelItem( sceneId, selfId, 40002069, 1 )

		AddExp(sceneId,selfId,x212107_g_Exp)
		AddMoney(sceneId,selfId,x212107_g_MoneyBonus );
		DelMission( sceneId, selfId, x212107_g_MissionId )
		MissionCom( sceneId, selfId, x212107_g_MissionId )
		AddItemListToHuman(sceneId,selfId)

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
function x212107_OnKillObject( sceneId, selfId, objdataId ,objId )
	-- Èç¹ûÍê¼ÒÉ±ÁË°×ÀÇ´óÍõ£¬¿ÉÒÔ»ñµÃÁíÒ»¸öµÀ¾ß¡°¸ÉÀÇ·à¡±
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == "BÕch Lang Vß½ng"   then
		--È¡µÃÕâ¸ö¹ÖÎïËÀºóÓµÓĞ·ÖÅäÈ¨µÄÈËÊı
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--È¡µÃÓµÓĞ·ÖÅäÈ¨µÄÈËµÄobjId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ¿´Õâ¸öÈËÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
			if IsHaveMission(sceneId, humanObjId, x212107_g_MissionId) > 0 then
				-- ÏÈÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Âú×ãÁËÍê³É±êÖ¾
				local nMisIndex = GetMissionIndexByID(sceneId,humanObjId,x212107_g_MissionId)
				
				-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞÕâ¸öÎïÆ·ÁË£¬ÓĞÁË¾Í²»ÔÙµôÁË
				if GetMissionParam(sceneId, humanObjId, nMisIndex, 0) == 0  and
						GetItemCount(sceneId, humanObjId, 40002069) == 0 then
					AddMonsterDropItem(sceneId,objId,humanObjId, 40002069)
				end
			end
		end
	end
	
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212107_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212107_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40002069  then
	 	BeginEvent(sceneId)
			AddText(sceneId, "Ğã l¤y ğßşc phân sói khô: 1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

