--   001129

--**********************************
-- ¾ý·îÌìQQ£º137094888Ô­´´£¬ÇëÎðÍâ´«
--**********************************
x001129_g_DemandKillGroup = { 0, 1, 2, 3, 4 }	-- 1 ~ 5 ºÅ¹ÖÎï¶ÔÓ¦µÄ GroupID ºÅ£¬Óë x001129_g_DemandKill Ò»Ò»¶ÔÓ¦
x001129_g_DemandKill = {  { id = 13000, num = 60 }, { id = 13020, num = 1 }, { id = 13040, num = 1 } ,{ id = 13060, num = 1 },{ id = 4130, num = 1 } }	-- 1 ~ 5 ºÅ£¬¹ÖÎïÐÅÏ¢
x001129_g_DogfaceGroup = 0					-- ÌÓÅÜÐ¡±øµÄ Group ID
x001129_g_LittleBossGroup = 2				-- Ð¡ Boss Group ID
x001129_g_ViceBossGroup = 1					-- ËÎ¾ü¸±¶¼Í³
x001129_g_BossGroup = 3						-- Boss Group ID
x001129_g_Token = 40004315					-- ÁîÅÆºÅ
x001129_g_MissionId = 1256					-- 1260 - 1269
x001129_g_BroadcastMsg = {
"#Y Vß½ng Diêm#P ðã chªt! H¡n b¸ anh hùng cüa chúng ta #{_INFOUSR$N}#P hÕ gøc! Kë tiªp theo nµp mÕng s¨ là ai?",
"#P Anh hùng cüa chúng ta #{_INFOUSR$N}#P mang v« tin m×ng t× #GT¯ng Liêu biên cänh#P: tên ác t£c Vß½ng Diêm#P ðã b¸ hÕ gøc!",
"#P M÷i ngß¶i mau xem anh hùng cüa chúng ta! #{_INFOUSR$N}#P! Mµt huy«n thoÕi s¯ng, ðÕi hi®p trong ðÕi hi®p!"
}

