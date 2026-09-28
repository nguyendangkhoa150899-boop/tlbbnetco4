
--½Å±¾ºÅ
x880006_g_scriptId = 880006 --ÁÙÊ±Ð´Õâ¸ö,ÕæÕýÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.


function x880006_HXY_E(sceneId, selfId)
	local haoxia=GetMissionData( sceneId, selfId, XIAYIN_DJ )
	local sang=GetMissionData( sceneId, selfId, XIAYIN_SG )
	local fengy=GetMissionData( sceneId, selfId, XIAYIN_FY )
	local weik=GetMissionData( sceneId, selfId, XIAYIN_WK )
	local shim=GetMissionData( sceneId, selfId, XIAYIN_SM )
	local mab=GetMissionData( sceneId, selfId, XIAYIN_MB )
	local fengx=GetMissionData( sceneId, selfId, XIAYIN_FX )
	local huns=GetMissionData( sceneId, selfId, XIAYIN_HS )
	local zhangong=GetMissionData( sceneId, selfId, XIAYIN_ZHANGONG )
	local GongXun=GetMissionData( sceneId, selfId, XIAYIN_GONGXUN )
	local Type=GetMissionData( sceneId, selfId, XIAYIN_TYPE )

	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, haoxia )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, sang )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, fengy )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, weik )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, shim )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, mab )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, fengx )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, huns )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, zhangong )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, GongXun )      ---¿Í»§¶Ë
		UICommand_AddInt( sceneId, Type )      ---¿Í»§¶Ë

	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  21287291)
end	
function x880006_HXY_EffectLevelUpp( sceneId, selfId,aryIndex )
	local haoxia=GetMissionData( sceneId, selfId, XIAYIN_DJ )
	local sang=GetMissionData( sceneId, selfId, XIAYIN_SG )
	local fengy=GetMissionData( sceneId, selfId, XIAYIN_FY )
	local weik=GetMissionData( sceneId, selfId, XIAYIN_WK )
	local shim=GetMissionData( sceneId, selfId, XIAYIN_SM )
	local mab=GetMissionData( sceneId, selfId, XIAYIN_MB )
	local fengx=GetMissionData( sceneId, selfId, XIAYIN_FX )
	local huns=GetMissionData( sceneId, selfId, XIAYIN_HS )
	local zhangong=GetMissionData( sceneId, selfId, XIAYIN_ZHANGONG )
	local GongXun=GetMissionData( sceneId, selfId, XIAYIN_GONGXUN )
	local Type=GetMissionData( sceneId, selfId, XIAYIN_TYPE )
	
	
if aryIndex ==8 then

      --if  GetMissionData( sceneId, selfId, XIAYIN_DJ ) < 7 then
	  local jishu = (haoxia+1)*15-5
          --else
	  --local jishu = (haoxia)*10+25
          --return
          --end

     if Type <1 or Type >4 then
	   x880006_NotifyTip( sceneId, selfId, "Các hÕ trß¾c m¡t không có Hào Hi®p ¤n, m¶i tìm NPC ð¬ kích hoÕt Hào Hi®p ¤n")
        return
        end

      if GetMissionData( sceneId, selfId, XIAYIN_DJ ) >=8 then
	x880006_NotifyTip( sceneId, selfId, "ðã max c¤p, không c¥n thång c¤p lÕi")
	return
	end

     if LuaFnGetAvailableItemCount(sceneId, selfId, 38001087)>=200 then
	 LuaFnDelAvailableItem(sceneId,selfId,38001087,200)--É¾³ýÎïÆ·
         SetMissionData( sceneId, selfId, XIAYIN_DJ,GetMissionData( sceneId, selfId, XIAYIN_DJ )+ 1 )
        x880006_AddXiaYinBuff(sceneId, selfId)
        CallScriptFunction( 892002, "AHa_ReMyBuff", sceneId, selfId);
	x880006_HXY_E(sceneId, selfId)
	x880006_NotifyTip( sceneId, selfId, "Chúc m×ng các hÕ Hào Hi®p ¤n ðã thång t¾i "..jishu.." c¤p!")
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
	 else
	x880006_NotifyTip( sceneId, selfId, " [Hào hi®p Huân Chß½ng] không ðü 200 cái, không th¬ thång c¤p!")
 end
