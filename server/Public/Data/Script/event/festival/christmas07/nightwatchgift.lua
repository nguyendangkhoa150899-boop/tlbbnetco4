--2007Ê¥µ®Ôªµ©»î¶¯....
--Ê¥µ®ÊØÒ¹»î¶¯....

--»î¶¯½Å±¾....

--±¾»î¶¯ÐèÒª±£Ö¤·þÎñÆ÷ÖØÆôºóÑ©ÈËÈÔÈ»´æÔÚ....²¢ÇÒÊÇÕýÈ·´óÐ¡µÄÑ©ÈË....
--ActivityNotice.txtÖÐÅäÖÃÁËÔÚ»î¶¯Ê±¼äÄÚ·þÎñÆ÷ÖØÆôÒ²»áµ÷ÓÃ±¾½Å±¾À´Æô¶¯»î¶¯....


--½Å±¾ºÅ
x050023_g_ScriptId	= 050023

--Ñ©ÈËNPC½Å±¾....
x050023_g_SnowManScriptId	= 050027

--Ñ©ÈË×ø±ê....
x050023_g_SnowManX = 160
x050023_g_SnowManY = 114

x050023_g_SnowEndTime = 73100
--Ñ©ÈË×ÊÔ´±í....
x050023_g_SnowMan = {
--begin modified by zhangguoxin 090207
	--[1]  = { ID = 3870, HourTime = 72348, BallCount = -1   },
	--[2]  = { ID = 3871, HourTime = 72352, BallCount = 100  },
	--[3]  = { ID = 3872, HourTime = 72356, BallCount = 160  },
	--[4]  = { ID = 3873, HourTime = 72360, BallCount = 250  },
	--[5]  = { ID = 3874, HourTime = 72364, BallCount = 350  },
	--[6]  = { ID = 3875, HourTime = 72368, BallCount = 500  },
	--[7]  = { ID = 3876, HourTime = 72372, BallCount = 700  },
	--[8]  = { ID = 3877, HourTime = 72376, BallCount = 900  },
	--[9]  = { ID = 3878, HourTime = 72380, BallCount = 1150 },
	--[10] = { ID = 3879, HourTime = 72384, BallCount = 1400 },
	--[11] = { ID = 3880, HourTime = 72388, BallCount = 1700 },
	--[12] = { ID = 3881, HourTime = 72392, BallCount = 2000 },
	--[13] = { ID = 3882, HourTime = 72400, BallCount = 2500 }
	[1]  = { ID = 3870, HourTime = 835848, BallCount = -1   },
	[2]  = { ID = 3871, HourTime = 835852, BallCount = 100  },
	[3]  = { ID = 3872, HourTime = 835856, BallCount = 160  },
	[4]  = { ID = 3873, HourTime = 835860, BallCount = 250  },
	[5]  = { ID = 3874, HourTime = 835864, BallCount = 350  },
	[6]  = { ID = 3875, HourTime = 835868, BallCount = 500  },
	[7]  = { ID = 3876, HourTime = 835872, BallCount = 700  },
	[8]  = { ID = 3877, HourTime = 835876, BallCount = 900  },
	[9]  = { ID = 3878, HourTime = 835880, BallCount = 1150 },
	[10] = { ID = 3879, HourTime = 835884, BallCount = 1400 },
	[11] = { ID = 3880, HourTime = 835888, BallCount = 1700 },
	[12] = { ID = 3881, HourTime = 835892, BallCount = 2000 },
	[13] = { ID = 3882, HourTime = 835900, BallCount = 2500 } 
--end modified by zhangguoxin 090207
} 
  
--É¢Âä±¦Ïä×ø±ê±í....
x050023_g_ItemBoxPos = {
  
{162,114},{164,114},{166,114},{168,114},{169,111},
{166,110},{163,115},{160,109},{166,105},{167,107},
{172,110},{171,117},{169,118},{167,118},{166,117},
{163,117},{162,117},{160,119},{161,117},{163,116},
{161,107},{176,107},{179,112},{181,111},{174,102},
{158,111},{156,111},{154,112},{157,113},{154,113},
{152,116},{153,116},{156,117},{157,118},{158,119},
{153,113},{151,109},{153,110},{157,113},{150,109},
{148,110},{146,112},{144,114},{146,115},{147,117},
{149,118},{145,105},{148,99},{137,101},{135,110},

}

