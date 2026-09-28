--------君奉天137094888原创脚本，请尊重原创，不要私传！！！！！
--------君奉天137094888原创脚本，请尊重原创，不要私传！！！！！
--------君奉天137094888原创脚本，请尊重原创，不要私传！！！！！
x892921_g_YBItmNum ={ --------物品ID，物品价格，卖的元宝数量，折扣价，备注的物品名   可无限扩展
 
{50602005,50000,1,8.5,"6级石头"},{50602006,50000,1,7.8,"6级石头"},{50602007,50000,1,7.5,"6级石头"},{50602008,50000,1,7.3,"6级石头"},

{10157009,500000,1,8.5,"龙纹"},{50602006,50000,1,7.8,"6级石头"},{50602007,50000,1,7.5,"6级石头"},{50602008,50000,1,7.3,"6级石头"},

{50621106,50000,1,8.5,"6级冥晶石头"},{50621206,45000,1,7.8,"6级冥晶石头"},{50621306,43000,1,7.5,"6级冥晶石头"},{50621406,42000,1,7.3,"6级冥晶石头"},

{10553103,950000,1,9.5,"真重楼"},{10553104,950000,1,9.5,"真重楼"},{10553105,950000,1,9.5,"真重楼"}, 
 
{30310110,90000,1,9,"珍兽蛋：招财锦狐宝宝"},{30310111,90000,1,9,"珍兽蛋：蛋蛋鸡宝宝"},{30310112,90000,1,9,"珍兽蛋：狸美人宝宝"}, 
{20310101,20000,2,8,"重楼之泪"},{20310102,20000,2,8,"重楼之芒"},
  
}
 

x892921_g_DBItmNum ={ --------物品ID，物品价格，卖的代币数量，，备注的物品名 可无限扩展
{30700218,60,1,"击·寒冰属性书"},{30700219,60,1,"击·炽焰属性书"},{30700220,60,1,"击·苍玄属性书"},{30700221,60,1,"击·创毒属性书"},
 
{50621106,500,1,"6级冥晶石头"},{50621206,500,1,"6级冥晶石头"},{50621306,500,1,"6级冥晶石头"},{50621406,500,1,"6级冥晶石头"},
{10553112,5000,1,"重楼"},{10553113,5000,1,"重楼"},{10553114,5000,1,"重楼"},
{20310101,200,2,"重楼之泪"},{20310102,200,2,"重楼之芒"},

}
----   CallScriptFunction(892921,"GetDBNum",sceneId, killerId,1)
function x892921_GetDBNum( sceneId, selfId,intDB )
	---缥缈峰小票2个 大票3个 四绝庄1个 兵圣奇阵2个 大理刷星1个 新三环老三环1个 琅嬛福地三个
        local nearMemberCount = GetTeamMemberCount(sceneId, selfId);	
		--local nearMemberCount = GetNearTeamCount(sceneId, selfId);
        for	j = 0, nearMemberCount - 1 do
			local nearMemId = LuaFnGetTeamSceneMember(sceneId, selfId, i);
			--local nearMemId = GetNearTeamMember(sceneId, selfId, j);
			if LuaFnIsObjValid( sceneId, nearMemId ) == 1 then	
                 SetMissionData(sceneId,nearMemId,DBNUM_DATA, GetMissionData(sceneId,nearMemId,DBNUM_DATA)+intDB)
				 x892921_Tips( sceneId, nearMemId, "恭喜获得"..intDB.."个良辰粹！" )
		    end
	    end	
end	

function x892921_OPenItem( sceneId, selfId )
	if sceneId then
		return
	end	
	
	local MiBaoNum = GetMissionData(sceneId,selfId,MIBAONUM_DATA)
	local MiBaoData = floor(MiBaoNum/1000)
	local DataMiBaoNum = mod(MiBaoNum,1000)
	local NowData = GetTodayDate()
	if NowData ~=MiBaoData then
		DataMiBaoNum = 0
		SetMissionData(sceneId,selfId,MIBAONUM_DATA,NowData*1000)
	end
	
	local YBshopid = {1,2,3,4}
	local DBshopid = {1,2,3,4}
	if MiBaoNum >0 then
		DBshopid,YBshopid = x892921_ReadTxt(sceneId,selfId)
	end
	local str_1=""
	local str_2=""
	
	for i=1, 4 do
		str_2 = str_2..x892921_g_DBItmNum[DBshopid[i]][1].."*0*"..x892921_g_DBItmNum[DBshopid[i]][2].."*"..x892921_g_DBItmNum[DBshopid[i]][3].."*0-"
	end
	
	for i=1, 4 do
		str_1 = str_1..x892921_g_YBItmNum[YBshopid[i]][1].."*0*"..x892921_g_YBItmNum[YBshopid[i]][2].."*"..x892921_g_YBItmNum[YBshopid[i]][3].."*"..x892921_g_YBItmNum[YBshopid[i]][4].."*1".."-"
	end
	
	local DB_num = GetMissionData(sceneId,selfId,DBNUM_DATA)
	local MiBaoOver = GetMissionData(sceneId,selfId,MIBAOOVER_DATA)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, DataMiBaoNum )
	UICommand_AddInt( sceneId, DB_num )
	UICommand_AddInt( sceneId, MiBaoOver )
	UICommand_AddString(sceneId, str_1)
	UICommand_AddString(sceneId, str_2)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 89292101 )
	
