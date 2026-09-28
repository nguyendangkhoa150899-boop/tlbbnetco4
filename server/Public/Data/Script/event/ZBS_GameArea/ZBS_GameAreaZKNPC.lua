--盟战main脚本
--Author UK 
--脚本号
x600055_g_scriptId = 600055
x600055_g_MyKillNum = MD_MY_KILLNUM
x600055_g_OtherKillMyNum = MD_OTHER_KILLMYNUM 
--**********************************
--
--**********************************
function x600055_OnDefaultEvent( sceneId, selfId,targetId)
local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
local str0 = "参加帮战人数:#G"..nHumanCount.."#W人#r#cFF0000温馨提示:中途退出将清空个人战绩" 
local str = "#cFF0000帮派战绩排行#r"
if LuaFnGetCopySceneData_Param(sceneId,31) > 0 then
local banhui,killernum
for i = 0,LuaFnGetCopySceneData_Param(sceneId,31)-1 do
banhui = mod(LuaFnGetCopySceneData_Param(sceneId,i),10000)
killernum = floor(LuaFnGetCopySceneData_Param(sceneId,i)/10000)
if i ~= LuaFnGetCopySceneData_Param(sceneId,31) then
str=str.."#W["..banhui.."]号帮杀:".. killernum.."人#r"
else
str=str.."#W["..banhui.."]号帮杀:".. killernum.."人"
end
end
end  
if str == "#cFF0000帮派战绩排行#r"   then
str = "#cFF0000帮派战绩排行#r#W*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r*号帮杀:#G0#W人#r" 
end
local MyKillNum = GetMissionData( sceneId, selfId, x600055_g_MyKillNum)
local OtherKillMyNum = GetMissionData( sceneId, selfId, x600055_g_OtherKillMyNum)
local str1 = "杀死人数:#G"..MyKillNum..""
local str2 = "死亡人数:#G"..OtherKillMyNum..""
	BeginEvent(sceneId)
	AddText( sceneId, str0 )
	AddText( sceneId, str1 )
	AddText( sceneId, str2 )
    AddText( sceneId, str )
	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 

 end

 
--**********************************
--
--**********************************
function x600055_OnEventRequest( sceneId, selfId, targetId, eventId)


end