-- 登录处理
--〖触发时机〗	玩家登录游戏后触发此脚本
--〖触发源〗		.\Scene.lua: OnScenePlayerLogin

--脚本号
x888890_g_ScriptId	= 888890

--**********************************
--脚本入口函数
--**********************************
function x888890_OnDefaultEvent( sceneId, selfId )

	--整理配方
	x888890_AdjustPrescription( sceneId, selfId )
	
	--检查帐号是否安全
	CheckAccountSafe( sceneId, selfId );
	x888890_TamPhap8( sceneId, selfId )   -- [NetCo4 05/10] tam phap thu 8 mac dinh cap 119
	
	--其它操作

end

--**********************************
--整理配方
--**********************************
--删除已经废弃的配方，添加没有自动添加的配方
function x888890_AdjustPrescription( sceneId, selfId )

	--需要删除的配方
	local	preOld	= { 166, 167, 168, 169, 170, 171, 172, 173, 174, 175,
										176, 177, 178, 179, 180, 181, 182, 183, 184, 185,
										186, 187, 188, 189, 190, 191, 192, 193, 194, 195,
										196, 197, 198, 199, 200, 201, 202, 203, 204, 205,
										206, 207, 208, 209, 210, 211, 212, 213, 214, 215,
										216, 217, 218, 219, 220, 221, 222, 223, 224, 225,
										226, 227, 228, 229, 230, 231, 232, 233 }
	--需要添加的配方
	local	preNew	= { 558, 559, 560 }
	
	local	id
	--Del
	for _, id in preOld do
		if IsPrescrLearned( sceneId, selfId, id ) == 1 then
			SetPrescription( sceneId, selfId, id, 0 )
		end
	end
	--Add
	for _, id in preNew do
		if IsPrescrLearned( sceneId, selfId, id ) == 0 then
			SetPrescription( sceneId, selfId, id, 1 )
		end
	end

end

--**********************************
--封无限技能
--**********************************
function x888890_OnImpactFadeOut( sceneId, selfId, impactId )
        local missid = GetMissionData(sceneId, selfId, SKILL_CHECK)
        if missid ~= 1 then
                local killerName = GetName(sceneId, selfId);
                str        = format( "#P警告，#W#{_INFOUSR%s}使用外挂，已被系统永久封角色，请大家健康游戏，不要动歪脑筋，一经发现，永久封号、封ip。", killerName )
                AddGlobalCountNews( sceneId, str )
                SetMissionData(sceneId, selfId, SKILL_CHECK, 0)
                LuaFnGmKillObj( sceneId, selfId, selfId )  --原地自杀
                SetMissionData(sceneId, selfId,0)   --降为0级
                --NewWorld(sceneId,selfId,77,20,38) --先不开启送监狱
                else
                SetMissionData(sceneId, selfId, SKILL_CHECK, 0)
        end
end

--**********************************
-- [NetCo4 05/10] Chu server: tam phap thu 8 (Dien Bi) cua moi mon phai mac dinh cap 119.
-- Nhan vat da vao phai, cap >= 80 (dieu kien hoc cua sach): thap hon 119 thi nang len, khong ha neu da cao hon.
--**********************************
x888890_g_TamPhap8 = { [0] = 72, [1] = 73, [2] = 74, [3] = 75, [4] = 76, [5] = 77, [6] = 78, [7] = 79, [8] = 80, [10] = 71, [11] = 88, [12] = 96 }
x888890_g_TamPhap8Cap = 119
function x888890_TamPhap8( sceneId, selfId )
	local id = x888890_g_TamPhap8[ GetMenPai( sceneId, selfId ) ]
	if not id then
		return
	end
	if GetLevel( sceneId, selfId ) < 80 then
		return
	end
	if HaveXinFa( sceneId, selfId, id ) < x888890_g_TamPhap8Cap then
		LuaFnSetXinFaLevel( sceneId, selfId, id, x888890_g_TamPhap8Cap )
	end
end
