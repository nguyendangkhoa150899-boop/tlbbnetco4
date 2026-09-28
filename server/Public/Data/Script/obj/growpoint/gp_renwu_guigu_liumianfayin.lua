--生长点
--六面法印(鬼谷师门任务道具）
--脚本号715052
--六面法印100%
--等级1

--每次打开必定获得的产品
x715052_g_MainItemId = 40004849
--任务号
x715052_g_MissionId = 1381

--生成函数开始************************************************************************
--每个ItemBox中最多10个物品
function	x715052_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入一个物品
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715052_g_MainItemId)	--每个生长点最少能得到一个物品,这里直接放入itembox中一个
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x715052_OnOpen(sceneId,selfId,targetId)

        local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x715052_g_MissionId,x715052_g_MainItemId)
	if ret > 0 then
		return OR_OK
	else
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	end

end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	x715052_OnRecycle(sceneId,selfId,targetId)
	--返回1，生长点回收
	return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715052_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x715052_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
