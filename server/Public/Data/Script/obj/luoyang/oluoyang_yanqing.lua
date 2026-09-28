--ÂåÑôNPC
--ÑàÇà
--ÆÕÍ¨

--½Å±¾ºÅ
x000034_g_ScriptId = 000034

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x000034_g_eventList={250507, 808101, 808102, 808103, 808093}


x000034_g_DarkSkillName = { [40] = {name = "Ném Ám Khí", id = 274, needmoney = 20000},
                            [70] = {name = "Ám Khí Ðä Huy®t", id = 275, needmoney = 100000},
                            [90] = {name = "Ám Khí Hµ Th¬", id = 276, needmoney = 500000},
                          }                
x000034_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x000034_g_DarkBreachPointNeedMoney = 
{
	[39] = 40000,
	[49] = 50000,
	[59] = 60000,
	[69] = 70000,
	[79] = 80000,
	[89] = 90000,
	[99] = 100000,
	[109] = 110000,
	[119] = 120000,
	[129] = 130000,
}  --Í»ÆÆÆ¿¾±ÐèÒª½ðÇ®


--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x000034_UpdateEventList( sceneId, selfId,targetId )

    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "Cô nß½ng"
	else
		PlayerSex = "Thiªu hi®p"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"#{FBYQ_090204_01}")
		for i, eventId in x000034_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	 AddText(sceneId,"#Y Chú Ý: Ðiêu Vån ám khí trß¾c khi thao tác t¦y ám khí, nªu không s¨ m¤t hªt skill và c¤p Ðµ ám khí quay v« 1. L²i này s¨ code lÕi sau. ")
	 AddText(sceneId,"#G Mu¯n thång c¤p Bang phách lên sí linh vui lòng Ðiêu Vån th¬ lñc 10 cho bång phách ")
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_05}",6,7)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_06}",6,8)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_01}",6,9)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_07}",6,10)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090311_01}",6,11)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_08}",6,31)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_09}",11,28)
		AddNumText(sceneId,x000034_g_ScriptId,"#GThång C¤p Kim Sí Linh Vû",6,500)
		AddNumText(sceneId,x000034_g_ScriptId,"#GTh±i Ðµc Kim Sí Linh Vû",6,501)
		AddNumText(sceneId,x000034_g_ScriptId,"#cFF0000Luy®n Ðµc Kim Sí Linh Vû",6,502)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x000034_OnDefaultEvent( sceneId, selfId,targetId )
	x000034_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x000034_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000034_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	local NumText = GetNumText();
	if NumText ==500 then  --
		
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 10 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
		return
	end	
	if NumText ==501 then  --½ø½×
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 12 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
			return
	end	
	if NumText ==502 then  --½ø½×
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 13 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
		return
	end	
	
	
	if NumText == 6 then  --È¡ÏûÁË
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 7 then  --Í»ÆÆ°µÆ÷Æ¿¾±
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_10}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_11}",6,12)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --Ñ§Ï°°µÆ÷ÊÖ·¨
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_20}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_21}",6,14)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_22}",6,15)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_23}",6,16)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 9 then   --ÖØÏ´°µÆ÷ÊôÐÔ
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_32}",6,21)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_33}",6,22)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_34}",6,23)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_35}",6,24)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_36}",6,25)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 10 then  --ÖØÏ´°µÆ÷¼¼ÄÜ
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 6 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 11 then  --ÖØÖÃ°µÆ÷
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 12 then                   --ÎÒÒªÍ»ÆÆµ±Ç°Æ¿¾±
		if (x000034_CheckDarkReachPoint(sceneId, selfId, targetId) == 1) then
			BeginEvent(sceneId)
				local nDarkLevel = GetDarkLevel(sceneId, selfId);
				local nNeedMoney = x000034_g_DarkBreachPointNeedMoney[nDarkLevel];
				if (nNeedMoney == nil or nNeedMoney <= 0) then
					nNeedMoney = 100000;         --ÒÔ·ÀÍòÒ»£¬²¢Ã»Ê²Ã´ÓÃ
				end
				local strInfo = format("  ðµ phá cänh gi¾i c¥n #{_EXCHG%d}¡£", nNeedMoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,20)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	elseif NumText == 13 then
		x000034_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		
			BeginEvent(sceneId)
				local strInfo = format("  h?c t?p %s th? pháp c?n#{_EXCHG%d}¡£", x000034_g_DarkSkillName[40].name, x000034_g_DarkSkillName[40].needmoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,17)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 15 then
			BeginEvent(sceneId)
				local strInfo = format("  h?c t?p %s th? pháp c?n{_EXCHG%d}¡£", x000034_g_DarkSkillName[70].name, x000034_g_DarkSkillName[70].needmoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,18)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 16 then
			BeginEvent(sceneId)
				local strInfo = format("  h?c t?p %s th? pháp c?n#{_EXCHG%d}¡£", x000034_g_DarkSkillName[90].name, x000034_g_DarkSkillName[90].needmoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,19)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 17 then
		if x000034_CheckStudyDarkSkills(sceneId, selfId, targetId, 40) == 1 then
			x000034_StudyDarkSkills(sceneId, selfId, targetId, 40);
		end
	elseif NumText == 18 then
		if x000034_CheckStudyDarkSkills(sceneId, selfId, targetId, 70) == 1 then
			x000034_StudyDarkSkills(sceneId, selfId, targetId, 70);
		end
	elseif NumText == 19 then
		if x000034_CheckStudyDarkSkills(sceneId, selfId, targetId, 90) == 1 then
			x000034_StudyDarkSkills(sceneId, selfId, targetId, 90);
		end
	elseif NumText == 20 then
		x000034_BreachDarkPoint(sceneId, selfId, targetId);
	elseif NumText == 21 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 1 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 22 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 2 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 23 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 3 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 24 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 4 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 25 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 5 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 26 then
	 	BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 7 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 27 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 8 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 28 then

		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_69}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090304_01}",11,30)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 29 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_03}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 30 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_04}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 31 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 9 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x000034_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x000034_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			x000034_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x000034_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x000034_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x000034_OnDie( sceneId, selfId, killerId )
