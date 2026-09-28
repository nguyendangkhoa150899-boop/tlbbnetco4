
x920032_g_ScriptId = 920032

x181000_touzi1=390 --投资1
x181000_touzi2=391 --投资2
x181000_touzi3=392 --投资3
x181000_touzi4=393 --投资4
x181000_touzi5=394 --投资5
x181000_touzi6=395 --投资6



function x920032_GetGiftsForLevelUp( sceneId, selfId, nIndex )
	local touzi1 = GetMissionData( sceneId, selfId, x181000_touzi1)
	local touzi2 = GetMissionData( sceneId, selfId, x181000_touzi2)
	local touzi3 = GetMissionData( sceneId, selfId, x181000_touzi3)
	local touzi4 = GetMissionData( sceneId, selfId, x181000_touzi4)
	local touzi5 = GetMissionData( sceneId, selfId, x181000_touzi5)
	local touzi6 = GetMissionData( sceneId, selfId, x181000_touzi6)
	local lev = GetLevel( sceneId, selfId )  --等级
	local nam = LuaFnGetName( sceneId, selfId )--玩家名字

		lingquSZ = { --领取数组
			{ID=1,BLZ=1,DJ=0,ZD=13500,},
			{ID=2,BLZ=2,DJ=30,ZD=500,},
			{ID=3,BLZ=3,DJ=40,ZD=750,},
			{ID=4,BLZ=4,DJ=50,ZD=1000,},
			{ID=5,BLZ=5,DJ=60,ZD=1500,},
			{ID=6,BLZ=6,DJ=70,ZD=1750,},
			{ID=7,BLZ=7,DJ=80,ZD=2000,},
			{ID=8,BLZ=8,DJ=85,ZD=2500,},
			{ID=9,BLZ=9,DJ=90,ZD=3000,},
			{ID=10,BLZ=10,DJ=95,ZD=3500,},
			{ID=11,BLZ=11,DJ=100,ZD=5000,},
			{ID=12,BLZ=12,DJ=105,ZD=8000,},
			{ID=13,BLZ=13,DJ=110,ZD=12000,},
			{ID=14,BLZ=14,DJ=115,ZD=20000,},
		}
	
	jinruID = floor(nIndex/100)*100 --取于后*b为整数 --传过来的ID +值
	nIndex1 = nIndex - jinruID
	
	gengxinSZ = {
			{IDID=0,FB=1,GG=5,BJ=x181000_touzi1,TB = 2,},
			{IDID=100,FB=2,GG=5*2,BJ=x181000_touzi2,TB = 3,},
			{IDID=200,FB=2*2,GG=5*2*2,BJ=x181000_touzi3,TB = 4,},
			{IDID=300,FB=2*2*2,GG=5*2*2*2,BJ=x181000_touzi4,TB = 5,},
			{IDID=400,FB=2*2*2*2,GG=5*2*2*2*2,BJ=x181000_touzi5,TB = 6,},
			{IDID=500,FB=2*2*2*2*2,GG=5*2*2*2*2*2,BJ=x181000_touzi6,TB = 7,},
			
		}
		for	i, y in gengxinSZ do
			if jinruID == y.IDID then
				biaoji =y.BJ
				YuanBaoFB =y.FB
				licaiNW = y.GG
				kehuduanTB=y.TB
			end
		end
		
		--x920032_Tips( sceneId, selfId,nIndex1 )
	
	if nIndex >=1001 and nIndex <=1100 then
		
		Level	= GetLevel( sceneId, selfId )--当前等级
		if Level > 100 then
				x920032_Tips( sceneId, selfId,"亲，您的等级已超过“100”级，不能购买理财了哦。" )
			return
		end
		
		touziSZ = { --投资数组
			{ID=1001 ,BL=x181000_touzi1,YB=50000,HY=1},
			{ID=1002 ,BL=x181000_touzi2,YB=100000,HY=2},
			{ID=1003 ,BL=x181000_touzi3,YB=200000,HY=3},
			{ID=1004 ,BL=x181000_touzi4,YB=400000,HY=4},
			{ID=1005 ,BL=x181000_touzi5,YB=800000,HY=5},
			{ID=1006 ,BL=x181000_touzi6,YB=1600000,HY=6},
		}
		for	i, m in touziSZ do
			if nIndex == m.ID then
				if GetMissionData( sceneId, selfId, m.BL) >=1 then
					x920032_Tips( sceneId, selfId,"已购买过此项理财了。" )
					return
				end
				if nIndex ~= touziSZ[1].ID then
					if GetMissionData( sceneId, selfId, touziSZ[i-1].BL) < 1 then  --是否买了上一级理财
						x920032_Tips( sceneId, selfId,"您必须先购买"..touziSZ[i-1].YB.."元宝的理财。" )
						return
					end
				end

				if GetMissionData(sceneId, selfId,CHONG_ZHI_CHONGSHU) < m.HY then  --判断vip等级
					x920032_Tips( sceneId, selfId, "理财计划仅对VIP玩家开放" )
					x920032_Tips( sceneId, selfId, "    您当前VIP等级不足"..m.HY.."级，无法购买此项理财。" )
					return
				end

				if YuanBao(sceneId,selfId,targetId,2,m.YB) == -1 then  --这句直接删除增，一定要放在检测的最后一项，否则删了增点买不到理财
					x920032_Tips( sceneId, selfId, "您当前元宝不足"..m.YB.."，无法购买理财。" )
					return
				end

				SetMissionData( sceneId, selfId, m.BL,1) --已投资标记
				gonggao = "#I[投资理财]：#cFF0000恭喜玩家#W"..nam.."#cFF0000成功购买了#G"..m.YB.."元宝#cFF0000理财，随着等级的提升他将会获得#G150％#cFF0000的元宝返利。"
				BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
				x920032_Tips( sceneId, selfId,gonggao )
				x920032_GetGiftsForLevel(sceneId, selfId,1) --同步客户端
			end
		end
		return
	end

	
	if nIndex >=1 and nIndex <=100 then
		for	i, m in lingquSZ do
			if nIndex1 == m.ID then
				if GetMissionData( sceneId, selfId, biaoji) < m.BLZ then
						x920032_Tips( sceneId, selfId,"请先领取"..lingquSZ[i-1].DJ.."级元宝返利。" )
					return
				end
				if GetMissionData( sceneId, selfId, biaoji) == m.BLZ then
					if lev < m.DJ then
						x920032_Tips( sceneId, selfId,"当前等级不足"..m.DJ.."级，无法领取…" )
						return
					end
					SetMissionData( sceneId, selfId, biaoji,m.BLZ+1) --已投资标记
					YuanBao(sceneId,selfId,targetId,1,m.ZD*YuanBaoFB)	--加元宝
					gonggao = "#G["..licaiNW.."万理财]：#P恭喜玩家#W"..nam.."#P成功领取了#G"..m.DJ.."级#P投资返利，获得了#G"..(m.ZD*YuanBaoFB).."#P点元宝。"
					BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
					x920032_Tips( sceneId, selfId,gonggao )
					x920032_GetGiftsForLevel(sceneId, selfId,kehuduanTB) --同步客户端
					
				else
					x920032_Tips( sceneId, selfId,"当前返利已领取过了。" )
				end
			end
		end
		return
	end

	if nIndex >=101 and nIndex <=200 then
		for	i, m in lingquSZ do
			if nIndex1 == m.ID then
				if GetMissionData( sceneId, selfId, biaoji) > m.BLZ then
					x920032_Tips( sceneId, selfId,"当前返利已领取过了。" )
					return
				end
				if GetMissionData( sceneId, selfId, biaoji) < m.BLZ then
					x920032_Tips( sceneId, selfId,"请先领取"..lingquSZ[i-1].DJ.."级元宝返利。" )
					return
				end
				if lev < m.DJ then
					x920032_Tips( sceneId, selfId,"当前等级不足"..m.DJ.."级，无法领取…".."级，无法领取…" )
					return
				end
				SetMissionData( sceneId, selfId, biaoji,m.BLZ+1) --已投资标记
				YuanBao(sceneId,selfId,targetId,1,m.ZD*YuanBaoFB)	--加元宝
				gonggao = "#G["..licaiNW.."万理财]：#P恭喜玩家#W"..nam.."#P成功领取了#G"..m.DJ.."级#P投资返利，获得了#G"..(m.ZD*YuanBaoFB).."#P点元宝。"
				BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
				x920032_Tips( sceneId, selfId,gonggao )
				x920032_GetGiftsForLevel(sceneId, selfId,kehuduanTB) --同步客户端
			end
		end
		return
	end
	if nIndex >=201 and nIndex <=300 then
		for	i, m in lingquSZ do
			if nIndex1 == m.ID then
				if GetMissionData( sceneId, selfId, biaoji) > m.BLZ then
					x920032_Tips( sceneId, selfId,"当前返利已领取过了。" )
					return
				end
				if GetMissionData( sceneId, selfId, biaoji) < m.BLZ then
					x920032_Tips( sceneId, selfId,"请先领取"..lingquSZ[i-1].DJ.."级元宝返利。" )
					return
				end
				if lev < m.DJ then
					x920032_Tips( sceneId, selfId,"当前等级不足"..m.DJ.."级，无法领取…" )
					return
				end
				SetMissionData( sceneId, selfId, biaoji,m.BLZ+1) --已投资标记
				YuanBao(sceneId,selfId,targetId,1,m.ZD*YuanBaoFB)	--加元宝
				gonggao = "#G["..licaiNW.."万理财]：#P恭喜玩家#W"..nam.."#P成功领取了#G"..m.DJ.."级#P投资返利，获得了#G"..(m.ZD*YuanBaoFB).."#P点元宝。"
				BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
				x920032_Tips( sceneId, selfId,gonggao )
				x920032_GetGiftsForLevel(sceneId, selfId,kehuduanTB) --同步客户端
			end
		end
		return
	end
	if nIndex >=301 and nIndex <=400 then
		for	i, m in lingquSZ do
			if nIndex1 == m.ID then
				if GetMissionData( sceneId, selfId, biaoji) > m.BLZ then
					x920032_Tips( sceneId, selfId,"当前返利已领取过了。" )
					return
				end
				if GetMissionData( sceneId, selfId, biaoji) < m.BLZ then
					x920032_Tips( sceneId, selfId,"请先领取"..lingquSZ[i-1].DJ.."级元宝返利。" )
					return
				end
				if lev < m.DJ then
					x920032_Tips( sceneId, selfId,"当前等级不足"..m.DJ.."级，无法领取…" )
					return
				end
				SetMissionData( sceneId, selfId, biaoji,m.BLZ+1) --已投资标记
				YuanBao(sceneId,selfId,targetId,1,m.ZD*YuanBaoFB)	--加元宝
				gonggao = "#G["..licaiNW.."万理财]：#P恭喜玩家#W"..nam.."#P成功领取了#G"..m.DJ.."级#P投资返利，获得了#G"..(m.ZD*YuanBaoFB).."#P点元宝。"
				BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
				x920032_Tips( sceneId, selfId,gonggao )
				x920032_GetGiftsForLevel(sceneId, selfId,kehuduanTB) --同步客户端
			end
		end
		return
	end
	if nIndex >=401 and nIndex <=500 then
		for	i, m in lingquSZ do
			if nIndex1 == m.ID then
				if GetMissionData( sceneId, selfId, biaoji) > m.BLZ then
					x920032_Tips( sceneId, selfId,"当前返利已领取过了。" )
					return
				end
				if GetMissionData( sceneId, selfId, biaoji) < m.BLZ then
					x920032_Tips( sceneId, selfId,"请先领取"..lingquSZ[i-1].DJ.."级元宝返利。" )
					return
				end
				if lev < m.DJ then
					x920032_Tips( sceneId, selfId,"当前等级不足"..m.DJ.."级，无法领取…" )
					return
				end
				SetMissionData( sceneId, selfId, biaoji,m.BLZ+1) --已投资标记
				YuanBao(sceneId,selfId,targetId,1,m.ZD*YuanBaoFB)	--加元宝
				gonggao = "#G["..licaiNW.."万理财]：#P恭喜玩家#W"..nam.."#P成功领取了#G"..m.DJ.."级#P投资返利，获得了#G"..(m.ZD*YuanBaoFB).."#P点元宝。"
				BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
				x920032_Tips( sceneId, selfId,gonggao )
				x920032_GetGiftsForLevel(sceneId, selfId,kehuduanTB) --同步客户端
			end
		end
		return
	end
	if nIndex >=501 and nIndex <=600 then
		for	i, m in lingquSZ do
			if nIndex1 == m.ID then
				if GetMissionData( sceneId, selfId, biaoji) > m.BLZ then
					x920032_Tips( sceneId, selfId,"当前返利已领取过了。" )
					return
				end
				if GetMissionData( sceneId, selfId, biaoji) < m.BLZ then
					x920032_Tips( sceneId, selfId,"请先领取"..lingquSZ[i-1].DJ.."级元宝返利。" )
					return
				end
				if lev < m.DJ then
					x920032_Tips( sceneId, selfId,"当前等级不足"..m.DJ.."级，无法领取…" )
					return
				end
				SetMissionData( sceneId, selfId, biaoji,m.BLZ+1) --已投资标记
				YuanBao(sceneId,selfId,targetId,1,m.ZD*YuanBaoFB)	--加元宝
				gonggao = "#G["..licaiNW.."万理财]：#P恭喜玩家#W"..nam.."#P成功领取了#G"..m.DJ.."级#P投资返利，获得了#G"..(m.ZD*YuanBaoFB).."#P点元宝。"
				BroadMsgByChatPipe(sceneId, selfId, gonggao, 4)
				x920032_Tips( sceneId, selfId,gonggao )
				x920032_GetGiftsForLevel(sceneId, selfId,kehuduanTB) --同步客户端
			end
		end
		return
	end
