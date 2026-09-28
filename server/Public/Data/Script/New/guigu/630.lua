--K¸ch bän g¯c Hào 
x760630_g_ScriptId = 760630

--Nhi®m vø Hào 
x760630_g_MissionId = 15000

--Nhi®m vø Møc tiêu npc
x760630_g_TargetNpcName	="u nguy"

--Nhi®m vø Phân loÕi 
x760630_g_MissionKind = 3

--Nhi®m vø C¤p b§c 
x760630_g_MissionLevel = 1

--Hay không là Tinh anh Nhi®m vø 
x760630_g_IfMissionElite = 0

--Nhi®m vø HÕn Th¶i 
x760630_g_MissionLimitTime = 60 * 60 * 1000; --Hào Mi¬u 

--Phía dß¾i Kï HÕng Th¸ Ðµng thái Bi¬u hi®n Cüa Nµi dung ,Dùng cho TÕi Nhi®m vø Danh sách Trung Ðµng thái Bi¬u hi®n Nhi®m vø Tình hu¯ng **********************

--Tr· lên Th¸ Ðµng thái **************************************************************

--Nhi®m vø Vån bän Miêu tä 
x760630_g_MissionName="Du Thuy«n";
x760630_g_MissionInfo="BÕn chßa có bÕn gái, hãy dçn bÕn gái t¾i ðây và l§p thành 1 ðµi.";
x760630_g_MissionTarget="BÕn gái cüa bÕn chßa có ho£c chßa l§p ðµi có bÕn gái.";		--Nhi®m vø Møc tiêu 
x760630_g_ContinueInfo1="xin l²i thuy«n ðã ra kh½i..........";
x760630_g_ContinueInfo2="cäm ½n tôi chßa.";
x760630_g_MissionComplete="nhß¶ng chúng tôi ði.";

--Nhi®m vø Khen thß·ng 
x760630_g_MoneyBonus = 0

--MisDescEnd

x760630_g_eventId_begin = 0;	
x760630_g_eventId_start = 1;	
x760630_g_eventId_close = 2;	

x760630_g_busDataIds = {9};	
x760630_g_busPatrolPathId = 0;		


--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760630_OnDefaultEvent(sceneId, selfId, targetId)	
	local selectEventId	= GetNumText();
	
	if x760630_g_eventId_begin == selectEventId then
		x760630_OnBegin(sceneId, selfId, targetId);

	elseif x760630_g_eventId_start == selectEventId then
		x760630_OnStart(sceneId, selfId, targetId);

	elseif x760630_g_eventId_close == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end

end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760630_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x760630_g_ScriptId, x760630_g_MissionName, 6, x760630_g_eventId_begin);
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760630_CheckAccept(sceneId, selfId)
	return 1;
end

--**********************************
--Tiªp thu 
--**********************************
function x760630_OnAccept(sceneId, selfId, marryLevel)

	
	AddMission(sceneId, selfId, x760630_g_MissionId, x760630_g_ScriptId, 0, 0, 0);
	misIndex = GetMissionIndexByID(sceneId, selfId, x760630_g_MissionId);			
	if misIndex and misIndex>= 0 then
		StartMissionTimer(sceneId,selfId, x760630_g_MissionId);
		SetMissionByIndex(sceneId,selfId,misIndex, 0, 1);						
		SetMissionByIndex(sceneId,selfId,misIndex, 7, x760630_g_MissionLimitTime);
		SetMissionByIndex(sceneId,selfId,misIndex, 2, marryLevel);
		
		Msg2Player(sceneId, selfId,"#YNhi®m vø: "..x760630_g_MissionName.."",MSG2PLAYER_PARA);	
	end
end

--**********************************
--T× bö 
--**********************************
function x760630_OnAbandon(sceneId, selfId)
	
 	local checkMission = IsHaveMission(sceneId, selfId, x760630_g_MissionId);
	if checkMission and checkMission == 1 then
	DelMission(sceneId, selfId, x760630_g_MissionId);
	end
end

--**********************************
--Tiªp tøc 
--**********************************
function x760630_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--Ki¬m tra ðo lß¶ng Hay không có th¬ Ð® trình 
--**********************************
function x760630_CheckSubmit(sceneId, selfId)
	return 0;
end

--**********************************
--Ð® trình 
--**********************************
function x760630_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--Giªt chªt Quái v§t Ho£c Ngß¶i ch½i 
--**********************************
function x760630_OnKillObject(sceneId, selfId, objdataId,objId)
end

--**********************************
--Tiªn vào Khu vñc Sñ ki®n 
--**********************************
function x760630_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--ÐÕo cø Thay ð±i 
--**********************************
function x760630_OnItemChanged(sceneId, selfId, itemdataId)
end

