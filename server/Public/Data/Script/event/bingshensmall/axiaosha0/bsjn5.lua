--技能
--啊萧
--第一次

x391235_g_scriptId = 391235


--**********************************
--事件交互入口
--**********************************
function x391235_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end
	local nObjId1 = 1
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "耶律元"  then
	nObjId1 = nObjId
		end
	end
		x391235_axiao01( sceneId, nObjId1 )
		x391235_axiao0( sceneId, nObjId1 )
		x391235_axiao1( sceneId, nObjId1 )
		x391235_axiao2( sceneId, nObjId1 )
		x391235_axiao3( sceneId, nObjId1 )
		x391235_axiao4( sceneId, nObjId1 )
		x391235_axiao5( sceneId, nObjId1 )
end

function x391235_axiao01( sceneId, selfId )
		LuaFnCreateMonster(sceneId, 45217, 119, 125, 0, 0, 391218 )
		LuaFnCreateMonster(sceneId, 45217, 119, 112, 0, 0, 391218 )
		LuaFnCreateMonster(sceneId, 45217, 126, 112, 0, 0, 391218 )
		LuaFnCreateMonster(sceneId, 45217, 126, 125, 0, 0, 391218 )
end
function x391235_axiao0( sceneId, selfId )
		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 114, 142, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 114, 142, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 114, 142, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 146, 142, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 146, 142, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 146, 142, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 122, 142, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 122, 142, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 122, 142, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 138, 142, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 138, 142, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 138, 142, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 130, 142, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 130, 142, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 130, 142, 8000)
end
function x391235_axiao1( sceneId, selfId )
		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 114, 134, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 114, 134, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 114, 134, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 146, 134, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 146, 134, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 146, 134, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 122, 134, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 122, 134, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 122, 134, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 138, 134, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 138, 134, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 138, 134, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 130, 134, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 130, 134, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 130, 134, 8000)
end
function x391235_axiao2( sceneId, selfId )
		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 114, 126, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 114, 126, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 114, 126, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 146, 126, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 146, 126, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 146, 126, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 122, 126, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 122, 126, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 122, 126, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 138, 126, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 138, 126, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 138, 126, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 130, 126, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 130, 126, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 130, 126, 8000)
end
function x391235_axiao3( sceneId, selfId )
		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 114, 118, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 114, 118, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 114, 118, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 146, 118, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 146, 118, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 146, 118, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 122, 118, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 122, 118, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 122, 118, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 138, 118, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 138, 118, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 138, 118, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 130, 118, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 130, 118, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 130, 118, 8000)
end
function x391235_axiao4( sceneId, selfId )
		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 114, 110, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 114, 110, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 114, 110, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 146, 110, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 146, 110, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 146, 110, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 122, 110, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 122, 110, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 122, 110, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 138, 110, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 138, 110, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 138, 110, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 130, 110, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 130, 110, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 130, 110, 8000)
end
function x391235_axiao5( sceneId, selfId )
		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 114, 102, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 114, 102, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 114, 102, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 146, 102, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 146, 102, 0)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 146, 102, 0)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 122, 102, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 122, 102, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 122, 102, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 138, 102, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 138, 102, 4000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 138, 102, 4000)

		CreateSpecialObjByDataIndex(sceneId, selfId, 750, 130, 102, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 751, 130, 102, 8000)
		CreateSpecialObjByDataIndex(sceneId, selfId, 752, 130, 102, 8000)
end

