--   001129

--**********************************
-- ¾ı·îÌìQQ£º137094888Ô­´´£¬ÇëÎğÍâ´«
--**********************************
x001129_g_DemandKillGroup = { 0, 1, 2, 3, 4 }	-- 1 ~ 5 ºÅ¹ÖÎï¶ÔÓ¦µÄ GroupID ºÅ£¬Óë x001129_g_DemandKill Ò»Ò»¶ÔÓ¦
x001129_g_DemandKill = {  { id = 13000, num = 60 }, { id = 13020, num = 1 }, { id = 13040, num = 1 } ,{ id = 13060, num = 1 },{ id = 4130, num = 1 } }	-- 1 ~ 5 ºÅ£¬¹ÖÎïĞÅÏ¢
x001129_g_DogfaceGroup = 0					-- ÌÓÅÜĞ¡±øµÄ Group ID
x001129_g_LittleBossGroup = 2				-- Ğ¡ Boss Group ID
x001129_g_ViceBossGroup = 1					-- ËÎ¾ü¸±¶¼Í³
x001129_g_BossGroup = 3						-- Boss Group ID
x001129_g_Token = 40004315					-- ÁîÅÆºÅ
x001129_g_MissionId = 1256					-- 1260 - 1269
x001129_g_BroadcastMsg = {
"#Y Vß½ng Diêm#P ğã chªt! H¡n b¸ anh hùng cüa chúng ta #{_INFOUSR$N}#P hÕ gøc! Kë tiªp theo nµp mÕng s¨ là ai?",
"#P Anh hùng cüa chúng ta #{_INFOUSR$N}#P mang v« tin m×ng t× #GT¯ng Liêu biên cänh#P: tên ác t£c Vß½ng Diêm#P ğã b¸ hÕ gøc!",
"#P M÷i ngß¶i mau xem anh hùng cüa chúng ta! #{_INFOUSR$N}#P! Mµt huy«n thoÕi s¯ng, ğÕi hi®p trong ğÕi hi®p!"
}

x001129_g_Param_sceneid = 6					-- 6 ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x001129_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }
x001129_g_LittleBoss = { 4090, 4091, 4092, 4093, 4094, 4095, 4096, 4097, 4098, 4099, 34090, 34091, 34092, 34093, 34094, 34095, 34096, 34097, 34098, 34099 }

