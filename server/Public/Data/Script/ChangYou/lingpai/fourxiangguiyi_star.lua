----ËÄÏó¹éÒ»Æô¶¯½Å±¾
x808244_g_scriptId = 808244
jn_str ={
[4490] = {4500   }, ----ËÄÏó¹éÒ»£®±ù½Å±¾
[4491] = {4510   }, ----ËÄÏó¹éÒ»£®»ğ½Å±¾
[4492] = {4520   }, ----ËÄÏó¹éÒ»£®Ğş
[4493] = {4530   }, ----ËÄÏó¹éÒ»£®¶¾½Å±¾
[4494] = {4540   }, ----Æ¾ĞéÓù·ç½Å±¾
[4495] = {4550   }, ----º®±ù»¯¾¢½Å±¾
[4496] = {4560   }, ----»ğ»¯¾¢½Å±¾
[4497] = {4570   }, ----Ğş»¯¾¢½Å±¾
[4498] = {4580   }, ----¶¾»¯¾¢½Å±¾
}
buffji ={
[4490] = {17000 ,18049,4,5,6 }, ----ËÄÏó¹éÒ»£®±ù½Å±¾
[4491] = {18050 ,19099,3,5,6 }, ----ËÄÏó¹éÒ»£®»ğ½Å±¾
[4492] = {19100 ,20149,3,4,6 }, ----ËÄÏó¹éÒ»£®Ğş½Å±¾
[4493] = {20150 ,21199,4,5,3 }, ----ËÄÏó¹éÒ»£®¶¾½Å±¾
}
MD_LINGPAI_TIME = 14
function x808244_OnImpactFadeOut( sceneId, selfId, impactId )
	 
	local itemId=LuaFnGetItemTableIndexByIndex( sceneId, selfId, 109 )
	if itemId <1 then
		return
	end
	
	local newtime = LuaFnGetCurrentTime()
    if newtime - GetMissionData(sceneId,selfId,MD_LINGPAI_TIME) <= 45  then ---45ÃëÄÚ²»Ö´ĞĞ
		return
	end	
	local stardj = floor( mod(itemId,100)/10)
	local newbuff = jn_str[impactId][1]+tonumber(stardj)
	--- x808244_NotifyTip( sceneId, selfId, "newbuff"..newbuff )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, newbuff , 0 ) ----¼Ó¸öÊ±¼äBUFF
	SetMissionData(sceneId,selfId,MD_LINGPAI_TIME,newtime)
	if impactId <= 4493 then 
    local coldQ = GetHumanAttr(sceneId, selfId, 3) ----µÃµ½Íæ¼Ò±ù¹¥»÷
    local fireQ = GetHumanAttr(sceneId, selfId, 4)-----µÃµ½Íæ¼Ò»ğ¹¥»÷
    local lightQ = GetHumanAttr(sceneId, selfId, 5) ---µÃµ½Íæ¼ÒĞş¹¥»÷
    local poisonQ = GetHumanAttr(sceneId, selfId, 6) ---µÃµ½Íæ¼Ò¶¾¹¥»÷
    local newshuxin = GetHumanAttr(sceneId, selfId, buffji[impactId][3]) + GetHumanAttr(sceneId, selfId, buffji[impactId][4]) + GetHumanAttr(sceneId, selfId, buffji[impactId][5])
    x808244_NotifyTip( sceneId, selfId, "TÑ tßşng gia tång: "..newshuxin )
    newshuxin = floor(newshuxin/15) ---µÃµ½½ø½×Êı
	local old_buffid = x808244_retbuff( sceneId, selfId, impactId )
    newshuxin = old_buffid + newshuxin
	if newshuxin > buffji[impactId][2] then 
		newshuxin = buffji[impactId][2]
	end
	SetMissionData(sceneId,selfId,MD_LINGPAI_BUFFID,old_buffid)
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, newshuxin , 0 ) ----¼Ó¼¯³ÉÊôĞÔ
	end
end




function x808244_retbuff( sceneId, selfId, impactId )
	for i=buffji[impactId][1] , buffji[impactId][2] do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, i ) == 1 then
         return i
		end
	end
	return buffji[impactId][1]
end





function x808244_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--JZVMRU×÷Ê½ÁËÖĞÒÔÎÒĞ©¿ª×÷ÉÏ

--ÁËÒª·¢ÎÒĞ©Õ¹581581481F
