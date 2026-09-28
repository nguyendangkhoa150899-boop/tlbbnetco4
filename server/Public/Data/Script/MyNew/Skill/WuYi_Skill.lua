--9星神器技能  蝎子制作QQ-718805400

x808243_g_scriptId = 808243

x808243_g_WuYiSkill={}
x808243_g_WuYiSkill[1] = {1450,1451,1452,1453,1454,1455,1456,1457,1458,1459}
x808243_g_WuYiSkill[2] = {1460,1461,1462,1463,1464,1465,1466,1467,1468,1469}
x808243_g_WuYiSkill[3] = {1470,1471,1472,1473,1474,1475,1476,1477,1478,1479}
x808243_g_WuYiSkill[4] = {1480,1481,1482,1483,1484,1485,1486,1487,1488,1489}
x808243_g_WuYiSkill[5] = {1490,1491,1492,1493,1494,1495,1496,1497,1498,1499}
x808243_g_WuYiSkill[6] = {1500,1501,1502,1503,1504,1505,1506,1507,1508,1509}
x808243_g_WuYiSkill[7] = {1510,1511,1512,1513,1514,1515,1516,1517,1518,1519}
x808243_g_WuYiSkill[8] = {1520,1521,1522,1523,1524,1525,1526,1527,1528,1529}
x808243_g_WuYiSkill[9] = {1530,1531,1532,1533,1534,1535,1536,1537,1538,1539}
x808243_g_WuYiSkill[10] = {1540,1541,1542,1543,1544,1545,1546,1547,1548,1549}
x808243_g_WuYiSkill[11] = {1550,1551,1552,1553,1554,1555,1556,1557,1558,1559}
x808243_g_WuYiSkill[12] = {1560,1561,1562,1563,1564,1565,1566,1567,1568,1569}
x808243_g_WuYiSkill[13] = {1570,1571,1572,1573,1574,1575,1576,1577,1578,1579}
x808243_g_WuYiSkill[14] = {1580,1581,1582,1583,1584,1585,1586,1587,1588,1589}
x808243_g_WuYiSkill[15] = {1590,1591,1592,1593,1594,1595,1596,1597,1598,1599}

--**********************************************************************************
function x808243_OnImpactFadeOut( sceneId, selfId, impactId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local objType = GetCharacterType( sceneId, targetId )
	local mymenpai = GetMenPai( sceneId, selfId )

        if LuaFnIsObjValid(sceneId, targetId) ~= 1 then
           return
        end

        --特殊情况
	if GetHp( sceneId, selfId ) == 0  or GetHp( sceneId, targetId ) == 0 or selfId == targetId or (LuaFnUnitIsEnemy(sceneId, selfId, targetId) ~= 1 )  then
	   x808243_NotifyTip( sceneId, selfId, "不能攻击此目标")
	   return
	end
	if LuaFnIsUnbreakable(sceneId,targetId) >= 1 then
	   x808243_NotifyTip( sceneId, selfId, "目标处于无敌状态")
	   return
	end

        local WuYiSkill_Lev = 0
        if impactId >= 1601 and impactId <= 1603 then
              WuYiSkill_Lev = mod(GetMissionData(sceneId,selfId,WUYI_SKILL_A),100)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+20)
        end

        if impactId >= 1604 and impactId <= 1606 then
              WuYiSkill_Lev = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),10^6)/10^4)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+300)
        end

        if impactId >= 1607 and impactId <= 1609 then
              WuYiSkill_Lev = mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),100)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+300)
        end

        if impactId >= 1610 and impactId <= 1612 then
              WuYiSkill_Lev = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10^6)/10^4)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+300)
        end


        if impactId >= 1613 then
              WuYiSkill_Lev = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10^6)/10^4)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+300)
        end

        if impactId >= 1614 then
              WuYiSkill_Lev = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10^6)/10^4)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, targetId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+300)
        end

        if impactId >= 1615 then
              WuYiSkill_Lev = floor(mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10^6)/10^4)
	      LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808243_g_WuYiSkill[impactId-1600][WuYiSkill_Lev], 0 )
              SetMissionData(sceneId,selfId,WUYI_SKILL_ITEM,LuaFnGetCurrentTime()+300)
        end

end

--**********************************
--醒目提示
--**********************************
function x808243_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
