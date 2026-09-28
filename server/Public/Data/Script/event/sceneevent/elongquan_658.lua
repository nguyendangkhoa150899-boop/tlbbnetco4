--É±¹Ö£¬ÔÚ½ÓÈÎÎñµÄÍ¬Ê±£¬´´½¨ÒªÉ±µÄ¹Ö
--Tr§n ğánh cu¯i cùng

--MisDescBegin
--½Å±¾ºÅ
x212109_g_ScriptId = 212109

--ÈÎÎñºÅ
x212109_g_MissionId = 658

--Ä¿±êNPC
x212109_g_Name	="A Thanh"

--ÈÎÎñ¹éÀà
x212109_g_MissionKind = 42

--ÈÎÎñµÈ¼¶
x212109_g_MissionLevel = 38

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212109_g_IfMissionElite = 0

--ÈÎÎñÃû
x212109_g_MissionName="Tr§n ğánh cu¯i cùng"
--ÈÎÎñÃèÊö
x212109_g_MissionInfo="#{Lua_Longquan_0001}"
--ÈÎÎñÄ¿±ê
x212109_g_MissionTarget="#RA Thanh#W · #GLong Tuy«n ĞoÕn Ki«u #W#{_INFOAIM51,115,31, A Thanh} yêu c¥u ngß½i giªt chªt #RThông Thiên#W. #RThông Thiên #W#{_INFOAIM48,51,31,-1} thß¶ng xu¤t hi®n g¥n #GQuy Vân Ğình#W."		
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x212109_g_ContinueInfo="  Ngß½i ğã giªt chªt Thông Thiên chßa?"
--Ìá½»Ê±npcµÄ»°
x212109_g_MissionComplete="  T¤t cä ğã kªt thúc r°i? Nhßşc b¢ng ta và Tr÷ng Chi Chi cûng nên c¡t ğÑt ği chång"		

x212109_g_MoneyBonus=4000
x212109_g_exp=20000

--x212109_g_ItemBonus={{id=10111011, num=1}}

x212109_g_RadioItemBonus={{id=10421066 ,num=1},{id=10411073,num=1},{id=10410067,num=1}}

x212109_g_Custom	= { {id="Ğã giªt chªt Thông Thiên",num=1} }

x212109_g_IsMissionOkFail = 0		--±äÁ¿µÄµÚ0Î»

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212109_OnDefaultEvent( sceneId, selfId, targetId )

  --Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
  if (IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212109_g_MissionId) > 0)  then
		--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId, x212109_g_MissionName)
			AddText(sceneId, x212109_g_ContinueInfo)
		EndEvent( )
		local bDone = x212109_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId,bDone)
				
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
  elseif x212109_CheckAccept(sceneId,selfId) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212109_g_MissionName)
			AddText(sceneId,x212109_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212109_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212109_g_MoneyBonus )
			for i, item in x212109_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId)
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212109_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212109_g_MissionId) > 0 then
		AddNumText(sceneId, x212109_g_ScriptId, x212109_g_MissionName, 2, -1)
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212109_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212109_g_ScriptId, x212109_g_MissionName, 1, -1)
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212109_CheckAccept( sceneId, selfId )

	--ÒªÇóÍê³ÉµÄÇ°ĞøÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,656) <= 0 then		--¶ÏÇÅ»¨Ñı
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,657) <= 0 then		--¶ÏÇÅ»¨Ñı
		return 0
	end
	
	--ĞèÒª1¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= x212109_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212109_OnAccept( sceneId, selfId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 then
		return 
	end

	-- ¸øÍæ¼ÒÉíÉÏ¼ÓÒ»¸ö¶«Î÷
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002152, 1)
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		-- ¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
		local ret = AddMission( sceneId,selfId, x212109_g_MissionId, x212109_g_ScriptId, 1, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)

		--ÉèÖÃÈÎÎñ±äÁ¿±¦ÎïµÄ³¡¾°±àºÅºÍ×ø±êÎ»ÖÃ
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212109_g_MissionId)--µÃµ½ÈÎÎñÔÚ20¸öÈÎÎñÖĞµÄĞòÁĞºÅ
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚÒ»Î»ÖÃ0	µÚÒ»Î»ÊÇÍê³É/Ê§°ÜÇé¿ö
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)					--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚÒ»Î»ÖÃ0	µÚÒ»Î»ÊÇÍê³É/Ê§°ÜÇé¿ö
	
		Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø " .. x212109_g_MissionName, MSG2PLAYER_PARA )

		BeginEvent(sceneId)
			strText = "#YTiªp nh§n nhi®m vø ".. x212109_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
	
		Msg2Player(  sceneId, selfId,"#YTay näi cüa ngß½i ğã ğ¥y", MSG2PLAYER_PARA )
	end	

end	

--**********************************
--·ÅÆú
--**********************************
function x212109_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212109_g_MissionId )
	
	--É¾³ıÈÎÎñÎïÆ·
	DelItem( sceneId, selfId, 40002152, 1 )
end

--**********************************
--¼ÌĞø
--**********************************
function x212109_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212109_g_MissionName)
		AddText(sceneId,x212109_g_MissionComplete)
		AddMoneyBonus( sceneId, x212109_g_MoneyBonus )
		for i, item in x212109_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212109_CheckSubmit( sceneId, selfId )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212109_g_MissionId)
	
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
function x212109_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212109_g_MissionId) <= 0 then
		return
	end
	
	-- 2¡¢Íê³ÉÈÎÎñµÄÇé¿ö¼ì²â
	if x212109_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212109_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		--É¾³ıÈÎÎñÎïÆ·
		DelItem( sceneId, selfId, 40002152, 1 )
		AddItemListToHuman(sceneId,selfId)
		-- ½ğÇ®ºÍ¾­Ñé
		AddMoney(sceneId,selfId,x212109_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212109_g_exp)
		
		DelMission( sceneId,selfId, x212109_g_MissionId )
		--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
		MissionCom( sceneId,selfId, x212109_g_MissionId )
	else
		--ÈÎÎñ½±ÀøÃ»ÓĞ¼Ó³É¹¦
		BeginEvent(sceneId)
			AddText(sceneId, "Không th¬ hoàn t¤t nhi®m vø");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
		
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212109_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	-- ¼ì²âÈÎÎñÊÇ²»ÊÇÒÑ¾­Íê³É
	if x212109_CheckSubmit(sceneId, selfId) > 0    then
		return
	end
	
	if monsterName == "Thông Thiên"   then
		--È¡µÃÕâ¸ö¹ÖÎïËÀºóÓµÓĞ·ÖÅäÈ¨µÄÈËÊı
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--È¡µÃÓµÓĞ·ÖÅäÈ¨µÄÈËµÄobjId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ¿´Õâ¸öÈËÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
			if IsHaveMission(sceneId, humanObjId, x212109_g_MissionId) > 0 then
				-- ÏÈÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Âú×ãÁËÍê³É±êÖ¾
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212109_g_MissionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("Ğã giªt chªt Thông Thiên: 1/1" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					-- ÉèÖÃÈÎÎñÍê³É
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				end
			end
		end
	end
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212109_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212109_OnItemChanged( sceneId, selfId, itemdataId )
end

