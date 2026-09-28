-- Tô Châu NPC
-- vân b¯n hþp 
-- thú h°n phø th¬ 
x001087_g_ScriptId  =  001087        -- hÕt tØ luy®n chª     QQ718805400
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x001087_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"        Trân thú không chï có th¬ hi®p trþ chü nhân chiªn ð¤u, còn có th¬ l¤y thú h°n phø th¬ ngñ chü nhân, v×a có th¬ làm chü nhân ð©p trai xinh gái mà còn có th¬ tång lên s¯ ít thuµc tính cho chü nhân. Các hÕ có th¬ sØ døng #G Dung H°n Ðan #W")
	 	 AddText(sceneId,"sØa ð±i trân thú phø hình th¬ thái, sau ðó có th¬ ðªn ch² này cüa ta sØ døng #G Huy­n H°n Ðan #W tiªn hành thay ð±i màu s¡c phø th¬, lña ch÷n màu s¡c tuy®t ð©p cho mình!")
	 	 AddNumText(sceneId,  x001087_g_scriptId,"#cffcc00 Thay Ð±i Màu S¡c Phø Th¬ Thú H°n BUFF ",  6,  1)
		 --AddNumText(sceneId,  x001087_g_scriptId,"#cffcc00 test phu the ",  6,  2)
		 --AddNumText(sceneId,  x001087_g_scriptId,"#cffcc00 ADD phu the ",  6,  3)
		-- AddNumText(sceneId,  x001087_g_scriptId,"#cffcc00 Huy phu the ",  6,  4)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- t¥m xa ði«u døng 
--**********************************
function  x001087_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
      local  key=GetNumText()
      local  OldHetiBuff  =  GetMissionData(sceneId,  selfId,HETI_BUFF)
      local  hetibuff  =  {}
          if  key  ==  1  then
                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30900200)  <  1  then
                      x001087_NotifyFailTips(  sceneId,  selfId,  " Các hÕ thiªu  Huy­n H°n Ðan, không th¬ thay ð±i màu s¡c thú h°n phø th¬ "  )
                      return
                end
              if  OldHetiBuff  <  1401  or  OldHetiBuff  >  1436  then
                      x001087_NotifyFailTips(  sceneId,  selfId,  " xin hãy sØ døng[ Dung H°n Ðan ]ch¸n phø th¬ loÕi gì trß¾c, sau m¾i có th¬ thay ð±i màu s¡c phø th¬ thú h°n"  )
                     return
                end
                if  LuaFnDelAvailableItem(sceneId,selfId,30900200,1)  <  1  then
                      x001087_NotifyFailTips(  sceneId,  selfId,  " Các hÕ thiªu  Huy­n H°n Ðan, ho£c huy­n h°n ðan ðã b¸ khoá "  )
                      return
                end

                if  OldHetiBuff  >=  1401  and  OldHetiBuff  <  1410  then
                            hetibuff  =  random(1401,1409)
                elseif  OldHetiBuff  >=  1410  and  OldHetiBuff  <  1419  then
                            hetibuff  =  random(1410,1418)
                elseif  OldHetiBuff  >=  1419  and  OldHetiBuff  <  1428  then
                            hetibuff  =  random(1419,1427)
                elseif  OldHetiBuff  >=  1428  and  OldHetiBuff  <=  1436  then
                            hetibuff  =  random(1428,1436)
                end
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,1400,0)
				SetMissionData(sceneId,  selfId,  HETI_BUFF,hetibuff  )
                x001087_NotifyFailTips(  sceneId,  selfId,  " huy­n s¡c thành công , phø m£t ngoài ðã sØa ð±i , xin/m¶i · trân thú gi¾i m£t l¥n næa phø th¬ là ðßþc . "  )
        end
		if key ==2 then 
		local  OldHetiBuff  =  GetMissionData(sceneId,  selfId,HETI_BUFF)
		x001087_NotifyFailTips(  sceneId,  selfId, OldHetiBuff)
		end
		if key ==3 then 
		local  hetibuff  =  {}
		hetibuff  =  random(1410,1436)
		SetMissionData(sceneId,  selfId,  HETI_BUFF,hetibuff  )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,hetibuff,0)
		end
		if key == 4 then
		for i = 1400,1436 do 
              LuaFnCancelSpecificImpact(sceneId,selfId,i)
		end
		end
		
end

--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x001087_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end