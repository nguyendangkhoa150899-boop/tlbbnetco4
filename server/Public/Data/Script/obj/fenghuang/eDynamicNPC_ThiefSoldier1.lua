--副本任务
--凤凰陵墓
--

--************************************************************************
--MisDescBegin
--脚本号
x900019_g_ScriptId	= 900019

--MisDescEnd
--************************************************************************

x900019_g_CopySceneType			= FUBEN_FENGHUANG	--副本类型，定义在ScriptGlobal.lua里面
x900019_g_LimitMembers			= 1		--可以进副本的最小队伍人数
x900019_g_TickTime					= 5		--回调脚本的时钟时间（单位：秒/次）
x900019_g_LimitTotalHoldTime= 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x900019_g_LimitTimeSuccess	= 500	--副本时间限制（单位：次数），如果此时间到了，任务完成
x900019_g_CloseTick					= 6		--副本关闭前倒计时（单位：次数）
x900019_g_NoUserTime				= 300	--副本中没有人后可以继续保存的时间（单位：秒）
x900019_g_Fuben_X						= 17	--进入副本的位置X
x900019_g_Fuben_Z						= 110	--进入副本的位置Z
x900019_g_BossGroupID= 1		--需要杀死的Boss的GroupID
x900019_g_TotalNeedKillBoss	= 50	--需要杀死Boss数量

--副本数据索引对照
x900019_g_keySD					= {}
x900019_g_keySD["typ"]	= 0		--设置副本类型
x900019_g_keySD["spt"]	= 1		--设置副本场景事件脚本号
x900019_g_keySD["tim"]	= 2		--设置定时器调用次数
x900019_g_keySD["scn"]	= 3		--设置副本入口场景号, 初始化
x900019_g_keySD["cls"]	= 4		--设置副本关闭标志, 0开放，1关闭
x900019_g_keySD["dwn"]	= 5		--设置离开倒计时次数
x900019_g_keySD["tem"]	= 6		--保存队伍号
x900019_g_keySD["x"]	= 7		--X坐标
x900019_g_keySD["z"]	= 8		--Z坐标

x900019_g_keySD["ObjKilled"] = 9     --当前杀怪数量
x900019_g_keySD["MyLevel"] = 10     --场景等级
x900019_g_keySD["FlagThielf"] = 11     --场景副本的标志 已废弃
x900019_paramonce 	= 28


--x900019_g_Monster	= {}
--x900019_g_Monster[1]	= { 3, 100, 100 }
--x900019_g_Monster[2]	= { 4, 100, 100 }

--接取任务的最低等级
x900019_g_minLevel			= 75

--领队必须持有的称号
x900019_g_title			= "凤凰古城霸主"

--BOSS 类型
x900019_g_typMonster0		= 13759
x900019_g_typMonster1		= 13766

x900019_Monster_Boss = {
                        13759,
                        13760,
                        13761,
                        13762,
                        13763,
                        13764,
                        13765,
                        13766,


                        }

--x900019_NianShou_Boss = {
--												12200,
--												12201,
--												12202,
--												12203,
--												12204,
--												12205,
--												12206,
--												12207,
--												12208,
--												12209,
--												12210,
--												12211
--                        }
--                        
--x900019_NianShou_Pos = {
--												{x=83,z=45},{x=93,z=34},{x=53,z=30},{x=27,z=24},{x=34,z=41},
--												}

--**********************************
--任务入口函数
--**********************************
function x900019_OnDefaultEvent( sceneId, selfId, targetId )
    --关闭界面
 	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
    
    local CanAccept = x900019_OnAccept( sceneId, selfId )
    
    if( 1 == CanAccept ) then
        LuaFnDeleteMonster( sceneId, targetId)
    end
end