--É¢Âä±¦ÏäÎïÆ·µôÂä±í....(odds×ÜºÍÎª100000)
x050023_g_ItemBoxDrop = {

	--À¬»ø....
	{ itemId = 30002003, odds = 3000  },
	{ itemId = 30002004, odds = 3000  },
	{ itemId = 30002005, odds = 3000  },
	{ itemId = 30001003, odds = 3000  },
	{ itemId = 30001004, odds = 3000  },
	{ itemId = 30001005, odds = 3000  },
	{ itemId = 30003004, odds = 2000  },
	{ itemId = 30003005, odds = 2000  },
	{ itemId = 30003006, odds = 2000  },
	{ itemId = 20309010, odds = 4000  },
	{ itemId = 20309011, odds = 4000  },
	{ itemId = 20309012, odds = 4000  },
	{ itemId = 20309013, odds = 4000  },

	--µÍ¼¶Ã±×Ó....
	{ itemId = 10410098, odds = 400   },
	{ itemId = 10410099, odds = 1000  },
	{ itemId = 10410100, odds = 1600  },
	{ itemId = 10410101, odds = 2000  },

	--¸ß¼¶ÍòÁé....
	{ itemId = 20309014, odds = 3000  },
	{ itemId = 20309015, odds = 3000  },
	{ itemId = 20309016, odds = 3000  },
	{ itemId = 20309017, odds = 4000  },

	--¸ß¼¶Ã±×Ó....
	{ itemId = 10410102, odds = 3000  },
	{ itemId = 10410103, odds = 4000  },
	{ itemId = 10410104, odds = 5000  },
	{ itemId = 10410105, odds = 4000  },
	{ itemId = 10410106, odds = 4000  },
	{ itemId = 10410107, odds = 2050  },

	--±¦Ê¯....
	{ itemId = 50101001, odds = 950   },
	{ itemId = 50101002, odds = 950   },
	{ itemId = 50102001, odds = 950   },
	{ itemId = 50102002, odds = 950   },
	{ itemId = 50102003, odds = 950   },
	{ itemId = 50102004, odds = 950   },
	{ itemId = 50103001, odds = 950   },
	{ itemId = 50104002, odds = 950   },
	{ itemId = 50111001, odds = 950   },
	{ itemId = 50111002, odds = 950   },	
	{ itemId = 50112001, odds = 950   },
	{ itemId = 50112002, odds = 950   },
	{ itemId = 50112003, odds = 950   },
	{ itemId = 50112004, odds = 950   },
	{ itemId = 50113001, odds = 950   },
	{ itemId = 50113002, odds = 950   },
	{ itemId = 50113003, odds = 950   },
	{ itemId = 50113004, odds = 950   },
	{ itemId = 50113005, odds = 950   },
	{ itemId = 50113006, odds = 950   },
	{ itemId = 50114001, odds = 950   },

}

x050023_g_IDXSnowManID			= 0	--µ±Ç°Ñ©ÈËµÄ³¡¾°ID....
x050023_g_IDXSnowManState		= 1	--Ñ©ÈËµ±Ç°µÄ×´Ì¬....(0ÎÞÐ§ 1~12²»Í¬´óÐ¡µÄÑ©ÈË 13·¢½±Æ·µÄÑ©ÈË)
x050023_g_IDXBallCount			= 2	--Ñ©ÈË±»Ñ©ÇòÔÒµ½µÄ´ÎÊý....
x050023_g_IDXLastSpeakTime	= 3	--Ñ©ÈËÉÏ´Îº°»°Ê±¼ä....(»î¶¯ÆÚ¼äÑ©ÈËÃ¿µ½Õûµã30min»áº°»°)


