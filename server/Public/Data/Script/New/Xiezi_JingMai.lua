--脚本号
x880012_g_scriptId = 880012 --临时写这个,真正用的时候一定要改.
x880012_g_Skill = {}
x880012_g_Skill[1]={1688,1693,1698,1703,1708,1713,1718,1723,1728,0,1779,1774,1784}
x880012_g_Skill[2]={1689,1694,1699,1704,1709,1714,1719,1724,1729,0,1780,1775,1785}
x880012_g_Skill[3]={1690,1695,1700,1705,1710,1715,1720,1725,1730,0,1781,1776,1786}
x880012_g_Skill[4]={1691,1696,1701,1706,1711,1716,1721,1726,1731,0,1782,1777,1787}
x880012_g_Skill[5]={1692,1697,1702,1707,1712,1717,1722,1727,1732,0,1783,1778,1788}

function x880012_JingMai_E(sceneId, selfId)
         local PlayerSex=GetSex(sceneId,selfId)
         local MP = GetMenPai(sceneId, selfId)
         local JiNeng1=0
         local JiNeng2=0
         local JiNeng3=0
         local JiNeng4=0
         local JiNeng5=0
         local JiNeng6=0
         local JiNeng7=0

         if MP >= 0 and MP <= 12 then
            if HaveSkill( sceneId, selfId, x880012_g_Skill[1][MP+1] ) == 1 then
               JiNeng1=x880012_g_Skill[1][MP+1]
            end
            if HaveSkill( sceneId, selfId, x880012_g_Skill[2][MP+1] ) == 1 then
               JiNeng2=x880012_g_Skill[2][MP+1]
            end
            if HaveSkill( sceneId, selfId, x880012_g_Skill[3][MP+1] ) == 1 then
               JiNeng3=x880012_g_Skill[3][MP+1]
            end
            if HaveSkill( sceneId, selfId, x880012_g_Skill[4][MP+1] ) == 1 then
               JiNeng4=x880012_g_Skill[4][MP+1]
            end
            if HaveSkill( sceneId, selfId, x880012_g_Skill[5][MP+1] ) == 1 then
               JiNeng5=x880012_g_Skill[5][MP+1]
            end
            for i = 1850,1873 do
                if HaveSkill( sceneId, selfId, i ) == 1 then
                   JiNeng6=i
                end
            end
            for j = 1880,1903 do
                if HaveSkill( sceneId, selfId, j ) == 1 then
                   JiNeng7=j
                end
            end
          else
            x880012_NotifyTip( sceneId, selfId, "加入门派才能打开经脉界面" )	
          return
        end

	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, JiNeng1 )
		UICommand_AddInt( sceneId, JiNeng2 )
		UICommand_AddInt( sceneId, JiNeng3 )
		UICommand_AddInt( sceneId, JiNeng4 )
		UICommand_AddInt( sceneId, JiNeng5 )
		UICommand_AddInt( sceneId, JiNeng6 )
		UICommand_AddInt( sceneId, JiNeng7 )
		UICommand_AddInt( sceneId, PlayerSex )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 111558)
  end	

--**********************************
--醒目提示
--**********************************
function x880012_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

