
-- ÓñÏª£¬Ó¢ÐÛ¾ÈÃÀ

--************************************************************************
--MisDescBegin
--½Å±¾ºÅ
x212111_g_ScriptId = 212111

--ÈÎÎñºÅ
x212111_g_MissionId = 618

--Ç°ÐøÈÎÎñ
x212111_g_PreMissionId_1 = 615
x212111_g_PreMissionId_2 = 616
x212111_g_PreMissionId_3 = 617

--Ä¿±êNPC
x212111_g_Name = "A Thi Mã"

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212111_g_IfMissionElite = 0

--ÈÎÎñ¹éÀà
x212111_g_MissionKind = 38

--ÈÎÎñµÈ¼¶
x212111_g_MissionLevel = 72

--ÈÎÎñÎÄ±¾ÃèÊö
x212111_g_MissionName="Anh hùng cÑu mÛ nhân"
x212111_g_MissionInfo="#{Mis_K_Yuxi_1000173}"
x212111_g_MissionTarget="  Giªt chªt Nhi®t B¯ Ba LÕc · Ng÷c Khê #{_INFOAIM254,147,27,-1}, giäi cÑu A Thi Mã."	--ÈÎÎñÄ¿±ê
x212111_g_MissionComplete="  Là các hÕ ðã giäi cÑu tÕi hÕ sao? Còn A H¡c... A H¡c, h¡n ðã chÕy ði r°i sao? Th§t ra tÕi hÕ lúc ð¥u ðã biªt ðßþc A H¡c r¤t thích A Y Na r°i...#r TÕi hÕ không mu¯n gã cho A Chi, và cûng không mu¯n th¤y A H¡c bu°n, hay là tÕi hÕ... s¨ làm mµt hòn ðá cô ð½n, vînh vi­n s¨ làm mµt hòn ðá cô ð½n thôi..."	--Íê³ÉÈÎÎñnpcËµ»°µÄ»°
x212111_g_MissionContinue="  Ta vçn là ... ... vçn là 1 viên ðá, mãi mãi là 1 viên ðá thôi ... ..."

x212111_g_MoneyBonus=4750
x212111_g_exp=19800

x212111_g_Custom	= { {id="Ðã giªt Nhi®t B¯ Ba La",num=1} }
x212111_g_IsMissionOkFail = 0

x212111_g_RadioItemBonus={{id=10400067 ,num=1},{id=10411080,num=1},{id=10412073,num=1},{id=10405066,num=1}}

--MisDescEnd
--************************************************************************

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x212111_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212111_g_MissionId) > 0 then
		--·¢ËÍÈÎÎñÐèÇóµÄÐÅÏ¢

		if GetName(sceneId, targetId) == "A Thi Mã"   then
			BeginEvent(sceneId)
				AddText(sceneId,x212111_g_MissionName)
				AddText(sceneId,x212111_g_MissionContinue)
			EndEvent( )
			bDone = x212111_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212111_g_ScriptId,x212111_g_MissionId,bDone)
		end
    --Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
  elseif x212111_CheckAccept(sceneId,selfId) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212111_g_MissionName)
			AddText(sceneId,x212111_g_MissionInfo)
			AddText(sceneId,x212111_g_MissionTarget)
			AddMoneyBonus( sceneId, x212111_g_MoneyBonus )
			for i, item in x212111_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212111_g_ScriptId,x212111_g_MissionId)
  end

