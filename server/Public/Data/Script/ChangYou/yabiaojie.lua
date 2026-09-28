

x895108_g_scriptId = 895108

yabiaonum = 3 --每天押镖次数
yajintong = 100000 --青铜镖车金币押金10金
yajinyin =  200000 --白银镖车金币押金20金
yajinjin =  500000 --黄金镖车金币押金50金
yuanbaoyin =   200 --白银镖车金币押金200元宝
yuanbaojin =   500 --黄金镖车金币押金500元宝

function x895108_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent( sceneId )
	AddText(sceneId,"#r#G[如有任何问题或建议请给我们提出]")
	AddNumText( sceneId, x895108_g_scriptId, "接镖", 6, 100)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x895108_OnEventRequest(sceneId,selfId,targetId,eventId)
	
	if GetNumText() == 100	then
	--SetMissionData( sceneId, selfId , MD_ZDFS_SMISS9,0)
	local oldtime =  GetMissionData( sceneId, selfId , MD_ZDFS_SMISS9)
	local oldtime1 = oldtime -(floor ( oldtime/100000))*100000
	local nowtime = GetDayTime()
	x895108_NotifyTip( sceneId, selfId, "总值："..oldtime.."现在的时间："..nowtime.."老时间："..oldtime1 )
	if nowtime > oldtime1 then
		SetMissionData( sceneId, selfId , MD_ZDFS_SMISS9, nowtime)--设定值等于现在的时间 等于是清空次数
		SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 0 )
	end	
	

	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand(sceneId,selfId, 1000) --关闭聊天框
	DispatchUICommand( sceneId, selfId,  20151024)--打开接镖界面
	end
	
end

function x895108_AskGuard( sceneId, selfId,keyid)
local nowtime = GetDayTime()	
local oldtime = GetMissionData( sceneId, selfId , MD_ZDFS_SMISS9)
local yabiaoZT= GetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 )
local oldtime1 = oldtime -(floor ( oldtime/100000))*100000
local nam  = LuaFnGetName( sceneId, selfId )
local nCount = GetMonsterCount(sceneId)
x895108_NotifyTip( sceneId, selfId, "总值"..oldtime )
local mun = floor ( oldtime/100000)
x895108_NotifyTip( sceneId, selfId, "今日次数"..mun )

for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local posX, posZ = LuaFnGetWorldPos(sceneId, nObjId);
		if  LuaFnGetName( sceneId, nObjId ) == "青铜镖车（"..nam.."）" then
			x895108_NotifyTip( sceneId, selfId, "您有一个镖车尚未交，无法接取，坐标（"..floor(posX).."，"..floor(posZ).."）。" )
			--x895108_NotifyTip( sceneId, selfId, LuaFnGetName( sceneId, nObjId ) )
		return
		end
end

if yabiaoZT >=1 then
		x895108_NotifyTip( sceneId, selfId, "您正在押送一个镖车或有一个被摧毁的镖车未交付" )
		return
end

 if mun >= yabiaonum then
		x895108_NotifyTip( sceneId, selfId, "今日次数3次" )
	return
end





local JB = GetMoney(sceneId,selfId)
local YB = YuanBao(sceneId,selfId,-1,3,0)
local myID  = LuaFnGetGUID( sceneId, selfId)
local myGuildLeagueID = floor (myID-1010000000)
if keyid == 1 then
	if JB < yajintong  then 
		x895108_NotifyTip( sceneId, selfId, "您身上的金币不足"..(yajintong/10000).."金币" )
		return
	end
	SetUnitCampID(sceneId, selfId, selfId, myGuildLeagueID  ) 
	CostMoney(sceneId,selfId,yajintong)
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 1)
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS9,oldtime+100000)--赠加一次
	local MstId = LuaFnCreateMonster(sceneId, 51003, 31, 94, 7, 0, -1 )--刷怪
	SetCharacterDieTime(sceneId, MstId, 1200000)
	SetCharacterName( sceneId, MstId,"青铜镖车（"..nam.."）")
	SetUnitCampID(sceneId,MstId, MstId,myGuildLeagueID) 
	SetPatrolId(sceneId, MstId, 0) 
end

if keyid == 2 then 	
	if JB < yajinyin or  YB < yuanbaoyin then 
		x895108_NotifyTip( sceneId, selfId, "您身上的金币不足"..(yajinyin/10000).."金币或元宝不足"..yuanbaoyin )
		return
	end
	SetUnitCampID(sceneId, selfId, selfId, myGuildLeagueID  ) 
	CostMoney(sceneId,selfId,yajinyin)
	YuanBao(sceneId,selfId,-1,2,yuanbaoyin)
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 1)
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS9,oldtime+100000)--赠加一次
	local MstId = LuaFnCreateMonster(sceneId, 51004, 31, 94, 7, 0, -1 )--刷怪
	SetCharacterDieTime(sceneId, MstId, 1200000)
	SetCharacterName( sceneId, MstId,"白银镖车（"..nam.."）")
	SetUnitCampID(sceneId,MstId, MstId,myGuildLeagueID) 
	SetPatrolId(sceneId, MstId, 0) 
end

if keyid == 3 then
	if JB < yajinjin or  YB < yuanbaojin then 
		x895108_NotifyTip( sceneId, selfId, "您身上的金币不足"..(yajinjin/10000).."金币或元宝不足"..yuanbaojin )
		return
	end
	SetUnitCampID(sceneId, selfId, selfId, myGuildLeagueID  ) 
	CostMoney(sceneId,selfId,yajinjin)
	YuanBao(sceneId,selfId,-1,2,yuanbaojin)
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS10 , 1)
	SetMissionData( sceneId, selfId , MD_ZDFS_SMISS9,oldtime+100000)--赠加一次
	local MstId = LuaFnCreateMonster(sceneId, 51005, 31, 94, 7, 0, -1 )--刷怪
	SetCharacterDieTime(sceneId, MstId, 1200000)
	SetCharacterName( sceneId, MstId,"黄金镖车（"..nam.."）")
	SetUnitCampID(sceneId,MstId, MstId,myGuildLeagueID) 
	SetPatrolId(sceneId, MstId, 0) 
end





end

function x895108_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--PDJZVMRU作式了中以我些开

--代上了要发我些展58158148
