--401040

-- Yªn TØ ‘¸±±¾

--************************************************************************
--MisDescBegin
--½Å±¾ºÅ
x401040_g_ScriptId = 401040
x401040_g_Name = "Lý Cß½ng"


--MisDescEnd
--************************************************************************
x401040_TIME_2000_01_03_ = 946828868

x401040_g_SceneData_1 = 8   -- ¼ÇÂ¼¸±±¾Ë¢¹Öµ½µÚ¼¸Åú

x401040_g_SceneData_3 = 9	-- 
x401040_g_SceneData_4 = 10	-- 
x401040_g_SceneData_5 = 11	-- 
x401040_g_SceneData_6 = 12	-- 

x401040_g_SceneData_7 = 13	-- Íæ¼ÒµÈ¼¶

x401040_g_SD_Monster_1 	 = 14			-- ÔÝÎ´Ê¹ÓÃ
x401040_g_SD_Monster_1_T = 15			-- ÔÝÎ´Ê¹ÓÃ


x401040_g_SD_Monster_2 	 = 16
x401040_g_SD_Monster_2_T = 17
x401040_g_SD_Monster_3 	 = 18
x401040_g_SD_Monster_3_T = 19

x401040_g_KillMonsCount_Qincheng = 20
x401040_g_KillMonsCount_Qinjia 	 = 21
x401040_g_KillMonsCount_Lama		 = 22

x401040_g_SkillSign = 23 	-- ¹«Ò±¸É¡¢µË°Ù´¨¡¢°ü²»Í¬ºÍ·ç²¨¶ñ ÆäÖÐÒ»¸öÈËËÀºó£¬±ðÈË¿ñ±©±ê¼Ç

-- ÍõÓïÑÔ¿ªÊ¼µãÃûµÄ¿ª¹Ø
x401040_g_bWangyuyanSpeak = 24
x401040_g_bWangyuyanSpeak_T = 27

-- ¹Ø±Õ¸±±¾µÄÊ±¼ä¼ÇÂ¼
x401040_g_CloseTime = 25

-- ¸±±¾Ê§°ÜµÄ±ê¼Ç
x401040_g_MissionLost = 26

-- ¿ØÖÆÏµÍ³ÌáÊ¾µÄÊ±¼ä
x401040_g_SystemTipsTime = 28

-- ¿ØÖÆ Vß½ng Ngæ YênÊÜµ½ÉËº¦ºó£¬Vß½ng Ngæ YênºÍÐoàn DñµÄ¶Ô»°
x401040_g_DuanAndWangFlag = 29

--¸±±¾Ãû³Æ
x401040_g_CopySceneName = "Yªn TØ ‘"
x401040_g_CopySceneType = FUBEN_DAZHAN_YZW	--¸±±¾ÀàÐÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ
x401040_g_CopySceneMap = "yanziwu.nav"
-- [NetCo4 30/09] 1 = chi danh 5 dot cuoi (dot 5 co Cuu Ma Tri) roi sang Mo Dung Phuc,
--   bo 20 dot dau cung Dieu Ba Duong + Tu Ma Lam. 0 = ban goc 25 dot. Lua: sua xong co hieu luc ngay.
x401040_g_ChiDot5 = 1
x401040_g_LimitMembers = 1				--¿ÉÒÔ½ø¸±±¾µÄ×îÐ¡¶ÓÎéÈËÊý
x401040_g_TickTime = 1						--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x401040_g_LimitTotalHoldTime = 360--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊý£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x401040_g_LimitTimeSuccess = 500	--¸±±¾Ê±¼äÏÞÖÆ£¨µ¥Î»£º´ÎÊý£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x401040_g_CloseTick = 5						--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊý£©
x401040_g_NoUserTime = 300				--¸±±¾ÖÐÃ»ÓÐÈËºó¿ÉÒÔ¼ÌÐø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x401040_g_DeadTrans = 0						--ËÀÍö×ªÒÆÄ£Ê½£¬0£ºËÀÍöºó»¹¿ÉÒÔ¼ÌÐøÔÚ¸±±¾£¬1£ºËÀÍöºó±»Ç¿ÖÆÒÆ³ö¸±±¾
x401040_g_Fuben_X = 177						--½øÈë¸±±¾µÄÎ»ÖÃX
x401040_g_Fuben_Z = 234						--½øÈë¸±±¾µÄÎ»ÖÃZ
x401040_g_Back_X = 70							--Ô´³¡¾°Î»ÖÃX
x401040_g_Back_Z = 120						--Ô´³¡¾°Î»ÖÃZ
x401040_g_Back_SceneId = 4				--Ô´³¡¾°Id

x401040_g_Npc_1 = {	
-- ËÎ¾üÊ¿±ø
--{id=9210,x=171,y=236,camp=109,ai=21,af=222},{id=9210,x=175,y=236,camp=109,ai=21,af=222},
--{id=9210,x=179,y=236,camp=109,ai=21,af=222},{id=9210,x=183,y=236,camp=109,ai=21,af=222},
{id=9210,x=175,y=202,camp=109,ai=21,af=222},{id=9210,x=181,y=202,camp=109,ai=21,af=222},
{id=9210,x=172,y=152,camp=109,ai=21,af=222},{id=9210,x=173,y=158,camp=109,ai=21,af=222},
{id=9210,x=146,y=151,camp=109,ai=21,af=222},{id=9210,x=151,y=154,camp=109,ai=21,af=222},
{id=9210,x=137,y=177,camp=109,ai=21,af=222},{id=9210,x=133,y=175,camp=109,ai=21,af=222},
{id=9210,x=109,y=162,camp=109,ai=21,af=222},{id=9210,x=104,y=164,camp=109,ai=21,af=222},
{id=9210,x=82 ,y=176,camp=109,ai=21,af=222},{id=9210,x=77 ,y=176,camp=109,ai=21,af=222},
{id=9210,x=53 ,y=157,camp=109,ai=21,af=222},{id=9210,x=58 ,y=156,camp=109,ai=21,af=222},
{id=9210,x=76 ,y=210,camp=109,ai=21,af=222},{id=9210,x=80 ,y=210,camp=109,ai=21,af=222},
{id=9210,x=86 ,y=210,camp=109,ai=21,af=222},{id=9210,x=91 ,y=210,camp=109,ai=21,af=222},
{id=9210,x=211,y=146,camp=109,ai=21,af=222},{id=9210,x=214,y=146,camp=109,ai=21,af=222},
{id=9210,x=217,y=146,camp=109,ai=21,af=222},{id=9210,x=220,y=146,camp=109,ai=21,af=222},
{id=9210,x=223,y=146,camp=109,ai=21,af=222},

-- Ò»Æ·ÌÃÎäÊ¿
{id=9240,x=175,y=152,camp=110,ai=21,af=226},{id=9240,x=149,y=150,camp=110,ai=21,af=226},
{id=9240,x=147,y=146,camp=110,ai=21,af=226},{id=9240,x=135,y=174,camp=110,ai=21,af=226},
{id=9240,x=133,y=171,camp=110,ai=21,af=226},{id=9240,x=135,y=177,camp=110,ai=21,af=226},
{id=9240,x=105,y=161,camp=110,ai=21,af=226},{id=9240,x=108,y=159,camp=110,ai=21,af=226},
{id=9240,x=80 ,y=173,camp=110,ai=21,af=226},{id=9240,x=81 ,y=177,camp=110,ai=21,af=226},
{id=9240,x=55 ,y=155,camp=110,ai=21,af=226},{id=9240,x=52 ,y=154,camp=110,ai=21,af=226},
{id=9240,x=58 ,y=155,camp=110,ai=21,af=226},

-- Yªn TØ ‘×¯¶¡
{id=9280,x=209,y=80 ,camp=110,ai=21,af=239},{id=9280,x=222,y=79 ,camp=110,ai=21,af=239},
{id=9280,x=218,y=69 ,camp=110,ai=21,af=239},{id=9280,x=228,y=64 ,camp=110,ai=21,af=239},
{id=9280,x=228,y=52 ,camp=110,ai=21,af=239},{id=9280,x=217,y=39 ,camp=110,ai=21,af=239},
{id=9280,x=186,y=31 ,camp=110,ai=21,af=239},{id=9280,x=181,y=36 ,camp=110,ai=21,af=239},
{id=9280,x=176,y=42 ,camp=110,ai=21,af=239},{id=9280,x=176,y=52 ,camp=110,ai=21,af=239},
{id=9280,x=136,y=93 ,camp=110,ai=21,af=239},{id=9280,x=140,y=88 ,camp=110,ai=21,af=239},
{id=9280,x=137,y=82 ,camp=110,ai=21,af=239},{id=9280,x=144,y=86 ,camp=110,ai=21,af=239},
{id=9280,x=143,y=101,camp=110,ai=21,af=239},{id=9280,x=141,y=111,camp=110,ai=21,af=239},
{id=9280,x=148,y=112,camp=110,ai=21,af=239},{id=9280,x=146,y=103,camp=110,ai=21,af=239},
{id=9280,x=154,y=110,camp=110,ai=21,af=239},

-- Á¬åóËþ
{id=9290,x=234,y=30 ,camp=110,ai=21,af=223},{id=9290,x=225,y=25 ,camp=110,ai=21,af=223},
{id=9290,x=175,y=41 ,camp=110,ai=21,af=223},{id=9290,x=179,y=45 ,camp=110,ai=21,af=223},
{id=9290,x=172,y=48 ,camp=110,ai=21,af=223},{id=9290,x=171,y=52 ,camp=110,ai=21,af=223},
{id=9290,x=170,y=57 ,camp=110,ai=21,af=223},{id=9290,x=167,y=61 ,camp=110,ai=21,af=223},
}

