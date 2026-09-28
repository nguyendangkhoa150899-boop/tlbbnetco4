--新的元宝商店

x888902_g_scriptId = 888902
--元宝商店列表 要与客户端界面对应（未用253，217，225）
x888902_g_shoplist = {}
x888902_g_shoplist[1]	= {241,247,253,189,237,236,235}--214, 149一定记得删掉shop中的数据				--大卖场
x888902_g_shoplist[2]	= {178,188,211,193,246}--, 188, 198, 193一定记得删掉shop中的数据			--宝石商城,添加"大理宝石斋--149",czf,2009.07.21
x888902_g_shoplist[3]	= {194, 135,152,195}			--珍兽商城
x888902_g_shoplist[4]	= {136, 137, 144}				--南北杂货
x888902_g_shoplist[5]	= {240, 120, 134, 145, 182, 181}			--形象广场
x888902_g_shoplist[6]	= {192,243,133}				--花舞人间
x888902_g_shoplist[7]	= {146, 242, 239, 238}						--武功秘籍
x888902_g_shoplist[8]	= {159, 160, 161, 162, 163}	--打造图
x888902_g_shoplist[101]	= {244,245,251}		--元宝店热卖(新品，套装，武器,坐骑，骑术)
--x888902_g_shoplist[102]	= {217,251}				--形象广场
--x888902_g_shoplist[103]	= {251}				--[还水阁]武功秘籍
--x888902_g_shoplist[104]	= {252}				--近期开放
x888902_g_shoplist[105]	= {253}				--近期开放
x888902_g_shoplist[201]	= {244,245}		--金币大卖场(新品，套装，武器,坐骑，骑术)
x888902_g_shoplist[202]	= {217,225}				--金币宝石商店
x888902_g_shoplist[203]	= {242,238,239}				--[还水阁]武功秘籍
x888902_g_shoplist[204]	= {252}				--近期开放
x888902_g_shoplist[205]	= {253}				--近期开放
x888902_g_shoplist[301]	= {252,217}		--大卖场(交子杂货)
x888902_g_shoplist[302]	= {3}				--形象广场
x888902_g_shoplist[303]	= {15,238,239}				--[还水阁]武功秘籍
x888902_g_shoplist[304]	= {16}				--近期开放
x888902_g_shoplist[305]	= {17}				--近期开放

--**********************************
-- 检查此随身NPC的功能
-- op是请求类别，比如1代表元宝相关的随身操作……
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId , shopA ,shopB )

	local bCheck = x888902_YuanbaoShopCheckOp(sceneId,selfId);
	if shopA == nil then
	return
	end
	if shopA == -96 then
	CallScriptFunction((402307), "AskGuard",sceneId,selfId,targetId,shopB)
	return
	end
	if shopA == -97 then
	CallScriptFunction((600054), "UpSuJi",sceneId,selfId,targetId,shopB)
	return
	end
	if shopA == -98 then
	CallScriptFunction((887777), "hhwfcds",sceneId,selfId,shopB)
	return
	end
	if shopA == -99 then
	x888902_sunjinum(sceneId,selfId,shopB)
	return
	end
	if  shopA == -100 then
	x888902_luenpanlijian(sceneId,selfId)
	return
	end
	if targetId == 1011 and shopA == 1011 then
	local index = GetMenPai(sceneId, selfId)
	if index == 9 then
	BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:还没有加入门派禁止打开修炼界面", 0);
	return
        end
----------------------------------------------------------------------------------------------------------------
       local i = 81
       	while HaveXinFa( sceneId, selfId, i) < 1 do
	i = i + 1
	if i > 90 then 
        break 
        end
	AddXinFa( sceneId, selfId, i)	
	end

----------------------------------------------------------------------------------------------------------------       
        --for i = 81,90 do
	--if HaveXinFa( sceneId, selfId, i) < 1 then
        --CallScriptFunction((390101), "ReturnAttr",sceneId,selfId)
        --else
        --end
        --end
