--宝石熔炼

--脚本号
x290205_g_ScriptId	= 290205
x290205_g_NumText_Main = 1					-- 接任务的选项
x290205_g_ypgydg = {
50321001,50321002,50321003,50321004,50421001,50421002,50421003,50421004,50521001,50521002,50521003,50521004,50621001,50621002,50621003,50621004,50721001,50721002,50721003,50721004,50821001,50821002,50821003,50821004,50921001,50921002,50921003,50921004,
}
x290205_g_uttr = { 
[1]={50102005,50202005,50302005,50402005,50502005,50602005,50702005,50802005,50902005,},
[2]={50102006,50202006,50302006,50402006,50502006,50602006,50702006,50802006,50902006,},
[3]={50102007,50202007,50302007,50402007,50502007,50602007,50702007,50802007,50902007,},
[4]={50102008,50202008,50302008,50402008,50502008,50602008,50702008,50802008,50902008,},
}
x290205_g_g_XIN = {

[1]={[3]={50321101,50321102,50321103,},[4]={50421101,50421102,50421103,50421104,},[5]={50521101,50521102,50521103,50521104,50521105,},[6]={50621101,50621102,50621103,50621104,50621105,50621106,},[7]={50721101,50721102,50721103,50721104,50721105,50721106,50721107,},[8]={50821101,50821102,50821103,50821104,50821105,50821106,50821107,50821108,},[9]={50921101,50921102,50921103,50921104,50921105,50921106,50921107,50921108,50921109,},},
[2]={[3]={50321201,50321202,50321203,},[4]={50421201,50421202,50421203,50421204,},[5]={50521201,50521202,50521203,50521204,50521205,},[6]={50621201,50621202,50621203,50621204,50621205,50621206,},[7]={50721201,50721202,50721203,50721204,50721205,50721206,50721207,},[8]={50821201,50821202,50821203,50821204,50821205,50821206,50821207,50821208,},[9]={50921201,50921202,50921203,50921204,50921205,50921206,50921207,50921208,50921209,},},
[3]={[3]={50321301,50321302,50321303,},[4]={50421301,50421302,50421303,50421304,},[5]={50521301,50521302,50521303,50521304,50521305,},[6]={50621301,50621302,50621303,50621304,50621305,50621306,},[7]={50721301,50721302,50721303,50721304,50721305,50721306,50721307,},[8]={50821301,50821302,50821303,50821304,50821305,50821306,50821307,50821308,},[9]={50921301,50921302,50921303,50921304,50921305,50921306,50921307,50921308,50921309,},},
[4]={[3]={50321401,50321402,50321403,},[4]={50421401,50421402,50421403,50421404,},[5]={50521401,50521402,50521403,50521404,50521405,},[6]={50621401,50621402,50621403,50621404,50621405,50621406,},[7]={50721401,50721402,50721403,50721404,50721405,50721406,50721407,},[8]={50821401,50821402,50821403,50821404,50821405,50821406,50821407,50821408,},[9]={50921401,50921402,50921403,50921404,50921405,50921406,50921407,50921408,50921409,},},
}
x290205_g_xgbuqv = {
[1]={50321001,50421001,50521001,50621001,50721001,50821001,50921001,},
[2]={50321002,50421002,50521002,50621002,50721002,50821002,50921002,},
[3]={50321003,50421003,50521003,50621003,50721003,50821003,50921003,},
[4]={50321004,50421004,50521004,50621004,50721004,50821004,50921004,},
}
function x290205_OnDoubleGemzhuoke( sceneId, selfId, ItemIndex1, ItemIndex2, ItemIndex3, ItemIndex4, ItemIndex5, ItemIndex6)
	if not ItemIndex1 or not ItemIndex2  or not ItemIndex3  or not ItemIndex4  or not ItemIndex5  or not ItemIndex6  then
		return
	end
	

	
	-- 不允许有重复的ItemIndex1出现 added by dun.liu 2009.2.5
    if ScriptGlobal_IsUniqueNumberTable({ItemIndex1, ItemIndex2, ItemIndex3}) == 0 then
	return
	end



	local itemindex = {}
	local itemid = LuaFnGetItemTableIndexByIndex(sceneId, selfId, ItemIndex2) --获取物品ID
	local itemidmain = LuaFnGetItemTableIndexByIndex(sceneId, selfId, ItemIndex1) --获取物品ID
    local umn =  mod(itemidmain,10)
	local insx = GetItemQuality(itemidmain)
	local insxx = GetItemQuality(itemid)
	itemindex[1] = ItemIndex3
	itemindex[2] = ItemIndex4
	itemindex[3] = ItemIndex5
	itemindex[4] = ItemIndex1
	itemindex[5] = ItemIndex2
	itemindex[6] = ItemIndex6

	--是否同种类型并且等级相同的灵兽丹
	for i = 1, 3 do
		if LuaFnGetItemTableIndexByIndex(sceneId, selfId, itemindex[i]) ~= itemid then
			x290205_NotifyFailTips(sceneId, selfId, "参与琢刻的宝石种类必须相同，等级不可大于冥石。")
			return
		end
	end
	
	  if LuaFnGetItemTableIndexByIndex(sceneId, selfId,  ItemIndex6)  ~= 38000446  or  LuaFnGetAvailableItemCount(sceneId, selfId, 38000446) < 1000   then
		x290205_NotifyFailTips(sceneId, selfId, "Ch裞 n錸g n鄖 ch鷑g t鬷 t誱 kh骯 ki琺 tra")
	  return
	 end 

		            local i = 1	
                    while itemidmain ~= x290205_g_ypgydg[i] do
                    i= i+1
                    if i > getn(x290205_g_ypgydg) then
                    break
                    end
                    end

				   local j = 1	
                    while itemid ~= x290205_g_uttr[umn][j] do
                    j= j+1
                    if j > getn(x290205_g_uttr[umn]) then
                    break
                    end
                    end				
        if itemid ~= x290205_g_uttr[umn][j] or insx < insxx or itemidmain ~= x290205_g_ypgydg[i] then
		x290205_NotifyFailTips(sceneId, selfId, "只有四种宝石能够进行琢刻：纯净红晶石，纯净蓝晶石，纯净绿晶石，纯净黄晶石。")
		return
	end
        local   itemindex2 = GetBagItemTransfer( sceneId, selfId, ItemIndex2 )
        local   itemindex1 =   GetBagItemTransfer( sceneId, selfId, ItemIndex1 )
	--是否金钱足够，为0说明是没有金钱要求
	local havemoney = GetMoney(sceneId, selfId)
	local haveJiaoZi = GetMoneyJZ(sceneId, selfId)
	if havemoney+haveJiaoZi > 0 and havemoney+haveJiaoZi < 200000 then
		x290205_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_18}20个金")
		return
	end
	
	--扣除金钱，为0说明是没有金钱要求
	if havemoney+haveJiaoZi > 0 then
		local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, 200000)
		if jz == -1 then
			x290205_NotifyFailTips(sceneId, selfId, "扣除金钱失败！")
			return
		end
	end
	
	local needBind = 0
	--扣除物品
	for i = 1, 6 do
		if LuaFnGetItemBindStatus( sceneId, selfId, itemindex[i] ) == 1 then
			needBind = 1
		end
	if LuaFnEraseItem(sceneId, selfId, itemindex[i]) ~= 1 then
			x290205_NotifyFailTips(sceneId, selfId, "扣除物品失败！")
			return
		end
	end
	
	--给物品
	local BagIndex = TryRecieveItem( sceneId, selfId, x290205_g_g_XIN[umn][insx][insxx], 1 )
	if BagIndex ~= -1 then
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, BagIndex )
		end
       local bagindex = GetBagItemTransfer( sceneId, selfId, BagIndex )
		x290205_NotifyFailTips(sceneId, selfId, "恭喜你，琢刻成功！！你成功琢刻了一颗 #{_INFOMSG"..bagindex.."}")
	 	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	 	LuaFnSendAbilitySuccessMsg( sceneId, selfId, -1, -1,x290205_g_g_XIN[umn][insx][insxx] )		-- 提示生成物
	 	str = format( "#{_INFOUSR%s}#H极为小心的将四颗#{_INFOMSG%s1}#H琢刻至#{_INFOMSG%s2}#H内，光影流转中，却未曾料到这几块宝石竟然灵气相融，竟化作奇珍#{_INFOMSG%s3}#H。", GetName( sceneId, selfId), itemindex2, itemindex1, bagindex)
	    BroadMsgByChatPipe( sceneId, selfId,str, 4 )
	 	

	end
	