end


function x892921_OnRefreshShopItem( sceneId, selfId )
	local MiBaoNum = GetMissionData(sceneId,selfId,MIBAONUM_DATA)
	local DataMiBaoNum = mod(MiBaoNum,1000)
	if DataMiBaoNum >=300 then
		x892921_Tips( sceneId, selfId,"您当日刷新次数已达到上限，无法再进行刷新。" )
		return
	end
	local needDB_num = 2
	local DB_num = GetMissionData(sceneId,selfId,DBNUM_DATA)
	if DB_num <needDB_num then
		x892921_Tips( sceneId, selfId,"你当前拥有良辰粹数量不足"..needDB_num.."个，无法刷新商店中出售物品。" )
		return
	end
	DB_num = DB_num-needDB_num
	SetMissionData(sceneId,selfId,DBNUM_DATA,DB_num)
	local str_1=""
	local str_2=""
	local YBtotal = getn(x892921_g_YBItmNum)
	local DBtotal = getn(x892921_g_DBItmNum)
	local inSetStr = ""
	for i=1, 4 do
		local index = random(DBtotal)
		str_2 = str_2..x892921_g_DBItmNum[index][1].."*0*"..x892921_g_DBItmNum[index][2].."*"..x892921_g_DBItmNum[index][3].."*0-"
		inSetStr=inSetStr..index.."\n"
	end
	for i=1, 4 do
		local index = random(YBtotal)
		str_1 = str_1..x892921_g_YBItmNum[index][1].."*0*"..x892921_g_YBItmNum[index][2].."*"..x892921_g_YBItmNum[index][3].."*"..x892921_g_YBItmNum[index][4].."*1".."-"
		inSetStr=inSetStr..index.."\n"
	end
	SetMissionData(sceneId,selfId,MIBAONUM_DATA,MiBaoNum+1)
	SetMissionData(sceneId,selfId,MIBAOOVER_DATA,0)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, (DataMiBaoNum+1) )
	UICommand_AddInt( sceneId, DB_num )
	UICommand_AddInt( sceneId, 0 )
	UICommand_AddString(sceneId, str_1)
	UICommand_AddString(sceneId, str_2)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 89292101 )
	x892921_SetTxt(sceneId,selfId,inSetStr)
	x892921_Tips( sceneId, selfId,"觅宝成功，觅惠坊和觅珍坊内珍品已重新刷新。" )
end


