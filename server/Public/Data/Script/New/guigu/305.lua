--ÐÕi lý NPC
--Thôi Phùng CØu 
--Bình thß¶ng 

x760305_g_ScriptId	= 760305

--Môn phái Tin tÑc (Môn phái Tên ,SceneID,PosX,PosY,Môn phái ID)
x760305_g_mpInfo		= {}
x760305_g_mpInfo[0]	= {"Tinh Túc", 16, 96, 152, MP_XINGSU }
x760305_g_mpInfo[1]	= {"Tiêu Dao", 14, 67, 145, MP_XIAOYAO }
x760305_g_mpInfo[2]	= {"Thiªu Lâm", 9, 96, 127, MP_SHAOLIN }
x760305_g_mpInfo[3]	= {"Thiên S½n", 17, 95, 120, MP_TIANSHAN }
x760305_g_mpInfo[4]	= {"Thiên Long", 13, 96, 120, MP_DALI }
x760305_g_mpInfo[5]	= {"Nga Mi", 15, 89, 139, MP_EMEI }
x760305_g_mpInfo[6]	= {"Võ Ðang", 12, 103, 140, MP_WUDANG }
x760305_g_mpInfo[7]	= {"Minh Giáo", 11, 98, 167, MP_MINGJIAO }
x760305_g_mpInfo[8]	= {"Cái Bang", 10, 91, 116, MP_GAIBANG }

x760305_g_Yinpiao = 40002000

