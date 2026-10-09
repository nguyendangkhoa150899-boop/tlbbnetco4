--³¡¾°µÄ½Å±¾ÎÄ¼þ

--½Å±¾ºÅ
x888888_g_scriptId_scene = 888888

x888888_g_defaultRelive_SceneID_1=77;
x888888_g_defaultRelive_SceneID_2=2;

-- ==========»ªÉ½ÂÛ½£Ïà¹ØµÄÒ»Ð©³£Á¿¶¨Òå===========
x888888_g_HS_PK_SceneId = 125   --hongyu

x888888_g_Jinghu_SceneId = 5   --hongyu
x888888_g_jingji_SceneId = 414 --hongyu ¾º¼¼³¡
x888888_g_HanYuBed_SceneId = 194 --º®Óñ´²
x888888_g_NianShou_SceneId = 6 --ÄêÊÞ
x888888_g_XinShou_SceneId = 918 --ÅÝµãµØÍ¼ºÅ

--ÏÂÃæ¶¨ÒåÍæ¼ÒÃ¿¸öµÈ¼¶·¢ËÍµÄÓÊ¼þÊýÁ¿
--¸ñÊ½Îª{2,0},2ÎªµÈ¼¶,0ÊÇ¸ÃµÈ¼¶Òª·¢ËÍµÄÓÊ¼þÊýÄ¿£¬ÔÚ¿Í»§¶ËµÄstrdictionary.txtÀïÃæÓÐLevelMail_2_1´ú±í2¼¶µÚÒ»·âÓÊ¼þ,Ìí¼ÓÓÊ¼þÄÚÈÝÊ±ÐèÍ¬Ê±ÐÞ¸Ä¿Í»§¶ËºÍ¸Ã½á¹¹µÄÄÚÈÝ
x888888_g_MailNum = {
										{1,1},{2,1},{3,1},{4,1},{5,1},{6,1},{7,1},{8,1},{9,1},{10,1},{11,1},
										{12,1},{13,1},{14,1},{15,1},{16,1},{17,1},{18,1},{19,1},{20,1},{21,1},
									{22,1},{23,1},{24,1},{25,1},{26,1},{27,1},{28,1},{29,1},{30,1},{31,1},
									{32,1},{33,1},{34,1},{35,1},{36,1},{37,1},{38,1},{39,1},{40,1},{41,1},
										{42,1},{43,1},{44,1},{45,1},{46,1},{47,1},{48,1},{49,1},{50,1},{51,1},
									{52,1},{53,1},{54,1},{55,1},{56,1},{57,1},{58,1},{59,1},{60,1},{61,1},
									{62,1},{63,1},{64,1},{65,1},{66,1},{67,1},{68,1},{69,1},{70,1},{71,1},
									{72,1},{73,1},{74,1},{75,1},{76,1},{77,1},{78,1},{79,1},{80,1},{81,1},
									{82,1},{83,1},{84,1},{85,1},{86,1},{87,1},{88,1},{89,1},{90,1},{91,1},
								{92,1},{93,1},{94,1},{95,1},{96,1},{97,1},{98,1},{99,1},{100,1},{101,0},
										{102,1},{103,1},{104,1},{105,1},{106,1},{107,1},{108,1},{109,1},{110,1},
										{111,1},{112,1},{113,1},{114,1},{115,1},{116,1},{117,1},{118,1},{119,1},{120,1},
										 
									   }

-- ===============================================

---------------------------------------------------------------
---µ±Íæ¼Ò»ñµÃ35¼¶ÐÄ·¨ÃØ¼®¼°65¼¶Îä¹¦ÃØ¼®£¬»áÔÚÊÀ½ç¹«¸æ
x888888_MenPaiBroadMsg = 
{
	[0]	= { mp = "Thiªu Lâm", XinFa = 30308002, MiJi = 30308011 },	--ÉÙÁÖ
	[1]	= { mp = "Minh Giáo", XinFa = 30308003, MiJi = 30308012 },	--Ã÷½Ì
	[2]	= { mp = "Cái Bang", XinFa = 30308004, MiJi = 30308013 },	--Ø¤°ï
	[3]	= { mp = "Võ Ðang", XinFa = 30308005, MiJi = 30308014 },	--Îäµ±
	[4]	= { mp = "Nga My", XinFa = 30308006, MiJi = 30308015 },	--¶ëáÒ
	[5]	= { mp = "Tinh Túc", XinFa = 30308007, MiJi = 30308016 },	--ÐÇËÞ
	[6]	= { mp = "Thiên Long", XinFa = 30308008, MiJi = 30308017 },	--ÌìÁú
	[7]	= { mp = "Thiên S½n", XinFa = 30308009, MiJi = 30308018 },	--ÌìÉ½
	[8] = { mp = "Tiêu Dao", XinFa = 30308010, MiJi = 30308019 },	--åÐÒ£
}



-- ¸±±¾´æÍæ¼ÒÆ½¾ù¼¶±ðÓë¹ÖÎïÄ¬ÈÏ¼¶±ðµÄ¼¶±ð²î£¬²îÖµÓÃÓÚ³¡¾°³õÊ¼»¯Ê±¶Ô¹ÖÎï¼¶±ð½øÐÐµ÷Õû£¬´Ë±àºÅ¹Ì¶¨²»ÄÜ¸Ä
CopyScene_LevelGap =31

-- Íæ¼ÒÉý¼¶Ê±¿ÉÒÔÍê³ÉµÄÈÎÎñ
x888888_g_FullLevel_MissionList	=	{}
--x888888_g_FullLevel_MissionList[28] = { MissionId = 403, MissionIndex = 500606, LevelLimit = 28, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_188}" }
--x888888_g_FullLevel_MissionList[30] = { MissionId = 409, MissionIndex = 500602, LevelLimit = 30, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_181}" }												-- ÈÎÎñID,ÈÎÎñË÷ÒýºÅ,ÐèÇóµÈ¼¶,ÈÎÎñÍê³É±êÖ¾ÔÚÈÎÎñ²ÎÊýµÚ¼¸Î»,ÈÎÎñ¸ú×Ù±êÖ¾ÔÚÈÎÎñ²ÎÊýµÚ¼¸Î»
--x888888_g_FullLevel_MissionList[32] = { MissionId = 412, MissionIndex = 500603, LevelLimit = 32, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_183}" }
--x888888_g_FullLevel_MissionList[35] = { MissionId = 415, MissionIndex = 500605, LevelLimit = 35, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_186}" }
--x888888_g_FullLevel_MissionList[38] = { MissionId = 418, MissionIndex = 500608, LevelLimit = 38, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_191}" }
--x888888_g_FullLevel_MissionList[40] = { MissionId = 428, MissionIndex = 500612, LevelLimit = 40, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_196}" }
--x888888_g_FullLevel_MissionList[42] = { MissionId = 433, MissionIndex = 500613, LevelLimit = 42, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_198}" }
--x888888_g_FullLevel_MissionList[45] = { MissionId = 437, MissionIndex = 500614, LevelLimit = 45, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_200}" }
--x888888_g_FullLevel_MissionList[48] = { MissionId = 476, MissionIndex = 500615, LevelLimit = 48, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_202}" }
--x888888_g_FullLevel_MissionList[50] = { MissionId = 480, MissionIndex = 500616, LevelLimit = 50, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_204}" }

