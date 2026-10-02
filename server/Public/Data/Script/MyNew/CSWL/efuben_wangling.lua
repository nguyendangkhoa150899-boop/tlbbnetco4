--¸±±¾ÈÎÎñ
--Quân Vß½ng Lång
--
--************************************************************************
--MisDescBegin
--½Å±¾ºÅ
x900070_g_ScriptId	= 900070

--MisDescEnd
--************************************************************************

x900070_g_CopySceneType			= FUBEN_JUNTIAN	--¸±±¾ÀàÐÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ
x900070_g_LimitMembers			= 1		--¿ÉÒÔ½ø¸±±¾µÄ×îÐ¡¶ÓÎéÈËÊý
x900070_g_LimitLevel			= 85		--¿ÉÒÔ½ø¸±±¾µÄ×îÐ¡µÈ¼¶
x900070_g_MaxCount			= 3		--¿ÉÒÔ½ø¸±±¾µÄ×î´ó´ÎÊý
x900070_g_TickTime			= 10		--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x900070_g_LimitTotalHoldTime = 360	--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊý£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x900070_g_LimitTimeSuccess	= 500	--¸±±¾Ê±¼äÏÞÖÆ£¨µ¥Î»£º´ÎÊý£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x900070_g_CloseTick					= 7		--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊý£©
x900070_g_NoUserTime		= 300	--¸±±¾ÖÐÃ»ÓÐÈËºó¿ÉÒÔ¼ÌÐø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x900070_g_Fuben_X = 65	                --½øÈë¸±±¾µÄÎ»ÖÃX
x900070_g_Fuben_Z = 65	                --½øÈë¸±±¾µÄÎ»ÖÃZ
x900070_g_BossGroupID= 1		--ÊØÁé¼àµÄGroupID
x900070_g_TotalNeedKillBoss = 4	        --ÐèÒªÉ±ËÀBossÊýÁ¿ 3¸öÁúÎÆÖù+1¸öÊØÁé¼à

--¸±±¾Êý¾ÝË÷Òý¶ÔÕÕ
x900070_g_keySD	= {}
x900070_g_keySD["typ"]	= 0		--ÉèÖÃ¸±±¾ÀàÐÍ
x900070_g_keySD["spt"]	= 1		--ÉèÖÃ¸±±¾³¡¾°ÊÂ¼þ½Å±¾ºÅ
x900070_g_keySD["tim"]	= 2		--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊý
x900070_g_keySD["scn"]	= 3		--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
x900070_g_keySD["cls"]	= 4		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
x900070_g_keySD["dwn"]	= 5		--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊý
x900070_g_keySD["tem"]	= 6		--±£´æ¶ÓÎéºÅ
x900070_g_keySD["x"]	= 7		--X×ø±ê
x900070_g_keySD["z"]	= 8		--Z×ø±ê

x900070_g_keySD["ObjKilled"] = 9     --µ±Ç°É±¹ÖÊýÁ¿
x900070_g_keySD["MyLevel"] = 10     --³¡¾°µÈ¼¶
x900070_g_keySD["FlagThielf"] = 11     --³¡¾°¸±±¾µÄ±êÖ¾ ÒÑ·ÏÆú
x900070_paramonce 	= 28


--x900070_g_Monster	= {}
--x900070_g_Monster[1]	= { 3, 100, 100 }
--x900070_g_Monster[2]	= { 4, 100, 100 }

--½ÓÈ¡ÈÎÎñµÄ×îµÍµÈ¼¶
x900070_g_minLevel			= 75

--Áì¶Ó±ØÐë³ÖÓÐµÄÎïÆ·
--x900070_g_LingPai			= 38000117

--BOSS ÀàÐÍ
x900070_g_typMonster0		= 15344
x900070_g_typMonster1		= 15347

x900070_Monster_Boss =        {15344,15345,15346,15347}   --ÊØÁé¼à   ------×éID1    
x900070_Monster_Fenglongzhu = {15300,15301,15302,15303}   --·âÁúÖù   ------×éID2ÕæÁúÖù ×éID3¼ÙÁúÖù
x900070_Monster_Longzhu =     {15304,15305,15306,15307}   --ÁúÎÆÖù   ------×éID 4
x900070_Monster_Zayi =        {15316,15317,15318,15319}   --ÍõÁêÔÓÒÛ ------×éID 5
x900070_Monster_Xiaobing =    {15321,15322,15323,15323}   --ÍõÁêÐ¡×ä ------×éID 6
x900070_Monster_Hanjiang =    {15324,15325,15326,15327}   --ÍõÁêº·½« ------×éID 7
x900070_Monster_EBing =       {15328,15329,15330,15331}   --¶ñÁé±øÓÂ ------×éID 8

--ÁúÖù×ø±ê
x900070_Monster_SiteX =  {20,48,75,20,48,75,20,48,75}
x900070_Monster_SiteZ =  {20,20,20,48,48,48,75,75,75}

