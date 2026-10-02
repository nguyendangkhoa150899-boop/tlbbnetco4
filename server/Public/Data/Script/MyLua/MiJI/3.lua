-- thành ph¯ NPC
-- vû cø 

x890059_g_scriptId=890059

x890059_g_DanrenFB_ComboList=
{
[1]={text="#{DRFB_130111_212}",  tooltip="#{DRFB_130111_49}",rate=1,message="#{DRFB_130111_52}"},
[2]={text="#{DRFB_130111_213}",  tooltip="#{DRFB_130111_50}",rate=2,message="#{DRFB_130111_53}"},
[3]={text="#{DRFB_130111_214}",  tooltip="#{DRFB_130111_51}",rate=5,message="#{DRFB_130111_54}"},
[4]={text="#{DRFB_130111_220}",  tooltip="#{DRFB_130111_222}",rate=10,message="#{DRFB_130111_249}"},
[5]={text="#{DRFB_130111_221}",  tooltip="#{DRFB_130111_223}",rate=25,message="#{DRFB_130111_250}"},
}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x890059_BeginChallenge(  sceneId,  selfId,targetId1,targetId2,targetId3,targetId4,targetId5,targetId6  )
------targetId1  =  g_DanrenFB_NPC_objId*100  +  g_DanrenFB_ComboList[g_DanrenFB_Award_Type].rate	 
----x890060_CheckAccept(  sceneId,  selfId,  targetId  )
-----CallScriptFunction(  893063,  "MakeCopyScene",sceneId,  selfId,1)
if  (not  targetId1)  or    (not  targetId2)  or    (not  targetId3)  or    (not  targetId4)  or    (not  targetId5)  or    (not  targetId6)  then
x890059_Tips(  sceneId,  selfId,  " cänh cáo : xin không c¥n loÕn ð±i bång , ngài ðích s¯ trß½ng møc ðã b¸ ghi chép ! "  )
return
end
local  maxnnu  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  )*5  +  5
if  maxnnu  >  25  then
maxnnu  =  25
end
if  targetId6  <  1  or  targetId6  >  maxnnu  or  targetId2  <  1  or  targetId2  >  maxnnu  or  targetId3  <  1  or  targetId3  >  maxnnu  or  targetId4  <  1  or  targetId4  >  maxnnu  or  targetId5  <  1  or  targetId5  >  maxnnu  then
x890059_Tips(  sceneId,  selfId,  " cänh cáo : xin không c¥n loÕn ð±i bång , ngài ðích s¯ trß½ng møc ðã b¸ ghi chép ! ! "  )
return
end
local    TZchensu  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  )
local    GHchensu  =  mod(targetId1,100)
	   if  TZchensu  <  0  then
	   TZchensu  =  0
	   elseif  TZchensu  >  4  then
	   TZchensu  =  4
	   end
local  missitem  =  0	   
for  i,item  in  x890059_g_DanrenFB_ComboList  do	   
if  item.rate  ==  GHchensu  then
missitem  =  i
end
end
if  missitem  ==  0  then
x890059_Tips(  sceneId,  selfId,  " cänh cáo : xin không c¥n loÕn ð±i bång , ngài ðích s¯ trß½ng møc ðã b¸ ghi chép ! ! ! "  )
return
end
if  GetTeamLeader(sceneId,selfId)  ~=  selfId  or  GetTeamSize(sceneId,selfId)  ~=  1    then
x890059_Tips(  sceneId,  selfId,  " ngß½i phäi là ðµi trß·ng , thä là mµt ngß¶i ðích ðµi ngû m¾i có th¬ ði vào "  )
return
end

	   local    itemnumaa  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  38000527)  
	   local    itemnumaa1  =    LuaFnGetAvailableItemCount(sceneId,  selfId,  38000528)  -- [NetCo4 02/10] 38000528 = Ngu Hanh Phap Thiep ban khoa (ItemRule 30); truoc dem trung 38000527 -> co nua so thiep van qua kiem roi tru hut -> mat thiep
	   local    TZtimes  =  mod(GetMissionData(  sceneId,  selfId,  WJMISS  ),100)
	   local    TZchensu  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  )
	   local    g_DanrenFB_LeftFreeTimes  =  0
	   if  TZchensu  <  0  then
	   TZchensu  =  0
	   elseif  TZchensu  >  4  then
	   TZchensu  =  4
	   end
	             if  TZtimes  <  x890059_g_DanrenFB_ComboList[TZchensu+1].rate  then
	             g_DanrenFB_LeftFreeTimes  =  1
	             else
	             g_DanrenFB_LeftFreeTimes  =  0
	             end

