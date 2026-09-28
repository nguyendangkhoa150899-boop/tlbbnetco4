--活跃奖励
--蝎子QQ718805400 制作
--普通


x890536_g_HYgift={}
      x890536_g_HYgift[1]={30607001,30008122,30000000,30008014,30008034,38000396,38001096,38000399,31000001,31000002}
      x890536_g_HYgift[2]={39999901,38000397,38000945,38001089,30120001,30120002,30120003,30120016,20700063,20700055}
      x890536_g_HYgift[3]={39910001,30501354,30501317,30501290,30501299,30501308,30501272,30501171,38000946,38000398,38000400}
      x890536_g_HYgift[4]={30501172,20310185,20502010,20310186,39975111,39975112,39975113,39975114,20310187,39975115,39975211,20310188,39975212,39975213,39975214,20310189,39975215,39975311,39975312,39975313,20310190,39975314,39975315,10156100,10156200,10157001}
--**********************************
--事件交互入口
--**********************************
function x890536_IGetPlayerDataALq(sceneId, selfId)

	x890536_IGetPlayerDataA(sceneId, selfId)
	local hyz=GetMissionData( sceneId, selfId, HUOYUEZHI)
	local zt=GetMissionData( sceneId, selfId, HUOYUEJIANGLI)

        if GetLevel(sceneId, selfId) < 30 then
	   x890536_NotifyTip( sceneId, selfId, "30级以上才能领取活跃好礼" )
        return
        end

        if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 2 or LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	   x890536_NotifyTip( sceneId, selfId,"请保持材料栏和道具栏至少2个空位" )
	   return	
        end

--1

	if hyz <= 0 then
	   x890536_NotifyTip( sceneId, selfId, "你的活跃值不足，暂时不能领取第一重活跃好礼" )
	end
	 
	if hyz >=1 and zt== 0 then
        local GiftCom = x890536_g_HYgift[1][random(getn(x890536_g_HYgift[1]))]
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
	x890536_IGetPlayerDataA(sceneId, selfId)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,1)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        x890536_IGetPlayerDataA(sceneId, selfId)
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end

--50
	if hyz < 50 and zt== 1 then
	   x890536_NotifyTip( sceneId, selfId, "你的活跃值不足50，暂时不能领取第二重活跃好礼" )
	end
  
	if hyz >= 50 and zt== 1 then
        local GiftCom = x890536_g_HYgift[2][random(getn(x890536_g_HYgift[2]))]
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
	x890536_IGetPlayerDataA(sceneId, selfId)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,50)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        x890536_IGetPlayerDataA(sceneId, selfId)
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end

--150
 
	if hyz < 150 and zt== 50 then
	x890536_NotifyTip( sceneId, selfId, "你的活跃值不足150，暂时不能领取第三重活跃好礼" )
	end

	if hyz >=150 and zt== 50 then	 
        local GiftCom = x890536_g_HYgift[3][random(getn(x890536_g_HYgift[3]))]
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
	x890536_IGetPlayerDataA(sceneId, selfId)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,150)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        x890536_IGetPlayerDataA(sceneId, selfId)
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end

--450

	if hyz < 450 and zt== 150 then
 	x890536_NotifyTip( sceneId, selfId, "你的活跃值不足450，暂时不能领取第四重活跃好礼" )
	end
 
	if hyz >=450 and zt== 150 then	
        local GiftCom = x890536_g_HYgift[4][random(getn(x890536_g_HYgift[4]))]
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
	x890536_IGetPlayerDataA(sceneId, selfId)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,450)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        x890536_IGetPlayerDataA(sceneId, selfId)
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end


	if zt >= 450 then
	x890536_NotifyTip( sceneId, selfId, "你已经领过奖励了，请明天再来领取吧" )
	end
end

function x890536_IGetPlayerDataA(sceneId, selfId)
         x890536_JianCe( sceneId, selfId )
	local hyz=GetMissionData( sceneId, selfId, HUOYUEZHI)
	local zt=GetMissionData( sceneId, selfId, HUOYUEJIANGLI)
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, hyz )
		UICommand_AddInt( sceneId, zt )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  2015022191)
end

