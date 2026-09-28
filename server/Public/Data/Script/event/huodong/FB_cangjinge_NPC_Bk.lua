-- 807004

--************************************************************************
x807004_g_ScriptId = 807004

--************************************************************************


x807004_g_CopySceneName ="Tàng Kinh Các"

x807004_g_CopySceneType = FUBEN_PORTECT_PET 	--Phó bän LoÕi hình , Ð¸nh nghîa TÕi ScriptGlobal.luaBên trong 

x807004_g_CloseTime = 30*60  -----Phó bän T°n tÕi Th¶i gian 
x807004_g_XiaoGuaiCount = 13  -----Ti¬u quái Xoát Quái S¯ lßþng 
x807004_g_XiaoGuaiTime = 60  -----M²i Ba Ti¬u quái Cüa Cách xa nhau Th¶i gian 
x807004_g_CopySceneMap ="cangjing.nav"
x807004_g_Exit ="cangjing.ini"
x807004_g_LimitMembers = 1				--Có th¬ Tiªn Phó bän Cüa T¯i Ti¬u ðµi ngû Nhân s¯ 
x807004_g_TickTime = 1						--H°i Ði«u K¸ch bän g¯c Cüa Ð°ng h° Th¶i gian (Ð½n v¸: Mi¬u /ThÑ)
x807004_g_LimitTotalHoldTime = 360 --Phó B±n có th¬ T°n tÕi Th¶i gian (Ð½n v¸: S¯ l¥n),Nªu ThØ Ðã ðªn gi¶ , T¡c Nhi®m vø S¨ Th¤t bÕi 
x807004_g_LimitTimeSuccess = 500	--Phó bän Th¶i gian HÕn chª (Ð½n v¸: S¯ l¥n),Nªu ThØ Ðã ðªn gi¶ , Nhi®m vø Hoàn thành 
x807004_g_CloseTick = 3						--Phó bän Ðóng cØa Ti«n Ðªm ngßþc (Ð½n v¸: S¯ l¥n)
x807004_g_NoUserTime = 10				--Phó bän Trung Không có ngß¶i H§u Có th¬ Tiªp tøc Bäo t°n Cüa Th¶i gian (Ð½n v¸: Mi¬u)
x807004_g_DeadTrans = 0						--TØ vong D¶i ði Hình thÑc , 0: TØ vong H§u Còn có th¬ Tiªp tøc TÕi Phó bän , 1: TØ vong H§u B¸ CßÞng chª Di Xu¤t Phó bän 
x807004_g_Fuben_X = 64						--Tiªn vào Phó bän Cüa V¸ trí X
x807004_g_Fuben_Z = 103						--Tiªn vào Phó bän Cüa V¸ trí Z
x807004_g_Back_X = 264							--Nguyên Cänh tßþng V¸ trí X
x807004_g_Back_Z = 278							--Nguyên Cänh tßþng V¸ trí Z
x807004_g_Back_SceneId = 18			--Nguyên Cänh tßþng Id

-- Cänh tßþng Id
x807004_g_PetSceneId = 18

x807004_g_SetpTime = 1

x807004_g_SetpWaiteTime_1 = 15
x807004_g_SetpWaiteTime_2 = 25
x807004_g_SetpWaiteTime_3 = 35 
x807004_g_SetpWaiteTime_4 = 45
x807004_g_SetpWaiteTime_5 = 55
x807004_g_SetpWaiteTime_6 = 65
x807004_g_SetpWaiteTime_7 = 75
x807004_g_SetpWaiteTime_8 = 85 

------Vi Quan quân Tä 
x807004_g_MonsterInfo_1 = {id=13583,x=23,z=47,ai=9,ai_f=0,p=0}

--- Vi Quan quân Hæu 
x807004_g_MonsterInfo_2 = {id=13610,x=103,z=48,ai=9,ai_f=0, p=0}
						 
 ----ÐÕo Thß Ác Tång Tä 
