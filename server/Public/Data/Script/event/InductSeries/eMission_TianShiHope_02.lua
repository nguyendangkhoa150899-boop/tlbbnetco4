--´´½¨ÈË[ QUFEI 2008-04-30 10:27 UPDATE BugID 34165 ]
--½â¾öÁ÷Ê§ÂÊÒıµ¼ÈÎÎñÊÂ¼ş½Å±¾
--Æå¾ÖÒıµ¼ÈÎÎñ_ÌìÊ¦µÄÆÚ´ı2

--MisDescBegin
--½Å±¾ºÅ
x500602_g_ScriptId	= 500602

--Ä¿±êÈÎÎñNPCÊôĞÔ
x500602_g_Position_X=160.2399
x500602_g_Position_Z=134.1486
x500602_g_SceneID=0
x500602_g_AccomplishNPC_Name="Châu Thiên Sß"

--Ç°ĞøÈÎÎñºÅ
x500602_g_PreMissionId	=	408
--ÈÎÎñºÅ
x500602_g_MissionId			= 409
--ÏÂÒ»¸öÈÎÎñµÄID
x500602_g_MissionIdNext	= 410
--ÏÂÒ»¸öÈÎÎñµÄIndex
x500602_g_MissionIndexNext	= 1018706
--ÏÂÒ»¸öÈÎÎñµÄScriptId
x500602_g_NextScriptId	= 006668
--ÁìÈ¡ÈÎÎñÄ¿±êËùÔÚ³¡¾°
x500602_g_AcceptNPC_SceneID	=	0
--ÁìÈ¡ÈÎÎñnpc
x500602_g_Name 					= "Châu Thiên Sß"
--ÈÎÎñ¹éÀà
x500602_g_MissionKind			= 11
--ÈÎÎñµÈ¼¶
x500602_g_MissionLevel		= 28
--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x500602_g_IfMissionElite	= 0
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x500602_g_IsMissionOkFail	= 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x500602_g_MissionName			= "Thiên Sß kÏ ğãi (2)"
--ÈÎÎñÃèÊö
x500602_g_MissionInfo			= "#{YD_20080421_14}"
--ÈÎÎñÄ¿±ê
x500602_g_MissionTarget		= "#{YD_20080421_35}"
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x500602_g_ContinueInfo		= "#{YD_20080421_15}"
--Íê³ÉÈÎÎñnpcËµµÄ»°
x500602_g_MissionComplete	= "#{YD_20080421_16}"
--¿ÉÒÔÍê³ÉµÄ»·Êı
x500602_g_MaxRound	= 1
--¿ØÖÆ½Å±¾
x500602_g_ControlScript		= 001066

-- ÈÎÎñÍê³ÉÇé¿ö,ÄÚÈİ¶¯Ì¬Ë¢ĞÂ,Õ¼ÓÃÈÎÎñ²ÎÊıµÄµÚ1Î»
x500602_g_Custom	= { {id="Ğã lên t¾i 30 c¤p",num=1} }
--MisDescEnd

--ÈÎÎñÊÇ·ñÍê³É
x500602_g_Mission_IsComplete = 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»
--ÊÇ·ñ´ïµ½µÈ¼¶µÄ±ê¼Ç
x500602_g_RecordIdx 				 = 1		--ÈÎÎñ²ÎÊıµÄµÚ1Î»
--ÈÎÎñ½Å±¾ºÅ¼ÇÂ¼
x500602_g_MissScriptID_Idx	 = 2		--ÈÎÎñ²ÎÊıµÄµÚ2Î»
--ÈÎÎñ·¢²¼NPC±ê¼Ç
x500602_g_AcceptNPC_Idx			 = 3		--ÈÎÎñ²ÎÊıµÄµÚ3Î» 1.ÂåÑôNPC

x500602_g_AcceptMission_IDX		= 747	--½ÓÊÕÈÎÎñË÷Òı
x500602_g_CompleteMission_IDX	= 748	--Ìá½»ÈÎÎñË÷Òı

--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x500602_g_EventList	= {}

x500602_g_PlayerSlow_LVL					 = 28		-- ½ÓÊÜÈÎÎñµÄ×îµÍµÈ¼¶

