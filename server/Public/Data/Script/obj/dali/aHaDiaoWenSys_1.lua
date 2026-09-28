x809272_g_scriptId = 809272

--脚本号
x809272_g_DWBaseID=30110001
x809272_g_needMoeny=50000

g_DWsiachu1 = {}
g_DWsiachu1[1] = {30110001,30110002,30110003,30110004,30110005,30110006,30110007,30110008,30110009,30110010}
g_DWsiachu1[3] = {30110021,30110022,30110023,30110024,30110025,30110026,30110027,30110028,30110029,30110030}
g_DWsiachu1[4] = {30110031,30110032,30110033,30110034,30110035,30110036,30110037,30110038,30110039,30110040}
g_DWsiachu1[5] = {30110041,30110042,30110043,30110044,30110045,30110046,30110047,30110048,30110049,30110050}
g_DWsiachu1[6] = {30110051,30110052,30110053,30110054,30110055,30110056,30110057,30110058,30110059,30110060}
g_DWsiachu1[7] = {30110061,30110062,30110063,30110064,30110065,30110066,30110067,30110068,30110069,30110070}
g_DWsiachu1[8] = {30110071,30110072,30110073,30110074,30110075,30110076,30110077,30110078,30110079,30110080}

g_DWsiachu2 = {}
g_DWsiachu2[1] = {30110111,30110112,30110113,30110114,30110115,30110116,30110117,30110118,30110119,30110120}
g_DWsiachu2[2] = {30110121,30110122,30110123,30110124,30110125,30110126,30110127,30110128,30110129,30110130}
g_DWsiachu2[3] = {30110131,30110132,30110133,30110134,30110135,30110136,30110137,30110138,30110139,30110140}
g_DWsiachu2[4] = {30110141,30110142,30110143,30110144,30110145,30110146,30110147,30110148,30110149,30110150}
g_DWsiachu2[5] = {30110151,30110152,30110153,30110154,30110155,30110156,30110157,30110158,30110159,30110160}
g_DWsiachu2[6] = {30110161,30110162,30110163,30110164,30110165,30110166,30110167,30110168,30110169,30110170}
g_DWsiachu2[7] = {30110171,30110172,30110173,30110174,30110175,30110176,30110177,30110178,30110179,30110180}
g_DWsiachu2[8] = {30110181,30110182,30110183,30110184,30110185,30110186,30110187,30110188,30110189,30110190}
g_DWsiachu2[9] = {30110191,30110192,30110193,30110194,30110195,30110196,30110197,30110198,30110199,30110200}

g_DWhc={}
g_DWhc[30120001] = 30110001
g_DWhc[30120002] = 30110031
g_DWhc[30120003] = 30110021
g_DWhc[30120004] = 30110041
g_DWhc[30120005] = 30110051
g_DWhc[30120006] = 30110061
g_DWhc[30120007] = 30110071
g_DWhc[30120008] = 30110161
g_DWhc[30120009] = 30110171
g_DWhc[30120010] = 30110181
g_DWhc[30120011] = 30110191
g_DWhc[30120016] = 30110111
g_DWhc[30120012] = 30110121
g_DWhc[30120013] = 30110131
g_DWhc[30120014] = 30110141
g_DWhc[30120015] = 30110151
function x809272_DoDiaowenAction( sceneId, selfId, dwtype,arg1,arg2,arg3 )
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	if dwtype==1 then
		if EquipType == 16 or EquipType == 8 or EquipType == 10 or EquipType == 9 or EquipType == 17 then
		x809272_NotifyTip( sceneId, selfId, "暂不开放暗器,坐骑,时装,百宝箱,百宝囊雕纹" )
		return	
		
		else
		x809272_DWShike( sceneId, selfId, arg1,arg2,arg3 )		
		end
	elseif dwtype==2 then		
		if EquipType == 16 then
		x809272_DWQianghua3( sceneId, selfId, arg1,arg2 )
		else
		x809272_DWQianghua( sceneId, selfId, arg1,arg2 )
		end
	elseif dwtype==3 then		
		x809272_DWChaichu( sceneId, selfId, arg1,arg2 )
	 elseif dwtype==4 then		
		if EquipType ~= 16 then
		x809272_DWQianghua4( sceneId, selfId, arg1,arg2 )
	  else
	x809272_DWQianghua1( sceneId, selfId, arg1,arg2 )
		end
		
	elseif dwtype==5 then		
		x809272_DWChaichu1( sceneId, selfId, arg1,arg2 )
	elseif dwtype==8 then		
		x809272_DWHecheng( sceneId, selfId, arg1)
	end	
	
