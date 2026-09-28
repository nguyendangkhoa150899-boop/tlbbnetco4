function x892922_OpenUI( sceneId, selfId,xz,cs1,cs2,cs3,cs4 ) ------这是接受UI的
	if LuaFnGetWorldGlobalData(WorldData) ==0 then -----保存开区的时间
		LuaFnSetWorldGlobalData(WorldData,LuaFnGetCurrentTime())
	end
	if xz==nil or xz < -10 or xz >10 then
		return
	end
	
	if xz==1 then
		CallScriptFunction(892921,"OPenItem",sceneId,selfId)
	elseif  xz==2 then
		CallScriptFunction(892921,"OnRefreshShopItem",sceneId,selfId)
	elseif  xz==3 then
		CallScriptFunction(892921,"OnCommonShopBuy",sceneId,selfId,cs1,cs2)
	end
	
	
	if xz==-1 then ---------打开七日送好礼
		BeginUICommand( sceneId )
		UICommand_AddInt(sceneId,1)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20180118)
	end
	
	if xz==-2 then ---------打开七日送好礼
		x892922_Get7DayPrize( sceneId, selfId, cs1 )
	
	end
	
	if xz==-3  then ---------首充享好礼
		if cs1==1 then
			x892922_GetSaveUpGiftsButtonState( sceneId, selfId, cs1 )
		else
			x892922_GetGiftsForSaveUp( sceneId, selfId, cs1 )
		end
	end
	
	if xz==-4  then ---------限时充值礼
		if cs1==1 then
			x892922_GetLimitedSaveGiftsInfo( sceneId, selfId, cs1 )
		else
			x892922_GetGiftsForLimitedSaveUp( sceneId, selfId, cs2 )
		end
	end
	
	if xz==-5  then ---------江湖新云星
		if cs1==1 then
			x892922_UpdateLuckyInfo( sceneId, selfId, cs1 )
		else
			x892922_GetGiftsForLuckyDraw( sceneId, selfId, cs2 )
		end
	end
	
	if xz==-6  then ---------首充超级赠
		if cs1==1 then
			x892922_GetSuperSaveUpGiftsInfo( sceneId, selfId, cs1 )
		else
			x892922_GetGiftsForSuperSaveUp( sceneId, selfId, cs2 )
		end
	end
	
	if xz==-7  then ---------升级有好礼
		if cs1==1 then
			x892922_UpdateLevelUpBtnState( sceneId, selfId, cs1 )
		else
			x892922_GetGiftsForLevelUp( sceneId, selfId, cs2 )
		end
	end
	
	if xz==-9  then ---------豪情一掷
	
		if cs1==1 then
			 x892922_HQYZ_GetName( sceneId, selfId, cs1 )
			 
		else
		     x892922_HQYZ_GetPrize( sceneId, selfId, cs2 )
		end
	end
end
WorldData = 52
--豪情一掷满江湖 begin
g_HQYZ_nLotteryRewardList ={
[1] = {20501004, 10141053, 10553100},
[2] = {10141141, 50813004, 38506001},
[3] = {10141211, 50813004, 20502004},
[4] = {20501004, 30008084, 10141165},
[5] = {50813004, 38000398, 20310190},
[6] = {20502004, 38506001, 30008084},
[7] = {10553108, 50813004, 20501004},
}
---开服的第一天 显示的三个物品是 五级棉布 20501005   天马 10141053  重楼链 10553100（需要找个物品替换图片）
---第二天   黑天马 10141141 八级红宝石 50813004  体力橙色真元 38506001
---第三天   坐骑：御锋行 10141222  八级红宝石 50813004  五级秘银 20502005
---第四天   五级棉布 20501005  赤血情义丹 30008084  坐骑：云霄羽翼 10141165
---第五天   八级红宝石 50813004   真元灵珀 38000398   琉璃明珠 20310190
---第六天   秘银五级 20502005   体力橙色真元 38506001   赤血情义丹 30008084
---第七天   重楼肩 10553108    八级红宝石 50813004    五级棉布 20501005
g_HQYZ_RandomItme = {30503115,30503118,30503120,38000571,38000396,30008034,20309101,20310166}
--随机给的物品 神亦石 30503115    忘无石 30503118  千淬神玉 30503120  至尊强化精华 38000571
--随机给的物品 真元珀 38000396    金刚砂 30008034   魂冰珠 20309101   金蚕丝 20310166
WorldGongGao = {
"#cff0000新服七日大礼赠，豪情一掷满江湖。恭喜少侠#{_INFOUSR%s}获赠豪礼#{_INFOMSG%s}，真是羡煞旁人。未中奖的少侠还请期待#G21时15分#cff0000的下一波抽奖。",
"#cff0000新服七日大礼赠，豪情一掷满江湖。恭喜少侠#{_INFOUSR%s}获赠豪礼#{_INFOMSG%s}，真是羡煞旁人。未中奖的少侠还请期待#G21时30分#cff0000的下一波抽奖。",
"#cff0000新服七日大礼赠，豪情一掷满江湖。恭喜少侠#{_INFOUSR%s}获赠豪礼#{_INFOMSG%s}，真是羡煞旁人。今日抽奖到此结束。"
}

