-- chú ý : 

-- v§t ph¦m kÛ nång ðích suy lu§n chï có th¬ sØ døng trø cµt kÛ nång và chân v¯n là thñc hi®n 


-- chân v¯n :

-- tr· xu¯ng là chân v¯n dÕng l® :


--4918.lua
------------------------------------------------------------------------------------------
-- mµt loÕi v§t ph¦m ðích cam ch¸u chân v¯n 

-- chân v¯n s¯ 
x334918_g_scriptId  =  334918  -- tÕm th¶i viªt cái này , chân chính dùng th¶i ði¬m nh¤t ð¸nh phäi ð±i .

-- c¥n c¤p b§c 
x334918_g_levelRequire  =  1
--AE phÕm vi bán kính 
x334918_g_radiusAE  =  3.0
--AE ðích møc tiêu quan h® d¤u hi®u 
x334918_g_standFlag  =  1  --  2: ðµi hæu ,   1 : hæu quân ,   -1 : ð¸ch quân 
--AE änh hß·ng s¯ lßþng hÕn chª 
x334918_g_effectCount  =  4  --  -1: không hÕn chª 
-- hi®u quä ID
x334918_g_Impact  =  {}  -- v§t ph¦m id , nhö nh¤t s¯ lßþng , l¾n nh¤t s¯ lßþng 
x334918_g_Impact[30509011]  =  {4918,66}  --999 hoa h°ng 
x334918_g_Impact[38000497]  =  {4918,418}  --999 màu xanh da tr¶i yêu c½ 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x334918_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x334918_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x334918_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x334918_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end

	 -- ðÕt ðßþc v§t ph¦m ID
	 local  Item  =  LuaFnGetItemIndexOfUsedItem(sceneId,  selfId)

	 local  targetId  =  LuaFnGetTargetObjID(sceneId,  selfId)
	 if(0<=targetId)  then
	 	 --  møc tiêu phäi là hæu quân ðích ki¬m tr¡c 
	 	 if  LuaFnIsFriend(sceneId,  targetId,  selfId)  ~=  1  then
	 	 	 LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
	 	 	 return  0;
	 	 end
	 	 
	 	 if  LuaFnIsFriend(sceneId,  selfId,  targetId  )  ~=  1  then
	 	 	 LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
	 	 	 return  0;
	 	 end
	 	 
        local  SelfSex  =  LuaFnGetSex(sceneId,  selfId)
        local  TargetSex  =  LuaFnGetSex(sceneId,  targetId)                                
        if(  SelfSex  ==  TargetSex  )  then
            LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
            
            return  0;                                                                                        
        end  
              
	 	 --  møc tiêu phäi là ð¸ch quân ðích ki¬m tr¡c 
--	 	 if(1~=LuaFnUnitIsEnemy(sceneId,  selfId,  targetId))  then
--	 	 	 LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
--	 	 	 return  0;
--	 	 end
	 	 --  møc tiêu phäi là ðµi hæu ðích ki¬m tr¡c 
--	 	 if(1~=LuaFnUnitIsPartner(sceneId,  selfId,  targetId))  then
--	 	 	 LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
--	 	 	 return  0;
--	 	 end
	 	 --  møc tiêu c¤p b§c ki¬m tr¡c 
--	 	 if(g_LevelRequire<=LuaFnGetLevel(sceneId,  targetId))  then
--	 	 	 LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
--	 	 	 return  0;
--	 	 end
--	 	 if(g_LevelRequire>=LuaFnGetLevel(sceneId,  targetId))  then
--	 	 	 LuaFnSendOResultToPlayer(sceneId,  selfId,  OR_INVALID_TARGET)
--	 	 	 return  0;
--	 	 end

	 end
	 
	 return  1;  -- không c¥n b¤t kÏ ði«u ki®n gì , h½n næa thüy chung tr· v« 1 . 
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x334918_OnDeplete(  sceneId,  selfId  )
	 local  targetId  =  LuaFnGetTargetObjID(sceneId,  selfId)

	 if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  1  then