-- Hô Diên Khánh Hô Diên Báo
x401040_g_Npc_2 = {	{id=9200,x=177,y=232,script=402240,camp=0,ai=3,af=-1},
									 	{id=9220,x=79, y=202,script=402241,camp=109,ai=21,af=220}
}

-- Hô Diên KhánhÉíºóÓÐ¶Ô»°µÄËÎ±ø
x401040_g_Npc_2_1={	{id=9210,x=171,y=236,camp=109,ai=21,af=222,script=402262},
										{id=9210,x=175,y=236,camp=109,ai=21,af=222,script=402262},
										{id=9210,x=179,y=236,camp=109,ai=21,af=222,script=402262},
										{id=9210,x=183,y=236,camp=109,ai=21,af=222,script=402262},
}

-- ÔÀÀÏÈý
x401040_g_Npc_3 = {	{id=9340,	x=81,y=197,	script=402242,camp=110,ai=21,af=227}
}

-- ÔÀÀÏÈý ¸½´øµÄÐ¡¹Ö (Ò»Æ·ÌÃÎäÊ¿)
x401040_g_Npc_3_1={	{id=9240,x=79,y=195,camp=110,ai=21,af=226},
										{id=9240,x=77,y=207,camp=110,ai=21,af=226},
										{id=9240,x=82,y=195,camp=110,ai=21,af=226},
										{id=9240,x=86,y=206,camp=110,ai=21,af=226},
}

-- Ò¶¶þÄï ÔÆÖÐº×
x401040_g_Npc_4 = {	{id=9330,x=77,y=195,script=402244,camp=110,ai=21,af=228},
										{id=9350,x=83,y=198,script=402243,camp=110,ai=21,af=229},
}                                                
                                                 
-- ¶ÎÑÓÇì
x401040_g_Npc_5 = {	{id=9320,x=81,y=195,script=402245,camp=110,ai=21,af=230},
}

-- Ti«n Hoành Vû »ªºÕôÞ
x401040_g_Npc_6 = {	{id=9230,x=217,y=150,script=402246,camp=109,ai=21,af=221},
										{id=9480,x=179,y=91	,script=402249,camp=0,ai=3,af=-1},
}

-- ¿ÉÒÔÓÉÍæ¼ÒÐÞÀíµÄÁ¬åóËþ
x401040_g_Npc_7 = {	{id=9290,x=210,y=155,script=402247, name="trß¾c",camp=0,ai=3,af=-1},
										{id=9290,x=225,y=138,script=402247, name="sau",camp=0,ai=3,af=-1},
										{id=9300,x=225,y=155,script=402247, name="",camp=0,ai=3,af=-1},
										{id=9310,x=209,y=138,script=402247, name="",camp=0,ai=3,af=-1},
}

-- ºÍ Hô Diên Báo ¶Ô»°ºó£¬²»¶ÏÊä³öµÄÐ¡¹Ö (Ò»Æ·ÌÃÎäÊ¿)
x401040_g_Npc_8 = {	{id=9240,x=79,y=195,script=-1,camp=110,ai=21,af=226},
										{id=9240,x=77,y=207,script=-1,camp=110,ai=21,af=226},
										{id=9240,x=82,y=195,script=-1,camp=110,ai=21,af=226},
										{id=9240,x=86,y=206,script=-1,camp=110,ai=21,af=226},
}

-- ºÍTi«n Hoành Vû¶Ô»°ºó£¬²»¶ÏË¢³öµÄÐ¡¹Ö
x401040_g_Npc_9 = {	{id=9250,x=233,y=214,script=402258,pp=0,camp=110,ai=21,af=231},
										{id=9250,x=236,y=214,script=402258,pp=1,camp=110,ai=21,af=231},
										{id=9250,x=235,y=217,script=402258,pp=2,camp=110,ai=21,af=231},
										{id=9250,x=238,y=216,script=402258,pp=3,camp=110,ai=21,af=231},
										{id=9250,x=237,y=219,script=402258,pp=4,camp=110,ai=21,af=231},
}

-- Ä¾ÈË¿þÀÜÔÚ Ë«Êý´ÎË¢
x401040_g_Npc_9_1={	{id=9530,x=237,y=219,script=402259,pp=4,camp=110,ai=21,af=233}}

-- Çà³ÇÅÉµÜ×Ó£¬ÔÚ50µ½100Ë¢³ö
x401040_g_Npc_9_2 = {	
										{id=9260,x=233,y=214,script=402257,pp=0,camp=110,ai=21,af=232},
										{id=9260,x=236,y=214,script=402257,pp=1,camp=110,ai=21,af=232},
										{id=9260,x=235,y=217,script=402257,pp=2,camp=110,ai=21,af=232},
										{id=9260,x=238,y=216,script=402257,pp=3,camp=110,ai=21,af=232},
										{id=9260,x=237,y=219,script=402257,pp=4,camp=110,ai=21,af=232},
}

