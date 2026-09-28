--企鹅王BOSS刷新公告

--脚本编号
x888776_g_ScriptId	= 888776


function x888776_OnRespawn( sceneId, selfId, targetId )

end
--**********************************
--Monster Timer
--**********************************
function x888776_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--全球公告
	--local	nam_mob	= GetName( sceneId, objId )
	--if nam_mob ~= nil then
	--	str	= format( "#G银皑雪原#P真正的主人，伟大的123#P，已经挥舞着权杖出现在它的领土上了！", nam_mob )
	--	AddGlobalCountNews( sceneId, str )
	--end
	--AddGlobalCountNews( sceneId, "objId:"..objId )
	--取消时钟
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--死亡事件
--**********************************
function x888776_OnDie( sceneId, selfId, killerId )
	x888776_DealExp(sceneId, selfId)
end	
	
	
	
function x888776_DealExp(sceneId, selfId)
		local nPlayerCamp = GetUnitCampID(sceneId, selfId, selfId)
	-- 开启宝箱的同时，分配Exp
	local nHumanIdList = {}
	
	for i=1, 10  do
		nHumanIdList[i] = -1
	end
	
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local j=1
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) == nPlayerCamp   then
			nHumanIdList[j] = nHumanId
			j = j+1
		end
	end
	

	
	
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) ~= nPlayerCamp   then
			AddExp(sceneId, nHumanId, floor(50000))
		end
	end
	
end