end
--合成

function x809272_DWHecheng( sceneId, selfId, itemPos )
	local itemTableIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemPos )
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310173) < 20 then
		x809272_NotifyTip( sceneId, selfId, "丹青少于20个，请检查。" )
		return
	end
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20502009) < 20 then
		x809272_NotifyTip( sceneId, selfId, "黄纸少于20个，请检查。" )
		return
	end
	if CostMoney(sceneId, selfId, x809272_g_needMoeny) == -1 then
		x809272_NotifyTip( sceneId, selfId, "金钱不足。" )
		return
	end
	LuaFnDelAvailableItem(sceneId,selfId,20310173,20)
	LuaFnDelAvailableItem(sceneId,selfId,20502009,20)
	if g_DWhc[itemTableIndex] == nil then
		return
	end
	LuaFnEraseItem( sceneId, selfId, itemPos )
	

	
	local bagpos01 = TryRecieveItem( sceneId, selfId, g_DWhc[itemTableIndex], 1)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，成功合成了一个"..GetItemName( sceneId,g_DWhc[itemTableIndex]) )
end

function x809272_DWQianghua3( sceneId, selfId, arg1,arg2 )
    if arg1 == nil  then
	return
	end
    local ishaveolddiaowen = x809272_ishavaolddiaowen( sceneId, selfId, arg1)
    if ishaveolddiaowen ~= -1 then
	x809272_NotifyTip( sceneId, selfId, "请先拆除旧的雕纹，否则将无法进行雕纹强化，且新雕纹无法加属性" )
	return
	end
	local needCailiao={2,9,50,87,165,284,511,888,1270}
	local itemId = x809272_axiaodwsz1(sceneId, selfId, arg1)
	local dwlevel=mod(itemId,10)
	if dwlevel==0 then
		x809272_NotifyTip( sceneId, selfId, "此装备已无法继续强化。" )
		return
	end
	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	if nItemId1<10100000 or nItemId1>12100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if dwlevel<1 then
		x809272_NotifyTip( sceneId, selfId, "滚。" )
		return
	end
	local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310167)
	local c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310168)
	if c0+c1 < needCailiao[dwlevel] then
		x809272_NotifyTip( sceneId, selfId, "金蚕丝不足，请检查需要的材料数为："..needCailiao[dwlevel] )
		return
	end
	if c1 >= needCailiao[dwlevel] then
	LuaFnDelAvailableItem(sceneId,selfId,20310168,needCailiao[dwlevel])
	else
	LuaFnDelAvailableItem(sceneId,selfId,20310168,c1)
	LuaFnDelAvailableItem(sceneId,selfId,20310167,needCailiao[dwlevel]-c1)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，强化成功！" )
	local myname, myname1 = x809272_axiaodw1(sceneId, selfId, arg1)
		dwlevel=dwlevel+1
	if dwlevel==10 then
		dwlevel=0
	end
	local name11="d9ps"..myname1..dwlevel..myname
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
end
function x809272_DWQianghua4( sceneId, selfId, arg1,arg2 )
    if arg1 == nil  then
	return
	end
 
	local needCailiao={2,9,50,87,165,284,511,888,1270}
	local itemId = x809272_axiaodwsz2(sceneId, selfId, arg1)
	local dwlevel=mod(itemId,10)
	if dwlevel==0 then
		x809272_NotifyTip( sceneId, selfId, "此装备已无法继续强化。" )
		return
	end
	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	if nItemId1<10100000 or nItemId1>15100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if dwlevel<1 then
		x809272_NotifyTip( sceneId, selfId, "滚。" )
		return
	end
	local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310167)
	local c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310168)
	if c0+c1 < needCailiao[dwlevel] then
		x809272_NotifyTip( sceneId, selfId, "金蚕丝不足，请检查需要的材料数为："..needCailiao[dwlevel] )
		return
	end
	if c1 >= needCailiao[dwlevel] then
	LuaFnDelAvailableItem(sceneId,selfId,20310168,needCailiao[dwlevel])
	else
	LuaFnDelAvailableItem(sceneId,selfId,20310168,c1)
	LuaFnDelAvailableItem(sceneId,selfId,20310167,needCailiao[dwlevel]-c1)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，强化成功！" )
	local myname, myname1 = x809272_axiaodw11(sceneId, selfId, arg1)
		dwlevel=dwlevel+1
	if dwlevel==10 then
		dwlevel=0
	end
	local name11="d9ps"..myname1..dwlevel..myname
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
end