--**********************************
-- ÆÁÄ»ÖĞ¼äĞÅÏ¢ÌáÊ¾
--**********************************
function x001129_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x001129_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)
	CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20800034, 25 )  -- [NetCo4 01/10] Cuu Thien Ngoc Toai 25% (02/10: 40 -> 30 -> 20 -> 25), NetCo4/roimap.lua
	CallScriptFunction( 950001, "RoiBoc", sceneId, selfId, killerId, 1, 10 )  -- [NetCo4 01/10 toi] Mien Bo 6 / Bi Ngan 6 10% boc 1
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end
	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎŞĞ§
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
		local one_DemandKill = {  { id = "Ğ¡±ø", num = 60 },  { id = "Å£ÇúºÍÅ£Ææ", num = 1 },{ id = "Å£ÇúºÍÅ£Ææ", num = 1 }, { id = "ÍõÑÖ", num = 1 } }	-- 1 ~ 4 ºÅ£¬¹ÖÎïĞÅÏ¢
		for i = 1, getn( one_KillGroup ) do
			if GroupID == one_KillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- É±ËÀBossiµÄÊıÁ¿
				break
			end
		end
		if killedMonsterIndex == 0 then		 -- É±ËÀÁËÒ»¸ö²»Ïà¹Ø¹Ö
			return
		end
		local maxKilledCount = one_DemandKill[killedMonsterIndex].num
		x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
		if GroupID == one_KillGroup[4] then
			LuaFnSetCopySceneData_Param( sceneId, 21,1 )   -----ÉèÖÃµÚ¶ş¹Ø
			LuaFnSetCopySceneData_Param( sceneId, 2, 0 )
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- É±ËÀBoss1µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- É±ËÀBoss2µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- É±ËÀBoss3µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- É±ËÀBoss4µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- É±ËÀBoss5µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- ÊÇ·ñÉ±ËÀĞ¡ Boss
			LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- ÊÇ·ñÒÑ¾­ÓĞĞ¡¹ÖÌÓ×ß
			LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- ÊÇ·ñÒÑ¾­Ë¢³ö´ó Boss
			x001129_TipAllHuman( sceneId, "ÍõÑÖÒÑ±»´ò°Ü£¬30Ãëºó½«½øÈëµÚ¶ş¹Ø£¬ÇëÇ°Íù£¨57.81£© " ,1)
			local BroadcastMsg = x001129_g_BroadcastMsg[ random( getn(x001129_g_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			return
		end
		if  LuaFnGetCopySceneData_Param( sceneId, 7  )==60  and  LuaFnGetCopySceneData_Param( sceneId, 8  )==1   and  LuaFnGetCopySceneData_Param( sceneId, 9  )==1   then  -----É±ËÀÁËÁ½Ö»BOSS¾ÍË¢ÍõÑÖ
			x001129_TipAllHuman( sceneId, "10ÃëÍõÑÖ½«³öÏÖÔÚ×ø±ê£¨90£¬183£©......." )
			LuaFnSetCopySceneData_Param( sceneId, 12,1 ) ---ÉèÖÃË¢ÍõÑÖµÄÌì¹Ø
		end

	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==1  then  -----µÚ¶ş¹Ø
		local two_KillGroup = { 0, 1, 2 }
		local two_DemandKill ={ { id = "¶¾ÕÏĞ¡¹Ö", num = 15 }, { id = "Ğ¡BOSS", num = 1} , { id = "ÖÕ¼«BOSS", num = 1}  }
		for i = 1, getn( two_KillGroup ) do
			if GroupID == two_KillGroup[i] then
				killedMonsterIndex = i
				killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
				LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- É±ËÀBossiµÄÊıÁ¿
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
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- É±ËÀBoss1µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )
			local boshu_str = {
			[0]="ÁÑµØĞĞÕß¼´½«³öÏÖ......Çë×÷ºÃ×¼±¸." ,
			[1]="Îå¶¾Ä§Ê¹¼´½«³öÏÖ......Çë×÷ºÃ×¼±¸......." ,
			[2]="ÎäĞş½«¼´½«³öÏÖ......Çë×÷ºÃ×¼±¸......." ,
			[3]="ÆÆÑæ×ğÕß¼´½«³öÏÖ......Çë×÷ºÃ×¼±¸......." ,
			[4]="µÚ¶ş¹Ø×îºóÒ»¸öBOSSºé¼¬ÑıÍõ¼´½«³öÏÖÔÚ£¨56£¬56£©Çë×÷ºÃ×¼±¸......." ,
             } 
			if boshu_str[boshu]  ~= nil then 
			x001129_TipAllHuman( sceneId, boshu_str[boshu]  )	
			end 	 
		end
		if GroupID == 2 then -- Boss Group ID
			-- ¹ã²¥ÏûÏ¢
			local tow_BroadcastMsg = {
			"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ğÕi hi®p th§t mÕnh, mµt quy«n ğánh b©p H°ng Kích Yêu Vß½ng#P. Có #{_INFOUSR$N}#P ğÕi hi®p · ğây, ti¬u t£c nào dám càn rŞ?",
			"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ğÕi hi®p th§t lşi hÕi, quét sÕch Viêm Ma S½n. Mµt tr§n ğòn giáng xu¯ng, #GH°ng Kích Yêu Vß½ng#P cûng phäi quy hàng.",
			"#Y Hoa Kiªm Vû: #W#{_INFOUSR$N}#P ğÕi hi®p th§t mÕnh, hi®p nghîa lßu danh vÕn c±. Võ công khöi phäi nói, g£p #GH°ng Kích Yêu Vß½ng#P là n± ğ¥u."
			}
			LuaFnSetCopySceneData_Param( sceneId, 21,2)   -----ÉèÖÃµÚ3¹Ø
			LuaFnSetCopySceneData_Param( sceneId, 2, 0 )
			LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- É±ËÀBoss1µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- É±ËÀBoss2µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- É±ËÀBoss3µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- É±ËÀBoss4µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- É±ËÀBoss5µÄÊıÁ¿
			LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- ÊÇ·ñÉ±ËÀĞ¡ Boss
			LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- ÊÇ·ñÒÑ¾­ÓĞĞ¡¹ÖÌÓ×ß
			LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- ÊÇ·ñÒÑ¾­Ë¢³ö´ó Boss
			local BroadcastMsg = tow_BroadcastMsg[ random( getn(tow_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			x001129_TipAllHuman( sceneId, "ºé¼¬ÑıÍõÒÑ±»´ò°Ü£¬30Ãëºó½«½øÈëµÚÈı¹Ø£¬»ğÑæÑıÄ§¼´½«³öÏÖ£¨210£¬40£©....." ,2)
		end
		
	elseif LuaFnGetCopySceneData_Param( sceneId, 21 ) ==2  then  -----µÚ3¹Ø
		-- ¹ã²¥ÏûÏ¢
		local three_BroadcastMsg = {
		"#P Báo m÷i ngß¶i mµt tin vui: thü lînh phï ğ° khét tiªng [Höa Di­m Yêu Ma]#P hôm nay ğã b¸ #{_INFOUSR$N}#P ğánh bÕi! M÷i ngß¶i v² tay!",
		"#P Hãy cùng hoan hô! Thü lînh phï ğ° [Höa Di­m Yêu Ma] không còn tác oai tác quái ğßşc næa, h¡n ğã chªt dß¾i tay #{_INFOUSR$N}#P!",
		"#Y[Höa Di­m Yêu Ma]#P ğã chªt! T× hôm nay không còn phäi s¯ng trong lo sş! Hãy ca ngşi anh hùng cüa chúng ta: #{_INFOUSR$N}#P, ngß½i quá thiên tài!"
		}
		
		if GroupID == 0 then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- ÊÇ·ñÉ±ËÀ·ËÊ×
			local BroadcastMsg = three_BroadcastMsg[ random( getn(three_BroadcastMsg) ) ]
			BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, playerID ) )
			BroadMsgByChatPipe( sceneId, playerID, BroadcastMsg, 4 )
			x001129_TipAllGongGao( sceneId,selfId, 1, 1 )
			x001129_TipAllHuman( sceneId, "ÈÎÎñÍê³É" ,3)
			LuaFnSetCopySceneData_Param( sceneId, 4,1 ) ----ÉèÖÃÀë¿ª
		end
		
	end
	
end


--**********************************
--ÌáÊ¾ËùÓĞ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x001129_TipAllHuman( sceneId, Str ,misIndex_num  )
	-- »ñµÃ³¡¾°ÀïÍ·µÄËùÓĞÈË
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- Ã»ÓĞÈËµÄ³¡¾°£¬Ê²Ã´¶¼²»×ö
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
			SetMissionByIndex( sceneId, PlayerId, misIndex, misIndex_num, 1 )	-- Ë¢ĞÂÉ±¹ÖÊıÁ¿
			if misIndex_num ==3 then
				SetMissionByIndex( sceneId, PlayerId, misIndex, 0, 1 )	-- ÈÎÎñÍê³É
			end
		end
	end
end


--**********************************
--ÌáÊ¾ËùÓĞ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x001129_TipAllGongGao( sceneId,selfId, killedCount, maxKilledCount )
	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	if num < 1 then
		return
	end
	local strText = format( "ÒÑÉ±ËÀ%s£º %d/%d", GetName( sceneId, selfId ), killedCount, maxKilledCount )
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