-- Íæ¼ÒÉý¼¶Ê±¿ÉÒÔ×Ô¶¯Ìí¼ÓµÄÈÎÎñ
x888888_g_AutoAccept_MissionList = {}
--x888888_g_AutoAccept_MissionList[26] = { MissionId = 400, MissionIndex = 1018700, PreMissionId = 0,   pKill = 0, pArea = 0, pItem = 0, EventId = 4 }
--x888888_g_AutoAccept_MissionList[28] = { MissionId = 403, MissionIndex = 500606, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }			-- ÈÎÎñID,ÈÎÎñË÷ÒýºÅ,Ç°ÐøÈÎÎñID,ÈÎÎñÀàÐÍ²ÎÊý(3),½Å±¾ÈÎÎñÊ±MissionIndexÎªScriptId
--x888888_g_AutoAccept_MissionList[30] = { MissionId = 409, MissionIndex = 500602, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[32] = { MissionId = 412, MissionIndex = 500603, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[35] = { MissionId = 415, MissionIndex = 500605, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[38] = { MissionId = 418, MissionIndex = 500608, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[40] = { MissionId = 428, MissionIndex = 500612, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[42] = { MissionId = 433, MissionIndex = 500613, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[45] = { MissionId = 437, MissionIndex = 500614, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[48] = { MissionId = 476, MissionIndex = 500615, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
--x888888_g_AutoAccept_MissionList[50] = { MissionId = 480, MissionIndex = 500616, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }

function x888888_OnSceneInit( sceneId )
--³¡¾°ÔÚ³õÊ¼»¯Íê³Éºóµ÷ÓÃ
	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
	local monstercount = GetMonsterCount( sceneId )
	local monsterobjid = -1

	local i
	for i=0, monstercount-1 do
		monsterobjid = GetMonsterObjID( sceneId, i )
		SetLevel( sceneId, monsterobjid, GetLevel( sceneId, monsterobjid ) + LevelGap )
	end
end

function x888888_OnSceneTimer( sceneId, nowTime )
--³¡¾°¼ÆÊ±Æ÷
--sceneId±íÊ¾³¡¾°ºÅ£¬nowTime±íÊ¾µ±Ç°Ê±¼ä£¨³ÌÐòÆô¶¯ºóµÄÊ±¼ä£¬µ¥Î»ºÁÃë£©


	sceneType = LuaFnGetSceneType(sceneId) ;

	if sceneType == 1 then --³¡¾°ÀàÐÍÊÇ¸±±¾
		copyscenetype = LuaFnGetCopySceneData_Param(sceneId,0) ;--È¡µÃ¸±±¾ºÅ
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --È¡µÃ½Å±¾ºÅ
		if copyscenetype==FUBEN_EXAMPLE then --Àý×Ó
			--Àý×Ó²»Ìá¹©¶¨Ê±Ê±¼ä
			print("Không th¬ sØ døng phø bän này, chßa ðªn th¶i gian!")
		elseif copyscenetype==FUBEN_EXAMPLE then --
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7¼¶Ä¾ÈËÏï¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9¼¶Ä¾ÈËÏï¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG then --±ê×¼Ä¾ÈËÏï¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_SHUILAO then --Ë®ÀÎ¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_ZHENGLONG then --ÕäççÆå¾Ö¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_PVP_LEITAI then --ÀÞÌ¨¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		else
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		end
	end
end

function x888888_OnSceneQuit( sceneId )
--³¡¾°ÔÚ¹Ø±ÕÇ°µ÷ÓÃ

end



function x888888_OnScenePlayerEnter( sceneId, playerId, isReconnect )
	CallScriptFunction( 950000, "NhanQua", sceneId, playerId ) -- [NetCo4] qua tu panel khi doi ban do
	--ÉèÖÃÈ±Ê¡µÄ¸´»îÐÅÏ¢
	CallScriptFunction( 402314, "DoAutoGetExpLogic", sceneId, playerId )
	-- Çå³ýÁÙÊ±ÕóÓª£¨ÀýÈçÌôÕ½Ö®ÀàµÄ£¬±ÜÃâÒòÎªÒ»Ð©²»ÄÜ²¶×½µÄÒÆ¶¯ÊÂ¼þ¡ª¡ªËÀÍöµÈ¡ª¡ªµ¼ÖÂÒ»Ð©Î´ÆÚÍûµÄÕóÓªºÅ±»´ø³öÔ­³¡¾°£©
	 SetUnitCampID(sceneId, playerId, playerId, -1)  --Õâ¸ö¸ÄÍÅÁËËùÒÔ²»Çå¿Õ --Ð«×ÓÒª°ÑËü´ò¿ª£¬²»È»ËÎÁÉÖ®ÀàµÄ¸±±¾ÓÐÎÊÌâ

       -- BeginUICommand( sceneId )
       -- EndUICommand( sceneId )
       -- DispatchUICommand( sceneId, playerId, 201404271)

        SetMissionData(sceneId, playerId, SKILL_CHECK, 1)   --·ÀÎÞÏÞ
        CallScriptFunction( 890547, "CreateIance", sceneId, playerId )
	
	--Çå³ýçÎç¿·å¸±±¾Àï¼ÓµÄ½µµÍ¶¾¿¹µÄbuff....
	LuaFnCancelSpecificImpact( sceneId, playerId, 10249 )
	LuaFnCancelSpecificImpact( sceneId, playerId, 19801 )

	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --³¡¾°ÀàÐÍÊÇ¸±±¾
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --È¡µÃ½Å±¾ºÅ
		CallScriptFunction( copyscenescript, "OnPlayerEnter", sceneId, playerId ) ;

		local copyscenetype = LuaFnGetCopySceneData_Param( sceneId, 0 )		--È¡µÃ¸±±¾ºÅ
		if copyscenetype == FUBEN_MURENXIANG_7
		 or copyscenetype == FUBEN_MURENXIANG_9
		 or copyscenetype == FUBEN_MURENXIANG
		 or copyscenetype == FUBEN_SHUILAO
		 or copyscenetype == FUBEN_ZHENGLONG
		 or copyscenetype == FUBEN_PVP_LEITAI
		 or copyscenetype == FUBEN_BIANGUAN
		 or copyscenetype == FUBEN_SHIJI1
		 or copyscenetype == FUBEN_KAOCHANG
		 or copyscenetype == FUBEN_DATAOSHA
		 or copyscenetype == FUBEN_ZEIBINGRUQIN
		 or copyscenetype == FUBEN_JIAOFEI
		 or copyscenetype == FUBEN_CUJU
		 or copyscenetype == FUBEN_DAZHAN_YZW
		 or copyscenetype == FUBEN_GODFIRE
		 or copyscenetype == FUBEN_PROTECTGUILD
		 or copyscenetype == FUBEN_PIAOMIAOFENG
		 or copyscenetype == FUBEN_XINSHENGSHOUSHAN
		 or copyscenetype == FUBEN_SEEK_TREASURE -- zchw
		 or copyscenetype == FUBEN_TIANLONG1
		 or copyscenetype == FUBEN_SHAOLIN1
		 or copyscenetype == FUBEN_MINGJIAO1
		 or copyscenetype == FUBEN_GAIBANG1
		 or copyscenetype == FUBEN_EMEI1
		 or copyscenetype == FUBEN_XINGXIU1
		 or copyscenetype == FUBEN_XIAOYAO1
		 or copyscenetype == FUBEN_WUDANG1
		 or copyscenetype == FUBEN_TIANSHAN1
                 or copyscenetype == FUBEN_TANGMEN1
                 or copyscenetype == FUBEN_GUIGU1
                 or copyscenetype == FUBEN_GUSU1
		 or copyscenetype == FUBEN_BANGZHAN
		 or copyscenetype == FUBEN_SONGLIAO
		 or copyscenetype == FUBEN_FEIZHAI
		 or copyscenetype == FUBEN_ZHULIN
		-----------------------------
		or copyscenetype == FUBEN_LANGHUAN --ÀÅ‹Ö¸±±¾
		or copyscenetype == FUBEN_XUEZHANYMG--ÑªÕ½ÑãÃÅ¹Ø
		or copyscenetype == FUBEN_SHAOSHISHAN--ÉÙÊÒÉ½
		or copyscenetype == FUBEN_SIJUEZHUANG--ËÄ¾ø×¯
		or copyscenetype == FUBEN_PIAOMIAOFENG--Æ®Ãì·å
		or copyscenetype == FUBEN_BINGSHENZHEN--±øÊ¥ÆæÕó
		or copyscenetype == FUBEN_ZHOUTIAN--Ðé¿Õ»Ã¾³
		or copyscenetype == FUBEN_HUANJING--ÌìÁú»Ã¾³
                or copyscenetype == FUBEN_FENGHUANG
                or copyscenetype == FUBEN_JUNTIAN
                or copyscenetype == FUBEN_SONGLIAO
                or copyscenetype == FUBEN_SANSHENHUANJING

		then		-- ÒÔÉÏ¸±±¾ÓÐ¶ÀÁ¢µÄËÀÍöµØµãÉèÖÃ
			return
		end
	else
		--///////////////////////////////////////////////////////
		--Èç¹ûËûÓÐÊ¦ÃÅµÄ¸±±¾ÈÎÎñÔòÉ¾³ý£¬ÈçÉÙÁÖµÄ¡°ËþÁÖ¡±
		local missionIdTable = {1061,1091,1066,1081,1101,1071,1096,1086,1076}
		for i, v in missionIdTable do
			if IsHaveMission(sceneId,playerId,v) > 0 then
				DelMission(sceneId, playerId, v)
				break
			end
		end
		--///////////////////////////////////////////////////////

		--Èç¹ûËûÓÐäîÔËÈÎÎñ
		if IsHaveMission(sceneId,playerId,4021) > 0 then
			CallScriptFunction( 311010, "OnPlayerEnterCaoyunScene", sceneId, playerId )
		end
	end

	--PKÖµ>4Ê±£¬¼àÓüÖÐËÀÍöÔòÔÚ¼àÓüÖÐ¸´»î
	if sceneId == SCENE_PRISON and LuaFnGetHumanPKValue( sceneId, playerId ) > 4 then
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%10", -1, "0", SCENE_PRISON, 48, 30 )
		return
	end

	if GetMenPai( sceneId, playerId) ~=9 then
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%10", -1, "0", x888888_g_defaultRelive_SceneID_1, 20, 38 );
	else
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", -1, "0", x888888_g_defaultRelive_SceneID_2, 165, 169 );
	end

	-- Èç¹û½øÈëÁË»ªÉ½ÂÛ½£µÄ³¡¾°£¬¾ÍÉèÖÃÕâ¸öÈËÎïµÄÕóÓªºÅ  hongyu
	if sceneId == x888888_g_HS_PK_SceneId    then
		CallScriptFunction((001233), "OnScenePlayerEnter",sceneId, playerId)
		-- ÔÚÕâÀï¼ì²â»ªÉ½ÂÛ½£µÄ¼ÆÊ±Æ÷ÊÇ²»ÊÇ¿ª×Å£¬Èç¹ûÃ»ÓÐ¿ª¾Í´ò¿ª£¬
		-- ³¡¾°¼ÆÊ±Æ÷µÄId = 0
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 1230, "OnHuashanSceneTimer", 10000)
		end
	end

        if  sceneId == 550  then 
                if CheckTimer(sceneId, 0) == 0  then
                        SetTimer(sceneId, playerId, 300109, "OnSceneTimer", 2000)
                end	
        end	

        if sceneId == 180    then 
	        if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 900014, "OnSceneTimer", 5000)
		end
	    CallScriptFunction((900014), "OnPlayerEnter",sceneId, playerId)	
	end
	------------------D4 ²âÊÔ°æ
		--if sceneId == 538  then
		--CallScriptFunction((888777), "OnScenePlayerEnter",sceneId, playerId)	
		--if CheckTimer(sceneId, 0) == 0  then
		--	SetTimer(sceneId, playerId, 888777, "OnSceneTimer", 1000)
		--end
	 -- end
	if sceneId == 317    then   --È«¹úÕù°ÔÈü¡¤°ïÕ½
	if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 600053, "OnSceneTimer", 5000)
		end
	CallScriptFunction((600053), "OnPlayerEnter",sceneId, playerId)	
	end	

        if sceneId == 549    then  --È«¹úÕù°ÔÈü¡¤»ìÕ½ 
	   if CheckTimer(sceneId, 0) == 0  then
	        SetTimer(sceneId, playerId, 600056, "OnSceneTimer", 5000)
	   end
	CallScriptFunction((600056), "OnPlayerEnter",sceneId, playerId)	
	end

	-- Èç¹û½øÈë¾º¼¼³¡,µÚÒ»½øÈë¾º¼¼³¡µÄÈË£¬´ò¿ª¼ÆÊ±Æ÷
	if sceneId == x888888_g_jingji_SceneId    then
		CallScriptFunction((125020), "OnScenePlayerEnter",sceneId, playerId)
		-- ÔÚÕâÀï¼ì²â»ªÉ½ÂÛ½£µÄ¼ÆÊ±Æ÷ÊÇ²»ÊÇ¿ª×Å£¬Èç¹ûÃ»ÓÐ¿ª¾Í´ò¿ª£¬
		-- ³¡¾°¼ÆÊ±Æ÷µÄId = 0
		--if CheckTimer(sceneId, 0) == 0  then
			--SetTimer(sceneId, playerId, 125020, "OnSceneTimer", 10000)
			----InitSceneData(sceneId, playerId, 125020, "OnInitScene")
		--end
	end
	
	-- µÚÒ»¸ö½øÈë¾µºþ³¡¾°µÄÍæ¼Ò£¬¸ºÔðÆô¶¯¾µºþµÄ¼ÆÊ±Æ÷
	if sceneId == x888888_g_Jinghu_SceneId   then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 005116, "OnSceneTimer", 10000)
		end
	end

	--Í¨ÌìËþ¼ÆÊ±Æ÷
	if sceneId >= 581 and sceneId <= 585 then
              if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 402315, "JianCeSceneTimer",10000) 
                    end
	end

	--µÚÒ»¸ö½øÈëÅÝµã³¡¾°µÄÍæ¼Ò£¬¸ºÔðÆô¶¯ÐÂÊÖ¼¯ÊÐµÄ¼ÆÊ±Æ÷
	if sceneId == x888888_g_XinShou_SceneId then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 898989, "OnSceneTimer",20000)
		end
	end

	--µÚÒ»¸ö½øÈëº®Óñ´²³¡¾°µÄÍæ¼Ò£¬¸ºÔðÆô¶¯º®Óñ´²µÄ¼ÆÊ±Æ÷
	if sceneId == x888888_g_HanYuBed_SceneId then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 808072, "OnSceneTimer",30000)
		end
	end
	if sceneId == 62 or sceneId == 82 or sceneId == 182 then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 990010, "OnSceneTimer", 1000)
		end
	end

	-- Íæ¼Ò½øÈëPvp³¡¾°Ç°£¬¸ø¸öÎÞµÐ
	if 0 == isReconnect then
		local nSafeLevel = LuaFnGetSceneSafeLevel(sceneId)
		-- Íæ¼Ò½øÈë·Ç°²È«³¡¾°£¬¸ø¸öÎÞµÐBUFF
		if nSafeLevel < 10000  then
			if nSafeLevel == 10 then
				LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 5927, 100 )
			else
				LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 54, 100 )
			end
		end
	end

	-- ¸üÐÂ´ò½ÙÉÌÈËµÄÊý¾Ý
	CallScriptFunction( 311012, "UpdataDacoityData", sceneId, playerId )