-- ºÍTi«n Hoành Vû¶Ô»°ºó£¬²»¶ÏË¢³öµÄ ÍÂÞ¬À®Âï
x401040_g_Npc_10= {	{id=9270,x=233,y=214,script=402260,pp=0,camp=110,ai=21,af=234},
										{id=9270,x=236,y=214,script=402260,pp=1,camp=110,ai=21,af=234},
										{id=9270,x=235,y=217,script=402260,pp=2,camp=110,ai=21,af=234},
										{id=9270,x=238,y=216,script=402260,pp=2,camp=110,ai=21,af=234},
										{id=9270,x=237,y=219,script=402260,pp=2,camp=110,ai=21,af=234},
}

-- ºÍTi«n Hoành Vû¶Ô»°ºó£¬Ò¦²®µ±,Ë¾ÂíÁÖ,ð¯Ä¦ÖÇ £¨ð¯Ä¦ÖÇ ÓÐ½Å±¾£©
x401040_g_Npc_11= {	{id=9360,x=233,y=214,script=402248,pp=0,camp=110,ai=21,af=235},
										{id=9370,x=233,y=214,script=402248,pp=0,camp=110,ai=21,af=236},
										{id=9380,x=233,y=214,script=402248,pp=0,camp=110,ai=21,af=237},
}

-- ¹«Ò±¸É µË°Ù´¨ °ü²»Í¬ ·ç²¨¶ñ
--x401040_g_Npc_12= {	{id=9390,x=130,y=112,script=402250,camp=110,ai=21,af=240},
--										{id=9400,x=126,y=109,script=402251,camp=110,ai=21,af=241},
--										{id=9410,x=126,y=112,script=402252,camp=110,ai=21,af=242},
--										{id=9420,x=126,y=115,script=402253,camp=110,ai=21,af=243},
--}
x401040_g_Npc_12= {	{id=9390,x=130,y=112,script=402250,camp=110,ai=21,af=241},
										{id=9400,x=126,y=109,script=402251,camp=110,ai=21,af=241},
										{id=9410,x=126,y=112,script=402252,camp=110,ai=21,af=241},
										{id=9420,x=126,y=115,script=402253,camp=110,ai=21,af=241},
}

-- Ä½ÈÝ¸´
x401040_g_Npc_13 ={	{id=9430,x=63,y=67,	script=402254,camp=110,ai=25,af=244},
}

-- Íõ¹ÃÄï£¬Ðoàn Dñ µÈÈË
x401040_g_Npc_14= {	{id=9450,x=76,y=67,	script=402255,camp=0,ai=26,af=-1},
										{id=9440,x=76,y=64,	script=402256,camp=0,ai=27,af=245},
										{id=9460,x=79,y=70,	script=402249,camp=0,ai=27,af=247},
										{id=9470,x=79,y=69,	script=402249,camp=0,ai=27,af=248},
										{id=9490,x=79,y=68,	script=402249,camp=0,ai=27,af=249},
										{id=9500,x=79,y=67,	script=402249,camp=0,ai=27,af=250},
										{id=9510,x=79,y=66,	script=402249,camp=0,ai=27,af=251},
										{id=9520,x=79,y=65,	script=402249,camp=0,ai=27,af=252},
}

-- ºÍÄ½ÈÝ¸´¿ªÕ½ºóµÄ Yªn TØ ‘×¯¶¡ ¿ª¹Öºó²»¶ÏË¢³öµÄ¼Ò¶¡
x401040_g_Npc_15=	{	}
--										{id=9280,x=60,y=55,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=66,y=55,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=60,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=66,y=63,	script=-1,camp=110,ai=21,af=239},
--}

