--副本任务
--木人

--************************************************************************
--MisDescBegin

--脚本号
x890057_g_ScriptId = 890057

--复活次数
x890057_g_ReLifeTimes = 10
--副本名称
x890057_g_CopySceneName="虚空幻境"
x890057_g_BossName = {"护岛神兽·幻","冰妖·幻","混江龙·幻","远古棋魂·幻","愤怒的葛荣·幻","秦皇之魄·幻","帝后·幻","搬山道人·幻","镜湖水匪头领·幻","火焰妖魔·幻","九黎头领·幻","帅(宋)·幻","将(辽)·幻","九黎族长·幻","守陵监·幻","萧逸风·幻","萧如筠·幻","萧如蔚·幻","耶律焱·幻","耶律连城·幻","迦叶尊者·幻","紧那罗王·幻","迦楼罗王·幻","阿修罗王·幻","帝释天·幻"}
x890057_g_BossID = {}
x890057_g_BossID[70] = {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[80] = {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[90] = {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[100] = {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[110] = {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_BossID[120] = {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890057_g_MissBoss = {8,9,10,11,12}
--MisDescEnd
--************************************************************************

--角色Mission变量说明
x890057_g_Param_huan		=0	--0号：已经完成的环数，在接收任务时候赋值
x890057_g_Param_ok			=1	--1号：当前任务是否完成(0未完成；1完成)
x890057_g_Param_sceneid		=2	--2号：当前副本任务的场景号
x890057_g_Param_teamid		=3	--3号：接副本任务时候的队伍号
x890057_g_Param_killcount	=4	--4号：杀死任务怪的数量
x890057_g_Param_time		=5	--5号：完成副本所用时间(单位：秒)
--6号：未用
--7号：未用

x890057_g_CopySceneType=FUBEN_ZHOUTIAN	--副本类型，定义在ScriptGlobal.lua里面
x890057_g_LimitMembers=3			--可以进副本的最小队伍人数
x890057_g_TickTime=5				--回调脚本的时钟时间（单位：秒/次）
x890057_g_LimitTotalHoldTime=300	--360,1440副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x890057_g_LimitTimeSuccess=300		--360,1440副本时间限制（单位：次数），如果此时间到了，任务完成
x890057_g_CloseTick=6				--副本关闭前倒计时（单位：次数）
x890057_g_NoUserTime=5			--副本中没有人后可以继续保存的时间（单位：秒）
x890057_g_DeadTrans=0				--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x890057_g_Fuben_X=22				--进入副本的位置X
x890057_g_Fuben_Z=55				--进入副本的位置Z
--还没定义
x890057_g_TotalNeedKill=5			--需要杀死怪物数量



--**********************************
--接受
--**********************************
function x890057_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--放弃
--**********************************
function x890057_OnAbandon( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x890057_MakeCopyScene( sceneId, selfId, nearmembercount,TeamLeader,Useitemnum,tagetid1,tagetid2,tagetid3,tagetid4,tagetid5)
    local teamemissdata = {tagetid1,tagetid2,tagetid3,tagetid4,tagetid5}
	local mylevel = floor(GetLevel( sceneId, selfId)/10)
	if mylevel < 7 then
	mylevel = 7
	elseif mylevel > 12 then
	mylevel = 12
	else
	mylevel = mylevel
	end

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "zhoutian.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x890057_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x890057_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x890057_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x890057_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量
	LuaFnSetCopySceneData_PvpRuler( sceneId, 9 )
	for i = 8,12 do
	if teamemissdata[i-7] ~= nil then
	LuaFnSetCopySceneData_Param( sceneId, i,teamemissdata[i-7] )
	else
	LuaFnSetCopySceneData_Param( sceneId, i,0 )
	end
	end
    LuaFnSetCopySceneData_Param(sceneId, 30, Useitemnum)
	local x,z = GetWorldPos( sceneId, selfId )		
	 LuaFnSetSceneLoad_Monster( sceneId, "zhoutian_monster.ini" )
	
    	 local CopyScene_LevelGap = 31
	 LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel*10) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--继续
--**********************************
function x890057_OnContinue( sceneId, selfId, targetId )
	
end

--**********************************
--检测是否可以提交
--**********************************
function x890057_CheckSubmit( sceneId, selfId )
	
end

--**********************************
--提交
--**********************************
function x890057_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end
--**********************************
--怪物死亡
--**********************************
function x890057_OnDie(sceneId, objId, killerId)



end
--**********************************
--杀死怪物或玩家
--**********************************
function x890057_OnKillObject( sceneId, selfId, objdataId ,objId )


end

--**********************************
--进入区域事件
--**********************************
function x890057_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x890057_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x890057_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	NewWorld( sceneId,leaderObjId, destsceneId, x890057_g_Fuben_X, x890057_g_Fuben_Z)
	local nearmembercount	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	for	i=0, nearmembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then
		NewWorld( sceneId, member, destsceneId, x890057_g_Fuben_X, x890057_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x890057_OnPlayerEnter( sceneId, selfId )

--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%50", "%50", "%50", sceneId, x890057_g_Fuben_X, x890057_g_Fuben_Z );
	--SetUnitCampID(sceneId, selfId, selfId, 109)
        local itemnum = LuaFnGetCopySceneData_Param(sceneId, 30)
        local yunyuoitemnum = GetMissionData( sceneId, selfId, ZHOUTIANITEM)
	local lastTime = GetMissionData( sceneId, selfId, WJMISS )
	
	
		  			BeginEvent(sceneId)
	  				strText =lastTime
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
				
				
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
		yunyuoitemnum = 0
	end
        
	lastDayCount = lastDayCount + 1
	yunyuoitemnum = yunyuoitemnum + itemnum + CurDayTime*1000
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, WJMISS, lastTime )
	SetMissionData( sceneId, selfId, ZHOUTIANITEM, yunyuoitemnum )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x890057_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x890057_OnCopySceneTimer( sceneId, nowTime )
	--副本时钟读取及设置
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取得已经执行的定时次数
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新的定时器调用次数
    	 local CopyScene_LevelGap = 31
	local mylevel = LuaFnGetCopySceneData_Param(sceneId, CopyScene_LevelGap) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;

			--通知当前副本场景里的所有人，准备出怪	   		
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
                    if (GetTeamLeader(sceneId,mems[i]) ~= mems[i] or GetTeamSize(sceneId,mems[i]) ~= 1) and (LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 and LuaFnIsCharacterLiving(sceneId, mems[i]) == 1)   then
                    	  			BeginEvent(sceneId)
	  				strText = format("你必须是队长，且是一个人的队伍" )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
                    x890057_KickOut( sceneId, mems[i] )                    
                    return
                    end	
                    end	
          		
					
	  if TickCount == 1 then
	
			--通知当前副本场景里的所有人，准备出怪
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("将在%d秒后开始出怪!", 10 )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
		
        
        if TBsytiemer ~= nil and  TickCount == TBsytiemer then
			--通知当前副本场景里的所有人，准备出怪	   		
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  if TBsytiemer1 < 6 then	
			  miss = LuaFnGetCopySceneData_Param(sceneId,x890057_g_MissBoss[TBsytiemer1])
			  delmiss = LuaFnGetCopySceneData_Param(sceneId, x890057_g_MissBoss[TBsytiemer1-1])
			  senzhen = LuaFnGetCopySceneData_Param(sceneId, x890057_g_MissBoss[TBsytiemer1-1])	
		MstId1 = LuaFnCreateMonster(sceneId, x890057_g_BossID[mylevel][miss], 29, 40, 19, 0, 890058)
	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for k=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,k)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		if MosDataID == x890057_g_BossID[mylevel][delmiss] then
		LuaFnDeleteMonster( sceneId, MonsterId )
		------SetCharacterDieTime(sceneId, MonsterId, 1)
		end
		end
		
		MstId2 = LuaFnCreateMonster(sceneId, x890057_g_BossID[mylevel][senzhen], 48, 48, 19, 0, 890058)
		LuaFnSendSpecificImpactToUnit(sceneId, MstId2, MstId2, MstId2, 152, 0)
                SetCharacterName( sceneId, MstId1, x890057_g_BossName[miss] )
                SetCharacterName( sceneId, MstId2, x890057_g_BossName[senzhen] )
                SetUnitReputationID(sceneId, MstId1, MstId1, 8)
                SetUnitReputationID(sceneId, MstId2, MstId2, 8)
                else
	        delmiss = LuaFnGetCopySceneData_Param(sceneId,x890057_g_MissBoss[5])
	        senzhen = LuaFnGetCopySceneData_Param(sceneId,x890057_g_MissBoss[5])
	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for k=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,k)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		if MosDataID == x890057_g_BossID[mylevel][delmiss] then
		LuaFnDeleteMonster( sceneId, MonsterId )
		------SetCharacterDieTime(sceneId, MonsterId, 1)
		end
		end
                MstId1 = LuaFnCreateMonster(sceneId, x890057_g_BossID[mylevel][senzhen], 48, 48, 19, 0, 890058)
                LuaFnSendSpecificImpactToUnit(sceneId, MstId1, MstId1, MstId1, 152, 0)
                SetCharacterName( sceneId, MstId1, x890057_g_BossName[senzhen] )
                SetUnitReputationID(sceneId, MstId1, MstId1, 8)
                end
	BeginEvent(sceneId)
	strText = format("可以挑战%s了!", x890057_g_BossName[senzhen])
	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,mems[i])                
                end
				
        TBsytiemer = nil
        TBsytiemer1 = nil
        end
        
        local a,b = x890057_SetFubenTimer( sceneId, 0,2 )
        if a ~= 0 and b	~= 0 then
        TBsytiemer = a
        TBsytiemer1 = b
        
			--通知当前副本场景里的所有人，准备出怪
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
	local mems = {}
	for	i=0,membercount-1 do
	mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	BeginEvent(sceneId)
	if b == 6 then
	strText = format("将在%d秒后可以挑战最后只BOSS!", (a-TickCount)*5,b,b-1 )
	else
	strText = format("将在%d秒后出第%d只BOSS,可以挑战第%d只BOSS!", (a-TickCount)*5,b,b-1 )
	end
	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,mems[i])
	end
        
        end
						
        if TickCount == 2 then
			--通知当前副本场景里的所有人，准备出怪
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	      local miss = {}			
              miss[1] = LuaFnGetCopySceneData_Param(sceneId, x890057_g_MissBoss[1])
              miss[2] = LuaFnGetCopySceneData_Param(sceneId, x890057_g_MissBoss[2])
              local MstId = {}
              for j = 1,2 do
              if j == 1 then
              x = 48
              y = 48
	      MstId[j] = LuaFnCreateMonster(sceneId, x890057_g_BossID[mylevel][miss[j]], x, y, 19, 0, 890058)
              end
              if j == 2 then
              x = 29
              y = 40
	      MstId[j] = LuaFnCreateMonster(sceneId, x890057_g_BossID[mylevel][miss[j]], x, y, 19, 0, 890058)
              end
              
	              
        SetCharacterName( sceneId, MstId[j], x890057_g_BossName[miss[j]] )	
        SetUnitReputationID(sceneId, MstId[j], MstId[j], 8)
	end
	BeginEvent(sceneId)
	strText = format("可以挑战%s了!", x890057_g_BossName[miss[1]])
	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,mems[i])                
        end
        end
	if leaveFlag == 1 then --需要离开

		--离开倒计时间的读取和设置
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;

		if leaveTickCount == x890057_g_CloseTick then --倒计时间到，大家都出去吧

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				x890057_KickOut( sceneId, mems[i] )
				----调用同一个函数NewWorld( sceneId, mems[i], oldsceneId, x890057_g_Back_X, x890057_g_Back_Z )
			end

		elseif leaveTickCount<x890057_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("你将在%d秒后离开场景!", (x890057_g_CloseTick-leaveTickCount)*x890057_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x890057_g_LimitTimeSuccess then
		--此处设置有时间限制的任务完成处理
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)

  			BeginEvent(sceneId)
  				AddText(sceneId,"任务时间到，完成!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  			
  			
  			
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	elseif TickCount == x890057_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)

  			BeginEvent(sceneId)
  				AddText(sceneId,"任务失败，超时!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end
end
--**********************************
--将某玩家传送出副本,回到进入时的位置
--**********************************
function x890057_KickOut( sceneId, objId )
if  LuaFnIsCharacterLiving(sceneId, objId) ~= 1 or LuaFnIsObjValid( sceneId, objId ) ~= 1 or LuaFnIsCanDoScriptLogic( sceneId, objId ) ~= 1 then
    
    return
    end
    
    local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号
	local x = 252 --进入时的坐标X
	local z = 259 --进入时的坐标Z
	if oldsceneId == 0 then
	 x = 217 --进入时的坐标X
	 z = 242 --进入时的坐标Z
	elseif  oldsceneId == 1 then
	 x = 200 --进入时的坐标X
	 z = 334 --进入时的坐标Z
	elseif  oldsceneId == 2 then
	 x = 240 --进入时的坐标X
	 z = 57 --进入时的坐标Z
	end
	if LuaFnIsObjValid( sceneId, objId ) == 1 then
	    NewWorld( sceneId, objId, oldsceneId, x, z )
	end
	
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x890057_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x890057_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
-- 检测开放时间
--**********************************
function x890057_IsActivityOpen(sceneId)
	local nHour = GetHour();
	local nMinute = GetMinute();
	local nCurTempTime = nHour * 60 + nMinute;
	if nCurTempTime >= 20 * 60 and nCurTempTime < 21 * 60 + 20 then
		return 1;
	end
	return 0;
--	return 1
end
--**********************************
-- 检测开放时间2
--**********************************
function x890057_IsActivityOpen2(sceneId)
	local nHour = GetHour();
	local nMinute = GetMinute();
	local nCurTempTime = nHour * 60 + nMinute;
	if nCurTempTime >= 21 * 60 + 20 and nCurTempTime < 21 * 50 then
		return 1;
	end
	return 0;
--	return 1
end
--**********************************
-- 赋值
--**********************************
function x890057_ToMax( sceneId, selfId, killerId ,guildName,maxCount )
	PK_MAXCOUNTGUILD=guildName
	PK_MAXCOUNT=maxCount
end
--**********************************
-- 全球通告
--**********************************
function x890057_GlobalCountNews( sceneId, selfId, targetId,str )
	BeginEvent( sceneId )
        	AddGlobalCountNews( sceneId, str )
        EndEvent( sceneId )
        DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x890057_SetFubenTimer( sceneId, nowTime,tabey )
        if tabey == 1 then
	Timer = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取得已经执行的定时次数
	FubenTimer = Timer+5
	TBtiemer = nowTime
	return
	end
	if tabey == 2 then
	
	if TBtiemer == nil then
	return 0,0
	end
	atiemer = TBtiemer
	TBtiemer = nil
	return FubenTimer,atiemer
	
        end
        
        end


