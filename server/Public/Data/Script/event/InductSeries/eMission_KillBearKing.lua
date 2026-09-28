--´´½¨ÈË[ QUFEI 2008-04-30 10:27 UPDATE BugID 34169 ]
--½â¾öÁ÷Ê§ÂÊÒıµ¼ÈÎÎñÊÂ¼ş½Å±¾
--ÅÜÅÜÒıµ¼ÈÎÎñ2_¸ÉµôºìĞÜÍõ

--MisDescBegin
--½Å±¾ºÅ
x500610_g_ScriptId	= 500610

--Ä¿±êÈÎÎñNPCÊôĞÔ
x500610_g_Position_X=251.1648
x500610_g_Position_Z=108.9732
x500610_g_SceneID=1
x500610_g_AccomplishNPC_Name="Hoa Kiªm Änh"

--Ç°ĞøÈÎÎñºÅ
x500610_g_PreMissionId	=	423
--ÈÎÎñºÅ
x500610_g_MissionId			= 424
--ÏÂÒ»¸öÈÎÎñµÄID
x500610_g_MissionIdNext	= 425
--ÏÂÒ»¸öÈÎÎñµÄIndex
x500610_g_MissionIndexNext	= 1018711
--ÏÂÒ»¸öÈÎÎñµÄScriptId
x500610_g_NextScriptId	= 006668
--ÁìÈ¡ÈÎÎñÄ¿±êËùÔÚ³¡¾°
x500610_g_AcceptNPC_SceneID	=	1
--ÁìÈ¡ÈÎÎñnpc
x500610_g_Name 					= "Hoa Kiªm Änh"
--ÈÎÎñ¹éÀà
x500610_g_MissionKind			= 12
--ÈÎÎñµÈ¼¶
x500610_g_MissionLevel		= 38
--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x500610_g_IfMissionElite	= 0
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x500610_g_IsMissionOkFail	= 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x500610_g_MissionName			= "Tiêu di®t H°ng Hùng Vß½ng"
--ÈÎÎñÃèÊö
x500610_g_MissionInfo			= "#{YD_20080421_70}"
--ÈÎÎñÄ¿±ê
x500610_g_MissionTarget		= "#{YD_20080421_69}"
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x500610_g_ContinueInfo		= "#{YD_20080421_194}"
--Íê³ÉÈÎÎñnpcËµµÄ»°
x500610_g_MissionComplete	= "#{YD_20080421_71}"
--¿ÉÒÔÍê³ÉµÄ»·Êı
x500610_g_MaxRound	= 1
--¿ØÖÆ½Å±¾
x500610_g_ControlScript		= 001066

-- ÈÎÎñÍê³ÉÇé¿ö,ÄÚÈİ¶¯Ì¬Ë¢ĞÂ,Õ¼ÓÃÈÎÎñ²ÎÊıµÄµÚ1Î»
x500610_g_Custom	= { {id="Ğã giªt chªt H°ng Hùng Vß½ng",num=1} }
--MisDescEnd

--ÈÎÎñÊÇ·ñÍê³É
x500610_g_Mission_IsComplete = 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»
--ÊÇ·ñÉ±¹ÖµÄ±ê¼Ç
x500610_g_RecordIdx 				 = 1		--ÈÎÎñ²ÎÊıµÄµÚ1Î»
--ÈÎÎñ½Å±¾ºÅ¼ÇÂ¼
x500610_g_MissScriptID_Idx	 = 2		--ÈÎÎñ²ÎÊıµÄµÚ2Î»
--ÈÎÎñ·¢²¼NPC±ê¼Ç
x500610_g_AcceptNPC_Idx			 = 3		--ÈÎÎñ²ÎÊıµÄµÚ3Î» 2.ËÕÖİNPC

x500610_g_AcceptMission_IDX		= 763	--½ÓÊÕÈÎÎñË÷Òı
x500610_g_CompleteMission_IDX	= 764	--Ìá½»ÈÎÎñË÷Òı

--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x500610_g_EventList	= {}

x500610_g_PlayerSlow_LVL					 = 38		-- ½ÓÊÜÈÎÎñµÄ×îµÍµÈ¼¶

--½±Àø
x500610_g_MoneyBonus					=	9475
x500610_g_ExpBonus						= 37902
x500610_g_ItemBonus_List 	 	  = { id=30505701,num=1 }