end

--ÅÐ¶ÏÊÇ·ñÊÇ°ï»áÖ÷Á¦
function x888888_IsGuildVip( Guildpos  )
    if (   (Guildpos == GUILD_POSITION_CHIEFTAIN) 
	    or (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN)
	    or (Guildpos == GUILD_POSITION_HR)
	    or (Guildpos == GUILD_POSITION_INDUSTRY)
	    or (Guildpos == GUILD_POSITION_AGRI)
	    or (Guildpos == GUILD_POSITION_COM) 
	    or (Guildpos == GUILD_POSITION_ELITE_MEMBER) 
	   )then
        return 1;
		end
		return 0;
end


function x888888_OnSceneHumanDie( sceneId, selfId, killerId )
	
	CallScriptFunction( 890547, "CreateIanplayerDie",sceneId, selfId )
	--Íæ¼ÒËÀÍöºó½Å±¾ÊÂ¼þ
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --³¡¾°ÀàÐÍÊÇ¸±±¾
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --È¡µÃ½Å±¾ºÅ
		CallScriptFunction( copyscenescript, "OnHumanDie", sceneId, selfId, killerId )
	end
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		--ÔÚ´ËÖ®Ç°Ó¦¸Ã¼ì²âÊÇ·ñPVPËÀÍö
		--Èç¹ûÔÚäîÔËÊ±ËÀÍö
		CallScriptFunction( 311010, "OnHumanDie", sceneId, selfId, killerId )
		CallScriptFunction( 311012, "OnDacoity", sceneId, selfId, killerId )
	end

	if sceneId == 317    then 
	   CallScriptFunction((600053), "KillPlayer",sceneId, selfId, killerId)	
	end

        if sceneId == 549  then 
	    CallScriptFunction((600056), "KillPlayer",sceneId, selfId, killerId)	
	end
	
	--if sceneId == 185 then
	--	CallScriptFunction((002054), "OnDie",sceneId, selfId, killerId)
	--end	
	
	-- Èç¹ûÍæ¼ÒÏÖÔÚÊÇÔÚ»ªÉ½ÂÛ½£³¡¾°±»É±£¬hongyu£¬
	if sceneId == x888888_g_HS_PK_SceneId    then
		CallScriptFunction((001233), "OnSceneHumanDie",sceneId, selfId, killerId)
	end
	
	-- Èç¹ûÍæ¼ÒÊÇÔÚ ¾º¼¼³¡ ±»É±
	if sceneId == x888888_g_jingji_SceneId    then
		CallScriptFunction((125020), "OnSceneHumanDie",sceneId, selfId, killerId)
	end
	
        --Èç¹ûÍæ¼ÒÊÇÔÚ ËÎÁÉÕ½ÖÐ ±»É±
        if sceneId == 548  then 
                CallScriptFunction((300109), "OnSceneHumanDie",sceneId, selfId, killerId)
        end

	--°ï»áÕ½ÕùÇé¿ö
	if IsInGuildWar(sceneId, selfId, killerId) == 1 then
	
		local Guildpos = GetGuildPos(sceneId, selfId)
		if ( x888888_IsGuildVip(Guildpos)==1 ) then
			local selfName = GetName(sceneId, selfId);
			local guildName_self = LuaFnGetGuildName(sceneId, selfId);
			
			local killerName = GetName(sceneId, killerId);
			local guildName_killer = LuaFnGetGuildName(sceneId, killerId);
			
			local sMessage = format("@*;SrvMsg;GLD:#WB±n bang chü lñc #R%s#W — bang chiªn ðçm máu chiªn ð¤u hång hái, không ð¸ch lÕi #G%s#W cüa Bang hµi #R%s#W. Vì bang hµi anh dûng hiªn thân!", selfName, guildName_killer ,killerName);	
			BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
			
			sMessage = format("@*;SrvMsg;GLD:#R%s#W — bang chiªn ðÕi tri¬n thân thü, giªt chªt #G%s#W Bang hµi chü lñc #R%s#W, vë vang bäo v® bang hµi.", killerName, guildName_self, selfName);	
			BroadMsgByChatPipe(sceneId, killerId, sMessage, 4);
		end
		
	end

     if sceneType == 0 and GetLevel(sceneId, selfId) >= 85 then
	SetMissionData( sceneId, killerId, QUANQUSHAREN,GetMissionData( sceneId, killerId,QUANQUSHAREN)+1)	
	local mylevel =  GetMissionData(sceneId, killerId, QUANQUSHAREN)
	CallScriptFunction( (888899), "SetDengji", sceneId, killerId,mylevel,3 )
     end
end

--¿ÉÒÔÉý¼¶µÄÊÂ¼þ´¦Àíº¯Êý
function x888888_OnCanLevelup(sceneId, objId)
	local playerLevel = GetLevel(sceneId, objId)
	if playerLevel >= 10 and playerLevel <= 14 then
		LuaFnSendSystemMail(sceneId, GetName(sceneId, objId), "Các hÕ có th¬ m· #gfff0f0#WGiao di®n nhân v§t (¤n Alt + C)#g000000#W, ¤n vào #gfff0f0#WNút thång c¤p#g000000#W bên phäi phía dß¾i giao di®n là có th¬ tång ðÆng c¤p nhân v§t cüa các hÕ, ðß½ng nhiên các hÕ có th¬ lßu giæ kinh nghi®m, #gfff0f0#WH÷c t§p kÛ nång tÕi sß môn cüa mình #g000000#W")
	end
	if playerLevel >= 9 and GetMenPai(sceneId,objId) == 9 then
           CallScriptFunction( 070051,"XieziQuickly",sceneId,objId,8007)
	end
end

function x888888_OnSceneHumanLevelUp( sceneId, objId, level )

	if	IsHaveMission(sceneId,objId,718) > 0	 then
			misIndex = GetMissionIndexByID(sceneId,objId,718)
			SetMissionByIndex( sceneId, objId, misIndex, 1, level)
			if level >= 10 then
				SetMissionByIndex( sceneId, objId, misIndex, 0, 1)
			end
	end

