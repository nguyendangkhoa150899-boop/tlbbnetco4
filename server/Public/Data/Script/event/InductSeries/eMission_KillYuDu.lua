--´´½¨ÈË[ QUFEI 2008-04-30 10:27 UPDATE BugID 34168 ]
--½â¾öÁ÷Ê§ÂÊÒıµ¼ÈÎÎñÊÂ¼ş½Å±¾
--ÅÜÅÜÒıµ¼ÈÎÎñ1_¸ÉµôÓà¶¾

--MisDescBegin
--½Å±¾ºÅ
x500609_g_ScriptId	= 500609

--Ä¿±êÈÎÎñNPCÊôĞÔ
x500609_g_Position_X=62.6751
x500609_g_Position_Z=162.6368
x500609_g_SceneID=1
x500609_g_AccomplishNPC_Name="Ti«n H°ng Vû"

--Ç°ĞøÈÎÎñºÅ
x500609_g_PreMissionId	=	419
--ÈÎÎñºÅ
x500609_g_MissionId			= 422
--ÏÂÒ»¸öÈÎÎñµÄID
x500609_g_MissionIdNext	= 423
--ÏÂÒ»¸öÈÎÎñµÄIndex
x500609_g_MissionIndexNext	= 1018710
--ÏÂÒ»¸öÈÎÎñµÄScriptId
x500609_g_NextScriptId	= 006668
--ÁìÈ¡ÈÎÎñÄ¿±êËùÔÚ³¡¾°
x500609_g_AcceptNPC_SceneID	=	1
--ÁìÈ¡ÈÎÎñnpc
x500609_g_Name 					= "Ti«n H°ng Vû"
--ÈÎÎñ¹éÀà
x500609_g_MissionKind			= 12
--ÈÎÎñµÈ¼¶
x500609_g_MissionLevel		= 38
--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x500609_g_IfMissionElite	= 0
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x500609_g_IsMissionOkFail	= 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x500609_g_MissionName			= "Giªt chªt Dß Ğµc"
--ÈÎÎñÃèÊö
x500609_g_MissionInfo			= "#{YD_20080421_64}"
--ÈÎÎñÄ¿±ê
x500609_g_MissionTarget		= "#{YD_20080421_63}"
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x500609_g_ContinueInfo		= "#{YD_20080421_193}"
--Íê³ÉÈÎÎñnpcËµµÄ»°
x500609_g_MissionComplete	= "#{YD_20080421_65}"
--¿ÉÒÔÍê³ÉµÄ»·Êı
x500609_g_MaxRound	= 1
--¿ØÖÆ½Å±¾
x500609_g_ControlScript		= 001066

-- ÈÎÎñÍê³ÉÇé¿ö,ÄÚÈİ¶¯Ì¬Ë¢ĞÂ,Õ¼ÓÃÈÎÎñ²ÎÊıµÄµÚ1Î»
x500609_g_Custom	= { {id="Ğã giªt chªt Dß Ğµc",num=1} }
--MisDescEnd

--ÈÎÎñÊÇ·ñÍê³É
x500609_g_Mission_IsComplete = 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»
--ÊÇ·ñÉ±¹ÖµÄ±ê¼Ç
x500609_g_RecordIdx 				 = 1		--ÈÎÎñ²ÎÊıµÄµÚ1Î»
--ÈÎÎñ½Å±¾ºÅ¼ÇÂ¼
x500609_g_MissScriptID_Idx	 = 2		--ÈÎÎñ²ÎÊıµÄµÚ2Î»
--ÈÎÎñ·¢²¼NPC±ê¼Ç
x500609_g_AcceptNPC_Idx			 = 3		--ÈÎÎñ²ÎÊıµÄµÚ3Î» 2.ËÕÖİNPC

x500609_g_AcceptMission_IDX		= 761	--½ÓÊÕÈÎÎñË÷Òı
x500609_g_CompleteMission_IDX	= 762	--Ìá½»ÈÎÎñË÷Òı

--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x500609_g_EventList	= {}

x500609_g_PlayerSlow_LVL					 = 38		-- ½ÓÊÜÈÎÎñµÄ×îµÍµÈ¼¶

--½±Àø
x500609_g_MoneyBonus					=	9475
x500609_g_ExpBonus						= 37902
x500609_g_ItemBonus_List 	 	  = { id=30505701,num=1 }