-- Ä½ÈÝ¸´Éí±ßµÄ±³¾°£¬Ã¿´ÎÄ½ÈÝ¸´ÍÑÀëÕ½¶·ºó£¬¶¼»áÖØÐÂË¢
x401040_g_Npc_16=	{	}
--										{id=9280,x=61,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=63,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=65,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=59,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=61,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=63,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=65,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=67,y=61,	script=-1,camp=110,ai=21,af=239},
--}

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x401040_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#{yanziwu_info}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x401040_g_Name  then
		return
	end

	-- ¸ù¾ÝÍæ¼ÒµÄÇé¿ö£¬½«Íæ¼ÒËÍµ½²»Í¬µÄ¸±±¾
	-- 2£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇ×é¶ÓÁË
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BThäo phÕt Yªn TØ ‘");
			AddText(sceneId,"  N½i này r¤t nguy hi¬m nªu không ðü 3 ngß¶i ta không dám ð¬ các ngß½i vào.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3£¬¼ì²âÍæ¼ÒÊÇ²»ÊÇ¶Ó³¤
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#BThäo phÕt Yªn TØ ‘");
			AddText(sceneId,"  Ngß½i phäi là ðµi trß·ng m¾i ðßþc");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4£¬¼ì²âÊÇ²»ÊÇÈË¶¼µ½Î»ÁË
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BThäo phÕt Yªn TØ ‘");
			AddText(sceneId,"  Các hÕ có ðµi viên không · g¥n ðây");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5£¬¼ì²â¶ÓÎéÀïÍ·µÄÃ¿¸öÍæ¼ÒÊÇ²»ÊÇ¶¼µ½60¼¶ÁË
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		if GetLevel(sceneId,nPlayerId) < 60  then
			BeginEvent(sceneId)
				AddText(sceneId,"#BThäo phÕt Yªn TØ ‘");
				AddText(sceneId,"  Tr§n chiªn r¤t nguy hi¬m dß¾i c¤p 60 ta không th¬ cho ngß½i vào");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- Ã¿ÌìÖ»ÄÜ3´Î
-- MD_YANZIWU_TIMES			=	195  -- Ã¿Ìì½øÈëYªn TØ ‘µÄ´ÎÊý
-- MD_PRE_YANZIWU_TIME		=	196  -- ÉÏÒ»´ÎÈ¥Yªn TØ ‘µÄÊ±¼ä

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local bOk = 1
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		local nTimes = GetMissionData(sceneId,nPlayerId, MD_YANZIWU_TIMES) 
		local nPreTime = GetMissionData(sceneId,nPlayerId, MD_PRE_YANZIWU_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x401040_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x401040_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_YANZIWU_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_PRE_YANZIWU_TIME, nPreTime)
		end
		
		if nTimes >= 8  then
			bOk = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
		
	end
	local nCount = 0

	if bOk == 0  then
		local szAllName = ""
		for i=1, 6  do
			if strName[i] ~= ""  then
				if nCount == 0  then
					szAllName = strName[i]
				else
					szAllName = szAllName .. ", " .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#BThäo phÕt Yªn TØ ‘");
			AddText(sceneId,"  Trong ðµi ngû có " .. szAllName .. " hôm nay ðã tham gia ðü 3 l¥n thäo phÕt Yªn TØ ‘");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	
	-- ËùÓÐµÄ¼ì²âÍ¨¹ý£¬
	x401040_MakeCopyScene(sceneId, selfId)
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x401040_OnEnumerate( sceneId, selfId, targetId )
	-- ×îºÃÔÚÕâÀï×öÒ»¸öÃû×ÖÅÐ¶¨
	if GetName(sceneId, targetId) == x401040_g_Name  then
		AddNumText( sceneId, x401040_g_ScriptId, "Thäo phÕt Yªn TØ ‘",10 ,-1  )
		AddNumText( sceneId, x401040_g_ScriptId, "Liên quan thäo phÕt Yªn TØ ‘",8 ,1  )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x401040_CheckAccept( sceneId, selfId )
	
end

--**********************************
--Ñ¯ÎÊÍæ¼ÒÊÇ·ñÒª½øÈë¸±±¾
--**********************************
function x401040_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--½ÓÊÜ
--**********************************
function x401040_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x401040_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x401040_MakeCopyScene( sceneId, selfId )
	
	-- Ê¹ÓÃ¶ÓÔ±µÄµÈ¼¶À´Ëã³ö¹ÖÎïµÄµÈ¼¶
	local param0 = 4;
	local param1 = 3;

	--×îÖÕ½á¹û
	local mylevel = 0;

	--ÁÙÊ±±äÁ¿
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1  then  --Ã»ÓÐ¶ÓÎé
		mylevel = GetLevel(sceneId, selfId)
	end
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yanziwu.nav"); --µØÍ¼ÊÇ±ØÐëÑ¡È¡µÄ£¬¶øÇÒ±ØÐëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401040_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401040_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401040_g_CopySceneType);--ÉèÖÃ¸±±¾Êý¾Ý£¬ÕâÀï½«0ºÅË÷ÒýµÄÊý¾ÝÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êý×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401040_g_ScriptId);--½«1ºÅÊý¾ÝÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼þ½Å±¾ºÅ
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊý
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊý
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --±£´æ¶ÓÎéºÅ
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--É±ËÀBossµÄÊýÁ¿
	
	-- ¾çÇéÓÃµ½µÄ±äÁ¿Çå¿Õ
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = 10;
	end

	-- Ê¹ÓÃµÚ13Î»£¬¼ÇÂ¼¹ÖÎïÊµ¼ÊµÄµÈ¼¶
	LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_7, mylevel)
	
	--ÉèÖÃ³¡¾°ÖÐµÄ¸÷ÖÖNpcºÍÇøÓò
	LuaFnSetSceneLoad_Area( sceneId, "yanziwu_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yanziwu_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êý
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D¸ch chuy¬n thành công!");
		else
			AddText(sceneId,"S¯ lßþng bän sao ðã ðªn gi¾i hÕn, ð« ngh¸ lát næa thØ lÕi!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--¸±±¾ÊÂ¼þ
--**********************************
function x401040_OnCopySceneReady( sceneId, destsceneId )

	--½øÈë¸±±¾µÄ¹æÔò
	-- 1£¬Èç¹ûÕâ¸öÎÄ¼þÃ»ÓÐ×é¶Ó£¬¾Í´«ËÍÕâ¸öÍæ¼Ò×Ô¼º½øÈë¸±±¾
	-- 2, Èç¹ûÍæ¼ÒÓÐ¶ÓÎé£¬µ«ÊÇÍæ¼Ò²»ÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼º½øÈë¸±±¾
	-- 3£¬Èç¹ûÍæ¼ÒÓÐ¶ÓÎé£¬²¢ÇÒÕâ¸öÍæ¼ÒÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼ººÍ¸½½ü¶ÓÓÑÒ»Æð½øÈ¥

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- ´¦ÓÚÎÞ·¨Ö´ÐÐÂß¼­µÄ×´Ì¬
		return
	end
	
	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÓÐ¶ÓÎé
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- Ã»ÓÐ¶ÓÎé
		x401040_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x401040_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x401040_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x401040_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x401040_g_Fuben_X, x401040_g_Fuben_Z) ;
end


--**********************************
--ÓÐÍæ¼Ò½øÈë¸±±¾ÊÂ¼þ
--**********************************
function x401040_OnPlayerEnter( sceneId, selfId )
	-- 3,ÉèÖÃËÀÍöÊÂ¼þ
	
	-- ÉèÖÃÍæ¼ÒµÄÕóÓªÎª 109
	SetUnitCampID(sceneId, selfId, selfId, 109)
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x401040_g_Fuben_X, x401040_g_Fuben_Z )
	
	local nTimes = GetMissionData(sceneId,selfId, MD_YANZIWU_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_PRE_YANZIWU_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	SetMissionData(sceneId, selfId, MD_YANZIWU_TIMES, nTimes+1) 
	SetMissionData(sceneId, selfId, MD_PRE_YANZIWU_TIME, nCurTime)
	
end

--**********************************
--ÓÐÍæ¼ÒÔÚ¸±±¾ÖÐËÀÍöÊÂ¼þ
--**********************************
function x401040_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--·ÅÆú
--**********************************
function x401040_OnAbandon( sceneId, selfId )
	
end

--**********************************
--¼ÌÐø
--**********************************
function x401040_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x401040_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--Ìá½»
--**********************************
function x401040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x401040_OnDie( sceneId, objId, killerId )
	
end

--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x401040_TipAllHuman( sceneId, Str )
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

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x401040_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x401040_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x401040_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--Ã¿Ò»¹ØµÄÏµÍ³ÌáÊ¾ Ã¿¸ô15ÃëÓÉÏµÍ³·¢³öÃ¿Ò»¹ØµÄÌáÊ¾ÐÅÏ¢
--**********************************
function x401040_SystemTips( sceneId, nStep )
	if nStep == 1  then
		x401040_TipAllHuman(sceneId, "Có cao thü mu¯n ám sát Hô Diên Báo tß¾ng quân")
		x401040_TipAllHuman(sceneId, "Các hÕ phäi dùng thu§t khinh công ði trên lá sen ð¬ có th¬ ðªn kÏ hÕm chính")
	elseif nStep == 2  then
		x401040_TipAllHuman(sceneId, "Có r¤t nhi«u cao thü võ lâm ðªn tiªp vi®n cho phän t£c Mµ Dung")
		x401040_TipAllHuman(sceneId, "Hãy nhanh chóng ðªn ngån ch£n ði¬m hi®p trþ cho Ti«n Hoành Vû tß¾ng quân không cho phän t£c chi vi®n")
	elseif nStep == 3  then
		x401040_TipAllHuman(sceneId, "Có r¤t nhi«u cao thü võ lâm ðªn tiªp vi®n cho phän t£c Mµ Dung")
		x401040_TipAllHuman(sceneId, "Hãy nhanh chóng ðªn ngån ch£n ði¬m hi®p trþ cho Ti«n Hoành Vû tß¾ng quân không cho phän t£c chi vi®n")
	end
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼þ
--**********************************
function x401040_OnCopySceneTimer( sceneId, nowTime )
	
	local nStep = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_1);
	--PrintNum(nStep)
	-- nStep == 12 ÊÇ¸±±¾ÈÎÎñÊ§°Ü±ê¼Ç£¬½øÈëµ½ÕâÀï£¬Íæ¼ÒÖ»ÄÜ³ö¸±±¾ÁË£¬Ã»ÓÐ±ðµÄÊÂÇé¿É×÷
	if nStep == 13  then
		-- Ö´ÐÐ10Ãëºó°ÑÍæ¼Ò´«³ö³¡¾°µÄÂß¼­
		return
	end
	--PrintNum(nStep)
	-- ÔÀÀÏÈý°éËæÐ¡¹ÖµÄÅúÊý	
	local nTime = LuaFnGetCurrentTime()

	if nStep == 0  then
		x401040_CreateMonster_1(sceneId)
	end
	
	-- »ñµÃÉÏÒ»´ÎµÄÏµÍ³ÌáÊ¾Ê±¼ä
	local nPreSystemTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime)
	if nStep == 1  then
		if nTime-nPreSystemTime >= 15  then
			x401040_SystemTips( sceneId, 1 )
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime, nTime)
		end
	end
	
	if nStep == 2  then
		x401040_CreateMonster_2(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 3)
	end
	
