-- minh chiªn chân v¯n   ( toàn bµ )
--Author  UK  
-- chân v¯n s¯ 
x900014_g_scriptId  =  900014
x900014_g_InSceneID  =  180
x900014_g_scenePosInfoList  =  {}	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 
x900014_g_scenePosInfoList[0]={x=66,  z=34  }
x900014_g_scenePosInfoList[1]={x=251,  z=26}
x900014_g_scenePosInfoList[2]={x=288,  z=66  }	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 
x900014_g_scenePosInfoList[3]={x=292,  z=250  }
x900014_g_scenePosInfoList[4]={x=260,  z=291  }
x900014_g_scenePosInfoList[5]={x=67,  z=291  }	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 
x900014_g_scenePosInfoList[6]={x=28,  z=241  }
x900014_g_scenePosInfoList[7]={x=34,  z=60  }
x900014_g_hudong_DayTime1  =  3
x900014_g_hudong_DayTime2  =  6
--x900014_g_hudongtime  =  {0,1,3,81,82}
x900014_g_hudongtime  =  {80,81,82,83,84}
x900014_g_hudongtimenum  =  5
x900014_g_hudongxianTime  =  {}
x900014_g_hudongxianTime[0]  =  1
x900014_g_hudongxianTime[1]  =  1
x900014_g_hudongxianTime[2]  =  1
x900014_g_MonsterId  =  45465
x900014_g_daji  =  45464
x900014_g_OutScene  =  420
x900014_g_Outx  =  150
x900014_g_Outz  =  150

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x900014_OnDefaultEvent(  sceneId,  selfId,targetId)
	 BeginEvent(sceneId)
                AddText(  sceneId,  "    m²i tu¥n ba ? thÑ bäy 20 : 00--22 : 00 m· ra phßþng hoàng c± thành tranh ðoÕt chiªn , thành chiªn trong lúc , bình thß¶ng nhà ch½i không th¬ tiªn vào , chï có ch¶ c¤p =75 c¤p , tâm pháp c¤p b§c cûng =45 c¤p , thä gia nh§p bang hµi ðích nhà ch½i có th¬ tham gia , ngß¶i th¡ng s¨ có phong phú tß·ng thß·ng . "  )
                local  isok  =  x900014_GetIsInTime()
                if  0  ==  isok  then
                      --AddNumText(sceneId,900014," ðßa ta ði phßþng hoàng chiªn trß¶ng ",6,186)
                          AddNumText(sceneId,900014," ði trß¾c phßþng hoàng c± thành ",6,5)
                else
                      --AddNumText(sceneId,900014," ði trß¾c phßþng hoàng c± thành ",6,5)  
                          AddNumText(sceneId,900014," ðßa ta ði phßþng hoàng chiªn trß¶ng ",6,186)
                end        
                AddNumText(sceneId,900014," liên quan t¾i phßþng hoàng c± thành tranh ðoÕt ",11,4)
	 EndEvent(sceneId)
  	 DispatchEventList(sceneId,selfId,targetId)  

  end
  
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x900014_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)


if  GetNumText()==  186    then
local  isok  =  x900014_GetIsInTime()
if  0  ==  isok  then
x900014_NotifyFailTips(  sceneId,  selfId,  " không phäi là hoÕt ðµng th¶i gian c¤m chï tiªn vào "  )
return
end
local      GuildLeagueID    =  LuaFnGetHumanGuildLeagueID(  sceneId,  selfId  )+1
if  	 GuildLeagueID  <=  0  then
x900014_NotifyFailTips(  sceneId,  selfId,  " không có ð°ng minh không th¬ vào ! ! "  )
return
end	   
local	 GuildName	 =  LuaFnGetHumanGuildLeagueName(  sceneId,  selfId  )
if  GuildName  ==  ""  then
BeginUICommand(sceneId)
UICommand_AddInt(sceneId,selfId)
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId,  1208)
x900014_NotifyFailTips(  sceneId,  selfId,  " ðang cà m¾i ð°ng minh s¯ li®u "  )
return
end
local  notmiss  =  x900014_GetMyTongMen(  sceneId,  selfId)	     
if  notmiss  ==  -1  then
if  LuaFnGetCopySceneData_Param(sceneId,31)  >=  8  then
x900014_NotifyFailTips(  sceneId,  selfId,  " phßþng hoàng c± thành có th¬ vào ð°ng minh ðã ð¥y , không th¬ næa tiªn vào ! ! "  )
return
end
LuaFnSetCopySceneData_Param(sceneId,LuaFnGetCopySceneData_Param(sceneId,31),GuildLeagueID)
CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  x900014_g_InSceneID,x900014_g_scenePosInfoList[LuaFnGetCopySceneData_Param(sceneId,31)].x,  x900014_g_scenePosInfoList[LuaFnGetCopySceneData_Param(sceneId,31)].z  )
LuaFnSetCopySceneData_Param(sceneId,31,LuaFnGetCopySceneData_Param(sceneId,31)+1)
else
CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  x900014_g_InSceneID,x900014_g_scenePosInfoList[notmiss].x,    x900014_g_scenePosInfoList[notmiss].z  )
end

