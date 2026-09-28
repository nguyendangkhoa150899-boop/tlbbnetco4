--´´½¨ÈË[ QUFEI 2008-04-30 10:27 UPDATE BugID 34172 ]
--½â¾öÁ÷Ê§ÂÊÒıµ¼ÈÎÎñÊÂ¼ş½Å±¾
--ÑàÍõ¹ÅÄ¹Òıµ¼ÈÎÎñ_ÌìÊ¦µÄÆÚ´ı10

--MisDescBegin
--½Å±¾ºÅ
x500616_g_ScriptId	= 500616

--Ä¿±êÈÎÎñNPCÊôĞÔ
x500616_g_Position_X=160.2399
x500616_g_Position_Z=134.1486
x500616_g_SceneID=0
x500616_g_AccomplishNPC_Name="Châu Thiên Sß"

--Ç°ĞøÈÎÎñºÅ
x500616_g_PreMissionId	=	479
--ÈÎÎñºÅ
x500616_g_MissionId			= 480
--ÏÂÒ»¸öÈÎÎñµÄID
x500616_g_MissionIdNext	= 481
--ÏÂÒ»¸öÈÎÎñµÄIndex
x500616_g_MissionIndexNext	= 1018726
--ÏÂÒ»¸öÈÎÎñµÄScriptId
x500616_g_NextScriptId	= 006668
--ÁìÈ¡ÈÎÎñÄ¿±êËùÔÚ³¡¾°
x500616_g_AcceptNPC_SceneID	=	0
--ÁìÈ¡ÈÎÎñnpc
x500616_g_Name 					= "Châu Thiên Sß"
--ÈÎÎñ¹éÀà
x500616_g_MissionKind			= 11
--ÈÎÎñµÈ¼¶
x500616_g_MissionLevel		= 48
--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x500616_g_IfMissionElite	= 0
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x500616_g_IsMissionOkFail	= 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x500616_g_MissionName			= "Thiên Sß kÏ ğãi (10)"
--ÈÎÎñÃèÊö
x500616_g_MissionInfo			= "#{YD_20080421_14}"
--ÈÎÎñÄ¿±ê
x500616_g_MissionTarget		= "#{YD_20080421_143}"
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x500616_g_ContinueInfo		= "#{YD_20080421_15}"
--Íê³ÉÈÎÎñnpcËµµÄ»°
x500616_g_MissionComplete	= "#{YD_20080421_16}"
--¿ÉÒÔÍê³ÉµÄ»·Êı
x500616_g_MaxRound	= 1
--¿ØÖÆ½Å±¾
x500616_g_ControlScript		= 001066

-- ÈÎÎñÍê³ÉÇé¿ö,ÄÚÈİ¶¯Ì¬Ë¢ĞÂ,Õ¼ÓÃÈÎÎñ²ÎÊıµÄµÚ1Î»
x500616_g_Custom	= { {id="Ğã lên t¾i 50 c¤p",num=1} }
--MisDescEnd

--ÈÎÎñÊÇ·ñÍê³É
x500616_g_Mission_IsComplete = 0		--ÈÎÎñ²ÎÊıµÄµÚ0Î»
--ÊÇ·ñ´ïµ½µÈ¼¶µÄ±ê¼Ç
x500616_g_RecordIdx 				 = 1		--ÈÎÎñ²ÎÊıµÄµÚ1Î»
--ÈÎÎñ½Å±¾ºÅ¼ÇÂ¼
x500616_g_MissScriptID_Idx	 = 2		--ÈÎÎñ²ÎÊıµÄµÚ2Î»
--ÈÎÎñ·¢²¼NPC±ê¼Ç
x500616_g_AcceptNPC_Idx			 = 3		--ÈÎÎñ²ÎÊıµÄµÚ3Î» 1.ÂåÑôNPC

x500616_g_AcceptMission_IDX		= 787	--½ÓÊÕÈÎÎñË÷Òı
x500616_g_CompleteMission_IDX	= 788	--Ìá½»ÈÎÎñË÷Òı

--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x500616_g_EventList	= {}

x500616_g_PlayerSlow_LVL					 = 48		-- ½ÓÊÜÈÎÎñµÄ×îµÍµÈ¼¶