end
---------------分离


function x290205_OnDoubleGemfenli( sceneId, selfId, g_GemItemPos, g_fenlifuPos,uua)

    if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 30 then
	x290205_NotifyFailTips( sceneId, selfId,"Ch裞 n錸g n鄖 ch鷑g t鬷 t誱 kh骯 ki琺 tra" )
	return	
    end

    if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 30 then
	x290205_NotifyFailTips( sceneId, selfId,"Ch裞 n錸g n鄖 ch鷑g t鬷 t誱 kh骯 ki琺 tra" )
	return	
    end

	if not g_GemItemPos  or not g_fenlifuPos then
		return
	end
        if uua<101 or uua>409 then
	   return
	end

	--检测金钱是否足够....
	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --交子普及 Vega
	if PlayerMoney < 500000000000 then
		x290205_NotifyFailTips( sceneId, selfId, "Ch裞 n錸g n鄖 ch鷑g t鬷 t誱 kh骯 ki琺 tra" )
		return
	end
   jb = LuaFnCostMoneyWithPriority(sceneId, selfId, 500000)
   if jb ==-1 then
   x290205_NotifyFailTips( sceneId, selfId, "金钱不足，扣取失败。" )
   return
   end
	  if LuaFnGetItemTableIndexByIndex(sceneId, selfId,  g_fenlifuPos)  ~= 38000447  or  LuaFnGetAvailableItemCount(sceneId, selfId, 38000447) < 100   then
		x290205_NotifyFailTips(sceneId, selfId, "你的#{_ITEM38000447}不足一个")
	  return
	 end 
	local GemItemID1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, g_GemItemPos )  --b
	local insxx = GetItemQuality(GemItemID1)  --dj
	local mun  = mod(GemItemID1,10)
	local  lj = floor(uua/100)

	 local i = 1	
     while GemItemID1 ~= x290205_g_g_XIN[lj][insxx][i] do
                    i= i+1
                    if i > getn(x290205_g_g_XIN[lj][insxx]) then
                    break
                    end
                    end
                    if GemItemID1 ~= x290205_g_g_XIN[lj][insxx][i] then
                   x290205_NotifyFailTips(sceneId, selfId,"仅可对3级或3级以上的[冥晶石]进行分离" )
                    return
      end
	local needBind = 0
	if LuaFnGetItemBindStatus( sceneId, selfId, g_GemItemPos ) == 1  or LuaFnGetItemBindStatus( sceneId, selfId, g_fenlifuPos ) == 1 then
	needBind = 1
	end
	local itemindex2 = GetBagItemTransfer( sceneId, selfId, g_GemItemPos )
	if LuaFnEraseItem(sceneId, selfId, g_GemItemPos) ~= 1 or LuaFnEraseItem(sceneId, selfId, g_fenlifuPos) ~= 1 then
		x290205_NotifyFailTips(sceneId, selfId, "扣除物品失败！")
		return
	end