--**********************************
--Ðúng gi¶ Sñ ki®n 
--**********************************
function x760630_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x760630_g_MissionId);
	if misIndex and misIndex>= 0 then
		local saveTime = GetMissionParam(sceneId, selfId, misIndex, 7);
		if saveTime and saveTime> 0 then
			saveTime = saveTime - 1000;
			if saveTime <= 0 then
				StopMissionTimer(sceneId, selfId, x760630_g_MissionId);
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 2);
				saveTime = 0;
			end
			SetMissionByIndex(sceneId, selfId, misIndex, 7, saveTime);
		end
	end
end

--**********************************
--Ði¬m ðánh Xe hoa Tu¥n du Nhi®m vø Sñ ki®n 
--**********************************
function x760630_OnBegin(sceneId, selfId, targetId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x760630_g_MissionId);
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x760630_MessageBox(sceneId, selfId, targetId,"BÕn ðã ði quá s¯ l¥n quy ð¸nh , mai lÕi ðªn nhé.");
			DelMission(sceneId, selfId, x760630_g_MissionId);
		else
			BeginEvent(sceneId);
				AddText(sceneId,"Thuy«n ðã chu¦n b¸ xong, hãy Du Thuy«n nào?");
				AddNumText(sceneId, x760630_g_ScriptId,"Du Thuy«n", 8, x760630_g_eventId_start);
				AddNumText(sceneId, x760630_g_ScriptId,"ta suy nghî ðã..........", 8, x760630_g_eventId_close);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end
	--end
end

--**********************************
--Ði¬m ðánh B¡t ð¥u Tu¥n du Sñ Ki®n 
--**********************************
function x760630_OnStart(sceneId, selfId, targetId)
	local marryLevel = 0;
	local misIndex = GetMissionIndexByID(sceneId,selfId,x760630_g_MissionId);
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x760630_MessageBox(sceneId, selfId, targetId,"BÕn ðã ði quá s¯ l¥n quy ð¸nh , mai lÕi ðªn nhé.");
			DelMission(sceneId, selfId, x760630_g_MissionId);
			return 0;
		else
			marryLevel = GetMissionParam(sceneId, selfId, misIndex, 2);
		end
		
	local szMsg ="Hãy rü bÕn gái ði cùng và l§p thành 1 ðµi nhé!."
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x760630_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	


	szMsg ="Chï dành cho c£p tình nhanh #G1 nam , #Y1 næ #Wm¾i có th¬ di.#r #c33ff99BÕn hãy tìm bÕn gái ði r°i quay lÕi ðây#W#r #cff6633l§p ðµi ta s¨ cho ði #3"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x760630_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg ="BÕn mu¯n ði duy thuy«n sao ? #r Hãy rü bÕn gái ði cûng và l§p thành ðµi nhé."
	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses> 0 then
	else
		x760630_MessageBox(sceneId, selfId, targetId, szMsg);
	end
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if LuaFnIsStalling(sceneId, memId) == 1 then
			x760630_MessageBox(sceneId, selfId, targetId,"#{CWHL_081208_1}")
			return 0;
		end
	end
	
	local busIndex = 1;
	if marryLevel and marryLevel> -1 and marryLevel <3 then
		busIndex = marryLevel + 1;
	else
		busIndex = 1;
	end
	
	local busObjID = LuaFnCreateBusByPatrolPathId(sceneId, x760630_g_busDataIds[busIndex], x760630_g_busPatrolPathId, 0);
	if busObjID and busObjID ~= -1 then
		local succeeded, strText;
		succeeded = 0;
		local addPassergerRet = LuaFnBusAddPassengerList(sceneId, busObjID, targetId, 1, 2, maleId, femaleId);
		if addPassergerRet and addPassergerRet == OR_OK then
			local busStartRet = LuaFnBusStart(sceneId, busObjID);
			if busStartRet and busStartRet == 1 then
				BeginUICommand(sceneId);
				EndUICommand(sceneId);
				DispatchUICommand(sceneId, selfId, 1000);
				DelMission(sceneId, selfId, x760630_g_MissionId);
				succeeded = 1;
			else
				strText ="L²i (start failed),Liên H® Nguy­n Vinh."
			end
		end
		
		if succeeded and succeeded == 1 then
		else
			LuaFnBusRemoveAllPassenger(sceneId, busObjID);
			LuaFnDeleteBus(sceneId, busObjID);
			if strText then
				x760630_MessageBox(sceneId, selfId, targetId, strText);
			end
		end
	end

end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760630_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

