--QuÖ C¯c Sinh hoÕt KÛ nång Thång c¤p 

--K¸ch bän g¯c Hào 
x760318_g_ScriptId = 760318

--ThØ npcCó th¬ Lên t¾i Cüa T¯i cao c¤p b§c 
x760318_g_nMaxLevel = 10

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯ 
--**********************************
function x760318_OnDefaultEvent(sceneId, selfId, targetId)
	--Ngß¶i ch½i KÛ nång Cüa C¤p b§c 
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIDU)
	--Ngß¶i ch½i Luy®n ðan KÛ nång Cüa Thu¥n thøc ðµ 
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIDU)
	--Nhi®m vø Phán ðoán 

	--Phán ðoán Hay không là Võ ðß½ng phái Ð® tØ,Không phäi Võ ðß½ng ð® tØ Không th¬ H÷c t§p 
		if GetMenPai(sceneId,selfId) ~= MP_GUIGU then
			BeginEvent(sceneId)
    		AddText(sceneId,"Ngß½i Không phäi B±n phái Ð® tØ ,Ngã Không th¬ Giáo Ngß½i .");
    	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Nªu Còn không có H÷c ðßþc Cai Sinh hoÕt KÛ nång 
	if AbilityLevel <1	then
		BeginEvent(sceneId)
			strText ="Ngß½i Còn không có H÷c ðßþc QuÖ C¯c Bùa chú KÛ nång !"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Nªu Sinh hoÕt KÛ nång C¤p b§c Ðã Vßþt qua Cai npcCó khä nång Giáo Cüa PhÕm vi 
	if AbilityLevel>= x760318_g_nMaxLevel then
		BeginEvent(sceneId)
			strText ="Ta chï Có th¬ giáo Ngß½i 1-10C¤p Cüa QuÖ C¯c Bùa chú KÛ nång,Thïnh ðªn Bang phái trung H÷c t§p Càng cao c¤p Cüa QuÖ C¯c Bùa chú."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x760318_g_ScriptId, ABILITY_ZHIDU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x760318_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--Li®t kê Sñ ki®n 
--**********************************
function x760318_OnEnumerate(sceneId, selfId, targetId)
		--Nªu Không ðªn C¤p b§c T¡c Không hi®n KÏ Tuy¬n HÕng 
		if 1 then
			AddNumText(sceneId,x760318_g_ScriptId,"Thång c¤p QuÖ C¯c Bùa chú KÛ nång", 12, 1)
		end
		return
end

--**********************************
--Ki¬m tra ðo lß¶ng Tiªp thu Ði«u ki®n 
--**********************************
function x760318_CheckAccept(sceneId, selfId)
end

--**********************************
--Tiªp thu 
--**********************************
function x760318_OnAccept(sceneId, selfId, ABILITY_ZHIDU)
end