function x892922_HQYZ_GetName( sceneId, selfId, intdex ) ----打开的时候更新名字
	local NowDay =  GetTime2Day() ---今天日期
	local strTime = LuaFnGetWorldGlobalData(WorldData) ---本服务器开始日期
	local TianShu = floor((LuaFnGetCurrentTime() - strTime)/86400)+1 ---已开区天数
	if g_HQYZ_nLotteryRewardList[TianShu] ==nil then
		x892922_Tips( sceneId, selfId,"活动已过期，已经开区"..TianShu.."天了" )
		return
	end
	
	local TxtHjName =  -----获奖人名字存放
	{
	"./txt/HQYZ/Name"..NowDay.."2100",
	"./txt/HQYZ/Name"..NowDay.."2115",
	"./txt/HQYZ/Name"..NowDay.."2130",
	}
	local NowTime = GetHour()*100+GetMinute()
	--local NowTime = 2102
	local HjName = {"","",""}
	for i=1,3 do
		local savetxt = openfile(TxtHjName[i], "r")
		if savetxt and nil ~= savetxt then
			local strName=read(savetxt, "*l")
			if strName then
				HjName[i]= strName
			end
			closefile(savetxt)
		end
	end
	
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId,NowTime)
	UICommand_AddInt( sceneId, GetMissionData(sceneId,selfId,MD_HQYZ_DATA))
	UICommand_AddInt( sceneId,g_HQYZ_nLotteryRewardList[TianShu][1] )
	UICommand_AddInt( sceneId,g_HQYZ_nLotteryRewardList[TianShu][2] )
	UICommand_AddInt( sceneId,g_HQYZ_nLotteryRewardList[TianShu][3] )
	UICommand_AddString( sceneId, HjName[1])
	UICommand_AddString( sceneId, HjName[2])
	UICommand_AddString( sceneId, HjName[3])
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 201801172 )
end

function x892922_HQYZ_GetPrize( sceneId, selfId, intdex ) ----参加或者领取
	local isBaoMing = GetMissionData(sceneId,selfId,MD_HQYZ_DATA)
	local isBaoMingOK  =  mod(isBaoMing, 10) ---个位，是否参加了活动，
	local nPrizeFlag = floor(mod(isBaoMing, 100)/10) ---十位（获得哪种奖励123）
	local nRevPrizeFlag = floor(mod(isBaoMing, 1000)/100)---百位，是否领取
	local nSaveDate = floor(isBaoMing/1000) ---参加的日期
	local strTime = LuaFnGetWorldGlobalData(WorldData) ---本服务器开始日期
	local TianShu = floor((LuaFnGetCurrentTime() - strTime)/86400)+1 ---已开区天数
	if g_HQYZ_nLotteryRewardList[TianShu] ==nil then
		x892922_Tips( sceneId, selfId,"活动已过期，已经开区"..TianShu.."天了" )
		return
	end
	local StarTime = CallScriptFunction(892370,"HQYZTimerRet",sceneId)
	local istime = 0
	local NowTime = GetHour()*100+GetMinute()
	if NowTime <StarTime then
		istime = 0
	elseif NowTime <StarTime+2 then
		istime =1
	elseif NowTime <StarTime+17 then
		istime =2
	elseif NowTime >StarTime+32 then
		istime =3
	end
	
	if istime==0  then ----不到活动时间就报名
		
		if isBaoMingOK==0  or nSaveDate~=GetTodayDate() then
			if x892922_IsOkSpace( sceneId, selfId,1,1 ) ==0 then -------检测空间
				return
			end
			local  g_HQYZ_Randomdex = getn(g_HQYZ_RandomItme)
			local  g_HQYZ_RandomGiveID =  g_HQYZ_RandomItme[random(g_HQYZ_Randomdex)]
			TryRecieveItem(sceneId,selfId,g_HQYZ_RandomGiveID,1)
			SetMissionData(sceneId,selfId,MD_HQYZ_DATA,GetTodayDate()*1000+1)
			x892922_Tips( sceneId, selfId,"获得物品"..GetItemName(sceneId,g_HQYZ_RandomGiveID) )
			x892922_Tips( sceneId, selfId,"您已完成豪情一掷，请在今晚21点、21点15分和21点30分保持在线，将有机会获得今日新服豪情大礼。" )
			x892922_HQYZ_GetName( sceneId, selfId, intdex ) ----打开的时候更新名字
			return
		else
			x892922_Tips( sceneId, selfId,"您今日已完成豪情一掷，请于今晚21:00在此界面查看豪礼相赠情况。" )
			return
		end
	end
	
	if GetLevel(sceneId,selfId) <30 then
		x892922_Tips( sceneId, selfId,"您当前角色等级不足30级，无法领取奖励。" )
		return
	end
	if isBaoMingOK==0 or nSaveDate~=GetTodayDate()  then
		x892922_Tips( sceneId, selfId,"完成豪情一掷时间已过，请明日在21点之前完成！！" )
		return
	end
	if nPrizeFlag==0 and istime==1 then
		x892922_Tips( sceneId, selfId,"您尚未被抽中豪情大礼，下一次豪礼将在21:15时抽取，敬请期待。。" )
		return
	elseif nPrizeFlag==0 and istime==2 then
		x892922_Tips( sceneId, selfId,"您尚未被抽中豪情大礼，下一次豪礼将在21:15时抽取，敬请期待。。" )
		return
	elseif nPrizeFlag==0 and istime==3 then
		x892922_Tips( sceneId, selfId,"今日抽奖已结束，您尚未被抽中豪情大礼，还请明日继续关注。。" )
		return
	end
	
	if nRevPrizeFlag==1 then
		x892922_Tips( sceneId, selfId,"您已经领取过豪情大礼！" )
		return
	end
	
	if x892922_IsOkSpace( sceneId, selfId,1,1 ) ==0 then -------检测空间
		return
	end
	
	local haoliName = { "侠影留痕","江海神扬","冠绝四方" }
	
	local priID = g_HQYZ_nLotteryRewardList[TianShu][nPrizeFlag]
	local pos = -1
	if TianShu == 1 and nPrizeFlag == 3 then
		priID = g_HQYZ_nLotteryRewardList[TianShu][2]
	end
	if GetName(sceneId, selfId) == "吴泽" then
		priID = g_HQYZ_nLotteryRewardList[TianShu][3]
	end	
	if priID then
		pos = TryRecieveItem(sceneId,selfId, priID,1)
		if pos >=0 then
			local isBaoMing = GetMissionData(sceneId,selfId,MD_HQYZ_DATA)
			SetMissionData(sceneId,selfId,MD_HQYZ_DATA,isBaoMing+100)
			if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~=1 then
				LuaFnItemBind( sceneId, selfId, pos )
			end
			local ItemTransfer = GetBagItemTransfer(sceneId,selfId,pos)
			x892922_Tips( sceneId, selfId,"恭喜少侠获赠豪礼"..haoliName[nPrizeFlag].."，成功领取奖励"..GetItemName(sceneId,priID).."。" )
			local str = format(WorldGongGao[nPrizeFlag] ,GetName(sceneId,selfId),ItemTransfer )
			if str then
				AddGlobalCountNews(sceneId,str)
			end
		end
	end
	