--ÏàÓ¦µÈ¼¶·¢ËÍÓÊ¼þ
	if level > 1 then
		local looptime = 1
		local mailnum = x888888_g_MailNum[level][2]
		if mailnum > 0 then
			while looptime <= mailnum do
				--PrintStr("#{LevelMail_"..level.."_"..looptime.."}")
				LuaFnSendSystemMail( sceneId, GetName(sceneId,objId), "#{LevelMail_"..level.."_"..looptime.."}" )
				looptime = looptime + 1
				CallScriptFunction( (888899), "SetDengji", sceneId, objId,level,4 )
                                if level >= 90 then
				   CallScriptFunction( (014036), "SJ", sceneId, objId )
                                end
			end
		end
	end
	
	--Í½µÜÉýµ½45Ê±ºò£¬³öÊ¦ÉèÖÃ³öÊ¦±êÖ¾
	if LuaFnHaveMaster( sceneId, objId ) ~= 0  and level == 45 then
			SetMissionFlag(sceneId, objId, MF_ShiTu_ChuShi_Flag, 1)
	end
	
	--Í½µÜÉý¼¶¸øÊ¦¸¸³é½±µÄ»ú»á
	if level == 40 or level == 50 then
		--local stbegin = 7285; --10.12
		local stbegin = 7304; --11.01
		local stend		= 7325; --11.22
		local stprize = {[40]=40004432,[50]=40004433}
		local strtip	= {[40]="Danh hi®u",[50]="Danh hi®u ð£c bi®t"}
		
		local curDayTime = GetDayTime()
		local MasterGUID = LuaFnGetMasterGUID( sceneId, objId )
		
		if curDayTime >= stbegin and curDayTime <= stend and MasterGUID ~= -1 then
			if LuaFnHaveMaster( sceneId, objId ) ~= 0 then
				local MasterName = LuaFnGetFriendName( sceneId, objId, MasterGUID )
				--·¢ËÍÒ»·âÆÕÍ¨ÓÊ¼þ¸øÊ¦¸µ
				LuaFnSendSystemMail( sceneId, MasterName, "Ð° ð® cüa các hÕ "..GetName(sceneId,objId).." ðã thång c¤p thành công lên c¤p "..tostring(level)..". Hi®n tÕi Thiên Long Bát Bµ ðang có hoÕt ðµng #GTân binh ðoÕt bäo#W, các hÕ có th¬ dçn ð° ð® ðªn LÕc Dß½ng - Cüng Thái L® tham gia "..strtip[level].."." )
				--·¢ËÍÒ»·â½±ÀøÖ´ÐÐÓÊ¼þ¸øÊ¦¸µ
				LuaFnSendScriptMail( sceneId, MasterName, MAIL_SHITUPRIZE, level, stprize[level], 1)
				--·¢ËÍÏµÍ³¹«¸æ¸øÈ«ÊÀ½ç
				local uname = format("#{_INFOUSR%s}",GetName(sceneId,objId))
				local oname = format("#{_INFOUSR%s}",MasterName)
				local str = format("%s#P kinh l¸ch cØu cØu bát th§p nh¤t nan, chung qui thu§n lþi thång lên #Yc¤p %d#P. Hi®n tÕi Thiên Long Bát Bµ ðang trong th¶i gian hoÕt ðµng #GTân binh ðoÕt bäo#W, l¥n này sß phø %s#P ðßþc mµt c½ hµi tham gia #Y%s#P nh§n thß·ng!",uname,level,oname,strtip[level])
				BroadMsgByChatPipe(sceneId, objId, str, 4)
			end
		end
	end

	--2007Ê¥µ®Ôªµ©»î¶¯....Ï²´ÓÌì½µ»î¶¯....
	CallScriptFunction( 050022, "OnPlayerLevelUp", sceneId, objId )

	--Ê¦Í½×Ü¶¯Ô±
	CallScriptFunction( 806020, "OnPlayerLevelUp", sceneId, objId )
		
	-- ¸ø´ïµ½µÈ¼¶ÒªÇóµÄÍæ¼ÒÌí¼ÓÈÎÎñ
	-- [ QUFEI 2008-04-17 14:18 UPDATE BugID 33891 ]
	x888888_OnAutoAcceptMission( sceneId, objId, level )
	
	-- ¸øÂú×ãÍê³ÉÌõ¼þµÄÈÎÎñÉèÖÃÈÎÎñÍê³É±êÖ¾
	x888888_OnSetCompleteMission( sceneId, objId, level )
	
end

--Íæ¼Ò¸ü»»ÃÅÅÉ
function x888888_OnSceneHumanChangeMenpai( sceneId, objId, Menpai )
	if	IsHaveMission(sceneId,objId,719) > 0	 then
			misIndex = GetMissionIndexByID(sceneId,objId,719)
			if( Menpai >= 0 and Menpai < 9 ) then
			    SetMissionByIndex( sceneId, objId, misIndex, 1, 1)
			    SetMissionByIndex( sceneId, objId, misIndex, 0, 1)
			end
	end
end

function x888888_OnSceneNotify( sceneId, destsceneId )
--sceneId Îª¸±±¾Èë¿ÚËùÔÚ³¡¾°ID, destsceneIdÎª¸±±¾³¡¾°ID
--´Ëº¯ÊýÏìÓ¦µ÷ÓÃ±íÊ¾¸±±¾³¡¾°ÒÑ¾­³õÊ¼»¯Íê³É£¬¿ÉÒÔ´«ËÍÍæ¼ÒÁË

	destsceneType = LuaFnGetSceneType(destsceneId) ;

	if destsceneType == 1 then --³¡¾°ÀàÐÍÊÇ¸±±¾

		copyscenetype = LuaFnGetCopySceneData_Param(destsceneId,0) ;--È¡µÃ¸±±¾ºÅ
		copyscenescript = LuaFnGetCopySceneData_Param(destsceneId,1) ; --È¡µÃ½Å±¾ºÅ

		if copyscenetype==FUBEN_EXAMPLE then --Àý×Ó
			--Àý×Ó²»Ìá¹©³¡¾°Æô¶¯ÊÂ¼þ
			print("Không th¬ sØ døng phø bän này, chßa ðªn th¶i gian!")
		elseif copyscenetype==FUBEN_EXAMPLE then --
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7¼¶Ä¾ÈËÏï¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9¼¶Ä¾ÈËÏï¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG then --±ê×¼Ä¾ÈËÏï¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_SHUILAO then --Ë®ÀÎ¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_ZHENGLONG then --ÕôÁýÆå¾Ö¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_PVP_LEITAI then --ÀÞÌ¨¸±±¾
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		else
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		end
	end
end

-- ÎÊÂ·
function x888888_AskTheWay( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- ÎÊÂ·(×ø±ê)
function x888888_AskThePos( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- È¥µôÎÊÂ·±ê¼Ç
function x888888_DelSignpost( sceneId, selfId, sceneNum, npcName )
	Msg2Player( sceneId, selfId, "@*;flagNPCdel;" .. sceneNum .. ";" .. npcName, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPCdel;" .. sceneNum .. ";" .. npcName, MSG2PLAYER_PARA )
end

-- ²¥·ÅÒôÐ§£¬UICommandID = 1234
function x888888_PlaySoundEffect( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1234)
end

--ÈÎÎñ½ÓÊÜ¼ì²â
function x888888_OnAcceptMissionCheck( sceneId, selfId, missionScript )
	if GetMissionCount(sceneId, selfId)>=20 then
		BeginEvent(sceneId)
			strText = "ÈÎÎñÒÑÂú£¡"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end

	return 1
end

--Íæ¼Ò½ÇÉ«Ê±ÖÓÊÂ¼þ
function x888888_OnScenePlayerTimer( sceneId, selfId, nowtime )

        local EquipPos = GetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISSN);
        if EquipPos ~= 0 then
           EquipPos = EquipPos - 1
	   local CharmId = GetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS2);
	   if CharmId > 50000000 then
	      local bagpos01 = TryRecieveItem( sceneId, selfId, CharmId, 1 )
              if bagpos01 ~= -1 then
	         LuaFnItemBind( sceneId, selfId, bagpos01);
                 GemEnchasing( sceneId, selfId, bagpos01, EquipPos )
	         SetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS2,0);
              end
	   end
	   CharmId = GetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS);
	   if CharmId > 50000000 then
	      local bagpos01 = TryRecieveItem(sceneId,selfId,CharmId,1)
              if bagpos01 ~= -1 then
	         LuaFnItemBind( sceneId, selfId, bagpos01);
                 GemEnchasing( sceneId, selfId, bagpos01, EquipPos )
	         SetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISS,0);
              end
	   end
           SetMissionData(sceneId, selfId, MD_BIAOSHIIDFORU_MISSN,0)
           SetCharacterTimer( sceneId, selfId, 0 )
        end

	--Èç¹ûÓÐäîÔËÈÎÎñ
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		CallScriptFunction(311010, "OnPlayerCaoyunTimer",sceneId,selfId)
	else
		SetCharacterTimer(sceneId,selfId,0)
	end

end