-----------------------------------------------------------------------------------------------------------------
	local gongli=GetMissionData( sceneId, selfId, XIULIAN_GONGLI )
	local liliang=GetMissionData( sceneId, selfId, XIULIAN_LILIANG )
	local lingqi=GetMissionData( sceneId, selfId, XIULIAN_LINGQI )
	local tili=GetMissionData( sceneId, selfId, XIULIAN_TILI )
	local dingli=GetMissionData( sceneId, selfId, XIULIAN_DINGLI )
	local shenfa=GetMissionData( sceneId, selfId, XIULIAN_SHENFA )
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, gongli )
		UICommand_AddInt( sceneId, liliang )
		UICommand_AddInt( sceneId, lingqi )
		UICommand_AddInt( sceneId, tili )
		UICommand_AddInt( sceneId, dingli )
		UICommand_AddInt( sceneId, shenfa )
		UICommand_AddString(sceneId,"wuhu");
		EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  80111204)
		return
        end		
	if bCheck > 0 then
		if shopA > 0 and shopA < 310 and x888902_g_shoplist[shopA][shopB] ~= nil then
			--PrintStr(x888902_g_shoplist[shopA][shopB])
			if targetId == -1 then
				DispatchYuanbaoShopItem( sceneId, selfId, x888902_g_shoplist[shopA][shopB])
			else
				DispatchNpcYuanbaoShopItem( sceneId, selfId, targetId , x888902_g_shoplist[shopA][shopB])
			end
		end
	end
end
function x888902_YuanbaoShopCheckOp(sceneId,selfId)
	--地府
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:地府里不能使用随身功能", 0);
		return 0
	end
	--生死擂台
	if sceneId == 410 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:此地图里不能使用随身功能", 0);
		return 0
	end
	--少室山
	if sceneId == 530 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:此地图里不能使用随身功能", 0);
		return 0
	end
	--组队跟随
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			return 0
		end
		if teamFollowFlag ~= 0 and teamLeaderFlag ~= 1 then
			return 0
		end
	end
	--双人骑乘
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--处于双人骑乘状态，且是被动的，交给主动方来处理
			return 0
		end
	end
	--10级以上
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 10 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:此功能只有当您的等级大于等于10级的时候方可使用", 0);
		return 0
	else

		return 1
	end
	return 0
end
x888902_xiangliitme = {}
x888902_xiangliitme[1]={30600011,30600012,30600013,30600014,30600013,30600012,30600018,30600015,30600016,30600017,30600016,30600015}
x888902_xiangliitme[2]={20101000,20101001,20101002,20101003,20101004,20101005,20101006,20101007,20101008,20101009,20101010,20101011}
x888902_xiangliitme[3]={40004456,40004457,40004458,40004459,40004460,40004461,40004462,40004463,40004464,40004465,40004470,40004645}
x888902_xiangliitme[4]={40004427,40004428,40004429,40004430,40004431,40004432,40004433,40004434,40004435,40004436,40004437,40004438}
x888902_xiangliitme[5]={40004391,40004392,40004393,40004394,40004395,40004396,40004397,40004398,40004399,40004400,40004401,40004402}
x888902_xiangliitme[6]={30505113,30505114,30505115,30505116,30505117,30505118,30505119,30505120,30505121,30505122,30505123,30505124}
x888902_xiangliitme[7]={30402024,30402025,30402026,30402027,30402028,30402029,30402030,30402031,30402032,30402033,30402034,30402035}
x888902_xiangliitme[8]={20101000,20101001,20101002,20101003,20101004,20101005,20101006,20101007,20101008,20101009,20101010,20101011}
x888902_comonitmelist = {30504078,30504078,30504078,30504078,30504078,30504078,30504078,30504078}
x888902_comonitmelistnum = {1,1,1,1,1,1,1,1}
x888902_comonitmelist2 = {30504073,30504073,30504073,30504073,30504073,30504073,30504073,30504073}
x888902_comonitmelistnum2 = {0,0,2,2,3,3,4,4}
function x888902_luenpanlijian(sceneId,selfId)
local mylucky_lalue = GetMissionData(sceneId,selfId,LUCKY_VALUE)
local missmylucky_time = GetMissionData(sceneId,selfId,LUCKY_TIME)
local nowdata = LuaFnGetCurrentTime()
local xianglitabey = mod(mylucky_lalue,10)
local xiangliitem = floor(mod(missmylucky_time,1000)/10)
local iswanchenyaojian = floor(missmylucky_time/1000)

