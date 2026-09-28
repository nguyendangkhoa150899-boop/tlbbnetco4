-- ÓÂ´³º®ÓñËş
-- 212115

--MisDescBegin
--½Å±¾ºÅ
x212115_g_ScriptId = 212115

--ÈÎÎñºÅ
x212115_g_MissionId = 639
--Ç°ĞøÈÎÎñºÅ
x212115_g_PreMissionId = 638

--ÈÎÎñ¹éÀà
x212115_g_MissionKind = 40

--ÈÎÎñµÈ¼¶
x212115_g_MissionLevel = 98

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x212115_g_IfMissionElite = 0

--ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö**********************
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
x212115_g_IsMissionOkFail = 0		--±äÁ¿µÄµÚ0Î»

--ÒÔÉÏÊÇ¶¯Ì¬**************************************************************

--ÈÎÎñĞèÒªµÃµ½µÄÎïÆ·
--x212115_g_DemandItem={{id=40002112,num=1}}		--±äÁ¿µÚ1Î»

--ÈÎÎñÎÄ±¾ÃèÊö
x212115_g_MissionName="Dûng cäm xông vào Hàn Ng÷c Tháp"
x212115_g_MissionInfo="#{Mis_H_Miaojiang_1050003}"
x212115_g_MissionTarget="  Hµ t¯ng A Vû #{_INFOAIM182,264,29, A Vû} t¾i chân Hàn Ng÷c Tháp, tìm ngß¶i trông tháp A Hµi Nam #{_INFOAIM92,266,29, A Hµi Nam}. "
x212115_g_MissionComplete="  Không sao, ma lñc cüa Hàn Ng÷c Tháp vînh vi­n không nhß các ngß½i tß·ng. Hãy ği ği, lû phàm nhân. Các ngß½i không th¬ vào ğßşc Hàn Ng÷c Tháp. #r#r´, kë phàm nhân kia, vào b¢ng cách nào thª? Mau ra ngay"

--½±Àø
x212115_g_MoneyBonus=16000
x212115_g_Exp = 30000
--x212115_g_ItemBonus={{id=10122010,num=1}}

x212115_g_Custom	= { {id="Ğã hµ t¯ng A Vû",num=1} }

x212115_g_RadioItemBonus={{id=10413081 ,num=1},{id=10411086,num=1},{id=10412078,num=1}}

--MisDescEnd

-- ³¡¾°¼ÆÊ±Æ÷µÄIndex
x212115_g_ScneneTimerIndex = -1
x212115_g_Step = 0
x212115_g_StartTime = 0
x212115_g_PlayerNum = 0
x212115_g_PlayerId= {0,0,0,0,0,0}

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212115_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetName(sceneId, targetId) == "Linh h°n cüa A Vû"  then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,"Ta c¥n phäi nói chút gì");
			AddNumText(sceneId, x212115_g_ScriptId, x212115_g_MissionName, 2, 999);
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId)
		return
	end
	
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x212115_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212115_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212115_g_Name then
			--·¢ËÍ½»ÈÎÎñÇ°µÄĞèÇóĞÅÏ¢
			BeginEvent(sceneId)
				AddText(sceneId,x212115_g_MissionName);
			EndEvent(sceneId)
    		done = x212115_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId,done)
