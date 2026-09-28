--ÑãÄÏ Ë½Í¨ÁÉ¹ú
--212120

--MisDescBegin
--½Å±¾ºÅ
x212120_g_ScriptId = 212120

--½ÓÊÜÈÎÎñNPCÊôĞÔ
x212120_g_Position_X=129
x212120_g_Position_Z=50
x212120_g_SceneID=18
x212120_g_AccomplishNPC_Name="Gia Lu§t MÕc Ca"

--ÈÎÎñºÅ
x212120_g_MissionId = 926

--Ä¿±êNPC
x212120_g_Name	="Gia Lu§t MÕc Ca"

--ÈÎÎñ¹éÀà
x212120_g_MissionKind = 29

--ÈÎÎñµÈ¼¶
x212120_g_MissionLevel = 31

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212120_g_IfMissionElite = 0

--ÈÎÎñÃû
x212120_g_MissionName="Tß thông Liêu Qu¯c"
x212120_g_MissionInfo="#{Mis_30_60_desc_001}"
x212120_g_MissionTarget="    Mang m§t hàm cüa Mã Th×a Sänh ğßa cho Gia Lu§t MÕc Ca ½ Nhan Nam #{_INFOAIM128,50,18, Gia Lu§t MÕc Ca}. "
x212120_g_MissionContinue="  Ta nghe nói quan viên cüa ĞÕi T¯ng r¤t tham lam, không biªt có th§t hay không ?"
x212120_g_MissionComplete="  Ğây là lá thß Mã Th×a Sänh ğßa cho ta ß ? Mau mang cho ta xem., à... ... à thì ra là v§y, v§y là quá t¯t r°i. ĞÕi T¯ng có quan viên nhß thª dù có thêm bao nhiêu tß¾ng sî ĞÕi T¯ng dûng cäm chiªn ğ¤u cûng không ğáng sş. Haha ğúng là tr¶i giúp nß¾c ĞÕi Liêu ta! #R<Gia Lu§t MÕc Ca lµ ra vë ğ¡c ı trên khuôn m£t.>"

x212120_g_MoneyBonus=6000
x212120_g_exp=7000

x212120_g_Custom	= { {id="Ğã l¤y ğßşc m§t hàm cüa Mã Th×a Sänh",num=1} }
x212120_g_IsMissionOkFail = 0

x212120_g_MisItemId = 40004416 --Âí³ĞÙ»ÃÜº¯

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212120_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212120_g_Name then
			--x212120_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId,1)		
		end
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212120_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212120_OnEnumerate( sceneId, selfId, targetId )

	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212120_g_Name then
			AddNumText(sceneId, x212120_g_ScriptId,x212120_g_MissionName,2,-1);
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			AddNumText(sceneId,x212120_g_ScriptId,x212120_g_MissionName,1,-1);
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212120_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ı
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return 0
	end
		
	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < x212120_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212120_OnAccept( sceneId, selfId, targetId )
	if x212120_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- ¼ì²éÍæ¼ÒµÄĞÄ·¨ÊÇ²»ÊÇ´ïµ½ÁËÒªÇó£¨Ç°ÁùÖÖĞÄ·¨µÈ¼¶´óÓÚµÈÓÚ10¼¶£©
	if x212120_CheckAllXinfaLevel(sceneId, selfId, 10) == 0  then --zchw
   	BeginEvent(sceneId)
			local strText = format("Tâm pháp cüa các hÕ ğ«u phäi ğÕt ğªn 10 nm¾i có th¬ tiªp nh§n nhi®m vø này.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ĞèÒª¸øÍæ¼ÒÉíÉÏ¶ªÒ»¸öÎïÆ·
	BeginAddItem( sceneId )
		AddItem( sceneId, x212120_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0  then
		--ÌáÊ¾²»ÄÜ½ÓÈÎÎñÁË
		local strText = "#YÔ nhi®m vø cüa các hÕ ğã ğ¥y."
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
		
	else
		--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
		ret = AddMission(sceneId,selfId, x212120_g_MissionId, x212120_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			local strText = "#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y"
			Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		local strText = "#YTiªp nh§n nhi®m vø: Tß Thông Liêu Qu¯c."
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212120_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	end

end

--**********************************
--·ÅÆú
--**********************************
function x212120_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212120_g_MissionId )
	DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
end

--**********************************
--¼ÌĞø
--**********************************
function x212120_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
  BeginEvent(sceneId)
		AddText(sceneId,x212120_g_MissionName)
		AddText(sceneId,x212120_g_MissionComplete)
		AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212120_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212120_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212120_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212120_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- É¾³ıÈÎÎñµÀ¾ß
		DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
		--Ìí¼ÓÈÎÎñ½±Àø
		AddMoney(sceneId,selfId, x212120_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212120_g_exp)
		DelMission( sceneId, selfId, x212120_g_MissionId )
		MissionCom( sceneId, selfId, x212120_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHoàn thanh nhi®m vø: Tß Thông Liêu Qu¯c",MSG2PLAYER_PARA )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212120_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212120_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212120_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¼ì²âĞÄ·¨ÊÇ²»¹»½ÓÈÎÎñ
--**********************************
function x212120_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end