function x892921_OnCommonShopBuy( sceneId, selfId,buy_tepy,buy_id )
	if sceneId then
		return
	end	
	
	if not buy_id or buy_id <1 or buy_id>4 then
		x892921_Tips( sceneId, selfId,"#H您所购买的商品不在出售范围内，购买失败。" )
		return
	end
	
	local YBshopid = {1,2,3,4}
	local DBshopid = {1,2,3,4}
	local MiBaoNum = GetMissionData(sceneId,selfId,MIBAONUM_DATA)
	local DataMiBaoNum = mod(MiBaoNum,1000)
	if DataMiBaoNum >300 then
		x892921_Tips( sceneId, selfId,"您当日刷新次数超过上限，无法购买。" )
		return
	end
	
	if MiBaoNum >0 then
		DBshopid,YBshopid = x892921_ReadTxt(sceneId,selfId)
	end
	
	local buy_Table = {}
	local buy_index = 1
	if buy_tepy==2 then
		buy_Table =x892921_g_YBItmNum
		buy_index =YBshopid[buy_id]
	elseif buy_tepy==1 then
		buy_Table =x892921_g_DBItmNum
		buy_index =DBshopid[buy_id]
	end
	
	if  buy_Table[buy_index] ==nil then
		x892921_Tips( sceneId, selfId,"您所购买的商品不在出售范围内，购买失败。" )
		return
	end
	
	
	local buy_itemid = buy_Table[buy_index][1]
	local needyb = buy_Table[buy_index][2]
	local buy_itemNum = buy_Table[buy_index][3]
	
	if x892921_BuyOver( sceneId,selfId,buy_tepy,buy_id) ~=0 then
		x892921_Tips( sceneId, selfId,"当前商品已被购买，觅宝后若再次出现该商品，即可重新购买。" )
		return
	end
	
	if buy_tepy==2 and YuanBao(sceneId,selfId,-1,3,0) <needyb then
		x892921_Tips( sceneId, selfId,"您的元宝数不足"..needyb.."，无法完成购买" )
		return
	end
	local DB_num = GetMissionData(sceneId,selfId,DBNUM_DATA)
	if buy_tepy==1 and DB_num <needyb then
		x892921_Tips( sceneId, selfId,"您所拥有良辰萃数量不足"..needyb.."，无法完成购买" )
		return
	end
	
	if LuaFnGetPropertyBagSpace(sceneId,selfId) <1 or  LuaFnGetMaterialBagSpace(sceneId,selfId) <1 then
		x892921_Tips( sceneId, selfId,"您的道具栏和材料栏空位不足1个，无法购买。" )
		return
	end
	
	local pos= -1
	for i=1 ,buy_itemNum do
		pos = TryRecieveItem(sceneId,selfId,buy_itemid,1)
	end
	if  pos >=0 then
		local MiBaoOver = GetMissionData(sceneId,selfId,MIBAOOVER_DATA)
		if buy_tepy==1 then --DB
			local db_shuanshi = {1000,100,10,1}
			SetMissionData(sceneId,selfId,MIBAOOVER_DATA,MiBaoOver+db_shuanshi[buy_id])
			SetMissionData(sceneId,selfId,DBNUM_DATA,DB_num-needyb)
			x892921_Tips( sceneId, selfId,"您在觅珍坊中消耗"..needyb.."个良辰萃购买"..buy_itemNum.."个"..GetItemName(sceneId,buy_itemid) )
		else
			local yb_shuanshi = {10000000,1000000,100000,10000}
			SetMissionData(sceneId,selfId,MIBAOOVER_DATA,MiBaoOver+yb_shuanshi[buy_id])
			YuanBao(sceneId,selfId,-1,2,needyb)
			x892921_Tips( sceneId, selfId,"您在觅惠坊中消耗"..needyb.."元宝购买"..buy_itemNum.."个"..GetItemName(sceneId,buy_itemid) )
		end
		local wpTransfer = GetBagItemTransfer( sceneId,selfId, pos)
		local message = format("#{_INFOUSR%s}在金玉觅宝阁中豪气勃发，一掷千金购买了"..buy_itemNum.."个#{_INFOMSG%s}，真是羡煞旁人。",GetName(sceneId,selfId),wpTransfer)
		BroadMsgByChatPipe(sceneId, selfId, message, 4)
		x892921_OPenItem( sceneId, selfId )  
	else
		x892921_Tips( sceneId, selfId,"买入失败，可能是空间不足" )
	end
	
end

function x892921_BuyOver( sceneId,selfId,int_tepy,int_index) ------
	local MiBaoOver = GetMissionData(sceneId,selfId,MIBAOOVER_DATA)
	local YBOverTable ={1,1,1,1}
	local DBOverTable ={1,1,1,1}
	YBOverTable[1] = floor(MiBaoOver/10000000)
	YBOverTable[2] = floor(mod(MiBaoOver/1000000, 10))
	YBOverTable[3] = floor(mod(MiBaoOver/100000, 10))
	YBOverTable[4] = floor(mod(MiBaoOver/10000, 10))
	
	DBOverTable[1] = floor(mod(MiBaoOver/1000, 10))
	DBOverTable[2] = floor(mod(MiBaoOver/100,10))
	DBOverTable[3] = floor(mod(MiBaoOver/10,10))
	DBOverTable[4] = floor(mod(MiBaoOver,10))
	local retOver = DBOverTable[int_index]
	if int_tepy==2 then
		retOver = YBOverTable[int_index]
	end
	return retOver
end


function x892921_SetTxt(sceneId,selfId,str)
	local myGuid = LuaFnGetGUID(sceneId,selfId)
	local handle = openfile("./txt/DBShopData/"..myGuid..".txt", "wb")
	write(handle, str)
	closefile(handle)
end


function x892921_ReadTxt(sceneId,selfId)
	local myGuid = LuaFnGetGUID(sceneId,selfId)
	local handle = openfile("./txt/DBShopData/"..myGuid..".txt", "r")
	local YB_index = {1,2,3,4}
	local DB_index = {1,2,3,4}
	if nil ~= handle then
		for i=1, 4 do
			local line=read(handle, "*l")
			if line==nil then
				line = i
			end
			DB_index[i] =tonumber(line)
		end
		for i=1, 4 do
			local line=read(handle, "*l")
			if line==nil then
				line = i
			end
			YB_index[i] =tonumber(line)
		end
		closefile(handle)
	else
		handle = openfile("./txt/DBShopData/"..myGuid..".txt", "wb")
		if nil ~= handle  then
			closefile(handle)
		end
	end
	return DB_index,YB_index
end
function x892921_Tips( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--QRUAFJZBQR开代上了要发