--¸±±¾³¡¾°ID_ËÎÁÉ±ß¾³
x500609_g_TargetSceneId				= 47
--¹ÖÎïÃû³Æ
x500609_g_MonsterName					=	"Dß Ğµc"
--ÒªÇóµÄÉ±¹ÖÊıÁ¿
x500609_g_KillMonsterCnt			=	1

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
function x500609_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500609_g_AcceptMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500609_g_Name then
			x500609_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- ÈÎÎñÊÇ·ñÒÑÂú
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500609_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ¼ì²âÈÎÎñ½ÓÊÜÌõ¼ş
		if x500609_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ½øÈë½ÓÊÜÈÎÎñ½çÃæ			
		x500609_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500609_g_CompleteMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500609_g_AccomplishNPC_Name then
			x500609_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- Èç¹ûÒÑ¾­½ÓÁËÈÎÎñ
		if IsHaveMission( sceneId, selfId, x500609_g_MissionId) > 0 then
												
			--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId, x500609_g_MissionName)
				AddText(sceneId, x500609_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500609_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500609_g_ScriptId, x500609_g_MissionId, bDone)
			
		else			
			x500609_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500609_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x500609_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x500609_g_MissionId ) <= 0 then
		if LuaFnGetName( sceneId, targetId ) == x500609_g_Name
			 and sceneId == x500609_g_AcceptNPC_SceneID then
			if IsMissionHaveDone( sceneId, selfId, x500609_g_PreMissionId ) > 0
				 and IsMissionHaveDone( sceneId, selfId, x500609_g_MissionId ) <= 0 then
				AddNumText( sceneId, x500609_g_ScriptId, x500609_g_MissionName, 1, x500609_g_AcceptMission_IDX )
			end
		end
	else
		if LuaFnGetName( sceneId, targetId ) == x500609_g_AccomplishNPC_Name
				 and sceneId == x500609_g_SceneID then
			
			AddNumText( sceneId, x500609_g_ScriptId, x500609_g_MissionName, 2, x500609_g_CompleteMission_IDX )
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş£¬Ò²¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500609_CheckAccept( sceneId, selfId, targetId )
	
	--¼ì²âÍæ¼ÒÊÇ·ñ·ûºÏ½ÓÊÜÈÎÎñµÄÌõ¼ş
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500609_g_Name then
		x500609_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	--¼ì²âµÈ¼¶
	if LuaFnGetLevel( sceneId, selfId ) < x500609_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500609_g_PlayerSlow_LVL )
		x500609_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--ÒÑ¾­½Ó¹ıÔò²»·ûºÏÌõ¼ş
	if IsHaveMission( sceneId, selfId, x500609_g_MissionId ) > 0 then
		x500609_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500609_g_MissionId ) > 0 then
		return 0
	end

	--¼ì²âÇ°ĞøÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x500609_g_PreMissionId ) <= 0 then
		x500609_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_177}" )
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ£¬½ö¹©×ÓÈÎÎñµ÷ÓÃÉèÖÃ¹«¹²²ÎÊı
--**********************************
function x500609_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
 	if LuaFnGetName( sceneId, targetId ) ~= x500609_g_Name then
 		x500609_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	if x500609_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local bAdd = AddMission( sceneId, selfId, x500609_g_MissionId, x500609_g_ScriptId, 1, 0, 0 )
	if bAdd >= 1 then

		--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500609_g_MissionId )
		
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ0 (ÈÎÎñÍê³ÉÇé¿ö)
		SetMissionByIndex( sceneId, selfId, misIndex, x500609_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500609_g_RecordIdx, 0 )
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ2Î»ÖÃÎªÈÎÎñ½Å±¾ºÅ
		SetMissionByIndex( sceneId, selfId, misIndex, x500609_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500609_g_AcceptNPC_Idx, 2)
		
		local strText = "#{YD_20080421_229}" .. x500609_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

	end

	return 1

end

--**********************************
--·ÅÆú£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500609_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500609_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500609_g_MissionId )
	end
	
	return 0

end

