-- 402040 
-- õí¾Ï¸±±¾

--************************************************************************

--½Å±¾ºÅ
x402040_g_ScriptId = 402040
x402040_g_MocSuaLoi = 1790876753   -- [NetCo4 02/10] giay unix luc sua loi khong ra quai

x402040_TIME_2000_01_03_ = 946828868

--************************************************************************

--¸±±¾Ãû³Æ
x402040_g_CopySceneName = "Mçu ðan uy¬n"

x402040_g_CopySceneType = FUBEN_CUJU	--¸±±¾ÀàÐÍ,¶¨ÒåTÕi ScriptGlobal.luaÀïÃæ

x402040_g_CopySceneMap = "cuju.nav"
x402040_g_Exit = "cuju.ini"
x402040_g_LimitMembers = 1				--¿ÉÒÔ½ø¸±±¾toÕ ðµ ×îÐ¡¶ÓÎéÈËÊý
x402040_g_TickTime = 1						--»Øµ÷½Å±¾toÕ ðµ Ê±ÖÓÊ±¼ä(µ¥Î»:  giây/´Î)
x402040_g_LimitTotalHoldTime = 360--¸±±¾¿ÉÒÔ´æ»îtoÕ ðµ Ê±¼ä(µ¥Î»: ´ÎÊý),Èç¹û´ËÊ±¼äµ½ÁË,ÔòÈÎÎñ½«»áth¤t bÕi
x402040_g_LimitTimeSuccess = 500	--¸±±¾Ê±¼äÏÞÖÆ(µ¥Î»: ´ÎÊý),Èç¹û´ËÊ±¼äµ½ÁË,ÈÎÎñÍê³É
x402040_g_CloseTick = 3						--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±(µ¥Î»: ´ÎÊý)
x402040_g_NoUserTime = 300				--¸±±¾ÖÐÃ»ÓÐÈËºó¿ÉÒÔ¼ÌÐø±£´ætoÕ ðµ Ê±¼ä(µ¥Î»:  giây)
x402040_g_DeadTrans = 0						--ËÀÍö×ªÒÆÄ£Ê½,0: ËÀÍöºó»¹¿ÉÒÔ¼ÌÐøTÕi ¸±±¾,1: ËÀÍöºó±»Ç¿ÖÆÒÆ³ö¸±±¾
x402040_g_Fuben_X = 38						--½øÈë¸±±¾toÕ ðµ Î»ÖÃX
x402040_g_Fuben_Z = 32						--½øÈë¸±±¾toÕ ðµ Î»ÖÃZ
x402040_g_Back_X = 202							--Ô´³¡¾°Î»ÖÃX
x402040_g_Back_Z = 55							--Ô´³¡¾°Î»ÖÃZ
x402040_g_Back_SceneId = 0				--Ô´³¡¾°Id

x402040_g_BossPoint={x=61, z=57}

x402040_g_MonsterPoint=
{
	{x=41,z=32},{x=46,z=32},{x=51,z=32},{x=56,z=32},{x=61,z=32},{x=66,z=32},
	{x=71,z=32},{x=76,z=32},{x=81,z=32},{x=86,z=32},{x=86,z=37},{x=86,z=42},
	{x=86,z=47},{x=86,z=52},{x=86,z=57},{x=86,z=62},{x=86,z=67},{x=86,z=72},
	{x=86,z=77},{x=86,z=82},{x=86,z=87},{x=86,z=92},{x=86,z=97},{x=86,z=102},
	{x=81,z=102},{x=76,z=102},{x=71,z=102},{x=66,z=102},{x=61,z=102},{x=56,z=102},
	{x=51,z=102},{x=46,z=102},{x=41,z=102},{x=41,z=97},{x=41,z=92},{x=41,z=87},
	{x=41,z=82},{x=41,z=77},{x=41,z=72},{x=41,z=67},{x=41,z=62},{x=41,z=57},
	{x=41,z=52},{x=41,z=47},{x=41,z=42},{x=41,z=37},{x=46,z=37},{x=51,z=37},
	{x=56,z=37},{x=61,z=37},{x=66,z=37},{x=71,z=37},{x=76,z=37},{x=81,z=37},
	{x=81,z=42},{x=81,z=47},{x=81,z=52},{x=81,z=57},{x=81,z=62},{x=81,z=67},
	{x=81,z=72},{x=81,z=77},{x=81,z=82},{x=81,z=87},{x=81,z=92},{x=81,z=97},
	{x=76,z=97},{x=71,z=97},{x=66,z=97},{x=61,z=97},{x=56,z=97},{x=51,z=97},
	{x=46,z=97},{x=46,z=92},{x=46,z=87},{x=46,z=82},{x=46,z=77},{x=46,z=72},
	{x=46,z=67},{x=46,z=62},{x=46,z=57},{x=46,z=52},{x=46,z=47},{x=46,z=42},
	{x=51,z=42},{x=56,z=42},{x=61,z=42},{x=66,z=42},{x=71,z=42},{x=76,z=42},
	{x=76,z=47},{x=76,z=52},{x=76,z=57},{x=76,z=62},{x=76,z=67},{x=76,z=72},
	{x=76,z=77},{x=76,z=82},{x=76,z=87},{x=76,z=92},{x=71,z=92},{x=66,z=92},
	{x=61,z=92},{x=56,z=92},{x=51,z=92},{x=51,z=87},{x=51,z=82},{x=51,z=77},
	{x=51,z=72},{x=51,z=67},{x=51,z=62},{x=51,z=57},{x=51,z=52},{x=51,z=47},
	{x=56,z=47},{x=61,z=47},{x=66,z=47},{x=71,z=47},{x=71,z=52},{x=71,z=57},
	{x=71,z=62},{x=71,z=67},{x=71,z=72},{x=71,z=77},{x=71,z=82},{x=71,z=87},
	{x=66,z=87},{x=61,z=87},{x=56,z=87},{x=56,z=82},{x=56,z=77},{x=56,z=72},
	{x=56,z=67},{x=56,z=62},{x=56,z=57},{x=56,z=52},{x=61,z=52},{x=66,z=52},
	{x=66,z=57},{x=66,z=62},{x=66,z=67},{x=66,z=72},{x=66,z=77},{x=66,z=82},
	{x=61,z=82},{x=61,z=77},{x=61,z=72},{x=61,z=67},{x=61,z=62},
}