function x809272_DWChaichu( sceneId, selfId, arg1,arg2 )
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
		if EquipType == 16 then
		x809272_NotifyTip( sceneId, selfId, "护甲雕纹不能拆除，见谅，待更新。" )
		return
	end
	
	local nItemId,_ = x809272_xuhuandiaowen(sceneId, selfId, arg1)
	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	local nItemId2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg2 )
	local dwlevel=mod((nItemId-1),10)+1;
	local index=0;
	local dwlevel3=0;
	if nItemId>=1 and nItemId<=10 then
		index=0		
	elseif nItemId>=11 and nItemId<=20 then
		index=1
	elseif nItemId>=21 and nItemId<=30 then
		index=2
	elseif nItemId>=31 and nItemId<=40 then
		index=3
	elseif nItemId>=41 and nItemId<=50 then
		index=4
	elseif nItemId>=51 and nItemId<=60 then
		index=5
	elseif nItemId>=61 and nItemId<=70 then
		index=6
	elseif nItemId>=71 and nItemId<=80 then
		index=7
	elseif nItemId>=81 and nItemId<=90 then
		index=8	
	else 
		x809272_NotifyTip( sceneId, selfId, "此装备不是雕纹过的装备,衣服雕纹不支持拆除。"..nItemId)
		return
	end

		local needMoney=5*dwlevel
		local needMoney1=50000*dwlevel
		if GetMoney(sceneId,selfId)<needMoney1 then
		x809272_NotifyTip( sceneId, selfId, "金钱不足。需要金币"..needMoney )
		return
	end
	if nItemId2 ~= 30121002 then
		x809272_NotifyTip( sceneId, selfId, "需要熔金粉。" )
		return
	end
	if nItemId1<10100000 or nItemId1>12100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if mod(nItemId,10) == 0 then
	index = floor(nItemId/10)
	end
		dwlevel3=dwlevel+index*10;
      if g_DWsiachu1[index] == nil or g_DWsiachu1[index][dwlevel] == nil then
	  x809272_NotifyTip( sceneId, selfId, index.."物品列表错误".. dwlevel )
	  return
	  end
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
		LuaFnDelAvailableItem(sceneId,selfId,30121002,1)
		AddMoney( sceneId, selfId, 0-needMoney1 );
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，拆除成功！" )
	if dwlevel>=1 and g_DWsiachu1[index][dwlevel] ~= nil then
		TryRecieveItem( sceneId, selfId, g_DWsiachu1[index][dwlevel], 1)
	end
	local myname, myname1 = x809272_axiaodw1(sceneId, selfId, arg1)
	if myname == nil then
		myname=""
	end
	local name11="d9ps".."00"..myname
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
end
function x809272_DWQianghua( sceneId, selfId, arg1,arg2 )
	local needCailiao={2,9,50,87,165,284,511,888,1270}
	local itemId = x809272_axiaodwsz1(sceneId, selfId, arg1)
	local dwlevel=mod(itemId,10)
	if dwlevel==0 then
		x809272_NotifyTip( sceneId, selfId, "此装备已无法继续强化。" )
		return
	end
	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	if nItemId1<10100000 or nItemId1>12100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if dwlevel<1 then
		x809272_NotifyTip( sceneId, selfId, "滚。" )
		return
	end
	local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310167)
	local c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310168)
	if c0+c1 < needCailiao[dwlevel] then
		x809272_NotifyTip( sceneId, selfId, "金蚕丝不足，请检查需要的材料数为："..needCailiao[dwlevel] )
		return
	end
	if c1 >= needCailiao[dwlevel] then
	LuaFnDelAvailableItem(sceneId,selfId,20310168,needCailiao[dwlevel])
	else
	LuaFnDelAvailableItem(sceneId,selfId,20310168,c1)
	LuaFnDelAvailableItem(sceneId,selfId,20310167,needCailiao[dwlevel]-c1)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，强化成功！" )
	local myname, myname1 = x809272_axiaodw1(sceneId, selfId, arg1)
		dwlevel=dwlevel+1
	if dwlevel==10 then
		dwlevel=0
	end
	local name11="d9ps"..myname1..dwlevel..myname
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
end
function x809272_axiaodw1(sceneId, selfId, arg1)
	local _, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 = ""
	local myname3 = ""
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind( myname,"d9ps")
		if sree1 == nil then
			sree1 = 0
			end
			if sree1 == 1 then
				if changdu1 == 6 then
					myname3 = strsub( myname, 5,5 )
				elseif changdu1 >= 7 then
					myname2 = strsub( myname, 7,changdu1 )
					myname3 = strsub( myname, 5,5 )
				end
			else
				myname2 = myname
			end
		end
	return myname2,myname3