x880006_HXY_E(sceneId, selfId)
end	
--31468 1

	local GongXun=GetMissionData( sceneId, selfId, XIAYIN_GONGXUN )
	if  aryIndex == 1 then
		if GetMissionData( sceneId, selfId, XIAYIN_SG ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")	
		return
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_SG ,GetMissionData( sceneId, selfId, XIAYIN_SG )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end

	if  aryIndex == 2 then
		if GetMissionData( sceneId, selfId, XIAYIN_FY ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")	
		return
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_FY ,GetMissionData( sceneId, selfId, XIAYIN_FY )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end
	
		if  aryIndex == 3 then
		if GetMissionData( sceneId, selfId, XIAYIN_WK ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")
		return	
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_WK ,GetMissionData( sceneId, selfId, XIAYIN_WK )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end
	
		if  aryIndex == 4 then
		
			if GetMissionData( sceneId, selfId, XIAYIN_SM ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")	
		return
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_SM ,GetMissionData( sceneId, selfId, XIAYIN_SM )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end
	
	if  aryIndex == 5 then
		if GetMissionData( sceneId, selfId, XIAYIN_MB ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")	
		return
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_MB ,GetMissionData( sceneId, selfId, XIAYIN_MB )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end		

	if  aryIndex == 6 then
		if GetMissionData( sceneId, selfId, XIAYIN_FX ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")	
		return
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_FX ,GetMissionData( sceneId, selfId, XIAYIN_FX )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end
	if  aryIndex == 7 then
		if GetMissionData( sceneId, selfId, XIAYIN_HS ) >=10 then
		x880006_NotifyTip( sceneId, selfId, "Trß¾c m¡t chï m· thång c¤p ðªn c¤p 10")	
		return
		end
		if GongXun >= 2000 then
	        SetMissionData( sceneId, selfId, XIAYIN_GONGXUN, GongXun-2000 )
		SetMissionData( sceneId, selfId, XIAYIN_HS ,GetMissionData( sceneId, selfId, XIAYIN_HS )+1);
                x880006_AddXiaYinBuff(sceneId, selfId)
		x880006_HXY_E(sceneId, selfId)
		x880006_NotifyTip( sceneId, selfId, "Thång c¤p thành công!")
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		else
		x880006_NotifyTip( sceneId, selfId, "Ði¬m c¯ng hiªn cüa các hÕ không ðü 2000, ta không có cách nào giúp các hÕ thång c¤p!")
		end
	end		

end


--**********************************
--Òýµ¼ÐÄÌø´¦ÀíÈë¿Ú£º
--Òýµ¼¼¼ÄÜ»áÔÚÃ¿´ÎÐÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌÐøÏÂ´ÎÐÄÌø£»0£ºÖÐ¶ÏÒýµ¼¡£
function x880006_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--*****************
function x880006_AddXiaYinBuff(sceneId, selfId)
	local sang=GetMissionData( sceneId, selfId, XIAYIN_SG )
	local fengy=GetMissionData( sceneId, selfId, XIAYIN_FY )
	local weik=GetMissionData( sceneId, selfId, XIAYIN_WK )
	local shim=GetMissionData( sceneId, selfId, XIAYIN_SM )
	local mab=GetMissionData( sceneId, selfId, XIAYIN_MB )
	local fengx=GetMissionData( sceneId, selfId, XIAYIN_FX )
	local huns=GetMissionData( sceneId, selfId, XIAYIN_HS )

	  sangBuff = 32410 + sang
	 fengyBuff = 32424 + fengy
	  weikBuff = 32438 + weik
	  shimBuff = 32452 + shim
	   mabBuff = 32466 + mab
	 fengxBuff = 32480 + fengx
	  hunsBuff = 32494 + huns

	if sang>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, sangBuff, 0)
	end
	if fengy>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, fengyBuff, 0)
	end
	if weik>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, weikBuff, 0)
	end
	if shim>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, shimBuff, 0)
	end
	if mab>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, mabBuff, 0)
	end
	if fengx>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, fengxBuff, 0)
	end
	if huns>0 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, hunsBuff, 0)
	end
end