x402040_g_NianShouPoint = 
{
	{x=40,z=100},{x=40,z=92},{x=40,z=84},{x=40,z=76},{x=40,z=68},
	{x=40,z=60},{x=40,z=52}, {x=64,z=30},{x=50,z=30},{x=78,z=30},
	{x=90,z=100},{x=90,z=92},{x=90,z=84},{x=90,z=76},{x=90,z=68},
	{x=90,z=60},{x=90,z=52},{x=60,z=103},{x=50,z=103},{x=78,z=103},
	
}

-- ×ãÇò,²»»áÖ÷¶¯¹¥»÷		
-- Hoàng S¡c Túc C¥u
x402040_g_SmallMonsterId_1={3680,3681,3682,3683,3684,3685,3686,3687,3688,3689,33680,33681,33682,33683,33684,33685,33686,33687,33688,33689}
-- H°ng S¡c Túc C¥u
x402040_g_SmallMonsterId_2={3690,3691,3692,3693,3694,3695,3696,3697,3698,3699,33690,33691,33692,33693,33694,33695,33696,33697,33698,33699}
-- Lam S¡c Túc C¥u
x402040_g_SmallMonsterId_3={3700,3701,3702,3703,3704,3705,3706,3707,3708,3709,33700,33701,33702,33703,33704,33705,33706,33707,33708,33709}

-- ±äÉíºótoÕ ðµ Ö÷¶¯¹Ö Hoa S¡c Túc C¥u
x402040_g_MiddleMonsterId={3710,3711,3712,3713,3714,3715,3716,3717,3718,3719,33710,33711,33712,33713,33714,33715,33716,33717,33718,33719}

-- BOSS¹Ö Tôn MÛ MÛ (õí¾ÏÊ®ÈýÃÃ)
x402040_g_BossMonsterId={3720,3721,3722,3723,3724,3725,3726,3727,3728,3729,33720,33721,33722,33723,33724,33725,33726,33727,33728,33729}

--ÄêÊÞ
x402040_g_NianShouID  = {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211}
--Ðúng·ñ´´½¨toÕ ðµ ´ÎÊý
x402040_paramonce  = 14

-- ¼ÇÂ¼É±¹ÖÊýÁ¿toÕ ðµ ¸±±¾±äÁ¿
x402040_g_KillNum = 20