--½±Àø
x500616_g_MoneyBonus					=	1666
x500616_g_ExpBonus						= 6665

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
function x500616_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500616_g_AcceptMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
			x500616_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- ÈÎÎñÊÇ·ñÒÑÂú
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500616_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ¼ì²âÈÎÎñ½ÓÊÜÌõ¼ş
		if x500616_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ½øÈë½ÓÊÜÈÎÎñ½çÃæ			
		x500616_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500616_g_CompleteMission_IDX then
		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
			x500616_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
			return 0
		end
		-- Èç¹ûÒÑ¾­½ÓÁËÈÎÎñ
		if IsHaveMission( sceneId, selfId, x500616_g_MissionId) > 0 then
												
			--·¢ËÍÈÎÎñĞèÇóµÄĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId, x500616_g_MissionName)
				AddText(sceneId, x500616_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500616_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500616_g_ScriptId, x500616_g_MissionId, bDone)
			
		else			
			x500616_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500616_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x500616_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name
		 or sceneId ~= x500616_g_SceneID then
		 
		 return 0
	end

	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) <= 0 then
		if IsMissionHaveDone( sceneId, selfId, x500616_g_MissionId ) <= 0
			 and LuaFnGetLevel( sceneId, selfId ) >= x500616_g_PlayerSlow_LVL then
			AddNumText( sceneId, x500616_g_ScriptId, x500616_g_MissionName, 1, x500616_g_AcceptMission_IDX )
		end
	else
		
		AddNumText( sceneId, x500616_g_ScriptId, x500616_g_MissionName, 2, x500616_g_CompleteMission_IDX )
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş£¬Ò²¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500616_CheckAccept( sceneId, selfId, targetId )
	
	--¼ì²âÍæ¼ÒÊÇ·ñ·ûºÏ½ÓÊÜÈÎÎñµÄÌõ¼ş
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
		x500616_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	--¼ì²âµÈ¼¶
	if LuaFnGetLevel( sceneId, selfId ) < x500616_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500616_g_PlayerSlow_LVL )
		x500616_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--ÒÑ¾­½Ó¹ıÔò²»·ûºÏÌõ¼ş
	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) > 0 then
		-- x500616_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500616_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--½ÓÊÜ£¬½ö¹©×ÓÈÎÎñµ÷ÓÃÉèÖÃ¹«¹²²ÎÊı
--**********************************
function x500616_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
 	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
 		x500616_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )					
		return 0
	end

	if x500616_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	local bAdd = AddMission( sceneId, selfId, x500616_g_MissionId, x500616_g_ScriptId, 0, 0, 0 )
	if bAdd >= 1 then

		--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500616_g_MissionId )
		
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ0 (ÈÎÎñÍê³ÉÇé¿ö)
		SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_RecordIdx, 0 )
		--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ2Î»ÖÃÎªÈÎÎñ½Å±¾ºÅ
		SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500616_g_AcceptNPC_Idx, 1)

		local strText = "#{YD_20080421_229}" .. x500616_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		-- ÊÇ·ñ´ïµ½50¼¶
		local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	  if Playerlvl >= 50 then
			SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_Mission_IsComplete, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_RecordIdx, 1 )
			x500616_NotifyTip( sceneId, selfId, "#{YD_20080421_204}" )
		end

	end

	return 1

end

--**********************************
--·ÅÆú£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500616_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500616_g_MissionId )
	end
	
	return 0

end

--**********************************
--¼ÌĞø
--**********************************
function x500616_OnContinue( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
		x500616_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	-- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500616_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500616_g_MissionName)
		AddText( sceneId, x500616_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500616_g_ScriptId,x500616_g_MissionId)
	
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x500616_CheckSubmit( sceneId, selfId, targetId )

	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
		x500616_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) <= 0 then
		x500616_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	-- ÊÇ·ñ´ïµ½50¼¶
	local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	if Playerlvl < 50 then
		x500616_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_205}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500616_g_MissionId)

	-- ¼ì²âÈÎÎñÊÇ·ñÍê³É	
	if GetMissionParam(sceneId, selfId, misIndex, x500616_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--Ìá½»£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x500616_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
		x500616_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )					
		return 0
	end

  -- ¼ì²éÈÎÎñÊÇ·ñÍê³É
	if x500616_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500616_NotifyTip( sceneId, selfId, "Trä nhi®m vø th¤t bÕi" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500616_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500616_g_ExpBonus )

	-- ÈÎÎñË³ÀûÍê³É
	x500616_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500616_g_MissionId )
	 	-- ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
	 	MissionCom( sceneId, selfId, x500616_g_MissionId )
	 	
	 	local strText = "#Y" .. x500616_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- µ¯³öºóĞøÈÎÎñ½ÓÊÜ½çÃæ
	 	if IsHaveMission( sceneId, selfId, x500616_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500616_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500616_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500616_g_MissionIndexNext )
	 	end	 		 		 	
	end

end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x500616_OnKillObject( sceneId, selfId, objdataId ,objId)--²ÎÊıÒâË¼£º³¡¾°ºÅ¡¢Íæ¼ÒobjId¡¢¹ÖÎï±íÎ»ÖÃºÅ¡¢¹ÖÎï
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x500616_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x500616_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--½ÓÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500616_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--½»ÈÎÎñºóÏÔÊ¾µÄ½çÃæ
--**********************************
function x500616_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x500616_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ÓëNPC¶Ô»°
--**********************************
function x500616_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--È¡µÃ±¾ÊÂ¼şµÄMissionId£¬ÓÃÓÚobjÎÄ¼şÖĞ¶Ô»°Çé¾°µÄÅĞ¶Ï
--**********************************
function x500616_GetEventMissionId( sceneId, selfId )	
	return x500616_g_MissionId
end

function x500616_AcceptMission( sceneId, selfId, targetId )
	
	--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
		x500616_NotifyTip( sceneId, selfId, "Tiªp nh§n nhi®m vø th¤t bÕi" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x500616_g_MissionName)
		AddText( sceneId, x500616_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_143}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500616_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500616_g_ScriptId,x500616_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--»ñÈ¡¾ßÌåitemµÄÏêÏ¸ĞÅÏ¢
function x500616_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--µÀ¾ßÊ¹ÓÃ
--**********************************
function x500616_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--ËÀÍöÊÂ¼ş
--**********************************
function x500616_OnDie( sceneId, selfId, killerId )
end