end
function x809272_axiaodw2(sceneId, selfId, arg1)
	local _, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 = ""
	local myname3 = ""
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind( myname,"d9ps")
		if sree1 == nil then
			sree1 = 0
			end
			if sree1 == 1 then
				if changdu1 == 8 then
					myname3 = strsub( myname, 1,6 )
				elseif changdu1 >= 9 then
					myname2 = strsub( myname, 9,changdu1 )
					myname3 = strsub( myname, 1,6 )
				end
			else
				myname2 = myname
			end
		end
	return myname2,myname3
end

function x809272_DWShike( sceneId, selfId, arg1,arg2,arg3 )
    if arg1 == nil  then
	return
	end
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	local cailiao1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg2 )
	local cailiao2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg3 )
	local cllevel=mod(cailiao2,10);
	local index1=0
	local index2=0
	local index=0
	local index99,index999 = x809272_xuhuandiaowen(sceneId, selfId, arg1)

	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	if nItemId1<10100000 or nItemId1>15100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if index99>=1 and index999>=1 then
		x809272_NotifyTip( sceneId, selfId, "已经雕纹过的装备，无法雕纹。")
		return
	end
	if cailiao2<30110001 and cailiao2>30110200 then
		x809272_NotifyTip( sceneId, selfId, "雕纹材料不对。")
		return
	end
	if index99<=0 then
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	if EquipType==1 or EquipType==3 or EquipType==4 or EquipType==5 or EquipType==15 or EquipType==2 then
		index=1
	elseif EquipType==14 or EquipType==7 or EquipType==0 or EquipType==18 or EquipType==10 or EquipType==9 or EquipType==6 or EquipType==11 or EquipType==12 or EquipType==13 then
		index=3
	elseif EquipType==6 or EquipType==11 or EquipType==12 or EquipType==13 or EquipType==8 then
		index=2
	else 
		x809272_NotifyTip( sceneId, selfId, "暗器雕纹蚀刻请在npc上重新选择其他选项。")
		return
	end
	if cailiao2>=30110001 and cailiao2<=30110010 then
		index1=1
		index2=1
	elseif cailiao2>=30110011 and cailiao2<=30110020 then
		index1=2
		index2=2
	elseif cailiao2>=30110021 and cailiao2<=30110030 then
		index1=2
		index2=3
	elseif cailiao2>=30110031 and cailiao2<=30110040 then
		index1=2
		index2=4
	elseif cailiao2>=30110041 and cailiao2<=30110050 then
		index1=3
		index2=5
	elseif cailiao2>=30110051 and cailiao2<=30110060 then
		index1=3
		index2=6
	elseif cailiao2>=30110061 and cailiao2<=30110070 then
		index1=3
		index2=7
	elseif cailiao2>=30110071 and cailiao2<=30110080 then
		index1=3
		index2=8
	else 
		x809272_NotifyTip( sceneId, selfId, "此物品不是雕纹符。或者请按照蚀刻顺序来蚀刻雕纹"..cailiao2)
		return
	end

	if index1~=index then
		x809272_NotifyTip( sceneId, selfId, "雕纹符与装备不匹配，请详细检查。")
		return
	end
	if cailiao1~=30121001 then
		x809272_NotifyTip( sceneId, selfId, "请放入雕纹蚀刻溶剂。")
		return
	end
		cllevel=cllevel+index2*10;
	local _, name = LuaFnGetItemCreator(sceneId, selfId, arg1);
	if name == nil then
		name=""
	end
	local name9, name8 = x809272_axiaodw1(sceneId, selfId, arg1)
		local sree1 = strfind( name,"d9ps")
		if sree1 == nil then
			sree1 = 0
		end
		local name11=""
		if sree1 == 1 then
			name11="d9ps"..cllevel..name9
		else
			name11="d9ps"..cllevel.."00"..name
		end
		local cllevel2=cailiao2-30110000;
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
	LuaFnEraseItem( sceneId, selfId, arg3 )
	LuaFnDelAvailableItem(sceneId,selfId,30121001,1)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，蚀刻成功！" )
	elseif index999<=0 and index99>=1 then
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	if EquipType==1 or EquipType==3 or EquipType==4 or EquipType==5 or EquipType==15 or EquipType==2 then
		index=3
	elseif EquipType==14 or EquipType==7 or EquipType==0 or EquipType==18 or EquipType==10 or EquipType==9 then
		index=2
	elseif EquipType==6 or EquipType==11 or EquipType==12 or EquipType==13 or EquipType==8 then
		index=1
	else 
		x809272_NotifyTip( sceneId, selfId, "暗器雕纹蚀刻请在npc上重新选择其他选项。")
		return
	end
	if cailiao2>=30110111 and cailiao2<=30110120 then
		index1=1
		index2=1
	elseif cailiao2>=30110121 and cailiao2<=30110130 then
		index1=2
		index2=2
	elseif cailiao2>=30110131 and cailiao2<=30110140 then
		index1=2
		index2=3
	elseif cailiao2>=30110141 and cailiao2<=30110150 then
		index1=2
		index2=4
	elseif cailiao2>=30110151 and cailiao2<=30110160 then
		index1=2
		index2=5
	elseif cailiao2>=30110161 and cailiao2<=30110170 then
		index1=3
		index2=6
	elseif cailiao2>=30110171 and cailiao2<=30110180 then
		index1=3
		index2=7
	elseif cailiao2>=30110181 and cailiao2<=30110190 then
		index1=3
		index2=8
	elseif cailiao2>=30110191 and cailiao2<=30110200 then
		index1=3
		index2=9
	else 
		x809272_NotifyTip( sceneId, selfId, "此物品不是雕纹符。")
		return
	end

	if index1~=index then
		x809272_NotifyTip( sceneId, selfId, "雕纹符与装备不匹配，请详细检查。")
		return
	end
	if cailiao1~=30121001 then
		x809272_NotifyTip( sceneId, selfId, "请放入雕纹蚀刻溶剂。")
		return
	end
		cllevel=cllevel+index2*10;
	local name9, name8 = x809272_axiaodw2(sceneId, selfId, arg1);
	if name8 == nil then
		name8=""
	end
	if name9 == nil then
		name9=""
	end
	local cllevel2=cailiao2-30110100;
	local name11=name8..cllevel..name9
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
	LuaFnEraseItem( sceneId, selfId, arg3 )
	LuaFnDelAvailableItem(sceneId,selfId,30121001,1)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	--x809272_NotifyTip( sceneId, selfId, "恭喜你，蚀刻成功！"..cllevel2 )
	x809272_NotifyTip( sceneId, selfId, "恭喜你，蚀刻成功！" )
	else
	x809272_NotifyTip( sceneId, selfId, "有问题，请注意，建议提交gm！" )
