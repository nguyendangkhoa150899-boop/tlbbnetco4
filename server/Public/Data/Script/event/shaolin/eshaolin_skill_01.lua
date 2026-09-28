-- 212140
-- ÉÙÁÖÈÎÎñ ÉÙÁÖ¾ÉÊÂ

-- Íæ¼ÒµÈ¼¶´óÓÚµÈÓÚ30¼¶¡£
-- ½ð¸Õ¾­¡¢·¨»ª¾­£¬´ïÄ¦ÐÄ¾­£¬ÁúÊ÷ÐÄ¾­£¬ÊÍåÈ¾­ÐÄ·¨µÈ¼¶ÖÁÉÙ25¼¶£¬´ó¹âÃ÷¾­ÐÄ·¨µÈ¼¶ÖÁÉÙ30¼¶¡£Õâ¸öÌõ¼þÔÚµã¡°½ÓÊÜÈÎÎñ¡±µÄÊ±ºòÔÙ½øÐÐÌáÊ¾¡£

--MisDescBegin
--½Å±¾ºÅ
x212140_g_ScriptId = 212140

--½ÓÊÜÈÎÎñNPCÊôÐÔ
x212140_g_Position_X=217
x212140_g_Position_Z=255
x212140_g_SceneID=2
x212140_g_AccomplishNPC_Name="Vß½ng Thi«u"

--ÈÎÎñºÅ
x212140_g_MissionId = 961

--Ä¿±êNPC
x212140_g_Name	="Vß½ng Thi«u"

--ÈÎÎñ¹éÀà
x212140_g_MissionKind = 20

--ÈÎÎñµÈ¼¶
x212140_g_MissionLevel = 30

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212140_g_IfMissionElite = 0

--ÈÎÎñÃû
x212140_g_MissionName="Chuy®n cû Thiªu Lâm"
x212140_g_MissionInfo="#{Mis_shaolin_961}"
x212140_g_MissionTarget="TÕi #Gthành ÐÕi Lý Tu Vån Ðài#W tìm #RVß½ng Thi«u #W#{_INFOAIM217,255,2,Vß½ng Thi«u}."
x212140_g_MissionComplete="  Các hÕ là ð® tØ Thiªu Lâm ß, phß½ng trßþng cüa các hÕ Huy«n T× ðÕi sß vçn khöa chÑ ?"

x212140_g_MoneyBonus=1000
x212140_g_exp=2000

x212140_g_Custom	= { {id="Ðã tìm ðßþc Vß½ng Thi«u",num=1} }
x212140_g_IsMissionOkFail = 0

--MisDescEnd

x212140_g_Xinfa = {{id=1,limit=10,name="Kim Cang Kinh"},  -- zchw
									 {id=2,limit=25,name="Pháp Hoa Kinh"},
									 {id=3,limit=30,name="ÐÕi Quang Minh Kinh"},
									 {id=4,limit=25,name="ÐÕt Ma Tâm Kinh"},
									 {id=5,limit=25,name="Long Thø Tâm Kinh"},
									 {id=6,limit=25,name="Thích Ca Kinh"},
									 }
x212140_g_Menpai = 0

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x212140_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212140_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212140_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212140_g_Name then
			x212140_OnContinue( sceneId, selfId, targetId )
		end
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212140_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212140_g_Name then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x212140_g_MissionName)
				AddText(sceneId,x212140_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212140_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212140_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212140_g_ScriptId,x212140_g_MissionId)
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x212140_OnEnumerate( sceneId, selfId, targetId )

	--Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212140_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212140_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212140_g_Name then
			AddNumText(sceneId, x212140_g_ScriptId,x212140_g_MissionName,2,-1);
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212140_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212140_g_Name then
			AddNumText(sceneId,x212140_g_ScriptId,x212140_g_MissionName,1,-1);
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212140_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ý
	if (IsMissionHaveDone(sceneId,selfId,x212140_g_MissionId) > 0 ) then
		return 0
	end
		
	-- µÈ¼¶¼ì²â
	if GetLevel(sceneId, selfId) < x212140_g_MissionLevel then
		return 0
	end
	
	-- ÃÅÅÉ¼ì²â
	if GetMenPai(sceneId, selfId) ~= x212140_g_Menpai  then
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212140_OnAccept( sceneId, selfId, targetId )
	if x212140_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- ¼ì²éÍæ¼ÒµÄÐÄ·¨ÊÇ²»ÊÇ´ïµ½ÁËÒªÇó£¨Ç°ÁùÖÖÐÄ·¨µÈ¼¶´óÓÚµÈÓÚ10¼¶£©
	if x212140_CheckAllXinfaLevel(sceneId, selfId) == 0  then
		x212140_DispatchXinfaLimit(sceneId, selfId, targetId)
		return
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	local ret = AddMission(sceneId,selfId, x212140_g_MissionId, x212140_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = "#YNh§t ký nhi®m vø cüa các hÕ ðã ð¥y"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = "#YTiªp nh§n nhi®m vø: Chuy®n cû Thiªu Lâm."
	Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212140_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--·ÅÆú
--**********************************
function x212140_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212140_g_MissionId )
end

--**********************************
--¼ÌÐø
--**********************************
function x212140_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
  BeginEvent(sceneId)
		AddText(sceneId,x212140_g_MissionName)
		AddText(sceneId,x212140_g_MissionComplete)
		AddMoneyBonus( sceneId, x212140_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212140_g_ScriptId,x212140_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212140_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212140_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212140_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212140_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--Ìí¼ÓÈÎÎñ½±Àø
		AddMoney(sceneId,selfId, x212140_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212140_g_exp)
		DelMission( sceneId, selfId, x212140_g_MissionId )
		MissionCom( sceneId, selfId, x212140_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHoàn thành nhi®m vø: Chuy®n cû Thiªu Lâm",MSG2PLAYER_PARA )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212140_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x212140_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212140_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¼ì²âÐÄ·¨ÊÇ²»¹»½ÓÈÎÎñ
--**********************************
function x212140_CheckAllXinfaLevel(sceneId, selfId)
	for i, xinfa in x212140_g_Xinfa do
		if LuaFnGetXinFaLevel(sceneId, selfId, xinfa.id) < xinfa.limit  then
			return 0
		end
	end
	return 1
end

--**********************************
--ÏòÍæ¼ÒÏÔÊ¾ÐÄ·¨²î¾à
--**********************************
function x212140_DispatchXinfaLimit(sceneId, selfId, targetId)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#Y" .. x212140_g_MissionName)
		AddText(sceneId,"  ÐÆng c¤p tâm pháp cüa các hÕ không ðü r°i, vi sß làm sao dám ð¬ các hÕ mÕo hi¬m ði tìm Vß½ng Thi«u ðßþc?")
		AddText(sceneId,"ÐÆng c¤p tâm pháp cüa các hÕ: ")
		local str
		local bOk = 0
		for i, xinfa in x212140_g_Xinfa do
			if LuaFnGetXinFaLevel(sceneId, selfId, xinfa.id) < xinfa.limit  then
				str = "[ÐÆng c¤p không ðü]"
				bOk = 0
			else
				str = "[Hoàn thành]"
				bOk = 1
			end
			local str1 = "    " .. xinfa.name .. ":" .. tostring(LuaFnGetXinFaLevel(sceneId, selfId, xinfa.id)) .. "/" .. xinfa.limit .. str
			if bOk == 1  then
				str1 = "#Y" .. str1
			else
				str1 = "#R" .. str1
			end
			AddText(sceneId,str1)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end