end	




function x920032_GetGiftsForLevel(sceneId, selfId,clickId)
        --蝎子最新修复，达到对应的VIP等级才能买对应的理财，避免普通玩家刷点数
	local touzi1 = GetMissionData( sceneId, selfId, x181000_touzi1)
	local touzi2 = GetMissionData( sceneId, selfId, x181000_touzi2)
	local touzi3 = GetMissionData( sceneId, selfId, x181000_touzi3)
	local touzi4 = GetMissionData( sceneId, selfId, x181000_touzi4)
	local touzi5 = GetMissionData( sceneId, selfId, x181000_touzi5)
	local touzi6 = GetMissionData( sceneId, selfId, x181000_touzi6)
				--x920032_Tips( sceneId, selfId,touzi6 )

	if clickId == 1 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi1)
			UICommand_AddInt( sceneId, touzi2)
			UICommand_AddInt( sceneId, touzi3)
			UICommand_AddInt( sceneId, touzi4)
			UICommand_AddInt( sceneId, touzi5)
			UICommand_AddInt( sceneId, touzi6)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141750 )
	elseif clickId == 2 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi1)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141751 )	
	elseif clickId == 3 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi2)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141752 )	
	elseif clickId == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi3)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141753 )	
	elseif clickId == 5 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi4)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141754 )	
	elseif clickId == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi5)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141755 )	
	elseif clickId == 7 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, touzi6)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 151141756 )	
	end
end


function x920032_Tips( sceneId, selfId,msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