if iswanchenyaojian ~= 1 then
x888902_NotifyTip( sceneId, selfId, "您还没抽完奖，或已领取过奖励" )
return
end

if x888902_xiangliitme[xianglitabey] == nil or x888902_xiangliitme[xianglitabey][xiangliitem] == nil then
SetMissionData(sceneId,selfId,LUCKY_VALUE,0)
SetMissionData(sceneId,selfId,LUCKY_TIME,0)
x888902_NotifyTip( sceneId, selfId, "未知错误" )
return
end
if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 or LuaFnGetMaterialBagSpace(sceneId, selfId) < 1 then
x888902_NotifyTip( sceneId, selfId, "物品栏和材料栏都要留1个空格，请确认" )
return
end

SetMissionData(sceneId,selfId,LUCKY_VALUE,0)
SetMissionData(sceneId,selfId,LUCKY_TIME,0)
local bagpos01 = TryRecieveItem( sceneId, selfId, x888902_xiangliitme[xianglitabey][xiangliitem], 1 )--给予物品
local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
x888902_NotifyTip( sceneId, selfId, "恭喜您，抽到了一个#{_INFOMSG"..szItemTransfer.."}" )
x888902_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )

end
function x888902_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
	 local	playerName	= GetName( sceneId, selfId )
	 if playerName ~= nil then
     str = format(" #{_INFOUSR%s}#W参加幸运大转盘抽奖，抽到了一个#{_INFOMSG%s}", playerName ,szItemTransfer); 
	 AddGlobalCountNews( sceneId, str )
     end	
end

function x888902_sunjinum(sceneId,selfId,key)
if key == nil then
return
end
if key == 900 then
x888902_sunjinum2(sceneId,selfId)
return
end
if key < 1 or key > 8 then
return
end
if x888902_comonitmelist[key] == nil or x888902_comonitmelist2[key] == nil or x888902_comonitmelistnum[key] == nil or x888902_comonitmelistnum2[key] == nil then
return
end
if LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist[key]) < x888902_comonitmelistnum[key] and LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist2[key]) < x888902_comonitmelistnum2[key] then
x888902_NotifyTip( sceneId, selfId, "需要#{_ITEM"..x888902_comonitmelist[key].."}"..x888902_comonitmelistnum[key].."个和#{_ITEM"..x888902_comonitmelist2[key].."}"..x888902_comonitmelistnum2[key].."个" )
return
end
if LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist[key]) < x888902_comonitmelistnum[key]  then
x888902_NotifyTip( sceneId, selfId, "需要#{_ITEM"..x888902_comonitmelist[key].."}"..x888902_comonitmelistnum[key].."个" )
return
end
if  LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist2[key]) < x888902_comonitmelistnum2[key] then
x888902_NotifyTip( sceneId, selfId, "需要#{_ITEM"..x888902_comonitmelist2[key].."}"..x888902_comonitmelistnum2[key].."个" )
return
end


local mylucky_lalue = GetMissionData(sceneId,selfId,LUCKY_VALUE)
local missmylucky_time = GetMissionData(sceneId,selfId,LUCKY_TIME)
local nowdata = LuaFnGetCurrentTime()
local xianglitabey = mod(mylucky_lalue,10)
local xiangliitem = floor(mod(missmylucky_time,1000)/10)
local iswanchenyaojian = floor(missmylucky_time/1000)

