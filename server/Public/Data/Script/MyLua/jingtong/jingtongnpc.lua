-- LÕc Dß½ng NPC
-- tr¥n phu chi 
-- bình thß¶ng 

-- chân v¯n s¯ 
x890088_g_scriptId  =  890088

-- møc tiêu NPC
x890088_g_name	 =" Ð©p Zai "

-- có sñ ki®n ID li®t bi¬u   { kªt bái , giäi tr× kªt bái , cßÞng chª giäi tr× kªt bái }
x890088_g_RelationEventList={}
x890088_g_zhenyuandata  =  {MD_ZHENYUANMISS1,MD_ZHENYUANMISS2,MD_ZHENYUANMISS3,MD_ZHENYUANMISS4,MD_ZHENYUANMISS5,MD_ZHENYUANMISS6}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************


function  x890088_Tips(  sceneId,  selfId,  str  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end


function  x890088_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"    #{ZBSX_130625_41}")
		 AddText(sceneId,"    #cFF0000 Lßu ý: hãy t¦y tinh thông và lña ch÷n thuµc tính tinh thông cho phù hþp trß¾c khi nâng c¤p tinh thông, s¨ không th¬ thay ð±i thuµc tính tinh thông c¤p 10")	 
	 	 --AddText(sceneId," #ef12345#YChÑc Nång tÕm chßa m·")	
		--local ID = LuaFnGetGUID( sceneId, selfId )
		--if ID == 1010000044  or	ID == 1010000003  	then		 
	 	 --AddNumText(  sceneId,  x890088_g_scriptId,  " Lò Ly Höa ",  6,  1  )
		 AddNumText(  sceneId,  x890088_g_scriptId,  " Hþp Kim Tinh ThÕch ",  6,  2  )
	 	 AddNumText(  sceneId,  x890088_g_scriptId,  " Tinh Thông - T¦y Luy®n Trang B¸ ",  6,  3  )
	 	 AddNumText(  sceneId,  x890088_g_scriptId,  " Thång C¤p Tinh Tông ",  6,  4  )
	 	 AddNumText(  sceneId,  x890088_g_scriptId,  " Di Chuy¬n Tinh Thông ",  6,  5  )
	 	 --AddNumText(  sceneId,  x890088_g_scriptId,  " Phân Giäi Trang B¸ ",  6,  6  )
		 		--end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x890088_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,  MF_TW_SCHOOLUNIFORM_JOIN  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nDayCount1  =  GetMissionData(  sceneId,  selfId,  MF_TW_EXPDAN10  )
	 local  nCount1  =  GetLowWord(  nDayCount1  )	 
	 
	 	 
	 
	 
	 
	 
	 
	 if  GetNumText()  ==  1  then
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  targetId  )
	 UICommand_AddInt(  sceneId,  1  )
	 UICommand_AddInt(  sceneId,  (5-nCount))
	 UICommand_AddInt(  sceneId,(5-nCount1))
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,    890174)
	 return
	 end
	 
	 
	 
	 if  GetNumText()  ==  2  then
          if    LuaFnGetAvailableItemCount(sceneId,  selfId,  20700053)  >=2  then  
	     LuaFnDelAvailableItem(sceneId,selfId,20700053,2)
	       TryRecieveItem(  sceneId,  selfId,  20700055,  1  )
	 x890088_Tips(  sceneId,  selfId,  " Ð±i [2 Kim Tinh ThÕch Toái Phiªn] Thành 1 [Kim Tinh ThÕch] Thành Công "  )
	 	 
	 	 else
	 	 x890088_Tips(  sceneId,  selfId,  " Không ðü 2 cái Kim Tinh ThÕch Toái Phiªn "  )
	 end
	 	 	 return
	 end
	 if  GetNumText()  ==  3  then
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  targetId  )
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,  20130604)
	 return
	 end	 
	 if  GetNumText()  ==  4  then
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  targetId  )

        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,  20130528)
	 return
	 end	 
	 
	 if  GetNumText()  ==5  then
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  targetId  )

        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,  20130628)
	 return
	 end	 
	 
	 	 if  GetNumText()  ==6  then
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  targetId  )

        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,  20130522)
	 return
	 end	 	 
	 
end

--**********************************
--  
--**********************************