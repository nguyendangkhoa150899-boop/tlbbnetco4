--缥缈峰本....
--哈大霸对话脚本....

--脚本号
x391211_g_ScriptId = 391211

--副本逻辑脚本号....
x391211_g_FuBenScriptId = 391200

--**********************************
--任务入口函数....
--**********************************
function x391211_OnDefaultEvent( sceneId, selfId, targetId )
		local axiao = CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId )
	BeginEvent(sceneId)
		if axiao == 0 then
		AddText(sceneId,"      Ch\223 v\184 h\228o h\225n, xin gi\250p ta ng\229n qu\226n Li\234u t\224n s\225t, \240\215ng \240\172 th\234m sinh linh \240\176 th\225n!") -- [NetCo4 02/10] chu GBK -> Viet
		    AddNumText( sceneId, x391211_g_ScriptId, "Ng\229n ch\163n \240\213i qu\226n Li\234u qu\175c", 10, 1 ) -- [NetCo4 02/10] chu GBK -> Viet
	elseif axiao == 1 then
		AddText(sceneId,"      Gia Lu\167t T\226n v\245 c\244ng \226m \240\181c, bi\170t thi tri\172n Kh\175n Th\250 T\249 Lung, H\224n Mai Bi\170n D\227... Ch\223 v\184 anh h\249ng h\227y c\166n th\167n \209ng ph\243!") -- [NetCo4 02/10] chu GBK -> Viet
		    AddNumText( sceneId, x391211_g_ScriptId, "Ti\234u di\174t Gia Lu\167t T\226n", 10, 2 ) -- [NetCo4 02/10] chu GBK -> Viet
	elseif axiao == 2 then
		AddText(sceneId,"      Gia Lu\167t Uy\172n b\229ng c\244ng l\254i h\213i, c\243 th\172 g\247i H\224n B\229ng Chi Linh, thi tri\172n B\229ng Tuy\170t Li\234n Thi\234n. Ch\223 v\184 anh h\249ng h\227y c\166n th\167n \209ng ph\243!") -- [NetCo4 02/10] chu GBK -> Viet
		    AddNumText( sceneId, x391211_g_ScriptId, "Ti\234u di\174t Gia Lu\167t Uy\172n", 10, 3 ) -- [NetCo4 02/10] chu GBK -> Viet
	elseif axiao == 3 then
		AddText(sceneId,"      Gia Lu\167t Nguy\234n m\181t th\226n h\246a c\244ng c\225i th\170, gi\225ng Thi\234n Ph\213t, d\231n \208\184a H\246a Ph\165n Thi\234n. Ch\223 v\184 anh h\249ng h\227y c\166n th\167n \209ng ph\243!") -- [NetCo4 02/10] chu GBK -> Viet
		    AddNumText( sceneId, x391211_g_ScriptId, "Ti\234u di\174t Gia Lu\167t Nguy\234n", 10, 4 ) -- [NetCo4 02/10] chu GBK -> Viet
	elseif axiao == 4 then
		AddText(sceneId,"      Gia Lu\167t H\176ng C\189 tuy \240\227 c\161t \225o \240o\213n ngh\238a v\190i ta, nh\223ng ta kh\244ng n\222 t\241 tay b\161t h\161n. Ch\223 v\184 h\228o h\225n c\209 ti\170n l\234n ph\237a tr\223\190c l\224 t\190i \240\213i doanh c\252a h\161n, v\245 c\244ng h\161n v\175n t\165m th\223\182ng!") -- [NetCo4 02/10] chu GBK -> Viet
		    AddNumText( sceneId, x391211_g_ScriptId, "Ti\234u di\174t Gia Lu\167t H\176ng C\189", 10, 5 ) -- [NetCo4 02/10] chu GBK -> Viet
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x391211_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x391211_g_FuBenScriptId, "IBQZSTimerRunning", sceneId ) then
		return
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果正在和别的BOSS战斗则返回....
	local ret, msg = CallScriptFunction( x391211_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--判断当前是否可以挑战boss....	
      if GetNumText() == 1 then
	if 0 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "\196i n\224y c\225c h\213 \240\227 khi\234u chi\170n r\176i." ) -- [NetCo4 02/10] chu GBK -> Viet
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end
      if GetNumText() == 2 then
	if 1 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "\196i n\224y c\225c h\213 \240\227 khi\234u chi\170n r\176i." ) -- [NetCo4 02/10] chu GBK -> Viet
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end

      if GetNumText() == 3 then
	if 2 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "\196i n\224y c\225c h\213 \240\227 khi\234u chi\170n r\176i." ) -- [NetCo4 02/10] chu GBK -> Viet
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end

      if GetNumText() == 4 then
	if 3 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "\196i n\224y c\225c h\213 \240\227 khi\234u chi\170n r\176i." ) -- [NetCo4 02/10] chu GBK -> Viet
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end
      if GetNumText() == 5 then
	if 4 ~= CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "XiaoYiFeng" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "\196i n\224y c\225c h\213 \240\227 khi\234u chi\170n r\176i." ) -- [NetCo4 02/10] chu GBK -> Viet
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	CallScriptFunction( x391211_g_FuBenScriptId, "OpenBQZTimer", sceneId, 7, x391211_g_ScriptId, -1 ,-1 )
	end


	--开启缥缈峰计时器来激活自己....

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x391211_OnBQZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi\170n \240\164u b\161t \240\165u sau 5 gi\226y" ) -- [NetCo4 02/10] chu GBK -> Viet
		return
	end

	if 6 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi\170n \240\164u b\161t \240\165u sau 4 gi\226y" ) -- [NetCo4 02/10] chu GBK -> Viet
		return
	end

	if 5 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi\170n \240\164u b\161t \240\165u sau 3 gi\226y" ) -- [NetCo4 02/10] chu GBK -> Viet
		return
	end

	if 4 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi\170n \240\164u b\161t \240\165u sau 2 gi\226y" ) -- [NetCo4 02/10] chu GBK -> Viet
		return
	end

	if 3 == step then
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi\170n \240\164u b\161t \240\165u sau 1 gi\226y" ) -- [NetCo4 02/10] chu GBK -> Viet
		return
	end

	if 2 == step then
		--提示战斗开始....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId)  == "Ti\234u Phong" then -- [NetCo4 02/10] so ten GBK "Xiao Feng" khong bao gio khop -> ten VISCII cua 45410/45430 (don Tieu Phong truoc tran)
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end
		CallScriptFunction( x391211_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi\170n \240\164u b\161t \240\165u!" ) -- [NetCo4 02/10] chu GBK -> Viet
		--删除NPC....
		return
	end

	if 1 == step then
		--建立BOSS....
		local axiao = CallScriptFunction( x391211_g_FuBenScriptId, "GetBossBattleFlag", sceneId )
	if axiao == 0 then
		x391211_axiao0( sceneId )
		x391211_axiao1( sceneId )
		x391211_axiao2( sceneId )
		x391211_axiao3( sceneId )
	elseif axiao == 1 then
		x391211_axiao4( sceneId )
		x391211_axiao5( sceneId )
	elseif axiao == 2 then
		x391211_axiao4( sceneId )
		x391211_axiao6( sceneId )
	elseif axiao == 3 then
		x391211_axiao7( sceneId )
		x391211_axiao8( sceneId )
	elseif axiao == 4 then
		x391211_axiao9( sceneId )
	end
		return
	end

end
function x391211_axiao0( sceneId )
		local nMonsterIdA = LuaFnCreateMonster(sceneId, 45410, 125, 243, 0, 320, -1 )
		SetPatrolId( sceneId, nMonsterIdA, 0 )
end
function x391211_axiao1( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45411, 81, 126, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId20, 1 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45411, 82, 128, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId19, 1 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45411, 84, 131, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId18, 1 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45411, 85, 134, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId17, 1 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45411, 87, 137, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId16, 1 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45411, 89, 142, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId15, 1 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45411, 89, 145, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId14, 1 )

		local nMonsterId13 = LuaFnCreateMonster(sceneId, 45411, 89, 148, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId13, 1 )
end
function x391211_axiao2( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45412, 172, 143, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId20, 2 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45412, 172, 148, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId19, 2 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45412, 168, 150, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId18, 2 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45412, 166, 154, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId17, 2 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45412, 162, 157, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId16, 2 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45412, 160, 160, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId15, 2 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45412, 158, 163, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId14, 2 )

		local nMonsterId13 = LuaFnCreateMonster(sceneId, 45412, 156, 166, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId13, 2 )
end
function x391211_axiao3( sceneId )
		local nMonsterId20 = LuaFnCreateMonster(sceneId, 45413, 127, 131, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId20, 3 )

		local nMonsterId19 = LuaFnCreateMonster(sceneId, 45413, 126, 133, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId19, 3 )

		local nMonsterId18 = LuaFnCreateMonster(sceneId, 45413, 125, 142, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId18, 3 )

		local nMonsterId17 = LuaFnCreateMonster(sceneId, 45413, 126, 148, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId17, 3 )

		local nMonsterId16 = LuaFnCreateMonster(sceneId, 45413, 126, 154, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId16, 3 )

		local nMonsterId15 = LuaFnCreateMonster(sceneId, 45413, 127, 162, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId15, 3 )

		local nMonsterId14 = LuaFnCreateMonster(sceneId, 45413, 127, 164, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId14, 3 )

		local nMonsterId13 = LuaFnCreateMonster(sceneId, 45413, 127, 166, 0, 0, -1 )
		SetPatrolId( sceneId, nMonsterId13, 3 )

		local nMonsterId12 = LuaFnCreateMonster(sceneId, 45413, 125, 60, 0, 0, 391216 )
		SetPatrolId( sceneId, nMonsterId12, 3 )
end
function x391211_axiao4( sceneId )
		LuaFnCreateMonster(sceneId, 45410, 125, 184, 0, 320, -1 )
end
function x391211_axiao5( sceneId )
		local nMonsterIdB = LuaFnCreateMonster(sceneId, 45414, 89, 144, 0, 316, 391215 )
		SetPatrolId( sceneId, nMonsterIdB, 1 )
end
function x391211_axiao6( sceneId )
		local nMonsterIdB = LuaFnCreateMonster(sceneId, 45415, 167, 151, 0, 317, 391214 )
		SetPatrolId( sceneId, nMonsterIdB, 2 )
end
function x391211_axiao7( sceneId )
		local nMonsterIdA = LuaFnCreateMonster(sceneId, 45410, 125, 184, 0, 320, -1 )
		SetPatrolId( sceneId, nMonsterIdA, 4 )
end
function x391211_axiao8( sceneId )
		LuaFnCreateMonster(sceneId, 45416, 126, 114, 0, 318, 391213 )
end
function x391211_axiao9( sceneId )
		LuaFnCreateMonster(sceneId, 45417, 123, 51, 27, 0, 391212 )
end
