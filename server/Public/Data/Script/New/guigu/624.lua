--Dçn Trùng Thu§t KÛ nång Thång c¤p 

--K¸ch bän g¯c Hào 
x760624_g_ScriptId = 760624

--ThØ npcCó th¬ Lên t¾i Cüa T¯i cao c¤p b§c 
x760624_g_nMaxLevel = 100

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760624_OnDefaultEvent(sceneId, selfId, targetId)
	--Ngß¶i ch½i KÛ nång Cüa C¤p b§c 
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YINCHONGSHU)
	--Ngß¶i ch½i Dçn Trùng Thu§t KÛ nång Cüa Thu¥n thøc ðµ 
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YINCHONGSHU)
	--Nhi®m vø Phán ðoán 

	--Phán ðoán Hay không là Tinh Túc Phái Ð® tØ,Không phäi Tinh Túc Ð® tØ Không th¬ H÷c t§p 
		if GetMenPai(sceneId,selfId) ~= 9 then
			BeginEvent(sceneId)
    		AddText(sceneId,"Ngß½i Không phäi B±n phái Ð® tØ ,Ngã Không th¬ Giáo Ngß½i .");
    	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Nªu Còn không có H÷c ðßþc Cai Sinh hoÕt KÛ nång 
	if AbilityLevel <1	then
		BeginEvent(sceneId)
			strText ="Ngß½i Còn không có H÷c ðßþc Thông Cäm KÛ nång !!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Nªu Sinh hoÕt KÛ nång C¤p b§c Ðã Vßþt qua Cai npcCó khä nång Giáo Cüa PhÕm vi 
	if AbilityLevel>= x760624_g_nMaxLevel then
		BeginEvent(sceneId)
			--[QUFEI 2007-07-17 15:30 SØa chæa]
			strText ="Cai Sinh hoÕt KÛ nång Ðã Thång Chí Cao c¤p nh¤t ,không th¬ Tiªp tøc Thång c¤p"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x760624_g_ScriptId, ABILITY_YINCHONGSHU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x760624_g_ScriptId;
		local tempAbilityId = ABILITY_YINCHONGSHU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,tempScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760624_OnEnumerate(sceneId, selfId, targetId)
		--Nªu Không ðªn C¤p b§c T¡c Không hi®n KÏ Tuy¬n HÕng 
		if 1 then
			AddNumText(sceneId,x760624_g_ScriptId,"Thång c¤p Thông Cäm KÛ nång", 12, 1)
		end
		return
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760624_CheckAccept(sceneId, selfId)
end

--**********************************
--Tiªp thu 
--**********************************
function x760624_OnAccept(sceneId, selfId, ABILITY_YINCHONGSHU)
end