x001129_g_Param_sceneid = 6					-- 6 ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x001129_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }
x001129_g_LittleBoss = { 4090, 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4098, 4099, 34090, 34091, 34092, 34093, 34094, 34095, 34096, 34097, 34098, 34099 }

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x001129_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x001129_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)
	CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20800034, 20 )  -- [NetCo4 01/10] Cuu Thien Ngoc Toai 20% (02/10: 40 -> 30 -> 20 -> 25 -> 30; 05/10 -> 20)
	CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20501008, 1 )  -- [NetCo4 05/10] Mien Bo 8 1% (truoc: RoiBoc Mien Bo / Bi Ngan 6 10%)
	CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20502008, 1 )  -- [NetCo4 05/10] Bi Ngan 8 1%
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
	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
	local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
	--È¡µÃÉ±ËÀ¹ÖÎïµÄGroupID
	local GroupID = GetMonsterGroupID( sceneId, selfId )
	local killedMonsterIndex, killedCount = 0, 0
	----*********
	----µÚÒ»¹Ø
	----*********
	if LuaFnGetCopySceneData_Param( sceneId, 21  ) ==0 then
		
		local one_KillGroup = { 0, 1, 2, 3  }	-- 1 ~ 3ºÅ¹ÖÎï¶ÔÓ¦µÄ GroupID ºÅ£¬Óë one_DemandKill Ò»Ò»¶ÔÓ¦
		local one_DemandKill = {  { id = "Ð¡±ø", num = 60 },  { id = "Å£ÇúºÍÅ£Ææ", num = 1 },{ id = "Å£ÇúºÍÅ£Ææ", num = 1 }, { id = "ÍõÑÖ", num = 1 } }	-- 1 ~ 4 ºÅ£¬¹ÖÎïÐÅÏ¢
		for i = 1, getn( one_KillGroup ) do
			if GroupID == one_KillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- É±ËÀBossiµÄÊýÁ¿
				break
			end
		end
		if killedMonsterIndex == 0 then		 -- É±ËÀÁËÒ»¸ö²»Ïà¹Ø¹Ö
			return
		end
		local maxKilledCount = one_DemandKill[killedMonsterIndex].num
		x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
		if GroupID == one_KillGroup[4] then
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
			x001129_TipAllHuman( sceneId, "V\223\189ng Di\234m \240\227 b\184 \240\225nh b\213i! Kho\228ng 50 gi\226y n\230a v\224o \228i 2, h\227y t\190i t\247a \240\181 (57,81)." ,1)   -- [NetCo4 02/10] Viet hoa
			local BroadcastMsg = x001129_g_BroadcastMsg[ random( getn(x001129_g_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			return
		end
		if  LuaFnGetCopySceneData_Param( sceneId, 7  )==60  and  LuaFnGetCopySceneData_Param( sceneId, 8  )==1   and  LuaFnGetCopySceneData_Param( sceneId, 9  )==1   then  -----É±ËÀÁËÁ½Ö»BOSS¾ÍË¢ÍõÑÖ
			x001129_TipAllHuman( sceneId, "10 gi\226y n\230a V\223\189ng Di\234m s\168 xu\164t hi\174n t\213i t\247a \240\181 (90,183)..." )   -- [NetCo4 02/10] Viet hoa
			LuaFnSetCopySceneData_Param( sceneId, 12,1 ) ---ÉèÖÃË¢ÍõÑÖµÄÌì¹Ø
		end

	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==1  then  -----µÚ¶þ¹Ø
		local two_KillGroup = { 0, 1, 2 }
		local two_DemandKill ={ { id = "¶¾ÕÏÐ¡¹Ö", num = 15 }, { id = "Ð¡BOSS", num = 1} , { id = "ÖÕ¼«BOSS", num = 1}  }
		for i = 1, getn( two_KillGroup ) do
			if GroupID == two_KillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- É±ËÀBossiµÄÊýÁ¿
				break
			end
		end
		
		if killedMonsterIndex == 0 then		 -- É±ËÀÁËÒ»¸ö²»Ïà¹Ø¹Ö
			return
		end
		local maxKilledCount = two_DemandKill[killedMonsterIndex].num
		x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
		if LuaFnGetCopySceneData_Param( sceneId, 7 ) ==15 and LuaFnGetCopySceneData_Param( sceneId, 8 ) ==1 then
			local boshu =  LuaFnGetCopySceneData_Param( sceneId, 14 )
			LuaFnSetCopySceneData_Param( sceneId, 14,boshu+1)
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- É±ËÀBoss1µÄÊýÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )
			local boshu_str = {
			[0]="Li\174t \208\184a H\224nh Gi\228 s\161p xu\164t hi\174n... h\227y chu\166n b\184." ,   -- [NetCo4 02/10] Viet hoa
			[1]="Ng\251 \208\181c Ma S\209 s\161p xu\164t hi\174n... h\227y chu\166n b\184." ,   -- [NetCo4 02/10] Viet hoa
			[2]="V\251 Huy\171n T\223\190ng s\161p xu\164t hi\174n... h\227y chu\166n b\184." ,   -- [NetCo4 02/10] Viet hoa
			[3]="Ph\225 Di\173m T\244n Gi\228 s\161p xu\164t hi\174n... h\227y chu\166n b\184." ,   -- [NetCo4 02/10] Viet hoa
			[4]="Boss cu\175i \228i 2 H\176ng K\237ch Y\234u V\223\189ng s\161p xu\164t hi\174n t\213i (55,55), h\227y chu\166n b\184..." ,   -- [NetCo4 02/10] Viet hoa
             } 
			if boshu_str[boshu]  ~= nil then 
			x001129_TipAllHuman( sceneId, boshu_str[boshu]  )	
			end 	 
		end
		if GroupID == 2 then -- Boss Group ID
			-- ¹ã²¥ÏûÏ¢
			local tow_BroadcastMsg = {
			"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ðÕi hi®p th§t mÕnh, mµt quy«n ðánh b©p H°ng Kích Yêu Vß½ng#P. Có #{_INFOUSR$N}#P ðÕi hi®p · ðây, ti¬u t£c nào dám càn rÞ?",
			"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ðÕi hi®p th§t lþi hÕi, quét sÕch Viêm Ma S½n. Mµt tr§n ðòn giáng xu¯ng, #GH°ng Kích Yêu Vß½ng#P cûng phäi quy hàng.",
			"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ðÕi hi®p th§t mÕnh, hi®p nghîa lßu danh vÕn c±. Võ công khöi phäi nói, g£p #GH°ng Kích Yêu Vß½ng#P là n± ð¥u."
			}
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
			x001129_TipAllHuman( sceneId, "H\176ng K\237ch Y\234u V\223\189ng \240\227 b\184 \240\225nh b\213i! 1 ph\250t n\230a v\224o \228i 3, H\246a Di\173m Y\234u Ma s\168 xu\164t hi\174n t\213i (210,40)..." ,2)   -- [NetCo4 02/10] Viet hoa
		end
		
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==2  then  -----µÚ3¹Ø
		-- ¹ã²¥ÏûÏ¢
		local three_BroadcastMsg = {
		"#P Báo m÷i ngß¶i mµt tin vui: thü lînh phï ð° khét tiªng [Höa Di­m Yêu Ma]#P hôm nay ðã b¸ #{_INFOUSR$N}#P ðánh bÕi! M÷i ngß¶i v² tay!",
		"#P Hãy cùng hoan hô! Thü lînh phï ð° [Höa Di­m Yêu Ma] không còn tác oai tác quái ðßþc næa, h¡n ðã chªt dß¾i tay #{_INFOUSR$N}#P!",
		"#Y[Höa Di­m Yêu Ma]#P ðã chªt! T× hôm nay không còn phäi s¯ng trong lo sþ! Hãy ca ngþi anh hùng cüa chúng ta: #{_INFOUSR$N}#P, ngß½i quá thiên tài!"
		}
		
		if GroupID == 0 then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- ÊÇ·ñÉ±ËÀ·ËÊ×
			local BroadcastMsg = three_BroadcastMsg[ random( getn(three_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			x001129_TipAllGongGao( sceneId,selfId, 1, 1 )
			x001129_TipAllHuman( sceneId, "Nhi\174m v\248 ho\224n th\224nh! H\227y v\171 L\226u Lan g\163p H\224 Duy\174t tr\228 nhi\174m v\248." ,3)   -- [NetCo4 02/10] Viet hoa
			LuaFnSetCopySceneData_Param( sceneId, 4,1 ) ----ÉèÖÃÀë¿ª
		end
		
	end
	
end


--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x001129_TipAllHuman( sceneId, Str ,misIndex_num  )
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
		if 	misIndex_num ~=nil  then
			local misIndex = GetMissionIndexByID( sceneId, PlayerId, x001129_g_MissionId )
			SetMissionByIndex( sceneId, PlayerId, misIndex, misIndex_num, 1 )	-- Ë¢ÐÂÉ±¹ÖÊýÁ¿
			if misIndex_num ==3 then
				SetMissionByIndex( sceneId, PlayerId, misIndex, 0, 1 )	-- ÈÎÎñÍê³É
			end
		end
	end
end


--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	if num < 1 then
		return
	end
	local strText = format( "\208\227 gi\170t %s: %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )   -- [NetCo4 02/10] Viet hoa
	for i = 0, num - 1 do
		local PlayerId= LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 then
    		BeginEvent(sceneId)
	        AddText(sceneId, strText)
		    EndEvent(sceneId)
		    DispatchMissionTips(sceneId, PlayerId)			   
		end
	end
	
end