--ÐþÎäµºBOSS°ó¶¨

--½Å±¾±àºÅ
x391217_g_ScriptId	= 391217

--**********************************
--Monster Timer
--**********************************
function x391217_OnCharacterTimer( sceneId, objId, dataId, uTime )
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x391217_OnDie( sceneId, objId, killerId )
	local x,z = GetWorldPos( sceneId, objId )
		CreateSpecialObjByDataIndex(sceneId, objId, 753, x, z, 0)
end
