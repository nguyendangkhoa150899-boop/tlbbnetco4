--打开仇杀

--脚本号 （改成正确脚本号）



x800113_g_scriptId = 800113





function x800113_OnDefaultEvent( sceneId, selfId, targetId )

	LuaFnCallOpenRevengeUI(sceneId, selfId, targetId, 29)

end



function x800113_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId,x800113_g_scriptId,"Ta mu痭 鸢 s醫",10,x800113_g_scriptId)

end