x807004_g_MonsterInfo_3 = {id=13610,x=23,z=47,ai=9,ai_f=0, p=0}
						 
 ----ÐÕo Thß Ác Tång Hæu 
x807004_g_MonsterInfo_4 = {id=13610,x=103,z=48,ai=9,ai_f=0, p=0}
						 
 ----BOSS
x807004_g_MonsterInfo_5 = {id=13592,x=64,z=32,ai=9,ai_f=234, p=0}
						 
 



------------Thiªu Lâm Võ tång Cüa ID---------------
x807004_g_MonsterAI = { {id=13565,ai=226}, 
						{id=13566,ai=226},
						{id=13567,ai=226},
						{id=13568,ai=226},
						{id=13569,ai=226},
						{id=13570,ai=226},
						{id=13571,ai=226},
						{id=13572,ai=226},
						{id=13573,ai=226},
}
x807004_g_MonsterInfo_Count_1 = 10
x807004_g_MonsterInfo_Count_2 = 7
x807004_g_MonsterInfo_Count_3 = 8
x807004_g_MonsterInfo_Count_4 = 5
x807004_g_MonsterInfo_Count_5 = 5
x807004_g_MonsterInfo_Count_6 = 8
x807004_g_MonsterInfo_Count_7 = 20
--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x807004_OnDefaultEvent(sceneId, selfId, targetId)
 
	
	if GetNumText()==1010 then
		BeginEvent(sceneId)
				AddText(sceneId," B¥n tång G¥n ðây Thông qua Tính toán Hòa Tìm hi¬u Giang h° Tin tÑc , Hi¬u biªt Ðã có Mµt ðám Ác Tång Nhi«u l¥n Xâm nh§p Thiªu Lâm Mu¯n ðoÕt Thü Thiªu Lâm Võ h÷c Ði¬n t¸ch.Nhi Thiªu Lâm Vân du Võ tång Ða TÕi #GNhÕn Nam #WT§p kªt , Sau ðó Tr· v« chùa Vi®n trþ.M²i ngày #G10: 4516: 3021: 30Hòa 23: 00#WChính là chúng ta T§p kªt Cüa Th¶i gian.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	-- 0
	if LuaFnHasTeam(sceneId,selfId) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#BTàng Kinh Các");
			AddText(sceneId," Tiªn vào Phó B±n yêu c¥u Mµt chi Ðµi ngû.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 2,Ki¬m tra ðo lß¶ng Ðµi ngû Có phäi hay không Cú Nhân s¯ 
	if GetTeamSize(sceneId,selfId) <1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#BTàng Kinh Các");
			AddText(sceneId,"Tiªn vào Phó B±n yêu c¥u Mµt chi Ðµi ngû.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 3,Ki¬m tra ðo lß¶ng Ngß¶i ch½i Có phäi hay không Ðµi trß·ng 
	if GetTeamLeader(sceneId,selfId) ~= selfId  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BTàng Kinh Các");
			AddText(sceneId,"Tiªn vào Phó B±n yêu c¥u Mµt chi Ðµi ngû.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 4,Ki¬m tra ðo lß¶ng Có phäi hay không ngß¶i Ðô Ðúng ch² R°i 
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId) then
		BeginEvent(sceneId)
			AddText(sceneId,"#BTàng Kinh Các");
			AddText(sceneId,"Tiªn vào Phó B±n yêu c¥u Mµt chi Ðµi ngû.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 1,Ngß¶i ch½i C¤p b§c 
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local strName = {}
	strName[1] =""
	strName[2] =""
	strName[3] =""
	strName[4] =""
	strName[5] =""
	strName[6] =""
	local ret = 1
 	
	for i=0, nPlayerNum-1 do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if GetLevel(sceneId, nPlayerId) <40 then
			ret = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
	end
	
	local nCount = 0
	if ret == 0 then
		local szAllName =""
		for i=1, 6 do
			if strName[i] ~=""then
				if nCount == 0 then
					szAllName = strName[i]
				else
					szAllName = szAllName.."".. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#BTàng Kinh Các");
			AddText(sceneId,"Ngài Ðµi ngû trung Thành công Viên (".. szAllName..")C¤p b§c Th¤p h½n C¤p 40 , Không th¬ Tham gia Tàng Kinh Các.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	
		x807004_MakeCopyScene(sceneId, selfId, targetId)
		LuaFnDeleteMonster(sceneId, targetId)
	
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x807004_OnEnumerate(sceneId, selfId, targetId)
 
    AddText(sceneId," B¥n tång G¥n ðây Thông qua Tính toán Hòa Tìm hi¬u Giang h° Tin tÑc , Hi¬u biªt Ðã có Mµt ðám Ác Tång Nhi«u l¥n Xâm nh§p Thiªu Lâm Mu¯n ðoÕt Thü Thiªu Lâm Võ h÷c Ði¬n t¸ch.Nhi Thiªu Lâm Vân du Võ tång Ða TÕi #GNhÕn Nam #WT§p kªt , Sau ðó Tr· v« chùa Vi®n trþ.M²i ngày #G10: 4516: 3021: 30Hòa 23: 00#WChính là chúng ta T§p kªt Cüa Th¶i gian.");
	AddNumText(sceneId, x807004_g_ScriptId,"Tàng Kinh Các",10,-1)
	AddNumText(sceneId, x807004_g_ScriptId,"V« Tàng Kinh Các",11,1010)

end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x807004_CheckAccept(sceneId, selfId)
	
end

--**********************************
--Dò höi Ngß¶i ch½i Hay không Mu¯n ði vào Phó bän 
--**********************************
function x807004_AskEnterCopyScene(sceneId, selfId)
	
end

--**********************************
--Tiªp thu 
--**********************************
function x807004_OnAccept(sceneId, selfId, targetId)
	
end

--**********************************
--Ngß¶i ch½i Ð°ng ý Tiªn vào Phó bän 
--**********************************
function x807004_AcceptEnterCopyScene(sceneId, selfId)
	
end

--**********************************
--Sáng tÕo Phó bän 
--**********************************
function x807004_MakeCopyScene(sceneId, selfId, targetId)
	
	-- SØ døng Ðµi viên Cüa C¤p b§c T¾i tính Xu¤t Quái v§t Cüa C¤p b§c 
	local param0 = 4;
	local param1 = 3;

	--Cu¯i cùng kªt quä 
	local mylevel = 0;

	--Lâm th¶i Lßþng biªn ð±i 
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1 then --Không có Ðµi ngû 
		mylevel = GetLevel(sceneId, selfId)
	end
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId,"cangjing.nav"); --Bän ð° Th¸ C¥n thiªt Lña ch÷n sØ døng Cüa , H½n næa C¥n thiªt TÕi Config/SceneInfo.iniLí Ph¯i trí Häo 
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x807004_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x807004_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x807004_g_CopySceneType);--Thiªt trí Phó bän S¯ li®u , N½i này Tß½ng 0Hào Hß¾ng dçn tra cÑu Cüa S¯ li®u Thiªt trí Vi 999,Dùng cho Tö vë Phó bän Hào 999(Con s¯ Tñ Ð¸nh nghîa)
	LuaFnSetCopySceneData_Param(sceneId, 1, x807004_g_ScriptId);--Tß½ng 1S¯ thÑ tñ Cß Thiªt trí Vi Phó bän Cänh tßþng Sñ ki®n K¸ch bän g¯c Hào 
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--Thiªt trí Ðúng gi¶ Khí Thuyên chuy¬n S¯ l¥n 
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--Thiªt trí Phó bän Nh§p kh¦u Cänh tßþng Hào, M¾i b¡t ð¥u Hóa 
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--Thiªt trí Phó bän Ðóng cØa Tiêu chí, 0M· ra , 1Ðóng cØa 
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--Thiªt trí R¶i ði Ðªm ngßþc S¯ l¥n 
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --Bäo t°n Ðµi ngû Hào 
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--Giªt chªt BossCüa S¯ lßþng 
	
	-- C¯t truy®n Dùng ðªn Cüa Lßþng biªn ð±i Thanh không 
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel <10 then
		iniLevel = 1;
	elseif mylevel <PlayerMaxLevel then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = floor(PlayerMaxLevel/10);
	end
	
	-- SØ døng Ð® 8V¸ , Ký løc Quái v§t Thñc tª C¤p b§c 
	LuaFnSetCopySceneData_Param(sceneId,8, mylevel) ---Thñc tª C¤p b§c 
	LuaFnSetCopySceneData_Param(sceneId,9, iniLevel) ---Thü Chïnh C¤p b§c 
	
	LuaFnSetCopySceneData_Param(sceneId,10, GetMonsterDataID(sceneId, targetId))

	local x,z = GetWorldPos(sceneId,selfId)
	LuaFnSetCopySceneData_Param(sceneId,16, x)
	LuaFnSetCopySceneData_Param(sceneId,17, z)
	
	

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)

	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"Phó bän Sáng tÕo Thành công !")
		else
			AddText(sceneId,"Phó bän S¯ lßþng Ðã ÐÕt HÕn mÑc cao nh¤t , m¶i h½i H¥u ThØ lÕi !")
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--Phó bän Sñ ki®n 
--**********************************
function x807004_OnCopySceneReady(sceneId, destsceneId)
	
	--Tiªn vào Phó bän Cüa Quy t¡c 
	-- 1,Nªu  Cái này Vån ki®n Không có T± ðµi , Tñu Truy«n t¯ng  Cái này Ngß¶i ch½i Chính mình Tiªn vào Phó bän 
	-- 2, Nªu Ngß¶i ch½i Có Ðµi ngû , Nhßng là Ngß¶i ch½i Không phäi Ðµi trß·ng , Tñu Truy«n t¯ng Chính mình Tiªn vào Phó bän 
	-- 3,Nªu Ngß¶i ch½i Có Ðµi ngû , H½n næa  Cái này Ngß¶i ch½i Th¸ Ðµi trß·ng , Tñu Truy«n t¯ng Chính mình cùng Phø c§n Ðµi hæu Cùng nhau ði vào 

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --Thiªt trí Phó bän Nh§p kh¦u Cänh tßþng Hào 
	leaderguid = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic(sceneId, leaderObjId) ~= 1 then			-- — vào không th¬ Ch¤p hành Logic Cüa TrÕng thái 
		return
	end
	
	-- Ki¬m tra ðo lß¶ng Ngß¶i ch½i Có phäi hay không Có Ðµi ngû 
	if LuaFnHasTeam(sceneId, leaderObjId) == 0 then  -- Không có Ðµi ngû 
		x807004_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0 then
			x807004_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount(sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x807004_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x807004_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld(sceneId, ObjId, destsceneId, x807004_g_Fuben_X, x807004_g_Fuben_Z) ;
end


--**********************************
--Có Ngß¶i ch½i Tiªn vào Phó bän Sñ ki®n 
--**********************************
function x807004_OnPlayerEnter(sceneId, selfId)
	SetPlayerDefaultReliveInfo(sceneId, selfId,"%10", -1,"0", sceneId, x807004_g_Fuben_X, x807004_g_Fuben_Z)
	SetUnitCampID(sceneId, selfId, selfId, 100)
	x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Tß½ng Vu 15Giây sau B¡t ð¥u Tiªn công , Chú ý TÕi 20 Phút Ðßa b÷n h÷ Toàn bµ Kích th¯i !")
	---AddGlobalCountNews (sceneId,"Thiªt Thß Ác Tång Tß½ng Vu 15Giây sau B¡t ð¥u Tiªn công , Chú ý TÕi 20 Phút Ðßa b÷n h÷ Toàn bµ Kích th¯i !")	
end

--**********************************
--Có Ngß¶i ch½i TÕi Phó bän Trung TØ vong Sñ ki®n 
--**********************************
function x807004_OnHumanDie(sceneId, selfId, killerId)
	
end

--**********************************
--T× bö 
--**********************************
function x807004_OnAbandon(sceneId, selfId)
	
end

--**********************************
-- H°i thành , Chï có Thành th¸ Nhi®m vø Phó B±n có th¬ Thuyên chuy¬n ThØ Tiªp l¶i 
--**********************************
function x807004_BackToCity(sceneId, selfId)
	
end

--**********************************
--Tiªp tøc 
--**********************************
function x807004_OnContinue(sceneId, selfId, targetId)
	
end	

--**********************************
--Ki¬m tra ðo lß¶ng Hay không có th¬ Ð® trình 
--**********************************
function x807004_CheckSubmit(sceneId, selfId, selectRadioId)
	
end

--**********************************
--Ð® trình 
--**********************************
function x807004_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end

 
--**********************************
--Ð« kÏ S· hæu Phó bän Nµi Ngß¶i ch½i 
--**********************************
function x807004_TipAllHuman(sceneId, Str)
	-- ÐÕt ðßþc Cänh tßþng Bên trong Cüa M÷i ngß¶i 
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- Không có ngß¶i Cüa Cänh tßþng ,  Cái gì Ð«u không T¯ 
	if nHumanNum <1 then
		return
	end
	
	for i=0, nHumanNum-1 do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

--**********************************
--Giªt chªt Quái v§t Ho£c Ngß¶i ch½i 
--**********************************
function x807004_OnKillObject(sceneId, selfId, objdataId, objId)
	
end

--**********************************
--Tiªn vào Khu vñc Sñ ki®n 
--**********************************
function x807004_OnEnterZone(sceneId, selfId, zoneId)
	
end

--**********************************
--ÐÕo cø Thay ð±i 
--**********************************
function x807004_OnItemChanged(sceneId, selfId, itemdataId)
	
end

--**********************************
--Phó bän Cänh tßþng Ðúng gi¶ Khí Sñ ki®n 
--**********************************
function x807004_OnCopySceneTimer(sceneId, nowTime)
	
		
	--Phó bän Ð°ng h° Ðµc Thü C§p Thiªt trí 
	--L¤y ðßþc Ðã Ch¤p hành Cüa Ðúng gi¶ S¯ l¥n 
	local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2)
	TickCount = TickCount + 1
	--Thiªt trí Tân Ðúng gi¶ Khí Thuyên chuy¬n S¯ l¥n 
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount)
	--Phó bän Ðóng cØa Tiêu chí 
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4)
  local nLastTime = x807004_g_CloseTime
	
	-- Tính gi¶ Khí Chü yªu Yªu Dña theo Th¶i gian Lai An bài Xoát Quái 
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 11)
	local nCurTime = LuaFnGetCurrentTime()
	
		
	local shijianTime = LuaFnGetCopySceneData_Param(sceneId,13) ---Ký løc 
	
	local nPreTime_1 = LuaFnGetCopySceneData_Param(sceneId, 14)  
	
	local NndTime = LuaFnGetCopySceneData_Param(sceneId, 21)  -------Kªt thúc Th¶i gian Tiêu chí 
	local nBeginTimeFlag = LuaFnGetCopySceneData_Param(sceneId, 22) ----B¡t ð¥u khi Gian Tiêu chí 

	if TickCount == 1 then
		local nMonterLevel = LuaFnGetCopySceneData_Param(sceneId, 8)
		local nMonterIniID = LuaFnGetCopySceneData_Param(sceneId, 9)
		local nMonterID = LuaFnGetCopySceneData_Param(sceneId, 10)		
		local nAi = 0
		for i=1, 5 do
			if x807004_g_MonsterAI[i].id == nMonterID then
				nAi = x807004_g_MonsterAI[i].ai
			end
		end
		
		local nRetrievalMonterID = 0
		if nMonterIniID>= 11 then
		 nRetrievalMonterID = nMonterID + 8	
		else
		 nRetrievalMonterID = nMonterID + nMonterIniID - 3		
		end		
		local nNpcId = LuaFnCreateMonster(sceneId, nRetrievalMonterID,64, 105, 9, 226, -1)
		SetUnitCampID(sceneId, nNpcId, nNpcId, 100)
		SetCharacterTitle(sceneId, nNpcId,"Thiªu Lâm Cao tång")
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		local nStep = LuaFnGetCopySceneData_Param(sceneId, 12)					
		LuaFnSetCopySceneData_Param(sceneId, 15, nNpcId)
	end
	
	
 
	if TickCount == 10  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u L¥n ð¥u tiên Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng B¡t ð¥u Tiªp theo Tiªn công !")
		x807004_CreateNpcBOSS(sceneId,0)	
		x807004_CreateXiaoBOSS(sceneId,0)
	end
		
	if TickCount == x807004_g_XiaoGuaiTime*2  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Hæu Thßþng Giác B¡t ð¥u L¥n thÑ hai Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng B¡t ð¥u Tiªp theo Tiªn công !")
		x807004_CreateNpcBOSS(sceneId,1) 
		x807004_CreateXiaoBOSS(sceneId,1)
		
	end
 
	if TickCount == x807004_g_XiaoGuaiTime*3   then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u L¥n thÑ ba Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng B¡t ð¥u Tiªp theo Tiªn công !")
		x807004_CreateNpcBOSS(sceneId,0) 
		x807004_CreateXiaoBOSS(sceneId,0)
		
	end
		

	if TickCount == x807004_g_XiaoGuaiTime*4   then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Hæu Thßþng Giác B¡t ð¥u L¥n thÑ tß Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng B¡t ð¥u Tiªp theo Tiªn công !")
		x807004_CreateNpcBOSS(sceneId,1) 
		x807004_CreateXiaoBOSS(sceneId,1)
		
	end
	
	if TickCount == x807004_g_XiaoGuaiTime*5    then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u L¥n thÑ nåm Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng B¡t ð¥u Tiªp theo Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,0)
		x807004_CreateXiaoBOSS(sceneId,0)
		
	end
		

	if TickCount == x807004_g_XiaoGuaiTime*6 then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Hæu Thßþng Giác B¡t ð¥u L¥n thÑ sáu Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng B¡t ð¥u Tiªp theo Tiªn công !")
		x807004_CreateXiaoBOSS(sceneId,1) 
		x807004_CreateNpcBOSS(sceneId,1)
		
	end
	
	if TickCount == x807004_g_XiaoGuaiTime*7  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u ThÑ bäy thÑ Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng Tiªn hành H§u Mµt l¥n Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,0)
		x807004_CreateXiaoBOSS(sceneId,0)
		
	end
	if TickCount == x807004_g_XiaoGuaiTime*8  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Hæu Thßþng Giác B¡t ð¥u L¥n thÑ tám Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng Tiªn hành H§u Mµt l¥n Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,1)
		x807004_CreateXiaoBOSS(sceneId,1)
		
	end
	if TickCount == x807004_g_XiaoGuaiTime*9  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u ThÑ chín thÑ Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng Tiªn hành H§u Mµt l¥n Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,0)
		x807004_CreateXiaoBOSS(sceneId,0)
		
	end
	if TickCount == x807004_g_XiaoGuaiTime*10  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Hæu Thßþng Giác B¡t ð¥u Ð® th§p thÑ Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng Tiªn hành H§u Mµt l¥n Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,1)
		x807004_CreateXiaoBOSS(sceneId,1)
		
	end
	if TickCount == x807004_g_XiaoGuaiTime*11  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u Ð® th§p nh¤t ThÑ Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng Tiªn hành H§u Mµt l¥n Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,0)
		x807004_CreateXiaoBOSS(sceneId,0)
		
	end
	if TickCount == x807004_g_XiaoGuaiTime*12 then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Hæu Thßþng Giác B¡t ð¥u ThÑ mß¶i hai thÑ Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Thiªt Thß Ác Tång Tß½ng Tiªn hành H§u Mµt l¥n Tiªn công !")		
	 x807004_CreateNpcBOSS(sceneId,1)
		x807004_CreateXiaoBOSS(sceneId,1)
		
	end
	if TickCount == x807004_g_XiaoGuaiTime*13  then
		x807004_TipAllHuman(sceneId,"Thiªt Thß Ác Tång Ðem t× Tä Thßþng Giác B¡t ð¥u ThÑ mß¶i ba thÑ Công kích !")
		x807004_TipAllHuman(sceneId,"30Giây sau Ð¥u møc Che m£t Ác Tång S¡p xu¤t hi®n Hi®n !")		
	 x807004_CreateNpcBOSS(sceneId,0)
		x807004_CreateXiaoBOSS(sceneId,0)
	end
	
	if TickCount == (x807004_g_XiaoGuaiTime*13 + 30)  then		
		local Npc = x807004_g_MonsterInfo_5 		
		local nNpcId = x807004_CreateNpc(sceneId, Npc.id, Npc.x, Npc.z,	Npc.ai, Npc.ai_f, 807004)
		SetUnitCampID(sceneId, nNpcId, nNpcId, 101)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetCharacterTitle(sceneId, nNpcId,"Di®u thü không không")
		x807004_TipAllHuman(sceneId,"Ð¥u møc Che m£t Ác Tång Xu¤t hi®n !!")
		LuaFnSetCopySceneData_Param(sceneId, 13, nNpcId)
	end
	
	local bOk = 0	
	local nNpcId = LuaFnGetCopySceneData_Param(sceneId, 15)
	local nMonsterCount = GetMonsterCount(sceneId)
	for i=0, nMonsterCount-1  do
		 local nMontserid = GetMonsterObjID(sceneId, i)
			if nNpcId == nMontserid  then				
				bOk = 1
			end
			
	end
	
	if bOk == 0 then
		x807004_TipAllHuman(sceneId,"Bäo hµ Tång TØ vong , Khiêu chiªn Th¤t bÕi")		
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1 do
			local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			x807004_KickOut(sceneId, nPlayerId)
		end		
	end	
	
	if TickCount>= nLastTime - 20  then
		local nNpcId = LuaFnGetCopySceneData_Param(sceneId, 15)
		local bOk = 0
		local nMonsterCount = GetMonsterCount(sceneId)
		for i=0, nMonsterCount-1  do
			local nMontserid = GetMonsterObjID(sceneId, i)
			if nNpcId == nMontserid  then
				-- Hoàn thành 
				bOk = 1
			end
		end
		
		if bOk == 1 and NndTime ==0 then
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			if nHumanNum <1 then
				return
			end
			x807004_TipAllHuman(sceneId,"Tàng Kinh Các Khiêu chiªn Thành công !")	
			LuaFnSetCopySceneData_Param(sceneId, 21, 1) 		
			local nLeaderId = 0			
			for i=0, nHumanNum-1 do
				local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if GetTeamLeader(sceneId, nPlayerId) == nPlayerId then
					nLeaderId = nPlayerId
				end
			end
			if nLeaderId == 0 then
				return
			end
			
			local szLeaderName = GetName(sceneId, nLeaderId)
			local str = format("#GTrong tàng kinh các #P,#{_INFOUSR%s}#PDçn d¡t Chúng Giang h° Häo hán Th¤t bÕi R°i Ác Tång Ån trµm Thiªu Lâm Tuy®t kÛ Cüa Âm mßu , Tß½ng Ác Tång Trµm ðÕo Cüa Bí kíp Châu v« Hþp Ph¯.Th§t là Võ lâm Hào ki®t Cüa Ði¬n phÕm A !!",szLeaderName)
			BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
		end
	end
	
	if TickCount == nLastTime - 15 then
		x807004_TipAllHuman(sceneId,"Phø bän hi®n TÕi 15Giây sau Ðóng cØa.")
		
	end

	if TickCount == nLastTime - 10 then
		x807004_TipAllHuman(sceneId,"Phø bän hi®n TÕi 10Giây sau Ðóng cØa.")
		
	end
	
	-- Th¶i gian Kªt thúc , 
	if TickCount == nLastTime - 5 then
		x807004_TipAllHuman(sceneId,"Phø bän hi®n TÕi 5Giây sau Ðóng cØa.")
		
	end
	
	-- Th¶i gian Kªt thúc , 
	if TickCount == nLastTime then
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1 do
			local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			x807004_KickOut(sceneId, nPlayerId)
		end
	end
	