--ÁúÖùÊý×é
x900070_Monster_Suzu ={}
x900070_Monster_Suzu[1] ={2,2,2,3,3,2,3,3,2}
x900070_Monster_Suzu[2] ={2,3,3,2,2,2,3,2,3}
x900070_Monster_Suzu[3] ={3,3,2,2,3,3,2,2,2}
x900070_Monster_Suzu[4] ={2,3,3,2,3,2,2,3,3}
x900070_Monster_Suzu[5] ={3,2,3,3,2,2,3,2,3}
x900070_Monster_Suzu[6] ={3,3,2,2,3,2,3,3,2}
x900070_Monster_Suzu[7] ={2,3,3,2,2,3,2,3,2}
x900070_Monster_Suzu[8] ={2,3,2,3,2,3,2,3,3}

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x900070_OnDefaultEvent( sceneId, selfId, targetId )
    --¹Ø±Õ½çÃæ
 	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
    
    if 1 then x900070_NotifyTip( sceneId, selfId, "Ph\248 b\228n t\213m \240\243ng: client ch\223a c\243 b\228n \240\176 Qu\226n Thi\234n V\223\189ng L\229ng." ) return end   -- [NetCo4 02/10b] chan tao pho ban
    local	nam	= LuaFnGetName( sceneId, selfId )
	-- BroadMsgByChatPipe( sceneId, selfId, "#YQuân Vß½ng Lång : #gffff00"..nam.."#gff00f0 ðã mang ðµi  tiªn vào #gffff00 Quân Vß½ng Lång #gff00f0 Phó bän, M÷i ngß¶i hãy ch¶ xem kªt quä ", 4 )   -- [NetCo4 02/10] loa chuyen xuong duoi: cu phat ca khi khong vao duoc
    if( 1 == CanAccept ) then
        BroadMsgByChatPipe( sceneId, selfId, "#YQuân Vß½ng Lång : #gffff00"..nam.."#gff00f0 ðã mang ðµi  tiªn vào #gffff00 Quân Vß½ng Lång #gff00f0 Phó bän, M÷i ngß¶i hãy ch¶ xem kªt quä ", 4 ) LuaFnDeleteMonster( sceneId, targetId)
    end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x900070_OnEnumerate( sceneId, selfId, targetId )
	
	BeginEvent( sceneId )
		AddText( sceneId, "#{CSFB_KVK_110623_01}" )
		AddText( sceneId, "Ph\248 b\228n t\213m \240\243ng: client ch\223a c\243 b\228n \240\176 Qu\226n Thi\234n V\223\189ng L\229ng." )   -- [NetCo4 02/10b] DONG LAI: vao la ket (client khong co map chengshiwangling)
		-- AddNumText( sceneId, x900070_g_ScriptId, "V\224o Qu\226n Thi\234n V\223\189ng L\229ng", 10, -1 )   -- [NetCo4 02/10b] DONG LAI
    EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
 
 
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x900070_CheckAccept( sceneId, selfId )	
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x900070_OnAccept( sceneId, selfId )

  --´«ËÍÇ°,ÒªÖØÐÂÅÐ¶ÏÒ»´Î½øÈëÌõ¼þ Steven.Han 2006-12-27 13:53
	local	lev	= GetLevel( sceneId, selfId )
	if lev < x900070_g_minLevel then
	  x900070_NotifyList( sceneId, selfId, "C\164p c\252a c\225c h\213 ch\223a \240\252 75, ch\223a v\224o \240\223\254c." )
		return -1
	end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x900070_NotifyList( sceneId, selfId, "C\165n l\167p t\177 \240\181i (1 ng\223\182i c\251ng \240\223\254c) m\190i v\224o \240\223\254c." )   -- [NetCo4 02/10] code chi can 1 nguoi
		return -1 
	end
	
	if GetTeamSize( sceneId, selfId ) < x900070_g_LimitMembers then
	  x900070_NotifyList( sceneId, selfId, "t± ðµi không ðü "..(x900070_g_LimitMembers).." ngß¶i" )
	  return -1
	end
	
	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x900070_NotifyList( sceneId, selfId, "Các hÕ không phäi là ðµi trß·ng" )		
		return -1
	end
		  
	  
  local TeammateCount = 0    --¶ÓÓÑÊýÁ¿ Steven.Han 2006-12-27 11:34
  local TeammateID = 0       --¶ÓÓÑID
  local NearCount = 0        --¸½½ü¶ÓÓÑÊýÁ¿
  
  NearCount = GetNearTeamCount( sceneId, selfId )
  TeammateCount = GetTeamMemberCount( sceneId, selfId )

  for i=0, TeammateCount-1 do
      TeammateID = GetNearTeamMember( sceneId, selfId, i )
      if( -1 == TeammateID ) then    --²»ºÏ·¨ID
          return -1
      end
      
      local Level = GetLevel( sceneId, TeammateID )
      if( Level < x900070_g_LimitLevel ) then
        BeginEvent( sceneId )
			AddText( sceneId, "Trong \240\181i c\243 th\224nh vi\234n ch\223a \240\252 c\164p "..x900070_g_LimitLevel..", ch\223a v\224o \240\223\254c." )
			EndEvent( sceneId )
		DispatchMissionTips(sceneId,selfId)
		return -1
      end     
  end

  local namenum = 0;
  local notifyString = "    #W".."Trong \240\181i c\243 th\224nh vi\234n (".."#G";
  for i=0, TeammateCount-1 do
      TeammateID = GetNearTeamMember( sceneId, selfId, i )
      local nam	= GetName(sceneId,TeammateID)
      local lastTime = GetMissionData(sceneId,TeammateID,MD_HK_TW_DAY_H1N1_COUNT)
      local lastDayTime = floor(lastTime/100)
      local lastDayCount = mod(lastTime,100)   

	if GetDayTime() ~= lastDayTime then
           SetMissionData(sceneId,TeammateID,MD_HK_TW_DAY_H1N1_COUNT,GetDayTime()*100)
	   lastDayCount = 0
	end

	if lastDayCount >= x900070_g_MaxCount then
		notifyString = notifyString..nam.." ";
		namenum = 1
	end
   end
   notifyString = notifyString.."#W) ".."h\244m nay \240\227 v\224o ph\243 b\228n n\224y \240\252 "..x900070_g_MaxCount.." l\165n.";
	if(namenum>0) then
	  BeginEvent( sceneId )
			AddText( sceneId, notifyString )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId )   -- [NetCo4 02/10] cu truyen targetId (khong co trong ham nay)
		return
	end


  --´«ËÍÇ°,ÒªÖØÐÂÅÐ¶ÏÒ»´Î½øÈëÌõ¼þ Steven.Han 2006-12-27 13:53

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊýÁ¿£¨°üÀ¨×Ô¼º£©
	local numMem	= GetNearTeamCount( sceneId, selfId )

	x900070_MakeCopyScene( sceneId, selfId, numMem )
	
	return 1
	--LuaFnDeleteMonster( sceneId, targetId)
	--PrintStr( tostring( targetId ) )	