local  ticket  =  (x890059_g_DanrenFB_ComboList[missitem].rate  -  g_DanrenFB_LeftFreeTimes)  *  10
local    ItemUseNum  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANITEM  )
	   local  cennustimes  =  (x890059_g_DanrenFB_ComboList[TZchensu+1].rate  -  TZtimes)  +  25  --  ItemUseNum
                  if  cennustimes  <  0  then	 
                  x890059_Tips(  sceneId,  selfId,  " khiêu chiªn s¯ l¥n ðã thßþng hÕn ! ! # ¤m áp ð« kÏ : ð« cao khiêu chiªn t¥ng s¯ , có th¬ ðÕt ðßþc nhi«u h½n khiêu chiªn s¯ l¥n , ngß½i trß¾c m¡t ðã thành công khiêu chiªn "..GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  ).." t¥ng BOSS#"  )
                  return
                  end
if  GHchensu  ==  1  and  GetDayTime()  <=  GetMissionData(  sceneId,  selfId,  WJMISSyy  )  then  -- [NetCo4 02/10] kiem gioi han 1 lan/ngay cua muc x1 TRUOC khi tru thiep (truoc tru roi moi bao -> mat thiep)
x890059_Tips(  sceneId,  selfId,  " m\178i ng\224y ch\239 c\243 m\181t l\165n tr\248 c\181t s\175 l\165n "  )
return
end
if  itemnumaa  +  itemnumaa1  <  ticket  then
x890059_Tips(  sceneId,  selfId,  "#{DRFB_130111_217}"  )
return
end
local  DELITEM  =  0
local  DELITEMNUM  =  0
-- [NetCo4 02/10] tru thiep: ticket = 0 (luot mien phi) thi khong tru; con lai tru ban khoa 38000528 truoc, thieu moi tru 38000527
if  ticket  <=  0  then
DELITEMNUM  =  1
else
local  tru1  =  ticket
if  tru1  >  itemnumaa1  then
tru1  =  itemnumaa1
end
local  tru2  =  ticket  -  tru1
DELITEMNUM  =  1
if  tru1  >  0  and  LuaFnDelAvailableItem(sceneId,selfId,38000528,tru1)  ~=  1  then
DELITEMNUM  =  0
end
if  DELITEMNUM  ==  1  and  tru2  >  0  and  LuaFnDelAvailableItem(sceneId,selfId,38000527,tru2)  ~=  1  then
DELITEMNUM  =  0
end
end
if  DELITEMNUM  ==  0  then
x890059_Tips(  sceneId,  selfId,  " kh¤u tr× v§t ph¦m th¤t bÕi , không cách nào khai sáng phó bän "  )
return
end
local  nearmembercount	 =  GetNearTeamCount(  sceneId,  selfId  )
local  cc  =0
if  GHchensu  ==1  then  
	 lastDayTime  =  GetMissionData(  sceneId,  selfId,  WJMISSyy  )
	 	 local  CurDayTime  =  GetDayTime()
	 if  CurDayTime  >  lastDayTime  then
	 cc  =1
	 end
if  cc  ~=  1  then  
x890059_Tips(  sceneId,  selfId,  " m²i ngày chï có mµt l¥n trø cµt s¯ l¥n "  )	 
	 return
end	 	 
SetMissionData(  sceneId,  selfId,  WJMISSyy,GetDayTime()  )	 
	 
end  	 
CallScriptFunction(  (890057),  "MakeCopyScene",  sceneId,selfId,nearmembercount,GetTeamLeader(sceneId,selfId),floor(ticket/10),targetId2,targetId3,targetId4,targetId5,targetId6)  
end

function  x890059_Tips(  sceneId,  selfId,  str  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end