end
end
function x809272_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x809272_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--关闭对话框
--**********************************
function x809272_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
function x809272_DWChaichu1( sceneId, selfId, arg1,arg2 )
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
		if EquipType == 16 then
		x809272_NotifyTip( sceneId, selfId, "护甲雕纹不能拆除，见谅，待更新。" )
		return
	end
	local _,nItemId = x809272_xuhuandiaowen(sceneId, selfId, arg1)
	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	local nItemId2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg2 )
	local dwlevel=mod((nItemId-1),10)+1;
	local index=0;
	local dwlevel3=0;
	if nItemId>=1 and nItemId<=10 then
		index=0
	elseif nItemId>=11 and nItemId<=20 then
		index=1
	elseif nItemId>=21 and nItemId<=30 then
		index=2
	elseif nItemId>=31 and nItemId<=40 then
		index=3
	elseif nItemId>=41 and nItemId<=50 then
		index=4
	elseif nItemId>=51 and nItemId<=60 then
		index=5
	elseif nItemId>=61 and nItemId<=70 then
		index=6
	elseif nItemId>=71 and nItemId<=80 then
		index=7
	elseif nItemId>=81 and nItemId<=90 then
		index=8
	elseif nItemId>=91 and nItemId<=100 then
		index=9
	else 
		x809272_NotifyTip( sceneId, selfId, "此装备不是雕纹装备。"..nItemId)
		return
	end
		local needMoney=5*dwlevel
		local needMoney1=50000*dwlevel
		if GetMoney(sceneId,selfId)<needMoney1 then
		x809272_NotifyTip( sceneId, selfId, "金钱不足。需要金币"..needMoney )
		return
	end
	if nItemId2 ~= 30121002 then
		x809272_NotifyTip( sceneId, selfId, "需要熔金粉。" )
		return
	end
	if nItemId1<10100000 or nItemId1>12100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if mod(nItemId,10) == 0 then
	index = floor(nItemId/10)
	end
		dwlevel3=dwlevel+index*10;
      if g_DWsiachu2[index] == nil or g_DWsiachu2[index][dwlevel] == nil then
	  x809272_NotifyTip( sceneId, selfId, index.."物品列表错误".. dwlevel )
	  return
	  end
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
		LuaFnDelAvailableItem(sceneId,selfId,30121002,1)
		AddMoney( sceneId, selfId, 0-needMoney1 );
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，拆除成功！" )
	if dwlevel>=1 and g_DWsiachu2[index][dwlevel] ~= nil then
		TryRecieveItem( sceneId, selfId, g_DWsiachu2[index][dwlevel], 1)
	end
	local myname, myname1 = x809272_axiaodw2(sceneId, selfId, arg1)
	if myname == nil then
		myname=""
	end
	if myname1 == nil then
		myname1=""
	end
	local name11=myname1.."00"..myname
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
end
function x809272_DWQianghua1( sceneId, selfId, arg1,arg2 )
    if arg1 == nil  then
	return
	end
    local ishaveolddiaowen = x809272_ishavaolddiaowen( sceneId, selfId, arg1)
    if ishaveolddiaowen ~= -1 then
	x809272_NotifyTip( sceneId, selfId, "请先拆除旧的雕纹，否则将无法进行雕纹强化，且新雕纹无法加属性" )
	return
	end
	local needCailiao={2,9,50,87,165,284,511,888,1270}
	local itemId = x809272_axiaodwsz2(sceneId, selfId, arg1)
	local dwlevel=mod(itemId,10)
	if dwlevel==0 then
		x809272_NotifyTip( sceneId, selfId, "此装备已无法继续强化。" )
		return
	end
	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	if nItemId1<10100000 or nItemId1>12100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if dwlevel<1 then
		x809272_NotifyTip( sceneId, selfId, "滚。" )
		return
	end
	local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310167)
	local c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310168)
	if c0+c1 < needCailiao[dwlevel] then
		x809272_NotifyTip( sceneId, selfId, "金蚕丝不足，请检查需要的材料数为："..needCailiao[dwlevel] )
		return
	end
	if c1 >= needCailiao[dwlevel] then
	LuaFnDelAvailableItem(sceneId,selfId,20310168,needCailiao[dwlevel])
	else
	LuaFnDelAvailableItem(sceneId,selfId,20310168,c1)
	LuaFnDelAvailableItem(sceneId,selfId,20310167,needCailiao[dwlevel]-c1)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，强化成功！" )
	local myname, myname1 = x809272_axiaodw11(sceneId, selfId, arg1)
		dwlevel=dwlevel+1
	if dwlevel==10 then
		dwlevel=0
	end
	local name11="d9ps"..myname1..dwlevel..myname
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
end
function x809272_axiaodw11(sceneId, selfId, arg1)
	local _, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 = ""
	local myname3 = ""
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind( myname,"d9ps")
		if sree1 == nil then
			sree1 = 0
			end
			if sree1 == 1 then
				if changdu1 == 8 then
					myname3 = strsub( myname, 5,7 )
				elseif changdu1 >= 8 then
					myname2 = strsub( myname, 9,changdu1 )
					myname3 = strsub( myname, 5,7 )
				end
			else
				myname2 = myname
			end
		end
	return myname2,myname3