end

--**********************************
--·ÅÆú
--**********************************
function x900070_OnAbandon( sceneId, selfId )

end

--**********************************
--´´½¨ÊØÁé¼à
--**********************************
function x900070_CreateBoss( sceneId, iniLevel )
    if( iniLevel < x900070_g_minLevel ) then
        iniLevel = x900070_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900070_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end
	local typ = x900070_Monster_Boss[ini]	--¹ÖÎï±àºÅ
	local objId = LuaFnCreateMonster(sceneId, typ, 48, 48, 25, 253, 900070 )	
	SetMonsterGroupID( sceneId, objId, x900070_g_BossGroupID )
	SetCharacterTitle(sceneId, objId, "Bäo tàng chi vß½ng")
	SetLevel( sceneId, objId, iniLevel )	
	CallScriptFunction((200060), "Paopao",sceneId, "Th\252 l\229ng giam", "Quân Vß½ng Lång", "Không sþ chªt sao mà dám vào ðây. Mau nÕo mÕng ði  ..........")   -- [NetCo4 02/10] cu strMonsterName = nil -> boss khong noi
	
end

--**********************************
--´´½¨±¦Ïä
--**********************************
function x900070_CreateBaoxiang( sceneId, iniLevel, ObjX, ObjZ )

	local box1 = LuaFnCreateMonster(sceneId, 15353, 45, 45, 3, -1, 900071 )
 	SetCharacterName(sceneId, box1, "#eaf0c14#YBäo rß½ng")

	local box2 = LuaFnCreateMonster(sceneId, 15353, 45, 48, 3, -1, 900071 )
 	SetCharacterName(sceneId, box2, "#eaf0c14#YBäo rß½ng")

	local box3 = LuaFnCreateMonster(sceneId, 15353, 45, 51, 3, -1, 900071 )
 	SetCharacterName(sceneId, box3, "#eaf0c14#YBäo rß½ng")

	local box4 = LuaFnCreateMonster(sceneId, 15353, 48, 45, 3, -1, 900071 )
 	SetCharacterName(sceneId, box4, "#eaf0c14#YBäo rß½ng")

	local box5 = LuaFnCreateMonster(sceneId, 15353, 51, 45, 3, -1, 900071 )
 	SetCharacterName(sceneId, box5, "#eaf0c14#YBäo rß½ng")

	local box6 = LuaFnCreateMonster(sceneId, 15353, 51, 48, 3, -1, 900071 )
 	SetCharacterName(sceneId, box6, "#eaf0c14#YBäo rß½ng")

	local box7 = LuaFnCreateMonster(sceneId, 15353, 48, 51, 3, -1, 900071 )
 	SetCharacterName(sceneId, box7, "#eaf0c14#YBäo rß½ng")

	local box8 = LuaFnCreateMonster(sceneId, 15353, 51, 51, 3, -1, 900071 )
 	SetCharacterName(sceneId, box8, "#eaf0c14#YBäo rß½ng")
