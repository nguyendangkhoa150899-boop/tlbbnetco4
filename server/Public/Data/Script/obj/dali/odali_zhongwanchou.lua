--大理NPC
--钟万仇
--普通

--**********************************
--事件交互入口
--**********************************
function x002086_OnDefaultEvent(sceneId,selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"  我夫人骂得好。段正淳这恶徒自逞风流，多造冤孽，到头来自己的亲生儿女相恋成奸，当真是卑鄙无耻之极了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--屏幕中间提示
--**********************************
function x002086_tips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--快捷传送事件
--**********************************
function x002086_TransPort(sceneId,selfId,Type,Index)

    if sceneId > 2 then
       x002086_tips(sceneId,selfId,"此功能只允许在主城使用。")
       return
    end

    if Type == 1 then  --快捷功能
       if Index == 1 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 238, 321, 10 )
          return
       end
       if Index == 2 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 326, 270, 10 )
          return
       end
       if Index == 3 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 202, 257, 10 )
          return
       end
       if Index == 4 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 333, 224, 10 )
          return
       end
       if Index == 5 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
          return
       end
       if Index == 6 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 201, 40 )
          return
       end
       if Index == 7 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 158, 120, 85 )
          return
       end
       if Index == 8 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 16, 96, 152, 10 )
          return
       end
       if Index == 9 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 14, 67, 145, 10 )
          return
       end
       if Index == 10 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 9, 96, 127, 10 )
          return
       end
       if Index == 11 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 17, 95, 120, 10 )
          return
       end
       if Index == 12 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 13, 96, 120, 10 )
          return
       end
       if Index == 13 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 15, 89, 139, 10 )
          return
       end
       if Index == 14 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 12, 103, 140, 10 )
          return
       end
       if Index == 15 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 11, 98, 167, 10 )
          return
       end
       if Index == 16 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 10, 91, 116, 10 )
          return
       end
       if Index == 17 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 435, 29, 135, 10 )
          return
       end
       if Index == 18 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 495, 129, 71, 10 )
          return
       end
       if Index == 19 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 197, 87, 151, 10 )
          return
       end
       if Index == 20 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 10, 181, 65, 62 )
          return
       end
       if Index == 21 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 329, 296, 10 )
          return
       end
       if Index == 22 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 238, 237, 10 )
          return
       end
       if Index == 23 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 239, 253, 10 )
          return
       end
       if Index == 24 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 351, 270, 10 )
          return
       end
       if Index == 25 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 348, 271, 10 )
          return
       end
       if Index == 26 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 344, 271, 10 )
          return
       end
       if Index == 27 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 172, 360, 10 )
          return
       end
       if Index == 28 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 139, 132, 10 )
          return
       end
       if Index == 29 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 239, 202, 10 )
          return
       end
       if Index == 30 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 140, 180, 10 )
          return
       end
       if Index == 31 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 271, 236, 10 )
          return
       end
       if Index == 32 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 361, 185, 10 )
          return
       end
       if Index == 33 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 171, 238, 10 )
          return
       end
       if Index == 34 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 173, 234, 10 )
          return
       end
       if Index == 35 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 354, 267, 10 )
          return
       end
       if Index == 36 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 184, 333, 10 )
          return
       end
       if Index == 37 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 252, 249, 10 )
          return
       end
       if Index == 38 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 364, 309, 10 )
          return
       end
       if Index == 39 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 264, 222, 10 )
          return
       end
       if Index == 40 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 54, 147, 10 )
          return
       end
       if Index == 41 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 28, 239, 10 )
          return
       end
       if Index == 42 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 294, 157, 1 )
          return
       end
       if Index == 43 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 252, 249, 10 )
          return
       end
       if Index == 44 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 180, 139, 10 )
          return
       end
       if Index == 45 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 366, 248, 10 )
          return
       end
       if Index == 46 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 265, 262, 10 )
          return
       end
       if Index == 47 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 230, 348, 30 )
          return
       end
       if Index == 48 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 281, 276, 30 )
          return
       end
       if Index == 49 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 185,68, 30 )
          return
       end
       if Index == 50 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 146, 120, 35 )
          return
       end
       if Index == 51 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 39, 109, 25, 10 )
          return
       end
       if Index == 52 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 158, 235, 219, 75 )
          return
       end
       if Index == 53 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 163, 300, 100, 55 )
          return
       end
       if Index == 54 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 166, 11, 94, 75 )
          return
       end
       if Index == 55 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 251, 315, 10 )
          return
       end
       if Index == 56 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 98, 122, 10 )
          return
       end
       if Index == 57 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 112, 153, 10 )
          return
       end
       if Index == 58 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 104, 153, 10 )
          return
       end
       if Index == 59 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 301, 203, 10 )
          return
       end
       if Index == 60 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 92, 10 )
          return
       end
   end


    if Type == 2 then  --装备打造
       if Index == 1 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 306, 289, 10 )
          return
       end
       if Index == 2 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 306, 289, 10 )
          return
       end
       if Index == 3 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 306, 289, 10 )
          return
       end
       if Index == 4 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 280, 321, 10 )
          return
       end
       if Index == 5 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 280, 321, 10 )
          return
       end
       if Index == 6 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 280, 321, 10 )
          return
       end
       if Index == 7 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 280, 321, 10 )
          return
       end
       if Index == 8 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 280, 321, 10 )
          return
       end
       if Index == 9 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 280, 321, 10 )
          return
       end
       if Index == 10 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 318, 315, 10 )
          return
       end

       if Index == 11 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 362, 242, 10 )
          return
       end
       if Index == 12 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 151, 77, 85 )
          return
       end
       if Index == 13 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 354, 234, 40 )
          return
       end
       if Index == 14 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 354, 240, 80 )
          return
       end
       if Index == 15 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 195, 216, 85 )
          return
       end
       if Index == 16 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 195, 216, 85 )
          return
       end
       if Index == 17 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 195, 216, 85 )
          return
       end
       if Index == 18 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 195, 216, 85 )
          return
       end
       if Index == 19 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 263, 254, 10 )
          return
       end
       if Index == 20 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 263, 254, 10 )
          return
       end
       if Index == 21 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 233, 214, 85 )
          return
       end
       if Index == 22 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 233, 214, 85 )
          return
       end
       if Index == 23 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 233, 214, 85 )
          return
       end
       if Index == 24 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 233, 214, 85 )
          return
       end
       if Index == 25 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 233, 214, 85 )
          return
       end
       if Index == 26 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 149, 181, 50 )
          return
       end
       if Index == 27 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 30, 70 )
          return
       end
       if Index == 28 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 140, 195, 65 )
          return
       end
       if Index == 29 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 152, 69, 85 )
          return
       end
       if Index == 30 or Index == 31 then
		--是否在漕运
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113)
		if haveImpact == 1 then
			x002086_tips(sceneId,selfId,"对不起,您现在处于运输状态。")
		   return
		end
		-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
		if GetItemCount(sceneId, selfId, 40002000)>=1  then
			x002086_tips(sceneId,selfId,"你身上有银票，正在跑商！我不能帮助你。" )
		   return
		end

		if IsShutout( sceneId, selfId, ONOFF_T_GUILD ) == -1 then
                      x002086_tips(sceneId,selfId,"此类装备需要在帮会城市打造，你还是先加入一个帮会吧！" )
                   return
                end

		if(CityGetSelfCityID(sceneId, selfId) ~= -1) then
		   CityMoveTo(sceneId, selfId)
                else
                   x002086_tips(sceneId,selfId,"你的帮会并没有申请城市，因此你不能打造此类装备！" )
	       end
        end


       if Index == 32 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 247, 216, 85 )
          return
       end
       if Index == 33 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 205, 55, 75 )
          return
       end
       if Index == 34 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 351, 226, 85 )
          return
       end
       if Index == 35 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 262, 254, 10 )
          return
       end
       if Index == 36 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 262, 254, 10 )
          return
       end
       if Index == 37 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 262, 254, 10 )
          return
       end
       if Index == 38 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 213, 325, 10 )
          return
       end
       if Index == 39 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 133, 118, 75 )
          return
       end
       if Index == 40 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 209, 343, 10 )
          return
       end
       if Index == 41 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 209, 343, 10 )
          return
       end
    end


    if Type == 3 then  --快速练级
       if Index == 1 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 123, 233, 228, 10 )
          return
       end
       if Index == 2 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 168, 26, 216, 20 )--船务
          return
       end
       if Index == 3 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 172, 36, 236, 25 )--温泉
          return
       end
       if Index == 4 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 169, 21, 21, 40 )--剑冢
          return
       end
       if Index == 5 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 156, 47, 215, 45 )--草料
          return
       end
       if Index == 6 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 173, 110, 221, 50 )--黄龙
          return
       end
       if Index == 7 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 159, 68, 95, 50 )--古墓1
          return
       end
       if Index == 8 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 160, 87, 89, 50 )--古墓2
          return
       end
       if Index == 9 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 161, 13, 25, 50 )--古墓3
          return
       end
       if Index == 10 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 162, 102, 18, 50 )--古墓4
          return
       end
       if Index == 11 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 163, 24, 24, 55 )--古墓5
          return
       end
       if Index == 12 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 164, 65, 108, 55 )--古墓6
          return
       end
       if Index == 13 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 165, 28, 107, 55 )--古墓7
          return
       end
       if Index == 14 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 166, 14, 14, 75 )--古墓8
          return
       end
       if Index == 15 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 167, 20, 18, 75 )--古墓9
          return
       end
       if Index == 16 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 400, 227, 226, 75 )--地宫1
          return
       end
       if Index == 17 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 401, 223, 225, 75 )--地宫2
          return
       end
       if Index == 18 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 402, 231, 218, 75 )--地宫3
          return
       end
       if Index == 19 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 538, 31, 33, 75 )--地宫4
          return
       end
       if Index == 20 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 423, 223, 29, 90 )--火焰山
          return
       end
       if Index == 21 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 519, 72, 29, 90 )--火焰谷
          return
       end
       if Index == 22 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 424, 41, 37, 90 )--高昌
          return
       end
       if Index == 23 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 520, 100, 99, 90 )--迷宫
          return
       end
       if Index == 24 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 425, 32, 34, 90 )--塔里木
          return
       end
       if Index == 25 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 427, 38, 24, 90 )--塔克
          return
       end
       if Index == 26 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 541, 110, 22, 90 )--昆仑山
          return
       end
       if Index == 27 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 421, 95, 36, 90 )--昆仑福地
          return
       end
       if Index == 28 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 431, 193, 227, 90 )--大碗
          return
       end
       if Index == 29 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 432, 90, 86, 90 )--汗血陵
          return
       end
       if Index == 30 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 536, 41, 223, 90 )--萨玛
          return
       end
       if Index == 31 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 537, 27, 70, 90 )--圣火宫
          return
       end
    end


    if Type == 4 then  --副本传送
       if Index == 1 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 287, 138, 20 ) --大理棋局
          return
       end
       if Index == 2 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 364, 228, 20 ) --洛阳棋局
          return
       end
       if Index == 3 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 267, 242, 20 ) --苏州棋局
          return
       end
       if Index == 4 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 296, 130, 30 ) --大理蹴鞠
          return
       end
       if Index == 5 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 298, 191, 30 ) --洛阳蹴鞠
          return
       end
       if Index == 6 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 284, 242, 30 ) --苏州蹴鞠
          return
       end
       if Index == 7 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 341, 210, 30 ) --水牢
          return
       end
       if Index == 8 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 5, 200, 53, 30 ) --镜湖剿匪
          return
       end
       if Index == 9 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 131, 258, 30 ) --苏州老三环
          return
       end
       if Index == 10 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 294, 69, 30 ) --楼兰新三环
          return
       end
       if Index == 11 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 162, 75, 30 ) --楼兰寻宝
          return
       end
       if Index == 12 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 171, 120, 30 ) --楼兰幻境
          return
       end
       if Index == 13 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 4, 70, 121, 60 ) --燕子坞
          return
       end
       if Index == 14 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 190, 223, 75 ) --小票
          return
       end
       if Index == 15 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 195, 214, 70 ) --四绝
          return
       end
       if Index == 16 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 70, 59, 70 ) --少室山
          return
       end
       if Index == 17 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 295, 225, 85 ) --雁门
          return
       end
       if Index == 18 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 130, 78, 70 ) --杀星
          return
       end
       if Index == 19 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 205, 176, 85 ) --兵圣
          return
       end
       if Index == 20 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 292, 93, 85 ) --琅嬛
          return
       end
       if Index == 21 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 286, 67, 85 ) --凤鸣王陵
          return
       end
       if Index == 22 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 287, 81, 85 ) --三神
          return
       end
       if Index == 23 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 190, 223, 75 ) --大票
          return
       end
       if Index == 24 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 191, 120, 142, 40 ) --凤凰铃木
          return
       end
       if Index == 25 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 158, 92, 158, 40 ) --野猪暴走
          return
       end
       if Index == 26 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 4, 136, 118, 20 ) --太湖刷反
          return
       end
       if Index == 27 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 159, 46, 75 ) --天降棋手
          return
       end
       if Index == 28 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 18, 267, 256, 40 ) --藏经阁
          return
       end
       if Index == 29 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 359, 192, 40 ) --征讨
          return
       end
       if Index == 30 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 150, 151, 40 ) --凤凰争霸
          return
       end
       if Index == 31 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 349, 225, 45 ) --个人争霸
          return
       end
       if Index == 32 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 292, 233, 40 ) --华山论剑
          return
       end
       if Index == 33 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 292, 240, 40 ) --松辽大战
          return
       end
    end


    if Type == 5 then  --野外boss
       if Index == 1 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 123, 34, 212, 10 ) --宝藏洞boss一
          return
       end
       if Index == 2 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 126, 54, 195, 10 ) --宝藏洞boss二
          return
       end
       if Index == 3 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 148, 205, 48, 10 ) --宝藏洞boss三
          return
       end
       if Index == 4 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 149, 229, 165, 10 ) --宝藏洞boss四
          return
       end
       if Index == 5 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 150, 127, 25, 20 ) --宝藏洞boss五
          return
       end
       if Index == 6 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 159, 107, 94, 45 ) --古墓boss一
          return
       end
       if Index == 7 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 160, 101, 35, 45 ) --古墓boss二
          return
       end
       if Index == 8 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 161, 105, 104, 45 ) --古墓boss三
          return
       end
       if Index == 9 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 162, 57, 35, 45 ) --古墓boss四
          return
       end
       if Index == 10 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 163, 104, 36, 55 ) --古墓boss五
          return
       end
       if Index == 11 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 164, 65, 44, 55 ) --古墓boss6
          return
       end
       if Index == 12 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 165, 102, 84, 55 ) --古墓boss7
          return
       end
       if Index == 13 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 166, 92, 16, 75 ) --古墓boss8
          return
       end
       if Index == 14 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 167, 64, 77, 75 ) --古墓boss9
          return
       end
       if Index == 15 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 139, 45, 40, 41 ) --少林门派boss
          return
       end
       if Index == 16 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 140, 44, 38, 11 ) --丐帮门派boss
          return
       end
       if Index == 17 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 141, 97, 58, 31 ) --明教门派boss
          return
       end
       if Index == 18 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 142, 88, 50, 71 ) --武当门派boss
          return
       end
       if Index == 19 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 143, 95, 35, 91 ) --天龙门派boss
          return
       end
       if Index == 20 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 144, 140, 40, 81 ) --逍遥门派boss
          return
       end
       if Index == 21 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 145, 45, 35, 21 ) --峨嵋门派boss
          return
       end
       if Index == 22 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 146, 140, 50, 51 ) --星宿门派boss
          return
       end
       if Index == 23 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 147, 95, 45, 61 ) --天山门派boss
          return
       end
       if Index == 24 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 188, 83, 37, 70 ) --企鹅王
          return
       end
       if Index == 25 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 150, 127, 25, 20 ) --木桶伯
          return
       end
       if Index == 26 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 170, 216, 176, 30 ) --工魂
          return
       end
       if Index == 27 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 32, 77, 141, 65 ) --冰妖
          return
       end
       if Index == 28 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 39, 180, 53, 65 ) --蛤蟆
          return
       end
       if Index == 29 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 25, 67, 249, 65 ) --金刚
          return
       end
       if Index == 30 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 20, 77, 122, 65 ) --小白
          return
       end
       if Index == 31 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 5, 142, 118, 65 ) --小龙
          return
       end
       if Index == 32 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 158, 141, 113, 40 ) --箱子
          return
       end
       if Index == 33 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 147, 164, 47, 61 ) --龙龟
          return
       end
       if Index == 34 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 280, 118, 40 ) --双影
          return
       end
       if Index == 35 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 400, 53, 199, 65 ) --地宫1
          return
       end
       if Index == 36 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 401, 171, 153, 70 ) --地宫2
          return
       end
       if Index == 37 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 402, 130, 81, 75 ) --地宫3
          return
       end
       if Index == 38 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 538, 60, 201, 75 ) --地宫4
          return
       end
       if Index == 39 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 18, 161, 163, 90 ) --雁南暴龙
          return
       end
       if Index == 40 then
          CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 508, 160, 160, 90 ) --秦皇神域
          return
       end
     end

end

