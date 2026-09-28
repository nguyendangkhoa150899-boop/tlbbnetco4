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
	 	 AddText(sceneId,"        #G Tam th¥n äo cänh làm g¯c dùng/u¯ng ðµ khó cao nh¤t ðích phó bän . boss tß½ng ð¯i cß¶ng ðÕi , xin/m¶i c¦n th§n ði trß¾c ! #r#W ðánh chªt phó bän bên trong toàn bµ BOSS , nhßng r½i xu¯ng #G ngày ? ð¸a ? ngß¶i tam bäo rß½ng #W , #r m· ra #G chæ thiên bäo rß½ng #W , c¥n #G[ côn ta tiên thßþc ]#W mµt quä #r m· ra #G ð¸a chæ bäo rß½ng #W , c¥n #G[ côn ta bí thßþc ]#W mµt quä #r m· ra #G ngß¶i chæ bäo rß½ng #W , không c¥n tiêu hao cái chìa khóa . ")
	 	 AddText(sceneId,"        bäo rß½ng c¤p b§c càng cao , ðÕt ðßþc ðích l­ v§t càng phong phú . m²i vai trò m²i ngày chï có th¬ m· ra mµt l¥n bäo rß½ng . ")
	 	 AddNumText(sceneId,  x044801_g_ScriptId,"100.000 nguyên bäo mua [Côn Nga tiên thßþc ]",  6,  100)
	 	 AddNumText(sceneId,  x044801_g_ScriptId,"50.0000 nguyên bäo mua [Côn Ngô bí thßþc ]",  6,  200)
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
                      x044801_NotifyTip(  sceneId,  selfId," xin/m¶i giæ væng ðÕo cø lan ít nh¤t 5 cá ch² tr¯ng "  )
	       return	 
                end

	 if  GetNumText()  ==  100  then
                      local  yb  =  YuanBao(sceneId,selfId,targetId,3,0)
                      if  yb  <  100000  then
                            x044801_NotifyTip(  sceneId,  selfId," ngài nguyên bäo chßa ðü 10 vÕn ði¬m không cách nào mua "  )	 
                      return
                      end	 
	       if  YuanBao(sceneId,selfId,targetId,2,100000)  ~=  0  then
	             x044801_NotifyTip(  sceneId,  selfId," nguyên bäo kh¤u tr× th¤t bÕi , ngài không th¬ l¤y ðßþc cái chìa khóa "  )	 
	       return
	       end
                      TryRecieveItem(  sceneId,  selfId,  38001514,  1  )
	       x044801_NotifyTip(  sceneId,  selfId," chúc m×ng ngài , thu ðßþc [ côn ta tiên thßþc ] , có th¬ dùng v¾i m· ra chæ thiên s¯ bäo rß½ng "  )
                  return
                  end

	 if  GetNumText()  ==  200  then
                      local  yb  =  YuanBao(sceneId,selfId,targetId,3,0)
                      if  yb  <  50000  then
                            x044801_NotifyTip(  sceneId,  selfId," ngài nguyên bäo chßa ðü 5 vÕn ði¬m không cách nào mua "  )	 
                      return
                      end	 
	       if  YuanBao(sceneId,selfId,targetId,2,50000)  ~=  0  then
	             x044801_NotifyTip(  sceneId,  selfId," nguyên bäo kh¤u tr× th¤t bÕi , ngài không th¬ l¤y ðßþc cái chìa khóa "  )	 
	       return
	       end
                      TryRecieveItem(  sceneId,  selfId,  38001515,  1  )
	       x044801_NotifyTip(  sceneId,  selfId," chúc m×ng ngài , thu ðßþc [ côn ta bí thßþc ] , có th¬ dùng v¾i m· ra ð¸a chæ s¯ bäo rß½ng "  )
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