-- ´ó×ãÇò
x402040_g_BigFootBall = {9160,9170,9180,9190,39160,39170,39180,39190}

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x402040_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText() == 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BV« tr§n ð¤u Túc C¥u");
			AddText(sceneId,"#{CUDS_20071010}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 2,¼ì²âÍæ¼ÒÐúng²»Ðúng×é¶ÓÁË
	if LuaFnHasTeam(sceneId,selfId) ~= 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
			AddText(sceneId,"  Ho\224nh t\228o M\231u \208an Uy\172n ph\228i l\167p t\177 \240\181i m\190i c\243 th\172 tham gia, n\170u nh\223 ng\223\189i ch\239 ngh\238 l\224 bi\172u di\173n t\224i hoa, xin m\182i \240i tham gia Hoa S\189n Lu\167n Ki\170m \240i!");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 3,¼ì²âÍæ¼Ò¶ÓÎéÈËÊý
	if GetTeamSize(sceneId,selfId) < x402040_g_LimitMembers then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
			AddText(sceneId,"  \208\181i ng\251 kh\244ng \240\252 ng\223\182i, cho d\249 c\243 v\224o \240\223\254c c\251ng kh\244ng th\161ng n\177i, t\175t nh\164t l\224 kh\244ng n\234n \240i.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4,¼ì²âÍæ¼ÒÐúng²»Ðúng¶Ó³¤
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
			AddText(sceneId,"  Mu¯n thØ thách ta? G÷i nhóm trß·ng cüa các ngß½i ra ðây");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
		
	end
	
	-- 5,¼ì²âÐúng²»ÐúngÈË¶¼µ½Î»ÁË
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
			AddText(sceneId,"  Ðßþc r°i, ngß½i mu¯n nhanh vào tham gia tr§n ð¤u, hãy nhanh g÷i ðµi viên cüa ngß½i ðªn ðây");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--  ðÕt ðßþc¸½½üËùÓÐÍæ¼ÒÊý
	local nearteammembercount = GetNearTeamCount(sceneId, selfId)
	
	-- 6,¼ì²âÍæ¼ÒÐµi viên ÀïÍ·ÓÐÃ»ÓÐÉ±Æø¹ýÖØtoÕ ðµ 
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local pk_value = LuaFnGetHumanPKValue( sceneId, memId )
		if pk_value and pk_value > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
				AddText(sceneId,"  Trong ðµi có ngß¶i sát khí quá n£ng không thích hþp tiªn vào.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- 7,Íæ¼ÒµÈc¤p²»ÄÜµÍÓÚ30c¤p
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local level = GetLevel( sceneId, memId )
		if level < 30   then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
				AddText(sceneId,"  Trong nhóm cüa ngß½i có ngß¶i có ðÆng c¤p không ðü c¤p 30!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	
	-- 8,¼ì²âÐúng²»ÐúngÓÐÈËÒÑ¾­²Î¼Ó¹ýõí¾Ï»î¶¯
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local time = GetMissionData(sceneId, memId, MD_CUJU_PRE_TIME)
		if time < x402040_g_MocSuaLoi then   -- [NetCo4 02/10] luot vao truoc khi sua loi khong ra quai (cap 119) -> khong tinh 24 gio
			time = 0
		end
		local nCurTime = LuaFnGetCurrentTime()
		-- ¿´ÉÏ´Î²Î¼ÓtoÕ ðµ Ê±¼äÐúng²»ÐúngºÍÏÖTÕi ÓÐ12cáiÐ¡Ê±ÒÔÉÏtoÕ ðµ CD CVH
		if nCurTime-time < 60*60*24   then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
				AddText(sceneId,"  Ð×ng cho là ta chï biªt ng¡m xem mÛ næ thôi sao. Nhìn ngß½i là ta nh§n ra ngay! Ngß½i không phäi m¾i v×a ðã tham gia quá tr§n ð¤u  sao?#G Xin m¶i sau 24 gi¶  næa hãy ðªn tìm ta!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	
	-- 9,Ã¿cáiÐµi viên ¶¼C¥n Ç°6ÖÖÐÄ·¨´ïµ½30c¤p CVH
	--for	i=0, nearteammembercount-1    do
	--	local memId = GetNearTeamMember(sceneId, selfId, i)
	--	if x402040_CheckAllXinfaLevel(sceneId, memId, 30) == 0  then
	--		BeginEvent(sceneId)
	--			AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n");
	--			AddText(sceneId,"  Trong ðµi ngû cüa ngß½i có ðµi viên  tâm pháp c¤p b§c không ðü 30 c¤p, khä nång không th¬ thích Ñng Mçu Ð½n Uy¬n.");
	--		EndEvent(sceneId)
	--		DispatchEventList(sceneId,selfId,targetId)
	--		return
	--	end
	--end
	
	-- 10,Thöa mãnËùÓÐÌõ¼þÁË CVH
	local str = "Ta chính thÑc tuyên b¯ " .. GetName(sceneId,selfId) .. " c\249ng \240\181i ng\251 \240\227 c\243 th\172 ch\237nh th\209c v\224o s\226n, tham gia qu\233t s\213ch M\231u \208an Uy\172n t\250c c\165u (m\178i 24 gi\182 m\181t l\165n)!#r" .. GetName(sceneId,selfId) .. "#W, chúc ngß½i may m¡n."
	BeginEvent(sceneId)
		AddText(sceneId,"#BHoành täo M¦u Ðan Uy¬n")
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x402040_MakeCopyScene(sceneId, selfId)
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x402040_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x402040_g_ScriptId, "Liên quan hµi thi Túc C¥u",11 ,1  )
	--AddNumText( sceneId, x402040_g_ScriptId, "#cff6633Phø Bän TÕm Ðóng"  )	
	AddNumText( sceneId, x402040_g_ScriptId, "Thiên long Túc C¥u",10 ,-1  )
end

--**********************************
--¼ì²âTiªp thøÌõ¼þ
--**********************************
function x402040_CheckAccept( sceneId, selfId )
	
end

--**********************************
--Ñ¯ÎÊÍæ¼ÒÐúng·ñÒª½øÈë¸±±¾
--**********************************
function x402040_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Tiªp thø
--**********************************
function x402040_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x402040_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x402040_MakeCopyScene( sceneId, selfId )
	
	-- Ê¹ÓÃÐµi viên toÕ ðµ µÈc¤pÀ´Ëã³ö¹ÖÎïtoÕ ðµ µÈc¤p
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
	
	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x402040_g_CopySceneMap); --µØÍ¼Ðúng±ØÐëÑ¡È¡toÕ ðµ ,¶øÇÒ±ØÐëTÕi Config/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402040_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x402040_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x402040_g_CopySceneType);--ÉèÖÃ¸±±¾Êý¾Ý,ÕâÀï½«0ºÅË÷ÒýtoÕ ðµ Êý¾ÝÉèÖÃÎª999,ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êý×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402040_g_ScriptId);--½«1ºÅÊý¾ÝÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼þ½Å±¾ºÅ
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊý
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)	--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param(sceneId, 4, x);				--ÉèÖÃ¸±±¾toÕ ðµ Èë¿Ú³¡¾°Î»ÖÃx
	LuaFnSetCopySceneData_Param(sceneId, 5, z);				--ÉèÖÃ¸±±¾toÕ ðµ Èë¿Ú³¡¾°Î»ÖÃZ
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --±£´æ¶ÓÎéºÅ
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--É±ËÀBosstoÕ ðµ ÊýÁ¿
	
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
		iniLevel = floor(PlayerMaxLevel/10);   -- [NetCo4 02/10] cap toi da server = 119 -> 119/10 = 11.9 tra bang ra nil -> doi cap 119+ khong ra quai
	end

	-- Ê¹ÓÃ¸±±¾±äÁ¿8,9,10À´±£´æ¹ÖÎï±àºÅ
	LuaFnSetCopySceneData_Param(sceneId, 8, x402040_g_SmallMonsterId_1[iniLevel]) --Ð¡¹ÖID
	LuaFnSetCopySceneData_Param(sceneId, 9, x402040_g_SmallMonsterId_2[iniLevel]) --Ð¡¹ÖID
	LuaFnSetCopySceneData_Param(sceneId,10, x402040_g_SmallMonsterId_3[iniLevel]) --Ð¡¹ÖID

	LuaFnSetCopySceneData_Param(sceneId,11, x402040_g_MiddleMonsterId[iniLevel])--TinhÓ¢ID
	LuaFnSetCopySceneData_Param(sceneId,12, x402040_g_BossMonsterId[iniLevel]) 	--BossID
	
	-- Ê¹ÓÃµÚ11Î»,¼ÇÂ¼¹ÖÎïÊµ¼ÊtoÕ ðµ µÈc¤p
	LuaFnSetCopySceneData_Param(sceneId,13, mylevel)
	LuaFnSetCopySceneData_Param(sceneId,21, iniLevel-1)
	
	--ÉèÖÃ³¡¾°ÖÐtoÕ ðµ ¸÷ÖÖNpcºÍÇøÓò
	LuaFnSetSceneLoad_Area( sceneId, "cuju_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cuju_monster.ini" )

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
function x402040_OnCopySceneReady( sceneId, destsceneId )

	--½øÈë¸±±¾toÕ ðµ ¹æÔò
	-- 1,Èç¹ûCái này Íæ¼ÒÃ»ÓÐ×é¶Ó,¾Í´«ËÍCái này Íæ¼Ò×Ô¼º½øÈë¸±±¾
	-- 2, Èç¹ûÍæ¼ÒÓÐ¶ÓÎé,µ«ÐúngÍæ¼Ò²»Ðúng¶Ó³¤,¾Í´«ËÍ×Ô¼º½øÈë¸±±¾
	-- 3,Èç¹ûÍæ¼ÒÓÐ¶ÓÎé,²¢ÇÒCái này Íæ¼ÒÐúng¶Ó³¤,¾Í´«ËÍ×Ô¼ººÍ¸½½ü¶ÓÓÑmµt Æð½øÈ¥

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- ´¦ÓÚÎÞ·¨Ö´ÐÐÂß¼­toÕ ðµ ×´Ì¬
		return
	end

	-- ¼ì²âÍæ¼ÒÐúng²»ÐúngÓÐ¶ÓÎé
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- Ã»ÓÐ¶ÓÎé
		NewWorld( sceneId, leaderObjId, destsceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--ÓÐÍæ¼Ò½øÈë¸±±¾ÊÂ¼þ
--**********************************
function x402040_OnPlayerEnter( sceneId, selfId )
	
	-- 2,¼ÇÂ¼Ê±¼ä
	local nPreTime = GetMissionData(sceneId,selfId, MD_CUJU_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()

	SetMissionData(sceneId, selfId, MD_CUJU_PRE_TIME, nCurTime)
	
	-- 3,ÉèÖ giâyÀÍöÊÂ¼þ
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%50", -1, "0", sceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z )
	
end

--**********************************
--ÓÐÍæ¼ÒTÕi ¸±±¾ÖÐËÀÍöÊÂ¼þ
--**********************************
function x402040_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--·ÅÆú
--**********************************
function x402040_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- »Ø³Ç,Ö»ÓÐThành ph¯ ÈÎÎñ¸±±¾¿ÉÒÔµ÷ÓÃ´Ë½Ó¿Ú
--**********************************
function x402040_BackToCity( sceneId, selfId )
	
end

--**********************************
--¼ÌÐø
--**********************************
function x402040_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--¼ì²âÐúng·ñ¿ÉÒÔÌá½»
--**********************************
function x402040_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--Ìá½»
--**********************************
function x402040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x402040_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x402040_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x402040_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼þ
--**********************************
function x402040_OnCopySceneTimer( sceneId, nowTime )
--	local once = LuaFnGetCopySceneData_Param( sceneId, x402040_paramonce )
--
--	if (once == 0) then
--	
--		LuaFnSetCopySceneData_Param(sceneId, x402040_paramonce, 1)
--		--ÄêÊÞÈëÇÖ
--		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 13 )
--	
--		local PlayerMaxLevel = GetHumanMaxLevelLimit()
--		local iniLevel;
--		if mylevel < 10 then
--			iniLevel = 10;
--		elseif mylevel < PlayerMaxLevel then
--			iniLevel = floor(mylevel/10) * 10;
--		else
--			iniLevel = PlayerMaxLevel;
--		end
--	
--		local iNianShouIdx = iniLevel / 10
--	
--		for i=1, 20 do
--			local objId = LuaFnCreateMonster( sceneId, x402040_g_NianShouID[iNianShouIdx], x402040_g_NianShouPoint[i].x, x402040_g_NianShouPoint[i].z, 1, 272, -1)
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end

		local nKillNum = LuaFnGetCopySceneData_Param(sceneId, 20)
		
		--PrintNum(nKillNum)

	-- ¼ÆÊ±Æ÷Ö÷ÒªÒª°´ÕÕÊ±¼äÀ´°²ÅÅË¢¹Ö
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 15)
	local nCurTime = LuaFnGetCurrentTime()
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 16)

	local SmallMonsterId_1	= LuaFnGetCopySceneData_Param(sceneId, 8)
	local SmallMonsterId_2	= LuaFnGetCopySceneData_Param(sceneId, 9)
	local SmallMonsterId_3	= LuaFnGetCopySceneData_Param(sceneId,10)
	local MiddleMonsterId	= LuaFnGetCopySceneData_Param(sceneId,11)
	local BossMonsterId		= LuaFnGetCopySceneData_Param(sceneId,12)
	
	local nMonsterLevel = LuaFnGetCopySceneData_Param(sceneId,13)
	
	local nPreBossSpeakTime = LuaFnGetCopySceneData_Param(sceneId,20)
	
	local arrayex = 0;           --À©Õ¹100c¤pÒÔÉÏ,Êý×éÆ«ÒÆÁ¿
	local levelex = 0;           --À©Õ¹100c¤pÒÔÉÏ,´óHoa S¡c Túc C¥uµÈc¤pÆ«ÒÆÁ¿
	if(nMonsterLevel >= 110) then
	   arrayex = 4
	   levelex = 10
	end

	-- µÚmµt ´ÎÖ´ÐÐ¼ÆÊ±Æ÷	
	if nPreTime == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		x402040_TipAllHuman( sceneId, "Thiên Long Túc C¥u s¨ b¡t ð¥u sau 60 giây næa" )
		return
	end
	
	-- Ã¿¼ä¸ô10 giâyÌáÊ¾Íæ¼Ò,¡°Thiên Long Túc C¥u s¨ b¡t ð¥u sau AAs ..¡±
	if nStep==0 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thiên Long Túc C¥u s¨ b¡t ð¥u sau 50 giây næa" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==1 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thiên Long Túc C¥u s¨ b¡t ð¥u sau 40 giây næa" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==2 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thiên Long Túc C¥u s¨ b¡t ð¥u sau 30 giây næa" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==3 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thiên Long Túc C¥u s¨ b¡t ð¥u sau 20 giây næa" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==4 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thiên Long Túc C¥u s¨ b¡t ð¥u sau 10 giây næa" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime+5)
		return
	end
	
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)== "Hoàng S¡c Túc C¥u" or 
			 GetName(sceneId, nMonsterId)== "H°ng S¡c Túc C¥u" or 
			 GetName(sceneId, nMonsterId)== "Lam S¡c Túc C¥u" 		 then
			if nowTime - GetObjCreateTime(sceneId, nMonsterId) > 60000  then
				-- ¼ì²âCái này ¹ÖtoÕ ðµ µ±Ç°ÑªÁ¿Ðúng²»Ðúng´óÓÚ×î´óÑªÁ¿toÕ ðµ 1%,
				if GetHp(sceneId,nMonsterId) > 0  then
					-- É¾³ýCái này ¹Ö,TÕi Cái này Î»ÖÃ´´½¨mµt cáiÐÂtoÕ ðµ ¹Ö
					local PosX, PosZ = LuaFnGetWorldPos(sceneId, nMonsterId);
					PosX = floor(PosX);
					PosZ = floor(PosZ);
					
					LuaFnDeleteMonster(sceneId, nMonsterId)
					local nMiddleMonster = LuaFnCreateMonster(sceneId, MiddleMonsterId, PosX, PosZ, 3, 0, 402045);
					
					SetLevel(sceneId, nMiddleMonster, nMonsterLevel)
					SetNPCAIType(sceneId, nMiddleMonster, 0)
					SetCharacterName(sceneId, nMiddleMonster, "Hoa S¡c Túc C¥u")
				end
			end	
		end
		
		if GetName(sceneId, nMonsterId)== "Hoàng S¡c ÐÕi Túc C¥u" or 
			 GetName(sceneId, nMonsterId)== "H°ng S¡c ÐÕi Túc C¥u" or 
			 GetName(sceneId, nMonsterId)== "Lam S¡c ÐÕi Túc C¥u" 		 then
			if nowTime - GetObjCreateTime(sceneId, nMonsterId) > 60000  then
				-- ¼ì²âCái này ¹ÖtoÕ ðµ µ±Ç°ÑªÁ¿Ðúng²»Ðúng´óÓÚ×î´óÑªÁ¿toÕ ðµ 1%,
				if GetHp(sceneId,nMonsterId) > 0  then
					-- É¾³ýCái này ¹Ö,TÕi Cái này Î»ÖÃ´´½¨mµt cáiÐÂtoÕ ðµ ¹Ö
					local PosX, PosZ = LuaFnGetWorldPos(sceneId, nMonsterId);
					PosX = floor(PosX);
					PosZ = floor(PosZ);
					
					LuaFnDeleteMonster(sceneId, nMonsterId)
					local nIniLevel = LuaFnGetCopySceneData_Param(sceneId, 21)
					local nBigBallId =x402040_g_BigFootBall[4 + arrayex]+nIniLevel-levelex
					local nMiddleMonster = LuaFnCreateMonster(sceneId, nBigBallId, PosX, PosZ, 3, 0, 402045);
					
					SetLevel(sceneId, nMiddleMonster, nMonsterLevel)
					SetNPCAIType(sceneId, nMiddleMonster, 0)
					SetCharacterName(sceneId, nMiddleMonster, "Hoa S¡c Túc C¥u")
				end
			end	
		end
	end

	if nStep>=5 and nStep<154 and nCurTime-nPreBossSpeakTime>=60 then
		LuaFnSetCopySceneData_Param(sceneId,20,nCurTime)
		
		local nRand = random(6)
		local str = ""
		if nRand == 1  then
			str = "#{_BOSS4}#P:Chúng ta là ngß¶i n¯i nghi®p Túc C¥u Trung Hoa! Kª th×a cao c¥u ð°ng quán  quang vinh truy«n th¯ng!"
		elseif nRand == 2  then
			str = "#{_BOSS4}#P:Mau mau mau, phân biên lÕp! HÕ ð¬ lÕp! Truy«n trung lÕp! Ð¥u c¥u công môn lÕp!"
		elseif nRand == 3  then
			str = "#{_BOSS4}#P:Hoa S¡c Túc C¥u, Hoàng S¡c Túc C¥u, H°ng S¡c Túc C¥u, Lam S¡c Túc C¥ut, tÕi ðây mµt kh¡c linh h°n chiªm ðßþc!"
		elseif nRand == 4  then
			str = "#{_BOSS4}#P:Ð¥y tr¶i tinh ðÕi bi¬u  ta tôn mî mî  quang vinh truy«n th¯ng! Nó không phäi mµt ngß¶i! Nó không phäi mµt ngß¶i!"
		elseif nRand == 5  then
			str = "#{_BOSS4}#P:Ai nha các ngß½i häo b±n a! Hoàng S¡c Túc C¥u, ngß½i nói, ngß½i nhß thª nào t±ng ðÑng làm cho ngß¶i ta gia ðánh a?"
		else
			str = "#{_BOSS4}#P:Ngß½i lÕi ðánh Túc C¥u, ngß¶i ta s¨ không v¾i ngß½i t¯t l¡m!"
		end
		
		-- TÕi ³¡¾°·¶Î§ÄÚº°»°
		CallScriptFunction((200060), "Duibai",sceneId, "", "Mçu Ðan Uy¬n", str)
	end
	
	-- TÕi Ë¢µÚ20,50,120cái×ãÇòÖ®Ç°,C¥n ÓÐmµt Ð©Ð¡Çé½Ú
	if nStep==24 or nStep==54 or nStep==124  then
		local nStep_1 = LuaFnGetCopySceneData_Param(sceneId, 25)
		local nStep_1_T = LuaFnGetCopySceneData_Param(sceneId, 26)
		if nStep_1 == 0  then
			LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
			LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			
			local str = ""
			if nStep==24 then
				str = "#{_BOSS4}#P:Ð×ng quá ð¡c ý! Ch¶ ta thay ð±i ngß¶i! Lþi hÕi  còn tÕi m£t sau ðâu!"
			elseif nStep==24 then
				str = "#{_BOSS4}#P:Ai cß¶i ðáp cu¯i cùng! Ai cß¶i  t¯t nh¤t! Ta còn mu¯n thay ð±i ngß¶i!"
			else
				str = "#{_BOSS4}#P:Ngß½i xong r°i! Ta mu¯n ðªn lßþt ta cß¶ng ðÕi nh¤t ð¸a c¥u ðµi lên sân kh¤u !"
			end
			CallScriptFunction((200060), "Duibai",sceneId, "", "Mçu Ðan Uy¬n", str)
			x402040_TipAllHuman( sceneId, "Tôn MÛ MÛ thïnh c¥u thay ð±i ngß¶i, 30 giây sau tr§n ð¤u tiªp tøc tiªn hành." )
			
		elseif nStep_1 == 1  then
			if nCurTime-nStep_1_T >= 10 then
				x402040_TipAllHuman( sceneId, "Tôn MÛ MÛ thïnh c¥u thay ð±i ngß¶i, 20 giây sau tr§n ð¤u tiªp tøc tiªn hành." )
				
				LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
				LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			end
			
		elseif nStep_1 == 2  then
			if nCurTime-nStep_1_T >= 10 then
				x402040_TipAllHuman( sceneId, "Tôn MÛ MÛ thïnh c¥u thay ð±i ngß¶i, 10 giây sau tr§n ð¤u tiªp tøc tiªn hành." )
				
				LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
				LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			end
			
		elseif nStep_1 == 3  then
			if nCurTime-nStep_1_T >= 10 then
				x402040_TipAllHuman( sceneId, "Tr§n ð¤u mµt l¥n næa b¡t ð¥u." )
				
				LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
				LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
				
				-- Ë¢mµt cái´ó×ãÇò
				local nIniLevel = LuaFnGetCopySceneData_Param(sceneId, 21)
				
				local nBigFootballId = 0
				local ran = random(3)
				local szName = ""
				if ran == 1  then
					nBigFootballId  = x402040_g_BigFootBall[1 + arrayex]+nIniLevel-levelex
					szName = "Hoàng S¡c ÐÕi Túc C¥u"
				elseif ran == 2  then
					nBigFootballId  = x402040_g_BigFootBall[2 + arrayex]+nIniLevel-levelex
					szName = "H°ng S¡c ÐÕi Túc C¥u"
				else
					nBigFootballId  = x402040_g_BigFootBall[3 + arrayex]+nIniLevel-levelex
					szName = "Lam S¡c ÐÕi Túc C¥u"
				end
				
				local Point = x402040_g_MonsterPoint[nStep-4]
				local nNpc1 = LuaFnCreateMonster(sceneId, nBigFootballId, 
																					Point.x+random(2), 
																					Point.z, 
																					3, 0, 402045)
				SetLevel(sceneId, nNpc1, nMonsterLevel)
				SetCharacterName(sceneId, nNpc1, szName)
			end
			
		elseif nStep_1 == 4  then
			LuaFnSetCopySceneData_Param(sceneId, 25, 0)
			LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			
			LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
			LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		end
		
	end

	-- ÏÖ°´ÕÕ¼òµ¥toÕ ðµ Ã¿10 giâyË¢mµt ´Î¹Ö
	if 	(nStep>=5   and nStep<24  and nCurTime-nPreTime >= 15) or
			(nStep>=25  and nStep<54  and nCurTime-nPreTime >= 12) or
			(nStep>=55  and nStep<124 and nCurTime-nPreTime >= 10) or
			(nStep>=125 and nStep<154	and nCurTime-nPreTime >= 5)   then
		
		-- ¹ÖÎïÉú³É ði¬m
		if nStep == 5  then
			x402040_TipAllHuman( sceneId, "Tr§n ð¤u Túc C¥u chính thÑc b¡t ð¥u" )
		end
		
		local Point = x402040_g_MonsterPoint[nStep-4]
	
		-- ¹ÖÎïID
		local nMonsterId = 0 
		local ran = random(3)
		if ran == 1  then
			nMonsterId = SmallMonsterId_1
		elseif ran == 2  then
			nMonsterId = SmallMonsterId_2
		else
			nMonsterId = SmallMonsterId_3
		end
		
		local nNpc1 = LuaFnCreateMonster(sceneId, nMonsterId, Point.x+random(2), Point.z, 3, 0, 402045)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		--SetNPCAIType(sceneId, nNpc1, 0)
		
		if ran == 1  then
			SetCharacterName(sceneId, nNpc1, "Hoàng S¡c Túc C¥u")
		elseif ran == 2  then
			SetCharacterName(sceneId, nNpc1, "H°ng S¡c Túc C¥u")
		else
			SetCharacterName(sceneId, nNpc1, "Lam S¡c Túc C¥u")
		end
		
		nStep = nStep+1
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep)
	end
		
	if nStep==154 then
		-- ¼ì²âÐúng²»ÐúngËùÓÐtoÕ ðµ Ð¡¹Ö¶¼ËÀ¹â,Èç¹ûËÀ¹â,10 giâyºó¹Ì¶¨µØµ giây¢BOSS
		local nMonsterNum = GetMonsterCount(sceneId)
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)== "Hoàng S¡c Túc C¥u" then
				bHaveMonster = 1
				break
			end
			if GetName(sceneId, nMonsterId)== "H°ng S¡c Túc C¥u" then
				bHaveMonster = 1
				break
			end
			if GetName(sceneId, nMonsterId)== "Lam S¡c Túc C¥u" then
				bHaveMonster = 1
				break
			end
			if GetName(sceneId, nMonsterId)== "Hoa S¡c Túc C¥u" then
				bHaveMonster = 1
				break
			end
		end

		if bHaveMonster == 0   then
			nStep = nStep+1
			LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
			LuaFnSetCopySceneData_Param(sceneId, 16, nStep)
		end
	end
	
	if 	nStep==155 then
		x402040_TipAllHuman( sceneId, "Tôn Mî Mî 10 giây sau s¨ xu¤t hi®n" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
		
	end
	
	if 	nStep==156 and nCurTime-nPreTime>=10  then
		nStep = nStep+1
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep)
		local nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x402040_g_BossPoint.x, x402040_g_BossPoint.z, 19, 216, 402040)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		SetCharacterName(sceneId, nNpc1, "Tôn MÛ MÛ")
		SetCharacterTitle(sceneId, nNpc1, "Túc C¥u th§p tam muµi")
		
		x402040_TipAllHuman( sceneId, "Tôn MÛ MÛ xu¤t hi®n" )
	end
	