end


function x807004_OnDie(sceneId, objId, killerId)
   
	   LuaFnSetCopySceneData_Param(sceneId, 2, (x807004_g_CloseTime - 20)) 
			

end


function x807004_KickOut(sceneId, objId)
  local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3)	--L¤y ðßþc Phó bän Nh§p kh¦u Cänh tßþng Hào 
	local x = LuaFnGetCopySceneData_Param(sceneId, 16) --Tiªn vào Th¶i Cüa T÷a ðµ X
	local z = LuaFnGetCopySceneData_Param(sceneId, 17) --Tiªn vào Th¶i Cüa T÷a ðµ Z
	
	if LuaFnIsObjValid(sceneId, objId) == 1 then
	 NewWorld(sceneId, objId, oldsceneId, x, z)
	end
	
end

function x807004_CreateNpcBOSS(sceneId,fangxiang)
    local Npc = x807004_g_MonsterInfo_1  ---Tä 
		if fangxiang ==1 then 
			Npc = x807004_g_MonsterInfo_2  ---Tä 
	 end
		
		
		for i=1, x807004_g_XiaoGuaiCount do
		   local nNpcId = x807004_CreateNpc(sceneId, Npc.id, Npc.x, Npc.z,	Npc.ai, Npc.ai_f, -1)
				if nNpcId> 0 then
				SetUnitCampID(sceneId, nNpcId, nNpcId, 101)
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				SetPatrolId(sceneId, nNpcId, Npc.p)	
			 end	
	 end