--**********************************
--列举事件
--**********************************
function x900019_OnEnumerate( sceneId, selfId, targetId )

    local	lev	= GetLevel( sceneId, selfId )
	if lev < x900019_g_minLevel then
	  AddText( sceneId, "你的等级太低了，根本不够我看的，还是75级之后再来找我吧。" )
		return
	end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		AddText( sceneId, "区区一个人就想来挑战我，我根本不屑与你动手。" )
		return 
	end
	
	
	if GetTeamSize( sceneId, selfId ) < x900019_g_LimitMembers then
	  AddText( sceneId, "想要挑战我至少也得上来三个吧，就这点人？也太瞧不起我了。" )
	  return
	end
	
	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		AddText( sceneId, "想要挑战我？叫你们的队长来吧。" )		
		return
	end

	--角色现有称号	
	local HadTitleID = GetTitle(sceneId,selfId,18)
        if 255 ~= HadTitleID then
		AddText( sceneId, "    走开，我只接受凤凰霸主的挑战，你没有#G凤凰古城霸主#W称号，赶紧滚！" )		
		return
	end


	--取得玩家附近的队友数量（包括自己）
	leaderObjId = selfId;

  local TeammateCount = 0    --队友数量 Steven.Han 2006-12-27 11:34
  local TeammateID = 0       --队友ID
  local NearCount = 0        --附近队友数量
  
  NearCount = GetNearTeamCount( sceneId, leaderObjId )
  TeammateCount = GetTeamMemberCount( sceneId, leaderObjId )
   	
	local namenum = 0;
	local notifyString = "您队伍中有成员(";
	for i=0, NearCount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<75) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..")等级不足。";	
	if(namenum>0) then
	  BeginEvent( sceneId )
			AddText( sceneId, notifyString )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
 	  
  for i=0, NearCount-1 do
      TeammateID = GetNearTeamMember( sceneId, leaderObjId, i )
      if( -1 == TeammateID ) then    --不合法ID
          return
      end
      
      local Level = GetLevel( sceneId, TeammateID )
      if( Level < 75 ) then
        BeginEvent( sceneId )
					AddText( sceneId, "你的队伍中有队员的等级不足75级！" )
					EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
      end
            
  end
  
	
	BeginEvent( sceneId )
		AddText( sceneId, "既然你们不怕死，我也就没有必要留什么情面了，小的们，过来给他们点厉害尝尝。" )
		AddNumText( sceneId, x900019_g_ScriptId, "难道我还怕你不成……",10,-1 )
    EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
 
 
end

--**********************************
--检测接受条件
--**********************************
function x900019_CheckAccept( sceneId, selfId )	
	return 1
end

--**********************************
--接受
--**********************************
function x900019_OnAccept( sceneId, selfId )

  --传送前,要重新判断一次进入条件 Steven.Han 2006-12-27 13:53
	local	lev	= GetLevel( sceneId, selfId )
	if lev < x900019_g_minLevel then
	  x900019_NotifyTip( sceneId, selfId, "你的等级太低了" )
		return -1
	end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x900019_NotifyTip( sceneId, selfId, "你还没有队伍" )
		return -1 
	end
	
	if GetTeamSize( sceneId, selfId ) < x900019_g_LimitMembers then
	  x900019_NotifyTip( sceneId, selfId, "队伍不足"..(x900019_g_LimitMembers).."人" )
	  return -1
	end
	
	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x900019_NotifyTip( sceneId, selfId, "你不是队长" )		
		return -1
	end
		  
	  
  local TeammateCount = 0    --队友数量 Steven.Han 2006-12-27 11:34
  local TeammateID = 0       --队友ID
  local NearCount = 0        --附近队友数量
  
  NearCount = GetNearTeamCount( sceneId, selfId )
  TeammateCount = GetTeamMemberCount( sceneId, selfId )
  
  if( NearCount < TeammateCount ) then          --有队友没在附近,返回
    	--显示醒目提示
		  BeginEvent(sceneId)
		      strText = "您有队友没在附近"
		  AddText(sceneId,strText)
	    EndEvent(sceneId)
	    DispatchMissionTips(sceneId,selfId)
      return -1
  end
  
  for i=0, TeammateCount-1 do
      TeammateID = GetNearTeamMember( sceneId, selfId, i )
      if( -1 == TeammateID ) then    --不合法ID
          return -1
      end
      
      local Level = GetLevel( sceneId, TeammateID )
      if( Level < 75 ) then
        BeginEvent( sceneId )
			AddText( sceneId, "您的队伍中有队员的等级不足75级！" )
			EndEvent( sceneId )
		DispatchMissionTips(sceneId,selfId)
		return -1
      end
            
  end
  --传送前,要重新判断一次进入条件 Steven.Han 2006-12-27 13:53



	--取得玩家附近的队友数量（包括自己）
	local numMem	= GetNearTeamCount( sceneId, selfId )

	x900019_MakeCopyScene( sceneId, selfId, numMem )
	
	return 1
	--LuaFnDeleteMonster( sceneId, targetId)
	--PrintStr( tostring( targetId ) )
	
	
end

--**********************************
--放弃
--**********************************
function x900019_OnAbandon( sceneId, selfId )

end