end

--**********************************
--´´½¨ÁúÎÆÖù
--**********************************
function x900070_CreateLongzhu( sceneId, iniLevel, ObjX, ObjZ )
    if( iniLevel < x900070_g_minLevel ) then
        iniLevel = x900070_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900070_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end
	local typ = x900070_Monster_Longzhu[ini]	--¹ÖÎï±àºÅ

	local objId = LuaFnCreateMonster(sceneId, typ, ObjX, ObjZ, 3, -1, -1 )	
	SetMonsterGroupID( sceneId, objId, 4 )
	SetLevel( sceneId, objId, iniLevel )	
end

--**********************************
--´´½¨ÍõÁêÔÓÒÛ
--**********************************
function x900070_CreateZayi( sceneId, iniLevel, ObjX, ObjZ )
    if( iniLevel < x900070_g_minLevel ) then
        iniLevel = x900070_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900070_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end
	local typ = x900070_Monster_Zayi[ini]	--¹ÖÎï±àºÅ
        for i = 1,10 do
	local objId = LuaFnCreateMonster(sceneId, typ, random(ObjX-5,ObjX+5), random(ObjZ-5,ObjZ+5), 25, 167, -1 )	
	SetMonsterGroupID( sceneId, objId, 5 )
	SetLevel( sceneId, objId, iniLevel )
        end	
end

--**********************************
--´´½¨ÍõÁêÐ¡×ä
--**********************************
function x900070_CreateXiaobing( sceneId, iniLevel, ObjX, ObjZ )
    if( iniLevel < x900070_g_minLevel ) then
        iniLevel = x900070_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900070_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end
	local typ = x900070_Monster_Xiaobing[ini]	--¹ÖÎï±àºÅ
        for i = 1,10 do
	local objId = LuaFnCreateMonster(sceneId, typ, random(ObjX-5,ObjX+5), random(ObjZ-5,ObjZ+5), 25, 180, -1 )	
	SetMonsterGroupID( sceneId, objId, 6 )
	SetLevel( sceneId, objId, iniLevel )
        end	
end

--**********************************
--´´½¨ÍõÁêº·½«
--**********************************
function x900070_CreateHanjiang( sceneId, iniLevel, ObjX, ObjZ )
    if( iniLevel < x900070_g_minLevel ) then
        iniLevel = x900070_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900070_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end
	local typ = x900070_Monster_Hanjiang[ini]	--¹ÖÎï±àºÅ
        for i = 1,10 do
	local objId = LuaFnCreateMonster(sceneId, typ, random(ObjX-5,ObjX+5), random(ObjZ-5,ObjZ+5), 25, 185, -1 )	
	SetMonsterGroupID( sceneId, objId, 7 )
	SetLevel( sceneId, objId, iniLevel )
        end	
end

--**********************************
--´´½¨¶ñÁé±øÓÂ
--**********************************
function x900070_CreateEBing( sceneId, iniLevel, ObjX, ObjZ )
    if( iniLevel < x900070_g_minLevel ) then
        iniLevel = x900070_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900070_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end
	local typ = x900070_Monster_EBing[ini]	--¹ÖÎï±àºÅ
        for i = 1,10 do
	local objId = LuaFnCreateMonster(sceneId, typ, random(ObjX-5,ObjX+5), random(ObjZ-5,ObjZ+5), 25, 189, -1 )	
	SetMonsterGroupID( sceneId, objId, 8 )
	SetLevel( sceneId, objId, iniLevel )
        end	
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x900070_MakeCopyScene( sceneId, selfId, nearmembercount )
	
	--Ö¸Êý²ÎÊý
	local	param0	= 4;
	local	param1	= 3;

	--×îÖÕ½á¹û
	local	mylevel	= 0;

	--ÁÙÊ±±äÁ¿
	local mems		= {};
	local	tempMemlevel = 0;
	local	level0 = 0;
	local	level1 = 0;
	for	i = 0, nearmembercount - 1 do
		mems[i]	= GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, mems[i]);
		level0	= level0 + (tempMemlevel ^ param0);
		level1	= level1 + (tempMemlevel ^ param1);
	end

	if level1 == 0 then
		mylevel = x900070_g_minLevel;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--µØÍ¼ÊÇ±ØÐëÑ¡È¡µÄ£¬¶øÇÒ±ØÐëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetSceneLoad_Map( sceneId, "chengshiwangling.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x900070_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x900070_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["typ"], x900070_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["spt"], x900070_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["scn"], sceneId )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["FlagThielf"], 800 )
	
	local x,z = GetWorldPos( sceneId, selfId )	
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["x"], x )
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["z"], z )
	
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["ObjKilled"], 0 )  --ÉèÖÃÉ±¹ÖÊýÁ¿

        local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["MyLevel"], mylevel )
	
	LuaFnSetSceneLoad_Monster( sceneId, "chengshiwangling_monster.ini" )
	
        local CopyScene_LevelGap = 31
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --¼¶±ð²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖÐ¸³Öµ
	
	LuaFnSetCopySceneData_Param(sceneId, x900070_paramonce, 0)
	
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êý
	if bRetSceneID > 0 then
		x900070_NotifyTip( sceneId, selfId, "TÕo phó bän thành công" )
	else
		x900070_NotifyTip( sceneId, selfId, "Phó bän ð¥y vui lòng thØ lÕi sau" )
	end


