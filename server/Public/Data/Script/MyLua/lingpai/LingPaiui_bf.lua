
--脚本号
x880001_g_ScriptId = 880001
--事件交互入口
--**********************************
function x880001_OnDefaultEvent( sceneId, selfId,targetId )
	
	--SetLevel( sceneId, selfId, 119)	
	--TryRecieveItem( sceneId, selfId, 10158001, 1)
	--TryRecieveItem( sceneId, selfId, 38001018, 1)
	--TryRecieveItem( sceneId, selfId, 38001020, 1)
	
	
	
	
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"您好"..PlayerSex.."，这里是令牌系统")
		AddNumText(sceneId,x880001_g_ScriptId,"兑换令牌",6,0)
		AddNumText(sceneId,x880001_g_ScriptId,"令牌进阶",6,1)
		AddNumText(sceneId,x880001_g_ScriptId,"令牌镶嵌",6,2)
		AddNumText(sceneId,x880001_g_ScriptId,"宝珠强化",6,3)
		AddNumText(sceneId,x880001_g_ScriptId,"宝珠摘除",6,4)
		AddNumText(sceneId,x880001_g_ScriptId,"宝珠击碎",6,5)
		--AddNumText(sceneId,x880001_g_ScriptId,"技能切换",6,6)
		--AddNumText( sceneId, x880001_g_scriptId, " #B激活豪侠印", 6, 102)
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x880001_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText();
	if NumText == 7 then  --取消了
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 888 then  --令牌进阶		

	
	elseif NumText == 889 then
			BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19830424 )
	elseif NumText == 0 then  --令牌进阶		
		if CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT) <100 then
			x880001_NotifyTips( sceneId, selfId, "帮贡不足100点" ) 
			return
		end	
	CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, -100 )
   TryRecieveItem( sceneId, selfId, 10158001, 1)	
	x880001_NotifyTips( sceneId, selfId, "兑换成功" ) 	
	elseif NumText == 1 then  --令牌进阶
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 201405041)
	elseif NumText == 2 then  --令牌镶嵌
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  201405042)
	elseif NumText == 3 then  --宝珠强化
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  201405043)	
	elseif NumText == 4 then  --宝珠摘除
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  201405045)				
	elseif NumText == 5 then  --宝珠击碎
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  201405044)			
	elseif NumText == 6 then  --切换
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  201405054)			



	elseif GetNumText() == 102 then
		BeginEvent( sceneId )
		    AddText( sceneId, "#cff99ff激活豪侠印需要豪侠勋章50张，完成之后可在装备栏处点击豪侠升级，每升1级需要50张豪侠勋章，满级之后可激活控制减免，减免等级提升需要20张豪侠勋章" )
		    AddText( sceneId, "#cff99ff特别注意：侠印一旦升级，不可再次激活，否则一切数据都将还原至一级侠印" )
			AddNumText( sceneId, x880001_g_scriptId, "开始激活", 6, 1021)
			AddNumText( sceneId, x880001_g_scriptId, "我在想想", 9, 7)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 1021 then 
		if  LuaFnGetAvailableItemCount(sceneId, selfId, 30505078)>=50 then
           LuaFnDelAvailableItem(sceneId,selfId,30505078,50)--删除物品
		   SetMissionData( sceneId, selfId, 370 , 1 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 31761, 0)	--给BUFF
		     BeginEvent( sceneId ) 
					strText = "兑换成功"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
		   else
		       BeginEvent( sceneId ) 
					strText = "材料或元宝不足"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
				
			end 
					
		
		
		
    end
end
 -- RL_SetRs  
--**********************************
-- 屏幕中间信息提示
--**********************************
function x880001_NotifyTips( sceneId, selfId, Tip )
	if Tip == nil or Tip =="" then  return end
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

x880001_g_Bg = {200,300,400,500}

x880001_g_Bz = {}  --宝珠
x880001_g_Bz[38001000]={"a" ,1} --血
x880001_g_Bz[38001001]={"b"  ,1} --力
x880001_g_Bz[38001002]={"c"  ,1} --灵
x880001_g_Bz[38001003]={"d"  ,1} --体
x880001_g_Bz[38001004]={"e"  ,1} --定
x880001_g_Bz[38001005]={"f"  ,1} --身


