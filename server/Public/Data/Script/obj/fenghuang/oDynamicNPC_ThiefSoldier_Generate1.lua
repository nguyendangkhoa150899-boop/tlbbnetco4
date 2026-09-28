--凤凰古城NPC
--摸金校尉
--by 赤の之蝎 QQ-718805400

--脚本号
x900020_g_ScriptId	= 900020

--所拥有的事件ID列表
x900020_g_EventList	= { 900019 }
--接取任务的最低等级
x900020_g_minLevel			= 75

x900020_g_scenePosInfoList = {
	{sceneId=191, sceneName="凤凰古城", minL=12, maxL=15,  posList={
																						{x=102, z=119, r=10},{x=144, z=145, r=10},{x=234, z=199, r=10},{x=119, z=87, r=10},
																						{x=87, z=135, r=10},{x=147, z=178, r=10},{x=192, z=167, r=10},{x=192, z=88, r=10},
																						{x=86, z=148, r=10},{x=176, z=146, r=10},{x=233, z=119, r=10},{x=112, z=209, r=10},
																						{x=83, z=174, r=10},{x=137, z=206, r=10},{x=171, z=94, r=10},{x=117, z=235, r=10},
																						{x=84, z=197, r=10},{x=164, z=213, r=10},{x=162, z=118, r=10},{x=161, z=161, r=10},
																						{x=113, z=209, r=10},{x=148, z=234, r=10},{x=170, z=196, r=10},{x=70, z=119, r=10},
																						{x=125, z=167, r=10},{x=193, z=237, r=10},{x=183, z=120, r=10},{x=88, z=134, r=10},
																						{x=126, z=156, r=10},{x=203, z=204, r=10},{x=130, z=113, r=10},{x=237, z=155, r=10},
																						
																						

																						
																																												
																						
																						
																					}
	},

}


function x900020_InList( Data, List )
    for i, Element in List do
        if Element == Data then
            return 1
        end
    end

    return 0    
end

function x900020_GetValidIndex( PosList, IndexList )
    local PosListSize = getn( PosList )
    local IndexListSize = getn( IndexList )
    
    local i = 0
    local Data = 1
    while i<15 do
        Data = random( PosListSize )
        local bInList = x900020_InList( Data, IndexList )
        if  0 == bInList  then
            i = 15
        end
        i = i + 1      --为防止死循环,当 i超过50时,将退出循环
    end
    
    IndexList[ IndexListSize + 1 ] = Data
    
end


function x900020_CollectIndex( PosList, IndexList, IndexListSize )
    for i=1, IndexListSize do
        x900020_GetValidIndex( PosList, IndexList )
    end
    
end

function x900020_GenObj( sceneId, PosList )     --产生贼兵NPC
    local PosIndex = {}
    local IndexList = {}
    
    local IndexListSize = 30
    x900020_CollectIndex( PosList, IndexList, IndexListSize )
    
    local IndexListSize = getn( IndexList )
    
    local i=1
    local str
    for i=1, IndexListSize do
        
        --if( 24 == sceneId ) then
        --PrintStr( "Index:"..IndexList[i].." ".. tostring( PosList[ IndexList[i] ].x )..","..tostring( PosList[ IndexList[i] ].z ) )        
        --end
        
        --local this_x,this_z = x900020_Random_Nativity(PosList[ IndexList[i] ].x, PosList[ IndexList[i] ].z, PosList[ IndexList[i] ].r)
        local this_x,this_z = x900020_Random_Nativity(PosList[ IndexList[i] ].x, PosList[ IndexList[i] ].z, 0 )
        
		local MonsterId = LuaFnCreateMonster( sceneId, 13786, this_x, this_z, 3, -1, 900018 )
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)	
    end
      

end

--**********************************
--心跳函数
--**********************************
function x900020_OnTimer( sceneId, actId, uTime )
	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end
end

--**********************************
--事件交互入口 19-145-40 18-149-48
--**********************************
function x900020_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

            --参数说明：场景ID，活动ID，时间间隔 公告
	        StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	        
			for i, v in x900020_g_scenePosInfoList do
				if v.sceneId == sceneId then
				    x900020_GenObj( sceneId, v.posList )
				 
				   -- j=0
					--	while j<30 do
							
					--		local index = random(getn(v.posList))							
					--		local strText = format( "当前sceneid: %d, %d-%d,%d", sceneId, v.sceneId, v.posList[index].x, v.posList[index].z)
							
					--		local this_x,this_z = x900020_Random_Nativity(v.posList[index].x, v.posList[index].z, v.posList[index].r)
					--		MonsterId = LuaFnCreateMonster( sceneId, 473, this_x, this_z, 3, -1, 50012 )
					--		SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)									
					--		j = j+1																
					--	end						
					--	return
				end				
		end
		
	
end



function x900020_Random_Nativity(position_x,position_z,Range)
 local Variety_X,Variety_Z;
 if position_x > 2 then
  Variety_X = position_x - 1 + random(3)+random(Range+1)
 end
 
 if position_z > 2 then
  Variety_Z = position_z - 1 + random(3)+random(Range+1)
 end

 return Variety_X,Variety_Z
end


--**********************************
--事件列表选中一项
--**********************************
function x900020_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x900020_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x900020_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x900020_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x900020_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x900020_g_EventList do
		if missionScriptId == findId then
			x900020_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x900020_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x900020_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x900020_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x900020_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x900020_OnDie( sceneId, selfId, killerId )
end

