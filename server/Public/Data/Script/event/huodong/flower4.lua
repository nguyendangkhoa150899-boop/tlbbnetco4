-- hÕt tØ loÕi hoa chân v¯n     xích sa # hÕt   QQ-718805400
-- hoa miêu # thành thøc #
-- xin/m¶i tôn tr÷ng nguyên sang , chuy¬n tái xin/m¶i chú thích xu¤t xÑ , cám ½n ~

-- chân v¯n s¯ 
x335704_g_ScriptId  =  335704


--**********************************
-- ð£c thù ðóng h² : ði«u ki®n phán ðoán 
--**********************************
function  x335704_OnActivateConditionCheck(  sceneId,  selfId,  activatorId  )

          local  myGUID  =  LuaFnGetLifeTimeAttrRefix_AttackPhysics(  sceneId,  selfId  )    --- thì ra là ID              
          local  selfGuid  =  LuaFnObjId2Guid(sceneId,  activatorId)  --- thông qua nhân v§t selfid l¤y ðßþc guid
          local  oldtime  =  LuaFnGetLifeTimeAttrRefix_DefencePhysics(  sceneId,  selfId  )  --- th¶i gian           
          local  nowtime  =  LuaFnGetCurrentTime()  -- l¤y ðßþc bây gi¶ th¶i gian 
          local  restime  =  oldtime  -  nowtime      -- l¤y ðßþc ðÕo thäi ðích cûng tính gi¶ 

        if  restime  <=  0    then              	 
	             BeginEvent(sceneId)
	             AddText(sceneId," th¶i gian ðã qua, ai cûng có th¬ hái hoa ðßþc! ")
	             EndEvent(sceneId)
	             DispatchMissionTips(sceneId,activatorId)
	       return  1
	   end      	 

      if  myGUID  ==  selfGuid    then
	             BeginEvent(sceneId)
	 	   AddText(sceneId," Các hÕ là chü nhân cüa Hoa Tß½i, xin hãy nhanh chóng hái hoa! ")
	 	   EndEvent(sceneId)
	             DispatchMissionTips(sceneId,activatorId)
	   return  1	   
              end

        BeginEvent(sceneId)
	 AddText(sceneId,"        B¢ng hæu không phäi là chü nhân cüa Hoa Tß½i, xin hãy ch¶ · #G"..restime.."#W giây m¾i có th¬ hái ðßþc! ")
                EndEvent(sceneId)
	 DispatchMissionTips(sceneId,activatorId)
                --DispatchEventList(sceneId,activatorId)
      return  0

end

--**********************************
-- ð£c thù ðóng h² : tiêu hao cùng kh¤u tr× xØ lý 
--**********************************
function  x335704_OnActivateDeplete(  sceneId,  selfId,  activatorId  )

	 local  strText  =  " ðào ðßþc gian cách th¶i gian 3 giây "
	 BeginEvent(sceneId)
	             AddText(sceneId,strText)
	             EndEvent(sceneId)
	 DispatchMissionTips(sceneId,activatorId)
	 return  1
end