x880001_g_Bz[38001006]={"g"  ,2} --冰
x880001_g_Bz[38001007]={"h" ,2}  --火
x880001_g_Bz[38001008]={"i"  ,2} --玄
x880001_g_Bz[38001009]={"j"  ,2} --毒
x880001_g_Bz[38001010]={"k" ,3}  --冰k
x880001_g_Bz[38001011]={"l" ,3}  --火k
x880001_g_Bz[38001012]={"m" ,3}  --玄k
x880001_g_Bz[38001013]={"n" ,3}  --毒k
x880001_g_Bz[38001014]={"o" ,4}  --内功
x880001_g_Bz[38001015]={"p" ,4}  --外功
x880001_g_Bz[38001016]={"q" ,4}  --内防
x880001_g_Bz[38001017]={"r" ,4}  --外防
x880001_g_Bz[38001018]={"s",4} --命中
x880001_g_Bz[38001019]={"t" ,4} --闪避  







function x880001_RL_SetRs( sceneId, selfId, idx,arg1,arg2 )
	if not arg1 or arg1 == -1 then   return end
local eqidx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg1)
local itmidx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, arg2)
if idx ==1 then  --令牌进阶的 
	if eqidx == 10158005 then
		x880001_NotifyTips( sceneId, selfId, "满了无法继续升级了" ) 
		return
	end
local bg = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT);  --获取玩家帮贡
if bg < x880001_g_Bg[(mod(eqidx,10))] then 
x880001_NotifyTips( sceneId, selfId,"您的帮贡少于"..(x880001_g_Bg[(mod(eqidx,10))]).."无法进阶" )	
return
end	
CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, -1*(x880001_g_Bg[(mod(eqidx,10))]) )
local pos = TryRecieveItem( sceneId, selfId, eqidx+1, 1)
local transfer = GetBagItemTransfer(sceneId,selfId,pos)		
LuaFnEraseItem( sceneId, selfId, arg1)	
x880001_NotifyTips( sceneId, selfId, "令牌升级成功" )	
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,18, 0)
local str = format( "#ccc33cc恭喜玩家".."#{_INFOUSR%s}#c66ccff花费了%d帮贡将令牌升级为#{_INFOMSG%s3}#H", GetName(sceneId,selfId),tonumber(x880001_g_Bg[(mod(eqidx,10))]),transfer )
BroadMsgByChatPipe( sceneId, selfId, str, 4 )
end


if idx ==2 then   --镶嵌宝珠
local _,Lingpai = LuaFnGetItemCreator(sceneId, selfId, arg1) 
if Lingpai == nil then Lingpai = "" end 
local _,Lingpai = strfind(Lingpai,"LP")
local bq =0
if Lingpai ~=nil then
bq = 1 
else
bq = 0 
end	

local strLP =""
if bq == 0 then  ---镶嵌为 4*2 = 8 扩展 3 = 6 被动 2   为16个
strLP = "LP"..strrep( "0", 16 )
else
_, strLP = LuaFnGetItemCreator(sceneId, selfId, arg1) 
end



local m,n,b ,d1,d2,d3 =x880001_LPXQ(sceneId,selfId,strLP)
 if m <1 then return end 
		 local skilx,skilz = strfind(n,"00") 
		 if skilx == nil or skilz == nil then
		 x880001_NotifyTips( sceneId, selfId, "无法再镶嵌宝珠了" )
	     return
	     end 
		
	 local skilx,skilz = strfind(n,x880001_g_Bz[itmidx][1]) 
	 if skilx ~= nil or skilz ~= nil then
		x880001_NotifyTips( sceneId, selfId, "已镶嵌过此类宝石了")   --镶嵌 2 3 4  分别 激活扩展 的1 2 3
	 return
	 end
  
  local ss,xx,z1,z2,z3,z4= strfind(n,"(%w%w)(%w%w)(%w%w)(%w%w)")  

if ss ~=nil and xx ~=nil then 
	if z1 =="00"   then 
	  if (itmidx <38001000 or itmidx >38001005)	 then
		x880001_NotifyTips( sceneId, selfId, "第一个孔只能镶嵌朱雀宝珠") 
		return
	  end
	elseif z2 =="00"   then 
	  if (itmidx <38001006 or itmidx >38001009)	 then
		x880001_NotifyTips( sceneId, selfId, "第二个孔只能镶嵌青龙宝珠") 
		return
	  end
	elseif z3 =="00"   then 
	  if (itmidx <38001010 or itmidx >38001013)	 then
		x880001_NotifyTips( sceneId, selfId, "第三个孔只能镶嵌玄武宝珠") 
		return
	end
	elseif z4 =="00"   then 
	  if (itmidx <38001014 or itmidx >38001019)	 then
		x880001_NotifyTips( sceneId, selfId, "第四个孔只能镶嵌白虎宝珠") 
		return
	end	
	

	end
	
	


