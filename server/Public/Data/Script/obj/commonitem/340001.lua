-- môn phái tri®u t§p làm chân v¯n . chú ý : 

-- v§t ph¦m kÛ nång ðích suy lu§n chï có th¬ sØ døng trø cµt kÛ nång và chân v¯n là thñc hi®n 

-- chân v¯n :

-- tr· xu¯ng là chân v¯n dÕng l® :


--340001.lua
------------------------------------------------------------------------------------------
-- mµt loÕi v§t ph¦m ðích cam ch¸u chân v¯n 

-- chân v¯n s¯ 
x340001_g_scriptId  =  340001  -- tÕm th¶i viªt cái này , chân chính dùng th¶i ði¬m nh¤t ð¸nh phäi ð±i .

-- c¥n c¤p b§c 

-- hi®u quä ID
x340001_g_Impact1  =  340001  -- tÕm th¶i viªt cái này 
x340001_g_Impact2  =  -1  -- không c¥n 

x340001_g_Impact_NotTransportList  =  {  5929  }  --  c¤m chï truy«n t¯ng ðích Impact
x340001_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x340001_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x340001_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x340001_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x340001_OnConditionCheck(  sceneId,  selfId  )

	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " ngài xØ vu tào v§n trÕng thái trung , không th¬ sØ døng truy«n t¯ng chÑc nång . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return  0
	 end
	 
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  40002000)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  " trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! không th¬ sØ døng truy«n t¯ng chÑc nång . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchMissionTips(  sceneId,  selfId  )
	 	 return  0
	 end
	 
	 -- ki¬m tr¡c Impact trÕng thái trú lßu hi®u quä 
	 for  i,  ImpactId  in  x340001_g_Impact_NotTransportList  do
	 	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  ImpactId)  ~=  0  then
	 	 	 BeginEvent(sceneId)	 	 	 
	 	 	 	 AddText(sceneId,  x340001_g_TalkInfo_NotTransportList[i]);
	 	 	 EndEvent(sceneId)
	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 return  0
	 	 end
	 end
	 
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end
	 return  1;  -- không c¥n b¤t kÏ ði«u ki®n gì , h½n næa thüy chung tr· v« 1 . 
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x340001_OnDeplete(  sceneId,  selfId  )

    local  Level  =  GetLevel(  sceneId,  selfId  )
    local  MenPai  =  LuaFnGetMenPai(  sceneId,  selfId  )
    
    if  Level  <  10  then
            return  0
    end
    
    if  MenPai  <  0  or  MenPai  ==9  then                      
  	 	     BeginEvent(sceneId)
	 	 	     strText  =  format(" không có gia nh§p môn phái , không th¬ sØ døng v§t này ph¦m ")
	 	 	     AddText(sceneId,strText)
  	 	     EndEvent(sceneId)

  	 	     DispatchMissionTips(sceneId,selfId)
  	 	     
            return  0
    end
    
    if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " ngài xØ vu tào v§n trÕng thái trung , không th¬ sØ døng truy«n t¯ng chÑc nång . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return  0
	 end
    
    	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  40002000)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  " trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! không th¬ sØ døng truy«n t¯ng chÑc nång . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchMissionTips(  sceneId,  selfId  )
	 	 return  0
	 end
    
    -- ki¬m tr¡c Impact trÕng thái trú lßu hi®u quä 
	 for  i,  ImpactId  in  x340001_g_Impact_NotTransportList  do
	 	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  ImpactId)  ~=  0  then
	 	 	 BeginEvent(sceneId)	 	 	 
	 	 	 	 AddText(sceneId,  x340001_g_TalkInfo_NotTransportList[i]);
	 	 	 EndEvent(sceneId)
	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 return  0
	 	 end
	 end
    
	 if(0<LuaFnDepletingUsedItem(sceneId,  selfId))  then
	 	 return  1;
	 end
	 return  0;
end



function  x340001_MenpaiTransfer(  sceneId,  selfId  )
                        
        local  MenPai  =  LuaFnGetMenPai(  sceneId,  selfId  )
        
        local  TargetScene
        local  x
        local  z
        
        if(  MenPai  >=  0  and  MenPai  <=12  )  then
                if  0  ==  MenPai  then            -- Thiªu Lâm 
                        TargetScene  =  9
                        x  =  93
                        z  =  72    
                end
                
                if  1  ==  MenPai  then            -- Minh giáo 
                        TargetScene  =  11
                        x  =  106
                        z  =  59                    
                end

                if  2  ==  MenPai  then            -- Cái Bang 
                        TargetScene  =  10
                        x  =  91
                        z  =  100                    
                end

                if  3  ==  MenPai  then            -- Võ Ðß½ng 
                        TargetScene  =  12
                        x  =  80
                        z  =  87                                    
                end

                if  4  ==  MenPai  then            -- Nga Mi 
                        TargetScene  =  15
                        x  =  96
                        z  =  48                                    
                end

                if  5  ==  MenPai  then            -- tinh túc 
                        TargetScene  =  16
                        x  =  86
                        z  =  73                                    
                end

                if  6  ==  MenPai  then            -- ÐÕi Lý 
                        TargetScene  =  13
                        x  =  96
                        z  =  88                                    
                end

                if  7  ==  MenPai  then            -- Thiên S½n 
                        TargetScene  =  17
                        x  =  89
                        z  =  47                                    
                end

                if  8  ==  MenPai  then            -- tiêu diêu 
                        TargetScene  =  14
                        x  =  122
                        z  =  141                                    
                end                
                
	 	 
	 if  10  ==  MenPai  then            -- Ðß¶ng môn 
                        TargetScene  =  435
                        x  =  48
                        z  =  134                                    
                end  
	 	 
	 if  11  ==  MenPai  then            -- Mµ Dung 
                        TargetScene  =  495
                        x  =  39
                        z  =  73                                    
                end  

	 if  12  ==  MenPai  then            -- quÖ c¯c 
                        TargetScene  =  197
                        x  =  104
                        z  =  63                                    
                end  

              if  sceneId  ==  TargetScene  then
                      SetPos(  sceneId,  selfId,  x,  z  )
                      return
              end
              
                CallScriptFunction((400900),  "TransferFunc",sceneId,  selfId,  TargetScene,  x,  z)  
	 	 -- s¯ li®u th¯ng kê 
	 	 LuaFnAuditItemUseMenPaiZhaoJiLing(sceneId,  selfId,  MenPai)
                
        
        end                
        
        
end

--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tø khí cùng thu¤n phát kÛ nång s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i ( tø khí kªt thúc h½n næa các loÕi ði«u ki®n cûng thöa mãn th¶i ði¬m ) , mà dçn d¡t 
-- kÛ nång cûng s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i ( kÛ nång ðích ngay t× ð¥u , tiêu hao thành công thi hành sau ) . 
-- tr· v« 1 : xØ lý thành công ; tr· v« 0 : xØ lý th¤t bÕi . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x340001_OnActivateOnce(  sceneId,  selfId  )

	 if(-1~=x340001_g_Impact1)  then
	 	 --LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  x340001_g_Impact1,  0);
	 	 x340001_MenpaiTransfer(  sceneId,  selfId  )
	 end
	 return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x340001_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end