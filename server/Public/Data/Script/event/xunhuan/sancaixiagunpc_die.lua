-- Èý²ÅÏÀ¹ÈNPCÍ¨ÓÃ 001130
--**********************************
-- ¾ý·îÌìQQ£º137094888Ô­´´£¬ÇëÎðÍâ´«
--**********************************
x001130_g_DemandKillGroup = { 4, 0, 1, 2, 3 }	-- 1 ~ 5 ºÅ¹ÖÎï¶ÔÓ¦µÄ GroupID ºÅ£¬Óë x001130_g_DemandKill Ò»Ò»¶ÔÓ¦
x001130_g_DemandKill = {  { id = 4060, num = 50 }, { id = 4070, num = 10 }, { id = 4100, num = 1 } ,{ id = 4120, num = 1 },{ id = 4130, num = 1 } }	-- 1 ~ 5 ºÅ£¬¹ÖÎïÐÅÏ¢
x001130_g_DogfaceGroup = 0					-- ÌÓÅÜÐ¡±øµÄ Group ID
x001130_g_LittleBossGroup = 2				-- Ð¡ Boss Group ID
x001130_g_ViceBossGroup = 1					-- ËÎ¾ü¸±¶¼Í³
x001130_g_BossGroup = 3						-- Boss Group ID
x001130_g_Token = 40004315					-- ÁîÅÆºÅ
x001130_g_MissionId = 1260					-- 1260 - 1269
x001130_g_BroadcastMsg = {
"#Y #{_BOSS45}#P ðã chªt! H¡n b¸ anh hùng cüa chúng ta #{_INFOUSR$N}#P hÕ gøc! Kë tiªp theo nµp mÕng s¨ là ai? #{_BOSS46}? Hay #{_BOSS47}? Ha ha!",
"#P Anh hùng cüa chúng ta #{_INFOUSR$N}#P mang v« tin m×ng t× #GT¯ng Liêu biên cänh#P: tên mã t£c #{_BOSS45}#P ðã b¸ hÕ gøc!",
"#P M÷i ngß¶i mau xem anh hùng cüa chúng ta! #{_INFOUSR$N}#P! Mµt huy«n thoÕi s¯ng, ðÕi hi®p trong ðÕi hi®p!"
}