function x890536_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--普通检测
function x890536_JianCe(sceneId,selfId)
   if GetMissionData(sceneId,selfId,HYJL_TIME) ~= GetDayTime() then
      SetMissionData(sceneId,selfId,HUOYUEZHI,0)
      SetMissionData(sceneId,selfId,HUOYUEJIANGLI,0)
      SetMissionData(sceneId,selfId,HUOYUEFB_1,0)
      SetMissionData(sceneId,selfId,HUOYUEFB_2,0)
      SetMissionData(sceneId,selfId,HYJL_TIME,GetDayTime())    --记录当天日期
   end
   if GetMissionData(sceneId,selfId,HYJL_TIME) == GetDayTime() then
      if GetMissionData( sceneId, selfId, HUOYUEZHI) > 500 then
         SetMissionData( sceneId, selfId, HUOYUEZHI,500)
      end
   end
end

--登陆检测
function x890536_DLJianCe( sceneId, selfId )
   if GetMissionData( sceneId, selfId, HYJL_TIME ) ~= GetDayTime() then
      SetMissionData( sceneId, selfId, HUOYUEZHI,1)
      SetMissionData( sceneId, selfId, HUOYUEJIANGLI,0)
      SetMissionData(sceneId,selfId,HUOYUEFB_1,10^9)
      SetMissionData(sceneId,selfId,HUOYUEFB_2,0)
      SetMissionData( sceneId, selfId, HYJL_TIME, GetDayTime() )    --记录当天日期
   else
     if floor(GetMissionData(sceneId,selfId,HUOYUEFB_1)/10^9) < 1 then
        SetMissionData(sceneId,selfId,HUOYUEZHI,GetMissionData(sceneId,selfId,HUOYUEZHI)+1) --活跃值+1
        SetMissionData(sceneId,selfId,HUOYUEFB_1,GetMissionData(sceneId,selfId,HUOYUEFB_1)+10^9)
     end
   end
end

function x890536_HuoYueGiftGet(sceneId, selfId, index)
        x890536_JianCe( sceneId, selfId )
	local hyz=GetMissionData( sceneId, selfId, HUOYUEZHI)
	local zt=GetMissionData( sceneId, selfId, HUOYUEJIANGLI)

        if index < 1 and index > 4 then
           return
        end

        if GetLevel(sceneId, selfId) < 30 then
	   x890536_NotifyTip( sceneId, selfId, "30级以上才能领取活跃好礼" )
        return
        end

        if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 2 or LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	   x890536_NotifyTip( sceneId, selfId,"请保持材料栏和道具栏至少2个空位" )
	   return	
        end
        local GiftCom = x890536_g_HYgift[index][random(getn(x890536_g_HYgift[index]))]

        if index == 1 then
           if zt >= 1 then
	      x890536_NotifyTip( sceneId, selfId, "您已经领取过【青铜宝箱】里面的礼物了" )
           return
	   end
           if hyz < 1 then
	      x890536_NotifyTip( sceneId, selfId, "您的活跃值不够，不能打开【青铜宝箱】" )
           return
	   end
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
        x890536_HuoYueGiftSX(sceneId,selfId,index)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,1)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end


        if index == 2 then
           if zt >= 50 then
	      x890536_NotifyTip( sceneId, selfId, "您已经领取过【白银宝箱】里面的礼物了" )
           return
	   end
           if hyz < 50 then
	      x890536_NotifyTip( sceneId, selfId, "您的活跃值不够，不能打开【白银宝箱】" )
           return
	   end
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
        x890536_HuoYueGiftSX(sceneId,selfId,index)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,50)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end


        if index == 3 then
           if zt >= 150 then
	      x890536_NotifyTip( sceneId, selfId, "您已经领取过【黄金宝箱】里面的礼物了" )
           return
	   end
           if hyz < 150 then
	      x890536_NotifyTip( sceneId, selfId, "您的活跃值不够，不能打开【黄金宝箱】" )
           return
	   end
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
        x890536_HuoYueGiftSX(sceneId,selfId,index)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,150)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end


        if index == 4 then
           if zt >= 450 then
	      x890536_NotifyTip( sceneId, selfId, "您已经领取过【翡翠宝箱】里面的礼物了" )
           return
	   end
           if hyz < 450 then
	      x890536_NotifyTip( sceneId, selfId, "您的活跃值不够，不能打开【翡翠宝箱】" )
           return
	   end
	TryRecieveItem( sceneId, selfId, GiftCom, 1)--给予物品--
        x890536_HuoYueGiftSX(sceneId,selfId,index)
	SetMissionData( sceneId, selfId, HUOYUEJIANGLI,450)
	x890536_NotifyTip( sceneId, selfId, "恭喜你获得[#{_ITEM"..GiftCom.."}]一个" )
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end
end


function x890536_HuoYueGiftSX(sceneId,selfId,index)
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,index)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,20110104)
end