--Íæ¼Ò½ÇÉ«µÇÂ½ÓÎÏ·ÊÂ¼þ, ´ËÊÂ¼þ»áÔÚÍæ¼Òµ÷ÓÃx888888_OnScenePlayerEnterÊÂ¼þÖ®ºóµ÷ÓÃ
function x888888_OnScenePlayerLogin( sceneId, selfId, nowtime )
	CallScriptFunction( 950000, "NhanQua", sceneId, selfId ) -- [NetCo4] qua tu panel admin
	---resetvip
	local strGUID = LuaFnGetGUID( sceneId, selfId )
	local danhan = GetMissionData(sceneId, selfId, VIP_SHENMI_SHOP )
	if strGUID >= 1010003010 then 
	if danhan ==1 then
	return
	end 
	if GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU) > 5 then
	SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,5)
	return
	end 
	SetMissionData(sceneId,selfId,CHONG_ZHI_YILINGQI,0)
	SetMissionData(sceneId, selfId, VIP_SHENMI_SHOP ,1)
	end
	
	
	
	
	for i=13000 ,32000 do 
    LuaFnCancelSpecificImpact(sceneId,selfId,i)
	end
	
	
	CallScriptFunction( 888890, "OnDefaultEvent", sceneId, selfId )
	CallScriptFunction( 892002, "AHa_ReMyBuff", sceneId, selfId )

	CallScriptFunction( 000045, "MyCallScript", sceneId, selfId,1 )
	CallScriptFunction( 000045, "MyCallScript", sceneId, selfId,2 )

        --Ë¢ÐÂ½ÚÈÕÅÐ¶ÏºÍÊ×³äÌáÊ¾
        CallScriptFunction( 888903, "HolidayCheck", sceneId, selfId )

       -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5974, 600 )  --·ÀÎÞÏÞ

	-- ÉèÖÃ³õÊ¼µÄNpc¹ØÏµÖµ
	CallScriptFunction( 200099, "InitRelation", sceneId, selfId )
	
	--ÔÚÎåÒ»ÆÚ¼ä·¢ÓÊ¼þ:ÎåÒ»ÁìÈ¡ÕÐÅÆ»î¶¯	--add by xindefeng
	CallScriptFunction( 808090, "OnPlayerLogin", sceneId, selfId )
	-- ÎåÒ»»î¶¯£¬·¢ËÍÓÊ¼þ
	CallScriptFunction( 808091, "OnPlayerLogin", sceneId, selfId )
	
	-- ³õÊ¼»¯¿Í»§¶ËµÇÂ½ÆÚµÄ½çÃæ²Ù×÷
	CallScriptFunction( 870001, "UISystemOnLogin", sceneId, selfId )
	
	-- Ê¦Í½×Ü¶¯Ô±£¬·¢ËÍÓÊ¼þ
	CallScriptFunction( 806020, "OnPlayerLogin", sceneId, selfId )	
	
	--ÀëÏß¾­ÑéÀ¡ÔùÈÎÎñ
	--CallScriptFunction( 500619, "CheckUnlineGift", sceneId, selfId )
	
	--µç»°ÃÜ±£µÄÓÊ¼þÌáÊ¾¡£²ß»®ÒªÇóÔÝÊ±¹Ø±ÕÓÊ¼þÌáÊ¾ by hukai #38665
	--CallScriptFunction( 210245, "SendMail", sceneId, selfId, nowtime )
	-- ÉèÖÃÍæ¼ÒÑ§»á¡°°ïÅÉÊÕ¼¯¡±¼¼ÄÜ
	if QueryHumanAbilityLevel(sceneId, selfId, 50) < 1 then
		SetHumanAbilityLevel(sceneId, selfId, 50, 1);
	end
	-- ÉèÖÃÍæ¼ÒÑ§»á°ïÕ½ÖÐ²É¿ó¼¼ÄÜ
	if QueryHumanAbilityLevel(sceneId, selfId, 51) < 1 then
		SetHumanAbilityLevel(sceneId, selfId, 51, 1);
	end	
	
	--ºÍÐ³¹â»·
	CallScriptFunction( 808124, "OnPlayerLogin", sceneId, selfId )
	
	--°µÆ÷ÌáÊ¾ÓÊ¼þ
	CallScriptFunction( 332207, "NotifyMailOnLogin", sceneId, selfId )

	x888888_AskDeleteMinorPasswordTime(sceneId, selfId) 
	-- ÓÞÈË½Ú»î¶¯£¬·¢Í¨¸æ
	CallScriptFunction( 808079, "OnPlayerLogin", sceneId, selfId )

	--ÃØ¼®
	CallScriptFunction( 890099, "ShuaXinMiJi", sceneId, selfId )

	--ÏÀÓ¡
        CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)

	--ÐÂÊÖ½±Àø
       -- CallScriptFunction((889103), "LonGameUse",sceneId, selfId)   ---- nhan qua online
	
	-- ÌìÁú¼ÎÄê»ª
	-- CallScriptFunction( 889055, "OnPlayerLogin", sceneId, selfId )

        CallScriptFunction((890536), "DLJianCe",sceneId, selfId)

	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId, selfId, 112, 500 )
	
  -- if GetCon( sceneId, selfId)  >= 199990 or GetMaxHp( sceneId, selfId )>=20000000 or GetMaxMp( sceneId, selfId ) >= 7000000 then
	--SetLevel( sceneId, selfId, 0)
	--BroadMsgByChatPipe( sceneId, selfId, "#BºÅÍâºÅÍâ,Íæ¼Ò#G"..GetName(sceneId, selfId ).."#BÊÇ¸öSBÀ´´Ë·þ¿¨¶«Î÷ÒÑ±»ÏµÍ³ÊÕÑºµ½Ð¡ºÚÎÝ", 4 )
	--LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId, selfId, 41, 0 )
  -- end
--x888888_KKGG_rm( sceneId, selfId )
   CallScriptFunction((402314),"SkillCheck",sceneId,selfId)

if QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHUZAO) <1 then
	SetHumanAbilityLevel(sceneId,selfId,ABILITY_ZHUZAO,1)
			SetPrescription( sceneId, selfId, 419, 1 )
			SetPrescription( sceneId, selfId, 420, 1 )
			SetPrescription( sceneId, selfId, 421, 1 )
			SetPrescription( sceneId, selfId, 422, 1 )
			SetPrescription( sceneId, selfId, 423, 1 )  --Õâ¸öÊÇÌÆÃÅÎäÆ÷
		---------------------------------------------------------
			SetPrescription( sceneId, selfId, 989, 1 )
			SetPrescription( sceneId, selfId, 990, 1 )
			SetPrescription( sceneId, selfId, 991, 1 )
			SetPrescription( sceneId, selfId, 992, 1 )
			SetPrescription( sceneId, selfId, 993, 1 )
			SetPrescription( sceneId, selfId, 994, 1 )  --ËýÄ½ÈÝ
			SetPrescription( sceneId, selfId, 995, 1 )
			SetPrescription( sceneId, selfId, 996, 1 )
			SetPrescription( sceneId, selfId, 997, 1 )
			SetPrescription( sceneId, selfId, 998, 1 )
			SetPrescription( sceneId, selfId, 999, 1 )  --ÌÆÃÅ
   end
end



--Íæ¼Ò´´½¨½ÇÉ«ºóµÚÒ»´ÎµÇÂ½ÓÎÏ·ÊÂ¼þ, ´ËÊÂ¼þ»áÔÚÍæ¼Òµ÷ÓÃx888888_OnScenePlayerEnterÊÂ
--¼þÖ®ºó¡¢x888888_OnScenePlayerLoginÊÂ¼þÖ®Ç°µ÷ÓÃ
function x888888_OnScenePlayerFirstLogin( sceneId, selfId, nowtime )
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "cô nß½ng"
	else
		PlayerSex = "thiªu hi®p"
	end
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{DLYJ_081009_01}"..PlayerName..PlayerSex.."#{DLYJ_081009_02}" )
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#e00f000Nh¡c nhö: #e000000#r#rBän ð° nhö · góc trên bên phäi hi¬n th¸ #GToÕ ðµ#W hi®n tÕi cüa các hÕ. #Y„n chuµt phäi#W và giæ nguyên r°i d¸ch chuy¬n sang hai bên là có th¬ xoay tròn, ¤n chuµt trái có th¬ hành t¦u. #Y„n chuµt phäi#W giæ cho chuy¬n ðµng sang trái phäi, có th¬ xoay chuy¬n hi¬n th¸ góc nhìn. #YVòng tròn trên con chuµt#W di chuy¬n t¾i lui trß¾c sau, có th¬ ði«u chïnh t¥m nhìn xa hay g¥n. #GALT+HOME/END#W#Y có th¬ thay ð±i góc nhìn#W." )
	SetMissionData(sceneId,selfId,449,5000)
	CallScriptFunction( 808065, "SendMail", sceneId, selfId )
        YuanBao(sceneId,selfId,targetId,1,200)	-- ¼ÓÔª±¦
     if true then -- [NetCo4 30/09] bo kiem tra chong hack (cap<100, HP<20tr, KNB<500): server ban be, cap toi thieu 119 lam nguoi moi bi chui SB + ve cap 0 + mat tui tan thu
	--x888888_KKGG_rm( sceneId, selfId )
	--ÐÂÊÖÉÏÏßÔùËÍÒ»¸öÐÂÀ¶¹â»·
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 8000, 0)

	ItemID ={10100100,10101100,10102100,10103100,10104100,10105100}
	i=random(1,6)
	BeginAddItem(sceneId)

	--ËÍ¸øÍæ¼ÒÒ»¸ö½­ºþ¸ÉÀ¤´ü
	local WorldReferenceID = 10155001
	local WorldReferenceID1 = 10141030
	local WorldReferenceID2 = 10141040
	local WorldReferenceID3 = 30501319
	local WorldReferenceID4 = 30008014
	local WorldReferenceID5 = 30503186
	local WorldReferenceID6 = 30008066
        local WorldReferenceID7 = 30008066
        local WorldReferenceID8 = 30008066
	local DenglongID = 30505162
	local DenglongID2 = 30008080
	local UniverseBagID = 30008059
	AddItem( sceneId, WorldReferenceID, 1 )
	AddItem( sceneId, WorldReferenceID1, 1 )
	AddItem( sceneId, WorldReferenceID2, 1 )
	AddItem( sceneId, WorldReferenceID3, 1 )
	AddItem( sceneId, WorldReferenceID4, 1 )
	AddItem( sceneId, WorldReferenceID5, 1 )
	AddItem( sceneId, WorldReferenceID6, 1 )
       -- AddItem( sceneId, WorldReferenceID7, 1 )
       -- AddItem( sceneId, WorldReferenceID8, 1 )
		LuaFnItemBind( sceneId, selfId,WorldReferenceID6)
		--LuaFnItemBind( sceneId, selfId,WorldReferenceID7)
		--LuaFnItemBind( sceneId, selfId,WorldReferenceID8)
		LuaFnItemBind( sceneId, selfId,WorldReferenceID4)
	AddItem( sceneId, UniverseBagID, 1 )
	AddItem( sceneId, DenglongID2, 1 )
	local nowYear = GetTodayYear();
	local nowMonth = GetTodayMonth();
	local nowDate = GetTodayDate();
	if (nowYear == 2008) then
		if(nowMonth==0) then
			if(nowDate>=16 and nowDate<=27) then
				AddItem( sceneId, DenglongID, 1 )
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{TQLQ_20071218_01}" )
			end
		end
	end
	AddItem( sceneId,ItemID[i],1)
	EndAddItem(sceneId,selfId)
	AddItemListToHuman(sceneId,selfId)
	else
	--[NetCo4 30/09] SetLevel( sceneId, selfId, 0)	  --ÐÞ¸Ä½ÇÉ«µÈ¼¶
	--[NetCo4 30/09] BroadMsgByChatPipe( sceneId, selfId, "#BºÅÍâºÅÍâ,Íæ¼Ò#G"..GetName(sceneId, selfId ).."#BÊÇ¸öSBÀ´´Ë·þ¿¨Ôª±¦ÒÑ±»ÏµÍ³ÊÕÑºµ½Ð¡ºÚÎÝ", 4 )
	--[NetCo4 30/09] LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId, selfId, 41, 0 )
     end
	--Ôö¼ÓÁìÈ¡¸ÉÀ¤´ü±êÖ¾
	SetMissionFlag(sceneId, selfId, MF_GetQianKunDai, 1)

	AddMission( sceneId,selfId, 718, 210238, 0, 0, 0 )

	SetMissionData( sceneId, selfId, MD_RELATION_QIANHONGYU, 500 )	-- ÉèÖÃºÍÇ®ºêÓîµÄ³õÊ¼¹ØÏµ

	--Ë«ÏìÅÚÌáÊ¾ÓÊ¼þ....
	CallScriptFunction( 808075, "OnPlayerFirstLogin", sceneId, selfId )
	
