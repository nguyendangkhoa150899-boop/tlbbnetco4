-- 212134
-- ¸ÇÊÀÓ¢ÐÛ

-- Ö±½Ó½ÓÈÎÎñ£¬Íê³ÉÈÎÎñ

--MisDescBegin
--½Å±¾ºÅ
x212134_g_ScriptId = 212134

--½ÓÊÜÈÎÎñNPCÊôÐÔ
x212134_g_Position_X=160
x212134_g_Position_Z=127
x212134_g_SceneID=2
x212134_g_AccomplishNPC_Name="Lý Công Bµ"

--ÈÎÎñºÅ
x212134_g_MissionId = 256
--Ç°ÐøÈÎÎñºÅ
x212134_g_PreMissionId_1 = 253
x212134_g_PreMissionId_2 = 254
x212134_g_PreMissionId_3 = 255

--Ä¿±êNPC
x212134_g_Name	="Lý Công Bµ"

--ÈÎÎñ¹éÀà
x212134_g_MissionKind = 55

--ÈÎÎñµÈ¼¶
x212134_g_MissionLevel = 75

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212134_g_IfMissionElite = 0

--ÈÎÎñÃû
x212134_g_MissionName="Cái thª anh hùng"
x212134_g_MissionInfo="#{Mis_Hero_end}"
x212134_g_MissionTarget="    Tìm Lý Công Bµ · thành ÐÕi Lý #{_INFOAIM160,128,2, Lý Công Bµ}. "
x212134_g_MissionComplete="  A, ngß¶i thanh niên, các hÕ quä nhiên không phø kÏ v÷ng cua ta. Các hÕ ðã sØ dùng lòng dûng cäm và thông minh tài trí cüa mình träi qua biªt bao ch£n ðß¶ng, quen biªt bao nhiêu ngß¶i, tr× hÕi vô s¯ là yêu quái. Danh hi®u anh hùng cái thª ta t£ng cho ngß¶i cûng không tiªc chút nào! "

x212134_g_MoneyBonus=500000
x212134_g_exp=700000

x212134_g_Custom	= { {id="Ðã tìm ðßþc Lý Công Bµ",num=1} }
x212134_g_IsMissionOkFail = 0

x212134_g_RadioItemBonus={{id=10553037 ,num=1},{id=10514077,num=1},{id=10521057,num=1}}


--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x212134_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212134_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212134_g_MissionId) > 0)  then
		x212134_OnContinue( sceneId, selfId, targetId )
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212134_CheckAccept(sceneId,selfId) > 0 then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212134_g_MissionName)
			AddText(sceneId,x212134_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212134_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212134_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212134_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212134_g_ScriptId,x212134_g_MissionId)
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x212134_OnEnumerate( sceneId, selfId, targetId )

	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212134_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212134_g_MissionId) > 0 then
		AddNumText(sceneId, x212134_g_ScriptId,x212134_g_MissionName,2,-1);

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212134_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212134_g_ScriptId,x212134_g_MissionName,1,-1);
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212134_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ý
	if (IsMissionHaveDone(sceneId,selfId,x212134_g_MissionId) > 0 ) then
		return 0
	end

	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < x212134_g_MissionLevel then
		return 0
	end	
	
	--¼ì²âÇ°ÐøÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212134_g_PreMissionId_1 ) < 1   then
		return 0
	end
	--¼ì²âÇ°ÐøÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212134_g_PreMissionId_2 ) < 1   then
		return 0
	end
	--¼ì²âÇ°ÐøÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212134_g_PreMissionId_3 ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212134_OnAccept( sceneId, selfId, targetId )
	if x212134_CheckAccept(sceneId, selfId) < 1   then
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
	local ret = AddMission(sceneId,selfId, x212134_g_MissionId, x212134_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YNh§t ký nhi®m vø cüa các hÕ ðã ð¥y")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#YTiªp nh§n nhi®m vø: Anh hùng cái thª")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212134_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--·ÅÆú
--**********************************
function x212134_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212134_g_MissionId )
end

--**********************************
--¼ÌÐø
--**********************************
function x212134_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
  BeginEvent(sceneId)
		AddText(sceneId,x212134_g_MissionName)
		AddText(sceneId,x212134_g_MissionComplete)
		AddMoneyBonus( sceneId, x212134_g_MoneyBonus )
		for i, item in x212134_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212134_g_ScriptId,x212134_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212134_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212134_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212134_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212134_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--Ìí¼ÓÈÎÎñ½±Àø
		BeginAddItem(sceneId)
		for i, item in x212134_g_RadioItemBonus do
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
		
		AddMoney(sceneId,selfId, x212134_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212134_g_exp)
		DelMission( sceneId, selfId, x212134_g_MissionId )
		MissionCom( sceneId, selfId, x212134_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHoàn thành nhi®m vø: Anh hùng cái thª",MSG2PLAYER_PARA )

		-- ¸øÍæ¼ÒÌí¼Ó³ÆºÅ
		LuaFnAwardTitle( sceneId, selfId,  12, 236)
		SetCurTitle(sceneId, selfId,  12, 236)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212134_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x212134_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212134_OnItemChanged( sceneId, selfId, itemdataId )
end