end

--**********************************
--¼ì²âÐÄ·¨Ðúng²»¹»½ÓÈÎÎñ
--**********************************
function x402040_OnDie(sceneId, objId, killerId)
	--É±ËÀ¹ÖÎïtoÕ ðµ Ðúng³èÎïÔmµt ñÈ¡ÆäÖ÷ÈËtoÕ ðµ ID....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
		--Èç¹û×éÁË¶ÓÔmµt ñÈ¡¶Ó³¤toÕ ðµ ID....
	local nLeaderId = GetTeamLeader(sceneId, playerID)
	if nLeaderId < 1   then
		nLeaderId = playerID
	end
	
	local str = ""
	str = format("#PTÕi Mçu Ðang Uy¬n, #{_INFOUSR%s}#P th¯ng lînh ðµi ngû ðánh bÕi #{_BOSS4}#P, ðÕt ðßþc mµt h°i nh© nhàng vui vë ð¥m ðìa  ðÕi th¡ng!", GetName(sceneId,nLeaderId))
	BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
	
end

--**********************************
--¼ì²âÐÄ·¨Ðúng²»¹»½ÓÈÎÎñ
--**********************************
function x402040_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end

--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x402040_TipAllHuman( sceneId, Str )
	--  ðÕt ðßþc³¡¾°ÀïÍ·toÕ ðµ ËùÓÐÈË
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- Ã»ÓÐÈËtoÕ ðµ ³¡¾°,Ê²Ã´¶¼²»×ö
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