end




--**********************************
--ÅÐ¶ÏÊÇ·ñÄÜ¹»Ñ§Ï°
--nSkillIndex²ÎÊý¿ÉÄÜÖµÎª£º40£¬70£¬90£¬·Ö±ðÑ§Ï°¶ÔÓ¦¼¶±ðµÄ¼¼ÄÜ
--**********************************
function x000034_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return 0;
	end
	
	--ÅÐ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñ¹»ÁË
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË¶ÔÓ¦¼¼ÄÜ
	if  (HaveSkill(sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ÅÐ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñÓÐ×ã¹»µÄÇ®
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x000034_g_DarkSkillName[nSkillIndex].needmoney) then    --10½ð
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--Íæ¼ÒÕÒNPCÑ§Ï°°µÆ÷Ê¹ÓÃ¼¼ÄÜ
--nSkillIndex²ÎÊý¿ÉÄÜÖµÎª£º40£¬70£¬90£¬·Ö±ðÑ§Ï°¶ÔÓ¦¼¶±ðµÄ¼¼ÄÜ
--**********************************
function x000034_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return
	end
	
	--ÅÐ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñ¹»ÁË
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË¶ÔÓ¦¼¼ÄÜ
	if  (HaveSkill(sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ÅÐ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñÓÐ×ã¹»µÄÇ®
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x000034_g_DarkSkillName[nSkillIndex].needmoney) then    --10½ð
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--ÉÏÃæÅÐ¶Ï¶¼Í¨¹ý£¬¿ÉÒÔ¿ÛÇ®¸ø¼¼ÄÜÁË
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].id)
	x000034_ShowNotice(sceneId, selfId, targetId, x000034_g_DarkSkillTips[nSkillIndex]);
	x000034_NotifyTips( sceneId, selfId, x000034_g_DarkSkillTips[nSkillIndex] )
	
	x000034_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --ÈÃ¼¼ÄÜ°´Å¥ÉÁË¸
	
end


--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x000034_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--Íæ¼ÒÊÇ·ñÂú×ã°µÆ÷Æ¿¾±Ìõ¼þ
--·µ»ØÖµ£º0»òÕß1£¬1ÎªÂú×ã£¬0
--**********************************
function x000034_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--ÅÐ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñ×°±¸ÓÐ°µÆ÷
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--ÅÐ¶ÏÍæ¼ÒÉíÉÏ°µÆ÷ÊÇ·ñ´ïµ½Æ¿¾±
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--ÅÐ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñºÍ°µÆ÷µÈ¼¶ÏàµÈ»òÕßÃ»ÓÐ°µÆ÷µÈ¼¶¸ß
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--ÅÐ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñÓÐ×ã¹»µÄÇ®
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x000034_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --ÒÔ·ÀÍòÒ»£¬²¢Ã»Ê²Ã´ÓÃ
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10½ð
			strNotice = "#{FBSJ_081209_25}";
			x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x000034_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--ÅÐ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñ×°±¸ÓÐ°µÆ÷
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--ÅÐ¶ÏÍæ¼ÒÉíÉÏ°µÆ÷ÊÇ·ñ´ïµ½Æ¿¾±
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--ÅÐ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñºÍ°µÆ÷µÈ¼¶ÏàµÈ»òÕßÃ»ÓÐ°µÆ÷µÈ¼¶¸ß
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--ÅÐ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñÓÐ×ã¹»µÄÇ®
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x000034_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --ÒÔ·ÀÍòÒ»£¬²¢Ã»Ê²Ã´ÓÃ
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10½ð
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ÉÏÃæÅÐ¶Ï¶¼Í¨¹ý£¬¿ÉÒÔ¿ÛÇ®Í»ÆÆÁË
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--Í»ÆÆÆ¿¾±£¬ÈÃ°µÆ÷Éý¼¶
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x000034_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--Í»ÆÆ³É¹¦£¬¼ÇÂ¼Í³¼ÆÈÕÖ¾
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x000034_ShowNotice(sceneId, selfId, targetId, "ðµt phá th¤t bÕi");
	end
	
	return