--	 	 x334918_MsgBox(  sceneId,  selfId,  " ngß½i không có ð¥y ðü túi ðeo lßng không gian "  )
--	 	 return  0
	 end

	 if  LuaFnGetPropertyBagSpace(  sceneId,  targetId  )  <  1  then
	 	 x334918_MsgBox(  sceneId,  selfId,  " ð¯i phß½ng không có ð¥y ðü túi ðeo lßng không gian "  )
	 	 return  0
	 end

	 -- ðÕt ðßþc v§t ph¦m ID
	 local  Item  =  LuaFnGetItemIndexOfUsedItem(sceneId,  selfId)
	 
	 local  nItemBagIndex  =  GetBagPosByItemSn(sceneId,  selfId,  Item);
	 local  szTransfer  =  GetBagItemTransfer(sceneId,selfId,  nItemBagIndex);

	 
	 local  targetId  =  LuaFnGetTargetObjID(sceneId,  selfId)
	 local  szNameSelf  =  GetName(  sceneId,  selfId  );
	 local  szNameTarget  =  GetName(  sceneId,  targetId  );
	 
	 local  randMessage  =  random(3);
	 local  message;

	 --if  randMessage  ==  1  then
	 --	 message  =  format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_00}#{_INFOMSG%s}#{GiveRose_01}#{_INFOUSR%s}#{GiveRose_02}",  szNameSelf,  szTransfer,  szNameTarget  );
	 --elseif  randMessage  ==  2  then	 	 
	 --	 message  =  format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_04}#{_INFOUSR%s}#{GiveRose_05}",  szNameSelf,  szTransfer,  szNameTarget  );
	 --else	 	 
	 --	 message  =  format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_06}#{_INFOUSR%s}#{GiveRose_07}",  szNameSelf,  szTransfer,  szNameTarget  );
	 --end
	 
	 --AddGlobalCountNews(  sceneId,  message  )
	 	 	 
	 if(LuaFnDepletingUsedItem(sceneId,  selfId))  then
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
function  x334918_OnActivateOnce(  sceneId,  selfId  )

	 -- ðÕt ðßþc v§t ph¦m ID
	 local  Item  =  LuaFnGetItemIndexOfUsedItem(sceneId,  selfId)

	 if(-1~=x334918_g_Impact[Item][1])  then
	 	 -- cho mình thêm hi®u quä 
--	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  x334918_g_Impact[Item][1],  0);
	 	 -- cho møc tiêu thêm hi®u quä 
	 	 local  targetId  =  LuaFnGetTargetObjID(sceneId,  selfId)
	 	 if(0<=targetId)  then
	 	 	 if  LuaFnIsFriend(sceneId,  targetId,  selfId)  >  0  then
	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  targetId,  x334918_g_Impact[Item][1],  0);
	 	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  targetId,  x334918_g_Impact[Item][2],  0);
	 	 	 	 
	 	 	 	 local  nFriendPoint  =  LuaFnGetFriendPoint(  sceneId,  selfId,  targetId  );
	 	 	 	 if  nFriendPoint  >=  99999  then
	 	 	 
	 	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 	 AddText(sceneId,  " ngß½i cùng ð¯i phß½ng bÕn t¯t ðµ ðã t¾i thßþng hÕn . ");
	 	 	 	 	 EndEvent(sceneId)
	 	 	 	 	 DispatchMissionTips(sceneId,selfId)	 
	 	 	 	 
	 	 	 	 --else
	 	 	 	 
	 	 	 	 	 --BeginEvent(sceneId)
	 	 	 	 	 --AddText(sceneId,  "");
	 	 	 	 	 --EndEvent(sceneId)
	 	 	 	 	 --DispatchMissionTips(sceneId,selfId)
	 	 	 	 	 
	 	 	 	 end
	 	 	     
	 	 	     local	 namSelf	 	 =  GetName(  sceneId,  selfId  )
	 	 	     local	 namTarget	 =  GetName(  sceneId,  targetId  )
	 	 	 

	 	 	 -- cho ð¯i phß½ng dùng hªt hi®u 
	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  targetId,  targetId,  targetId,  18,  0);	 	 	 

	 	 	 	 	     
	 	 	     -- tß·ng thß·ng 
	 	 	 	 local	 lstBounty	 =
	 	 	 	 {
	 	 	 	 	 [0]	 =  {  0,	 228,  " hoa h°ng tiên tØ "  },	 	 -- næ trang 
	 	 	 	 	 [1]	 =  {  0,	 227,  " tình thánh "  },	 	 	 	 -- nam trang 
	 	 	 	 }
	 	 	     local	 untBounty
	 	 	     if  GetSex(  sceneId,  selfId  )  ==  0  then
	 	 	     	 untBounty	 =  lstBounty[0]
	 	 	     else
	 	 	     	 untBounty	 =  lstBounty[1]
	 	 	     end
	 	 	     --if  TryRecieveItem(  sceneId,  selfId,  untBounty[1],  1  )  >=  0  then
	 	 	     	 --x334918_MsgBox(  sceneId,  selfId,  " ngß½i l¤y ðßþc mµt món "..GetItemName(  sceneId,  untBounty[1]  )  )
	 	 	     --end
	 	 	 	 AwardTitle(  sceneId,  selfId,  8,  untBounty[2]  )
	 	 	 	 LuaFnDispatchAllTitle(  sceneId,  selfId  )	 	 -- ð±i m¾i t¤t cä danh hi®u ðªn CLIENT
	 	 	     --x334918_MsgBox(  sceneId,  selfId,  " ngß½i l¤y ðßþc ["..untBounty[3].."] danh hi®u . "  )
	 	 	     --x334918_MsgBox(  sceneId,  selfId,  " ngß½i si tình cùng hào khí cho phép , tình thánh tr¸ giá tång lên 1 ði¬m "  )
	 	   SetMissionData(  sceneId,  selfId,  QUANQUSONGHUA,GetMissionData(  sceneId,  selfId,QUANQUSONGHUA)+1)	 
	           local  mylevel1  =  GetMissionData(sceneId,  selfId,  QUANQUSONGHUA)
	           CallScriptFunction(  (888899),  "SetDengji",  sceneId,  selfId,mylevel1,2  )


	 	               local  allfirstplayer  =  GetPaiming(sceneId,2)
	                 	   local  nMonsterNum  =  GetMonsterCount(sceneId)
	                   for  i=0,  nMonsterNum-1  do
	 	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 	 local  MosDataID  =  GetMonsterDataID(sceneId,  MonsterId  )
	 	 	 	 if  MosDataID  ==  43539  then
	 	 	 	   SetCharacterName(sceneId,MonsterId,"#G"..allfirstplayer[1].Guid)
	 	                 end
	                 end	 



	 	 	     if  GetSex(  sceneId,  targetId  )  ==  0  then
	 	 	     	 untBounty	 =  lstBounty[0]
	 	 	     else
	 	 	     	 untBounty	 =  lstBounty[1]
	 	 	     end
	 	 	     --if  TryRecieveItem(  sceneId,  targetId,  untBounty[1],  1  )  >=  0  then
	 	 	     	 --x334918_MsgBox(  sceneId,  targetId,  " ngß½i l¤y ðßþc mµt món "..GetItemName(  sceneId,  untBounty[1]  )  )
	 	 	     --end
	 	 	     AwardTitle(  sceneId,  targetId,  8,  untBounty[2]  )
	 	 	     LuaFnDispatchAllTitle(  sceneId,  targetId  )	 -- ð±i m¾i t¤t cä danh hi®u ðªn CLIENT
	 	 	     --x334918_MsgBox(  sceneId,  targetId,  " ngß½i l¤y ðßþc ["..untBounty[3].."] danh hi®u . "  )
	 	 	     --x334918_MsgBox(  sceneId,  targetId,  " ngß½i xinh ð©p cùng ð©p trai cho phép , hoa h°ng tr¸ giá tång lên 1 ði¬m "  )
	 	 	 
	 	 	 SetMissionData(  sceneId,    targetId,  QUANQUSHOUHUA  ,GetMissionData(  sceneId,    targetId,QUANQUSHOUHUA  )+1)	 
	                 local  mylevel  =    GetMissionData(sceneId,    targetId,  QUANQUSHOUHUA  )
	             CallScriptFunction(  (888899),  "SetDengji",  sceneId,    targetId,mylevel,6  )


	 	               local  allfirstplayer  =  GetPaiming(sceneId,6)
	                 	   local  nMonsterNum  =  GetMonsterCount(sceneId)
	                   for  i=0,  nMonsterNum-1  do
	 	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 	 local  MosDataID  =  GetMonsterDataID(sceneId,  MonsterId  )
	 	 	 	 if  MosDataID  ==  43540  then
	 	 	 	   SetCharacterName(sceneId,MonsterId,"#G"..allfirstplayer[1].Guid)
	 	                 end
	                 end	 
	 	 	 
	 	 	 end
	 	 end
	 	 -- mình chung quanh AE