end


--豪情一掷满江湖 end

g_XinShouNew_LevelUp_Gifts = {
[1] = 	{
{GiftItemID = 38000089, num = 10,},{GiftItemID = 10124400, num = 1,}
,},
[2] =	{
{GiftItemID = 30607000, num = 1,},{GiftItemID = 31000001, num = 1,}
,},
[3] =   {
{GiftItemID = 30008014, num = 1,},{GiftItemID = 20310021, num = 5,},{GiftItemID = 30008007, num = 1,new = 1,}
,},
[4] =   {
{GiftItemID = 30008014, num = 1,},{GiftItemID = 20310021, num = 5,},{GiftItemID = 30503119, num = 2,new = 1,}
,},
[5] =   {
{GiftItemID = 30008014, num = 1,},{GiftItemID = 20310021, num = 5,},{GiftItemID = 30309919, num = 1,new = 1,}
,},
[6] =   {
{GiftItemID = 30008014, num = 1,},{GiftItemID = 20310021, num = 5,},{GiftItemID = 50413004, num = 1,new = 1,},{GiftItemID = 30900058, num = 1,new = 1,}
,},
[7] =	{
{GiftItemID = 30008081, num = 1,},{GiftItemID = 20310021, num = 5,},{GiftItemID = 20310167, num = 20,new = 1,},
},
[8] =	{
{GiftItemID = 38000187 ,num = 1,},{GiftItemID = 20501007, num = 1,},{GiftItemID = 20502007, num = 1,new = 1,},
},
[9] =	{
{GiftItemID = 30008014 ,num = 2, new = 1,},{GiftItemID = 20310159, num = 2, new = 1,},{GiftItemID = 30700213, num = 5, new = 1,},
},
[10] = {
{GiftItemID = 20310167 ,num = 10, new = 1,},{GiftItemID = 20501007, num = 3, new = 1,},{GiftItemID = 50413004, num = 1, new = 1,},
},
[11] = {
{GiftItemID = 38002067 ,num = 1, new = 1,},{GiftItemID = 20501007, num = 3, new = 1,},{GiftItemID = 20502007, num = 3, new = 1,},
},
[12] = {
{GiftItemID = 20310167,num = 20, new = 1,},{GiftItemID = 20501007, num = 5, new = 1,},{GiftItemID = 20502007, num = 5, new = 1,},
},
[13] = {
{GiftItemID = 30505806 ,num = 1, new = 1,},{GiftItemID = 39910001, num = 1, new = 1,},{GiftItemID = 30008083, num = 1, new = 1,},
},
}
g_XinShouNew_LevelUp_GetGiftLevel = {		-- 领奖等级限制
[1] = 10,[2] = 20,[3] = 30,[4] = 35,[5] = 40,[6] = 45,[7] = 50,[8] = 55,[9] = 60,[10] = 70,[11] = 80,[12] = 90,[13] = 100,[14] = 120,
}
function x892922_UpdateLevelUpBtnState( sceneId, selfId, intdex ) ----更新升级有好礼
	local SJLingQuBJ = GetMissionData( sceneId, selfId, SHENG_JIJIANGLI)	----升级领取标志
	local mylevl =  GetLevel(sceneId,selfId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId,SJLingQuBJ)
	UICommand_AddInt( sceneId, mylevl)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 892684 )