--**********************************
-- ð£c thù ðóng h² : tø khí loÕi thành công có hi®u lñc xØ lý 
--**********************************
function  x335704_OnActivateEffectOnce(  sceneId,  selfId,  activatorId  )
                                LuaFnDeleteMonster(sceneId,  selfId)

	                 local  rand  =  random(100)

                                if  rand==1  then
                                      FlowerId  =  30509014
                                elseif  rand==2  then
                                      FlowerId  =  30505214
                                elseif  rand==3  then
                                      FlowerId  =  39999901
                                elseif  rand==4  then
                                      FlowerId  =  50521101
								elseif  rand==5  then
                                      FlowerId  =  50521201
                                elseif  rand==6  then
                                      FlowerId  =  50521301
                                elseif  rand==7  then
                                      FlowerId  =  50521401	
								elseif  rand==8  then
                                      FlowerId  =  30505262
                                elseif  rand==9  then
                                      FlowerId  =  39910001
                                elseif  rand==10  then
                                      FlowerId  =  30505265	
								elseif  rand==11  then
                                      FlowerId  =  20501008	  
								elseif  rand==12  then
                                      FlowerId  =  20501008
                                elseif  rand==13  then
                                      FlowerId  =  20501008
                                elseif  rand==14  then
                                      FlowerId  =  20501008
								elseif  rand==15  then
                                      FlowerId  =  20501008
                                elseif  rand==16  then
                                      FlowerId  =  20502008
                                elseif  rand==17  then
                                      FlowerId  =  20502008	
								elseif  rand==18  then
                                      FlowerId  =  20502008
                                elseif  rand==19  then
                                      FlowerId  =  39910001
                                elseif  rand==20  then
                                      FlowerId  =  20502008	
								elseif  rand > 21  then
                                      FlowerId  =  20310167	
									  
                                end

                                if  FlowerId  ==  30505262  then
	                       local  playerName  =  GetName(sceneId,activatorId)
        	                       local  strText  =  format("#B#{_INFOUSR%s}#W · #c00ffff ÐÕi Lý #W g£t hái thành công #ccc33cc[#{_ITEM30505262}]#W, còn không nhanh chóng tham gia! m²i ngày hãy ðªn#G A Lý[184,65] #Wð¬ nh§n hoÕt ðµng Tr°ng hoa mi­n phí!",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
                                end
								if  FlowerId  ==  30509014  then
	                       local  playerName  =  GetName(sceneId,activatorId)
        	                       local  strText  =  format("#B#{_INFOUSR%s}#W · #c00ffff ÐÕi Lý #W g£t hái thành công Hoa Tß½i Trß·ng Thành thu ðßþc #ccc33cc[#{_ITEM30509014}]#W, còn không nhanh chóng tham gia! m²i ngày hãy ðªn#G A Lý[184,65] #Wð¬ nh§n hoÕt ðµng Tr°ng hoa mi­n phí!",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
                                end
								if  FlowerId  ==  39999901  then
	                       local  playerName  =  GetName(sceneId,activatorId)
        	                       local  strText  =  format("#B#{_INFOUSR%s}#W · #c00ffff ÐÕi Lý #W g£t hái thành công Hoa Tß½i Trß·ng Thành thu ðßþc #ccc33cc[#{_ITEM39999901}]#W, còn không nhanh chóng tham gia! m²i ngày hãy ðªn#G A Lý[184,65] #Wð¬ nh§n hoÕt ðµng Tr°ng hoa mi­n phí!",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
                                end
								if  FlowerId  ==  50521101  then
	                       local  playerName  =  GetName(sceneId,activatorId)
        	                       local  strText  =  format("#B#{_INFOUSR%s}#W · #c00ffff ÐÕi Lý #W g£t hái thành công Hoa Tß½i Trß·ng Thành thu ðßþc #ccc33cc[#{_ITEM50521101}]#W, còn không nhanh chóng tham gia! m²i ngày hãy ðªn#G A Lý[184,65] #Wð¬ nh§n hoÕt ðµng Tr°ng hoa mi­n phí!",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
                                end
								if  FlowerId  ==  50521201  then
	                       local  playerName  =  GetName(sceneId,activatorId)
        	                       local  strText  =  format("#B#{_INFOUSR%s}#W · #c00ffff ÐÕi Lý #W g£t hái thành công Hoa Tß½i Trß·ng Thành thu ðßþc #ccc33cc[#{_ITEM50521201}]#W, còn không nhanh chóng tham gia! m²i ngày hãy ðªn#G A Lý[184,65] #Wð¬ nh§n hoÕt ðµng Tr°ng hoa mi­n phí!",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
                                end
								if  FlowerId  ==  50521301  then
	                       local  playerName  =  GetName(sceneId,activatorId)
        	                       local  strText  =  format("#B#{_INFOUSR%s}#W · #c00ffff ÐÕi Lý #W g£t hái thành công Hoa Tß½i Trß·ng Thành thu ðßþc #ccc33cc[#{_ITEM50521301}]#W, còn không nhanh chóng tham gia! m²i ngày hãy ðªn#G A Lý[184,65] #Wð¬ nh§n hoÕt ðµng Tr°ng hoa mi¬n phí!",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
                                end
								
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  activatorId,  activatorId,  activatorId,  18,  0)
	 	 TryRecieveItem(  sceneId,  activatorId,  FlowerId,  1  )
		 LuaFnItemBind( sceneId, selfId,FlowerId)
	 	 if  FlowerId  ==  20310167  then
		  TryRecieveItem(  sceneId,  activatorId,  20310167,  1  )
		  TryRecieveItem(  sceneId,  activatorId,  20310167,  1  )
		  TryRecieveItem(  sceneId,  activatorId,  20310167,  1  )
		  TryRecieveItem(  sceneId,  activatorId,  20310167,  1  )
		  end
	 	 BeginEvent(sceneId)
	 	 AddText(sceneId,  " Chúc m×ng các hÕ thu hoÕch thành công, các hÕ nh§n l¤y ðßþc mµt [#{_ITEM"..FlowerId.."}]");
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,activatorId)

	 return  1
end

--**********************************
-- ð£c thù ðóng h² : dçn d¡t loÕi m²i th¶i gian gian cách có hi®u lñc xØ lý 
--**********************************
function  x335704_OnActivateEffectEachTick(  sceneId,  selfId,  activatorId  )
	 return  1
end

--**********************************
-- ð£c thù ðóng h² : ðóng h² lúc b¡t ð¥u ðích ð£c thù xØ lý 
--**********************************
function  x335704_OnActivateActionStart(  sceneId,  selfId,  activatorId  )
	 return  1
end

--**********************************
-- ð£c thù ðóng h² : ðóng h² rút lui tiêu lúc ðích ð£c thù xØ lý 
--**********************************
function  x335704_OnActivateCancel(  sceneId,  selfId,  activatorId  )
	 return  1
end

--**********************************
-- ð£c thù ðóng h² : ðóng h² c¡t ðÑt lúc ðích ð£c thù xØ lý 
--**********************************
function  x335704_OnActivateInterrupt(  sceneId,  selfId,  activatorId  )

	 local  strText  =  " ngài c¡t ðÑt ðào ðßþc , xin/m¶i l¥n næa ðào ðßþc "
	 BeginEvent(sceneId)
	             AddText(sceneId,strText)
	             EndEvent(sceneId)
	 DispatchMissionTips(sceneId,activatorId)
	 return  1
end