--		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212115_CheckAccept( sceneId, selfId ) then
	
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent(sceneId)
			AddText(sceneId,x212115_g_MissionName);
			AddText(sceneId,x212115_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212115_g_MissionTarget);
			AddMoneyBonus( sceneId, x212115_g_MoneyBonus )
			for i, item in x212115_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId)

	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212115_OnEventRequest( sceneId, selfId, targetId )
	
	if GetNumText() == 999 then
		-- ¿ªÊ¼»¤ËÍµÄÇëÇó
		x212115_g_Step = 3
	end
	
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212115_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x212115_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212115_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == "A Hµi Nam"  then
			AddNumText(sceneId, x212115_g_ScriptId,x212115_g_MissionName, 2, -1)
		end

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x212115_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212115_g_MissionName then
			AddNumText(sceneId, x212115_g_ScriptId, x212115_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--¼ì²â´¥·¢Ìõ¼ş
--**********************************
function x212115_CheckAccept( sceneId, selfId )
	--ĞèÒª60¼¶²ÅÄÜ½Ó
	if GetLevel( sceneId, selfId ) < x212115_g_MissionLevel then
		return 0
	end
	
	-- Ç°ĞøÈÎÎñ
	if IsMissionHaveDone( sceneId, selfId, x212115_g_PreMissionId ) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x212115_OnAccept( sceneId, selfId )

	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÒÑ¾­Íê³É¹ıÕâ¸öÈÎÎñ
	if IsMissionHaveDone(sceneId, selfId, x212115_g_MissionId) > 0   then
		return
	end
	
	if x212115_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end
	
	if x212115_g_Step > 1  then
		BeginEvent(sceneId)
			strText = "#YHi®n không th¬ nh§n nhi®m vø này"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
	-- Èç¹ûµ±Ç° 
	if x212115_g_Step == 0  then
		-- ¸øÍæ¼ÒÏÈ¼ÓÕâ¸öÈÎÎñ
		local ret = AddMission( sceneId,selfId, x212115_g_MissionId, x212115_g_ScriptId, 0, 0, 0 )
		-- ĞèÒª¿¼ÂÇÍæ¼ÒÊÇ²»ÊÇÄÜ¹»½ÓÊÜµ½Õâ¸öÈÎÎñ
		if ret <= 0      then
			Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
			return
		end
		-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
		Msg2Player(  sceneId, selfId,"#YTiªp nh§n nhi®m vø ".. x212115_g_MissionName, MSG2PLAYER_PARA )
	
		BeginEvent(sceneId)
			strText = "#YTiªp nh§n nhi®m vø ".. x212115_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		-- ¿ªÆô»¤ËÍ¾çÇé  213
		-- ¼ì²â³¡¾°ÖĞÊÇ²»ÊÇÓĞÕâ¸öÈËÎïÁË
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Linh h°n cüa A Vû"  then
				bHaveMonster = 1
			end
		end
		
		-- ÓĞÕâ¸öÈËÁË£¬²»ÄÜÔÚÏÖÔÚÈ¥´´½¨½Å±¾
		if bHaveMonster == 0   then
			local nNpcId = LuaFnCreateMonster(sceneId, 213, 185, 263, 6, 0, 212115)
			SetCharacterName(sceneId, nNpcId, "Linh h°n cüa A Vû")
			
			-- ÉèÖÃĞ¡Ê±Ê±¼äÊÇ10·ÖÖÓ
			SetCharacterDieTime(sceneId, nNpcId, 600000)
		end
		
		-- °ÑÕâ¸öÍæ¼Ò¼Óµ½»¤ËÍÍæ¼ÒÁĞ±íÖĞ
		x212115_g_PlayerNum = 1
		x212115_g_PlayerId[1] = selfId

		-- Æô¶¯Ò»¸ö³¡¾°¼ÆÊ±Æ÷
		x212115_g_ScneneTimerIndex = SetTimer(sceneId, selfId, 212115, "OnScneneTimer", 1)
		
		x212115_g_Step = 1
		
		--µ±Ç°Ê±¼ä
		x212115_g_StartTime = LuaFnGetCurrentTime()
	end
	
	-- ¼ÓÈëµ½Õâ¸ö»¤ËÍµÄÍæ¼Ò
	if x212115_g_Step == 2  then
		if x212115_g_PlayerNum > 5  then
			--ÈËÂúÁË
			return
		end
		
		-- ¸øÍæ¼ÒÏÈ¼ÓÕâ¸öÈÎÎñ
		local ret = AddMission( sceneId,selfId, x212115_g_MissionId, x212115_g_ScriptId, 0, 0, 0 )
		-- ĞèÒª¿¼ÂÇÍæ¼ÒÊÇ²»ÊÇÄÜ¹»½ÓÊÜµ½Õâ¸öÈÎÎñ
		if ret <= 0      then
			Msg2Player(  sceneId, selfId,"#YNh§t kı nhi®m vø cüa các hÕ ğã ğ¥y" , MSG2PLAYER_PARA )
			return
		end
		-- ÏûÏ¢Í¨Öª¿Í»§¶Ë
		Msg2Player(  sceneId, selfId,"#YTiªp nh§n#W ".. x212115_g_MissionName, MSG2PLAYER_PARA )
		
		x212115_g_PlayerNum = x212115_g_PlayerNum + 1
		x212115_g_PlayerId[x212115_g_PlayerNum] = selfId

		BeginEvent(sceneId)
			strText = "#YTiªp nh§n#W ".. x212115_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
end

--**********************************
--³¡¾°¼ÆÊ±Æ÷
--**********************************
function x212115_OnScneneTimer(sceneId, selfId)

	local bHavePlayer = 0
	if LuaFnIsCanDoScriptLogic(sceneId, selfId) == 0   then
		for i=1, x212115_g_PlayerNum  do
			if LuaFnIsCanDoScriptLogic(sceneId, x212115_g_PlayerId[i]) == 1   then
				bHavePlayer = 1
				selfId = x212115_g_PlayerId[i]
				break
			end
		end
		
		if bHavePlayer == 0    then
			-- ¼ÆÊ±Æ÷Í£Ö¹£¬Çå³ıËùÓĞµÄÈ«¾Ö±äÁ¿
			x212115_CloseTimer(sceneId, x212115_g_ScneneTimerIndex)
		end
	end	
	
	-- µÈ´ı5Ãë½øÈë2
	if x212115_g_Step == 1   then
		-- Í¨Öª×Ô¼º¶ÓÎéµÄÆäËûÍæ¼Ò½ÓÕâ¸öÈÎÎñ
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nAyuId = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "A Vû"  then
				nAyuId = nMonsterId
				bHaveMonster = 1
			end
		end

		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((212115), "OnDefaultEvent", sceneId, PlayerId, nAyuId )
			end
		end
		
		x212115_g_Step = 2
	end
	
	-- ¿ªÊ¼µÈ´ı±ğµÄÍæ¼ÒÀ´Ò»Æğ×öÕâ¸öÈÎÎñ
	if x212115_g_Step == 2   then
		if LuaFnGetCurrentTime() - x212115_g_StartTime >= 10   then
			x212115_g_Step = 3
		end
		
	end
	
	-- ÓĞÍæ¼Òµã»÷ÁË¿ªÊ¼»¤ËÍ
	if x212115_g_Step == 3   then

		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		local nAyuId = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Linh h°n cüa A Vû"  then
				bHaveMonster = 1
				nAyuId = nMonsterId
			end
		end
		
		if bHaveMonster == 1  then
			SetPatrolId(sceneId, nAyuId, 0)
			x212115_g_Step = 4
		end
		
	end
	
	-- »¤ËÍ¹ı³Ì
	if x212115_g_Step == 4   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		local nAyuId = 0
		for ii=0, nMonsterNum-1   do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Linh h°n cüa A Vû"  then
				bHaveMonster = 1
				nAyuId = nMonsterId
			end
		end
		
		if bHaveMonster == 0   then
			-- ¹Ø±Õ¼ÆÊ±Æ÷
			x212115_CloseTimer(sceneId, x212115_g_ScneneTimerIndex)
			return
		end
		
		-- ¼ì²âAyu ºÍÍæ¼ÒÖ®¼äµÄ¾àÀë
		local targetX, targetZ = GetWorldPos(sceneId, nAyuId)
		
		-- ¼ì²âÈç¹ûÍæ¼ÒµÄ¾àÀëÒÑ¾­Àë¿ªµÄ³¡¾°»òÕßÍæ¼Ò²»ÔÚ»¤ËÍ¶ÔÏó10Ã×ÄÚ£¬Õâ¸öÍæ¼ÒÊ§°Ü
		for i=1, x212115_g_PlayerNum  do
			if x212115_g_PlayerId[i] ~= 0  then
				if LuaFnIsCanDoScriptLogic(sceneId, x212115_g_PlayerId[i]) == 0   then
					-- ´ÓÁĞ±íÖĞÉ¾³ıÕâ¸öÍæ¼Ò
					x212115_g_PlayerId[i] = 0
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x212115_g_PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					
					if distance1 > 10    then
						--ÌáÊ¾Õâ¸öÍæ¼ÒÈÎÎñÊ§°Ü
						BeginEvent(sceneId)
							strText = "#YHµ t¯ng A Vû th¤t bÕi!"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x212115_g_PlayerId[i])
						
						x212115_g_PlayerId[i] = 0
					end
				end
			end
		end
		
		local x, z = GetLastPatrolPoint(sceneId, 0)
		local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
		
		-- µ½´ïÖÕµã
		if distance<=1  then

			for i=1, x212115_g_PlayerNum  do
				if x212115_g_PlayerId[i]~=0   then
					-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
					if IsHaveMission(sceneId,x212115_g_PlayerId[i],x212115_g_MissionId) > 0 then
						local misIndex = GetMissionIndexByID(sceneId, x212115_g_PlayerId[i], x212115_g_MissionId)
						SetMissionByIndex(sceneId,x212115_g_PlayerId[i],misIndex,0,1)
						SetMissionByIndex(sceneId,x212115_g_PlayerId[i],misIndex,1,1)
						
						BeginEvent(sceneId)
							strText = "#YHµ t¯ng A Vû: 1/1"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x212115_g_PlayerId[i])
					end
				end
			end
			-- É¾³ı°¢ÓêµÄÄ£ĞÍ
			LuaFnDeleteMonster(sceneId, nAyuId)
			x212115_g_Step = 5
			
			-- ¹Ø±Õ¼ÆÊ±Æ÷
			x212115_CloseTimer(sceneId, x212115_g_ScneneTimerIndex)
		end
	end
	