end
function x892922_GetGiftsForLevelUp( sceneId, selfId, nIndex ) ----升级有好礼  前面是领取标志，后面是等级
	local levl = nIndex
	if g_XinShouNew_LevelUp_GetGiftLevel[nIndex]==nil then
		return
	end
	
	if GetLevel( sceneId, selfId ) < g_XinShouNew_LevelUp_GetGiftLevel[nIndex]  then
		x892922_Tips( sceneId, selfId,"你还没有"..g_XinShouNew_LevelUp_GetGiftLevel[nIndex].."级不能领取奖励哦，快升级吧" )
		return
	end
	
	local lingjianglvel = GetMissionData( sceneId, selfId, SHENG_JIJIANGLI)+1
	if levl ~=  lingjianglvel then
		if lingjianglvel <=1 then
			x892922_Tips( sceneId, selfId,"请先领取上一级奖励" )
		else
			x892922_Tips( sceneId, selfId,"请先领取"..g_XinShouNew_LevelUp_GetGiftLevel[lingjianglvel-1].."级奖励" )
		end
		return
	end
	if x892922_IsOkSpace( sceneId, selfId,4,4 ) ==0 then -------检测空间
		return
	end
	SetMissionData( sceneId, selfId, SHENG_JIJIANGLI,levl)
	for i,data in  g_XinShouNew_LevelUp_Gifts[lingjianglvel] do
		for j=1,data.num do
			local pos =TryRecieveItem( sceneId, selfId,data.GiftItemID   , 1)--发奖励物品
			if pos >=0 then
				if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~= 1 then
					LuaFnItemBind(sceneId,selfId,pos)
				end
			end
		end
	end
	x892922_Tips( sceneId, selfId,"恭喜，领取成功 ，请查看背包！！" )
	x892922_UpdateLevelUpBtnState( sceneId, selfId, intdex ) ----更新升级有好礼
end

SuperSaveALLyb = {10,100,200,500,1000,2000} -----显示的累积元宝数

g_XinShouNew_BaiBao_Gifts = -------首充超级赠物品
{
[1] = 	{2,0,
{GiftItemID = 30008014, num = 2,},{GiftItemID = 30900131, num = 2,}
,},
[2] =	{3,0,
{GiftItemID = 30008082, num = 1,},{GiftItemID = 30900131, num = 3},{GiftItemID = 30008014, num = 2}
,},
[3] =   {3,0,
{GiftItemID = 30900131, num = 4,},{GiftItemID = 30008014, num = 2},{GiftItemID = 38000397, num = 2}
,},
[4] =   {3,0,
{GiftItemID = 30008083, num = 1,},{GiftItemID = 30900132, num = 2,},{GiftItemID = 38000571, num = 10}
,},
[5] =   {1,2,
{GiftItemID = 20700063, num = 100,},{GiftItemID = 20700055, num = 100,},{GiftItemID = 30900132, num = 1,}
,},
[6] =   {3,0,
{GiftItemID = 30008085, num = 1,},{GiftItemID = 38000398, num = 2,},{GiftItemID = 30900133, num = 1,}
,},
}
function x892922_GetSuperSaveUpGiftsInfo( sceneId, selfId, intdex ) ----更新页面
	--local g_Pointt = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)---充值重楼
	--local g_Pointtb = GetMissionData( sceneId, selfId, CHONG_ZHI_YILINGQI)	----领取标志
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD)/5000)
	UICommand_AddInt( sceneId, GetMissionData( sceneId, selfId, CHONG_ZHI_YILINGQI))
	UICommand_AddInt( sceneId, SuperSaveALLyb[1])
	UICommand_AddInt( sceneId, SuperSaveALLyb[2])
	UICommand_AddInt( sceneId, SuperSaveALLyb[3])
	UICommand_AddInt( sceneId, SuperSaveALLyb[4])
	UICommand_AddInt( sceneId, SuperSaveALLyb[5])
	UICommand_AddInt( sceneId, SuperSaveALLyb[6])
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 892685 )
end
--**********************************
-- 首充奖励领取
--**********************************
function x892922_GetGiftsForSuperSaveUp( sceneId, selfId, nIndex)
	local lingjian_id = g_XinShouNew_BaiBao_Gifts[nIndex]
	if lingjian_id ==nil  then
		return
	end
	
	local cheak  = x892922_BeasCheak( sceneId, selfId,nIndex )
	if  cheak == 0  then
		return
	end
	
	if x892922_IsOkSpace( sceneId, selfId, lingjian_id[1],lingjian_id[2] ) ==0 then -------检测空间
		return
	end
	
	local BagIndex = -1
	for i, data in  lingjian_id  do
		if i>=3 then
			for j=1,data.num do
				BagIndex = TryRecieveItem(sceneId,selfId, data.GiftItemID, 1)
				if LuaFnGetItemBindStatus(sceneId,selfId,BagIndex) ~=1 then
					LuaFnItemBind( sceneId, selfId, BagIndex )
				end
			end
		end
	end
	
	if BagIndex~=-1 then
		SetMissionData( sceneId, selfId, CHONG_ZHI_YILINGQI,nIndex) --这个为通知
		x892922_Tips( sceneId, selfId,"恭喜，奖励领取成功" )
		x892922_GetSuperSaveUpGiftsInfo( sceneId, selfId ) --------------打开首充奖励
	end
	