--**********************************
--¼ÌĞø
--**********************************
function x500609_OnContinue( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500609_g_AccomplishNPC_Name then
		x500609_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	-- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500609_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500609_g_MissionName)
		AddText( sceneId, x500609_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500609_g_ScriptId,x500609_g_MissionId)
	
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x500609_CheckSubmit( sceneId, selfId, targetId )

	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500609_g_AccomplishNPC_Name then
		x500609_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500609_g_MissionId ) <= 0 then
		x500609_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500609_g_MissionId)

	-- ¼ì²âÈÎÎñÊÇ·ñÍê³É	
	if GetMissionParam(sceneId, selfId, misIndex, x500609_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--Ìá½»£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500609_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500609_g_AccomplishNPC_Name then
		x500609_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

  -- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500609_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500609_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500609_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500609_g_ExpBonus )

	-- ÈÎÎñË³ÀûÍê³É
	x500609_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500609_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500609_g_MissionId )
	 	-- ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
	 	MissionCom( sceneId, selfId, x500609_g_MissionId )
	 	
	 	local strText = "#Y" .. x500609_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- µ¯³öºóĞøÈÎÎñ½ÓÊÜ½çÃæ
	 	if IsHaveMission( sceneId, selfId, x500609_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500609_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500609_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500609_g_MissionIndexNext )
	 	end	 		 		 	
	end

	-- local nItemId = 0
	-- -- ¸øÓè½±ÀøÎïÆ·
	-- BeginAddItem(sceneId)
	-- AddItem(sceneId,x500609_g_ItemBonus_List.id, x500609_g_ItemBonus_List.num)
	-- local canAdd = EndAddItem(sceneId,selfId)						
	-- if canAdd > 0 then
	-- 	nItemId = x500609_g_ItemBonus_List.id
	-- 	AddItemListToHuman(sceneId,selfId)
	-- end

end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x500609_OnKillObject( sceneId, selfId, objdataId ,objId)--²ÎÊıÒâË¼£º³¡¾°ºÅ¡¢Íæ¼ÒobjId¡¢¹ÖÎï±íÎ»ÖÃºÅ¡¢¹ÖÎï

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName ~= x500609_g_MonsterName then
		return 0
	end
	
	local num = GetMonsterOwnerCount(sceneId,objId)
	for i=0,num-1  do
		-- È¡µÃÓµÓĞ·ÖÅäÈ¨µÄÈËµÄobjId
		local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
		-- PrintStr("humanObjId=" .. humanObjId)
		-- ¿´Õâ¸öÈËÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
		if IsHaveMission(sceneId, humanObjId, x500609_g_MissionId) > 0 then
			-- ÏÈÅĞ¶ÏÊÇ²»ÊÇÒÑ¾­Âú×ãÁËÍê³É±êÖ¾
			local misIndex = GetMissionIndexByID(sceneId,humanObjId,x500609_g_MissionId)
			if GetMissionParam(sceneId, humanObjId, misIndex, x500609_g_Mission_IsComplete) <=0  then
				local killedCount =	GetMissionParam(sceneId, humanObjId, misIndex, x500609_g_RecordIdx)
				killedCount = killedCount + 1
				SetMissionByIndex(sceneId, humanObjId, misIndex, x500609_g_RecordIdx, killedCount)					
				BeginEvent(sceneId)
					local str = format("Ğã giªt chªt %s %d/%d", x500609_g_MonsterName, killedCount, x500609_g_KillMonsterCnt )						
					AddText(sceneId, str)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId, humanObjId)
				if killedCount >= x500609_g_KillMonsterCnt then
					SetMissionByIndex(sceneId, humanObjId, misIndex, x500609_g_Mission_IsComplete, 1)
				end
			end
		end
	end

end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x500609_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x500609_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--½ÓÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500609_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--½»ÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500609_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x500609_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ÓëNPC¶Ô»°
--**********************************
function x500609_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--È¡µÃ±¾ÊÂ¼şµÄMissionId£¬ÓÃÓÚobjÎÄ¼şÖĞ¶Ô»°Çé¾°µÄÅĞ¶Ï
--**********************************
function x500609_GetEventMissionId( sceneId, selfId )	
	return x500609_g_MissionId
end

function x500609_AcceptMission( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500609_g_Name then
		x500609_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x500609_g_MissionName)
		AddText( sceneId, x500609_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_63}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500609_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500609_g_ScriptId,x500609_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--»ñÈ¡¾ßÌåitemµÄÏêÏ¸ĞÅÏ¢
function x500609_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--µÀ¾ßÊ¹ÓÃ
--**********************************
function x500609_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--ËÀÍöÊÂ¼ş
--**********************************
function x500609_OnDie( sceneId, selfId, killerId )
end
