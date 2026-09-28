----- ðÕi t¯ng thêm máu NPC chân v¯n ---------
----- nguyên sang UK , gia tång sØa ð±i quân phøng ngày QQ : 137094888

-- chân v¯n s¯ 
x300113_g_scriptId  =  300113

  

x300113_g_Ljifeng  =  {}	 	 	 	 ---  ðÕi liêu tích phân 
x300113_g_LHumanID  =  {}	 	 	 	 ---  ðÕi liêu nhà ch½i ID

x300113_g_SCount  =  0    --- t¯ng phß½ng nhân s¯ 
x300113_g_LCount  =  0    --- liêu phß½ng nhân s¯ 
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x300113_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 AddText(sceneId,"    ta ðây có th¬ tr· v« phøc lßþng máu nhßng mu¯n nh¤t ð¸nh nguyên bäo ")
	 AddNumText(  sceneId,  x300113_g_scriptId,  " h°i phøc huyªt khí ",6  ,1    )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x300113_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x300113_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x300113_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
local  mycamp  =  GetUnitCampID(sceneId,  selfId,selfId  )
if    mycamp  ~=  156  then
x300113_MsgBox(  sceneId,  selfId,  " ta chï vì ðÕi t¯ng ðích chiªn sî chæa tr¸ "  )
return
end

RestoreHp(  sceneId,  selfId  )
RestoreMp(  sceneId,  selfId  )
x300113_MsgBox(  sceneId,  selfId,  " ðã thành công tr· v« mãn huyªt khí "  )	 
end
--**********************************
-- tin tÑc ð« kÏ 
--**********************************
function  x300113_MsgBox(  sceneId,  selfId,  str  )	 
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- tin tÑc ð« kÏ 111
--**********************************
function  x300113_XieziPaiming(  sceneId,  selfId  )
    local  str_PM  =  ""
    local  str_NM  =  ""
    local  str_ZY  =  ""
    local  str_JF  =  ""
    x300113_GetSameCamppaixu(sceneId)
BeginUICommand(  sceneId  )


local  b  =  "              #Y chiªn tích ðÑng hàng thÑ #r                nhân s¯ : "..x300113_g_LCount.."#r"
AddText(  sceneId,  b  )
for  i=  1    ,x300113_g_LCount  do
                                local  zhenyi  =  GetUnitCampID(sceneId,  x300113_g_LHumanID[i],  x300113_g_LHumanID[i])
                            
                        if    zhenyi  ==156    then
                        	   zhenyi  =  "#c00ffff ðÕi t¯ng "
                        else
                        	   zhenyi  =  "#ccc33cc ðÕi liêu "	 
                        end                      	                       	                       	                             
                  local  szName  =  GetName(  sceneId,  x300113_g_LHumanID[i]  );          
                    ---local  myjifen  =  GetMissionData(  sceneId,  x300113_g_LHumanID[i],  MD_SONGLIAO_JIFEN)                                  
                    str1  =  "#Y t¯ng liêu tích phân bäng xªp hÕng "
                    str2  =  "#cfabf8f th¡ng lþi quy t¡c : #r        #W chiªn trß¶ng t¡t lúc , #G tích phân dçn trß¾c #W ðích nh¤t phß½ng ðÕt ðßþc th¡ng lþi ;#G ðánh bÕi ð¯i phß½ng tr§n doanh chü soái #W là trñc tiªp chiªn th¡ng . #r        ðánh chªt so v¾i mình #G c¤p b§c cao h½n #W ðích nhà ch½i , ho£c #G liên tøc ðánh chªt #W nhi«u tên nhà ch½i , ð«u nhßng ðÕt ðßþc cao h½n tích phân . #r        t¯ng liêu m²i tr§n doanh ðích #G ð® nh¤t danh #W , h½n các nhßng ðÕt ðßþc huy­n kh¯c #G t¯ng liêu chiªn trß¶ng cÞi ngña #W ! "
                    str_PM  =  str_PM.."#Y          thÑ #G"..i.."#Y tên   #r"      	                                   	 
                    str_NM  =  str_NM.."        "..szName.."  #r"      	                                   	 
                    str_ZY  =  str_ZY.."                "..zhenyi.."  #r"      	                                   	 
                    str_JF  =  str_JF.."#Y                "..  x300113_g_Ljifeng[i].."  #r"      	                                   	 
end    

--UICommand_AddInt(  sceneId,  targetId  )
UICommand_AddString(sceneId,str1)
UICommand_AddString(sceneId,str2)

UICommand_AddString(sceneId,str_PM)
UICommand_AddString(sceneId,str_NM)
UICommand_AddString(sceneId,str_ZY)
UICommand_AddString(sceneId,str_JF)

EndUICommand(  sceneId  )
DispatchUICommand(  sceneId,  selfId,  20140927)
end

--  ðÕt ðßþc cänh tßþng mµt ngß¶i trong tr§n doanh gia nh§p ðªm t± 
--**********************************

------  làm ðÑng hàng ------- không biªt thª nào truy®n ðªm t± , cho nên còn c¥n viªt hai chæ ----
------  ----------------
function  x300113_GetSameCamppaixu(sceneId)

	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
  
	 for  i=1,  nHumanCount    do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i-1)
      if  nHumanId  >1    then
      	       x300113_g_LCount  =  x300113_g_LCount+1
	 	 	   x300113_g_LHumanID[x300113_g_LCount]  =  nHumanId
	 	 	   x300113_g_Ljifeng[x300113_g_LCount]  =  GetMissionData(  sceneId,  nHumanId,  MD_SONGLIAO_JIFEN)	 	 	 
	 end
	 	 
end


for  i  =  1,  x300113_g_LCount  do
              
                for  j  =  1,  i  do                          
                                                                      
                              if  x300113_g_Ljifeng[i]  >  x300113_g_Ljifeng[j]    then
                                      local  temp  =  x300113_g_Ljifeng[i]
                                      local  tempID  =  x300113_g_LHumanID[i]
                                        x300113_g_Ljifeng[i]  =  x300113_g_Ljifeng[j]
                                        x300113_g_LHumanID[i]  =  x300113_g_LHumanID[j]
                                        x300113_g_Ljifeng[j]  =  temp
                                        x300113_g_LHumanID[j]  =  tempID
                              end
              end
end          


end