end
function x809272_DWShike1( sceneId, selfId, arg1,arg2,arg3 )
    if arg1 == nil  then
	return
	end
    local ishaveolddiaowen = x809272_ishavaolddiaowen( sceneId, selfId, arg1)
    if ishaveolddiaowen ~= -1 then
	x809272_NotifyTip( sceneId, selfId, "请先拆除旧的雕纹，否则将无法进行雕纹蚀刻，且新雕纹无法加属性" )
	return
	end
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	local cailiao1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg2 )
	local cailiao2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg3 )
	local cllevel=mod(cailiao2,10);
	local index1=0
	local index2=0
	local index=0
	local index99=x809272_axiaodwsz1(sceneId, selfId, arg1)
	local index999=x809272_axiaodwsz2(sceneId, selfId, arg1)

	local nItemId1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1 )
	if nItemId1<10100000 or nItemId1>12100000 then
		x809272_NotifyTip( sceneId, selfId, "请放入正确装备。" )
		return
	end
	if index99>=1 and index999>=1 then
		x809272_NotifyTip( sceneId, selfId, "已经雕纹过的装备，无法雕纹。")
		return
	end
	if cailiao2<30110001 and cailiao2>30110200 then
		x809272_NotifyTip( sceneId, selfId, "雕纹材料不对。")
		return
	end
	if index99<=0 then
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	if EquipType==16 then
		index=2
	else 
		x809272_NotifyTip( sceneId, selfId, "暗器雕纹蚀刻请在npc上重新选择其他选项。")
		return
	end
	if cailiao2>=30110001 and cailiao2<=30110010 then
		index1=1
		index2=1
	elseif cailiao2>=30110011 and cailiao2<=30110020 then
		index1=2
		index2=2
	elseif cailiao2>=30110021 and cailiao2<=30110030 then
		index1=2
		index2=3
	elseif cailiao2>=30110031 and cailiao2<=30110040 then
		index1=2
		index2=4
	elseif cailiao2>=30110041 and cailiao2<=30110050 then
		index1=3
		index2=5
	elseif cailiao2>=30110051 and cailiao2<=30110060 then
		index1=3
		index2=6
	elseif cailiao2>=30110061 and cailiao2<=30110070 then
		index1=3
		index2=7
	elseif cailiao2>=30110071 and cailiao2<=30110080 then
		index1=3
		index2=8
	else 
		x809272_NotifyTip( sceneId, selfId, "此物品不是雕纹符。")
		return
	end

	if index1~=index then
		x809272_NotifyTip( sceneId, selfId, "雕纹符与装备不匹配，请详细检查。")
		return
	end
	if cailiao1~=30121001 then
		x809272_NotifyTip( sceneId, selfId, "请放入雕纹蚀刻溶剂。")
		return
	end
		cllevel=cllevel+index2*10;
	local _, name = LuaFnGetItemCreator(sceneId, selfId, arg1);
	if name == nil then
		name=""
	end
	local name9, name8 = x809272_axiaodw1(sceneId, selfId, arg1)
		local sree1 = strfind( name,"d9ps")
		if sree1 == nil then
			sree1 = 0
		end
		local name11=""
		if sree1 == 1 then
			name11="d9ps"..cllevel..name9
		else
			name11="d9ps"..cllevel.."00"..name
		end
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
	LuaFnEraseItem( sceneId, selfId, arg3 )
	LuaFnDelAvailableItem(sceneId,selfId,30121001,1)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，蚀刻成功！" )
	elseif index999<=0 and index99>=1 then
	local EquipType	= LuaFnGetBagEquipType( sceneId, selfId, arg1 )
	if EquipType==16 then
		index=1
	else 
		x809272_NotifyTip( sceneId, selfId, "暗器雕纹蚀刻请在npc上重新选择其他选项。")
		return
	end
	if cailiao2>=30110111 and cailiao2<=30110120 then
		index1=1
		index2=1
	elseif cailiao2>=30110121 and cailiao2<=30110130 then
		index1=2
		index2=2
	elseif cailiao2>=30110131 and cailiao2<=30110140 then
		index1=2
		index2=3
	elseif cailiao2>=30110141 and cailiao2<=30110150 then
		index1=2
		index2=4
	elseif cailiao2>=30110151 and cailiao2<=30110160 then
		index1=2
		index2=5
	elseif cailiao2>=30110161 and cailiao2<=30110170 then
		index1=3
		index2=6
	elseif cailiao2>=30110171 and cailiao2<=30110180 then
		index1=3
		index2=7
	elseif cailiao2>=30110181 and cailiao2<=30110190 then
		index1=3
		index2=8
	elseif cailiao2>=30110191 and cailiao2<=30110200 then
		index1=3
		index2=9
	else 
		x809272_NotifyTip( sceneId, selfId, "此物品不是雕纹符。")
		return
	end

	if index1~=index then
		x809272_NotifyTip( sceneId, selfId, "雕纹符与装备不匹配，请详细检查。")
		return
	end
	if cailiao1~=30121001 then
		x809272_NotifyTip( sceneId, selfId, "请放入雕纹蚀刻溶剂。")
		return
	end
		cllevel=cllevel+index2*10;
	local name9, name8 = x809272_axiaodw2(sceneId, selfId, arg1);
	if name8 == nil then
		name8=""
	end
	if name9 == nil then
		name9=""
	end
	local name11=name8..cllevel..name9
		LuaFnSetItemCreator( sceneId, selfId, arg1, name11 )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
	LuaFnEraseItem( sceneId, selfId, arg3 )
	LuaFnDelAvailableItem(sceneId,selfId,30121001,1)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 149, 0)
	x809272_NotifyTip( sceneId, selfId, "恭喜你，蚀刻成功！" )
	else
	x809272_NotifyTip( sceneId, selfId, "有问题，请注意，建议提交gm！" )
