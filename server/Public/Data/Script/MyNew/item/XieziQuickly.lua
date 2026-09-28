x070051_g_scriptId = 070051

--**********************************
--事件交互入口
--**********************************
function x070051_XieziQuickly( sceneId, selfId, xieziA, xieziB, xieziC, xieziD, xieziE, xieziF)

   if xieziA == 1 then  --镶嵌宝石
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 19830424 )
	return
    end

   if xieziA == 2 then  --摘除宝石
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 27 )
	return
    end

   if xieziA == 3 then  --极限镶嵌
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 751107 )
	return
    end

   if xieziA == 4 then  --极限摘除
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 25702 )
	return
    end

   if xieziA == 5 then  --合成宝石
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 23 )
	return
    end

   if xieziA == 6 then  --宝石升级 ---空余
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 201408140 )
	return
    end

   if xieziA == 7 then  --宝石雕琢
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 112236 )
	return
    end

   if xieziA == 8 then  --宝石熔炼
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 112237 )
	return
    end

   if xieziA == 9 then  --宝石琢刻
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 201210120 )
	return
    end

   if xieziA == 10 then  --宝石分离
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 201210121 )
	return
    end

   if xieziA == 11 then  --时装裁剪
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  2015043098)
     return
    end

   if xieziA == 12 then  --时装点缀
	BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,selfId);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 2015050199 )	
     return
    end

   if xieziA == 13 then  --时装染色
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  0910281)
     return
    end

   if xieziA == 14 then  --时装配饰摘除
	BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,selfId);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 20170828 )
     return
    end



   if xieziA == 5995 then   --神器开蒙
      CallScriptFunction( 900033, "ShangGuTopo",sceneId, selfId,1,xieziB )
     return
    end

   if xieziA == 5996 then   --神器育灵
      CallScriptFunction( 900033, "ShangGuTopo",sceneId, selfId,2,xieziB )
     return
    end

   if xieziA == 5997 then
      CallScriptFunction( 900033, "ShangGuTopo",sceneId,selfId,4,xieziB,xieziC)
     return
    end

   if xieziA == 5998 then
      CallScriptFunction( 900033, "ShangGuTopo",sceneId,selfId,3,xieziB,xieziC,xieziD)
     return
    end

   if xieziA == 5999 then
                local SGSQ = 0
		local _, myname = LuaFnGetItemCreator(sceneId, selfId,100);
                if myname ~= nil then
		  local sree1 = strfind(myname,"#S")
		    if sree1 ~= nil then
                        SGSQ = tonumber(strsub(myname,sree1+2,sree1+9))
                    end
                end
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);
	        UICommand_AddInt(sceneId,SGSQ)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 89247101 )
     return
    end


   if xieziA == 6006 then
        CallScriptFunction( 900033, "XIEZI_WUYI",sceneId, selfId,1 )
     return
    end

   if xieziA == 6007 then
        CallScriptFunction( 900033, "XIEZI_WUYI",sceneId,selfId,2,xieziB)
     return
    end

   if xieziA == 6009 then
        CallScriptFunction( 900033, "XIEZI_WUYI",sceneId,selfId,3,xieziB,xieziC)
     return
    end

   if xieziA == 6010 then
        CallScriptFunction( 900033, "XIEZI_WUYI",sceneId,selfId,4,xieziB,xieziC)
     return
    end


   if xieziA >= 7501 and xieziA <= 7507 then  --新服欢乐月
      CallScriptFunction( 70052, "YuanCheng",sceneId, selfId,xieziA-7500 )
     return
    end

   if xieziA == 7510 then  --门派泰斗
      CallScriptFunction( 70052, "TaiDouGift",sceneId, selfId )
     return
    end

   if xieziA == 7511 then  --武林至尊
      CallScriptFunction( 70052, "FirstGift",sceneId, selfId )
     return
    end

   if xieziA == 7512 then  --豪情礼盒兑换
      CallScriptFunction( 70052, "FanQuanBox",sceneId, selfId,xieziB )
     return
    end

   if xieziA == 7513 then  --麒麟玉符兑换
      CallScriptFunction( 70052, "QiLinGift",sceneId, selfId,xieziB )
     return
    end

   if xieziA == 7514 then  --达人奖励兑换
      CallScriptFunction( 70052, "DaRenGift",sceneId, selfId,xieziB )
     return
    end

   if xieziA == 7515 then  --重楼献礼领奖
      CallScriptFunction( 70052, "FanQuanGift",sceneId, selfId,xieziB )
     return
    end


   if xieziA == 8006 then  --加入门派
      CallScriptFunction( 990010, "AddMenPai",sceneId, selfId,xieziB )
     return
    end

   if xieziA == 8007 then  --打开门派手册
	BeginUICommand(sceneId)
	  UICommand_AddInt( sceneId,GetSex(sceneId,selfId))
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId,  2017101501)
     return
    end

   if xieziA == 8008 then  --首充和节日UI跳转
        CallScriptFunction( 888903, "MyHolidayGift", sceneId, selfId )
        CallScriptFunction( 888903, "FirstMoney", sceneId, selfId )
     return
    end

   if xieziA == 8080 then  --换头像边框
	CallScriptFunction(805030,"HeadFrame",sceneId,selfId,xieziB,xieziC);
     return
    end

   if xieziA == 8500 then  --孩子1
      CallScriptFunction( 910052, "PickUpToBag", sceneId, selfId ,xieziB ,xieziC )
     return
    end
   if xieziA == 8501 then  --孩子2
      CallScriptFunction( 890547, "CallIan", sceneId, selfId )
     return
    end
   if xieziA == 8502 then  --孩子3
      CallScriptFunction( 890547, "DelIan", sceneId, selfId )
     return
    end
   if xieziA == 8503 then  --孩子3
	CallScriptFunction(900079, "DelInfantDess",sceneId,selfId)
     return
    end
   if xieziA == 8504 then  --孩子4
	CallScriptFunction(910052,"SCInfantHeroType",sceneId,selfId,xieziB)
     return
    end
   if xieziA == 8505 then  --孩子5
	CallScriptFunction(910052,"InfantSkillLevelUp",sceneId,selfId,xieziB,xieziC)
     return
    end
   if xieziA == 8506 then  --孩子6
	CallScriptFunction(910052,"GetNewSkillGroup",sceneId,selfId,xieziB)
     return
    end
   if xieziA == 8507 then  --孩子7
	CallScriptFunction(910052,"RefereshNewInfantSkill",sceneId,selfId,xieziB,xieziC)
     return
    end
   if xieziA == 8508 then  --孩子8
	CallScriptFunction(891726,"OnExChangeDianJi",sceneId,selfId,xieziB)
     return
    end
   if xieziA == 8509 then  --孩子9
	CallScriptFunction(910052,"Openinfant",sceneId,selfId)
     return
    end
   if xieziA == 8510 then  --孩子10
	CallScriptFunction(910052,"CompositeBooks",sceneId,selfId,xieziB,xieziC)
     return
    end
   if xieziA == 8511 then  --孩子11
	CallScriptFunction(910052,"StudyBooks",sceneId,selfId,xieziB)
     return
    end

   if xieziA == 8550 then  --宝石转换
	CallScriptFunction(892008,"GemChange",sceneId,selfId,xieziB,xieziC)
     return
    end

   if xieziA == 8551 then  --进入通天塔
	CallScriptFunction((400900),"TransferFunc",sceneId,selfId,581,252,359,85);
     return
    end

   if xieziA == 8552 then  --进入云浮
	CallScriptFunction((400900),"TransferFunc",sceneId,selfId,710,134,36,85);
     return
    end

   if xieziA == 8553 then  --进入崖余岛
	CallScriptFunction((400900),"TransferFunc",sceneId,selfId,708,41,165,85);
     return
    end

   if xieziA == 8888 then  --活跃好礼跳转

      CallScriptFunction( 890536, "HuoYueGiftGet", sceneId, selfId ,xieziB, xieziC)
     return
    end

   if xieziA == 8889 then  --活跃好礼跳转
      Targetid = LuaFnGuid2ObjId( sceneId,xieziB)
      if GetMenPai(sceneId,selfId) == 12 and Targetid >= 0 then
        if GetMissionData(sceneId,selfId,MF_GetNewUserCard9) ~= Targetid then
           SetMissionData(sceneId,selfId,MF_GetNewUserCard9,Targetid)
        end
      end
     return
    end

   if xieziA == 9996 then --快捷传送UI
      CallScriptFunction(2086,"TransPort",sceneId,selfId,xieziB,xieziC)
     return
    end


   if xieziA == -9997 then --GM功能，输入编号获取装备
      TryRecieveItem( sceneId, selfId, xieziB, 1 )
      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --特效
      x070051_tips( sceneId, selfId, "获取成功，请查看背包" )
     return
    end

   if xieziA == -9998 then  --GM功能，随身飞地图
      local myScene = floor(xieziB/10^6)
      local x = floor(mod(xieziB,10^6)/1000)
      local z  = mod(xieziB,1000)
      --CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, myScene, x, y )
      NewWorld(sceneId,selfId,myScene, x, y )
     return
    end

   if xieziA == 9999 then  --豪侠印四象重铸
     local g_XiaYinType = {"青龙","白虎","朱雀","玄武"}
     local Type = GetMissionData( sceneId, selfId, XIAYIN_TYPE )
     local DengJi = GetMissionData( sceneId, selfId, XIAYIN_DJ )

       if Type < 1 or Type > 4 or DengJi < 1 or DengJi > 8 then
	  x070051_tips( sceneId, selfId,"你还没有激活 [豪侠印]，不能重铸豪侠印！")
          return
       end
       local LQScount = GetMissionData(sceneId, selfId,XIAYIN_DJ)*10
       if LuaFnGetAvailableItemCount(sceneId, selfId, 38001093) < LQScount then
	  x070051_tips( sceneId, selfId,"需要龙泉水"..LQScount.."个，你的龙泉水不足。")
          return
       end
       if LuaFnDelAvailableItem(sceneId,selfId,38001093,LQScount) < 1 then
	  x070051_tips( sceneId, selfId,"龙泉水扣除失败。")
          return
       end
     SetMissionData(sceneId, selfId, XIAYIN_TYPE, xieziB)
     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
     x880009_NotifyTip( sceneId, selfId, "重铸成功，当前豪侠印属性为："..g_XiaYinType[xieziB].." ")
   end

end

--**********************************
--屏幕中间提示
--**********************************
function x070051_tips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end