end

--**********************************
--¼ÌÐø
--**********************************
function x900070_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x900070_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--Ìá½»
--**********************************
function x900070_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end


function x900070_OnDie(sceneId, objId, killerId)
    --PrintStr( "x900070_OnDie [objId]"..objId.." [killerId]"..killerId.."[sceneId]"..sceneId )
    local DataID = GetMonsterDataID( sceneId, objId )
    x900070_OnKillObject( sceneId, killerId, DataID, objId )
    
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x900070_OnKillObject( sceneId, selfId, objdataId, objId )

        local ObjX, ObjZ = GetWorldPos(sceneId, objId) --µÃµ½É±ËÀµÄ¹ÖÎïµÄ×ø±ê£¬ÓÃÓÚ´´½¨ÁúÎÆÖù£¬byÐ«×Ó 
	
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--ÊÇ·ñÊÇËùÐèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x900070_g_CopySceneType then
		return
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎÞÐ§
	if leaveFlag == 1 then
		return
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	

	--È¡µÃÉ±ËÀ¹ÖÎïµÄGroupID,ÓÃÓÚÅÐ¶ÏÊÇ·ñÊÇËùÐèÒªÉ±µôµÄBoss
	--local GroupID = GetMonsterGroupID( sceneId, objId )
	
	--local msgStr = format( "sceneId: %d, objId: %d, GroupID: %d", sceneId, objId, objdataId )
	--PrintStr( msgStr )
	
	--²»ÊÇËùÐèÒªµÄBoss
	local bIsBoss=0;
	
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID == x900070_g_BossGroupID then
	    bIsBoss = 1
	end
	--if  objdataId >= x900070_g_typMonster0 and objdataId <= x900070_g_typMonster1 then
	--	bIsBoss = 1;
	--end

	-------------------------------------------------------------------------------
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	local memId
	local teamLeaderName;
	local firstMemName;
	local firstMemId;

	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid( sceneId, memId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, memId ) == 1 then	
			local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, memId);
			if teamLeaderFlag and teamLeaderFlag == 1 then
				teamLeaderName = LuaFnGetName(sceneId, memId);
				break;
			end
		end
	end

	if bIsBoss==1 then
	                local mems = {}
	                for i = 0, membercount - 1 do
		               mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
                               AddMonsterDropItem( sceneId, objId, mems[i], 38000126 ) --¸øÃ¿¸öÈËÔö¼ÓµôÂäÒ»¸ö±¦ÏäÔ¿³×
	                end
			local message;
			local randMessage = random(3);
			if teamLeaderName ~= nil then		
				if randMessage == 1 then			
		   			message = format("#G Thü lång giám #W Ðang tr¯n gi¤u · #G Quân Thiên vß½ng lång #W Bên trong thu nÕp thiên ð¸a linh khí, b¸ xâm nh§p #B#{_INFOUSR%s}#W Mµt quy«n ðánh vào huy®t Bách Hµi bên trên, óc vÞ toang mà chªt, trên thân bánh bao nhân rau cu~ng tän mát ð¥y ð¤t.", teamLeaderName );
				elseif randMessage == 2 then		
					message = format("#W Không ai bì n±i #G Thü lång giám #W B¸ mµt ðám ngß¶i lai l¸ch không rõ ðánh ð¥u óc choáng váng, n±i gi§n nói: Các ngß½i dña vào cái gì ðánh ta? Ðµi trß·ng #B#{_INFOUSR%s}#W Khinh mi®t nói: La~o tß? ðã s¾m nhìn ngß½i không v×a mít... ... ", teamLeaderName );
				else
					message = format("#W TÕi Quân Thiên vß½ng lång bên trong #B#{_INFOUSR%s}#W Mµt cái Hàng Long mß¶i bàn tay, ðánh cho #G Thü lång giám #W Th± huyªt mà chªt, #{_INFOUSR%s} Nh£t lên trên ð¤t bäo v§t mang theo ðµi ngû r¶i ði", teamLeaderName );
				end
			
				BroadMsgByChatPipe(sceneId, selfId, message, 4);
			end
	end
	-------------------------------------------------------------------------------

	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, x900070_g_keySD["ObjKilled"] )	--É±ËÀBossµÄÊýÁ¿£¬ÕâÀïÖ»¼ÆÈëÁúÎÆÖùºÍÊØÁé¼à£¬¼ÙÁúÖùºÍÐ¡¹Ö²»¼ÆÈë

        if GroupID == 1  then
	   killedbossnumber = killedbossnumber + 1
	   LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["ObjKilled"] , killedbossnumber )	--ÉèÖÃÉ±ËÀBossµÄÊýÁ¿
           x900070_CreateBaoxiang( sceneId, iniLevel, ObjX, ObjZ )
        elseif GroupID == 2  then
	   killedbossnumber = killedbossnumber + 1
	   LuaFnSetCopySceneData_Param( sceneId, x900070_g_keySD["ObjKilled"] , killedbossnumber )	--ÉèÖÃÉ±ËÀBossµÄÊýÁ¿
	   local CurLevel = LuaFnGetCopySceneData_Param( sceneId, x900070_g_keySD["MyLevel"] )
	   x900070_CreateLongzhu( sceneId, CurLevel, ObjX, ObjZ )
        elseif GroupID == 3  then
	   local CurLevel = LuaFnGetCopySceneData_Param( sceneId, x900070_g_keySD["MyLevel"] )
	   local xiezi = random(4)
           if xiezi == 1 then
              x900070_MianYi( sceneId, selfId, objdataId, objId )
              x900070_CreateZayi( sceneId, CurLevel, ObjX, ObjZ )
           elseif xiezi == 2 then
              x900070_MianYi( sceneId, selfId, objdataId, objId )
              x900070_CreateXiaobing( sceneId, CurLevel, ObjX, ObjZ )
           elseif xiezi == 3 then
              x900070_MianYi( sceneId, selfId, objdataId, objId )
              x900070_CreateHanjiang( sceneId, CurLevel, ObjX, ObjZ )
           elseif xiezi == 4 then
              x900070_MianYi( sceneId, selfId, objdataId, objId )
              x900070_CreateEBing( sceneId, CurLevel, ObjX, ObjZ )
           end
        end


	local i
	local misIndex
	local humanObjId
		
	for i=0, num-1 do

		local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId

			  --local KillStr = format( "Õâ¸ö¹ÖÎïµÄidÊÇ"..objdataId..",²âÊÔidÊÇ"..objId.."" )
			  --x900070_NotifyTip( sceneId, ServerID, KillStr ) --ÏÔÊ¾É±¹ÖÊý

                if GroupID == 3  then
			  local KillStr = format( "Không xong! Có ngß¶i không c¦n th§n xúc ðµng vß½ng lång c½ quan, t¤t cä long trø mi­n d¸ch 30 Giây, m¶i t¯c ðµ ðánh giªt ti¬u quái!" )
			  x900070_NotifyTip( sceneId, ServerID, KillStr ) 
                elseif GroupID == 1  then
			  local KillStr = format("Nhi®m vø hoàn thành, xin mau s¾m lña ch÷n bäo rß½ng m· ra, 70 Giây sau ngài s¨ b¸ truy«n t¯ng ra phó bän......" )
			  x900070_NotifyTip( sceneId, ServerID, KillStr ) 
                end

		if LuaFnIsObjValid( sceneId, ServerID ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, ServerID ) == 1 then			  --²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷

                        if killedbossnumber <= ( x900070_g_TotalNeedKillBoss - 1 ) then 
			  local KillStr = format( "Dã ðä thông long mÕch %d/%d", killedbossnumber, x900070_g_TotalNeedKillBoss-1 )
			  x900070_NotifyTip( sceneId, ServerID, KillStr ) --ÏÔÊ¾É±¹ÖÊý
                            if killedbossnumber == 3 then
			          local KillStr = format( "Thü linh giám xu¤t hi®n tÕi chính giæa tª ðàn, m¶i t¯c ðµ tiªn ðªn ðem chém giªt!!" )
			          x900070_NotifyTip( sceneId, ServerID, KillStr ) --ÏÔÊ¾É±¹ÖÊý
                            end
                        end

			local KillStr = format( "Ðã gi¤t chªt thü lînh %d/%d", floor(killedbossnumber/4), 1 )
			  x900070_NotifyTip( sceneId, ServerID, KillStr ) --ÏÔÊ¾É±¹ÖÊý
		        end
	         end
                   if killedbossnumber == ( x900070_g_TotalNeedKillBoss - 1 ) then    --ÕâÀï±íÊ¾´ò³öÀ´Èý¸öÁúÖù
		           --É¾³ýËùÓÐ¹ÖÎï....
	                   local nCount = GetMonsterCount(sceneId)
	                   for i=0, nCount-1  do
		               local nObjId = GetMonsterObjID(sceneId, i)
		               local MosDataID = GetMonsterDataID( sceneId, nObjId )
		               if MosDataID >= 15300 and MosDataID <= 15343 then    --ËùÉ¾³ýµÄ¹ÖÎï±àºÅ·¶Î§£¬±ÜÃâÎóÉ¾£¬byÐ«×Ó
			          LuaFnDeleteMonster(sceneId, nObjId)
		               end
	                    end
		           local CurLevel = LuaFnGetCopySceneData_Param( sceneId, x900070_g_keySD["MyLevel"] )
		           x900070_CreateBoss( sceneId, CurLevel )
                        end
	     if killedbossnumber >= x900070_g_TotalNeedKillBoss then
		  LuaFnSetCopySceneData_Param( sceneId, 4, 1 )  --ÉèÖÃÈÎÎñÍê³É±êÖ¾

	          --È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊý
	          local RenNum = LuaFnGetCopyScene_HumanCount( sceneId )
	          for i=0, RenNum-1 do
	              local EveryBodyID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
                      CallScriptFunction( 890536,"JianCe",sceneId,EveryBodyID)
                      if floor(mod(GetMissionData(sceneId,EveryBodyID,HUOYUEFB_2),1000)/100) < 2 then
                         SetMissionData(sceneId,EveryBodyID,HUOYUEZHI,GetMissionData(sceneId,EveryBodyID,HUOYUEZHI)+89) --»îÔ¾Öµ+89
                         SetMissionData(sceneId,EveryBodyID,HUOYUEFB_2,GetMissionData(sceneId,EveryBodyID,HUOYUEFB_2)+100)
                      end
                  end
	     end
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x900070_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x900070_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾ÊÂ¼þ
--**********************************
function x900070_OnCopySceneReady( sceneId, destsceneId )
    
	--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--ÕÒ²»µ½¸ÃÍæ¼Ò
	if leaderObjId == -1 then
		return
	end

	--´¦ÓÚÎÞ·¨Ö´ÐÐÂß¼­µÄ×´Ì¬
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊýÁ¿£¨°üÀ¨×Ô¼º£©
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )

	local member
	local misIndex
	
	NewWorld( sceneId, leaderObjId, destsceneId, x900070_g_Fuben_X, x900070_g_Fuben_Z )
	-- ÈÎÎñ»ò»î¶¯Í³¼Æ
	LuaFnAuditQuest(sceneId, leaderObjId, "Quân Vß½ng Lång")
	--PrintStr( "x900070_OnCopySceneReady" )		
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ´¦ÓÚ¿ÉÒÔÖ´ÐÐÂß¼­µÄ×´Ì¬
				NewWorld( sceneId, member, destsceneId, x900070_g_Fuben_X, x900070_g_Fuben_Z )
			-- ÈÎÎñ»ò»î¶¯Í³¼Æ
			LuaFnAuditQuest(sceneId, member, "Quân Vß½ng Lång")
		end
	end
	    