--	-- ¿ØÖÆË¢°éËæÔÀÀÏÈýµÄÐ¡¹Ö
--	if nStep >=3 and nStep<9  then
--		local nStep1 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1)
--		local nPreTime=LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1_T)
--		if nStep1 < 2  then
--			if nTime-nPreTime >= 40  then
--				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1, nStep1+1)
--				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1_T,nTime)
--				-- Ë¢¹Ö
--				x401040_CreateMonster_6(sceneId)
--			end
--		end
--	end
	
	if nStep == 4  then
		x401040_CreateMonster_3(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 5)
	end
	
	if nStep == 6  then
		x401040_CreateMonster_5(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 7)
	end
	
	-- ¶ÎÑÓÇìËÀÍö£¬É¾³ý "Ò»Æ·ÌÃÎäÊ¿","Di®p Nh¸ Nß½ng"£¬"ÔÆÖÐº×"
	if nStep == 9  then
		--PrintNum(nStep)
		x401040_ClearMonsterByName(sceneId, "Nh¤t Ph¦m Ðß¶ng Võ Sî")
		x401040_TipAllHuman(sceneId, "Ðoàn Diên Khánh chiªn bÕi, thü hÕ cùng Nh¤t Ph¦m Ðß¶ng võ sî ð«u bö chÕy.")
		
		x401040_ClearMonsterByName(sceneId, "Di®p Nh¸ Nß½ng")
		x401040_ClearMonsterByName(sceneId, "Vân Trung HÕc")
		
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 10)
	end

	-- »ñµÃÉÏÒ»´ÎµÄÏµÍ³ÌáÊ¾Ê±¼ä
	local nPreSystemTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime)
	if nStep == 10  then
		if nTime-nPreSystemTime >= 15  then
			x401040_SystemTips( sceneId, 2 )
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime, nTime)
		end
	end
	
	-- Ë¢°´ÕÕÂ·ÏßÑ²ÂßµÄÐ¡¹Ö
	if nStep == 11  then
		local nStep1 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2)
		local nPreTime=LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T)
		
		if nStep1 == 0  then
			-- ×ª»» Ti«n Hoành Vû µÄÕóÓª
			local nNpcNum = GetMonsterCount(sceneId)
			for i=0, nNpcNum-1 do
				local nNpcId = GetMonsterObjID(sceneId,i)
				if GetName(sceneId, nNpcId)  == "Ti«n Hoành Vû"  then
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				end
			end
		end
		
		-- [NetCo4 30/09] nhay thang toi 5 dot cuoi (nStep1 22..26), dot dau ra ngay
		if x401040_g_ChiDot5 == 1 and nStep1 < 22  then
			nStep1 = 22
			nPreTime = 0
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, 22)
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T, 0)
		end
		
		if nStep1 < 10  then
			if nTime-nPreTime >= 30  then
			--if nTime-nPreTime >= 1  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T,nTime)
				-- Ë¢¹Ö
				x401040_CreateMonster_7_1(sceneId)
				x401040_CreateMonster_7_3(sceneId)
				
				x401040_TipAllHuman(sceneId, "Yªn TØ ‘ ðã trãi qua " .. nStep1+1 .. " ðþt t¤n công, còn lÕi " .. 25-(nStep1+1) .. " ðþt t¤n công næa")
				
				-- Ë¢ Ò¦²®µ±
				if nStep1==9  then
					x401040_CreateMonster_8(sceneId, 1)
				end
				
			end
		end
				
		
		-- Ë¢10²¨Ð¡¹Öºó£¬ÐèÒªÓÐÒ»¸ö90ÃëµÄµÈ´ýÊ±¼ä
		if nStep1 == 10  then
			if nTime-nPreTime >= 90  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
			end
		end
		
		if nStep1>=11 and nStep1<21  then
			if nTime-nPreTime >= 60  then
			--if nTime-nPreTime >= 1  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T,nTime)
				
				-- Ë¢¹Ö
				x401040_CreateMonster_7_4(sceneId)
				x401040_CreateMonster_7_3(sceneId)
				x401040_TipAllHuman(sceneId, "Yªn TØ ‘ ðã trãi qua " .. nStep1 .. " ðþt t¤n công, còn lÕi " .. 25-(nStep1) .. " ðþt t¤n công næa")
				
				if nStep1==20  then
					-- Ë¢ Ë¾ÂíÁÖ
					x401040_CreateMonster_8(sceneId, 2)
				end
				
			end
		end
		
		-- ÔÙ´ÎË¢10²¨Ð¡¹Öºó£¬ÔÙÓÐÒ»¸ö90ÃëµÄµÈ´ýÊ±¼ä
		if nStep1 == 21  then
			if nTime-nPreTime >= 90  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
			end
		end
		
		if nStep1>=22 and nStep1<27  then
			if nTime-nPreTime >= 90  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T,nTime)
				x401040_CreateMonster_7_2(sceneId)
				local nDaQua = nStep1-1
				local nConLai = 25-(nStep1-1)
				if x401040_g_ChiDot5 == 1  then
					nDaQua = nStep1-21
					nConLai = 5-nDaQua
				end
				x401040_TipAllHuman(sceneId, "Yªn TØ ‘ ðã trãi qua " .. nDaQua .. " ðþt t¤n công, còn lÕi " .. nConLai .. " ðþt t¤n công næa")
				
				if nStep1==26  then
					-- Ë¢ ð¯Ä¦ÖÇ
					x401040_CreateMonster_8(sceneId, 3)
					-- 
					LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 12)
				end
				
			end
		end
	end
	
	
	-- ´ò°Üð¯Ä¦ÖÇ£¬¼ì²âTi«n Hoành VûÊÇ²»ÊÇ»¹»î×Å£¬¿´µÚ¶þ²½ÊÇ³É¹¦»¹ÊÇÊ§°ÜÁË
	if nStep == 12  then
		local nNpcNum = GetMonsterCount(sceneId)
		local bOK = 0
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, nNpcId)  == "Ti«n Hoành Vû"  then
				bOK = 1
			end
		end
		
		if bOK == 1  then
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 15)
			-- Ë¢4ÃÅÉñ
			x401040_CreateMonster_9(sceneId)
			x401040_CreateMonster_10(sceneId)
			x401040_CreateMonster_11(sceneId)
			
			--Ä½ÈÝ¸´ÉíºóµÄ¹Ö
			x401040_CreateMonster_13(sceneId)
		else
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 501)
		end
	end
	
	-- 500 £¬Ê§°ÜÌõ¼þ1£¬Hô Diên Báo ËÀÍö
	local nLost = LuaFnGetCopySceneData_Param(sceneId, x401040_g_MissionLost)
	if nLost == 500  then
		CallScriptFunction((200060), "Paopao",sceneId, "Hô Diên Khánh", "Yªn TØ ‘", "Kª hoÕch tiªn vào Yªn TØ ‘ th¤t bÕi, b±i vì Hô Diên Báo tß¾ng quân chiªn bÕi. Chúng ta tr· v«, t§p hþp lÕi r°i hãy ðªn.")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, 1000)
	end
	
	-- 501£¬Ê§°ÜÌõ¼þ2£¬Ti«n Hoành Vû ËÀÍö
	if nLost == 501  then
		CallScriptFunction((200060), "Paopao",sceneId, "Hô Diên Khánh", "Yªn TØ ‘", "Kª hoÕch tiªn vào Yªn TØ ‘ th¤t bÕi, b±i vì Ti«n Hoành Vû tß¾ng quân chiªn bÕi. Chúng ta tr· v«, t§p hþp lÕi r°i hãy ðªn.")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, 1000)
	end
	
	local nCloaeTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_CloseTime)
	-- 1000 £¬µ¹¼ÆÊ±£¬30Ãëºó¹Ø±Õ¸±±¾
	if nLost == 1000 then
		x401040_TipAllHuman(sceneId, "Nhi®m vø th¤t bÕi, các hÕ s¨ r°i khöi sau 30 giây næa.")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	if nLost == 1001 and nTime-nCloaeTime>=15  then
		x401040_TipAllHuman(sceneId, "Nhi®m vø th¤t bÕi, các hÕ s¨ r°i khöi sau 15 giây næa.")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	if nLost == 1002 and nTime-nCloaeTime>=10  then
		x401040_TipAllHuman(sceneId, "Nhi®m vø th¤t bÕi, các hÕ s¨ r°i khöi sau 5 giây næa.")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	if nLost == 1003 and nTime-nCloaeTime>=5  then
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			NewWorld( sceneId, nPlayerId, x401040_g_Back_SceneId, x401040_g_Back_X, x401040_g_Back_Z) ;
		end
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	
	-- Á¬åóËþµÄÐÞÀí
	-- Èç¹ûÍæ¼Ò½»¹»ÁËÄ¾²Ä£¬¾Í¸Ä±äÕâ¸öËþµÄÕóÓª
	local jianta1 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_3)
	if jianta1 >= 5 and jianta1 < 1000  then
		x401040_ChangeNpc(sceneId, "Tháp liên n± trß¾c")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_3, jianta1+1000)
	end
	local jianta2 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_4)
	if jianta2 >= 5 and jianta2 < 1000  then
		x401040_ChangeNpc(sceneId, "Tháp liên n± sau")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_4, jianta2+1000)
	end
	local jianta3 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_5)
	if jianta3 >= 10 and jianta3 < 1000  then
		x401040_ChangeNpc(sceneId, "Tháp tr¸ li®u")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_5, jianta3+1000)
	end
	local jianta4 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_6)
	if jianta4 >= 5 and jianta4 < 1000  then
		x401040_ChangeNpc(sceneId, "Tháp phòng ngñ")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_6, jianta4+1000)
	end
	
	-- ¼¸¸ö¼ýËþ·Å¼¼ÄÜ
	if nStep >= 11   then
		if nTime-nPreSystemTime >=5  then
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime, nTime)
			if jianta1 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "Tháp liên n± trß¾c")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("Tháp liên n± trß¾c·Å¼¼ÄÜ")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1008,nNpcId,x,z,10,0)
					end
				end
			end
			
			if jianta2 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "Tháp liên n± sau")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("Tháp liên n± sau·Å¼¼ÄÜ")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1008,nNpcId,x,z,10,0)
					end
				end
			end
			
			if jianta3 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "Tháp tr¸ li®u")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("Tháp tr¸ li®u·Å¼¼ÄÜ")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1010,nNpcId,x,z,10,0)
					end
				end
			end
			
			if jianta4 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "Tháp phòng ngñ")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("Tháp phòng ngñ·Å¼¼ÄÜ")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1009,nNpcId,x,z,10,0)
					end
				end
			end
			
		end
	end
	
	-- Vß½ng Ngæ YênµãÃû
	-- ÍõÓïÑÔ¿ªÊ¼µãÃûµÄ¿ª¹Ø
	-- x401040_g_bWangyuyanSpeak = 24
	-- x401040_g_bWangyuyanSpeak_T = 27
	local bSpeak = LuaFnGetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak)
	local nSpeakTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T)
	if bSpeak == 1  then
		CallScriptFunction((200060), "Paopao",sceneId, "Vß½ng Ngæ Yên", "Yªn TØ ‘", "Ðoàn công tØ, chúng ta hãy giúp bi¬u ca mµt tay?")
		
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 2)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
	
	elseif bSpeak == 2 and nTime - nSpeakTime >= 1  then
		CallScriptFunction((200060), "Paopao",sceneId, "Ðoàn Dñ", "Yªn TØ ‘", "Vß½ng cô nß½ng có m®nh gì, tÕi hÕ t¤t nhiên là mu¯n l¥n chªt ch¾ t× ch¯i #70")
		
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 3)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
		
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, nNpcId)  == "Ðoàn Dñ"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				SetUnitCampID(sceneId, nNpcId, nNpcId, 110)
				SetNPCAIType(sceneId, nNpcId, 27)
				SetAIScriptID(sceneId, nNpcId, 245)
				--PrintNum(222)
			end
			if GetName(sceneId, nNpcId)  == "Vß½ng Ngæ Yên"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
				SetUnitCampID(sceneId, nNpcId, nNpcId, 110)
			end
		end
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 3)

	elseif bSpeak == 3 and nTime - nSpeakTime >= 20  then
		CallScriptFunction((200060), "Paopao",sceneId, "Ðoàn Dñ", "Yªn TØ ‘", "#18#18#18 Vß½ng cô nß½ng th§t là ngÕi quá, ngß¶i xem ta này Løc MÕch Th¥n Kiªm khi linh khi m¤t linh...")
	
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 4)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
	
	elseif bSpeak == 4 and nTime - nSpeakTime >= 1  then
		CallScriptFunction((200060), "Paopao",sceneId, "Vß½ng Ngæ Yên", "Yªn TØ ‘", "#20#20#20 LÕi ðây này... Vçn là ta mµt mình ðªn cÑu bi¬u ca.")
	
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 5)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
	
	elseif bSpeak == 5  then
		if nTime-nSpeakTime >= 10  then
			x401040_GiveDirections(sceneId)
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
		end
		
