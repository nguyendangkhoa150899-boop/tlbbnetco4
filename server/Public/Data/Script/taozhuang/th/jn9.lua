function x391909_OnImpactFadeOut(sceneId, selfId,key)
	if GetHp(sceneId, selfId) == 0 then		
		return		
	end
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5644) == 1 then
		return
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5640) == 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5641, 0)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5641) == 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5642, 0)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5642) == 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5643, 0)
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5643) == 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5644, 0)
		else
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5640, 0)
		end

--wy
end