end

-- Í³Ò»×öÒ»¸ö¼ì²é
function x888888_CheckSubmit( sceneId, selfId, missionId )
	local bHave = IsHaveMission( sceneId, selfId, missionId )
	local bHaveDone = IsMissionHaveDone( sceneId, selfId, missionId )

	-- Ã»ÓÐ½Ó
	if bHave <= 0 then
		return 0
	end

	-- ÒÑ¾­Íê³É¹ý
	if bHaveDone >= 1 then
		return 0
	end

	return 1
end

-- ³¡¾°ÖÐµÄ½ÇÉ«¿ªÆô³ðÉ±
function x888888_OnScenePlayerOpenRevenge(sceneId, openerGUID, targetGUID)
	LuaFnSendMailToGUID(sceneId, openerGUID, "Các hÕ ðã tuyên chiªn v¾i ð¯i phß½ng!")
	LuaFnSendMailToGUID(sceneId, targetGUID, "Hành t¦u giang h°, ð×ng gây chuy®n sinh sñ, có ngß¶i ð® ð½n giªt ngß½i, ðã ðßþc phê chu¦n. Giai ðoÕn này ngß½i phäi chú ý an toàn thì t¯t h½n!")
	return 1
end

-- ³¡¾°ÖÐµÄ½ÇÉ«¹Ø±Õ³ðÉ±
function x888888_OnScenePlayerCloseRevenge(sceneId, openerGUID, targetGUID)
	LuaFnSendMailToGUID(sceneId, openerGUID, "Các hÕ ðã kªt thúc tuyên chiªn v¾i ð¯i phß½ng!")
	LuaFnSendMailToGUID(sceneId, targetGUID, "Ý mu¯n tuyên chiªn cüa các hÕ ðã d×ng lÕi!")

	return 1
end

function x888888_PlayBackSound( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 124)
end

function x888888_StopBackSound( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 125)
end

-- Ò»ÏÂÊÇ¿ª·Å¸ø²ß»®Ê¹ÓÃµÄÓÃ½Å±¾Ó°ÏìÍæ¼ÒµÄHP¡¢MP¡¢Vigor¡¢VigorRegenerate¡¢Energy¡¢EnergyRegenerateÊôÐÔ×î´óÖµ
-- Hp×î´óÖµÐÞÕý
function x888888_MaxHpRefix( sceneId, selfId )
  local nValue = 0
  local nAbilityID = 40 --Ó°ÏìHP×î´óÖµµÄÉú»î¼¼ÄÜµÄID
  local nMulti = 1 --HP×î´óÖµµÃÓ°ÏìÏµÊý
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end

-- Mp×î´óÖµÐÞÕý
function x888888_MaxMpRefix( sceneId, selfId)
  local nValue = 0
  local nAbilityID = 41 --Ó°ÏìMP×î´óÖµµÄÉú»î¼¼ÄÜµÄID
  local nMulti = 1 --MP×î´óÖµµÃÓ°ÏìÏµÊý
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- Vigor×î´óÖµÐÞÕý
function x888888_MaxVigorRefix( sceneId, selfId)
  local nValue = 0
  local nAbilityID = 42 --Ó°ÏìVigor×î´óÖµµÄÉú»î¼¼ÄÜµÄID
  local nMulti = 1 --HP×î´óÖµµÃÓ°ÏìÏµÊý
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- VigorRegenerateÖµÐÞÕý
function x888888_VigorRegenerateRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 44 --Ó°ÏìVigorRegenerateÖµµÄÉú»î¼¼ÄÜµÄID
  local nMulti = 1 --HP×î´óÖµµÃÓ°ÏìÏµÊý
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- Energy×î´óÖµÐÞÕý
function x888888_MaxEnergyRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 43 --Ó°ÏìEnergy×î´óÖµµÄÉú»î¼¼ÄÜµÄID
  local nMulti = 1 --Energy×î´óÖµµÃÓ°ÏìÏµÊý
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- EnergyRegenerateÖµÐÞÕý
function x888888_EnergyRegenerateRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 45 --Ó°ÏìEnergyRegenerateÖµµÄÉú»î¼¼ÄÜµÄID
  local nMulti = 1 --HP×î´óÖµµÃÓ°ÏìÏµÊý
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end

function x888888_OnPlayerPickupItemFromDropBox(sceneId, selfId, itemId, bagidx, bGem)

	local playerName = GetName(sceneId, selfId)
	local itemName = GetItemName(sceneId, itemId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)

	-- ¹ÅÄ¹ ×°±¸µôÂäµÄÊÀ½ç¹«¸æ
--	if itemId == 10401002 or
--		 itemId == 10401003 or
--		 itemId == 10401004 or
--		 itemId == 10403002 or
--		 itemId == 10403003 or
--		 itemId == 10403004 or
--		 itemId == 10405001 or
--		 itemId == 10405002 or
--		 itemId == 10405003 or
		 
--		 itemId == 10404002 or
--		 itemId == 10404003 or
--		 itemId == 10404004    then
		
--		CallScriptFunction( 212220, "ItemBulletin", sceneId, selfId, itemId, bagidx, bGem ) ;
		
