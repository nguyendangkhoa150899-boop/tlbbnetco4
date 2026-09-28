-- 人物2.5经验时间药水

--脚本号
x300046_g_scriptId = 300046
x300046_g_ItemId = 30008014


--**********************************
--事件交互入口
--**********************************
function x300046_OnDefaultEvent( sceneId, selfId, nItemIndex )


	x300046_UseItem( sceneId, selfId, nItemIndex)
end

function x300046_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300046_EatMe( sceneId, selfId, nItemIndex)
	x300046_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300046_UseItem( sceneId, selfId, nItemIndex)
	-- 先检测这个 nItemIndex 的物品是不是和当前的对应，
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300046_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  背包内部错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 扣一个药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
	LuaFnAwardTitle( sceneId, selfId,  3,105)  --把原来的称号替换
	  SetCurTitle(sceneId,selfId,3,105)         --给称号	
	  LuaFnDispatchAllTitle(sceneId, selfId)  --刷新客户端称号
		--DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