--**********************************
--½Å±¾Èë¿Úº¯Êý
--**********************************
function x050023_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	MissionLog(sceneId, "[07SHOUYE]: ActivityStart")

	--¿ªÆô»î¶¯....
	StartOneActivity( sceneId, actId, 60000, iNoticeType )

	--ÖØÖÃ»î¶¯×´Ì¬....
	x050023_ResetActivityState( sceneId, actId )

end

--**********************************
--ÐÄÌøº¯Êý
--**********************************
function x050023_OnTimer( sceneId, actId, uTime )

	--»ñÈ¡µ±Ç°Ñ©ÈË×´Ì¬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )

	--´íÎó´¦Àí....
	if CurState < 1 or CurState > 13 then
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Error1")
		return
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Error2")
		return
	end

	--¼ì²â»î¶¯ÊÇ·ñ¹ýÆÚ....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		MonsterTalk(sceneId, -1, "LÕc Dß½ng", "#P[Ngß¶i Tuyªt]#W: các b¢ng hæu thân mªn, l­ v§t cüa ta ðã phát cho xong hªt r°i, h©n giáng sinh nåm sau g£p lÕi!")
		SetCharacterDieTime(sceneId, MstID, 6000 )
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Normal")
		return
	end

	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()
	
	--24ÈÕ24µãÒÔÇ°....Ñ©ÈËÃ¿¸öÕûµã¹ý30·ÖÖÓÔÚ³¡¾°ÄÚº°Ò»´Î»°....
	local QTime = mod(CurHourTime,100)
	
	if CurHourTime < 835900 and mod(QTime,4) == 2 then --zchw
		local LastSpeakTime = GetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime )
		if CurHourTime > LastSpeakTime then
			MonsterTalk(sceneId, -1, "LÕc Dß½ng", "#P[Ngß¶i Tuyªt]#W: ð¡p! ð¡p! ð¡p mµt ðÕi ngß¶i tuyªt! M÷i ngß¶i ð°ng tâm hi®p lñc ðªn LÕc Dß½ng (160,114) ð¡p ngß¶i tuyªt nào, nghe nói næa ðêm ð¡p ngß¶i tuyªt ß¾c nguy®n có th¬ thành hi®n thñc ð¤y!")
			SetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime, CurHourTime )
		end
		return
	end

	--24ÈÕ24µãÒÔÇ°....Ñ©ÈËÃ¿¸öÕûµã²î5·ÖÖÓÔÚ³¡¾°ÄÚº°Ò»´Î»°....
	if CurHourTime < 835900 and GetMinute() == 54 then	--zchw
			MonsterTalk(sceneId, -1, "LÕc Dß½ng", "#P[Ngß¶i Tuyªt]#W: ta l§p tÑc s¨ to l¾n h½n, m÷i ngß¶i nhanh chÕy t¾i cùng ta cùng nhau chúc m×ng ði, r¤t nhi«u l­ v§t ðang ch¶ các ngß½i!")
		return
	end
	
	--Ñ©ÈË±ä´óµÄ´¦Àí....
	if CurState < 13 then
		--Èç¹ûÊ±¼äµ½ÁËÔò±ä´ó....
		if CurHourTime >= x050023_g_SnowMan[CurState+1].HourTime then
			x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState+1 )
		end
	end
	
	--end modified by zhangguoxin 090207
end

--**********************************
--¼ì²âµ±Ç°ÊÇ·ñÊÇ»î¶¯Ê±¼ä
--**********************************
function x050023_CheckActivityTime( sceneId )
	--2009Äê12ÔÂ25ÈÕ2Ê± ÒÔºóÎª·Ç»î¶¯Ê±¼ä....
	--·Ç»î¶¯Ê±¼ä²»ÔÊÐíË¢³öÑ©ÈË....
	--begin modified by zhangguoxin 090207
	--if 2008 == LuaFnGetThisYear() and GetHourTime() < 72408 then
	if 2008 == LuaFnGetThisYear() and GetQuarterTime() < 835908 then
	--end modified by zhangguoxin 090207
		return 1
	end
	return 0
end