end
	local nMoneyJZ = GetMoneyJZ(sceneId,selfId)
local nMoneyJB = GetMoney(sceneId,selfId)
local nMoneySelf = nMoneyJZ + nMoneyJB
if nMoneySelf < 100000 then
x880001_NotifyTips( sceneId, selfId,  "#G金钱不足！" )
return
end

	local tihuanhstr = gsub(n,"00",x880001_g_Bz[itmidx][1].."1",1) 
    if tihuanhstr ~= nil  then
       local friendName =gsub(strLP,"LP"..n,"LP"..tihuanhstr,1);

		if tonumber(d1) >0 then 
		friendName =gsub(friendName,"(LP"..strrep("%w",8)..")%d%d("..strrep("%w",6)..")","%1"..("a1").."%2")
		end
		if 	tonumber(d2) >0 then
		friendName =gsub(friendName,"(LP"..strrep("%w",10)..")%d%d("..strrep("%w",4)..")","%1"..("d1").."%2")
		end
		if 	tonumber(d3) >0 then
		friendName =gsub(friendName,"(LP"..strrep("%w",12)..")%d%d("..strrep("%w",2)..")","%1"..("s1").."%2")	
		
		
		friendName =gsub(friendName,"(LP"..strrep("%w",14)..")%d%d("..strrep("%w",0)..")","%1"..("u1").."%2")	
		end
		LuaFnCostMoneyWithPriority( sceneId, selfId, 100000 );
		LuaFnSetItemCreator( sceneId, selfId, arg1, friendName )
		LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
		LuaFnEraseItem( sceneId, selfId, arg2)
		
		x880001_NotifyTips( sceneId, selfId, "镶嵌成功" )
	end 
end



if idx ==3 then --强化
local _,Lingpai1 = LuaFnGetItemCreator(sceneId, selfId, arg1) 
if Lingpai1 == nil then Lingpai1 = "" end 
local _,Lingpai = strfind(Lingpai1,"LP")
local bq =0
if Lingpai ~=nil then
bq = 1 
else
bq = 0 
end	

local nMoneyJZ = GetMoneyJZ(sceneId,selfId)
local nMoneyJB = GetMoney(sceneId,selfId)
local nMoneySelf = nMoneyJZ + nMoneyJB
if nMoneySelf < 100000 then
x880001_NotifyTips( sceneId, selfId,  "#G金钱不足！" )
return
end
	
if bq ==0 then return end  --未知错误 
		
if bq == 1 then	
local a,b,c,d = x880001_LPQXX(sceneId,selfId,Lingpai1)	
local sun
if arg2 == 0 then 
if a >8 then 
x880001_NotifyTips( sceneId, selfId, "满了" )	
return
end

if  LuaFnGetAvailableItemCount(sceneId, selfId, 38001021) < 1*a   then
x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*a).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )	
return
end	

if LuaFnDelAvailableItem(sceneId, selfId, 38001021, 1*a) == 0 then
x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*a).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )
return
end

sun = a +1
friendName =gsub(Lingpai1,"(LP"..strrep("%w",1)..")%d("..strrep("%w",14)..")","%1"..(sun).."%2")	
elseif arg2 == 1 then 
if  b >8  then 
x880001_NotifyTips( sceneId, selfId, "满了" )	
return
end
if  LuaFnGetAvailableItemCount(sceneId, selfId, 38001021) < 1*b   then
x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*b).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )	
return
end	
if LuaFnDelAvailableItem(sceneId, selfId, 38001021, 1*b) == 0 then
 x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*b).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )
 return
end
sun = b +1	
friendName =gsub(Lingpai1,"(LP"..strrep("%w",3)..")%d("..strrep("%w",12)..")","%1"..(sun).."%2")		
elseif arg2 == 2 then
if c >8 then 
x880001_NotifyTips( sceneId, selfId, "满了" )	
return
end
if  LuaFnGetAvailableItemCount(sceneId, selfId, 38001021) < 1*c   then
x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*c).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )	
return
end	
 if LuaFnDelAvailableItem(sceneId, selfId, 38001021, 1*c) == 0 then
 x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*c).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )
return
end
sun = c +1	
friendName =gsub(Lingpai1,"(LP"..strrep("%w",5)..")%d("..strrep("%w",10)..")","%1"..(sun).."%2")		
elseif arg2 == 3 then
if d > 8 then 
x880001_NotifyTips( sceneId, selfId, "满了" )	
return
end
if  LuaFnGetAvailableItemCount(sceneId, selfId, 38001021) < 1*d   then
x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*d).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )	
return
end	 
if LuaFnDelAvailableItem(sceneId, selfId, 38001021, 1*d) == 0 then
x880001_NotifyTips( sceneId, selfId, "您必须拥有"..(1*d).."翡翠心精我才可以为您升级,请检查物品是否上锁！" )
return
end
sun = d +1	
friendName =gsub(Lingpai1,"(LP"..strrep("%w",7)..")%d("..strrep("%w",8)..")","%1"..(sun).."%2")		
end	
LuaFnCostMoneyWithPriority( sceneId, selfId, 100000 );
LuaFnSetItemCreator( sceneId, selfId, arg1, friendName )
LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
x880001_NotifyTips( sceneId, selfId, "强化成功" )
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,18, 0)
end	
	
	
end

if idx == 4 then  --摘除
local _,Lingpai1 = LuaFnGetItemCreator(sceneId, selfId, arg1) 
if Lingpai1 == nil then Lingpai1 = "" end 
local _,Lingpai = strfind(Lingpai1,"LP")
local bq =0
if Lingpai ~=nil then
bq = 1 
else
bq = 0 
end	


local nMoneyJZ = GetMoneyJZ(sceneId,selfId)
local nMoneyJB = GetMoney(sceneId,selfId)
local nMoneySelf = nMoneyJZ + nMoneyJB
if nMoneySelf < 100000 then
x880001_NotifyTips( sceneId, selfId,  "#G金钱不足！" )
return
end





	
if bq ==0 then return end  --未知错误 	
if bq == 1 then	
local a,b,c,d = x880001_LPQXX(sceneId,selfId,Lingpai1)

local sun
if arg2 == 0 then 
if a <1  then
return
end	 


BeginAddItem(sceneId)
AddItem( sceneId,38001021, a*2 ) 
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId) 


friendName =gsub(Lingpai1,"(LP"..strrep("%w",0)..")%w%d("..strrep("%w",14)..")","%1"..("00").."%2")	
elseif arg2 == 1 then 
if  b <1  then
	return
end	 
BeginAddItem(sceneId)
AddItem( sceneId,38001021, b*2 ) 
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId) 
friendName =gsub(Lingpai1,"(LP"..strrep("%w",2)..")%w%d("..strrep("%w",12)..")","%1"..("00").."%2")
elseif arg2 == 2 then
if c <1 then 	
return
end
BeginAddItem(sceneId)
AddItem( sceneId,38001021, c*2 ) 
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId) 

friendName =gsub(Lingpai1,"(LP"..strrep("%w",4)..")%w%d("..strrep("%w",10)..")","%1"..("00").."%2")	
elseif arg2 == 3 then
if d < 1 then 	
return
end 
BeginAddItem(sceneId)
AddItem( sceneId,38001021, d*2 ) 
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId) 
friendName =gsub(Lingpai1,"(LP"..strrep("%w",6)..")%w%d("..strrep("%w",8)..")","%1"..("00").."%2")	
end	
LuaFnCostMoneyWithPriority( sceneId, selfId, 100000 );
LuaFnSetItemCreator( sceneId, selfId, arg1, friendName )
LuaFnRefreshItemInfo( sceneId, selfId, arg1 )
x880001_NotifyTips( sceneId, selfId, "摘除成功" )
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,18, 0)
end	

end	










	
if idx == 6 then   --击碎
	if eqidx <1 then 
		return
	end
	
