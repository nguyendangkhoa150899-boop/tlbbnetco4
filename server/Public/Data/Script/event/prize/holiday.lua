
x888903_g_scriptId = 888903

x888903_g_Holiday={}
x888903_g_Holiday[0405]=1 --清明--------------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[0501]=2 --劳动节
x888903_g_Holiday[0618]=3 --端午--------------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[0601]=4 --儿童节
x888903_g_Holiday[0216]=5 --春节--------------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[1001]=6 --国庆
x888903_g_Holiday[0817]=7 --七夕--------------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[0214]=8 --情人节
x888903_g_Holiday[1225]=9 --圣诞节
x888903_g_Holiday[0101]=10 --元旦
x888903_g_Holiday[0302]=11 --元宵节-----------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[1004]=12 --中秋节-----------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[1028]=13 --重阳节-----------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[1224]=14 --腊八节-----------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[1222]=15 --冬至-------------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[0208]=16 --灶王节-----------自己根据农历改成对应的阳历日期，每年都要改
x888903_g_Holiday[0318]=17 --二月二-----------自己根据农历改成对应的阳历日期，每年都要改

--**********************************
--一客户端的形式延迟打开
--**********************************
function x888903_HolidayCheck( sceneId, selfId )
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 201709193 )
end

--**********************************
--打开首充UI
--**********************************
function x888903_FirstMoney( sceneId, selfId )
     if GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD) > 0 then
        return
     end
     if GetLevel(sceneId, selfId) < 10 then
        return
     end
	BeginUICommand( sceneId )   --这里不能再写物品号了，写在客户端FirstMoney.lua文件里
	EndUICommand( sceneId )     --不这样写，会导致登陆卡顿
	DispatchUICommand( sceneId, selfId, 201709192 )  --赠送物品显示在客户端FirstMoney.lua文件，实际物品在schoolbag.lua这个服务端脚本
end

--**********************************
--打开UI之前的检测
--**********************************
function x888903_MyHolidayGift( sceneId, selfId )
   local happyday = 0
   local biaojiday = GetMissionData(sceneId,selfId,HOLIDAYDATA)
   local holTaday = mod(GetTime2Day(),10000)
   if biaojiday ~= 0 and biaojiday ~= GetDayTime() then
      SetMissionData(sceneId,selfId,HOLIDAYDATA,0)
      biaojiday = 0
   end
   if x888903_g_Holiday[holTaday] ~= nil then
      happyday = x888903_g_Holiday[holTaday]
   end
   if happyday > 0 and biaojiday == 0 then
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, happyday )
	UICommand_AddInt( sceneId, 30009100+happyday )
	UICommand_AddInt( sceneId, 0 )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20170919 )      
   end
end
--**********************************
--节假日领奖
--**********************************
function x888903_MyHolidayGet( sceneId, selfId )
   local biaojiday = GetMissionData(sceneId,selfId,HOLIDAYDATA)
   local holTaday = mod(GetTime2Day(),10000)
   if x888903_g_Holiday[holTaday] ~= nil then
      if biaojiday == 0 then
         if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
             x888903_Tips( sceneId, selfId, "请将道具栏空出至少两个位置" )
         return
         end
         TryRecieveItem( sceneId,selfId,30009100+x888903_g_Holiday[holTaday], 1)--发奖励物品 
         SetMissionData(sceneId,selfId,HOLIDAYDATA,GetDayTime())
         x888903_Tips( sceneId, selfId, "恭喜您，领取成功！" )
      else
         x888903_Tips( sceneId, selfId, "你已经领取过这个礼包了" )
      return
      end
   else
      x888903_Tips( sceneId, selfId, "今天不是节日，没有礼包给你！" )
   return
   end
end

--**********************************
--对话窗口信息提示
--**********************************
function x888903_MsgBox( sceneId, selfId,msg )
	BeginEvent( sceneId )
	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId )
end
--**********************************
--屏幕中间信息提示
--**********************************
function x888903_Tips( sceneId, selfId, msg )
	BeginEvent( sceneId )
	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId)
end