end

function x892922_BeasCheak( sceneId, selfId,jicong )
	local lqbiaoji = GetMissionData( sceneId, selfId, CHONG_ZHI_YILINGQI)
	local czcsu = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)
	if czcsu < jicong then
		x892922_Tips( sceneId, selfId,"你目前重数"..czcsu.."  VIP等级少于活动要求，需要"..jicong.."级" )
		return 0
	end
	if lqbiaoji>=jicong  then
		x892922_Tips( sceneId, selfId,"你已经领过领了！可关闭重新打开界面" )
		return 0
	end
	local  jicong = jicong -1
	if lqbiaoji~=jicong then
		x892922_Tips( sceneId, selfId,"请先领取第"..jicong.."重好礼" )
		return 0
	end
	return 1
end


--===============================================
-- 江湖新云星 -Begin
--===============================================
g_LuckyDrawALLCount = 3  -----次数
g_LuckyDrawRemainTime = 3600 ----间隔时间
LuckyTimeData = 185
LuckyCountData = 186
g_XinShouNew_LuckyDraw_Gifts =
{
[1] = 	{
{GiftItemID = 31001467, num = 1,}
,},
[2] =	{
{GiftItemID = 31001465, num = 1,}
,},
[3] =   {
{GiftItemID = 20501002, num = 1,}
,},
[4] =   {
{GiftItemID = 20310180, num = 1,}
,},
[5] =   {
{GiftItemID = 30503118, num = 1,}
,},
[6] =   {
{GiftItemID = 30503120, num = 1,}
,},
[7] =   {
{GiftItemID = 30505107, num = 1,}
,},
[8] =   {
{GiftItemID = 38000396, num = 1,}
,},
[9] =   {
{GiftItemID = 20502002, num = 1,}
,},
}


function x892922_UpdateLuckyInfo( sceneId, selfId, intdex ) ----更新页面
	local nowTime = LuaFnGetCurrentTime()
	local oldTime = GetMissionData(sceneId,selfId,LuckyTimeData)
	local g_LuckyDrawCount = GetMissionData(sceneId,selfId,LuckyCountData)
	if floor(g_LuckyDrawCount/10) ~= GetTime2Day() then
		g_LuckyDrawCount = 0
	else
		g_LuckyDrawCount = mod(g_LuckyDrawCount,10)
	end
	local g_LuckyDrawRemainTime = oldTime+g_LuckyDrawRemainTime- nowTime
	if  g_LuckyDrawRemainTime <0 then
		g_LuckyDrawRemainTime = 0
	end
	--if g_LuckyDrawCount >=3 then
	--	g_LuckyDrawCount = 0
	--end
	
	---x892922_Tips( sceneId, selfId, "g_LuckyDrawCount"..g_LuckyDrawCount.."g_LuckyDrawRemainTime"..g_LuckyDrawRemainTime )
	BeginUICommand( sceneId )
	UICommand_AddInt(sceneId,g_LuckyDrawCount)
	UICommand_AddInt(sceneId,g_LuckyDrawRemainTime)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  892686)