--	else
--		local nNpcNum = GetMonsterCount(sceneId)
--		for i=0, nNpcNum-1 do
--			local nNpcId = GetMonsterObjID(sceneId,i)
--			if GetName(sceneId, nNpcId)  == "Ðoàn Dñ"  then
--				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
--				SetUnitCampID(sceneId, nNpcId, nNpcId, 109)
--				--PrintNum(222)
--			end
--			if GetName(sceneId, nNpcId)  == "Vß½ng Ngæ Yên"  then
--				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
--				SetUnitCampID(sceneId, nNpcId, nNpcId, 109)
--			end
--		end
		
	end
	
	local bSpeak = LuaFnGetCopySceneData_Param(sceneId, x401040_g_DuanAndWangFlag)
 	if bSpeak == 1 then
		CallScriptFunction((200060), "Paopao",sceneId, "Vß½ng Ngæ Yên", "Yªn TØ ‘", "Bi¬u ca, cÑu ta!")
		CallScriptFunction((200060), "Paopao",sceneId, "Ðoàn Dñ", "Yªn TØ ‘", "Vß½ng cô nß½ng, ta t¾i cÑu cô!")
 		
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, nNpcId)  == "Ðoàn Dñ"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				SetUnitCampID(sceneId, nNpcId, nNpcId, 110)
				SetAIScriptID(sceneId, nNpcId, 246)
				--PrintNum(222)
			end
		end
 		LuaFnSetCopySceneData_Param(sceneId, x401040_g_DuanAndWangFlag, 2)
 	end
	
	
