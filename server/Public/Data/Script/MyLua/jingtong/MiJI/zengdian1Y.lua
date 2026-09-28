-- tác giä :  hß äo   11:30  2013-11-15  QQ : 2636158793

x890100_g_scriptId  =  890100
x890100_g_sitem  =  {}
x890100_g_sitem[30311001]={850,851,852}
x890100_g_sitem[30311002]={853,854,855}
x890100_g_sitem[30311003]={856,857,858}
x890100_g_sitem[30311004]={859,860,861}
x890100_g_sitem[30311005]={862,863,864}
x890100_g_sitem[30311006]={865,866,867}
x890100_g_sitem[30311007]={868,869,870}
x890100_g_sitem[30311008]={871,872,873}
x890100_g_sitem[30311009]={874,875,876}
x890100_g_sitem[30311010]={877,878,879}
x890100_g_sitem[30311011]={880,881,882}
x890100_g_sitem[30311012]={883,884,885}
x890100_g_sitem[30311013]={886,887,888}
x890100_g_sitem[30311014]={889,890,891}
x890100_g_sitem[30311015]={892,893,894}
x890100_g_sitem[30311016]={895,896,897}
x890100_g_sitemmiss  =  {2,5,3,4,1,2,5,3,4,1,3,4,1,3,4,1}
x890100_g_sitem1  =  {30311001,30311002,30311003,30311004,30311005,30311006,30311007,30311008,30311009,30311010,30311011,30311012,30311013,30311014,30311015,30311016}
x890100_g_wujuemijitoxingdenum  =  {WULIMIJIXUEJUEBOOK1,WULIMIJIXUEJUEBOOK2,WULIMIJIXUEJUEBOOK3}

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 

--**********************************
function  x890100_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x890100_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x890100_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x890100_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 
	 local  i  =  1
	 while    GetItemTableIndexByIndex(sceneId,  selfId,  bagId)  ~=  x890100_g_sitem1[i]  do
	 i  =  i  +  1
	 if  i  >  16  then
	 break
	 end
	 end
	 if  x890100_g_sitem1[i]  ==  nil  then
	 x890100_ShowNotice(  sceneId,  selfId,  " bên trong túi ðeo lßng bµ sai l¥m ! ! "  )
	 return  0
	 end
	 if  GetItemTableIndexByIndex(sceneId,  selfId,  bagId)  ~=  x890100_g_sitem1[i]  then
	 x890100_ShowNotice(  sceneId,  selfId,  " bên trong túi ðeo lßng bµ sai l¥m ! ! "  )
	 return  0
	 end
	 -----local  wujuemenpai  =  floor(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  )/1000000)
	 local  wujuemenpai  =  mod(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  ),1000000)
	 local  skillbook1  =  floor(wujuemenpai/10000)
                local  skillbook2  =  floor(mod(wujuemenpai,10000)/100)
	 local  xuejimijinum  =  mod(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  ),100)
	 local  booklistacc  =  {skillbook1,skillbook2,xuejimijinum}
	 -----if    wujuemenpai  ~=  x890100_g_sitemmiss[i]  then
	 -----local  Menpaimis  =  {" ph§t tông "," khí tông "," kiªm tông "," ma tông "," nho tông "}
	 -----x890100_ShowNotice(  sceneId,  selfId,  " xin/m¶i trß¾c xªp vào nåm tuy®t trung ðích "..Menpaimis[x890100_g_sitemmiss[i]]..", m¾i có th¬ h÷c t§p sách này "  )
	 -----return  0
	 -----end
	 local  bookisokitem  =  1
	 for  i  =  1,3  do
	 if  booklistacc[i]  ==  nil  then
	 booklistacc[i]  =  -1
	 end    
	 if  mod(GetItemTableIndexByIndex(sceneId,  selfId,  bagId),100)  ==  booklistacc[i]  and  bookisokitem  ==  1  then
	 bookisokitem  =  0
	 break
	 end
	 end
	 if  bookisokitem  ==  0  then
	 x890100_ShowNotice(  sceneId,  selfId,  " ngài ðã h÷c qua li­u này võ lâm bí t¸ch , xin không c¥n tái di­n h÷c t§p ! ! "  )
	 return  0
	 end
	 local  nostudeybook  =  0
	 for  i  =  1,3  do
	 if  booklistacc[i]  ==  nil  then
	       booklistacc[i]  =  1
	 end      
	 if  booklistacc[i]  <=  0  and  nostudeybook  ==  0  then
	 nostudeybook  =  1
	 break
	 end
	 end
	 if  nostudeybook  ==  0  then
	 x890100_ShowNotice(  sceneId,  selfId,  " ngài s· h÷c ðích võ lâm bí t¸ch ðªm ðã vßþt qua 3 v¯n , xin/m¶i trß¾c quên lãng lÕi h÷c t§p ! ! "  )
	 return  0
	 end
	 if  GetItemTableIndexByIndex(sceneId,  selfId,  bagId)  ~=  x890100_g_sitem1[i]    then

	 	 return  0
	 end
	 
	 if  LuaFnLockCheck(  sceneId,  selfId,  bagId,  0  )  <  0  then
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
function  x890100_OnDeplete(  sceneId,  selfId  )

	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 
	 local  i  =  1
	 while    GetItemTableIndexByIndex(sceneId,  selfId,  bagId)  ~=  x890100_g_sitem1[i]  do
	 i  =  i  +  1
	 if  i  >  16  then
	 break
	 end
	 end
	 if  x890100_g_sitem1[i]  ==  nil  then
	 x890100_ShowNotice(  sceneId,  selfId,  " bên trong túi ðeo lßng bµ sai l¥m ! ! "  )
	 return  0
	 end
	 if  GetItemTableIndexByIndex(sceneId,  selfId,  bagId)  ~=  x890100_g_sitem1[i]    then
	 	 return  0
	 end
                x890100_itemMISS(  sceneId,  selfId,  GetItemTableIndexByIndex(sceneId,  selfId,  bagId),1)
	 if(0<LuaFnDepletingUsedItem(sceneId,  selfId))  then
	 	 return  1;
	 end
	 
	 return  0;