end

--**********************************
--ÓÐÍæ¼Ò½øÈë¸±±¾ÊÂ¼þ
--**********************************
function x900070_OnPlayerEnter( sceneId, selfId )
	--ÉèÖÃËÀÍöºó¸´»îµãÎ»ÖÃ
	if 1 then x900070_KickOut( sceneId, selfId ) return end   -- [NetCo4 02/10b] keo ra ngay khi vao
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x900070_g_Fuben_X, x900070_g_Fuben_Z )

	--ÉèÖÃÌôÕ½¹ýÒ»´ÎQuân Vß½ng Lång....
	local lastTime = GetMissionData( sceneId, selfId, MD_HK_TW_DAY_H1N1_COUNT )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_HK_TW_DAY_H1N1_COUNT, lastTime )

	if lastDayCount > x900070_g_MaxCount+1 then
           x900070_NotifyTip( sceneId, selfId, "Ngß½i mu¯n d· trò gian d¯i ah" ) 
           x900070_KickOut( sceneId, selfId )
        end

	--´´½¨³õÊ¼ÁúÖù¶ÓÁÐ....
        local nCount = GetMonsterCount(sceneId)
        if nCount < 2 then
           x900070_chuangjian( sceneId, selfId )
        end
end

--**********************************
--ÓÐÍæ¼ÒÔÚ¸±±¾ÖÐËÀÍöÊÂ¼þ
--**********************************
function x900070_OnHumanDie( sceneId, selfId, killerId )