--¸±±¾³¡¾°ID_ÖñÁÖ
x500610_g_TargetSceneId				= 49
--¹ÖÎïÃû³Æ
x500610_g_MonsterName					=	"H°ng Hùng Vß½ng"
--ÒªÇóµÄÉ±¹ÖÊıÁ¿
x500610_g_KillMonsterCnt			=	1

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
function x500610_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500610_g_AcceptMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500610_g_Name then
			x500610_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- ÈÎÎñÊÇ·ñÒÑÂú
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500610_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ¼ì²âÈÎÎñ½ÓÊÜÌõ¼ş
		if x500610_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ½øÈë½ÓÊÜÈÎÎñ½çÃæ			
		x500610_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500610_g_CompleteMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500610_g_AccomplishNPC_Name then
			x500610_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- Èç¹ûÒÑ¾­½ÓÁËÈÎÎñ
		if IsHaveMission( sceneId, selfId, x500610_g_MissionId) > 0 then
												
			--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId, x500610_g_MissionName)
				AddText(sceneId, x500610_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500610_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500610_g_ScriptId, x500610_g_MissionId, bDone)
			
		else			
			x500610_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500610_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x500610_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x500610_g_MissionId ) <= 0 then
		if LuaFnGetName( sceneId, targetId ) == x500610_g_Name
			 and sceneId == x500610_g_AcceptNPC_SceneID then
			if IsMissionHaveDone( sceneId, selfId, x500610_g_PreMissionId ) > 0
				 and IsMissionHaveDone( sceneId, selfId, x500610_g_MissionId ) <= 0 then
				AddNumText( sceneId, x500610_g_ScriptId, x500610_g_MissionName, 1, x500610_g_AcceptMission_IDX )
			end
		end
	else
		if LuaFnGetName( sceneId, targetId ) == x500610_g_AccomplishNPC_Name
				 and sceneId == x500610_g_SceneID then
			
			AddNumText( sceneId, x500610_g_ScriptId, x500610_g_MissionName, 2, x500610_g_CompleteMission_IDX )
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş£¬Ò²¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500610_CheckAccept( sceneId, selfId, targetId )
	
	--¼ì²âÍæ¼ÒÊÇ·ñ·ûºÏ½ÓÊÜÈÎÎñµÄÌõ¼ş
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500610_g_Name then
		x500610_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	--¼ì²âµÈ¼¶
	if LuaFnGetLevel( sceneId, selfId ) < x500610_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500610_g_PlayerSlow_LVL )
		x500610_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--ÒÑ¾­½Ó¹ıÔò²»·ûºÏÌõ¼ş
	if IsHaveMission( sceneId, selfId, x500610_g_MissionId ) > 0 then
		x500610_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500610_g_MissionId ) > 0 then		
		return 0
	end

	--¼ì²âÇ°ĞøÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x500610_g_PreMissionId ) <= 0 then
		x500610_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_177}" )
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ£¬½ö¹©×ÓÈÎÎñµ÷ÓÃÉèÖÃ¹«¹²²ÎÊı
--**********************************
function x500610_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
 	if LuaFnGetName( sceneId, targetId ) ~= x500610_g_Name then
 		x500610_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	if x500610_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local bAdd = AddMission( sceneId, selfId, x500610_g_MissionId, x500610_g_ScriptId, 1, 0, 0 )
	if bAdd >= 1 then

		--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500610_g_MissionId )
		
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ0 (ÈÎÎñÍê³ÉÇé¿ö)
		SetMissionByIndex( sceneId, selfId, misIndex, x500610_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500610_g_RecordIdx, 0 )
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ2Î»ÖÃÎªÈÎÎñ½Å±¾ºÅ
		SetMissionByIndex( sceneId, selfId, misIndex, x500610_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500610_g_AcceptNPC_Idx, 2)
		
		local strText = "#{YD_20080421_229}" .. x500610_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

	end

	return 1

end

--**********************************
--·ÅÆú£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500610_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500610_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500610_g_MissionId )
	end
	
	return 0

end