if iswanchenyaojian == 1 then
x888902_NotifyTip( sceneId, selfId, "您还有奖励没领，请先领取奖励后再抽" )
return
end
local newjilu  = random(1,12)
SetMissionData(sceneId,selfId,LUCKY_VALUE,newjilu*10+key)
SetMissionData(sceneId,selfId,LUCKY_TIME,nowdata)

BeginUICommand(sceneId)
UICommand_AddInt(sceneId,newjilu);
UICommand_AddInt(sceneId,key);
UICommand_AddInt(sceneId,0);
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId,419001)

end

function x888902_sunjinum2(sceneId,selfId)

local mylucky_lalue = GetMissionData(sceneId,selfId,LUCKY_VALUE)
local missmylucky_time = GetMissionData(sceneId,selfId,LUCKY_TIME)
local nowdata = LuaFnGetCurrentTime()
local xianglitabey = mod(mylucky_lalue,10)
local xiangliitem = floor(mod(missmylucky_time,1000)/10)
local iswanchenyaojian = floor(missmylucky_time/1000)

if iswanchenyaojian == 1 then
x888902_NotifyTip( sceneId, selfId, "您还有奖励没领，抽奖失败！请先领取奖励" )
return
end
local timesa = nowdata - missmylucky_time
if timesa < 0 then
timesa = -timesa
end
if timesa > 120 then
x888902_NotifyTip( sceneId, selfId, "警告：非法抽奖，系统已自动记录下您的ID" )
return
end 

if x888902_comonitmelist[xianglitabey] == nil or x888902_comonitmelist2[xianglitabey] == nil or x888902_comonitmelistnum[xianglitabey] == nil or x888902_comonitmelistnum2[xianglitabey] == nil then
return
end
if LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist[xianglitabey]) < x888902_comonitmelistnum[xianglitabey] and LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist2[xianglitabey]) < x888902_comonitmelistnum2[xianglitabey] then
x888902_NotifyTip( sceneId, selfId, "需要#{_ITEM"..x888902_comonitmelist[xianglitabey].."}"..x888902_comonitmelistnum[xianglitabey].."个和#{_ITEM"..x888902_comonitmelist2[xianglitabey].."}"..x888902_comonitmelistnum2[xianglitabey].."个" )
return
end
if LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist[xianglitabey]) < x888902_comonitmelistnum[xianglitabey]  then
x888902_NotifyTip( sceneId, selfId, "需要#{_ITEM"..x888902_comonitmelist[xianglitabey].."}"..x888902_comonitmelistnum[xianglitabey].."个" )
return
end
if  LuaFnGetAvailableItemCount(sceneId, selfId, x888902_comonitmelist2[xianglitabey]) < x888902_comonitmelistnum2[xianglitabey] then
x888902_NotifyTip( sceneId, selfId, "需要#{_ITEM"..x888902_comonitmelist2[xianglitabey].."}"..x888902_comonitmelistnum2[xianglitabey].."个" )
return
end
local delitem = 0
if x888902_comonitmelistnum[xianglitabey] > 0 then
delitem = LuaFnDelAvailableItem(sceneId,selfId,x888902_comonitmelist[xianglitabey],x888902_comonitmelistnum[xianglitabey])
end
if x888902_comonitmelistnum2[xianglitabey] > 0 then
delitem = 0
delitem = LuaFnDelAvailableItem(sceneId,selfId,x888902_comonitmelist2[xianglitabey],x888902_comonitmelistnum2[xianglitabey])
end
if delitem < 1 then
x888902_NotifyTip( sceneId, selfId, "删除物品失败，抽奖失败" )
return
end
SetMissionData(sceneId,selfId,LUCKY_VALUE,xiangliitem*10+xianglitabey+1*1000)

end

function x888902_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end