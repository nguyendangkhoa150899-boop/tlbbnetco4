--É±¹Ö£¬ÔÚ½ÓÈÎÎñµÄÍ¬Ê±£¬´´½¨ÒªÉ±µÄ¹Ö
--Thª gi¾i hoa cö

--MisDescBegin
--½Å±¾ºÅ
x212100_g_ScriptId = 212100

--ÈÎÎñºÅ
x212100_g_MissionId = 648

--Ä¿±êNPC
x212100_g_Name	="Tô Phi"

--ÈÎÎñ¹éÀà
x212100_g_MissionKind = 41

--ÈÎÎñµÈ¼¶
x212100_g_MissionLevel = 25

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212100_g_IfMissionElite = 0

--ÈÎÎñÃû
x212100_g_MissionName="Thª gi¾i hoa cö"
--ÈÎÎñÃèÊö
x212100_g_MissionInfo="#{Mis_K_Xihu_1000042}"
--ÈÎÎñÄ¿±ê
x212100_g_MissionTarget="#{MIS_TAR_ADD_010}"		
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x212100_g_ContinueInfo="  Ngß½i ğã giªt chªt #RMÕch Hæu Nhân#W r°i?"
--Ìá½»Ê±npcµÄ»°
x212100_g_MissionComplete="  Ğa tÕ ngß½i, 1 thª gi¾i m¾i nhß phäng ph¤t trß¾c m£t ta"		

x212100_g_MoneyBonus=1800
x212100_g_exp=18000
--x212100_g_ItemBonus={{id=10111008,num=1}}


x212100_g_Custom	= { {id="Ğã giªt chªt MÕch Hæu Nhân",num=1} }
x212100_g_IsMissionOkFail = 0

x212100_g_RadioItemBonus={{id=10412063 ,num=1},{id=10413065,num=1},{id=10402065,num=1}}

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212100_OnDefaultEvent( sceneId, selfId, targetId )

  --Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
  if (IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0)  then
		--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId, x212100_g_MissionName)
			AddText(sceneId, x212100_g_ContinueInfo)
		EndEvent( )
		local bDone = x212100_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId,bDone)
				
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
  elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212100_g_MissionName)
			AddText(sceneId,x212100_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212100_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
			for i, item in x212100_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212100_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0 then
		AddNumText(sceneId, x212100_g_ScriptId, x212100_g_MissionName, 2, -1);
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212100_g_ScriptId, x212100_g_MissionName, 1, -1);
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212100_CheckAccept( sceneId, selfId )

	--ÒªÇóÍê³ÉµÄÇ°ĞøÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,645) <= 0 then		--¶ÏÇÅ»¨Ñı
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,646) <= 0 then	--°×µÌÁø¹í
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,647) <= 0 then--¹é·ç×¯
		return 0
	end
	
	--ĞèÒª1¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= x212100_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212100_OnAccept( sceneId, selfId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
		return 
	end
	
	-- 1£¬¼ì²âµ±Ç°ÊÇ²»ÊÇÒÑ¾­ÔÚ³¡¾°ÖĞÓĞ ÂóÓÑÈË ÁË£¬Èç¹ûÓĞ£¬ÌáÊ¾Íæ¼ÒÏÖÔÚ²»ÄÜ½ÓÕâ¸öÈÎÎñ
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "MÕch Hæu Nhân"  then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i hi®n không th¬ nh§n nhi®m vø này");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			return
		end
	end
		
	-- ¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local ret = AddMission( sceneId,selfId, x212100_g_MissionId, x212100_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
		return
	end
	
	--ÉèÖÃÈÎÎñ±äÁ¿±¦ÎïµÄ³¡¾°±àºÅºÍ×ø±êÎ»ÖÃ
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212100_g_MissionId)--µÃµ½ÈÎÎñÔÚ20¸öÈÎÎñÖĞµÄĞòÁĞºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚÒ»Î»ÖÃ0	µÚÒ»Î»ÊÇÍê³É/Ê§°ÜÇé¿ö

	Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø " .. x212100_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#YTiªp nh§n nhi®m vø " .. x212100_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- ´´½¨Õâ¸ö¹Ö³öÀ´£¬Í¬Ê±º°»°
	local nMonsterId = LuaFnCreateMonster(sceneId, 509, 161, 262, 5, 0, -1)
	LuaFnSendSpecificImpactToUnit(sceneId,nMonsterId,nMonsterId,nMonsterId,44,3)
	CallScriptFunction((200060), "Duibai",sceneId, "MÕch Hæu Nhân", "Tây H°", "Tô Phi, ğ° sâu b÷, ngß½i còn m½ tß·ng làm lung lay v¸ trí th¯ng tr¸ cüa th¥y ta sao? Tô Phi, ngày này nåm sau chính là ngày gi² cüa ngß½i." )
	
	SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
	SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)

	--ÉèÖÃÕâ¸ö¹ÖµÄÏûÊ§Ê±¼ä
	SetCharacterDieTime(sceneId, nMonsterId, 600000)

end

--**********************************
--³¡¾°¼ÆÊ±Æ÷
--**********************************
function x212100_OnSceneTimer( sceneId, selfId )

end

--**********************************
--·ÅÆú
--**********************************
function x212100_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212100_g_MissionId )
end

--**********************************
--¼ÌĞø
--**********************************
function x212100_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212100_g_MissionName)
		AddText(sceneId,x212100_g_MissionComplete)
		AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
		for i, item in x212100_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212100_CheckSubmit( sceneId, selfId )

	--local missionId = GetMissionIdByIndex(x212100_g_ScriptId)
	local missionId = x212100_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)

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
function x212100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- °²È«ĞÔ¼ì²â
		-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
		if IsHaveMission(sceneId,selfId,x212100_g_MissionId) <= 0 then
			return
		end
		
		-- 2¡¢Íê³ÉÈÎÎñµÄÇé¿ö¼ì²â
		if x212100_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		BeginAddItem(sceneId)
		for i, item in x212100_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			-- ½ğÇ®ºÍ¾­Ñé
			AddMoney(sceneId,selfId,x212100_g_MoneyBonus )
			LuaFnAddExp( sceneId, selfId, x212100_g_exp)
			
			DelMission( sceneId,selfId, x212100_g_MissionId )
			--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
			MissionCom( sceneId,selfId, x212100_g_MissionId )
			
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
function x212100_OnKillObject( sceneId, selfId, objdataId ,objId )

	--local missionId = TGetMissionIdByIndex(x212100_g_ScriptId)
	local missionId = x212100_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == "MÕch Hæu Nhân"   then
		
		CallScriptFunction((200060), "Duibai",sceneId, "Tô Phi", "Tây H°", "HŞi các anh em thuÖ quÖ, hôm nay, chính hôm nay, chúng ta ğã tñ do, chúng ta không còn là nô l® næa." )

		--È¡µÃÕâ¸ö¹ÖÎïËÀºóÓµÓĞ·ÖÅäÈ¨µÄÈËÊı
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--È¡µÃÓµÓĞ·ÖÅäÈ¨µÄÈËµÄobjId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ¿´Õâ¸öÈËÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
			if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
				-- ÏÈÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Âú×ãÁËÍê³É±êÖ¾
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("Ğã giªt chªt MÕch Hæu Nhân: 1/1" )
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
function x212100_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212100_OnItemChanged( sceneId, selfId, itemdataId )
end