local BagIntem = TryRecieveItem( sceneId, selfId, 38000446, 1 )  --琢刻符	
local BagIndex = TryRecieveItem( sceneId, selfId, x290205_g_xgbuqv[lj][insxx-2], 1 )  --4
local BagIndexWT = TryRecieveItem( sceneId, selfId, x290205_g_uttr[lj][mun], 1 )  --4
local BagIndexWT = TryRecieveItem( sceneId, selfId, x290205_g_uttr[lj][mun], 1 )  --4
local BagIndexWT = TryRecieveItem( sceneId, selfId, x290205_g_uttr[lj][mun], 1 )  --4
local BagIndexWT = TryRecieveItem( sceneId, selfId, x290205_g_uttr[lj][mun], 1 )  --4
			if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, BagIntem )
			LuaFnItemBind( sceneId, selfId, BagIndex )
			LuaFnItemBind( sceneId, selfId, BagIndexWT )
		end
	local bagintem = GetBagItemTransfer( sceneId, selfId, BagIntem )
	local bagindex = GetBagItemTransfer( sceneId, selfId, BagIndex )
	local bagindestr = GetBagItemTransfer( sceneId, selfId, BagIndexWT )

str = format( "#{_INFOUSR%s}#H小心翼翼的从#{_INFOMSG%s1}#H分离出一个#{_INFOMSG%s2}#H和四颗完好无损的#{_INFOMSG%s3}#H。", GetName( sceneId, selfId), itemindex2, bagindex,bagindestr)
 BroadMsgByChatPipe( sceneId, selfId,str, 4 )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x290205_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