--**********************************
--ÖØÖÃ»î¶¯×´Ì¬
--**********************************
function x050023_ResetActivityState( sceneId, actId )

	MissionLog(sceneId, "[07SHOUYE]: ResetActivity")

	--µ±»î¶¯Æô¶¯Ê±»áµ÷ÓÃ±¾º¯ÊýÀ´ÖØÖÃ»î¶¯×´Ì¬....
	--·þÎñÆ÷ÖØÆôÊ±Ò²»áµ÷ÓÃ±¾º¯ÊýÀ´ÖØÖÃ»î¶¯×´Ì¬....

	--ÖØÖÃ»î¶¯²ÎÊý....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, -1 )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, 0 )
	SetActivityParam( sceneId, actId, x050023_g_IDXBallCount, 0 )
	SetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime, 0 )

	--·Ç»î¶¯Ê±¼äÔò²»Ë¢³öÑ©ÈË....
	if 0 == x050023_CheckActivityTime( sceneId ) then
		MissionLog(sceneId, "[07SHOUYE]: ResetActivity Failed WrongTime")
		StopOneActivity( sceneId, actId )
		return
	end

	--¸ù¾ÝÊ±¼ä»ñµÃµ±Ç°Òª´´½¨µÄÑ©ÈËÊý¾Ý....
	local CurState = 0
	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()
	--end modified by zhangguoxin 090207
	for i, v in x050023_g_SnowMan do
		if CurHourTime >= v.HourTime then
			CurState = i
		end
	end

	--ÖØ½¨Ñ©ÈË....
	local MstID = -1

	if 0 == CurState then
		--ÈÝ´í´¦Àí....ServerµÄÊ±¼ä¿ÉÄÜ»¹Ã»µ½»î¶¯Ê±¼ä....
		CurState = 1
	end

	--´´½¨Ñ©ÈË....
	MstID = LuaFnCreateMonster(sceneId, x050023_g_SnowMan[CurState].ID, x050023_g_SnowManX, x050023_g_SnowManY, 3, 0, x050023_g_SnowManScriptId )
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10488, 0)
	AddGlobalCountNews(sceneId, "#{SDSY_081212_01}"); --zchw
	--ÉèÖÃ»î¶¯²ÎÊý....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, MstID )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, CurState )

	MissionLog(sceneId, "[07SHOUYE]: ResetActivity Succ CurState="..CurState.." ObjID="..MstID)

end

--**********************************
--½«Ñ©ÈË±ä´ó
--**********************************
function x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState )

	MissionLog(sceneId, "[07SHOUYE]: x050023_MakeBigSnowMan CurState="..CurState)

	--É¾¾ÉµÄ....
	LuaFnDeleteMonster(sceneId, MstID)

	--½¨Á¢ÐÂµÄ....
	local MstID = -1
	MstID = LuaFnCreateMonster(sceneId, x050023_g_SnowMan[CurState].ID, x050023_g_SnowManX, x050023_g_SnowManY, 3, 0, x050023_g_SnowManScriptId )
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10488, 0)

	--±ä´óÌØÐ§....
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10487, 0)

	--É¢Âä±¦Ïä....
	x050023_GiveItemBox( sceneId )

	--¹«¸æ....
	MonsterTalk(sceneId, -1, "LÕc Dß½ng", "#P[Ngß¶i Tuyªt]#W: haha, tuyªt r½i thì nåm nay ðßþc mùa ð¤y. Ðây 50 cái bäo sß½ng cÑ vi®c l¤y ði ði, mµt h°i còn có r¤t nhi«u ð° t¯t ðßa cho m÷i ngß¶i, chúc m÷i ngß¶i giáng sinh vui vë!")

	--ÉèÖÃ»î¶¯²ÎÊý....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, MstID )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, CurState )

end