end

function x000034_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000034_StudySkillImpact(sceneId, playerId)
	--ÏÔÊ¾Ñ§Ï°µ½ÐÂ¼¼ÄÜµÄÌØÐ§ Ä¿Ç°Ê¹ÓÃÉý¼¶ÌØÐ§
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end



function x000034_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

	
function x000034_AN_qilb( sceneId, selfId,arg1,arg2)
	if not arg1 or not arg2 then 
		return
	end	
	--¼ì²é
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) <4 or LuaFnGetMaterialBagSpace( sceneId, selfId ) <4 then 
	x000034_NotifyTips( sceneId, selfId, "Xin chu¦n b¸ Nguyên li®u và ô ðÕo cø ch×a tr¯ng 4 ch² !" )	
		return
	end	
    local sunm = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1)	
	if arg2 == 63 then --½ø½×
			if sunm ~=10155020  then 
			x000034_NotifyTips( sceneId, selfId, "Chï có th¬ bö vào Bång Phách Th¥n Châm ðã Ðiêu Vån C¤p 10" )	
			return
		     end	
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < 4000000) then    --10½ð
		x000034_NotifyTips(sceneId, selfId, "Các hÕ không ðü 400 vàng");
		return 
	end
       LuaFnCostMoneyWithPriority(sceneId, selfId, 4000000);
	    local pos1 =	TryRecieveItem( sceneId, selfId, 10155021, 1)
		CallScriptFunction( 895111, "SHANG_BAOS", sceneId, selfId ,arg1,pos1)
		LuaFnEraseItem( sceneId, selfId,  arg1)
		local nam = GetName(sceneId,selfId)
		BroadMsgByChatPipe(sceneId, selfId, "#H Chúc m×ng ngß¶i ch½i #Y["..nam.."] #cff99ccthång c¤p #cFF0000Bång phách Th¥n Châm(Ðiêu Vån 10) #cff99cclên #cFF0000Kim Si Linh #cff99ccthành công! ", 4)

		x000034_NotifyTips( sceneId, selfId, "chúc m×ng các hÕ nâng c¤p thành công")
     end
	
      if sunm >=10155100 and  sunm <=10155138 then 
		if mod(sunm,10)==9 then 
		x000034_NotifyTips( sceneId, selfId, "Xin chú ý c¤p b§c ðã ðÕt t¾i cao nh¤t!")	
			return
		end
		if  LuaFnGetAvailableItemCount(sceneId, selfId, 38000448) < 50 then 
	x000034_NotifyTips( sceneId, selfId, "Th§t xin l²i, các hÕ không ðü 50 cái [Ngû Ðµc Châu]")	
		return
	end	
	LuaFnDelAvailableItem(sceneId,selfId,38000448,50)	
      local pos1 =	TryRecieveItem( sceneId, selfId,sunm+1, 1)	
			CallScriptFunction( 895111, "SHANG_BAOS", sceneId, selfId ,arg1,pos1)
			LuaFnEraseItem( sceneId, selfId,  arg1)		
     x000034_NotifyTips( sceneId, selfId, "Nâng c¤p thành công")
   end


	if sunm == 10155021  then   --Ñ¡Ôñ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < 1000000) then    --10½ð
		x000034_NotifyTips(sceneId, selfId, "Không ðü 100 vàng");
		return 
	end
   LuaFnCostMoneyWithPriority(sceneId, selfId, 1000000);

	if sunm == 10155021 and arg2 ==0 then 
	local pos1 =TryRecieveItem( sceneId, selfId, 10155100, 1)
	CallScriptFunction( 895111, "SHANG_BAOS", sceneId, selfId ,arg1,pos1)
	LuaFnEraseItem( sceneId, selfId,  arg1)	
	x000034_NotifyTips( sceneId, selfId, "thành công")
	elseif sunm == 10155021 and arg2 ==1 then 
	local pos1 =TryRecieveItem( sceneId, selfId, 10155110, 1)
		CallScriptFunction( 895111, "SHANG_BAOS", sceneId, selfId ,arg1,pos1)
		LuaFnEraseItem( sceneId, selfId,  arg1)	
	x000034_NotifyTips( sceneId, selfId, "thành công")
	elseif sunm == 10155021 and arg2 ==2 then 
	local pos1 =TryRecieveItem( sceneId, selfId, 10155120, 1)
		CallScriptFunction( 895111, "SHANG_BAOS", sceneId, selfId ,arg1,pos1)
		LuaFnEraseItem( sceneId, selfId,  arg1)	
	x000034_NotifyTips( sceneId, selfId, "thành công")
	elseif sunm == 10155021 and arg2 ==3 then 
	local pos1 =TryRecieveItem( sceneId, selfId, 10155130, 1)
		CallScriptFunction( 895111, "SHANG_BAOS", sceneId, selfId ,arg1,pos1)
		LuaFnEraseItem( sceneId, selfId,  arg1)	
	x000034_NotifyTips( sceneId, selfId, "thành công")
	end	
	
	end	
	
	
end	