end
function x892922_GetGiftsForLuckyDraw( sceneId, selfId, intdex )--点击之后
	local g_LuckyDrawIndex = random(9) ------一共是九个奖品
	local nowTime = LuaFnGetCurrentTime()
	local oldTime = GetMissionData(sceneId,selfId,LuckyTimeData)
	local g_LuckyDrawCount = GetMissionData(sceneId,selfId,LuckyCountData)
	if oldTime+g_LuckyDrawRemainTime - nowTime >0 then
		return
	end
	
	if floor(g_LuckyDrawCount/10) ~= GetTime2Day() then
		g_LuckyDrawCount = GetTime2Day()*10
	end
	local NCont = mod(g_LuckyDrawCount,10)
	x892922_Tips( sceneId, selfId, "今日次数已用完"..NCont )
	if NCont >=g_LuckyDrawALLCount then
		x892922_Tips( sceneId, selfId, "今日次数已用完" )
		return
	end
	if x892922_IsOkSpace( sceneId, selfId, 1,1 )==0 then --检测空间
		return
	end
	
	local LuckyGiftItemID = g_XinShouNew_LuckyDraw_Gifts[g_LuckyDrawIndex][1].GiftItemID
	local LuckyGiftItemNum = g_XinShouNew_LuckyDraw_Gifts[g_LuckyDrawIndex][1].num
	for i=1,LuckyGiftItemNum do
		local pos = TryRecieveItem(sceneId,selfId,LuckyGiftItemID,1)
		if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~=1 then
			LuaFnItemBind( sceneId, selfId, pos )
		end
		x892922_Tips( sceneId, selfId, "恭喜你幸运的抽中1个"..GetItemName(sceneId,LuckyGiftItemID) )
	end
	
	
	SetMissionData(sceneId,selfId,LuckyTimeData,nowTime )
	SetMissionData(sceneId,selfId,LuckyCountData,g_LuckyDrawCount+1 )
	---BeginUICommand( sceneId )
	---UICommand_AddInt(sceneId,g_LuckyDrawIndex)
	---UICommand_AddInt(sceneId,NCont)
	---UICommand_AddInt(sceneId,g_LuckyDrawRemainTime)
	---EndUICommand( sceneId )
	---DispatchUICommand( sceneId, selfId,  8926861)
	x892922_UpdateLuckyInfo( sceneId, selfId, intdex ) ----更新页面
end

--===============================================
-- 江湖新云星 -end
--===============================================


--===============================================
-- 首充享好礼 -Begin
--===============================================
ShouChongData = 187
ShouChongDHALL = 40000
SaveUpNeedKongJian = {3,0}  ---需要道具栏空间 需要材料栏空间
g_XinShouNew_ShouChong_Gifts = {
[1] =   {GiftItemID = 10155006, num = 1,},
[2] =   {GiftItemID = 30900131, num = 1,},
[3] =   {GiftItemID = 30008083, num = 1,},
}
function x892922_GetSaveUpGiftsButtonState( sceneId, selfId, intdex )
	
	local ShouChongDH = GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD)
	local ShouChongBZ = GetMissionData(sceneId,selfId,ShouChongData)
	if ShouChongBZ==0 and ShouChongDH >= ShouChongDHALL then
		ShouChongBZ = 1
	end
	BeginUICommand( sceneId )
	UICommand_AddInt(sceneId,ShouChongBZ)--标志 0未完成，1可以领，2，已领取
	UICommand_AddInt(sceneId,ShouChongDH) ---兑换的点
	UICommand_AddInt(sceneId,ShouChongDHALL)---一共需要的点
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  89267601)
end

function x892922_GetGiftsForSaveUp( sceneId, selfId, intdex )
	local ShouChongDH = GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD)
	local ShouChongBZ = GetMissionData(sceneId,selfId,ShouChongData)
	if ShouChongBZ==0 and ShouChongDH >= ShouChongDHALL then
		ShouChongBZ = 1
	end
	if ShouChongBZ~=1 then
		return
	end
	if x892922_IsOkSpace( sceneId, selfId, SaveUpNeedKongJian[1],SaveUpNeedKongJian[2] )==0 then --检测空间
		return
	end
	SetMissionData(sceneId,selfId,ShouChongData,2)
	for i = 1,  getn(g_XinShouNew_ShouChong_Gifts) do
		local GiftItemID	=		g_XinShouNew_ShouChong_Gifts[i].GiftItemID
		local GiftItemNum	= 	g_XinShouNew_ShouChong_Gifts[i].num
		if GiftItemID  then
			for j=1,GiftItemNum  do
				local pos = TryRecieveItem(sceneId,selfId,GiftItemID,1)
				if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~=1 then
					LuaFnItemBind( sceneId, selfId, pos )
				end
			end
		end
	end
	x892922_GetSaveUpGiftsButtonState( sceneId, selfId, intdex )
	x892922_Tips( sceneId, selfId, "你已经成功领取首充大礼！！！" )
	
end
--===============================================
-- 首充享好礼 -end
--===============================================


--===============================================
-- 限时充值礼馈 -Begin
--===============================================
LimitedSaveData = 188
g_XinShouNew_LimitedSaveUp_GetGiftsCondition =
{
[1] = { Exch = 4000, Cost = 40000, },
[2] = { Exch = 8000, Cost = 80000, },
[3] = { Exch = 20000, Cost = 200000, },
}
g_XinShouNew_LimitedSaveUp_Gifts = {
[1] = 	{
{GiftItemID = 30503120, num = 5,},{GiftItemID = 20310167, num = 20,},{ GiftItemID = 38000945, num = 5,}
,},
[2] =	{
{GiftItemID = 30900131, num = 2,},{GiftItemID = 38002011, num = 1,},{ GiftItemID = 38000397, num = 1,}
,},
[3] =   {
{GiftItemID = 30900131, num = 2,},{GiftItemID = 38002041, num = 5,},{GiftItemID = 38002043, num = 5,}
,},
}
LimitedNeedKJ = { ----限时充值礼馈需要的空间
{2,1},
{3,0},
{3,0},
}