return
end

  if  GetNumText()==  5    then
        CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  191,  150,150  )
        return
  end

  if  GetNumText()==  4    then
        BeginEvent(sceneId)
	 AddText(sceneId,"#{FHZD_090708_86}")
        EndEvent(sceneId)
        DispatchEventList(sceneId,selfId,targetId)
end
end
--**********************************
-- tiªn vào phó bän 
--**********************************
function  x900014_OnPlayerEnter(  sceneId,  selfId  )
                -- ðã ðªn gi¶ ðem ngß¶i cûng ðá ra ði 
                    local  nQuarter  =  mod(GetQuarterTime(),100);
	 	     local  isok  =  x900014_GetIsInTime()
                    if  0  ==  isok  then
	 	     x900014_NotifyFailTips(  sceneId,  selfId,  " phßþng hoàng c± thành chiªn trß¶ng ðã t¡t "  )
	 	     CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  x900014_g_OutScene,  x900014_g_Outx,  x900014_g_Outz)
                    return
                    end	 	     
                                      
                        local      GuildLeagueID    =  LuaFnGetHumanGuildLeagueID(  sceneId,  selfId  )+1
	 	 	 local	 GuildName	 =  LuaFnGetHumanGuildLeagueName(  sceneId,  selfId  )
	 	 	 if  GuildLeagueID  <=  0  or  ""  ==  GuildName  then
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " không có ð°ng minh không th¬ vào phßþng hoàng c± thành chiªn trß¶ng "  )
	 	 	 CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  x900014_g_OutScene,  x900014_g_Outx,  x900014_g_Outz)
	 	 	 return
	 	 	 end
	                 
	                             RestoreHp(  sceneId,  selfId  )
	                             RestoreMp(  sceneId,  selfId  )
	                             RestoreRage(  sceneId,  selfId  )
                        --LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  10091,  0)
	                 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  84,  0)
	                 SetMissionData(  sceneId,  selfId,  MENZANGMENSU,0)  
	 	 	       local  notmiss  =  x900014_GetMyTongMen(  sceneId,  selfId)	 	 	       
                                if  notmiss  ==  -1  then
	 	 	 	 if  LuaFnGetCopySceneData_Param(sceneId,31)  >=  8  then
	 	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " phßþng hoàng c± thành có th¬ vào ð°ng minh ðã ð¥y , xin sau thØ lÕi ! ! "  )
	 	 	 	 CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  x900014_g_OutScene,  x900014_g_Outx,  x900014_g_Outz)
	 	 	 	 return
	 	 	 	 end
	 	 	 	 LuaFnSetCopySceneData_Param(sceneId,LuaFnGetCopySceneData_Param(sceneId,31),GuildLeagueID)
	 	 	 	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%50",  "%50",  "0",  sceneId,  x900014_g_scenePosInfoList[LuaFnGetCopySceneData_Param(sceneId,31)].x,  x900014_g_scenePosInfoList[LuaFnGetCopySceneData_Param(sceneId,31)].z  );
	 	 	 	 LuaFnSetCopySceneData_Param(sceneId,31,LuaFnGetCopySceneData_Param(sceneId,31)+1)
	 	 	 	 else
	 	 	 	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%50",  "%50",  "0",  sceneId,  x900014_g_scenePosInfoList[notmiss].x,  x900014_g_scenePosInfoList[notmiss].z  );
	 	 	 	 end
	 	 	 	 SetPvpAuthorizationFlagByID(sceneId,  selfId,  2,  1)  
                                SetUnitCampID(sceneId,  selfId,  selfId,  LuaFnGetHumanGuildLeagueID(  sceneId,  selfId  )+10000  )


end
--**********************************
--  OnSceneTimer
--**********************************
function  x900014_GetMyTongMen(  sceneId,  selfId)
local      GuildLeagueID    =  LuaFnGetHumanGuildLeagueID(  sceneId,  selfId  )+1
                              local  wobang  =  -4
	 	 	       local  notmiss  =  -1
	 	 	       for  i  =  0,7  do
	 	 	       wobang  =  LuaFnGetCopySceneData_Param(sceneId,i)
	 	 	       wobang  =  mod(wobang,10000)
	 	 	       if  GuildLeagueID  ==  wobang  then
	 	 	       notmiss  =  i
	 	 	       break
	 	 	       end
	 	 	       end