x001130_g_Param_sceneid = 6					-- 6 ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x001130_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }
x001130_g_LittleBoss = { 4090, 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4098, 4099, 34090, 34091, 34092, 34093, 34094, 34095, 34096, 34097, 34098, 34099 }

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x001130_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x001130_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)
	CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20800034, 5 )  -- [NetCo4 01/10] Cuu Thien Ngoc Toai 5% (02/10: 40 -> 30 -> 20 -> 25 -> 30; 05/10 -> 5), NetCo4/roimap.lua
	CallScriptFunction( 950001, "RoiBoc", sceneId, selfId, killerId, 1, 2 )  -- [NetCo4 01/10 toi] Mien Bo 6 / Bi Ngan 6 2% boc 1 (05/10: 10 -> 2)
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end
	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎÞÐ§
		return
	end
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
	
	--È¡µÃÉ±ËÀ¹ÖÎïµÄGroupID
	local GroupID = GetMonsterGroupID( sceneId, selfId )
	local killedMonsterIndex, killedCount = 0, 0
	if LuaFnGetCopySceneData_Param( sceneId, 21  ) ==0 then
		
		for i = 1, getn( x001130_g_DemandKillGroup ) do
			if GroupID == x001130_g_DemandKillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- É±ËÀBossiµÄÊýÁ¿
				break
			end
		end
		
		if killedMonsterIndex == 0 then		 -- É±ËÀÁËÒ»¸ö²»Ïà¹Ø¹Ö
			return
		end
		if GroupID==0 and  killedCount==10   then  -----É±ÁËÊ®¸öÅÜµÄÂíÔô¹Ö£¬Ö±½ÓË¢Ð¡BOSS
			x001130_TipAllHuman( sceneId, "Ng\248y T\175ng Qu\226n \208\244 Th\175ng \240\227 xu\164t hi\174n......." )
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x001130_g_LittleBoss[bossGrade] then
				return
			end
			local bossId = LuaFnCreateMonster( sceneId, x001130_g_LittleBoss[bossGrade], 192, 59, 14, 125, 1130 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetMonsterGroupID( sceneId, bossId, 1 )
		end
		if x001130_g_BossGroup == GroupID then
			LuaFnSetCopySceneData_Param( sceneId, 21,1 )   -----ÉèÖÃµÚ¶þ¹Ø
			LuaFnSetCopySceneData_Param( sceneId, 2, 0 )
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- É±ËÀBoss1µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- É±ËÀBoss2µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- É±ËÀBoss3µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- É±ËÀBoss4µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- É±ËÀBoss5µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- ÊÇ·ñÉ±ËÀÐ¡ Boss
			LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- ÊÇ·ñÒÑ¾­ÓÐÐ¡¹ÖÌÓ×ß
			LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- ÊÇ·ñÒÑ¾­Ë¢³ö´ó Boss
			x001130_TipAllHuman( sceneId, "D\223 \208\181c \240\227 b\184 \240\225nh b\213i, 30 gi\226y sau s\168 v\224o \228i 2, h\227y ti\234u di\174t H\176ng H\249ng V\223\189ng!" )
			local BroadcastMsg = x001130_g_BroadcastMsg[ random( getn(x001130_g_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
		end
		
		local maxKilledCount = x001130_g_DemandKill[killedMonsterIndex].num
		--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
		local i, humanObjId, misIndex
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local strText = format( "\208\227 gi\170t %s: %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )
		for i = 0, num - 1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						-- ²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
				x001130_NotifyFailTips( sceneId, humanObjId, strText )
				Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x001130_g_MissionId )
				if killedMonsterIndex <=3 then 
				SetMissionByIndex( sceneId, humanObjId, misIndex, killedMonsterIndex, killedCount )	-- Ë¢ÐÂÉ±¹ÖÊýÁ¿
				end
				-- É±ËÀËùÓÐ¹ÖÃ»ÓÐ·Å×ßÒ»¸öÔòÔÚÖÐÑë´óÓªÇ°Ë¢³öboss[Óà¶¾],É±ËÀºó¸±±¾ÈÎÎñÍê³É¡£(Óà¶¾ÉíÉÏ±ØµôÈÎÎñµÀ¾ß¡±Óà¶¾µÄÁîÅÆ¡±)
			end
		end
		
		-- É±ËÀµØÍ¼ÖÐÑëµÄÐ¡boss[Î±×°µÄËÎ±ø¶¼Í³]5Ãëºó£¬ÔÚµØÍ¼ÏÂ·½Ë¢³ö10Ö»ÑØÂ·ÏßÌÓ´ÜµÄÐ¡¹Ö
		if x001130_g_LittleBossGroup == GroupID then									-- É±ËÀÁËÐ¡ Boss
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- ÊÇ·ñÉ±ËÀÐ¡ Boss
		end
		
		-- É±ËÀËùÓÐ¹ÖÃ»ÓÐ·Å×ßÒ»¸öÔòÔÚÖÐÑë´óÓªÇ°Ë¢³öboss[Óà¶¾]
		local bigBossFlag = 1
		for i = 1, 4 do
			if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x001130_g_DemandKill[i].num then
				bigBossFlag = 0
				break
			end
		end
		if bigBossFlag == 1 then
			if LuaFnGetCopySceneData_Param( sceneId, 15 ) > 0 then					-- ²»ÐèÒªÔÙË¢ Boss ÁË
				return
			end
			
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x001130_g_Boss[bossGrade] then
				return
			end
			
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			local bossId = LuaFnCreateMonster( sceneId, x001130_g_Boss[bossGrade], 195, 48, 14, 126, 1130 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetCharacterTitle(sceneId, bossId, "Bi\234n C\228nh \208\213i V\223\189ng")
			SetMonsterGroupID( sceneId, bossId, x001130_g_BossGroup )
			LuaFnSetCopySceneData_Param( sceneId, 15, 1 )
			x001130_TipAllHuman( sceneId, "D\223 \208\181c \240\227 xu\164t hi\174n tr\223\190c \240\213i tr\223\190ng!" )
		end
		
		
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==1  then  -----µÚ¶þ¹Ø
		-- ¹ã²¥ÏûÏ¢
		local tow_BroadcastMsg = {
		"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ðÕi hi®p th§t mÕnh, mµt quy«n ðánh b©p #{_BOSS46}#P. Có #{_INFOUSR$N}#P ðÕi hi®p · ðây, ti¬u t£c nào dám càn rÞ?",
		"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ðÕi hi®p th§t lþi hÕi, quét sÕch Ti¬u Trúc Lâm Tô Châu. Mµt tr§n ðòn giáng xu¯ng, #GH°ng Hùng#P cûng phäi quy hàng.",
		"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ðÕi hi®p th§t mÕnh, hi®p nghîa lßu danh vÕn c±. Võ công khöi phäi nói, g£p #GH°ng Hùng#P là n± ð¥u."
		}
		too_DemandKill = { { id = 4120, num = 1 }, { id = 4110, num = 80 } }			-- 1 ~ 2 ºÅ£¬¹ÖÎïÐÅÏ¢
		too_DemandKillGroup = { 2, 1 }		-- 1 ~ 2 ºÅ¹ÖÎï¶ÔÓ¦µÄ GroupID ºÅ£¬Óë too_DemandKill Ò»Ò»¶ÔÓ¦
		 
		if GroupID == 2 then -- Boss Group ID
			LuaFnSetCopySceneData_Param( sceneId, 21,2)   -----ÉèÖÃµÚ3¹Ø
			LuaFnSetCopySceneData_Param( sceneId, 2, 0 )
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- É±ËÀBoss1µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- É±ËÀBoss2µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- É±ËÀBoss3µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- É±ËÀBoss4µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- É±ËÀBoss5µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- ÊÇ·ñÉ±ËÀÐ¡ Boss
			LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- ÊÇ·ñÒÑ¾­ÓÐÐ¡¹ÖÌÓ×ß
			LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- ÊÇ·ñÒÑ¾­Ë¢³ö´ó Boss
			local BroadcastMsg = tow_BroadcastMsg[ random( getn(tow_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			x001130_TipAllHuman( sceneId, "H\176ng H\249ng V\223\189ng \240\227 b\184 \240\225nh b\213i, 60 gi\226y sau s\168 v\224o \228i 3, S\189n Tr\213i \208\213i V\223\189ng s\161p xu\164t hi\174n......." )
		end
		
		
		local killedMonsterIndex, killedCount = 0, 0
		for i = 1, getn( too_DemandKillGroup ) do
			if GroupID == too_DemandKillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- É±ËÀBossiµÄÊýÁ¿
				break
			end
		end
		
		if killedMonsterIndex == 0 then													-- É±ËÀÁËÒ»¸ö²»Ïà¹Ø¹Ö
			return
		end
		
		local maxKilledCount = too_DemandKill[killedMonsterIndex].num
		
		--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local misIndex
		local strText = format( "\208\227 gi\170t %s: %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )
		for i = 0, num - 1 do
			mems[i + 1] = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
			if LuaFnIsObjValid( sceneId, mems[i + 1] ) == 1 then						-- ²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
				x001130_NotifyFailTips ( sceneId, mems[i + 1], strText )
				Msg2Player( sceneId, mems[i + 1], strText, MSG2PLAYER_PARA )
				misIndex = GetMissionIndexByID( sceneId, mems[i + 1], x001130_g_MissionId )
				if killedMonsterIndex==2 then 
				---SetMissionByIndex( sceneId, mems[i + 1], misIndex, 6, killedCount )	-- Ë¢ÐÂÉ±¹ÖÊýÁ¿
				else
				SetMissionByIndex( sceneId, mems[i + 1], misIndex, 4, killedCount )	-- Ë¢ÐÂÉ±¹ÖÊýÁ¿	
				end
			end
		end
		
		if killedCount==maxKilledCount and killedMonsterIndex==2 then ---É±ÍêËùÓÐÐ¡¹Ö£¬¾ÍË¢BOSS
			---ºìÐÜÍõ
			too_Boss = { 4120, 4121, 4122, 4123, 4124, 4125, 4126, 4127, 4128, 4129, 34120, 34121, 34122, 34123, 34124, 34125, 34126, 34127, 34128, 34129 }
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			local boss_id =  too_Boss[bossGrade]
			if not too_Boss[bossGrade] then
				return
			end
			local bossId = LuaFnCreateMonster( sceneId, boss_id, 49, 42, 14, 128, 1130 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetCharacterTitle(sceneId, bossId, "H\249ng V\223\189ng")
			SetMonsterGroupID( sceneId, bossId, 2 )
			SetPatrolId( sceneId, bossId, 8 )		-- ÉèÖÃÑ²ÂßÂ·¾¶
			if bossId >=0 then 
			x001130_TipAllHuman( sceneId, "H\176ng H\249ng V\223\189ng \240\227 xu\164t hi\174n......." )
			end
		end
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==2  then  -----µÚ3¹Ø
		-- ¹ã²¥ÏûÏ¢
		local three_BroadcastMsg = {
		"#P Báo m÷i ngß¶i mµt tin vui: thü lînh phï ð° khét tiªng #{_BOSS47}#P hôm nay ðã b¸ #{_INFOUSR$N}#P ðánh bÕi! M÷i ngß¶i v² tay!",
		"#P Hãy cùng hoan hô! Thü lînh phï ð° #{_BOSS47}#P không còn tác oai tác quái ðßþc næa, h¡n ðã chªt dß¾i tay #{_INFOUSR$N}#P!",
		"#Y#{_BOSS47}#P ðã chªt! T× hôm nay không còn phäi s¯ng trong lo sþ! Hãy ca ngþi anh hùng cüa chúng ta: #{_INFOUSR$N}#P, ngß½i quá thiên tài!"
		}
		
		if GroupID == 0 then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- ÊÇ·ñÉ±ËÀ·ËÊ×
			local BroadcastMsg = three_BroadcastMsg[ random( getn(three_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
		end
		
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local killedCount = 1
		local maxKilledCount = 1
		local strText = format( "\208\227 gi\170t %s: %d/%d", GetName( sceneId, selfId ),  killedCount, maxKilledCount )
		for i = 0, num - 1 do
			local HumanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
			if LuaFnIsObjValid( sceneId, HumanObjId ) == 1 then
				local misIndex = GetMissionIndexByID( sceneId, HumanObjId, x001130_g_MissionId )
				SetMissionByIndex( sceneId, HumanObjId, misIndex, 5, killedCount )	-- Ë¢ÐÂÉ±¹ÖÊýÁ¿
				SetMissionByIndex( sceneId, HumanObjId, misIndex, 0, 1 )	-- ÈÎÎñÍê³É	
          		AddMonsterDropItem( sceneId, selfId, HumanObjId , x001130_g_Token )			  
				x001130_NotifyFailTips( sceneId, HumanObjId, strText )
				Msg2Player( sceneId, HumanObjId, strText, MSG2PLAYER_PARA )
				x001130_NotifyFailTips( sceneId, HumanObjId, "\208\227 ho\224n th\224nh m\248c ti\234u nhi\174m v\248" ) 
			end
		end
	    LuaFnSetCopySceneData_Param( sceneId, 4,1 ) ----ÉèÖÃÀë¿ª
	end
	
end


--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x001130_TipAllHuman( sceneId, Str )
	-- »ñµÃ³¡¾°ÀïÍ·µÄËùÓÐÈË
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- Ã»ÓÐÈËµÄ³¡¾°£¬Ê²Ã´¶¼²»×ö
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
		AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end
