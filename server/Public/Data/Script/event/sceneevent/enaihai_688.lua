-- ËÍĞÅÈÎÎñ
-- Ê¯¸Òµ± -> Ò¶Á÷·²

--MisDescBegin
--½Å±¾ºÅ
x212114_g_ScriptId = 212114

--ÈÎÎñºÅ
x212114_g_MissionId = 688

--Ç°ĞøÈÎÎñ
x212114_g_PreMissionId = 687

--Ä¿±êNPC
x212114_g_Name	="Di®p Lßu Phàm"

--ÈÎÎñ¹éÀà
x212114_g_MissionKind = 45

--ÈÎÎñµÈ¼¶
x212114_g_MissionLevel = 82

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212114_g_IfMissionElite = 0

--ÈÎÎñÃû
x212114_g_MissionName="Vªt máu thÑ 2"
x212114_g_MissionInfo="#{Mis_S_Nanhai_1010193}"
x212114_g_MissionTarget="  Mang #YHuyªt y#W t£ng cho #RDi®p Lßu Phàm#W · #GNam Häi Kiªm Phá #W#{_INFOAIM115,58,34, Lßu Di®p Phàm}. "
x212114_g_MissionContinue="  Các hÕ tìm ta có vi®c gì?"
x212114_g_MissionComplete="  T¤m... T¤m huyªt y này dß¶ng nhß là y trang cüa Nam Chiêu BÕch Miêu Nhân"

x212114_g_MoneyBonus=36900
x212114_g_exp=35000

x212114_g_Custom	= { {id="Ğã ğÕt ğßşc t¤m huyªt y",num=1} }
x212114_g_IsMissionOkFail = 0

--MisDescEnd

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212114_OnDefaultEvent( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if (IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212114_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212114_g_Name then
			x212114_OnContinue( sceneId, selfId, targetId )
		end
	
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212114_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212114_g_Name then
			--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212114_g_MissionName)
				AddText(sceneId,x212114_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212114_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212114_g_MoneyBonus )
				AddRadioItemBonus( sceneId, 10420074, 1 )
				AddRadioItemBonus( sceneId, 10410076, 1 )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212114_g_ScriptId,x212114_g_MissionId)
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212114_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÍæ¼ÒÍê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 then
		return 
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	elseif IsHaveMission(sceneId,selfId,x212114_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212114_g_Name then
			AddNumText(sceneId, x212114_g_ScriptId,x212114_g_MissionName,2,-1);
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212114_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212114_g_Name then
			AddNumText(sceneId,x212114_g_ScriptId,x212114_g_MissionName,1,-1);
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212114_CheckAccept( sceneId, selfId )
	-- 1£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­×ö¹ı
	if (IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 ) then
		return 0
	end
		
	-- µÈ¼¶¼ì²â
	if GetLevel( sceneId, selfId ) < x212114_g_MissionLevel then
		return 0
	end
	
	-- Ç°ĞøÈÎÎñµÄÍê³ÉÇé¿ö
	if IsMissionHaveDone(sceneId,selfId,x212114_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--½ÓÊÜ
--**********************************
function x212114_OnAccept( sceneId, selfId, targetId )
	if x212114_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- Ìí¼ÓÈÎÎñÎïÆ·
	BeginAddItem( sceneId )
		AddItem( sceneId, 40002075, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--ÌáÊ¾²»ÄÜ½ÓÈÎÎñÁË
		Msg2Player(  sceneId, selfId,"#Yhành Trang nhi®m vø#W cüa các hÕ ğã ğ¥y", MSG2PLAYER_PARA )
	else
		--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
		local ret = AddMission( sceneId,selfId, x212114_g_MissionId, x212114_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
			return
		end

		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#YNh§n nhi®m vø: vªt máu thÑ 2",MSG2PLAYER_PARA )
		BeginEvent(sceneId)
			strText = "#YNh§n nhi®m vø: vªt máu thÑ 2"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212114_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	end
	
end

--**********************************
--·ÅÆú
--**********************************
function x212114_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212114_g_MissionId )
	DelItem( sceneId, selfId, 40002075, 1 )	
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x212114_g_SignPost.tip )
end

--**********************************
--¼ÌĞø
--**********************************
function x212114_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
  BeginEvent(sceneId)
	AddText(sceneId,x212114_g_MissionName)
	AddText(sceneId,x212114_g_MissionComplete)
	AddMoneyBonus( sceneId, x212114_g_MoneyBonus )
	AddRadioItemBonus( sceneId, 10420074, 1 )
	AddRadioItemBonus( sceneId, 10410076, 1 )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212114_g_ScriptId,x212114_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212114_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212114_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212114_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x212114_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- Ìí¼Ó½±ÀøÎïÆ·
		BeginAddItem(sceneId)
			AddItem( sceneId, selectRadioId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0  then
			-- É¾³ıÈÎÎñÎïÆ·
			DelItem( sceneId, selfId, 40002075, 1 )	

			--Ìí¼ÓÈÎÎñ½±Àø
			AddItemListToHuman(sceneId,selfId)			
			AddMoney(sceneId,selfId, x212114_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, x212114_g_exp)
			
			--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
			DelMission( sceneId,selfId,  x212114_g_MissionId )
			MissionCom( sceneId,selfId,  x212114_g_MissionId )
	
			Msg2Player(  sceneId, selfId,"#YHoàn t¤t nhi®m vø: vªt máu thÑ 2",MSG2PLAYER_PARA )
			
			-- µ÷ÓÃºóĞøÈÎÎñ
			CallScriptFunction((200081), "OnDefaultEvent",sceneId, selfId, targetId )
			
			-- Ìá½»ÈÎÎñºó£¬Ë¢2×é£¬3¸ö¹Ö³öÀ´,ÏûÊ§Ê±¼ä30Ãë
			local nNpcId
			nNpcId = LuaFnCreateMonster(sceneId, 823, 118, 55, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			
			nNpcId = LuaFnCreateMonster(sceneId, 821, 115, 54, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			nNpcId = LuaFnCreateMonster(sceneId, 821, 114, 52, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			
		else
			--ÈÎÎñ½±ÀøÃ»ÓĞ¼Ó³É¹¦
			BeginEvent(sceneId)
				AddText(sceneId, "Không th¬ hoàn t¤t nhi®m vø");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		end
		
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212114_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212114_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212114_OnItemChanged( sceneId, selfId, itemdataId )
end
