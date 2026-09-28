-- phßþng minh NPC
-- tiêu h± 
-- trang b¸ thång linh 
x044800_g_scriptId  =  044800
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x044800_OnDefaultEvent(  sceneId,  selfId,targetId  )
      local  myLevel  =  GetLevel(sceneId,  selfId)
      if  myLevel  <  85  then
                BeginEvent(sceneId)
	 	 AddText(sceneId,  "        c¤p b§c cüa ngß½i th¤p h½n 85 c¤p , không th¬ sØ døng trang b¸ thång linh chÑc nång .")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
            return
      end

	 BeginEvent(sceneId)
	 	 AddText(sceneId,"        #W Vß½ng Quy«n Võng Thª , Thiên ÐÕo Phúc Phän , CØu Ðïnh Giáng Thª , TØ Vi Khäi Hoàn . #r        #W Th¶i bu±i loÕn thª , anh hùng nhß các hÕ nên c¥n có sÑc mÕnh cüa Vß½ng Quy«n - Thiên ÐÕo m¾i có th¬ hi®u l®nh thiên hÕ, nªu mu¯n chï c¥n có ")
	 	 AddText(sceneId,"        #W#G TØ Vi Linh Phách #W , ta s¨ giúp ngß½i lên c¤p Trang B¸ #cFF0000Vß½ng Quy«n- Thiên ÐÕo #W  , tung hoành thiên hÕ , ngang d÷c ð¤t tr¶i ! ")
	 	 AddText(sceneId," #ef12345#YTØ Vi Linh Phách r¾t tÕi Túc C¥u và Tam Th¥n Äo Cänh, rß½ng Tam Th¥n Äo Cänh")	
	 	 AddNumText(  sceneId,  x044800_g_ScriptId,  " #cFF0000Thång Linh Vß½ng Quy«n ",6,1)
		 AddNumText(  sceneId,  x044800_g_ScriptId,  " #cFF0000Vuong Quy«n tiªn c¤p Thiên ÐÕo ",6,3)
	 	 AddNumText(  sceneId,  x044800_g_ScriptId,  " #cFF0000Thång Linh Thiên ÐÕo ",6,2)
	 	 AddNumText(  sceneId,  x044800_g_ScriptId,  " #GThång Linh Di D¶i ",6,4)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x044800_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 if  GetNumText()  ==  1  then
	       BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,targetId);
	             EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  201708093)
                      return
                end

	 if  GetNumText()  ==  2  then
	       BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,targetId);
	             EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  201708097)
                      return
                end

	 if  GetNumText()  ==  3  then
	       BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,targetId);
	             EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  20170526)
                      return
                end

	 if  GetNumText()  ==  4  then
	       BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,targetId);
                            UICommand_AddInt(  sceneId,8)
	             EndUICommand(sceneId  )
	       DispatchUICommand(sceneId,selfId,  20090721    )
                      return
                end


	 if  GetNumText()  >=  5  then
	       BeginEvent(sceneId)
	 	 AddText(sceneId,"        này chÑc nång h§u kÏ m· ra , t§n tình mong ðþi ! ")
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId,targetId)
                      return
                end
end