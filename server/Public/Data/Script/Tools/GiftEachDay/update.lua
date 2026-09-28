--Ph¥n thß·ng m²i ngày
--Author: Sói
--25/11/2015

--********************--
x940060_g_scriptId=940060
--********************--
x940060_g_LevelUp_Gift={
	[1]={
		Item_List={10563388},
		Exp=0,
		Jiao_Zi=50000,
		Gold=0,
		YuanBao=0,
		ZengDian=0,
	},
	[10]={
		Item_List={10124034},
		Exp=1250,
		Jiao_Zi=100000,
		Gold=0,
		YuanBao=0,
		ZengDian=0,
	},
	[20]={
		Item_List={10141043,30050004},
		Exp=3700,
		Jiao_Zi=250000,
		Gold=0,
		YuanBao=0,
		ZengDian=100,
	},
	[30]={
		Item_List={},
		Exp=13500,
		Jiao_Zi=500000,
		Gold=120000,
		YuanBao=0,
		ZengDian=200,
	},
	[40]={
		Item_List={},
		Exp=25670,
		Jiao_Zi=1000000,
		Gold=200000,
		YuanBao=0,
		ZengDian=400,
	},
	[50]={
		Item_List={},
		Exp=37598,
		Jiao_Zi=1500000,
		Gold=500000,
		YuanBao=0,
		ZengDian=650,
	},
	[60]={
		Item_List={},
		Exp=124300,
		Jiao_Zi=2000000,
		Gold=750000,
		YuanBao=50,
		ZengDian=800,
	},
	[70]={
		Item_List={},
		Exp=234700,
		Jiao_Zi=2500000,
		Gold=1000000,
		YuanBao=100,
		ZengDian=1000,
	},
	[80]={
		Item_List={},
		Exp=0,
		Jiao_Zi=3500000,
		Gold=1250000,
		YuanBao=200,
		ZengDian=1300,
	},
	[90]={
		Item_List={},
		Exp=322100,
		Jiao_Zi=4000000,
		Gold=1500000,
		YuanBao=300,
		ZengDian=1500,
	},
	[100]={
		Item_List={},
		Exp=412761,
		Jiao_Zi=4500000,
		Gold=1750000,
		YuanBao=400,
		ZengDian=1700,
	},
	[110]={
		Item_List={},
		Exp=512374,
		Jiao_Zi=5000000,
		Gold=2000000,
		YuanBao=500,
		ZengDian=2000,
	},
	[120]={
		Item_List={},
		Exp=600000,
		Jiao_Zi=7500000,
		Gold=3000000,
		YuanBao=750,
		ZengDian=3000,
	},
	[130]={
		Item_List={},
		Exp=700000,
		Jiao_Zi=10000000,
		Gold=5000000,
		YuanBao=1000,
		ZengDian=5000,
	},
}
--********************--

--***********************************--
--*            On Update            *--
--***********************************--
function x940060_OnUpdate(sceneId,selfId,Request)

	--********************--
	if Request==1 then							--Ph¥n thß·ng thång c¤p
		x940060_RecieveLevelUpBonus(sceneId,selfId)
	end
	--********************--
	if Request==2 then							--Ph¥n thß·ng ð£c bi®t
		x940060_RecieveSpecialBonus(sceneId,selfId)
	end
	--********************--
	if Request==3 then							--Ph¥n thß·ng VIP
		x940060_RecieveVIPBonus(sceneId,selfId)
	end
	--********************--
	if Request==4 then							--Ph¥n thß·ng m²i ngày
		x940060_RecieveEverydayBonus(sceneId,selfId)
	end
	--********************--
	if Request==5 then							--Ph¥n thß·ng m²i tu¥n
		x940060_RecieveEveryweekBonus(sceneId,selfId)
	end
	--********************--
	
