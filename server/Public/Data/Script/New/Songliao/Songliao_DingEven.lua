-----鼎事件脚本---------
-----原创UK，增加修改君奉天QQ：137094888
----增加修改了死亡逻辑，增加修改了怪物攻击路线
--脚本号
x300114_g_scriptId = 300114
x300114_DataToMoster = {}

x300114_DataToMoster[14680] = {14693,14685,14686,14691,14692,14684,14684,14684,14684,14684}
x300114_DataToMoster[14681] = {14706,14698,14699,14704,14705,14697,14697,14697,14697,14697}


--x300114_DataToMoster[14680] = {MosterIditem = {14693,14685,14686,14691,14692,14684,14684,14684,14684,14684},KuoZhanAi = {-1,-1,4,-1,-1,-1,-1,-1,-1,-1}}
--x300114_DataToMoster[14681] = {MosterIditem = {14706,14698,14699,14704,14705,14697,14697,14697,14697,14697},KuoZhanAi = {-1,-1,4,-1,-1,-1,-1,-1,-1,-1}}

--**********************************
--事件交互入口
--**********************************
function x300114_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  我每隔两分钟会放出兵马炮作为攻击的主力")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x300114_OnEventRequest( sceneId, selfId, targetId, eventId )
	
end



function x300114_OnCharacterTimer( sceneId, objId, dataId, uTime )
if (dataId == nil) or (dataId ~= 14680 and  dataId ~= 14681) or (x300114_DataToMoster[dataId] == nil) then
return
end
local Xpos,Zpos = GetWorldPos(sceneId,objId)

for i = 1,getn(x300114_DataToMoster[dataId]) do
MonsterID = LuaFnCreateMonster(sceneId, x300114_DataToMoster[dataId][i], Xpos, Zpos, 0, -1, 300109 )

----for i = 1,getn(x300114_DataToMoster[dataId].MosterIditem) do
----MonsterID = LuaFnCreateMonster(sceneId, x300114_DataToMoster[dataId].MosterIditem[i], Xpos, Zpos, 0, x300114_DataToMoster[dataId].KuoZhanAi[i] , 300109 )
if MonsterID >= 0 then
SetCharacterDieTime(sceneId, MonsterID, 10*60*1000);
SetMonsterFightWithNpcFlag(sceneId, MonsterID, 1)


if dataId == 14680 then	
SetUnitCampID(sceneId, MonsterID, MonsterID,156)
--SetPatrolId(sceneId, MonsterID, 3)
if Xpos < 118  then---------大宋的三个顶，设定攻击路线
SetPatrolId(sceneId, MonsterID, 3)
elseif Xpos < 170  then
SetPatrolId(sceneId, MonsterID, 4)
elseif Xpos < 222  then
SetPatrolId(sceneId, MonsterID, 5)
end


elseif  dataId == 14681 then
SetUnitCampID(sceneId, MonsterID, MonsterID,157)
--SetPatrolId(sceneId, MonsterID, 0)
if Xpos < 118 then---------大辽的三个顶，设定攻击路线
SetPatrolId(sceneId, MonsterID, 0)
elseif  Xpos < 170  then
SetPatrolId(sceneId, MonsterID, 1)
elseif Xpos < 222   then
SetPatrolId(sceneId, MonsterID, 2)
end
end

end
end

end
--**********************************
--消息提示
--**********************************
function x300114_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--死亡事件
--**********************************
function x300114_OnDie( sceneId, objId, killerId )

---------------判断谁杀死的---------------
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
	killerId = GetPetCreator( sceneId, killerId )
	elseif objType ==1 then
	killerId = killerId
	else		
	--killerId = 0
	return
	end
	
	
	-------------得到杀死者的是宋还是辽方---------
	local	playerName	= GetName( sceneId, killerId )
  local mycamp = GetUnitCampID(sceneId, killerId, killerId)
  
local mymonster = 0	
local camjifen = 0
---------------------------中间谁打了中间顶就刷谁家的和团队加分处理----------------------------------
if mycamp == 156 then
mymonster = 14680
camjifen = LuaFnGetWorldGlobalData(56)
LuaFnSetWorldGlobalData(56,camjifen+50)
elseif mycamp == 157 then
mymonster = 14681
camjifen = LuaFnGetWorldGlobalData(57)
LuaFnSetWorldGlobalData(57,camjifen+50)
end
if mymonster == 0 then
return
end
local Xpos,Zpos = GetWorldPos(sceneId,objId)
local MonsterID = LuaFnCreateMonster(sceneId, mymonster, Xpos, Zpos, 0, -1, 300114 )
if MonsterID >= 0 then
SetCharacterDieTime(sceneId, MonsterID, 45*60*1000);
SetCharacterTimer( sceneId, MonsterID, 4*60*1000 )
end


---------------公告----------------------------
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		local Humancamp = GetUnitCampID(sceneId, nHumanId, nHumanId)
	if mycamp == Humancamp then
		local misslicunum = GetMissionData( sceneId, nHumanId, MD_SONGLIAO_JIFEN)
		SetMissionData( sceneId, nHumanId, MD_SONGLIAO_JIFEN,misslicunum+50)
		misslicunum = GetMissionData( sceneId, nHumanId, MD_SONGLIAO_JIFEN)
		x300114_MsgBox( sceneId, nHumanId, "我方"..playerName.."抢到鼎，我方每人增加积分50点,你现在的积分为"..misslicunum.."分" )	
		x300114_MsgBox( sceneId, nHumanId, "我方阵营总积分"..camjifen.."点" )	
	end	
	end
	
end