end

--**********************************
--½«Ä³Íæ¼Ò´«ËÍ³ö¸±±¾,»Øµ½½øÈëÊ±µÄÎ»ÖÃ
--**********************************
function x900070_KickOut( sceneId, objId )
    local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	local x = LuaFnGetCopySceneData_Param( sceneId, x900070_g_keySD["x"] ) --½øÈëÊ±µÄ×ø±êX
	local z = LuaFnGetCopySceneData_Param( sceneId, x900070_g_keySD["z"] ) --½øÈëÊ±µÄ×ø±êZ
	
	if LuaFnIsObjValid( sceneId, objId ) == 1 then
	    NewWorld( sceneId, objId, oldsceneId, x, z )
	end
	
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼þ
--**********************************
function x900070_OnCopySceneTimer( sceneId, nowTime )

	local nKeo = LuaFnGetCopyScene_HumanCount( sceneId )   -- [NetCo4 02/10b] keo het nguoi ben trong ra moi nhip
	for iKeo = 0, nKeo - 1 do
		local idKeo = LuaFnGetCopyScene_HumanObjId( sceneId, iKeo )
		if LuaFnIsObjValid( sceneId, idKeo ) == 1 then
			x900070_KickOut( sceneId, idKeo )
		end
	end
	LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	if 1 then return end
	local once = LuaFnGetCopySceneData_Param( sceneId, x900070_paramonce )
		
	--¸±±¾Ê±ÖÓ¶ÁÈ¡¼°ÉèÖÃ
	--È¡µÃÒÑ¾­Ö´ÐÐµÄ¶¨Ê±´ÎÊý
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
	TickCount = TickCount + 1
	--ÉèÖÃÐÂµÄ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊý
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--ÐèÒªÀë¿ª
	if leaveFlag == 1 then
		--Àë¿ªµ¹¼ÆÊ±¼äµÄ¶ÁÈ¡ºÍÉèÖÃ
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x900070_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ

			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓÐÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x900070_KickOut( sceneId, mems[i] )				
				end
			end
						
		elseif leaveTickCount < x900070_g_CloseTick then
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓÐÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Ngß½i còn %d giây ð¬ m· bäo giß½ng hay nhanh tay không m¤t c½ hµi!", (x900070_g_CloseTick-leaveTickCount) * x900070_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x900070_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x900070_g_LimitTimeSuccess then
		--´Ë´¦ÉèÖÃÓÐÊ±¼äÏÞÖÆµÄÈÎÎñÍê³É´¦Àí
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x900070_NotifyTip( sceneId, mems[i], "nhi®m vuh hoàn thành!" )
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x900070_g_LimitTotalHoldTime then						--¸±±¾×ÜÊ±¼äÏÞÖÆµ½ÁË
		--´Ë´¦ÉèÖÃ¸±±¾ÈÎÎñÓÐÊ±¼äÏÞÖÆµÄÇé¿ö£¬µ±Ê±¼äµ½ºó´¦Àí...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x900070_NotifyTip( sceneId, mems[i], "quá th¶i gian nhi®m vø th¤t bÕi!" )
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
	
		--¶¨Ê±¼ì²é¶ÓÎé³ÉÔ±µÄ¶ÓÎéºÅ£¬Èç¹û²»·ûºÏ£¬ÔòÌß³ö¸±±¾
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )		--È¡µÃ±£´æµÄ¶ÓÎéºÅ
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					x900070_NotifyTip( sceneId, mems[i], "ngß½i không trong ðµi ngû!" )
					x900070_KickOut( sceneId, mems[i] )
				end
			end
		end

	end