end

--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tø khí cùng thu¤n phát kÛ nång s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i ( tø khí kªt thúc h½n næa các loÕi ði«u ki®n cûng thöa mãn th¶i ði¬m ) , mà dçn d¡t 
-- kÛ nång cûng s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i ( kÛ nång ðích ngay t× ð¥u , tiêu hao thành công thi hành sau ) . 
-- tr· v« 1 : xØ lý thành công ; tr· v« 0 : xØ lý th¤t bÕi . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x890100_OnActivateOnce(  sceneId,  selfId  )
            local  ret  =  x890100_itemMISS(  sceneId,  selfId,  0,2)
            if  ret  ==  0  then
            return
            end

            for  i  =  1,3  do
            AddSkill(  sceneId,  selfId,  x890100_g_sitem[ret][i]  )
            end
            local  jisumiji  =  mod(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  ),1000000)
            local  skillbook1  =  floor(jisumiji/10000)
            local  skillbook2  =  floor(mod(jisumiji,10000)/100)
            local  skillbook3  =  mod(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  ),100)
            local  booklistacc  =  {skillbook1,skillbook2,skillbook3}
            local  valuenumid  =  {10000,100,1}
            local  bookispos  =  0
            
            for  i  =  1,3  do
            if  booklistacc[i]  ==  nil  then
                  booklistacc[i]  =  0
            end      
            if  booklistacc[i]  ==  0  and  bookispos  ==  0  then
            	 bookispos  =  i
            	 break
            end
            end
            if  bookispos  ==  0  then
            x890100_ShowNotice(  sceneId,  selfId,  " s¯ li®u sai l¥m không cách nào h÷c t§p kÛ nång "  )
            return    0
            end	 
            SetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE,mod(ret,100)*valuenumid[bookispos]+GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  )  )	 
            LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  18,  0  )
            x890100_ShowNotice(  sceneId,  selfId,  " chúc m×ng ngß½i h÷c t§p ?#{_ITEM"..ret.."}? trong bí t¸ch ðích t¤t cä kÛ nång "  )
            local  jisumiji  =  mod(GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  ),1000000)
            local  skillbook1  =  floor(jisumiji/10000)+  30311000
            local  skillbook2  =  floor(mod(jisumiji,10000)/100)+  30311000
            local  skillbook3  =  mod(mod(mod(jisumiji,10000),100),100)+  30311000
            local  xiuweijinjue  =  0  
            local  lingwujinjuelevel  =  {}
                          for  i  =  1,3  do
                          xiuweijinjue  =  xiuweijinjue  +  GetMissionData(  sceneId,  selfId,  x890100_g_wujuemijitoxingdenum[i])
                          lingwujinjuelevel[i]  =  GetMissionData(  sceneId,  selfId,  x890100_g_wujuemijitoxingdenum[i])
                          end
            
	             BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,skillbook1)
	             UICommand_AddInt(sceneId,skillbook2)
	             UICommand_AddInt(sceneId,skillbook3)
	             UICommand_AddInt(sceneId,xiuweijinjue)
	             UICommand_AddInt(sceneId,GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE  ))
	             UICommand_AddInt(sceneId,GetMissionData(  sceneId,  selfId,  WULIMIJIXUEJUE_3BOOKS  ))
	             for  i  =  1,3  do
	             UICommand_AddInt(sceneId,lingwujinjuelevel[i])
	             end
	             UICommand_AddString(sceneId,"OPEN_MIJI_PAGE")
	             EndUICommand(sceneId)
	             DispatchUICommand(sceneId,selfId,2013092101)
            return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x890100_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end

function  x890100_ShowNotice(  sceneId,  selfId,  strNotice)
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  strNotice  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )        
end

function  x890100_itemMISS(  sceneId,  selfId,  item,item1)

if  item1  ==  1  then
itemmiss  =  item
return  0
end
if  item1  ==  2  then
if  itemmiss  ~=  nil  then

return  itemmiss
end  
return  0
end
      
end
