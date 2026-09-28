--江湖干坤袋 Created by Dengxx30008081
--脚本号
x300089_g_scriptId = 300089

x300089_ItemList = 30008081

x300089_GiftList = {}
x300089_GiftList[1]={{item=30008060,num=1},{item=30308021,num=1}}
x300089_GiftList[2]={{item=30008061,num=1},{item=10124153,num=1},{item=30008066,num=1}}
x300089_GiftList[3]={{item=30008062,num=1},{item=30607002,num=1},{item=31000006,num=1},{item=20309010,num=24}}
x300089_GiftList[4]={{item=30008063,num=1},{item=30008027,num=1},{item=20309018,num=32}}
x300089_GiftList[5]={{item=30008064,num=1},{item=31000005,num=1},{item=30008027,num=1}}
x300089_GiftList[6]={{item=30008065,num=1},{item=30008027,num=1},{item=20309012,num=50}}
x300089_GiftList[7]={{item=30504113,num=1},{item=30008027,num=1},{item=30504038,num=10},{item=20309012,num=8},{item=20310000,num=15}}
x300089_GiftList[8]={{item=30504114,num=1},{item=20309013,num=24},{item=20310000,num=15}}
x300089_GiftList[9]={{item=30504115,num=1}}
x300089_GiftList[10]={{item=30504116,num=1},{item=20310000,num=60}}
x300089_GiftList[11]={{item=30504117,num=1},{item=20310000,num=60}}
x300089_GiftList[12]={{item=30505192,num=1},{item=20310000,num=60}}
x300089_GiftList[13]={{item=30505192,num=1},{item=20310000,num=60}}

--这里的是要程序进行绑定的物品,必须一个一个地给,所以物品数量都是1,有多个的就写多个ID了。
x300089_BindGiftList = {}
x300089_BindGiftList[1]={}
x300089_BindGiftList[2]={}
x300089_BindGiftList[3]={}
x300089_BindGiftList[4]={}
x300089_BindGiftList[5]={}
x300089_BindGiftList[6]={}
x300089_BindGiftList[7]={30309056}
x300089_BindGiftList[8]={30504055,50313004}
x300089_BindGiftList[9]={30504055,20500001,20501001,20502001}
x300089_BindGiftList[10]={30504055,30504055,10141108}
x300089_BindGiftList[11]={30504055,30504055}
x300089_BindGiftList[12]={50313004,50313004}
x300089_BindGiftList[13]={30504055,30504055,20500001,20501001,20502001,50313004}

x300089_FreeSpaceList = {
	{4,0},  --1
	{3,0},  --2
	{3,2},  --3
	{2,2},  --4
	{3,0},  --5
	{2,3},  --6
	{5,2},  --7
	{2,4},  --8
	{2,3},  --9
	{4,2},  --10
	{4,2},  --11
	{1,4},  --12
	{3,6},  --13
	}
x300089_SheliziID = 30900058
x300089_SheliziExp = 300000
x300089_SheliziExp65 = 6558342 --65级干坤袋给的舍利子经验

--干坤袋的数量
x300089_MaxBagID = 13
--**********************************
--事件交互入口
--**********************************
function x300089_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end


function x300089_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300089_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口
--**********************************
function x300089_OnConditionCheck( sceneId, selfId )
	--校验Item是否有效
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--	--检测物品是否加锁
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	--背包中的位置
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
	x300089_MsgBox( sceneId, selfId, "#{Item_Locked}" )	--物品已加锁
		return 0
	end

	--查找列表
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	if x300089_ItemList ~= itemIndex then
		 x300089_MsgBox( sceneId, selfId, "物品列表错误")
		return 0
	end 

	--等级不够
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	if CurLevel < 10 then
		x300089_MsgBox(sceneId, selfId, "#{GMTripperObj_Resource_Info_Level_Not_Enough}")
		return 0
	end
  --道具物品栏空闲位置不够
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 14 ) then
		 x300089_MsgBox( sceneId, selfId, "请准备13个道具栏")
	   return 0
	end
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		    x300089_MsgBox( sceneId, selfId, "  你的背包材料栏没有空间了，整理留出一格后再来找我。"  )
		return 0
	end
	if GetMenPai(sceneId, selfId) ==9 then
		 x300089_MsgBox( sceneId, selfId, "请您加入门派后再来吧。"  )
		return 0	
	end	
  return 1
end
		 