x760305_g_Impact_NotTransportList = { 5929, 5944 } -- C¤m Truy«n t¯ng Cüa Impact
x760305_g_TalkInfo_NotTransportList = {"#{GodFire_Info_062}","#{XSHCD_20080418_099}"} -- C¤m Truy«n t¯ng Cüa ImpactÐ« kÏ Tin tÑc 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760305_OnDefaultEvent(sceneId, selfId, targetId)

	-- Ki¬m tra ðo lß¶ng Ngß¶i ch½i Trên ngß¶i Có phäi hay không Có "Ngân phiªu "ThÑ này ,Có Li«n không th¬ SØ døng N½i này Công nång 
	if GetItemCount(sceneId, selfId, x760305_g_Yinpiao)>=1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Trên ngß¶i cüa ngß½i Có Ngân phiªu ,Ðang · Bào Thß½ng !Ngã Không th¬ giúp Trþ Ngß½i .")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	local	mp
	local	i		= 0
	BeginEvent(sceneId)
		if GetLevel(sceneId, selfId)>= 1 then
			AddText(sceneId,"#{WHOATN_12103121_01}")
			--AddNumText(sceneId, x760305_g_ScriptId,"Phän h°i Môn phái", 9, 1000)
			AddNumText(sceneId, x760305_g_ScriptId,"Truy«n t¯ng Chí Tr§n Linh thÕch #GThiên", 9, 1001)
			AddNumText(sceneId, x760305_g_ScriptId,"Truy«n t¯ng Chí Tr§n Linh thÕch #GÐ¸a", 9, 1002)
		else
			AddText(sceneId,"Ngß½i Yêu c¥u C¤p b§c T¾i 10C¤p Tr· lên ,M¾i có th¬ ði Khác Thành th¸ .")
			AddNumText(sceneId, x760305_g_ScriptId,"Thành th¸ - ÐÕi lý", 9, 1003)
			AddNumText(sceneId, x760305_g_ScriptId,"Thành th¸ - ÐÕi lý 2", 9, 1004)
			AddNumText(sceneId, x760305_g_ScriptId,"Thành th¸ - ÐÕi lý 3", 9, 1005)
		end
		
		
		
		-- Ngã Nhß thª nào M¾i có th¬ ði Ðôn Hoàng Hòa Tung S½n 
		--AddNumText(sceneId, x760305_g_ScriptId,"Ngã Nhß thª nào M¾i có th¬ ði Ðôn Hoàng Hòa Tung S½n", 11, 2000)
		
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--Truy«n t¯ng Ki¬m tra ,Giäi quyªt C¤p th¤p Ngß¶i ch½i Ðái ÐÆng c¤p cao Ngß¶i ch½i Ðªn ðÕi Lý 2,3Cüa V¤n ð« 
--**********************************
function x760305_EnterConditionCheck(sceneId, selfId)
	local teamSize = GetNearTeamCount(sceneId, selfId); 
	if teamSize> 1 then
		for i=0, teamSize-1 do
		local objId = GetNearTeamMember(sceneId, selfId, i);
		if GetLevel(sceneId, objId)> 9 and IsTeamFollow(sceneId, objId) == 1 then
			local name = GetName(sceneId, objId);
			local msg = format("Ðµi viên %sC¤p b§c Quá Cao ,Không th¬ tiªn vào !", name);
			return 0, msg;
		end 	
	end
 end
	return 1,"ok";
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760305_OnEventRequest(sceneId, selfId, targetId, eventId)
	--Ðµi ngû Tß½ng quan 
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount(sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021)> 0 then
				x760305_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðµi ngû Thành viên trung Có ngß¶i Có ThuÖ v§n \Khoang chÑa hàng Trong ngß¶i ,Chúng ta D¸ch TrÕm không th¬ Vì ngß½i Cung c¤p Truy«n t¯ng Phøc vø .")
				return
			end
		end
	end

	--ThuÖ v§n Tß½ng quan 
	if IsHaveMission(sceneId,selfId,4021)> 0 then
		x760305_MsgBox(sceneId, selfId, targetId,"Ngß½i Có ThuÖ v§n \Khoang chÑa hàng Trong ngß¶i ,Chúng ta D¸ch TrÕm không th¬ Vì ngß½i Cung c¤p Truy«n t¯ng Phøc vø .")
		return
	end
	
	--Ki¬m tra ðo lß¶ng ImpactTrÕng thái Trú lßu Hi®u quä 
	for i, ImpactId in x760305_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x760305_MsgBox(sceneId, selfId, targetId, x760305_g_TalkInfo_NotTransportList[i])			
			return 0
		end
	end
	
	--Thu§n lþi Truy«n t¯ng 
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai(sceneId, selfId)
	if arg == 1000 then		--Phän h°i Môn phái 
		if id <0 or id>= 9 then
			x760305_MsgBox(sceneId, selfId, targetId,"Ngß½i Hoàn Không có gia nh§p B¤t lu§n cái gì môn phái !")
		else
			mp	= x760305_GetMPInfo(id)
			if mp ~= nil then
				CallScriptFunction((400900),"TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10)
			end
		end
		return
	end
	if arg == 1001 then		--LÕc Dß½ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 197, 36, 43, 10)
		return
	end
	if arg == 1002 then		--Tô Châu 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 197, 95,144, 10)
		return
	end
	if arg == 1006 then		--LÕc Dß½ng Thß½ng hµi 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 0, 234, 132, 10)
		return
	end
	if arg == 1007 then		--Tô Châu Thþ rèn Phô 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 1, 235, 132, 10)
		return
	end
	if arg == 1003 then		--ÐÕi lý 1
		--Nªu Ngß¶i ch½i Li«n · ÐÕi lý 1T¡c B¤t truy«n T¯ng 
		if sceneId == 2 then
			x760305_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðã TÕi ÐÕi lý R°i .")
		else
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 241, 138)
		end
		return
	end
	if arg == 1004 then		--ÐÕi lý 2
		--Nªu Ngß¶i ch½i Li«n · ÐÕi lý 2T¡c B¤t truy«n T¯ng 
		if sceneId == 71 then
			x760305_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðã TÕi ÐÕi lý 2R°i .")
		else
			local ret, msg = x760305_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x760305_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 71, 241, 138)
		end
		return
	end
	if arg == 1005 then		--ÐÕi lý 3
		--Nªu Ngß¶i ch½i Li«n · ÐÕi lý 3T¡c B¤t truy«n T¯ng 
		if sceneId == 72 then
			x760305_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðã TÕi ÐÕi lý 3R°i .")
		else
			local ret, msg = x760305_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x760305_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 72, 241, 138)
		end
		return
	end
	for i, mp in x760305_g_mpInfo do
		if arg == i then
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10)
			return
		end
	end
	
	if arg == 1010 then		--Thúc Hà C± tr¤n 
		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x760305_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId,"GotoShuHeGuZhen");
			UICommand_AddString(sceneId,"Thúc Hà C± tr¤n Vi B¤t Gia Sát khí Cänh tßþng ,M¶i chú ý An toàn .Ngß½i Xác nh§n Mu¯n ði vào MÕ ?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1011 then		--Lâu Lan 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 186, 288, 136, 75)
		return
	end
	


	if arg == 1012 then		
		BeginEvent(sceneId)
			for i, mp in x760305_g_mpInfo do
				AddNumText(sceneId, x760305_g_ScriptId,"Môn phái -"..mp[1], 9, i)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	
		return
	end


	if GetNumText() == 2000 then		--
		BeginEvent(sceneId)
			AddText(sceneId,"#{GOTO_DUNHUANF_SONGSHAN}") 
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		
		return
	end
	
end
-- add by zchw
function x760305_GotoShuHeGuZhen(sceneId, selfId, targetId)
	CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 420, 200, 211, 20);
	return
end
--**********************************
--Cån cÑ Môn phái IDThu hoÕch Môn phái Tin tÑc 
--**********************************
function x760305_GetMPInfo(mpID)
	local	mp
	local	i		= 0
	for i, mp in x760305_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760305_MsgBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