--**********************************
--É¢Âä±¦Ïä
--**********************************
function x050023_GiveItemBox( sceneId )

	local BoxId = -1
	local DropItemId = -1
	local randValue = 0
	local index = 1
	for _, box in x050023_g_ItemBoxPos do
		--zchw 1/60¼¸ÂÊÕäÊÞµ°£¬»¶ÀÖÖí
		local rdm = random(0, 6000);
		if rdm < 100 then
		
			local BoxId = ItemBoxEnterScene( box[1], box[2], 779, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30309683 ) --ÕäÊÞµ°£ºµ±ìè£¨95¼¶£©
			SetItemBoxMaxGrowTime( sceneId, BoxId, 1200000 )	--20·ÖÖÓÉúÃüÆÚ....		
			
		else
		
			--Ëæ»ú³öµÚÒ»¸öÎïÆ·....
			randValue = random(0, 99999);
			for i, item in x050023_g_ItemBoxDrop do
				if item.odds >= randValue then
					DropItemId = item.itemId;
					index = i
					break
				end
				randValue = randValue - item.odds;
			end
			if DropItemId == -1 then
				break
			end
			BoxId = ItemBoxEnterScene( box[1], box[2], 779, sceneId, QUALITY_MUST_BE_CHANGE, 1, DropItemId )
			SetItemBoxMaxGrowTime( sceneId, BoxId, 1200000 )	--20·ÖÖÓÉúÃüÆÚ....
	
			--Ö®Ç°Ã»ÓÐËæ»ú³öÊ¥µ®Ã±ºÍ±¦Ê¯²Å»á¸øµÚ¶þ¸öÎïÆ·....
			if ( index < 13 ) or ( index >= 18 and index <= 21 )then
				randValue = random(0, 99999);
				for _, item in x050023_g_ItemBoxDrop do
					if item.odds >= randValue then
						DropItemId = item.itemId
						break
					end
					randValue = randValue - item.odds;
				end
				if DropItemId == -1 then
					break
				end
				AddItemToBox( sceneId, BoxId, QUALITY_MUST_BE_CHANGE, 1, DropItemId )
			end
			
		end
	end
end

--**********************************
--±»Ñ©Çò»÷ÖÐÊÂ¼þ
--**********************************
function x050023_CanThrowSnowBall( sceneId, playerId, targetId )

	local actId = 88	--ÌØÀýÓÃ·¨....ÆäËûÈË²»ÒªÑ§....

	--»î¶¯ÊÇ·ñÒÑ¾­ÎÞÐ§....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return 0
	end

	--»ñÈ¡µ±Ç°Ñ©ÈË×´Ì¬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--´íÎó´¦Àí....
	if CurState < 1 or CurState > 13 then
		return 0
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return 0
	end

	--´òµÄÊÇ·ñÊÇÑ©ÈË....
	if targetId ~= MstID then
		return 0
	end

	return 1

end

--**********************************
--±»Ñ©Çò»÷ÖÐÊÂ¼þ
--**********************************
function x050023_OnHitBySnowBall( sceneId, playerId, targetId )

	local actId = 88	--ÌØÀýÓÃ·¨....ÆäËûÈË²»ÒªÑ§....

	--»î¶¯ÊÇ·ñÒÑ¾­ÎÞÐ§....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return 0
	end

	--»ñÈ¡µ±Ç°Ñ©ÈË×´Ì¬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--´íÎó´¦Àí....
	if CurState < 1 or CurState > 13 then
		return 0
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return 0
	end

	--´òµÄÊÇ·ñÊÇÑ©ÈË....
	if targetId ~= MstID then
		return 0
	end

	if CurState >= 1 and CurState <= 12 then

		--Ôö¼Ó¼ÆÊý....
		BallCount = BallCount + 1
		SetActivityParam( sceneId, actId, x050023_g_IDXBallCount, BallCount )

		--»¹²î50,30,10¸öÇòµÄÊ±ºòº°»°....
		local NeedCount = x050023_g_SnowMan[CurState+1].BallCount - BallCount
		if NeedCount == 50 or NeedCount == 30 or NeedCount == 10 then
			MonsterTalk(sceneId, -1, "LÕc Dß½ng", "#P[Ngß¶i Tuyªt]#W: còn thiªu "..NeedCount.." cái tuyªt c¥u d¡p lên ngß¶i ta m¾i có th¬ l¾n lên, m÷i ngß¶i n² lñc nào, ph¥n thß·ng ðang ch¶ ðón các ngß½i!")
		end

		--´¦ÀíÑ©ÈË±ä´ó....
		if BallCount >= x050023_g_SnowMan[CurState+1].BallCount then
			x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState+1 )
		end

	end

	return 1