local transfer1 = GetBagItemTransfer(sceneId,selfId,arg1)	
LuaFnEraseItem( sceneId, selfId, arg1)	
local nMoneyJZ = GetMoneyJZ(sceneId,selfId)
local nMoneyJB = GetMoney(sceneId,selfId)
local nMoneySelf = nMoneyJZ + nMoneyJB
if nMoneySelf < 100000 then
x880001_NotifyTips( sceneId, selfId,  "#G金钱不足！" )
return
end
TryRecieveItem( sceneId, selfId,38001021, 1)
local pos = TryRecieveItem( sceneId, selfId,38001021, 1)
local transfer = GetBagItemTransfer(sceneId,selfId,pos)		
LuaFnEraseItem( sceneId, selfId, arg1)	
LuaFnCostMoneyWithPriority( sceneId, selfId, 100000 );
x880001_NotifyTips( sceneId, selfId, "击碎成功" )	
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,18, 0)
local str = format( "#ccc33cc恭喜玩家".."#{_INFOUSR%s}#c66ccff将#{_INFOMSG%s1}击碎为2枚#{_INFOMSG%s2}#H", GetName(sceneId,selfId),transfer1,transfer )
BroadMsgByChatPipe( sceneId, selfId, str, 4 )
end






end 

function x880001_LPXQ(sceneId,selfId,arg1)
--local _,lpstring = LuaFnGetItemCreator(sceneId, selfId, arg1)
if arg1 == nil then 
return 0
end	
local long =     strlen(arg1)
local skilx,skilz = strfind(arg1,"LP")
if skilx == nil or skilz == nil then
return 0
end

local skilstring1 = strsub(arg1,skilz+1,skilz+8)  --"LP 00 00 00 00 00 " 4 6 
local skilstring2 = strsub(arg1,skilz+8,skilz+8)  --最后
local skilstring3 = strsub(arg1,skilz+2,skilz+2) 
local skilstring4 = strsub(arg1,skilz+4,skilz+4) 
local skilstring5 = strsub(arg1,skilz+6,skilz+6) 

if skilstring1 == nil then
return 0
end

if skilstring2 ==nil then 
skilstring2 =0 
end	
return 1 , skilstring1,skilstring2,skilstring3,skilstring4,skilstring5
end


function x880001_LPQXX(sceneId,selfId,arg1)
--local _,lpstring = LuaFnGetItemCreator(sceneId, selfId, arg1)
if arg1 == nil then 
return 0
end	
local long =     strlen(arg1)
local skilx,skilz = strfind(arg1,"LP")
if skilx == nil or skilz == nil then
return 0
end

local skilstring1 = strsub(arg1,skilz+2,skilz+2)
local skilstring2 = strsub(arg1,skilz+4,skilz+4)
local skilstring3 = strsub(arg1,skilz+6,skilz+6) 
local skilstring4 = strsub(arg1,skilz+8,skilz+8) 
if skilstring1 == nil then
return 0
end

if skilstring2 ==nil then 
skilstring2 =0 
end	
if skilstring3 ==nil then 
skilstring3 =0 
end	
if skilstring4 ==nil then 
skilstring4 =0 
end	
return tonumber( skilstring1),tonumber(skilstring2),tonumber(skilstring3),tonumber(skilstring4)
end



--这个写给调用buff 

function x880001_LPQBUFF(sceneId,selfId,arg1)
local _,lpstring = LuaFnGetItemCreator(sceneId, selfId, arg1)
if lpstring == nil then 
return 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
end	

local skilx,skilz = strfind(lpstring,"LP")
if skilx == nil or skilz == nil then
return 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
end






local a = strsub(lpstring,skilz+1,skilz+1)
local a1 = strsub(lpstring,skilz+2,skilz+2)  --1
local b = strsub(lpstring,skilz+3,skilz+3)
local b1 = strsub(lpstring,skilz+4,skilz+4)  --2
local c = strsub(lpstring,skilz+5,skilz+5)
local c1 = strsub(lpstring,skilz+6,skilz+6)  --3
local d = strsub(lpstring,skilz+7,skilz+7)
local d1 = strsub(lpstring,skilz+8,skilz+8)  -- 4
----------------以上为4个宝珠的信息
local e = strsub(lpstring,skilz+9,skilz+9)
local f = strsub(lpstring,skilz+11,skilz+11)  -- 4
local g = strsub(lpstring,skilz+13,skilz+13)  -- 4
-------------------以上是扩展触发信息 默认 5级
local h = strsub(lpstring,skilz+15,skilz+15)  -- 4
---------------以上是这个 比较特殊如果不是0 就要根据门派给buff 了
return tonumber( a1),tonumber(b1),tonumber(c1),tonumber(d1),a,b,c,d,e,f,g,h
---返回  4个珠子的等级   然后需要返回珠子类型  
end