end
end
function x809272_axiaodwsz1(sceneId, selfId, arg1)
	local _, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 = "00"
	local myname5 = "0"
	local myname6 = "0"
	local myname3 = 0
	local myname4 = 0
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind( myname,"d9ps")
			if sree1 == nil then
				sree1 = 0
			end
			if sree1 == 1 then
				if changdu1 >= 8 then
					myname2 = strsub( myname, 5,6 )
				end
			end
	end
		myname5 = strsub( myname2, 1,1 )
		myname6 = strsub( myname2, 2,2 )
			if myname5 == "3" then
				myname3 = 3
			elseif myname5 == "4" then
				myname3 = 4
			end
			if myname6 == "1" then
				myname4 = 1
			elseif myname6 == "2" then
				myname4 = 2
			elseif myname6 == "3" then
				myname4 = 3
			elseif myname6 == "4" then
				myname4 = 4
			elseif myname6 == "5" then
				myname4 = 5
			elseif myname6 == "6" then
				myname4 = 6
			elseif myname6 == "7" then
				myname4 = 7
			elseif myname6 == "8" then
				myname4 = 8
			elseif myname6 == "9" then
				myname4 = 9
			elseif myname6 == "0" then
			if myname5 == "3" or myname5 == "4" then
				myname4 = 10
			end
			end
			myname3 = myname3*10+myname4
	return myname3