end

function x807004_CreateXiaoBOSS(sceneId,fangxiang)
	 if fangxiang ==0 then
		local nMonsterIda = LuaFnCreateMonster(sceneId, 13610, 23, 47, 9, -1, -1)
		SetUnitCampID(sceneId, nMonsterIda, nMonsterIda, 101)
		SetMonsterFightWithNpcFlag(sceneId, nMonsterIda, 1)
		SetPatrolId(sceneId, nMonsterIda, 0)
	 else
		local nMonsterIdb = LuaFnCreateMonster(sceneId, 13610, 103, 48, 9, -1, -1)
		SetUnitCampID(sceneId, nMonsterIdb, nMonsterIdb, 101)
		SetMonsterFightWithNpcFlag(sceneId, nMonsterIdb, 1)
		SetPatrolId(sceneId, nMonsterIdb, 1)
	 end	

end

--**********************************
-- Thông døng Sáng tÕo Quái v§t Hàm s¯ 
--**********************************
function x807004_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script)
	local PlayerLevel = LuaFnGetCopySceneData_Param(sceneId, 8)
	local ModifyLevel = LuaFnGetCopySceneData_Param(sceneId, 9)
	local nNpcId = 0	
	if ModifyLevel>= 11 then
	 nNpcId = NpcId + 8 
	else
	 nNpcId = NpcId + ModifyLevel-3
	end	
	
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel)
	return nMonsterId
end

 