end

--**********************************
--»ñµÃÀëÏÂ´Î±ä´ó»¹²î¶àÉÙ¸öÑ©Çò....
--**********************************
function x050023_GetNeedBallCount( sceneId )

	local actId = 88	--ÌØÀýÓÃ·¨....ÆäËûÈË²»ÒªÑ§....

	--»î¶¯ÊÇ·ñÒÑ¾­ÎÞÐ§....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return -1
	end

	--»ñÈ¡µ±Ç°Ñ©ÈË×´Ì¬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--´íÎó´¦Àí....
	if CurState < 1 or CurState > 13 then
		return -1
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return -1
	end

	if CurState >= 1 and CurState <= 12 then
		local NeedCount = x050023_g_SnowMan[CurState+1].BallCount - BallCount
		return NeedCount
	end

	return -1

end

--**********************************
--Íæ¼ÒÔÚÂåÑôÊ°È¡ÎïÆ·µÄ»Øµ÷º¯Êý....
--**********************************
function x050023_OnPlayerPickUpItemInLuoyang( sceneId, selfId, itemId, bagidx )

	--·Ç»î¶¯Ê±¼äÔò²»¹«¸æ....
	if 0 == x050023_CheckActivityTime( sceneId ) then
		return 0
	end

	local IsBoxItem = 0
	local ItemCount = getn(x050023_g_ItemBoxDrop)
	for i = 22, ItemCount do --ÍòÁéÊ¯²»¹«¸æ zchw
		if x050023_g_ItemBoxDrop[i].itemId == itemId then
			IsBoxItem = 1
			break
		end
	end
	--ÕäÊÞµ°£ºµ±ìè£¨95¼¶£© ¹«¸æ 30309683 zchw
	if itemId == 30309683 then
		IsBoxItem = 1;
		--ÈÕÖ¾Í³¼Æ
		local guid = LuaFnObjId2Guid(sceneId, selfId)
		local log = format("itemId=%d", itemId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_SNOW, guid, log)
	end
	
	if IsBoxItem == 0 then
		return 0
	end

	--¹«¸æ....
	local playerName = GetName(sceneId, selfId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local rand = random(3)
	local message
	if rand == 1 then
		message = format("#PTr¶i r½i ð¥y tuyªt, vi®c vui ð¥y cØa. #{_INFOUSR%s}#P ðang bß¾c ði trên ðß¶ng LÕc Dß½ng cûng vô tình ðá trúng #{_INFOMSG%s}#P, th§t sñ là h°ng v§n r½i xu¯ng, có mu¯n ngån cän cûng không ðßþc.", playerName, transfer )
	elseif rand == 2 then
		message = format("#PGió b¡c th±i, hoa tuyªt tung bay, b¥u tr¶i LÕc Dß½ng r½i ð¥y tài bäo. T¾i ðánh thÑc #{_INFOUSR%s}#P tïnh gi¤c, tay chân r¤t nhanh l© nh£t lên mµt cái #{_INFOMSG%s}#P khi nhi«u ngß¶i quay ði không ð¬ ý.", playerName, transfer )
	else
		message = format("#PNgß¶i Tuyªt t¯t lành, Ngß¶i Tuyªt kÏ di®u, Ngß¶i Tuyªt r½i bäo b¯i kêu b¸ch b¸ch! #{_INFOUSR%s}#P ngay trß¾c m£t nh£t lên ðßþc #{_INFOMSG%s}#P r°i ng°i tÕi ðß¶ng ph¯ LÕc Dß½ng cß¶i th½ th¦n.", playerName, transfer )
	end
	BroadMsgByChatPipe(sceneId, selfId, message, 4)

	return 1

end