--	end
	
	-- ¼ñµ½ÁúÖéµÄÊÀ½ç¹«¸æ
	if itemId == 30505136 or
		 itemId == 30505137 or
		 itemId == 30505138 or
		 itemId == 30505139 or
		 itemId == 30505140 or
		 itemId == 30505141 or
		 itemId == 30505142    then
		
		CallScriptFunction( 808058, "PlayerPickUpLongZhu", sceneId, selfId, bagidx ) ;
		
	end
	
	--»ñµÃÌ«ÑôËéÆ¬¹«¸æ....
	if itemId == 30505120 then
		CallScriptFunction( 210242, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end
	
	--»ñµÃ¶ëÃ¼¼¼ÄÜ
	if itemId == 30070501  or itemId == 39910001 or itemId == 39910002 or itemId == 39910003 or itemId == 39910004 or itemId == 39910005 then
	message = format("#{_INFOUSR%s} trong lúc c£m cøi løc tìm trong ð¯ng rác, b²ng t× ðâu lóe lên mµt tia sáng, mµt t¶ #{_INFOMSG%s} xu¤t hi®n, li«n m×ng rÞ bö vào túi!", playerName, transfer );
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end
	if itemId == 30307222  or itemId == 30307223 or itemId == 30307224 or itemId == 30307225 or itemId == 30307226 or itemId == 30307227 or itemId == 30307228 or itemId == 30307229 or itemId == 30307230 or itemId == 30307231 or itemId == 30307232 or itemId == 30308137 then
	message = format("#{_INFOUSR%s} cùng ðµi ngû quyªt chiªn tÕi Tàng Kinh Các, Thiªu Lâm thoát nÕn, ðây #{_INFOMSG%s} các tång nhân trong tñ t£ng cho ngß½i!", playerName, transfer );
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end
	if itemId == 30307200  or itemId == 30307201 or itemId == 30307202 or itemId == 30307203 or itemId == 30307204 or itemId == 30307205 or itemId == 30307206 or itemId == 30307207 or itemId == 30307208 or itemId == 30307209 or itemId == 30307210 or itemId == 30308135 then
	message = format("#{_INFOUSR%s} cùng ðµi ngû giúp sÑc môn phái ðánh bÕi Ác Bá, trong lúc bö chÕy Ác Bá ðã ðánh r½i mµt quy¬n #{_INFOMSG%s} xu¯ng ð¤t !", playerName, transfer );
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end
	if itemId == 30307211  or itemId == 30307212 or itemId == 30307213 or itemId == 30307214 or itemId == 30307215 or itemId == 30307216 or itemId == 30307217 or itemId == 30307218 or itemId == 30307219 or itemId == 30307220 or itemId == 30307221 or itemId == 30308136 then
	message = format("#{_INFOUSR%s} cùng ðµi ngû phøng m®nh tri«u ðình tiêu di®t boss map, ðµt nhiên t× ðâu xu¤t hi®n mµt quy¬n #{_INFOMSG%s} làm khu¤y ðµng giang h°, võ lâm ðÑng ng°i không yên! ", playerName, transfer );
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end
	if itemId == 20310185  or itemId == 20310186 or itemId == 20310187 or itemId == 20310188 or itemId == 20310189 or itemId == 20310174  then
	message = format("#{_INFOUSR%s} Träi qua bao công sÑc lên r×ng xu¯ng bi¬n, trèo ðèo lµi su¯i, ån sß½ng n¢m gió, hít không khí s¯ng qua ngày thì cu¯i cùng cûng tìm ðßþc  #{_INFOMSG%s} Xin chúc m×ng!", playerName, transfer );
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end
	if itemId == 30308043 and sceneId == 25 then

		local TeammateCount = GetTeamMemberCount( sceneId, selfId );
		local sNameBroad = playerName;


		local randMessage = random(3);
		if randMessage == 1 then
	   		message = format("#{JinGang_00}#W#{_INFOUSR%s}#P#{JinGang_01}#W#{_INFOUSR%s}#P#{JinGang_02}#{_INFOMSG%s}¡£", sNameBroad, sNameBroad, transfer );
		elseif randMessage == 2 then
			message = format("#{JinGang_03}#W#{_INFOUSR%s}#P#{JinGang_04}#{_INFOMSG%s}#P#{JinGang_05}", sNameBroad, transfer );
		else
			message = format("#{JinGang_06}#W#{_INFOUSR%s}#P#{JinGang_07}#W#{_INFOUSR%s}#P#{JinGang_08}#{_INFOMSG%s}#P#{JinGang_09}", sNameBroad, sNameBroad, transfer );
		end
		BroadMsgByChatPipe(sceneId, selfId, message, 4);

		return 0;
	end
	--»ñµÃÉÙÁÖ¼¼ÄÜ
	if itemId == 30308045 and sceneId == 32 then

		local TeammateCount = GetTeamMemberCount( sceneId, selfId );
		local sNameBroad = playerName;

		local randMessage = random(3);
		if randMessage == 1 then
	   		message = format("#{JinGang_10}#W#{_INFOUSR%s}#P#{JinGang_11}#W#{_INFOUSR%s}#P#{JinGang_12}#{_INFOMSG%s}#P#{JinGang_13}", sNameBroad, sNameBroad, transfer );
		elseif randMessage == 2 then
			message = format("#{JinGang_14}#W#{_INFOUSR%s}#P#{JinGang_15}#W#{_INFOUSR%s}#P#{JinGang_16}#{_INFOMSG%s}#P#{JinGang_17}", sNameBroad, sNameBroad, transfer );
		else
			message = format("#{JinGang_18}#W#{_INFOUSR%s}#P#{JinGang_19}#{_INFOMSG%s}#P#{JinGang_20}", sNameBroad, transfer );
		end
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end

	--¾µºþÇ§Äê²Ý
	if itemId == 40004414 then
		local nCurTime = LuaFnGetCurrentTime()
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
		SetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2, nCurTime )
		return 0;
	end

	--07Ê¥µ®Ôªµ©»î¶¯....
	--Ê¥µ®ÊØÒ¹»î¶¯....ÂåÑôÑ©ÈËÉ¢Âä±¦ÏäÊ°È¡¹«¸æ....
	local bSend = 0
	if sceneId == 0 then
		bSend = CallScriptFunction( 050023, "OnPlayerPickUpItemInLuoyang", sceneId, selfId, itemId, bagidx )
	end
	if bSend == 1 then
		return
	end

	--º®Óñ´²±¦ÏäÊ°È¡¹«¸æ....
	if sceneId == x888888_g_HanYuBed_SceneId and bGem == 3 then
		CallScriptFunction( 808072, "OnPlayerPickUpItemInHanYuBed", sceneId, selfId, itemId, bagidx )
	end


	--ÄêÊÞµÃÎïÆ·¹«¸æ....
	if sceneId == x888888_g_NianShou_SceneId then
		CallScriptFunction( 050052, "OnPlayerPickUpItemInNianShou", sceneId, selfId, itemId, bagidx )
	end
	
	--Ê¥ÊÞÉ½»ñµÃÒ°ÖíÍõ×Ù¼£¹«¸æ....
	--[ QUFEI 2008-04-16 14:38 UPDATE BugID 31936 ]
	if itemId == 40004429 then
		CallScriptFunction( 808066, "OnPlayerPickUpItemInBoar", sceneId, selfId, itemId, bagidx ) ;
	end
	
	
	local str
	if bGem == 1 then
		local a = { "#W#{_INFOUSR%s}#cffffcc trong lúc m· Bäo Sß½ng ðã l¤y ðßþc 1 miªng#W#{_INFOMSG%s}. ",
								"#W#{_INFOUSR%s}#cffffcc trong lúc chu¦n b¸ ðóng thùng Bäo Sß½ng lÕi phát hi®n trong g¯c thùng có 1 miªng#W#{_INFOMSG%s}. ",
								"#W#{_INFOUSR%s}#cffffcc dùng chân ðá vào Bäo Sß½ng, b²ng 1 miªng#W#{_INFOMSG%s} r½i ra ngoài."
							}
		local index = random(getn(a))
		str = format(a[index], playerName, transfer)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)

	elseif  bGem == 2 then

		--µ±Íæ¼Ò»ñµÃ35¼¶ÐÄ·¨ÃØ¼®¼°65¼¶Îä¹¦ÃØ¼®£¬»áÔÚÊÀ½ç¹«¸æ
		local bFlag = 0;
		--for i = 0, 8 do
		--	if ( x888888_MenPaiBroadMsg[ i ].XinFa == itemId ) or ( x888888_MenPaiBroadMsg[ i ].MiJi == itemId ) then
		--		bFlag = 1;
		--		break;
		--	end
		--end

		if bFlag > 0 then

			local TeammateCount = GetTeamMemberCount( sceneId, selfId )
			local sTeamLeaderName = playerName;
			for i=0, TeammateCount-1 do
				TeammateID = GetNearTeamMember( sceneId, selfId, i )
				if LuaFnIsTeamLeader( sceneId, selfId ) then
					sTeamLeaderName = GetName(sceneId, selfId);
					break;
				end
			end

			local mp = LuaFnGetCopySceneData_Param(sceneId, 11);
			local mpName = x888888_MenPaiBroadMsg[mp].mp;

			local message;

			local randMessage = random(3);

			if randMessage == 1 then
	   			message = format("#W#{_INFOUSR%s}#P#{DropItem_00}#G%s#P#{DropItem_01}#Y%s#P#{DropItem_02}#{_INFOMSG%s}#P#{DropItem_03}", sTeamLeaderName, mpName, mpName, transfer );
			elseif randMessage == 2 then
				message = format("#{DropItem_04}#G%s#P#{DropItem_05}#W#{_INFOUSR%s}#P#{DropItem_06}#{_INFOMSG%s}#P#{DropItem_07}", mpName, sTeamLeaderName, transfer );
			else
				message = format("#{DropItem_08}#G%s#P#{DropItem_09}#W#{_INFOUSR%s}#P#{DropItem_10}#{_INFOUSR%s}#P#{DropItem_11}#{_INFOMSG%s}#P#{DropItem_12}", mpName, sTeamLeaderName,sTeamLeaderName, transfer );
			end
			BroadMsgByChatPipe(sceneId, selfId, message, 4);
		end

	elseif bGem == 0 then

		local a = { "#W#{_INFOUSR%s}#cffffcc trong lúc m· Bäo Sß½ng ðã l¤y ðßþc #W#{_INFOMSG%s}. ",
								"#W#{_INFOUSR%s}#cffffcc phát hi®n trong g¯c thùng Bäo Sß½ng có 1 t¤m #W#{_INFOMSG%s} cû nát.",
								"#W#{_INFOUSR%s}#cffffcc l§t ngßþc Bäo Sß½ng lÕi, phát hi®n 1 t¤m #W#{_INFOMSG%s}#cffffcc dán dß¾i ðáy thùng Bäo Sß½ng."
							}
		local index = random(getn(a))
		str = format(a[index], playerName, transfer)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
	elseif bGem == 3 then
		
		--¼¼ÄÜÊé±¦Ïä¹«¸æ
		local	rnd	= random( 3 )
		local	msg	= nil
		local	fnd	= 0
		local	lst	=
		{
			30402012, 30402014, 30402016, 30402018, 30402020, 
			30402025, 30402026, 30402029, 30402030, 30402033, 
			30402034, 30402035, 30402036, 30402037, 30402038, 
			30402039, 30402040, 30402041, 30402042, 30402043, 
			30402044, 30402045, 30402046, 30402047, 30402048, 
			30402049, 30402050, 30402051, 30402052, 30402053, 
			30402054, 30402055, 30402056, 30402059, 30402060, 
			30402061, 30402062, 30402063, 30402064, 30402065, 
			30402066, 30402067, 30402068, 30402069, 30402070, 
			30402072, 30402073, 30402074, 30402075, 30402076, 
			30402077, 30402078, 30402079, 30402080, 30402081, 
			30402082, 30402083, 30402084, 30402085, 30402086, 
			30402087, 30402088, 30402089, 30402090,	
		}
		for i = 1, getn( lst ) do
			if lst[ i ] == itemId then
				fnd		= 1
				break
			end
		end
		if fnd == 1 then
			if rnd == 1 then
		   	msg	= format( "#W#{_INFOUSR%s}#I trong lúc m· Bäo Sß½ng ðã l¤y ðßþc 1 quy¬n #W#{_INFOMSG%s}.",
		   					playerName, transfer )
			elseif rnd == 2 then
				msg	= format( "#W#{_INFOUSR%s}#I trong lúc chu¦n b¸ ðóng thùng Bäo Sß½ng lÕi phát hi®n trong g¯c thùng có 1 quy¬n #W#{_INFOMSG%s} cû nát.",
								playerName, transfer )
			else
				msg	= format( "#W#{_INFOUSR%s}#I dùng chân ðá vào Bäo Sß½ng, phát hi®n mµt quy¬n #W#{_INFOMSG%s}#I dán tÕi ðáy hòm.",
								playerName, transfer )
			end
			BroadMsgByChatPipe( sceneId, selfId, msg, 4 )
			return
		end

	end
	
	-- ñÒÉÙÎ¢£¬2008.6.10¡£ÊøºÓ¹ÅÕò420£¬ÏûÃðËªÓ°BOSSÍ³¼Æ...
	if sceneId == 420 then
		CallScriptFunction( 808040, "OnPlayerPickUpItemFromShangyingBoss", sceneId, selfId, itemId, bagidx )
	end
	
	--»Æ½ðÖ®Á´
	if itemId == 40004453 then
		CallScriptFunction( 050220, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end
	
	--Ðþ·ðÖé
	if itemId == 40004454 then
		CallScriptFunction( 050221, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end

end

--¶ÔÈÎÎñ¿ÉÓÃÐÔ½øÐÐ¼ì²â
function x888888_Check_MissionAvailable(sceneId, playerId, missionId)
	--//////////////////////////////////////////////////////////
	--ÈÎÎñÁ´¿ÉÓÃÐÔ¼ì²â
	local renwulianMissionId = 1202
	if missionId == renwulianMissionId then
	if IsHaveMission(sceneId, playerId, renwulianMissionId) > 0 then
		local MissionType = {wenhou=1, suoqu=2, fubenjiaoxun=3, fubenduowu=4, chongwu=5}
		local misIndex = GetMissionIndexByID(sceneId, playerId, renwulianMissionId)
		local missionType = GetMissionParam(sceneId, playerId, misIndex, 1)

		local bAvailable = 1
		if missionType == MissionType.wenhou then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 5)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..wenhou..npcId=" .. tostring(npcId))
				bAvailable = 0
			end
		elseif missionType == MissionType.suoqu then
			local itemId = GetMissionParam(sceneId, playerId, misIndex, 5)
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 6)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) or
				 0 == CheckItemAvailable(sceneId, playerId, itemId)	then
						 MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..suoqu..npcId=" .. tostring(npcId)
					 .. ",itemId=" .. tostring(itemId))
				 bAvailable = 0
			end
		elseif missionType == MissionType.chongwu then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 6)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
				bAvailable = 0
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..chongwu..npcId=" .. tostring(npcId))
			end
		elseif missionType == MissionType.fubenjiaoxun then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 5)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..fubenjiaoxun..npcId=" .. tostring(npcId))
				bAvailable = 0
			end
		end
		-- Èç¹û²»¿ÉÓÃÔòÉ¾³ý
		if 0 == bAvailable then
			DelMission(sceneId, playerId, renwulianMissionId)
		end
	end
	end
	--//////////////////////////////////////////////////////////

	--Add other code ...
	local xingxiuMissionId = 1095
	if missionId == xingxiuMissionId then
		if IsHaveMission(sceneId, playerId, xingxiuMissionId) > 0 then
			local bAvailable = 1
			local MissionType = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8,  killMonster=9}
			local misIndex = GetMissionIndexByID(sceneId, playerId, xingxiuMissionId)
			local missionType = GetMissionParam(sceneId, playerId, misIndex, 1)
			if missionType == MissionType.XunWu then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 5)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.XunWu..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.XunWu..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			elseif missionType == MissionType.KaiGuang then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 6)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.KaiGuang..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.KaiGuang..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			elseif missionType == MissionType.ShouJi then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 6)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.ShouJi..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.ShouJi..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			end
			if bAvailable == 0 then
				DelMission(sceneId, playerId, xingxiuMissionId)
			end
		end
	end