--½±Àø
x500602_g_MoneyBonus					=	1000
x500602_g_ExpBonus						= 4051

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
function x500602_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500602_g_AcceptMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
			x500602_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- ÈÎÎñÊÇ·ñÒÑÂú
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500602_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ¼ì²âÈÎÎñ½ÓÊÜÌõ¼ş
		if x500602_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ½øÈë½ÓÊÜÈÎÎñ½çÃæ			
		x500602_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500602_g_CompleteMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
			x500602_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- Èç¹ûÒÑ¾­½ÓÁËÈÎÎñ
		if IsHaveMission( sceneId, selfId, x500602_g_MissionId) > 0 then
												
			--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId, x500602_g_MissionName)
				AddText(sceneId, x500602_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500602_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500602_g_ScriptId, x500602_g_MissionId, bDone)
			
		else			
			x500602_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500602_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x500602_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name
		 or sceneId ~= x500602_g_SceneID then
		 
		 return 0
	end

	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) <= 0 then
		if IsMissionHaveDone( sceneId, selfId, x500602_g_MissionId ) <= 0
			 and LuaFnGetLevel( sceneId, selfId ) >= x500602_g_PlayerSlow_LVL then
			AddNumText( sceneId, x500602_g_ScriptId, x500602_g_MissionName, 1, x500602_g_AcceptMission_IDX )
		end
	else
		
		AddNumText( sceneId, x500602_g_ScriptId, x500602_g_MissionName, 2, x500602_g_CompleteMission_IDX )
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş£¬Ò²¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500602_CheckAccept( sceneId, selfId, targetId )
	
	--¼ì²âÍæ¼ÒÊÇ·ñ·ûºÏ½ÓÊÜÈÎÎñµÄÌõ¼ş
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
		x500602_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	--¼ì²âµÈ¼¶
	if LuaFnGetLevel( sceneId, selfId ) < x500602_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500602_g_PlayerSlow_LVL )
		x500602_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--ÒÑ¾­½Ó¹ıÔò²»·ûºÏÌõ¼ş
	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) > 0 then
		-- x500602_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500602_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--½ÓÊÜ£¬½ö¹©×ÓÈÎÎñµ÷ÓÃÉèÖÃ¹«¹²²ÎÊı
--**********************************
function x500602_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
 	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
 		x500602_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	if x500602_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local bAdd = AddMission( sceneId, selfId, x500602_g_MissionId, x500602_g_ScriptId, 0, 0, 0 )
	if bAdd >= 1 then

		--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500602_g_MissionId )
		
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ0 (ÈÎÎñÍê³ÉÇé¿ö)
		SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_RecordIdx, 0 )
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ2Î»ÖÃÎªÈÎÎñ½Å±¾ºÅ
		SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500602_g_AcceptNPC_Idx, 1)

		local strText = "#{YD_20080421_229}" .. x500602_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		-- ÊÇ·ñ´ïµ½30¼¶
		local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	  if Playerlvl >= 30 then
			SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_Mission_IsComplete, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_RecordIdx, 1 )
			x500602_NotifyTip( sceneId, selfId, "#{YD_20080421_181}" )
		end

	end

	return 1

end

--**********************************
--·ÅÆú£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500602_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500602_g_MissionId )
	end
	
	return 0

end

--**********************************
--¼ÌĞø
--**********************************
function x500602_OnContinue( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
		x500602_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	-- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500602_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500602_g_MissionName)
		AddText( sceneId, x500602_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500602_g_ScriptId,x500602_g_MissionId)
	
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x500602_CheckSubmit( sceneId, selfId, targetId )

	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
		x500602_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) <= 0 then
		x500602_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	-- ÊÇ·ñ´ïµ½30¼¶
	local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	if Playerlvl < 30 then
		x500602_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_182}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500602_g_MissionId)

	-- ¼ì²âÈÎÎñÊÇ·ñÍê³É	
	if GetMissionParam(sceneId, selfId, misIndex, x500602_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--Ìá½»£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500602_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
		x500602_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

  -- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500602_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500602_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500602_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500602_g_ExpBonus )

	-- ÈÎÎñË³ÀûÍê³É
	x500602_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500602_g_MissionId )
	 	-- ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
	 	MissionCom( sceneId, selfId, x500602_g_MissionId )
	 	
	 	local strText = "#Y" .. x500602_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- µ¯³öºóĞøÈÎÎñ½ÓÊÜ½çÃæ
	 	if IsHaveMission( sceneId, selfId, x500602_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500602_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500602_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500602_g_MissionIndexNext )
	 	end	 		 	
	end

end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x500602_OnKillObject( sceneId, selfId, objdataId ,objId)--²ÎÊıÒâË¼£º³¡¾°ºÅ¡¢Íæ¼ÒobjId¡¢¹ÖÎï±íÎ»ÖÃºÅ¡¢¹ÖÎï
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x500602_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x500602_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--½ÓÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500602_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--½»ÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500602_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x500602_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ÓëNPC¶Ô»°
--**********************************
function x500602_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--È¡µÃ±¾ÊÂ¼şµÄMissionId£¬ÓÃÓÚobjÎÄ¼şÖĞ¶Ô»°Çé¾°µÄÅĞ¶Ï
--**********************************
function x500602_GetEventMissionId( sceneId, selfId )	
	return x500602_g_MissionId
end

function x500602_AcceptMission( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
		x500602_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x500602_g_MissionName)
		AddText( sceneId, x500602_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_35}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500602_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500602_g_ScriptId,x500602_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--»ñÈ¡¾ßÌåitemµÄÏêÏ¸ĞÅÏ¢
function x500602_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--µÀ¾ßÊ¹ÓÃ
--**********************************
function x500602_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--ËÀÍöÊÂ¼ş
--**********************************
function x500602_OnDie( sceneId, selfId, killerId )
end
