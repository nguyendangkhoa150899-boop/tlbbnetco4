--脚本号

x892008_g_Cost_YuanBao = {}			--不同类型宝石，消耗元宝配表
x892008_g_Cost_YuanBao[5] = {1,1}
x892008_g_Cost_YuanBao[6] = {1,1}
x892008_g_Cost_YuanBao[7] = {20,60}
x892008_g_Cost_YuanBao[8] = {100,300}
x892008_g_Cost_YuanBao[9] = {500,1500}

x892008_g_scriptId = 892008

function x892008_savetardata( sceneId, selfId,tapyid,tapy)
  savetaren = LuaFnGuid2ObjId( sceneId,tapyid)
  local a_a=GetMissionData( sceneId, savetaren, 400 )
  local a_b=GetMissionData( sceneId, savetaren, 401 )
  local a_c=GetMissionData( sceneId, savetaren, 402 )
  local a_d=GetMissionData( sceneId, savetaren, 403 )
  local a_e=GetMissionData( sceneId, savetaren, 404 )
  local shend=GetMissionData( sceneId, savetaren, 308 )*30

  local PhysicsAttackQ = GetHumanAttr(sceneId, savetaren, 1)  --外
  local MagicAttackQ = GetHumanAttr(sceneId, savetaren, 2) --内
  local coldQ = GetHumanAttr(sceneId, savetaren, 3) --兵
  local fireQ = GetHumanAttr(sceneId, savetaren, 4)--火
  local lightQ = GetHumanAttr(sceneId, savetaren, 5) --炫
  local poisonQ = GetHumanAttr(sceneId, savetaren, 6) --毒

  local Pet1 = GetMissionData( sceneId, savetaren, 461 )
  local Pet2 = GetMissionData( sceneId, savetaren, 462 )
  local Pet3 = GetMissionData( sceneId, savetaren, 463 )
  local Pet4 = GetMissionData( sceneId, savetaren, 464 )
  local Pet5 = GetMissionData( sceneId, savetaren, 465 )

  BeginUICommand(sceneId)
    UICommand_AddInt(sceneId,Pet1);
    UICommand_AddInt(sceneId,Pet2);
    UICommand_AddInt(sceneId,Pet3);
    UICommand_AddInt(sceneId,Pet4);
    UICommand_AddInt(sceneId,Pet5);
    UICommand_AddString(sceneId,tostring(a_a..","..GetMaxHp( sceneId, savetaren )..","..GetMaxMp( sceneId, savetaren )..","..a_b..","..a_c..","..GetCon( sceneId, savetaren)..","..a_d..","..a_e..","..GetPlayerRemainPoints(sceneId,savetaren)..","))
    UICommand_AddString(sceneId,tostring(PhysicsAttackQ..","..MagicAttackQ..","..coldQ..","..fireQ..","..lightQ..","..poisonQ..","..GetHumanMaxVigor( sceneId, savetaren )..","..GetHumanMaxEnergy( sceneId, savetaren)..","..GetMissionData( sceneId, savetaren, 500 )..","..GetMissionData( sceneId, savetaren, 501 )..","..shend))
    EndUICommand( sceneId )
  DispatchUICommand(sceneId,selfId,20000002)
end

--**********************************
--醒目提示
--**********************************
function x892008_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x892008_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--**********************************
--宝石互换
--**********************************
function x892008_GemChange(sceneId,selfId,packetId,NewGemId)

local costYuanbao = 99999
local LockOrNot = 0

if packetId == nil or (packetId < 30 or packetId > 59) or NewGemId == nil then
   return
end

if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 2 then
   x892008_NotifyTip( sceneId, selfId, "请保持材料栏至少2个空位" )
   return	
end

local OldGemId = LuaFnGetItemTableIndexByIndex(sceneId,selfId,packetId)

--判断首位是不是宝石
if floor(OldGemId/10^7) ~= 5 then
   x892008_NotifyTip( sceneId, selfId, "你放入了个啥JB玩意儿？" )
   return
end

