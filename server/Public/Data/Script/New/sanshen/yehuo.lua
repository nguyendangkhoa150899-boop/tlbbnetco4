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
	             AddText( sceneId, "R\223\189ng #YThi\234n#W: ch\209a nhi\171u b\228o v\167t nh\164t. C\165n 1 #G[C\244n Ng\244 Ti\234n Th\223\254c]#W \240\172 m\183.#rM\183 r\223\189ng n\224y r\176i th\236 h\244m nay kh\244ng m\183 \240\223\254c r\223\189ng Tam Th\165n kh\225c." )   -- [NetCo4 02/10] cu dai 370 byte
	             AddNumText( sceneId, x894007_g_ScriptId, "M\183 R\223\189ng Thi\234n", 6, 1 )
                      elseif  BoxName  ==  "Tam Th¥n Bäo Rß½ng · ð¸a"  then
	             AddText( sceneId, "R\223\189ng #Y\208\184a#W: ch\209a kh\225 nhi\171u b\228o v\167t. C\165n 1 #G[C\244n Ng\244 B\237 Th\223\254c]#W \240\172 m\183.#rM\183 r\223\189ng n\224y r\176i th\236 h\244m nay kh\244ng m\183 \240\223\254c r\223\189ng Tam Th\165n kh\225c." )   -- [NetCo4 02/10]
	             AddNumText( sceneId, x894007_g_ScriptId, "M\183 R\223\189ng \208\184a", 6, 2 )
                      else
	             AddText( sceneId, "R\223\189ng #YNh\226n#W: ph\165n th\223\183ng cho ng\223\182i h\213 \240\223\254c Tam Th\165n huy\173n t\223\254ng, #Gkh\244ng c\165n ch\236a#W.#rM\183 r\223\189ng n\224y r\176i th\236 h\244m nay kh\244ng m\183 \240\223\254c r\223\189ng Tam Th\165n kh\225c." )   -- [NetCo4 02/10]
	             AddNumText( sceneId, x894007_g_ScriptId, "M\183 R\223\189ng Nh\226n (mi\173n ph\237)", 6, 3 )
	       end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x894007_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

                if x894007_DaMo( sceneId, selfId ) == 1 then   -- [NetCo4 02/10] truoc dung VIP_SHENMI_SHOP (426) chung voi doan reset vip o scene.lua -> dang nhap lai la mo tiep duoc
                      x894007_NotifyTip( sceneId, selfId, "H\244m nay c\225c h\213 \240\227 m\183 1 r\223\189ng Tam Th\165n r\176i, mai h\227y quay l\213i." )
                return
                end

                if  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  4  or  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  4  then
	       x894007_NotifyTip( sceneId, selfId, "C\165n \237t nh\164t 4 \244 tr\175ng \183 t\250i nguy\234n li\174u v\224 4 \244 \183 t\250i \240\213o c\248." )   -- [NetCo4 02/10]
	 return	 
                end

	 if  GetNumText()  ==  1  then
                      if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38001514)  <  1  then
	             BeginEvent(sceneId)
	             AddText( sceneId, "C\165n 1 #G[C\244n Ng\244 Ti\234n Th\223\254c]#W \240\172 m\183 R\223\189ng Thi\234n. Mua \183 Th\223\189ng L\229ng T\216 (Ph\223\254ng Minh Tr\164n), ho\163c m\183 #GR\223\189ng Nh\226n#W mi\173n ph\237." )   -- [NetCo4 02/10]
	             EndEvent(sceneId)
	             DispatchEventList(sceneId,selfId,targetId)
                      return
                      end
                      if  LuaFnDelAvailableItem(sceneId,selfId,38001514,1)  ~=  1  then
	             x894007_NotifyTip( sceneId, selfId, "Tr\215 [C\244n Ng\244 Ti\234n Th\223\254c] th\164t b\213i (v\167t ph\166m c\243 th\172 \240ang b\184 kh\243a)." )   -- [NetCo4 02/10] cu BeginEvent khong EndEvent -> khong hien
                            -- AddText(  sceneId,"        [ côn ta tiên thßþc ] kh¤u tr× th¤t bÕi , nên v§t ph¦m có th¬ khóa ðßþc . "  )
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
                              x894007_GhiDaMo( sceneId, selfId )   -- [NetCo4 02/10]
                              LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	               x894007_NotifyTip( sceneId, selfId, "Ch\250c m\215ng! Nh\167n \240\223\254c ".."#{_ITEM"..x894007_g_BoxT[a].."} x20, #{_ITEM"..x894007_g_BoxT[b].."} ".."v\224 ".."#{_ITEM"..x894007_g_BoxT[c].."}" )   -- [NetCo4 02/10]
                              x894007_CloseMe(sceneId,  selfId)
              return
              end


	 if  GetNumText()  ==  2  then
                      if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38001515)  <  1  then
	             BeginEvent(sceneId)
	             AddText( sceneId, "C\165n 1 #G[C\244n Ng\244 B\237 Th\223\254c]#W \240\172 m\183 R\223\189ng \208\184a. Mua \183 Th\223\189ng L\229ng T\216 (Ph\223\254ng Minh Tr\164n), ho\163c m\183 #GR\223\189ng Nh\226n#W mi\173n ph\237." )   -- [NetCo4 02/10]
	             EndEvent(sceneId)
	             DispatchEventList(sceneId,selfId,targetId)
                      return
                      end
                      if  LuaFnDelAvailableItem(sceneId,selfId,38001515,1)  ~=  1  then
	             x894007_NotifyTip( sceneId, selfId, "Tr\215 [C\244n Ng\244 B\237 Th\223\254c] th\164t b\213i (v\167t ph\166m c\243 th\172 \240ang b\184 kh\243a)." )   -- [NetCo4 02/10]
                            -- AddText(  sceneId,"        [ côn ta bí thßþc ] kh¤u tr× th¤t bÕi , nên v§t ph¦m có th¬ khóa ðßþc . "  )
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
                              x894007_GhiDaMo( sceneId, selfId )   -- [NetCo4 02/10]
                              LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	               x894007_NotifyTip( sceneId, selfId, "Ch\250c m\215ng! Nh\167n \240\223\254c ".."#{_ITEM"..x894007_g_BoxD[a].."} x10, #{_ITEM"..x894007_g_BoxD[b].."} ".."v\224 ".."#{_ITEM"..x894007_g_BoxD[c].."}" )   -- [NetCo4 02/10]
                              x894007_CloseMe(sceneId,  selfId)
              return
              end


	 if  GetNumText()  ==  3  then
					-- if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38001514)  <  1  then   -- [NetCo4 02/10] Ruong Nhan MIEN PHI (dung chu cua ruong); cu doi Con Ngo Tien Thuoc 100.000 KNB
	             -- BeginEvent(sceneId)
	             -- AddText(  sceneId,"        mu¯n l¤y ðßþc này trong rß½ng #G ngû hành chi bäo #W , c¥n l¤y [ côn ta tiên thßþc ] vi dçn lÕi v×a . ngài trên ngß¶i vô này côn ta chi thßþc , không cách nào m· ra bäo này rß½ng , ngài nhßng m· ra #G Tam th¥n bäo rß½ng · ngß¶i #W , nên bäo rß½ng m£c dù s· tàng bäo v§t ít , nhßng không c¥n tiêu hao #Y côn ta chi thßþc #W là ðßþc m· ra . "  )
	             -- EndEvent(sceneId)
	             -- DispatchEventList(sceneId,selfId,targetId)
                      -- return
                      -- end
                      -- if  LuaFnDelAvailableItem(sceneId,selfId,38001514,1)  ~=  1  then
	             -- BeginEvent(sceneId)
                            -- AddText(  sceneId,"        [ côn ta tiên thßþc ] kh¤u tr× th¤t bÕi , nên v§t ph¦m có th¬ khóa ðßþc . "  )
                      -- return
                      -- end	
                      local  a  =  random(1,5)
                      local  b  =  random(6,10)
                      local  c  =  random(11,15)
                      for  i  =  1,10  do
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxR[a],  1  )
                      end
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxR[b],  1  )
                              TryRecieveItem(  sceneId,  selfId,  x894007_g_BoxR[c],  1  )
                              x894007_GhiDaMo( sceneId, selfId )   -- [NetCo4 02/10]
                              LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	               x894007_NotifyTip( sceneId, selfId, "Ch\250c m\215ng! Nh\167n \240\223\254c ".."#{_ITEM"..x894007_g_BoxR[a].."} x10, #{_ITEM"..x894007_g_BoxR[b].."} ".."v\224 ".."#{_ITEM"..x894007_g_BoxR[c].."}" )   -- [NetCo4 02/10]
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

--**********************************
-- [NetCo4 02/10] co "hom nay da mo 1 ruong Tam Than": luu trong SANSHENHUANJING_COUNT (294) cua chinh pho ban
-- (gia tri = ngay*100 + so lan vao; phan so lan +50 = da mo ruong). efuben_sanshen.lua dem lan vao bang mod(...,50).
--**********************************
function x894007_DaMo( sceneId, selfId )
	local v = GetMissionData( sceneId, selfId, SANSHENHUANJING_COUNT )
	if floor( v / 100 ) == GetDayTime() and mod( v, 100 ) >= 50 then
		return 1
	end
	return 0
end

function x894007_GhiDaMo( sceneId, selfId )
	local v = GetMissionData( sceneId, selfId, SANSHENHUANJING_COUNT )
	local d = GetDayTime()
	local n = 0
	if floor( v / 100 ) == d then
		n = mod( v, 100 )
	end
	if n < 50 then
		n = n + 50
	end
	SetMissionData( sceneId, selfId, SANSHENHUANJING_COUNT, d * 100 + n )
end