end

--**********************************
--´ÓÃû×Ö»ñµÃNpcId
--**********************************
function x401040_NameToId(sceneId, szName)
	local nNpcId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			nNpcId = nMonsterId
		end
	end
	return nNpcId
end

--**********************************
--µÚÒ»´ÎÉú³É¹ÖÎï
--**********************************
function x401040_CreateMonster_1(sceneId)
	-- ÉèÖÃË¢¹Ö
	if LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_1) == 0  then
		
		-- Ë¢Ð¡¹Ö£¬ ËÎ¾üÊ¿±ø£¬Ò»Æ·ÌÃÎäÊ¿£¬Yªn TØ ‘¼Ò¶¡
		for i, Npc in x401040_g_Npc_1  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y,	Npc.ai, Npc.af, -1)
			local szName = GetName(sceneId, nNpcId)
			SetUnitCampID(sceneId,nNpcId,nNpcId,Npc.camp)
			
			if szName == "T¯ng quân binh sî"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				
			elseif szName == "Nh¤t Ph¦m Ðß¶ng Võ Sî"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				
			elseif szName == "Yªn TØ ‘ gia ðình"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			end
		end
		
		-- Ë¢Npc£¬ÓÐ½Å±¾µÄNpc
		for i, Npc in x401040_g_Npc_2  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
		end
		
		for i, Npc in x401040_g_Npc_2_1  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
		end
		
		-- Ë¢Ti«n Hoành Vû
		for i, Npc in x401040_g_Npc_6  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
		end
		
		-- Ë¢Á¬åóËþ
		for i, Npc in x401040_g_Npc_7  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
			local szName = GetName(sceneId, nNpcId)
			SetCharacterName(sceneId, nNpcId, Npc.name .. szName )
		end
	
		-- ¼ÇÂ¼ÏÂµÚÒ»Åú¹ÖÒÑ¾­Ë¢Íæ
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 1) 
		
	end
	
end

--**********************************
-- Éú³ÉÔÀÀÏÈý
--**********************************
function x401040_CreateMonster_2(sceneId)
	for i, Npc in x401040_g_Npc_3  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		if GetName(sceneId,nNpcId) == "NhÕc Lão Tam"   then
			LuaFnNpcChat(sceneId, nNpcId, 0, "C¦u quan, ta NhÕc Lão Nh¸ ðªn giªt ngß¶i, chÕy nhanh lÕi ðây ðem ð¥u cho ta, hãy nÕp mÕng!")
		end
	end
	
	x401040_CreateMonster_6(sceneId)
	
	-- ×ª»» Hô Diên Báo µÄÕóÓª
	local nNpcNum = GetMonsterCount(sceneId)
	for i=0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nNpcId)  == "Hô Diên Báo"  then
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			return
		end
	end
end

--**********************************
-- ÔÀÀÏÈýËÀ£¬´´½¨ Ò¶¶þÄï£¬ÔÆÖÐºÍ
--**********************************
function x401040_CreateMonster_3(sceneId)
	for i, Npc in x401040_g_Npc_4  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
	x401040_CreateMonster_6(sceneId)
end

--**********************************
-- Ò¶¶þÄï£¬ÔÆÖÐºÍ Á½ÈËÆäÖÐÒ»¸öËÀÁË£¬Ë¢¶ÎÑÓÇì
--**********************************
function x401040_CreateMonster_5(sceneId)
	for i, Npc in x401040_g_Npc_5  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
	x401040_CreateMonster_6(sceneId)
end

--**********************************
-- ÐÞÀí¼ýËþ
--**********************************
function x401040_ChangeNpc(sceneId, szName)
	local nNpcNum = GetMonsterCount(sceneId)
	for i=0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nNpcId)  == szName  then
			SetUnitCampID(sceneId,nNpcId, nNpcId, 109)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			LuaFnNpcChat(sceneId, nNpcId, 0, szName .. "ðã tu sØa thành công")
		end
	end
end

--**********************************
-- Éú³ÉÔÀÀÏÈýÖ®ºó£¬°éËæË¢³öµÄÐ¡¹Ö
--**********************************
function x401040_CreateMonster_6(sceneId)
	for i, Npc in x401040_g_Npc_8  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- ºÍºêÓî¶Ô»°ºóË¢µÄ¹Ö£¬1
--**********************************
function x401040_CreateMonster_7_1(sceneId)
	for i, Npc in x401040_g_Npc_9  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
-- ºÍºêÓî¶Ô»°ºó£¬ÔÚÅ¼Êý´ÎË¢³öµÄÄ¾ÈË¿þÀÜ
--**********************************
function x401040_CreateMonster_7_3(sceneId)
	for i, Npc in x401040_g_Npc_9_1  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end


--**********************************
-- ºÍºêÓî¶Ô»°ºó£¬ÔÚ50-100²¨Ë¢³öµÄÇà³ÇÅÉµÜ×Ó
--**********************************
function x401040_CreateMonster_7_4(sceneId)
	for i, Npc in x401040_g_Npc_9_2  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
-- ºÍºêÓî¶Ô»°ºóË¢µÄ¹Ö£¬2
--**********************************
function x401040_CreateMonster_7_2(sceneId)
	for i, Npc in x401040_g_Npc_10  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
-- ºÍºêÓî¶Ô»°ºó Ë¢ Ò¦²®µ± Ë¾ÂíÁÖ ð¯Ä¦ÖÇ
--**********************************
function x401040_CreateMonster_8(sceneId, nIndex)
	local Npc = x401040_g_Npc_11[nIndex]
	local nNpcId
	if nIndex == 3  then
		nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
	else
		nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
	end
	SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
	SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	SetPatrolId(sceneId, nNpcId, Npc.pp)
end

--**********************************
-- Ë¢4ÃÅÉñ
--**********************************
function x401040_CreateMonster_9(sceneId)
	for i, Npc in x401040_g_Npc_12  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId, nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		
		SetMonsterGroupID(sceneId, nNpcId, 99)
	end
end

--**********************************
-- Ë¢ ×Üboss Ä½ÈÝ¸´
--**********************************
function x401040_CreateMonster_10(sceneId)
	for i, Npc in x401040_g_Npc_13  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- Ë¢ Vß½ng Ngæ Yên  Ðoàn Dñ
--**********************************
function x401040_CreateMonster_11(sceneId)
	for i, Npc in x401040_g_Npc_14  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- ºÍÄ½ÈÝ¸´¿ª´òºó£¬²»¶ÏË¢³öµÄ¼Ò¶¡ £¨ÒÑ¾­É¾³ýÁËÕâÐ©¹Ö£¬²»ÔÙË¢ÁË£©