--**********************************
--创建副本
--**********************************
function x900019_CreateBoss( sceneId, iniLevel )
    if( iniLevel < x900019_g_minLevel ) then
        iniLevel = x900019_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end

    --PrintStr( "x900019_CreateBoss" )
	local	ini		= floor( iniLevel / 10 ) - 3
	if ini <= 0 then
		ini	= 1
	elseif ini > 9 then
		ini	= 9
	end
	local typ = x900019_Monster_Boss[ini]	--怪物编号

	local objId = LuaFnCreateMonster(sceneId, typ, 67, 72, 14, 253, 900019 )	
	SetMonsterGroupID( sceneId, objId, x900019_g_BossGroupID )
	SetCharacterTitle(sceneId, objId, "“宝藏之王”")
	SetLevel( sceneId, objId, iniLevel )
		
	CallScriptFunction((200060), "Paopao",sceneId, strMonsterName, "凤凰陵墓", "天堂有路你不走，地狱无门你闯进来！既然来了，就别想再出去了，明年的今天就是你的忌日。")
	
end

--**********************************
--创建副本
--**********************************
function x900019_MakeCopyScene( sceneId, selfId, nearmembercount )
	
	--指数参数
	local	param0	= 4;
	local	param1	= 3;

	--最终结果
	local	mylevel	= 0;

	--临时变量
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
		mylevel = x900019_g_minLevel;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "PhoenixMaze.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x900019_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x900019_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["typ"], x900019_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["spt"], x900019_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["scn"], sceneId )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["FlagThielf"], 800 )
	
	local x,z = GetWorldPos( sceneId, selfId )	
	
	
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["x"], x )
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["z"], z )
	
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["ObjKilled"], 0 )  --设置杀怪数量

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["MyLevel"], mylevel )
	
	LuaFnSetSceneLoad_Monster( sceneId, "PhoenixMaze_monster" .. iniLevel .. ".ini" )--PhoenixMaze_monster100.ini
	
    local CopyScene_LevelGap = 31
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值
	
	LuaFnSetCopySceneData_Param(sceneId, x900019_paramonce, 0)
	
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x900019_NotifyTip( sceneId, selfId, "副本创建成功！" )
	else
		x900019_NotifyTip( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end


end

--**********************************
--继续
--**********************************
function x900019_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x900019_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x900019_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end


function x900019_OnDie(sceneId, objId, killerId)
    --PrintStr( "x900019_OnDie [objId]"..objId.." [killerId]"..killerId.."[sceneId]"..sceneId )
    local DataID = GetMonsterDataID( sceneId, objId )
    x900019_OnKillObject( sceneId, killerId, DataID, objId )
    
end

--**********************************
--杀死怪物或玩家
--**********************************
function x900019_OnKillObject( sceneId, selfId, objdataId, objId )

--	for i=1,10 do
--		if (objdataId == x900019_NianShou_Boss[i]) then
--			return
--		end
--	end
	
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x900019_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--如果副本已经被置成关闭状态，则杀怪无效
	if leaveFlag == 1 then
		return
	end

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	

	--取得杀死怪物的GroupID,用于判断是否是所需要杀掉的Boss
	--local GroupID = GetMonsterGroupID( sceneId, objId )
	
	--local msgStr = format( "sceneId: %d, objId: %d, GroupID: %d", sceneId, objId, objdataId )
	--PrintStr( msgStr )
	
	--不是所需要的Boss
	local bIsBoss=0;
	
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID == x900019_g_BossGroupID then
	    bIsBoss = 1
	end
	--if  objdataId >= x900019_g_typMonster0 and objdataId <= x900019_g_typMonster1 then
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
			local message;
			
			local randMessage = random(3);
			if teamLeaderName ~= nil then		
				if randMessage == 1 then			
		   			message = format("#{_BOSS121}带着大量宝物躲藏在#G凤凰陵墓#Y里，一不小心被闯入的#B#{_INFOUSR%s}一掌打死。", teamLeaderName );
				elseif randMessage == 2 then		
					message = format("#B#{_INFOUSR%s}#cff0000#{FHGC_090706_11}#{_BOSS121}终于被打败", teamLeaderName );
				else
					message = format("在凤凰里#B#{_INFOUSR%s}一个降龙十巴掌，打得#{_BOSS121}吐血而死，#{_INFOUSR%s}捡起地上的带着队伍离去", teamLeaderName );
				end
			
				BroadMsgByChatPipe(sceneId, selfId, message, 4);
			end
	end
	-------------------------------------------------------------------------------



	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, x900019_g_keySD["ObjKilled"] )			--杀死Boss的数量
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, x900019_g_keySD["ObjKilled"] , killedbossnumber )					--设置杀死Boss的数量


	                if killedbossnumber >= x900019_g_TotalNeedKillBoss then
		           LuaFnSetCopySceneData_Param( sceneId, 4, 1 )  --设置任务完成标志
	                end



	local i
	local misIndex
	local humanObjId
		
	for i=0, num-1 do

		local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --取得当前场景里人的objId
		if LuaFnIsObjValid( sceneId, ServerID ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, ServerID ) == 1 then			  --不在场景的不做此操作

                        if killedbossnumber < ( x900019_g_TotalNeedKillBoss - 1 ) then 
			  local KillStr = format( "已杀死摸金校尉： %d/%d", killedbossnumber, x900019_g_TotalNeedKillBoss-1 )
			  x900019_NotifyTip( sceneId, ServerID, KillStr ) --显示杀怪数
                        end

			local KillStr = format( "已杀死搬山道人： %d/%d", floor(killedbossnumber/50), 1 )
			x900019_NotifyTip( sceneId, ServerID, KillStr ) --显示杀怪数

                        if killedbossnumber == ( x900019_g_TotalNeedKillBoss - 1 ) then    --杀完了所有小怪,刷boss
	                   x900019_NotifyTip( sceneId, ServerID, "一股神秘的力量正在墓穴深处汇集，越来越强大……" )
		           local CurLevel = LuaFnGetCopySceneData_Param( sceneId, x900019_g_keySD["MyLevel"] )
		           x900019_CreateBoss( sceneId, CurLevel )

                        end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x900019_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x900019_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x900019_OnCopySceneReady( sceneId, destsceneId )
    
	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--找不到该玩家
	if leaderObjId == -1 then
		return
	end

	--处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )

	local member
	local misIndex
	
	NewWorld( sceneId, leaderObjId, destsceneId, x900019_g_Fuben_X, x900019_g_Fuben_Z )
	-- 任务或活动统计
	LuaFnAuditQuest(sceneId, leaderObjId, "凤凰陵墓")
	--PrintStr( "x900019_OnCopySceneReady" )		
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑的状态
				NewWorld( sceneId, member, destsceneId, x900019_g_Fuben_X, x900019_g_Fuben_Z )
			-- 任务或活动统计
			LuaFnAuditQuest(sceneId, member, "凤凰陵墓")
		end
	end
	    
