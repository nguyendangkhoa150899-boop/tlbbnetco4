-- chú ý : 

-- v§t ph¦m kÛ nång ðích suy lu§n chï có th¬ sØ døng trø cµt kÛ nång và chân v¯n là thñc hi®n 

-- chân v¯n :

-- tr· xu¯ng là chân v¯n dÕng l® :


--obj_71.lua
------------------------------------------------------------------------------------------
-- mµt loÕi v§t ph¦m ðích cam ch¸u chân v¯n 

-- chân v¯n s¯ 
x507012_g_scriptId  =  507012  -- tÕm th¶i viªt cái này , chân chính dùng th¶i ði¬m nh¤t ð¸nh phäi ð±i .

-- c¥n c¤p b§c 

-- hi®u quä ID
x507012_g_Impact1  =  3003  -- tÕm th¶i viªt cái này 
x507012_g_Impact2  =  -1  -- không c¥n 
x507012_g_SpecailObj  =  94--

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x507012_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x507012_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x507012_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x507012_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end

                local  DoubleKillNum  =  floor(GetMissionData(sceneId,selfId,WUYI_KILL_NUM)/10000)
                if  DoubleKillNum  <  0  then
	       x507012_NotifyTip(  sceneId,  selfId,  "GetMissionData tác dçn càng gi¾i , xin/m¶i ki¬m tra ScriptGlobal.lua")
	       return  0
	 elseif  DoubleKillNum  >  2500  then
	       x507012_NotifyTip(  sceneId,  selfId,  " ngß½i ðã t°n tÕi khá nhi«u ðích g¤p ðôi nµi tÑc giªt trách ðªm , tÕm th¶i không cách nào tiªp tøc gia tång ! ")
	       return  0
                end

	 return  1;

  -- không c¥n b¤t kÏ ði«u ki®n gì , h½n næa thüy chung tr· v« 1 . 
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x507012_OnDeplete(  sceneId,  selfId  )
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
function  x507012_OnActivateOnce(  sceneId,  selfId  )

                local  DoubleKillNum  =  floor(GetMissionData(sceneId,selfId,WUYI_KILL_NUM)/10000)
                if  DoubleKillNum  <  0  then
	       x507012_NotifyTip(  sceneId,  selfId,  "GetMissionData tác dçn càng gi¾i , xin/m¶i ki¬m tra ScriptGlobal.lua")
	       return  0
	 elseif  DoubleKillNum  >  2500  then
	       x507012_NotifyTip(  sceneId,  selfId,  " ngß½i ðã t°n tÕi khá nhi«u ðích g¤p ðôi nµi tÑc giªt trách ðªm , tÕm th¶i không cách nào tiªp tøc gia tång ! ")
	       return  0
                end

                SetMissionData(sceneId,selfId,WUYI_KILL_NUM,GetMissionData(sceneId,selfId,WUYI_KILL_NUM)+5000000)
	 x507012_NotifyTip(  sceneId,  selfId,  " chúc m×ng , g¤p ðôi nµi tÑc giªt trách ðªm +500")

	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,1);
	       UICommand_AddInt(sceneId,0);
	       EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  201711091  )	 	 
        return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x507012_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end

--**********************************
-- màn änh trung gian ð« kÏ : 
--**********************************
function  x507012_NotifyTip(  sceneId,  selfId,  Tips)
	       BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tips  )
	       EndEvent(  sceneId  )
	       DispatchMissionTips(  sceneId,  selfId  )
end