-- lâu lan NPC....  
-- Phiªu Mi¬u Phong tiªp dçn khiªn cho ....

-- chân v¯n s¯ 
x044801_g_ScriptId  =  044801


-- có sñ ki®n ID li®t bi¬u 
x044801_g_eventList={894000}
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x044801_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText( sceneId, "#GTam Th\165n \196o C\228nh#W l\224 ph\243 b\228n kh\243 nh\164t, 3 boss r\164t m\213nh, h\227y chu\166n b\184 k\219! C\165n t\177 \240\181i, m\247i ng\223\182i t\215 c\164p 80, m\178i ng\224y t\175i \240a 5 l\223\254t." ) AddText( sceneId, "H\213 boss s\168 xu\164t hi\174n 3 r\223\189ng #YThi\234n, \208\184a, Nh\226n#W:#r- R\223\189ng Thi\234n: c\165n 1 #G[C\244n Ng\244 Ti\234n Th\223\254c]#W (qu\224 nhi\171u nh\164t)#r- R\223\189ng \208\184a: c\165n 1 #G[C\244n Ng\244 B\237 Th\223\254c]#W#r- R\223\189ng Nh\226n: #Gmi\173n ph\237#W" )   -- [NetCo4 02/10] 255 byte/chuoi, cu dai 455 -> client cat
	 	 AddText( sceneId, "M\178i nh\226n v\167t m\178i ng\224y ch\239 m\183 \240\223\254c #R1#W trong 3 r\223\189ng, m\183 r\176i th\236 kh\244ng m\183 \240\223\254c r\223\189ng kh\225c." )   -- [NetCo4 02/10]
	 	 AddNumText( sceneId, x044801_g_ScriptId, "Mua [C\244n Ng\244 Ti\234n Th\223\254c] - 100.000 KNB", 6, 100 )   -- [NetCo4 02/10]
	 	 AddNumText( sceneId, x044801_g_ScriptId, "Mua [C\244n Ng\244 B\237 Th\223\254c] - 50.000 KNB", 6, 200 )   -- [NetCo4 02/10] cu ghi 50.0000
	 	 for  i,  eventId  in  x044801_g_eventList  do
	 	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x044801_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x044801_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x044801_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )


                if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  5  then
                      x044801_NotifyTip( sceneId, selfId, "C\165n \237t nh\164t 5 \244 tr\175ng trong t\250i \240\213o c\248." )   -- [NetCo4 02/10]
	       return	 
                end

	 if  GetNumText()  ==  100  then
                      local  yb  =  YuanBao(sceneId,selfId,targetId,3,0)
                      if  yb  <  100000  then
                            x044801_NotifyTip( sceneId, selfId, "KNB c\252a c\225c h\213 ch\223a \240\252 100.000, kh\244ng mua \240\223\254c." )   -- [NetCo4 02/10]
                      return
                      end	 
	       if  YuanBao(sceneId,selfId,targetId,2,100000)  ~=  0  then
	             x044801_NotifyTip( sceneId, selfId, "Tr\215 KNB th\164t b\213i, ch\223a mua \240\223\254c ch\236a." )   -- [NetCo4 02/10]
	       return
	       end
                      TryRecieveItem(  sceneId,  selfId,  38001514,  1  )
	       x044801_NotifyTip( sceneId, selfId, "\208\227 mua 1 [C\244n Ng\244 Ti\234n Th\223\254c], d\249ng \240\172 m\183 R\223\189ng Thi\234n trong Tam Th\165n \196o C\228nh." )   -- [NetCo4 02/10]
                  return
                  end

	 if  GetNumText()  ==  200  then
                      local  yb  =  YuanBao(sceneId,selfId,targetId,3,0)
                      if  yb  <  50000  then
                            x044801_NotifyTip( sceneId, selfId, "KNB c\252a c\225c h\213 ch\223a \240\252 50.000, kh\244ng mua \240\223\254c." )   -- [NetCo4 02/10]
                      return
                      end	 
	       if  YuanBao(sceneId,selfId,targetId,2,50000)  ~=  0  then
	             x044801_NotifyTip( sceneId, selfId, "Tr\215 KNB th\164t b\213i, ch\223a mua \240\223\254c ch\236a." )   -- [NetCo4 02/10]
	       return
	       end
                      TryRecieveItem(  sceneId,  selfId,  38001515,  1  )
	       x044801_NotifyTip( sceneId, selfId, "\208\227 mua 1 [C\244n Ng\244 B\237 Th\223\254c], d\249ng \240\172 m\183 R\223\189ng \208\184a trong Tam Th\165n \196o C\228nh." )   -- [NetCo4 02/10]
                  return
                  end


	 for  i,  findId  in  x044801_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId,  GetNumText(),x044801_g_ScriptId  )
	 	 return
	 	 end
	 end
end

--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x044801_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end