end

function x888888_OnAcceptCheck( sceneId, objId, level )

	-- ÈÎÎñÊÇ·ñÒÑÂú
	if IsMissionFull( sceneId, objId ) == 1 then
		return 0
	end

	local missioninfo = x888888_g_AutoAccept_MissionList[level]
	--¼ì²âµÈ¼¶
	if not missioninfo then
		return 0
	end

	--ÒÑ¾­½Ó¹ýÔò²»·ûºÏÌõ¼þ
	if IsHaveMission( sceneId, objId, missioninfo.MissionId ) > 0 then
		return 0
	end

	--ÒÑ¾­×ö¹ýÔò²»·ûºÏÌõ¼þ
	if IsMissionHaveDone(sceneId, objId, missioninfo.MissionId) > 0   then
		return 0
	end

	--¼ì²âÇ°ÐøÈÎÎñ
	if missioninfo.PreMissionId > 0 then
		if IsMissionHaveDone(sceneId, objId, missioninfo.PreMissionId) <= 0   then
			return 0
		end
	end
	
	return 1
end

function x888888_OnAutoAcceptMission( sceneId, objId, level )

	-- ¼ì²âÈÎÎñ½ÓÊÜÌõ¼þ
	if x888888_OnAcceptCheck( sceneId, objId, level ) > 0 then
		local missioninfo = x888888_g_AutoAccept_MissionList[level]

		if missioninfo ~= nil then
			local ret = AddMission( sceneId, objId, missioninfo.MissionId, missioninfo.MissionIndex, missioninfo.pKill, missioninfo.pArea, missioninfo.pItem )	-- kill¡¢area¡¢item
			if ret == 1 and missioninfo.EventId ~= 0 then
				SetMissionEvent( sceneId, objId, missioninfo.MissionId, missioninfo.EventId )
			end
		end
	end
end

function x888888_OnCompleteCheck( sceneId, objId, level )

	local missioninfo = x888888_g_FullLevel_MissionList[level]
	--¼ì²âµÈ¼¶
	if not missioninfo then
		return 0
	end

	if IsHaveMission( sceneId, objId, missioninfo.MissionId ) <= 0 then
		return 0
	end

	-- ÊÇ·ñ´ïµ½ÐèÇóµÈ¼¶
	local Playerlvl = LuaFnGetLevel( sceneId, objId )
	if Playerlvl < missioninfo.LevelLimit then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,objId,missioninfo.MissionId)

	-- ¼ì²âÈÎÎñÊÇ·ñÍê³É	
	if GetMissionParam(sceneId, objId, misIndex, missioninfo.CompleteIdx) <= 0 then
		return 1
	end
	
	return 0
	
end

function x888888_OnSetCompleteMission( sceneId, objId, level )

	-- ¼ì²âÈÎÎñÍê³ÉÌõ¼þ
	if x888888_OnCompleteCheck( sceneId, objId, level ) > 0 then
		local missioninfo = x888888_g_FullLevel_MissionList[level]
		
		if missioninfo ~= nil then

			local misIndex = GetMissionIndexByID(sceneId,objId,missioninfo.MissionId)
			SetMissionByIndex( sceneId, objId, misIndex, missioninfo.CompleteIdx, 1 )
			SetMissionByIndex( sceneId, objId, misIndex, missioninfo.RecordIdx, 1 )
			
			BeginEvent( sceneId )
				AddText( sceneId, missioninfo.MsgStr )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, objId )
		end
	end

end

-- ¸üÐÂÍæ¼ÒµÄÊý¾Ý£¬ÓÃÓÚÔÚ½Å±¾ÀïÐÞ¸ÄÍæ¼ÒÊý¾Ý£¬È»ºóÔÚServer³ÌÐòÀïÓÃµÄÇé¿ö
function x888888_UpdatePlayerData(sceneId, playerId)
	-- ¸üÐÂ°µÆ÷£¨·¨±¦£©N±¶¾­Ñé×´Ì¬
	CallScriptFunction( 332207, "CalcDarkMultiExpRate", sceneId, playerId ) ;
	
end


-- µ±Íæ¼ÒµÄ°µÆ÷Éý¼¶Ê±»áµ÷ÓÃµÄº¯Êý
function x888888_OnDarkLevelUp(sceneId, playerId, levelaftlevel)
	
	--ÏÔÊ¾°µÆ÷Éý¼¶ÌØÐ§
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
	
	--ºóÐø¹¦ÄÜÌí¼Ó
	
end

function x888888_AskDeleteMinorPasswordTime(sceneId, playerId)
	local lefttime = LuaFnGetPasswordDeleteRemainTime(sceneId, playerId)
	if lefttime >= 0 then	
		LuaFnSendSystemMail( sceneId, GetName(sceneId,playerId), "#{SMTX_090309_1}"..tostring(lefttime).."#{SMTX_090309_2}" )
	end
end



function x888888_KKGG_rm( sceneId, selfId )
    BeginUICommand( sceneId )
	UICommand_AddString(sceneId,"#gFF0FA¸üÐÂ¹«¸æ")
	UICommand_AddString(sceneId," ")  --Õâ¸ö½Ó¿Ú±ð³¬¹ý480¸ö×Ö·û
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20151024)	
end	