end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x900070_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--ÆÁÄ»ÖÐ¼äÌáÊ¾
--**********************************
function x900070_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--¶Ô»°¿òÌáÊ¾
--**********************************
function x900070_NotifyList( sceneId, selfId, msg )
	    BeginEvent( sceneId )
		  AddText( sceneId, msg )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId )
end
--**********************************
--´´½¨³õÊ¼ÁúÖù
--**********************************
function x900070_chuangjian( sceneId, selfId )

        local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local ini = floor( PlayerMaxLevel / 10 ) - 7
	if ini <= 0 then
		ini	= 1
	elseif ini > 4 then
		ini	= 4
	end

	local typ = x900070_Monster_Fenglongzhu[ini]	--¹ÖÎï±àºÅ
	local suiji = random(8)
        for i = 1,9 do
	   local X = x900070_Monster_SiteX[i]
	   local Z = x900070_Monster_SiteZ[i]
	   local Suzu = x900070_Monster_Suzu[suiji][i]
	   local objId = LuaFnCreateMonster(sceneId, typ, X,Z, 3, -1, 900070 )	
	   SetLevel( sceneId, objId, PlayerMaxLevel-1 )
	   SetMonsterGroupID( sceneId, objId, Suzu )
        end
end

--************************************************
--¸øËùÓÐÁúÖù¼ÓÃâÒß
--************************************************

function x900070_MianYi( sceneId, selfId, objdataId, objId )

local nCount = GetMonsterCount(sceneId)
for i=0, nCount-1  do
local nObjId = GetMonsterObjID(sceneId, i)
local MosDataID = GetMonsterDataID( sceneId, nObjId )
if MosDataID >= 15300 and MosDataID <= 15303 then    --ËùÉ¾³ýµÄ¹ÖÎï±àºÅ·¶Î§£¬±ÜÃâÎóÉ¾£¬byÐ«×Ó
LuaFnSendSpecificImpactToUnit(sceneId, nObjId, nObjId, nObjId, 32696, 0)
end
end
end

