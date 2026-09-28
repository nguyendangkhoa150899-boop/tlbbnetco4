--writer  by  UK  QQ  2269169441
--20150410  18:13
-- theo ðu±i hoàn mÛ ph¦m ch¤t 

x300106_g_scriptId  =  300106
x300106_g_item  =  {[38000396]  =  100,[38000397]  =  500,[38000398]  =  2500}

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x300106_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x300106_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x300106_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x300106_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 --  phán ðoán cái này v§t ph¦m là không phäi là ðã ð¸nh v¸ 
	 if  nil  ==  x300106_g_item[GetItemTableIndexByIndex(sceneId,  selfId,  bagId)]      then

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
function  x300106_OnDeplete(  sceneId,  selfId  )
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 
	 --  phán ðoán cái này v§t ph¦m là không phäi là ðã ð¸nh v¸ 
	 if  nil  ==  x300106_g_item[GetItemTableIndexByIndex(sceneId,  selfId,  bagId)]      then

	 	 return  0
	 end
    	 local  bagiditem  =  LuaFnGetItemTableIndexByIndex(sceneId,  selfId,  bagId)
	 if(0<LuaFnDepletingUsedItem(sceneId,  selfId))  then
	 SetMissionData(  sceneId,  selfId,  RIDEIMPACT1,  bagiditem  )
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
function  x300106_OnActivateOnce(  sceneId,  selfId  )
        local  itemmission  =  GetMissionData(  sceneId,  selfId,  RIDEIMPACT1)
        if  nil  ==  x300106_g_item[itemmission]      then
        x300106_ShowNotice(  sceneId,  selfId,  " v§t ph¦m nµi bµ sai l¥m "  )
        return
        end
          SetMissionData(  sceneId,  selfId,  RIDEIMPACT1,  0  )
	   local  jiayingonsangzhi  =  GetMissionData(  sceneId,  selfId,  SY_PA)
	   SetMissionData(  sceneId,  selfId,SY_PA,jiayingonsangzhi+x300106_g_item[itemmission])
	   LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)
          x300106_ShowNotice(  sceneId,  selfId,  "Gia tång thành công["..  x300106_g_item[itemmission].."] ði¬m Chân Nguyên Tinh Tuý. "  )
	   CallScriptFunction(  300105,  "UpWinDow",  sceneId,  selfId,0)
	 return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x300106_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end

function  x300106_ShowNotice(  sceneId,  selfId,  strNotice)
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  strNotice  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )        
end