end

--**********************************
--¹Ø±Õ¼ÆÊ±Æ÷
--**********************************
function x212115_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x212115_g_ScneneTimerIndex = -1
	x212115_g_Step = 0
	x212115_g_StartTime = 0
	x212115_g_PlayerNum = 0
	x212115_g_PlayerId[1]= 0
	x212115_g_PlayerId[2]= 0
	x212115_g_PlayerId[3]= 0
	x212115_g_PlayerId[4]= 0
	x212115_g_PlayerId[5]= 0
	x212115_g_PlayerId[6]= 0
end


--**********************************
--·ÅÆú
--**********************************
function x212115_OnAbandon( sceneId, selfId )
	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x212115_g_MissionId )
end

--**********************************
--ÒÑ¾­½ÓÁËÈÎÎñÔÙ¸ø³öµÄÌáÊ¾
--**********************************
function x212115_OnContinue( sceneId, selfId, targetId )
	--Ìá½»ÈÎÎñÊ±µÄËµÃ÷ĞÅÏ¢
	BeginEvent(sceneId)
		AddText(sceneId,x212115_g_MissionName)
		AddText(sceneId,x212115_g_MissionComplete)
		AddMoneyBonus( sceneId, x212115_g_MoneyBonus )
		for i, item in x212115_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId)
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212115_CheckSubmit( sceneId, selfId )
	--¼ì²âÌõ¼şÊÇ¿´ÈÎÎñÖĞµÄ±ê¼ÇÊÇ²»ÊÇ±»¸ÄÎª1ÁË
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212115_g_MissionId)			--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0  then
		return 1
	end
	return 0
end

--**********************************
--Ìá½»£¨Íê³É£©
--**********************************
function x212115_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- °²È«ĞÔ¼ì²â
	-- 1¡¢¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞÕâ¸öÈÎÎñ
	if IsHaveMission(sceneId,selfId,x212115_g_MissionId) <= 0 then
		return
	end
	-- 2¡¢ÆäËû¼ì²â
	if x212115_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212115_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	--Ìí¼ÓÈÎÎñ½±Àø
	if ret > 0 then		
		AddExp(sceneId,selfId,x212115_g_Exp)
		AddMoney(sceneId,selfId,x212115_g_MoneyBonus );

		DelMission( sceneId, selfId, x212115_g_MissionId )
		MissionCom( sceneId, selfId, x212115_g_MissionId )
		AddItemListToHuman(sceneId,selfId)

	else
	--ÈÎÎñ½±ÀøÃ»ÓĞ¼Ó³É¹¦
		BeginEvent(sceneId)
			strText = "Không th¬ hoàn t¤t nhi®m vø"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212115_OnKillObject( sceneId, selfId, objdataId ,objId )
	
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212115_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212115_OnItemChanged( sceneId, selfId, itemdataId )
	
end

