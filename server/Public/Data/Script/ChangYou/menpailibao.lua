--千年大作

-- 脚本号
x900074_g_ScriptId	= 900074
--**********************************
-- 返回1：技能类似的物品，可以继续类似技能的执行；返回0：执行 OnDefaultEvent。
--**********************************
function x900074_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x900074_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x900074_OnConditionCheck( sceneId, selfId )
	-- 校验使用的物品
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end
	return 1
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x900074_OnDeplete( sceneId, selfId )
	return 1
end

function x900074_Tips( sceneId, selfId,msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x900074_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )

	 if itemTblIndex == 30008113 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	
		   
	LuaFnCreatePetToHuman(sceneId, selfId, 27698, 95, 0);	   
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)   
		   
		return
       end	   
	 if itemTblIndex == 30008114 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)   
	TryRecieveItem(sceneId,selfId,38503001,1)
		   
		   
		return
       end	   
	 if itemTblIndex == 30008115 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	
		   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	for i =1,10 do 	   
	TryRecieveItem(sceneId,selfId,20310177,1)
	TryRecieveItem(sceneId,selfId,20310178,1)
	end	   
	for i =1,5 do 	   
	TryRecieveItem(sceneId,selfId,20310179,1)
	end	  		   
		return
       end	   
	 if itemTblIndex == 30008116 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	
    local menpa = {
	[0] = {10553116},--刀
	[1] = {10553116},--刀
	[2] = {10553116},--刀
	[3] = {10553115},--刀
	[4] = {10553115},--刀
	[5] = {10553115},--刀
	[6] = {10553117},--刀
	[7] = {10553117},--刀
	[8] = {10553118},--刀
	[10] = {10553115},--刀
	[11] = {10553119},--刀
	[12] = {10553130},--刀
	
	}
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
    	TryRecieveItem(sceneId,selfId,menpa[GetMenPai(sceneId,selfId)][1],1)	   
		return
       end	   
	 if itemTblIndex == 30008117 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	
	local dianji = {31001114,31001124,31001134,31001144,31001154,31001164,31001214,31001224,31001234,31001244,31001254,31001264,31001314,31001324,31001334,31001344,31001354,31001364,31001414,31001424,31001434,31001444,31001454,31001464}	   
	local suiji = random(getn(dianji))
	TryRecieveItem(sceneId,selfId,dianji[suiji],1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)   
		   
		return
       end		   
	 if itemTblIndex == 30008118 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	

	TryRecieveItem(sceneId,selfId,38403001,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)   
		   
		return
       end		   
	 if itemTblIndex == 30008119 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	

                local QYZ = GetMissionData(sceneId, selfId, MD_ZENG_JING_YI)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	        SetMissionData(sceneId, selfId, MD_ZENG_JING_YI,QYZ+1500 )		   
		   
		return
       end	
	   
	if itemTblIndex == 38001547 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 4 then --判断物品栏
			x900074_Tips( sceneId, selfId, "亲，你的背包至少要有“4”格空位哦…")
			return
		end
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 1) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败" )
       return
           end	

        TryRecieveItem(sceneId,selfId,30505806,1)		   
        TryRecieveItem(sceneId,selfId,50413004,1)		   
        TryRecieveItem(sceneId,selfId,38503001,1)		   
        TryRecieveItem(sceneId,selfId,30008014,1)		   
		   
		return
       end	   
	if itemTblIndex == 38000963 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 50 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 50) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足50" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000953,1)		   		   
		   
		return
       end	  	   
	if itemTblIndex == 38000964 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 170 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 170) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足170" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000954,1)		   		   
		   
		return
       end	   
	if itemTblIndex == 38000965 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 120 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 120) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足120" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000955,1)		   		   
		   
		return
       end	   
	   
	if itemTblIndex == 38000966 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 80 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 80) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足80" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000956,1)		   		   
		   
		return
       end		   
	if itemTblIndex == 38000967 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 250 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 250) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足250" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000957,1)		   		   
		   
		return
       end		   
		if itemTblIndex == 38000968 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 250 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 250) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足250" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000958,1)		   		   
		   
		return
       end	   
		if itemTblIndex == 38000969 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 250 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 250) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足250" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000959,1)		   		   
		   
		return
       end	   
		if itemTblIndex == 38000970 then
		
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 250 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 250) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足250" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000960,1)		   		   
		   
		return
       end	   
		if itemTblIndex == 38000971 then
if LuaFnGetAvailableItemCount(sceneId, selfId, itemTblIndex) < 250 then
x900074_Tips( sceneId, selfId, "数量不足" )	
return
end		
		
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
    x900074_Tips(sceneId,selfId,"请保道具栏和材料栏各有4个空位")
    return	
    end	
       if  LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex, 250) ~= 1 then
        x895111_NotifyTips( sceneId, selfId, "物品扣取失败，不足250" )
       return
           end	

        TryRecieveItem(sceneId,selfId,38000961,1)		   		   
		   
		return
       end	 	   
end