end
--***********************************--
--*     Recieve Level Up Bonus      *--
--***********************************--
function x940060_RecieveLevelUpBonus(sceneId,selfId)

	--********************--
	local Last_Level=GetMissionFlag(sceneId,selfId,MF_LEVELUP)
	local nLevel=GetLevel(sceneId,selfId)
	--********************--
	if Last_Level~=1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không có ph¥n thß·ng ð¬ nh§n!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	elseif not x940060_g_LevelUp_Gift[nLevel] then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không có ph¥n thß·ng ð¬ nh§n!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		SetMissionFlag(sceneId,selfId,MF_VIPBONUS,0)
		return
	end
	--********************--
	local nBonus=x940060_g_LevelUp_Gift[nLevel]
	--********************--
	if LuaFnGetPropertyBagSpace(sceneId,selfId)<2 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ c¥n s¡p xªp lÕi ít nh¤t 2 ô tr¯ng trong ô ÐÕo cø!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--********************--
	for i,item in nBonus.Item_List do
		TryRecieveItem(sceneId,selfId,item,1)
	end
	--********************--
	AddExp(sceneId,selfId,nBonus.Exp)
	--********************--
	AddMoneyJZ(sceneId,selfId,nBonus.Jiao_Zi)
	--********************--
	AddMoney(sceneId,selfId,nBonus.Gold)
	--********************--
	ZengDian(sceneId,selfId,targetId,1,nBonus.ZengDian)
	--********************--
	YuanBao(sceneId,selfId,targetId,1,nBonus.YuanBao)
	--********************--
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,147,0)
	--********************--
	BeginEvent(sceneId)
		AddText(sceneId,"Nh§n thß·ng thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--********************--
	SetMissionFlag(sceneId,selfId,MF_LEVELUP,0)
	--********************--
	
end
--***********************************--
--*      Recieve Special Bonus      *--
--***********************************--
function x940060_RecieveSpecialBonus(sceneId,selfId)

	--********************--
	local Last_Level=GetMissionFlag(sceneId,selfId,MF_SPECIALBONUS)
	--********************--
	if Last_Level~=1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không có ph¥n thß·ng ð¬ nh§n!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--********************--
	BeginEvent(sceneId)
		AddText(sceneId,"Nh§n thß·ng thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--********************--
	SetMissionFlag(sceneId,selfId,MF_SPECIALBONUS,0)
	--********************--
	
end
--***********************************--
--*        Recieve VIP Bonus        *--
--***********************************--
function x940060_RecieveVIPBonus(sceneId,selfId)

	--********************--
	local Last_Level=GetMissionFlag(sceneId,selfId,MF_VIPBONUS)
	--********************--
	if Last_Level~=1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không có ph¥n thß·ng ð¬ nh§n!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--********************--
	BeginEvent(sceneId)
		AddText(sceneId,"Nh§n thß·ng thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--********************--
	SetMissionFlag(sceneId,selfId,MF_VIPBONUS,0)
	--********************--
	
end
--***********************************--
--*     Recieve Everyday Bonus      *--
--***********************************--
function x940060_RecieveEverydayBonus(sceneId,selfId)

	--********************--
	local Last_Day=GetMissionData(sceneId,selfId,MD_EVERYDAYBONUS)
	--********************--
	if Last_Day==GetDayTime() then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ ðã nh§n thß·ng r°i!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--********************--
	BeginEvent(sceneId)
		AddText(sceneId,"Nh§n thß·ng thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--********************--
	SetMissionData(sceneId,selfId,MD_EVERYDAYBONUS,GetDayTime())
	--********************--
	
end
--***********************************--
--*     Recieve Everyweek Bonus     *--
--***********************************--
function x940060_RecieveEveryweekBonus(sceneId,selfId)

	--********************--
	local MD_Time=GetMissionData(sceneId,selfId,MD_EVERYWEEKBONUS)
	--********************--
	local Today_Week=GetTodayWeek()
	local Today_Month=GetTodayMonth()
	local Today_Year=GetTodayYear()
	--********************--
	while strlen(Today_Year)<4 do
		Today_Year="0"..Today_Year
	end
	--********************--
	while strlen(Today_Month)<2 do
		Today_Month="0"..Today_Month
	end
	--********************--
	while strlen(Today_Week)<1 do
		Today_Week="0"..Today_Week
	end
	--********************--
	local Today_Time=tonumber(Today_Year..Today_Month..Today_Week)
	--********************--
	if Today_Time<=MD_Time then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ ðã nh§n thß·ng r°i!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--********************--
	BeginEvent(sceneId)
		AddText(sceneId,"Nh§n thß·ng thành công!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--********************--
	SetMissionData(sceneId,selfId,MD_EVERYWEEKBONUS,Today_Time)
	--********************--
	
end