end
function x809272_axiaodwsz2(sceneId, selfId, arg1)
	local _, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
	local myname2 = "00"
	local myname5 = "0"
	local myname6 = "0"
	local myname3 = 0
	local myname4 = 0
	if(myname ~= nil) then
		local changdu1 = strlen(myname)
		local sree1 = strfind( myname,"d9ps")
			if sree1 == nil then
				sree1 = 0
			end
			if sree1 == 1 then
				if changdu1 >= 8 then
					myname2 = strsub( myname, 7,8 )
				end
			end
	end
		myname5 = strsub( myname2, 1,1 )
		myname6 = strsub( myname2, 2,2 )
			if myname5 == "1" then
				myname3 = 1
			end
			if myname6 == "1" then
				myname4 = 1
			elseif myname6 == "2" then
				myname4 = 2
			elseif myname6 == "3" then
				myname4 = 3
			elseif myname6 == "4" then
				myname4 = 4
			elseif myname6 == "5" then
				myname4 = 5
			elseif myname6 == "6" then
				myname4 = 6
			elseif myname6 == "7" then
				myname4 = 7
			elseif myname6 == "8" then
				myname4 = 8
			elseif myname6 == "9" then
				myname4 = 9
			elseif myname6 == "0" then
			if myname5 == "1" then
				myname4 = 10
			end
			end
			myname3 = myname3*10+myname4
	return myname3
end

function x809272_xuhuandiaowen(sceneId, selfId, arg1)
local _, myname = LuaFnGetItemCreator(sceneId, selfId, arg1);
if myname == nil then
return 0,0
end
local sree1,sree2,level1,level2 = strfind( myname,"d9ps(%d%d)")
if level1 == nil then
level1 = 0
end
sree1,sree2,level2 = strfind( myname,"d9ps%d%d(%d%d)")
if level2 == nil then
level2 = 0
end
return tonumber(level1),tonumber(level2)
end