--**********************************
function x401040_CreateMonster_12(sceneId)
	for i, Npc in x401040_g_Npc_15  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- Ä½ÈÝ¸´ ÉíºóµÄ¼Ò¶¡ £¨ÒÑ¾­É¾³ýÁËÕâÐ©¹Ö£¬²»ÔÙË¢ÁË£©
--**********************************
function x401040_CreateMonster_13(sceneId)
	for i, Npc in x401040_g_Npc_16  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- Çå³ý³¡¾°ÄÚµÄXX¹Ö
--**********************************
function x401040_ClearMonsterByName(sceneId, szName)
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
end

--**********************************
-- Vß½ng Ngæ YênµÄµãÃû
--**********************************
function x401040_GiveDirections(sceneId)
	-- ÏÈ¿´Vß½ng Ngæ YênÊÇ²»ÊÇ»¹»î×Å
	local nWangId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== "Vß½ng Ngæ Yên"  then
			nWangId = nMonsterId
		end
	end
	-- Vß½ng Ngæ YênÒÑ¾­²»ÔÚ³¡¾°ÄÚ£¬ÎÞ·¨µãÃûÁË
	if nWangId == -1  then
		return
	end
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local nRand = random( 1, nHumanCount ) - 1
	local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,nRand)
	-- ÐèÒª¼ì²âÍæ¼ÒÊÇ²»ÊÇ´¦ÓÚËÀÍö×´Ì¬£¬ËÀÍö×´Ì¬²»ÄÜ¼Ó buff
	
	LuaFnSendSpecificImpactToUnit(sceneId, nWangId, nWangId, nHumanId, 10188, 2000 )
	local szHumanName = GetName(sceneId, nHumanId)
	local str1 = "Vß½ng Ngæ Yên ðang chú ý t¾i " .. szHumanName .. " xin hãy c¦n th§n!"
	
	local str = x401040_GetDirectionsDesc(GetMenPai(sceneId, nHumanId))
	CallScriptFunction((200060), "Paopao",sceneId, "Vß½ng Ngæ Yên", "Yªn TØ ‘", str)
	
	x401040_TipAllHuman(sceneId, str1)
end

--**********************************
-- Í¨ÓÃ´´½¨¹ÖÎïº¯Êý
--**********************************
function x401040_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script)
	local PlayerLevel = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_7)
	local ModifyLevel = 0
	if PlayerLevel >= 10   then
		ModifyLevel = 1
	end
	if PlayerLevel >= 20   then
		ModifyLevel = 2
	end
	if PlayerLevel >= 30   then
		ModifyLevel = 3
	end
	if PlayerLevel >= 40   then
		ModifyLevel = 4
	end
	if PlayerLevel >= 50   then
		ModifyLevel = 5
	end
	if PlayerLevel >= 60   then
		ModifyLevel = 6
	end
	if PlayerLevel >= 70   then
		ModifyLevel = 7
	end
	if PlayerLevel >= 80   then
		ModifyLevel = 8
	end
	if PlayerLevel >= 90   then
		ModifyLevel = 9
	end
	--npcµÈ¼¶À©Õ¹ÖÁ200
	if PlayerLevel >= 100   then         
		ModifyLevel = 30001
	end
	if PlayerLevel >= 110   then         
		ModifyLevel = 30002
	end
	if PlayerLevel >= 120   then         
		ModifyLevel = 30003
	end
	if PlayerLevel >= 130   then         
		ModifyLevel = 30004
	end
	if PlayerLevel >= 140   then         
		ModifyLevel = 30005
	end
	local nNpcId = NpcId + ModifyLevel-1
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel)
	
	-- ¿´ÓÐÃ»ÓÐÉèÖÃ³ÆºÅ£¬ÓÐ¾Í¼Ó³ÆºÅ
	x401040_SetNpcTitle(sceneId, nMonsterId)
	
	return nMonsterId
end

--**********************************
-- ÃÅÅÉIdµ½ÃÅÅÉÃû³Æ
--**********************************
function x401040_GetDirectionsDesc(MenpaiId)
	
	local str = ""

	if MenpaiId == 0  then
		str = "Ði¬m yªu cüa phái thiªu lâm n¢m · huy®t ðÕi chÆm"
	elseif MenpaiId == 1  then
		str = "Ði¬m yªu cüa phái minh giáo n¢m · huy®t linh ðài"
	elseif MenpaiId == 2  then
		str = "Ði¬m yªu cüa phái cái bang n¢m · huy®t thái dß½ng"
	elseif MenpaiId == 3  then
		str = "Ði¬m yªu cüa phái võ ðang n¢m · huy®t bách hµi"
	elseif MenpaiId == 4  then
		str = "Ði¬m yªu cüa phái nga my n¢m · huy®t th¥n ðình"
	elseif MenpaiId == 5  then
		str = "Ði¬m yªu cüa phái tinh tuc n¢m · huy®t quan nguyên"
	elseif MenpaiId == 6  then
		str = "Ði¬m yªu cüa phái thiên long n¢m · huy®t á môn"
	elseif MenpaiId == 7  then
		str = "Ði¬m yªu cüa phái thiên s½n n¢m · huy®t phª du"
	elseif MenpaiId == 8  then
		str = "Ði¬m yªu cüa phái tiêu dao n¢m · huy®t vî lß"
	end
	
	return str
end

--**********************************
-- ÃÅÅÉIdµ½ÃÅÅÉÃû³Æ
--**********************************
function x401040_SetNpcTitle(sceneId, nNpcId)
	
	local szName = GetName(sceneId, nNpcId)
	
	if szName == "Hô Diên Khánh"   then
		SetCharacterTitle(sceneId, nNpcId, "Thái H° Thüy Quân ÐÕi Ðô Ð¯c")
	elseif szName == "Hô Diên Báo"   then
		SetCharacterTitle(sceneId, nNpcId, "KÏ HÕm Ðµi Trß·ng")
	elseif szName == "Ti«n Hoành Vû"   then
		SetCharacterTitle(sceneId, nNpcId, "Hi®u Úy Tô châu")
	elseif szName == "NhÕc Lão Tam"   then
		SetCharacterTitle(sceneId, nNpcId, "Hung Th¥n Ác Sát")
	elseif szName == "Di®p Nh¸ Nß½ng"   then
		SetCharacterTitle(sceneId, nNpcId, "Vô Ác B¤t Tác")
	elseif szName == "Vân Trung HÕc"   then
		SetCharacterTitle(sceneId, nNpcId, "Cùng Hung Cñc Ác")
	elseif szName == "Ðoàn Diên Khánh"   then
		SetCharacterTitle(sceneId, nNpcId, "Ác Quán Mãn Doanh")
	elseif szName == "Diêu Bá Ðß½ng"   then
		SetCharacterTitle(sceneId, nNpcId, "Môn chü t¥n gia trÕi")
	elseif szName == "Tß Mã Lâm"   then
		SetCharacterTitle(sceneId, nNpcId, "Chü nhân phái thanh thành")
	elseif szName == "Cßu Ma Trí"   then
		SetCharacterTitle(sceneId, nNpcId, "ÐÕi Luân Minh Vß½ng")
	elseif szName == "Mµ Dung Phøc"   then
		SetCharacterTitle(sceneId, nNpcId, "Ð¦u Chuy¬n Tinh Di")
	
	end
end