return  notmiss	 	 	       
end	 	 	       
--**********************************
--  OnSceneTimer
--**********************************
function  x900014_OnSceneTimer(  sceneId)
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1    then
        x900014_OnFuBenTime(  sceneId,  nHumanId)                                
        end	 
	 	 
	 end
	 
end
--**********************************
--  OnSceneTimer
--**********************************
function  x900014_GetMonsterIDToObj(  sceneId,  wmymonsteridkey  )
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 local  objid  =  -1
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
                          if  MosDataID  ==  wmymonsteridkey  then
	 	 	   objid  =  MonsterId
	 	 	   break
	 	 	   end
	 	 	   end
return  objid	 	 	   
end	 	 	   
--**********************************
--  OnSceneTimer
--**********************************
function  x900014_OnFuBenTime(  sceneId,  selfId)	 
local  nQuarter  =  mod(GetQuarterTime(),100);
local  ishudongtime  =  x900014_GetIsInTime()
	         local      GuildLeagueID    =  LuaFnGetHumanGuildLeagueID(  sceneId,  selfId  )+1
	 	 local	 GuildName	 =  LuaFnGetHumanGuildLeagueName(  sceneId,  selfId  )
	           if  ishudongtime  ==  0  then
	 	   if  maxtmname  ~=  nil  and  maxtmjifen  ~=  nil  then
	 	   local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	   local  mytongmenname,nHumanId
	           for  i=0,  nHumanCount-1  do
	           nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	   mytongmenname  =  LuaFnGetHumanGuildLeagueName(  sceneId,  nHumanId  )
	 	   if  mytongmenname  ==  maxtmname  and  GetMissionData(  sceneId,  selfId,  MENZANGMENSU)  ==  0  then	 
                  local  CurTime	 	 =  LuaFnGetCurrentTime()	 	   
	 	   SetMissionData(  sceneId,  nHumanId,  MENZANGMENSU,CurTime)
	 	   end
	 	   end
	 	   maxtmname  =  nil  
	 	   maxtmjifen  =  nil  
	 	   for  i  =  0,31  do
                  LuaFnSetCopySceneData_Param(  sceneId,  i,  0  )
                  end
	 	   local  dajikill  =  x900014_GetMonsterIDToObj(  sceneId,  x900014_g_daji  )
	 	   if  dajikill  ~=  -1  then
	 	   SetCharacterDieTime(sceneId,  dajikill,  10)
	 	   end
	 	   end
	           x900014_NotifyFailTips(  sceneId,  selfId,  " minh chiªn hoÕt ðµng kªt thúc ! "  )      -- tr· xu¯ng danh hi®u bµ ph§n hÕt tØ gia nh§p 
                                if  maxtmname  ==  myGuildLeagueName  then
	 	       AwardTitle(  sceneId,  selfId,  18,  255,  24  *  7  )
	 	       SetCurTitle(  sceneId,  selfId,  18,  255  )
	 	       DispatchAllTitle(  sceneId,  selfId  )
                              end
                  --LuaFnCancelSpecificImpact(sceneId,selfId,10091)
	           CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  x900014_g_OutScene,  x900014_g_Outx,  x900014_g_Outz)
                  return
                  end  
                	 

                  if  maxtmname  ~=  nil  and  maxtmjifen  ~=  nil  then
	 	   x900014_NotifyFailTips(  sceneId,  selfId,  " minh chiªn tích phân ðÑng ð¥u bäng vì ["..maxtmname.."], tích phân vì "..maxtmjifen.." phân "  )
	 	   end

	               if    LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  or    LuaFnIsObjValid(  sceneId,  selfId  )  ~=  1  or  LuaFnIsCanDoScriptLogic(sceneId,  selfId)  ~=  1    then
        
                      return
                      end    

	 	 	 if  GuildLeagueID  <=  0  or  ""  ==  GuildName  then
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " không có ð°ng minh không th¬ vào phßþng hoàng c± thành chiªn trß¶ng "  )
	 	 	 CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  x900014_g_OutScene,  x900014_g_Outx,  x900014_g_Outz)
	 	 	 return
	 	 	 end
	 	 	 local  mytongmen  =  x900014_GetMyTongMen(  sceneId,  selfId)
	 	 	 if  -1  ==  mytongmen  then
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " không có ð°ng minh không th¬ vào phßþng hoàng c± thành chiªn trß¶ng "  )
	 	 	 CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  x900014_g_OutScene,  x900014_g_Outx,  x900014_g_Outz)
	 	 	 return
	 	 	 end
	 	 	 local  wobang  =  LuaFnGetCopySceneData_Param(sceneId,mytongmen)
	                 local  findmenid  =  mod(wobang,10000)
	                 local  denfen  =  floor(wobang/10000)
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  "["..GuildName.."] ð°ng minh trß¾c m£t tích phân vì "..denfen.." phân "  )
	 	 	 local  MonsterId  =  x900014_GetMonsterIDToObj(  sceneId,  x900014_g_MonsterId)

	 	 	 if  -1  ==  MonsterId  then
	 	 	 --return
	                                 local  MstId  =  LuaFnCreateMonster(sceneId,  x900014_g_MonsterId,  162,  161,  3,  -1,  900039  )
	                                 SetCharacterName(  sceneId,  MstId,  " tª c¶ thai "  )
	                                 SetCharacterDieTime(sceneId,  MstId,  1800000)
	 	 	 end

	                 local  daji  =  x900014_GetMonsterIDToObj(  sceneId,  x900014_g_daji)
	 	 	 local  a,b,x,z,dajiname,PlayerX,  PlayerZ,Distance
	 	 	 if  -1  ==  daji  then
                        a,b  =  GetWorldPos(  sceneId,  MonsterId  )
                        x,z  =  floor(a),floor(b)
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " m¶i ðßþc t÷a ðµ ði¬m ("..x..","..z..") , ði tª c¶ "  )
	 	 	 else
	 	 	 a,b  =  GetWorldPos(  sceneId,  daji  )
                        x,z  =  floor(a),floor(b)
	 	 	 dajiname  =  GetName(sceneId,  daji)
	 	 	 PlayerX,  PlayerZ  =  GetWorldPos(  sceneId,  selfId  )
	 	 	 Distance  =  floor(sqrt((x-PlayerX)*(x-PlayerX)+(z-PlayerZ)*(z-PlayerZ)))
	 	 	 if  nil  ==  dajiname  or  ""  ==  dajiname  then
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " ðÕi kÏ phi pháp "  )
	 	 	 return
	 	 	 end
	 	 	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 local  nHumanId  
	 	 	 local  mytongmenname  =  ""
	 	 	 local  numPlayer  =  0
	                 for  i=0,  nHumanCount-1  do
	                 nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	 mytongmenname  =  LuaFnGetHumanGuildLeagueName(  sceneId,  nHumanId  )
	 	 	 if  mytongmenname.." ð°ng minh ðÕi kÏ "  ==  dajiname  and  Distance  <=  18  then
	 	 	 numPlayer  =  numPlayer  +  1
	 	 	 end
	 	 	 end
	 	 	 if  GuildName.." ð°ng minh ðÕi kÏ "  ==  dajiname  then
	 	 	 if  Distance  >  18  then
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " thân ái nhà ch½i , ngài chï c¥n · ["..dajiname.."]18 thß¾c trong phÕm vi bäo v® ["..dajiname.."] ðích ð°ng minh thành viên càng nhi«u , l¤y ðßþc tß·ng thß·ng càng nhi«u ! ["..dajiname.."] , t÷a ðµ vì ("..x..","..z..")"  )
	 	 	 else
                        local  fazendian  =  floor(10*numPlayer)
                        local  fayuanbao  =  floor(10*numPlayer)
                        local  faaddexp  =  floor(5000*numPlayer)
                        ZengDian(sceneId,selfId,-1,1,fazendian  )
                        YuanBao(sceneId,selfId,-1,1,fayuanbao  )
                        LuaFnAddExp(  sceneId,  selfId,  faaddexp)
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " · 18 thß¾c trong phÕm vi bäo v® ["..dajiname.."] nhân s¯ cüa vì "..numPlayer.." ngß¶i , ngß½i l¤y ðßþc , "..fazendian.." ði¬m t£ng ði¬m cùng "..fayuanbao.." ði¬m nguyên bäo !  chú ý : · ["..dajiname.."]18 thß¾c trong phÕm vi ðích ð°ng minh thành viên càng nhi«u l¤y ðßþc tß·ng thß·ng càng nhi«u !   ! "  )
	 	 	 end
	 	 	 else
	 	 	 if  Distance  >  18  then
	 	 	 x900014_NotifyFailTips(  sceneId,  selfId,  " chú ý : ["..dajiname.."] s¨ di ðµng , trß¾c hªt ðánh chªt ["..dajiname.."] t÷a ðµ ði¬m vì ("..x..","..z.."), m¾i có th¬ ðªn [ tª c¶ thai ] tª c¶ "  )
	 	 	 end
	 	 	 end
	 	 	 end

	 	 	 

end
--**********************************
--  ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x900014_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end
--**********************************
--  
--**********************************
function  x900014_GetIsInTime()

local  nDay  =  GetTodayWeek()
local  nQuarter  =  mod(GetQuarterTime(),100);
local  isok  =  0

          for  i  =  1,x900014_g_hudongtimenum  do
                  if  x900014_g_hudongtime[i]  ==  nQuarter  then
                        if  nDay  ==  x900014_g_hudong_DayTime1  or  nDay  ==  x900014_g_hudong_DayTime2  then
                              isok  =  i
                              break
                        end
                  end
          end

return  isok
end
--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x900014_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
