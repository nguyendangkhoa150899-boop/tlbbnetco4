-- NetCo4 07/10: Lua AI cua DOI BOT 6 "nguoi gia" o Hau Hoa Vien (scene 62/82/182). Script 950002, gan qua script_id trong
-- Public/Scene/newbie_2_monster.ini; base_ai 21 (co Lua ext) -> engine goi OnInit / OnHeartBeat / OnEnterCombat / OnLeaveCombat / OnDie.
-- Danh dam, goi dong bon, hoi mau ban than: file .ai 346-349. File nay chi lo viec AI thuong KHONG lam duoc:
--   Nga My (64601) moi nhip tim dong doi (quai ID trong x950002_g_Bot) mau thap nhat -> cast Thanh Tam Pho Thien Chu (SkillData 2008, bac 12)
--   len dong doi do; >= 2 dong doi duoi nguong nhom -> Phat Quang Pho Chieu (1792, hoi nhom 7m) len ban than.
-- Khung copy tu event/bingshen/ai_hadaba.lua (boss Bang Than). Toan ASCII. Sinh bang tools/botdoi-07-10.js (bang, ini, .ai).
-- Chua kiem trong game: quai cast chieu "than thien" len quai khac co an khong. Neu khong: bat x950002_g_DungImpact = 1
-- (hoi bang hieu ung truc tiep, khong co hoat anh chieu) sau khi co ID impact hoi mau phu hop.

x950002_g_ScriptId = 950002

x950002_g_Bot = { 64601, 64602, 64603, 64604, 64605, 64606 }
x950002_g_SoBot = 6
x950002_g_NgaMy = 64601

x950002_g_HoiDon = 2008        -- Thanh Tam Pho Thien Chu bac 12: hoi % mau 1 muc tieu, tam 15m
x950002_g_HoiNhom = 1792       -- Phat Quang Pho Chieu bac 12: hoi nhom quanh minh 7m
x950002_g_NguongDon = 0.65     -- dong doi duoi 65% mau -> hoi don
x950002_g_NguongNhom = 0.5     -- >= 2 dong doi duoi 50% -> hoi nhom
x950002_g_CD_Hoi = 3000        -- ms giua 2 lan hoi
x950002_g_CD_Nghi = 1000       -- ms quet lai khi khong ai can hoi
x950002_g_DungImpact = 0       -- 1 = hoi bang LuaFnSendSpecificImpactToUnit(x950002_g_ImpactHoi) thay vi cast chieu
x950002_g_ImpactHoi = -1

-- o nho cua MonsterAI (int): 1 = CD hoi mau con lai (ms)
x950002_IDX_CD = 1

function x950002_LaBot( dataId )
	local i
	for i = 1, x950002_g_SoBot do
		if x950002_g_Bot[i] == dataId then
			return 1
		end
	end
	return 0
end

function x950002_OnInit( sceneId, selfId )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x950002_IDX_CD, 0 )
end

function x950002_OnEnterCombat( sceneId, selfId, enemyId )
end

function x950002_OnLeaveCombat( sceneId, selfId )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x950002_IDX_CD, 0 )
end

function x950002_OnKillCharacter( sceneId, selfId, targetId )
end

function x950002_OnDie( sceneId, selfId, killerId )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x950002_IDX_CD, 0 )
end

-- tim dong doi (bot khac, con song) mau thap nhat; tra ve objId, ti le mau, so dong doi duoi nguong nhom
function x950002_TimYeuNhat( sceneId, selfId )
	local best = -1
	local bestP = 2
	local soYeu = 0
	local n = GetMonsterCount( sceneId )
	local i
	for i = 0, n - 1 do
		local id = GetMonsterObjID( sceneId, i )
		if id ~= -1 and x950002_LaBot( GetMonsterDataID( sceneId, id ) ) == 1 and LuaFnIsCharacterLiving( sceneId, id ) == 1 then
			local mx = GetMaxHp( sceneId, id )
			if mx > 0 then
				local p = GetHp( sceneId, id ) / mx
				if p < bestP then
					bestP = p
					best = id
				end
				if p < x950002_g_NguongNhom then
					soYeu = soYeu + 1
				end
			end
		end
	end
	return best, bestP, soYeu
end

function x950002_OnHeartBeat( sceneId, selfId, nTick )
	if LuaFnIsCharacterLiving( sceneId, selfId ) ~= 1 then
		return
	end
	if GetMonsterDataID( sceneId, selfId ) ~= x950002_g_NgaMy then
		return
	end
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x950002_IDX_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x950002_IDX_CD, cd - nTick )
		return
	end
	local best, bestP, soYeu = x950002_TimYeuNhat( sceneId, selfId )
	if best == -1 or bestP >= x950002_g_NguongDon then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x950002_IDX_CD, x950002_g_CD_Nghi )
		return
	end
	local x, z = GetWorldPos( sceneId, selfId )
	if x950002_g_DungImpact == 1 and x950002_g_ImpactHoi > 0 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, best, x950002_g_ImpactHoi, 0 )
	elseif soYeu >= 2 then
		LuaFnUnitUseSkill( sceneId, selfId, x950002_g_HoiNhom, selfId, x, z, 0, 1 )
	else
		LuaFnUnitUseSkill( sceneId, selfId, x950002_g_HoiDon, best, x, z, 0, 1 )
	end
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x950002_IDX_CD, x950002_g_CD_Hoi )
end