end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x212111_OnEnumerate( sceneId, selfId, targetId )

  --Èç¹ûÍæ¼ÒÍê³É¹ýÕâ¸öÈÎÎñ
  if IsMissionHaveDone(sceneId,selfId,x212111_g_MissionId) > 0 then
		return
	end
	
  --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212111_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == "A Thi Mã"   then
			AddNumText(sceneId,x212111_g_ScriptId,x212111_g_MissionName,2,-1);
		end

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x212111_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId, targetId) == "A H¡c"   then
			AddNumText(sceneId,x212111_g_ScriptId,x212111_g_MissionName,1,-1);
		end
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x212111_CheckAccept( sceneId, selfId )
	
	--ÐèÒª4¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) < 72 then
		return 0
	end

	if IsMissionHaveDone(sceneId,selfId,x212111_g_PreMissionId_1) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212111_g_PreMissionId_2) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212111_g_PreMissionId_3) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212111_OnAccept( sceneId, selfId )
	
	-- ¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	local ret = AddMission( sceneId,selfId, x212111_g_MissionId, x212111_g_ScriptId, 1, 0, 0 )		--Ìí¼ÓÈÎÎñ
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh§t ký nhi®m vø cüa các hÕ ðã ð¥y" , MSG2PLAYER_PARA )
		return
	end
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212111_g_MissionId)			--µÃµ½ÈÎÎñµÄÐòÁÐºÅ
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--¸ù¾ÝÐòÁÐºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ0Î»ÖÃ0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--¸ù¾ÝÐòÁÐºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ1Î»ÖÃ0
	Msg2Player(  sceneId, selfId,"#YNh§n nhi®m vø: Anh hùng cÑu mÛ nhân",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x212111_g_SignPost.x, x212111_g_SignPost.z, x212111_g_SignPost.tip )
	BeginEvent(sceneId)
		strText = "##YNh§n nhi®m vø: Anh hùng cÑu mÛ nhân"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--·ÅÆú
--**********************************
function x212111_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
  DelMission( sceneId, selfId, x212111_g_MissionId )
end


--**********************************
--¼ÌÐø
--**********************************
function x212111_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ÐÅÏ¢
  BeginEvent(sceneId)
		AddText(sceneId,x212111_g_MissionName)
		AddText(sceneId,x212111_g_MissionComplete)
		AddMoneyBonus( sceneId, x212111_g_MoneyBonus )
		for i, item in x212111_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212111_g_ScriptId,x212111_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212111_CheckSubmit( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x212111_g_MissionId)
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)

	if Kill1~=1 			then
		return 0
	end
	return 1
end

--**********************************
--Ìá½»
--**********************************
function x212111_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	-- ÐèÒªÔÙ×öÒ»¸öÍê³ÉÈÎÎñµÄ¼ì²â
	if x212111_CheckSubmit( sceneId, selfId ) < 1  then
		return
	end
	
	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÓÐÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212111_g_MissionId) <= 0 then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212111_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	if ret > 0 then
		DelMission( sceneId, selfId, x212111_g_MissionId )
		MissionCom( sceneId, selfId, x212111_g_MissionId )
	
		AddMoney(sceneId,selfId,x212111_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212111_g_exp)
		AddItemListToHuman(sceneId,selfId)
	else
		--ÈÎÎñ½±ÀøÃ»ÓÐ¼Ó³É¹¦
		BeginEvent(sceneId)
			AddText(sceneId, "Không th¬ hoàn t¤t nhi®m vø");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end

end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212111_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == "Nhi®t B¯ Ba LÕp"	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x212111_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		SetMissionByIndex(sceneId,selfId,misIndex,1,1)
		BeginEvent(sceneId)
		AddText(sceneId,"Ðã giªt Nhi®t B¯ Ba La: 1/1");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		--Èç¹ûÍæ¼ÒÉ±¶ÔÁËÈË£¬¾ÍÔÚÒ»¸ö¹Ì¶¨µãË¢³öÒ»¸öNPC£¬³ÖÐøÒ»·ÖÖÓ
		local NpcId
		NpcId = LuaFnCreateMonster(sceneId, 210, 252, 142, 3, 0, 027004)
		SetCharacterName(sceneId, NpcId, "A Thi Mã")
		SetCharacterDieTime(sceneId, NpcId, 600000)
	end

end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x212111_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212111_OnItemChanged( sceneId, selfId, itemdataId )
end