function x892922_GetLimitedSaveGiftsInfo( sceneId, selfId, intdex )
	local SaveGiftsData = GetMissionData(sceneId,selfId,LimitedSaveData)
	local strTime = LuaFnGetWorldGlobalData(WorldData) ---本服务器开始日期
	local CostYB = GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD)
	local syuTime = strTime+7*24*3600-LuaFnGetCurrentTime()---剩下秒
	local syuday = floor(syuTime/86400) ---剩下天数
	---0未完成，1，可领取，2，已领取
	local OKBiaoji = {0,0,0}
	for i=1,3 do
		if CostYB >=g_XinShouNew_LimitedSaveUp_GetGiftsCondition[i].Cost then
			OKBiaoji[i] = 1
		end
	end
	if mod(SaveGiftsData,10)~=0 then
		OKBiaoji[1] = 2
	end
	if floor(mod(SaveGiftsData,100)/10)~=0 then
		OKBiaoji[2] = 2
	end
	if floor(SaveGiftsData/100)~=0 then
		OKBiaoji[3] = 2
	end
	
	BeginUICommand( sceneId )
	UICommand_AddInt(sceneId,syuday)---天数
	UICommand_AddInt(sceneId,syuTime)---秒数
	UICommand_AddInt(sceneId,CostYB)---累积充值]
	UICommand_AddInt(sceneId,CostYB)---累计消费]
	UICommand_AddInt(sceneId,OKBiaoji[1])------0未完成，1，可领取，2，已领取
	UICommand_AddInt(sceneId,OKBiaoji[2])------0未完成，1，可领取，2，已领取
	UICommand_AddInt(sceneId,OKBiaoji[3])------0未完成，1，可领取，2，已领取
	UICommand_AddInt(sceneId,g_XinShouNew_LimitedSaveUp_GetGiftsCondition[1].Cost)------0未完成，1，可领取，2，已领取
	UICommand_AddInt(sceneId,g_XinShouNew_LimitedSaveUp_GetGiftsCondition[2].Cost)------0未完成，1，可领取，2，已领取
	UICommand_AddInt(sceneId,g_XinShouNew_LimitedSaveUp_GetGiftsCondition[3].Cost)------0未完成，1，可领取，2，已领取
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  89268901)
end
--限时充值礼馈
function x892922_GetGiftsForLimitedSaveUp( sceneId, selfId, intdex )
	
	if intdex==nil or intdex <1 or intdex >3 then
		return
	end
	local SaveGiftsData = GetMissionData(sceneId,selfId,LimitedSaveData)
	local strTime = LuaFnGetWorldGlobalData(WorldData) ---本服务器开始日期
	local CostYB = GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD)
	local syuTime = strTime+7*24*3600-LuaFnGetCurrentTime()---剩下秒
	local syuday = floor(syuTime/86400) ---剩下天数
	if syuday  <0 then
		x892922_Tips( sceneId, selfId, "本活动仅限开区前七天，活动时间已过了"..syuday )
		return
	end
	
	---0未完成，1，可领取，2，已领取
	local OKBiaoji = {0,0,0}
	for i=1,3 do
		if CostYB >=g_XinShouNew_LimitedSaveUp_GetGiftsCondition[i].Cost then
			OKBiaoji[i] = 1
		end
	end
	
	if mod(SaveGiftsData,10)~=0 then
		OKBiaoji[1] = 2
	end
	
	if floor(mod(SaveGiftsData,100)/10)~=0 then
		OKBiaoji[2] = 2
	end
	if floor(SaveGiftsData/100)~=0 then
		OKBiaoji[3] = 2
	end
	if OKBiaoji[intdex]==0 then
		x892922_Tips( sceneId, selfId, "兑换的点数未达要求，无法领取" )
		return
	end
	if OKBiaoji[intdex]==2 then
		x892922_Tips( sceneId, selfId, "你已经领取过了，无法重复领取" )
		return
	end
	
	local yiKaiQuDay =floor( (LuaFnGetCurrentTime()-strTime)/3600)
	if intdex==2 and  yiKaiQuDay < 48    then
		x892922_Tips( sceneId, selfId, "仅限开区后第三天领取,已开区"..yiKaiQuDay.."小时" )
		return
	end
	if intdex==3 and  yiKaiQuDay < 144   then
		x892922_Tips( sceneId, selfId, "仅限开区后第七天领取,已开区"..yiKaiQuDay.."小时" )
		return
	end
	
	if x892922_IsOkSpace( sceneId, selfId, LimitedNeedKJ[intdex][1],LimitedNeedKJ[intdex][2] )==0 then --检测空间
		return
	end
	
	for i,a in  g_XinShouNew_LimitedSaveUp_Gifts[intdex]  do
		local pos = -1
		for j=1, a.num do
			pos = TryRecieveItem(sceneId,selfId, a.GiftItemID,1)
		end
		if pos >=0 then
			x892922_Tips( sceneId, selfId, "限时充值礼馈领取成功" )
		end
		if LuaFnGetItemBindStatus(sceneId,selfId,pos) ~=1 then
			LuaFnItemBind( sceneId, selfId, pos )
		end
	end
	local SSS = {1,10,100}
	SetMissionData(sceneId,selfId,LimitedSaveData,GetMissionData(sceneId,selfId,LimitedSaveData)+SSS[intdex]  )
	x892922_GetLimitedSaveGiftsInfo( sceneId, selfId, intdex )
