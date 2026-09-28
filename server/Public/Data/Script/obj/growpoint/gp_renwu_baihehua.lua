--生长点(云雀编制2015年10月)
--百合花
--脚本号716001
--灵芝100%
--等级1

--每次打开必定获得的产品
x716001_g_MainItemId = 40004500
--任务号
x716001_g_MissionId = 1452

--生成函数开始************************************************************************
--每个ItemBox中最多10个物品
function	x716001_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入一个物品
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x716001_g_MainItemId)	--每个生长点最少能得到一个物品,这里直接放入itembox中一个
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x716001_OnOpen(sceneId,selfId,targetId)
	if   IsHaveMission(sceneId,selfId,1452) > 0   then     --已经接寻找百合花任务
		  local SL= GetItemCount( sceneId, selfId, 40004500 ) -- 获得玩家身上有的 百合花 的数量
		  if  SL < 5  then
			return OR_OK
		 end
	      local SL= GetItemCount( sceneId, selfId, 40004500 )
		  if  SL >= 5  then
              local misIndex = GetMissionIndexByID(sceneId,selfId,1452)
	          SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
            BeginEvent(sceneId)
			strText = "你已经完成寻找百合花任务"
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		    return OR_U_CANNT_DO_THIS_RIGHT_NOW
		  end
	else
         BeginEvent(sceneId)
			strText = "你没有接取寻找百合花的任务"
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return OR_U_CANNT_DO_THIS_RIGHT_NOW
	end
   
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	x716001_OnRecycle(sceneId,selfId,targetId)
	--返回1，生长点回收
	return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x716001_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x716001_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

--**********************************
--道具改变
--**********************************
function x716001_OnItemChanged( sceneId, selfId, itemdataId )
        local SL= GetItemCount( sceneId, selfId, 40004500 )
	if SL<=5  then 
            BeginEvent(sceneId)
		strText = "已经得到 "..SL.."  朵百合花"
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end	
end