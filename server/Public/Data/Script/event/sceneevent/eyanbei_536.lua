--É±¹Ö£¬ÔÚ½ÓÈÎÎñµÄÍ¬Ê±£¬´´½¨ÒªÉ±µÄ¹Ö
--³ÏÒâµÄ¿¼Ñé

--MisDescBegin
--½Å±¾ºÅ
x212102_g_ScriptId = 212102

--ÈÎÎñºÅ
x212102_g_MissionId = 536

--Ä¿±êNPC
x212102_g_Name	="L² Bình"

--ÈÎÎñ¹éÀà
x212102_g_MissionKind = 30

--ÈÎÎñµÈ¼¶
x212102_g_MissionLevel = 48

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212102_g_IfMissionElite = 0

--ÈÎÎñÃû
x212102_g_MissionName="ThØ thách lòng thành"
--ÈÎÎñÃèÊö
x212102_g_MissionInfo="#{Lua_yanbei_0001}"
--ÈÎÎñÄ¿±ê
x212102_g_MissionTarget="  L² Bình · NhÕn B¡c #{_INFOAIM271,49,19, L² Bình} yêu c¤u các hÕ chiªn th¡ng Ti¬u Phán. C¦n th§n ğ¤y, chï c¥n L² Bình ra l®nh mµt câu, #RTi¬u Phán#W s¨ xu¤t hi®n ngay."	
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x212102_g_ContinueInfo="  Ngß½i ğã ğánh bÕi Ti¬u Phán chßa?"
--Ìá½»Ê±npcµÄ»°
x212102_g_MissionComplete="  Thân thü giöi thª này quä hiªm g£p. Xem ra ğúng nhß l¶i ğ°n. Các hÕ chính là anh hùng cüa NhÕn B¡c"		

x212102_g_MoneyBonus=4750
x212102_g_exp=19800

--x212102_g_ItemBonus={{id=30102003, num=2}}

x212102_g_szMonsterName = "Ti¬u Phán"

x212102_g_Custom	= { {id="Ğã giªt chªt Ti¬u Phán",num=1} }
x212102_g_IsMissionOkFail = 0

x212102_g_RadioItemBonus={{id=10420068 ,num=1},{id=10421068,num=1}}

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212102_OnDefaultEvent( sceneId, selfId, targetId )

  --Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
  if (IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212102_g_MissionId) > 0)  then
		--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId, x212102_g_MissionName)
			AddText(sceneId, x212102_g_ContinueInfo)
		EndEvent( )
		local bDone = x212102_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId,bDone)
				
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
  elseif x212102_CheckAccept(sceneId,selfId) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212102_g_MissionName)
			AddText(sceneId,x212102_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212102_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212102_g_MoneyBonus )
			for i, item in x212102_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId)
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212102_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212102_g_MissionId) > 0 then
		AddNumText(sceneId, x212102_g_ScriptId, x212102_g_MissionName, 2, -1);
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212102_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212102_g_ScriptId, x212102_g_MissionName, 1, -1);
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212102_CheckAccept( sceneId, selfId )

	--ÒªÇóÍê³ÉµÄÇ°ĞøÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,535) <= 0 then		--¶ÏÇÅ»¨Ñı
		return 0
	end
	
	--ĞèÒª1¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) >= x212102_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--½ÓÊÜ
--**********************************
function x212102_OnAccept( sceneId, selfId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 then
		return 
	end
		
	-- ¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local ret = AddMission( sceneId,selfId, x212102_g_MissionId, x212102_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
		return
	end
	
	--ÉèÖÃÈÎÎñ±äÁ¿±¦ÎïµÄ³¡¾°±àºÅºÍ×ø±êÎ»ÖÃ
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212102_g_MissionId)--µÃµ½ÈÎÎñÔÚ20¸öÈÎÎñÖĞµÄĞòÁĞºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚÒ»Î»ÖÃ0	µÚÒ»Î»ÊÇÍê³É/Ê§°ÜÇé¿ö

	Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø " .. x212102_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#YTiªp nh§n nhi®m vø " .. x212102_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- ÏÈ¼ì²âµØÍ¼ÉÏÊÇ²»ÊÇÓĞÕâ¸ö¹Ö£¬Èç¹ûÓĞ¾Í²»ÔÙ·Å³öÀ´
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "Ti¬u Phán"  then
			return
		end
	end
	-- ´´½¨¹ÖÎï
	LuaFnCreateMonster(sceneId, 521, 272, 53, 1, 0, -1)

end

--**********************************
--·ÅÆú
--**********************************
function x212102_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212102_g_MissionId )
end

--**********************************
--¼ÌĞø
--**********************************
function x212102_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212102_g_MissionName)
		AddText(sceneId,x212102_g_MissionComplete)
		AddMoneyBonus( sceneId, x212102_g_MoneyBonus )
		for i, item in x212102_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212102_CheckSubmit( sceneId, selfId )

	local missionId = x212102_g_MissionId
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
function x212102_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212102_g_MissionId) <= 0 then
		return
	end
	
	-- 2¡¢Íê³ÉÈÎÎñµÄÇé¿ö¼ì²â
	if x212102_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212102_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		AddItemListToHuman(sceneId,selfId)
		-- ½ğÇ®ºÍ¾­Ñé
		AddMoney(sceneId,selfId,x212102_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212102_g_exp)
		
		DelMission( sceneId,selfId, x212102_g_MissionId )
		--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
		MissionCom( sceneId,selfId, x212102_g_MissionId )
		
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
function x212102_OnKillObject( sceneId, selfId, objdataId ,objId )

	local missionId = x212102_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == x212102_g_szMonsterName   then

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
						local strText = format("Ğã chiªn th¡ng Ti¬u Phán: 1/1" )
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
function x212102_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212102_OnItemChanged( sceneId, selfId, itemdataId )
end