if floor(NewGemId/10^7) ~= 5 then
   x892008_NotifyTip( sceneId, selfId, "你想转换成个啥JB玩意儿？" )
   return
end


--判断几级宝石
if floor(mod(OldGemId,10^6)/10^5) < 5 then
   return
end

if floor(mod(NewGemId,10^6)/10^5) < 5 then
   return
end

if floor(mod(OldGemId,10^6)/10^5) ~= floor(mod(NewGemId,10^6)/10^5) then
   return
end

   costYuanbao = x892008_g_Cost_YuanBao[floor(mod(NewGemId,10^6)/10^5)][1]

--剔除晶石
if floor(mod(OldGemId,1000)/100) ~= 0 or floor(mod(NewGemId,1000)/100) ~= 0 then
   x892008_NotifyTip( sceneId, selfId, "冥晶石？滚蛋！" )
   return
end


--如果是晶石
--这里要先判断产物是不是晶石。没必要先判断源石，产物更值钱！
if mod(NewGemId,10^5) == 21001 or mod(NewGemId,10^5) == 21002 or mod(NewGemId,10^5) == 21003 or mod(NewGemId,10^5) == 21004 then
   if mod(OldGemId,10^5) ~= 21001 and mod(OldGemId,10^5) ~= 21002 and mod(OldGemId,10^5) ~= 21003 and mod(OldGemId,10^5) ~= 21004 then
   x892008_NotifyTip( sceneId, selfId, "瞎改客户端，作死！" )
   return
   end
   costYuanbao = x892008_g_Cost_YuanBao[floor(mod(OldGemId,10^6)/10^5)][2]
end
 
--如果是纯净石头
--同样是先判断产物
if mod(NewGemId,10000) == 2005 or mod(NewGemId,10000) == 2006 or mod(NewGemId,10000) == 2007 or mod(NewGemId,10000) == 2008 then
   if mod(OldGemId,10000) ~= 2005 and mod(OldGemId,10000) ~= 2006 and mod(OldGemId,10000) ~= 2007 and mod(OldGemId,10000) ~= 2008 then
   x892008_NotifyTip( sceneId, selfId, "瞎改客户端，作死！" )
   return
   end
end

--前面判断都通过，剩下的没啥正经石头，一个价，客户端是否被修改，毫无意义
local yuanItem = GetBagItemTransfer( sceneId, selfId, packetId )
if LuaFnGetItemBindStatus(sceneId,selfId,packetId) ==1 then
   LockOrNot = 1
end

--判断元宝
local myYuanbao = YuanBao(sceneId,selfId,targetId,3,0)
  if myYuanbao < costYuanbao then
    x892008_NotifyTip( sceneId, selfId,"您元宝不足"..costYuanbao.."点" )	
  return
  end	

--删除宝石
if  LuaFnEraseItem(sceneId,selfId,packetId) ~= 1 then
   x892008_NotifyTip( sceneId, selfId, "源宝石删除失败了，骚年！" )
   return
end

--扣钱+二次判断
    local strun =  YuanBao(sceneId,selfId,targetId,2,costYuanbao)	
    if strun ~= 0 then
	x892008_NotifyTip( sceneId, selfId,"您元宝不足"..costYuanbao.."点" )	
	return
    end

--删除成功，给宝石
   x892008_NotifyTip( sceneId, selfId, "转换成功，您获得了#{_ITEM"..NewGemId.."}" )
   local pos = TryRecieveItem( sceneId, selfId, NewGemId, 1 )
   local transfer = GetBagItemTransfer(sceneId,selfId,pos)
   if LockOrNot ~= 0 then
	LuaFnItemBind( sceneId, selfId, pos )
   end
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --特效

--上电视
    local str = ""
    str = format( "#{_INFOUSR%s}#H在洛阳#R彭怀玉#H处花费#W"..costYuanbao.."点元宝#H将#{_INFOMSG%s1}#H转换成了#{_INFOMSG%s2}#H。",GetName(sceneId,selfId),yuanItem,transfer)
    BroadMsgByChatPipe( sceneId, selfId,str, 4 )
end