end

--**********************************
--有玩家进入副本事件
--**********************************
function x900019_OnPlayerEnter( sceneId, selfId )
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x900019_g_Fuben_X, x900019_g_Fuben_Z )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x900019_OnHumanDie( sceneId, selfId, killerId )

end

--**********************************
--将某玩家传送出副本,回到进入时的位置
--**********************************
function x900019_KickOut( sceneId, objId )
    local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号
	local x = LuaFnGetCopySceneData_Param( sceneId, x900019_g_keySD["x"] ) --进入时的坐标X
	local z = LuaFnGetCopySceneData_Param( sceneId, x900019_g_keySD["z"] ) --进入时的坐标Z
	
	if LuaFnIsObjValid( sceneId, objId ) == 1 then
	    NewWorld( sceneId, objId, oldsceneId, x, z )
	end
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x900019_OnCopySceneTimer( sceneId, nowTime )

	local once = LuaFnGetCopySceneData_Param( sceneId, x900019_paramonce )

--	if (once == 0) then
--	
--		LuaFnSetCopySceneData_Param(sceneId, x900019_paramonce, 1)
--		--年兽入侵
--		local mylevel = LuaFnGetCopySceneData_Param( sceneId, x900019_g_keySD["MyLevel"] )
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
--		for i=1, 5 do
--			local objId = LuaFnCreateMonster( sceneId, x900019_NianShou_Boss[iNianShouIdx], x900019_NianShou_Pos[i].x, x900019_NianShou_Pos[i].z, 1, 272, -1)
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end
	
	
	--副本时钟读取及设置
	--取得已经执行的定时次数
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
	TickCount = TickCount + 1
	--设置新的定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--需要离开
	if leaveFlag == 1 then
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x900019_g_CloseTick then										--倒计时间到，大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x900019_KickOut( sceneId, mems[i] )				
				end
			end
						
		elseif leaveTickCount < x900019_g_CloseTick then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在%d秒后离开场景!", (x900019_g_CloseTick-leaveTickCount) * x900019_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x900019_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x900019_g_LimitTimeSuccess then
		--此处设置有时间限制的任务完成处理
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x900019_NotifyTip( sceneId, mems[i], "任务时间到，完成!" )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x900019_g_LimitTotalHoldTime then						--副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x900019_NotifyTip( sceneId, mems[i], "任务失败，超时!" )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
	
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )		--取得保存的队伍号
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					x900019_NotifyTip( sceneId, mems[i], "你不在正确的队伍中!" )
					x900019_KickOut( sceneId, mems[i] )
				end
			end
		end

	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x900019_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--醒目提示
--**********************************
function x900019_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

