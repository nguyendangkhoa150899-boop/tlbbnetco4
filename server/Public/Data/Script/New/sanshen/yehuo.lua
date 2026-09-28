-- Tam th¥n bäo rß½ng NPC-- hÕt tØ luy®n chª     QQ718805400
x894007_g_ScriptId  =  894007

x894007_g_BoxT  ={20310168,30600084,30600084,38000448,38000950,  38001103,20301010,39901012,20501008,20502008,  39910003,39910003,39910003,39910003,39910005}  -- kim tàm ti ? cØu thiên ng÷c tu±i ? tØ vi linh rách ? nåm ðµc châu ?40 cß¶ng hóa ? thánh thú chi h°n ? thiên ð¸a huy«n tinh 
x894007_g_BoxD  ={20310168,30600084,30600084,38000448,38000950,  38001103,38000531,10156100,20501007,20502007,  39910002,39910003,39910003,39910003,39910003}
x894007_g_BoxR  ={20310168,30600084,30600084,38000448,38000950,  38001103,30505806,30501171,20501006,20502006,  39910001,39910002,39910003,39910003,39910003}

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x894007_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	       local  BoxName  =  GetName(sceneId,targetId)
	       if  BoxName  ==  "Tam Th¥n Bäo Rß½ng · ngày"  then
	             AddText(  sceneId,"        bäo này rß½ng là äo cänh tinh hoa nh¤t ch² · , ngû hành lñc mãnh li®t mênh mông , kÏ bên trong s· ng§m #Y cØu thiên ng÷c b¬ #W nh¤t là phong phú , nhßng c¥n l¤y ðÕi lßþng #G côn ta lñc #W vi dçn lÕi v×a m· ra . #r        #G ti¬u ð« kÏ : m· ra bäo này rß½ng c¥n tiêu hao côn ta tiên thßþc 1 cá , thä m· ra sau không cách nào m· ra nhæng khác Tam th¥n bäo rß½ng . "  )
	             AddNumText(  sceneId,  x894007_g_ScriptId,  " m· ra chæ thiên bäo rß½ng ",  6,  1  )
                      elseif  BoxName  ==  "Tam Th¥n Bäo Rß½ng · ð¸a"  then
	             AddText(  sceneId,"        bäo này rß½ng tø ðÕi lßþng äo cänh chi tinh hoa , ngû hành lñc hòa hþp lßþn quanh , kÏ bên trong s· ng§m #Y cØu thiên ng÷c b¬ #W h½i phong phú , nhßng c¥n l¤y khá nhi«u ðích côn ta lñc vi dçn lÕi v×a m· ra . #r        #G ti¬u ð« kÏ : m· ra bäo này rß½ng c¥n tiêu hao côn ta bí thßþc 1 cá , thä m· ra sau không cách nào m· ra nhæng khác Tam th¥n bäo rß½ng . "  )
	             AddNumText(  sceneId,  x894007_g_ScriptId,  " m· ra ð¸a chæ bäo rß½ng ",  6,  2  )
                      else
	             AddText(  sceneId,"        bäo này rß½ng tø äo cänh chi tinh hoa , ngû hành lñc m½ h° lµ ra , kÏ bên trong s· ng§m #Y cØu thiên ng÷c b¬ #W , ðánh bÕi Tam th¥n huy­n tßþng là ðßþc m· ra . #r        #G ti¬u ð« kÏ : m· ra bäo này rß½ng không c¥n tiêu hao côn ta bí thßþc , nhßng m· ra sau không cách nào m· ra nhæng khác Tam th¥n bäo rß½ng . "  )
	             AddNumText(  sceneId,  x894007_g_ScriptId,  " m· ra ngß¶i chæ bäo rß½ng ",  6,  3  )
	       end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x894007_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

                if  GetMissionData(sceneId,selfId,VIP_SHENMI_SHOP)  ==  GetDayTime()  then
                      x894007_NotifyTip(  sceneId,  selfId,  "#H M²i ngày chï ðßþc m· 1 l¥n  Tam th¥n bäo rß½ng , không cách nào l¥n næa m· ra ! ")
                return
                end

                if  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  4  or  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  4  then
	       x894007_NotifyTip(  sceneId,  selfId," xin/m¶i giæ væng tài li®u lan cùng ðÕo cø lan ít nh¤t các 4 cá ch² tr¯ng "  )
	 return	 
                end

	 if  GetNumText()  ==  1  then
                      if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38001514)  <  1  then
	             BeginEvent(sceneId)
	             AddText(  sceneId,"        mu¯n l¤y ðßþc này trong rß½ng #G ngû hành chi bäo #W , c¥n l¤y [ côn ta tiên thßþc ] vi dçn lÕi v×a . ngài trên ngß¶i vô này côn ta chi thßþc , không cách nào m· ra bäo này rß½ng , ngài nhßng m· ra #G Tam th¥n bäo rß½ng · ngß¶i #W , nên bäo rß½ng m£c dù s· tàng bäo v§t ít , nhßng không c¥n tiêu hao #Y côn ta chi thßþc #W là ðßþc m· ra . "  )
	             EndEvent(sceneId)
	             DispatchEventList(sceneId,selfId,targetId)
                      return
                      end
                      if  LuaFnDelAvailableItem(sceneId,selfId,38001514,1)  ~=  1  then
	             BeginEvent(sceneId)
                            AddText(  sceneId,"        [ côn ta tiên thßþc ] kh¤u tr× th¤t bÕi , nên v§t ph¦m có th¬ khóa ðßþc . "  )
                      return
                      end

                      local  a  =  random(1,5)
                      local  b  =  random(6,10)
                      local  c  =  random(11,15)
                      for  i  =  1,20  do
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxT[a],  1  )
                      end
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxT[b],  1  )
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxT[c],  1  )
                              SetMissionData(sceneId,selfId,VIP_SHENMI_SHOP,GetDayTime())
                              LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	               x894007_NotifyTip(  sceneId,  selfId,"Chúc m×ng ngß½i , ðÕt ðßþc #{_ITEM"..x894007_g_BoxT[a].."}*20 cái #{_ITEM"..x894007_g_BoxT[b].."}  cái và #{_ITEM"..x894007_g_BoxT[c].."}"  )
                              x894007_CloseMe(sceneId,  selfId)
              return
              end


	 if  GetNumText()  ==  2  then
                      if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38001515)  <  1  then
	             BeginEvent(sceneId)
	             AddText(  sceneId,"        mu¯n l¤y ðßþc này trong rß½ng #G ngû hành chi bäo #W , c¥n l¤y [ côn ta bí thßþc ] vi dçn lÕi v×a . ngài trên ngß¶i vô này côn ta chi thßþc , không cách nào m· ra bäo này rß½ng , ngài nhßng m· ra #G Tam th¥n bäo rß½ng · ngß¶i #W , nên bäo rß½ng m£c dù s· tàng bäo v§t ít , nhßng không c¥n tiêu hao #Y côn ta chi thßþc #W là ðßþc m· ra . "  )
	             EndEvent(sceneId)
	             DispatchEventList(sceneId,selfId,targetId)
                      return
                      end
                      if  LuaFnDelAvailableItem(sceneId,selfId,38001515,1)  ~=  1  then
	             BeginEvent(sceneId)
                            AddText(  sceneId,"        [ côn ta bí thßþc ] kh¤u tr× th¤t bÕi , nên v§t ph¦m có th¬ khóa ðßþc . "  )
                      return
                      end

                      local  a  =  random(1,5)
                      local  b  =  random(6,10)
                      local  c  =  random(11,15)
                      for  i  =  1,10  do
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxD[a],  1  )
                      end
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxD[b],  1  )
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxD[c],  1  )
                              SetMissionData(sceneId,selfId,VIP_SHENMI_SHOP,GetDayTime())
                              LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	               x894007_NotifyTip(  sceneId,  selfId," chúc m×ng ngß½i , ðÕt ðßþc #{_ITEM"..x894007_g_BoxD[a].."}*10 cái #{_ITEM"..x894007_g_BoxD[b].."} cái và #{_ITEM"..x894007_g_BoxD[c].."}"  )
                              x894007_CloseMe(sceneId,  selfId)
              return
              end


	 if  GetNumText()  ==  3  then
					if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38001514)  <  1  then
	             BeginEvent(sceneId)
	             AddText(  sceneId,"        mu¯n l¤y ðßþc này trong rß½ng #G ngû hành chi bäo #W , c¥n l¤y [ côn ta tiên thßþc ] vi dçn lÕi v×a . ngài trên ngß¶i vô này côn ta chi thßþc , không cách nào m· ra bäo này rß½ng , ngài nhßng m· ra #G Tam th¥n bäo rß½ng · ngß¶i #W , nên bäo rß½ng m£c dù s· tàng bäo v§t ít , nhßng không c¥n tiêu hao #Y côn ta chi thßþc #W là ðßþc m· ra . "  )
	             EndEvent(sceneId)
	             DispatchEventList(sceneId,selfId,targetId)
                      return
                      end
                      if  LuaFnDelAvailableItem(sceneId,selfId,38001514,1)  ~=  1  then
	             BeginEvent(sceneId)
                            AddText(  sceneId,"        [ côn ta tiên thßþc ] kh¤u tr× th¤t bÕi , nên v§t ph¦m có th¬ khóa ðßþc . "  )
                      return
                      end	
                      local  a  =  random(1,5)
                      local  b  =  random(6,10)
                      local  c  =  random(11,15)
                      for  i  =  1,10  do
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxR[a],  1  )
                      end
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxR[b],  1  )
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxR[c],  1  )
                              SetMissionData(sceneId,selfId,VIP_SHENMI_SHOP,GetDayTime())
                              LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	               x894007_NotifyTip(  sceneId,  selfId," chúc m×ng ngß½i , ðÕt ðßþc #{_ITEM"..x894007_g_BoxR[a].."}*10 cái #{_ITEM"..x894007_g_BoxR[b].."} cái và #{_ITEM"..x894007_g_BoxR[c].."}"  )
                              x894007_CloseMe(sceneId,  selfId)
              return
              end
end

--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x894007_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- t¡t ð¯i thoÕi khuông 
--**********************************
function  x894007_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end