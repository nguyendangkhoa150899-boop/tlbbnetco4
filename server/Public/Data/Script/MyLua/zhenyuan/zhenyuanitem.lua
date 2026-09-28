-- tác giä :  hß äo   11:30  2013-11-15  QQ : 2636158793

x889904_g_scriptId  =  889904
x889904_g_sitem1  =  {}
x889904_g_sitem1[38000387]  =  200
x889904_g_sitem1[38000388]  =  2000
x889904_g_sitem1[38000389]  =  20000
-------------------------- phía dß¾i là th¥n ðïnh diêu th¥n 

x889904_g_sitem1[38000943]=200
x889904_g_sitem1[38000944]=200



x889904_g_sitem1[38000945]=200
x889904_g_sitem1[38000946]=1000
x889904_g_sitem1[38000947]=10000
x889904_g_sitem1[38000948]=200
x889904_g_sitem1[38000949]=1000
x889904_g_sitem1[38000950]=10000
x889904_g_sitem1[38000951]=50000
x889904_g_sitem1[38000952]=50000





x889904_ZhenYuanPa  =  MY_ZHENYUANPA    -- xa g¥n 


-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x889904_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x889904_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x889904_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x889904_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 local  itemTblIndex  =  LuaFnGetItemIndexOfUsedItem(  sceneId,  selfId  );
	 
	 if  x889904_g_sitem1[itemTblIndex]  ==  nil  then
	 x889904_ShowNotice(  sceneId,  selfId," v§t ph¦m nµi bµ sai l¥m ")
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
function  x889904_OnDeplete(  sceneId,  selfId  )
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
function  x889904_OnActivateOnce(  sceneId,  selfId  )
	 	 local  itemTblIndex  =  LuaFnGetItemIndexOfUsedItem(  sceneId,  selfId  );
	     local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )	 
	 if  x889904_g_sitem1[itemTblIndex  ]  ==  nil  then
	 x889904_ShowNotice(  sceneId,  selfId,  " bên trong túi ðeo lßng bµ sai l¥m ! ! "  )
	 return  0
	 end
	 
	     if  itemTblIndex    >=38000387  and  itemTblIndex  <=  38000389  then
            local  YaoChengnum  =  GetMissionData(sceneId,  selfId,  x889904_ZhenYuanPa);
            SetMissionData(sceneId,  selfId,  x889904_ZhenYuanPa,YaoChengnum+x889904_g_sitem1[itemTblIndex  ]);
            LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  151,  0)
            x889904_ShowNotice(  sceneId,  selfId,  " Gia tång thành công "..x889904_g_sitem1[itemTblIndex  ].." ði¬m Nguyên Tinh "  )
            CallScriptFunction((889903),  "OpenZhenYuan",sceneId,  selfId,"u")
	     return  1
            end
      if  itemTblIndex    >=38000945  and  itemTblIndex  <=  38000952  then
        local  YaoChengnum  =  GetMissionData(sceneId,  selfId,  SD_YAOCHEN);
            SetMissionData(sceneId,  selfId,  SD_YAOCHEN,YaoChengnum+x889904_g_sitem1[itemTblIndex  ]);
            LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  151,  0)
            x889904_ShowNotice(  sceneId,  selfId,  " Gia tång thành công  "..x889904_g_sitem1[itemTblIndex  ].." ði¬m Thu¯c Tr¥n "  )
      end

    	         return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x889904_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end

function  x889904_ShowNotice(  sceneId,  selfId,  strNotice)
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  strNotice  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )        
end
