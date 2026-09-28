


--作者 By UK QQ 2269169441
x350010_g_scriptId = 350010
x350010_g_BUFFID = {}
x350010_g_BUFFID[1146]={"聚星阵·长生",1,16916,"长生星阵",30000}
x350010_g_BUFFID[1148]={"绝星阵·破军",2,16917,"破军星阵",10000}
x350010_g_BUFFID[1158]={"聚星阵·阴阳",3,16918,"阴阳星阵",10000}
x350010_g_BUFFID[1162]={"绝星阵·七杀",4,16927,"七杀星阵",15000}
x350010_g_BUFFID[1165]={"缩地成寸",5}
x350010_g_BUFFID[1166]={"绝星阵·贪狼",6,16928,"贪狼星阵",15000}
x350010_g_BUFFID[1171]={"破军绝星阵",7,16917,"破军星阵",10000}
x350010_g_BUFFID[1172]={"长生聚星阵",8,16916,"长生星阵",30000}
x350010_g_BUFFID[1173]={"破军绝星阵",9,16917,"破军星阵",10000}
function x350010_OnImpactFadeOut( sceneId, selfId, impactId)
	if GetHp( sceneId, selfId ) == 0 then
		return
	end
if x350010_g_BUFFID[impactId] == nil or x350010_g_BUFFID[impactId][2] == nil  then
return
end
if x350010_g_BUFFID[impactId][2] == 5 then
local targetid = GetMissionData( sceneId, selfId, MF_GetNewUserCard9)
local objType = GetCharacterType( sceneId, targetid )
if targetid < 1 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, targetid, 1174) == 1 or objType ~= 1 or LuaFnIsObjValid(sceneId, targetid) ~= 1 or LuaFnIsCharacterLiving(sceneId, targetid) ~= 1 or 1 ~= LuaFnUnitIsFriend(sceneId, targetid, selfId) then
x350010_Tips( sceneId, selfId, "无效目标" )
end
if targetid > 0 then
if IsInDist( sceneId, selfId, targetid, 15 ) ~= 1 then
x350010_Tips( sceneId, selfId, "目标距离超出范围" )
end
end
end
if x350010_g_BUFFID[impactId][2] ~= 5 then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 1147) == 1 then
x350010_Tips( sceneId, selfId, "30秒内只能放一种星阵" )
end
end
local	PlayerX,PlayerZ = GetWorldPos(sceneId,selfId)
SetMissionData( sceneId, selfId, GUIGU_XINGZHEN,x350010_g_BUFFID[impactId][2]*1000000+floor(PlayerX)*1000+floor(PlayerZ))
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 1176, 460);
if x350010_g_BUFFID[impactId][2] ~= 5 then
if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 1147) == 0 then
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 1147, 660);
end
end
end

--**********************************
--玩家屏幕中间提示
--**********************************
function x350010_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end