--	 	 local  posX,posZ  =  LuaFnGetUnitPosition(sceneId,  selfId)
--	 	 LuaFnSendImpactAroundPosition(sceneId,  selfID,  posX,  posZ,  x334918_g_radiusAE,  x334918_g_standFlag,  x334918_g_levelRequire,  x334918_g_effectCount,  x334918_g_Impact[Item][1],  0)
	 	 -- chï ð¸nh ð¸a ði¬m chung quanh AE
--	 	 local  posX,posZ  =  LuaFnGetTargetPosition(sceneId,  selfId)
--	 	 LuaFnSendImpactAroundPosition(sceneId,  selfID,  posX,  posZ,  x334918_g_radiusAE,  x334918_g_standFlag,  x334918_g_levelRequire,  x334918_g_effectCount,  x334918_g_Impact[Item][1],  0)
	 	 -- møc tiêu thân th¬ chung quanh AE
--	 	 local  targetId  =  LuaFnGetTargetObjID(sceneId,  selfId)
--	 	 if(0<=targetId)  then
--	 	 	 local  posX,posZ  =  LuaFnGetUnitPosition(sceneId,  targetId)
--	 	 	 LuaFnSendImpactAroundPosition(sceneId,  selfID,  posX,  posZ,  x334918_g_radiusAE,  x334918_g_standFlag,  x334918_g_levelRequire,  x334918_g_effectCount,  x334918_g_Impact[Item][1],  0)
--	 	 end

	 end
	 return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x334918_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end

--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x334918_MsgBox(  sceneId,  selfId,  Msg  )
	 if  Msg  ==  nil  then
	 	 return
	 end
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end