--**********************************
--¼ÌĞø
--**********************************
function x500610_OnContinue( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500610_g_AccomplishNPC_Name then
		x500610_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	-- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500610_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500610_g_MissionName)
		AddText( sceneId, x500610_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500610_g_ScriptId,x500610_g_MissionId)
	
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x500610_CheckSubmit( sceneId, selfId, targetId )

	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500610_g_AccomplishNPC_Name then
		x500610_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500610_g_MissionId ) <= 0 then
		x500610_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500610_g_MissionId)

	-- ¼ì²âÈÎÎñÊÇ·ñÍê³É	
	if GetMissionParam(sceneId, selfId, misIndex, x500610_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--Ìá½»£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500610_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500610_g_AccomplishNPC_Name then
		x500610_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

  -- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500610_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500610_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500610_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500610_g_ExpBonus )

	-- ÈÎÎñË³ÀûÍê³É
	x500610_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500610_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500610_g_MissionId )
	 	-- ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
	 	MissionCom( sceneId, selfId, x500610_g_MissionId )
	 	
	 	local strText = "#Y" .. x500610_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- µ¯³öºóĞøÈÎÎñ½ÓÊÜ½çÃæ
	 	if IsHaveMission( sceneId, selfId, x500610_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500610_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500610_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500610_g_MissionIndexNext )
	 	end	 		 		 	
	end

	-- local nItemId = 0
	-- -- ¸øÓè½±ÀøÎïÆ·
	-- BeginAddItem(sceneId)
	-- AddItem(sceneId,x500610_g_ItemBonus_List.id, x500610_g_ItemBonus_List.num)
	-- local canAdd = EndAddItem(sceneId,selfId)						
	-- if canAdd > 0 then
	-- 	nItemId = x500610_g_ItemBonus_List.id
	-- 	AddItemListToHuman(sceneId,selfId)
	-- end

end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x500610_OnKillObject( sceneId, selfId, objdataId ,objId)--²ÎÊıÒâË¼£º³¡¾°ºÅ¡¢Íæ¼ÒobjId¡¢¹ÖÎï±íÎ»ÖÃºÅ¡¢¹ÖÎï

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName ~= x500610_g_MonsterName then
		return 0
	end
	
	local num = GetMonsterOwnerCount(sceneId,objId)
	for i=0,num-1  do
		-- È¡µÃÓµÓĞ·ÖÅäÈ¨µÄÈËµÄobjId
		local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
		-- PrintStr("humanObjId=" .. humanObjId)
		-- ¿´Õâ¸öÈËÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
		if IsHaveMission(sceneId, humanObjId, x500610_g_MissionId) > 0 then
			-- ÏÈÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Âú×ãÁËÍê³É±êÖ¾
			local misIndex = GetMissionIndexByID(sceneId,humanObjId,x500610_g_MissionId)
			if GetMissionParam(sceneId, humanObjId, misIndex, x500610_g_Mission_IsComplete) <=0  then
				local killedCount =	GetMissionParam(sceneId, humanObjId, misIndex, x500610_g_RecordIdx)
				killedCount = killedCount + 1
				SetMissionByIndex(sceneId, humanObjId, misIndex, x500610_g_RecordIdx, killedCount)					
				BeginEvent(sceneId)
					local str = format("Ğã giªt chªt %s %d/%d", x500610_g_MonsterName, killedCount, x500610_g_KillMonsterCnt )						
					AddText(sceneId, str)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId, humanObjId)
				if killedCount >= x500610_g_KillMonsterCnt then
					SetMissionByIndex(sceneId, humanObjId, misIndex, x500610_g_Mission_IsComplete, 1)
				end
			end
		end
	end

end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x500610_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x500610_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--½ÓÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500610_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--½»ÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500610_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x500610_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ÓëNPC¶Ô»°
--**********************************
function x500610_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--È¡µÃ±¾ÊÂ¼şµÄMissionId£¬ÓÃÓÚobjÎÄ¼şÖĞ¶Ô»°Çé¾°µÄÅĞ¶Ï
--**********************************
function x500610_GetEventMissionId( sceneId, selfId )	
	return x500610_g_MissionId
end

function x500610_AcceptMission( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500610_g_Name then
		x500610_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x500610_g_MissionName)
		AddText( sceneId, x500610_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_69}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500610_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500610_g_ScriptId,x500610_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--»ñÈ¡¾ßÌåitemµÄÏêÏ¸ĞÅÏ¢
function x500610_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--µÀ¾ßÊ¹ÓÃ
--**********************************
function x500610_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--ËÀÍöÊÂ¼ş
--**********************************
function x500610_OnDie( sceneId, selfId, killerId )
end