--**********************************
--消耗检测及处理入口：
--**********************************
function x300089_OnDeplete( sceneId, selfId )
		if(0 < LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
	
	
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x300089_OnActivateOnce( sceneId, selfId )
	
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
  if itemIndex ==30008081 then
        local q={10553120,10553121,10553122,10553123,10553124,10553125,10553126,10553127,10553128,10553128,10553129,10553129} --火
		for i=1,12 do	
		ibagidx1 =	TryRecieveItem( sceneId, selfId, q[i], 1 )
		if ibagidx1 ~= -1 then		
		LuaFnItemBind(sceneId, selfId,ibagidx1)	
		end
		end	
  end
	x300089_yiqianaddbiaoshi( sceneId, selfId)	
	return 1;
end


function x300089_yiqianaddbiaoshi( sceneId, selfId)
local mybiaoshilist_g_Gem = 
{
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--少林0玄
{ 50321303,50302007,50303001,50304002,50313004,50314001,50311001,50312006 },--明教1火
{ 50321403,50302008,50303001,50304002,50313004,50314001,50311001,50312008 },--丐帮2毒
{ 50321203,50302006,50303001,50304002,50313004,50314001,50311001,50312005 },--武当3冰
{ 50321203,50302006,50303001,50304002,50313004,50314001,50311001,50312007 },--峨眉4冰
{ 50321403,50302008,50303001,50304002,50313004,50314001,50311001,50312008 },--星宿5毒
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--天龙6玄
{ 50321203,50302006,50303001,50304002,50313004,50314001,50311001,50312007 },--天山7冰
{ 50321303,50302007,50303001,50304002,50313004,50314001,50311001,50312006 },--逍遥8火
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--无门派9玄
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--慕容10玄
{ 50321403,50302008,50303001,50304002,50313004,50314001,50311001,50312008 },--唐门11毒
{ 50321103,50302005,50303001,50304002,50313004,50314001,50311001,50312005 },--鬼谷12玄
}
		local	tEquipGemTable	= { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 14, 15, 17, 18  } 
		local	Bore_Count			= GetBagGemCount( sceneId, selfId, 0 )
		local nLevel					= GetBagItemLevel( sceneId, selfId, 0 )
		local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		local find						= 0
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend = GetBasicBagEndPos(sceneId, selfId)		
for i=bagbegin, bagend do
local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )	
if itemIndex > 10553119 and itemIndex < 10553130 then
		
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )				
				local find = 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end
			end
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )					
					while equipMaxGemCount<3 do				
						local ret = AddBagItemSlot( sceneId, selfId, i )
						equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )			
					end
                 AddBagItemSlotFour( sceneId, selfId, i ) --4孔不放出
				end
			end
                local can = 0
                local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )
				local equipEmbededGemCount = 0
				equipMaxGemCount = 0
				if EquipType >= 0 and EquipType ~= 16 then
				-- 判断是否还可以镶嵌更多宝石
				equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )
				equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, i )
                end
				--modi:lby是否可以镶嵌
				if equipMaxGemCount > equipEmbededGemCount and equipMaxGemCount ~= 0 then
					can = 1
				end
				if can == 1 then	
					if EquipType == 0 or EquipType == 6 or EquipType == 7 or EquipType == 11 or EquipType == 12 or EquipType == 13 or EquipType == 14 or EquipType == 17 or EquipType == 18 or EquipType == 10  then

						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=1, 4 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType( sceneId, selfId, i, k )
								local Type = LuaFnGetItemType( gemEmbededIdx )
								if Type == gemType then
									-- 对比两颗宝石的类型（宝石大类）
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem( sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing( sceneId, selfId, BagIndex, i )
							end
						end
						
					elseif EquipType == 1 or EquipType == 2 or EquipType == 3 or EquipType == 4 or EquipType == 5 or EquipType == 15 or EquipType == 9   then
						local nMenpai = GetMenPai(sceneId, selfId)
						local Gem = mybiaoshilist_g_Gem[nMenpai + 1]
						local gemEmbededIdx = -1
						local gemYi = 0
						for j=5, 8 do
							local gemType = LuaFnGetItemType(Gem[j])
							for k = 0, equipMaxGemCount - 1 do
								gemEmbededIdx = GetGemEmbededType( sceneId, selfId, i, k )
								local Type = LuaFnGetItemType( gemEmbededIdx )
								if Type == gemType then
									-- 对比两颗宝石的类型（宝石大类）
									gemYi = 1
								end
							end
							if gemYi == 0 then
								local BagIndex = TryRecieveItem( sceneId, selfId, Gem[j], QUALITY_MUST_BE_CHANGE)
								GemEnchasing( sceneId, selfId, BagIndex, i )
							end
						end
				end --can == 1
end
end
end
	BeginEvent(sceneId)
		AddText(sceneId,"  #H新手装备上有3级宝石#r切勿轻易丢弃,还可摘下来再使用。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,selfId)

	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
end
--**********************************
--引导心跳处理入口：
--返回：1继续下次心跳；0：中断引导。
--**********************************
function x300089_OnActivateEachTick( sceneId, selfId)
	return 1; 
end

--**********************************
--醒目信息提示
--**********************************
function x300089_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--了中以我些开作上70370360