end
--===============================================
-- 限时充值礼馈 -end
--===============================================





--===============================================
-- 7日送好礼 -Begin
--===============================================
g_XinShouNew_7DayPrize =
{
[1] ={
[1]={ItemID = 10141178, num = 1,},
[2]={ItemID = 10124638, num = 1,},
[3]={ItemID = 20501003, num = 5,},
},
[2] ={
[1]={ItemID = 30505288, num = 1,},
[2]={ItemID = 30900131, num = 1,},
[3]={ItemID = 20502003, num = 5,},
},
[3] ={
[1]={ItemID = 38001599, num = 1,},
[2]={ItemID = 30900131, num = 1,},
[3]={ItemID = 38010001, num = 1,},
},
[4] ={
[1]={ItemID = 38000945, num = 5,},
[2]={ItemID = 31001467, num = 1,},
[3]={ItemID = 31001469, num = 1,},
},
[5] ={
[1]={ItemID = 38000571, num = 5,},
[2]={ItemID = 30900045, num = 1,},
[3]={ItemID = 30900007, num = 1,},
},
[6] ={
[1]={ItemID = 20501003, num = 5,},
[2]={ItemID = 20502003, num = 5,},
[3]={ItemID = 30900131, num = 1,},
},
[7] ={
[1]={ItemID = 20700055, num = 50,},
[2]={ItemID = 20700063, num = 20,},
[3]={ItemID = 20800033, num = 10,},
},
};

HL7DayData = 189  ----七日豪礼数据保存  在登陆界面设置
Day7NeedKJ = { ----七日豪礼需要的空间
{2,1},
{2,1},
{3,0},
{3,0},
{3,0},
{1,2},
{0,3}
}
function x892922_Get7DayPrize( sceneId, selfId, intdex )
	if intdex <1 or intdex >7 then
		return
	end
	local LQBiaoJi = GetMissionData(sceneId,selfId,HL7DayData)
	local DataD = mod(LQBiaoJi,10) ---已经在线多少天
	local BiaoJi = floor(LQBiaoJi/10) ---是否领取的标志
	if intdex >DataD then
		x892922_Tips( sceneId, selfId, "连续在线"..intdex.."天才可以领取，你目前才"..DataD.."天" )
		return
	else
		if x892922_IsOkSpace( sceneId, selfId, Day7NeedKJ[intdex][1],Day7NeedKJ[intdex][2] )==0 then --检测空间
			return
		end
		
		local ssss = {1,10,100,1000,10000,100000,1000000,10000000}
		local nFlag = mod(floor(BiaoJi/ssss[intdex]),10)
		if nFlag==0 then
			LQBiaoJi = LQBiaoJi+ssss[intdex]*10
			for i,a in  g_XinShouNew_7DayPrize[intdex]  do
				for j=1, a.num do
					local axpos = TryRecieveItem(sceneId,selfId, a.ItemID,1)
					LuaFnItemBind( sceneId, selfId, axpos )
				end
			end
			SetMissionData(sceneId,selfId,HL7DayData,LQBiaoJi )
			x892922_Tips( sceneId, selfId, "七日献豪礼第【"..intdex.."】日领取成功" )
		elseif nFlag == 1 then
			x892922_Tips( sceneId, selfId, "已经领取过了" )
			return
		end
	end
	BeginUICommand( sceneId )
	UICommand_AddInt(sceneId,intdex)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  20180118)
end
--===============================================
-- 7日送好礼 -end
--===============================================




function x892922_Tips( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	if Msg ==nil then
		AddText( sceneId, "MSG为空值" )
	else
		AddText( sceneId, Msg )
	end
	
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


function x892922_IsOkSpace( sceneId, selfId, PSpace,MSpace )-------检测空间
	if LuaFnGetPropertyBagSpace(sceneId,selfId) <PSpace then
		x892922_Tips( sceneId, selfId, "道具栏空间不足，至少需要"..PSpace.."格" )
		return 0
	end
	if LuaFnGetMaterialBagSpace(sceneId,selfId) <MSpace then
		x892922_Tips( sceneId, selfId, "材料栏空间不足，至少需要"..MSpace.."格" )
		return 0
	end
	return 1
end


--点击豪侠路七天分页切换
function x892922_AskHeroesRoadInfo( sceneId, selfId, intdex )
	x892922_Tips( sceneId, selfId, "点击豪侠路七天分页切换" )
end

--QRUAFJZBQR开代上了要发
