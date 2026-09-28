-- chú ý : 

-- v§t ph¦m kÛ nång ðích suy lu§n chï có th¬ sØ døng trø cµt kÛ nång và chân v¯n là thñc hi®n 
-- chân v¯n s¯ 
x300088_g_scriptId  =  300088

x300088_g_event  =  808131

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x300088_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )

-- nguy®n linh tuy«n sØ døng # vô ích #
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành # tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x300088_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác # tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x300088_CancelImpacts(  sceneId,  selfId  )
	 return  0;
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành # tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x300088_OnConditionCheck(  sceneId,  selfId  )

            if  sceneId~=4  then
                BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " chï có · thái h° cänh tßþng m¾i có th¬ hÑa nguy®n ! "  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
                return  0
end
        local  xycs  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  40001113)
	 if  xycs  ==  5    then
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " hÑa nguy®n nhi®m vø ðã hoàn thành , không th¬ sØ døng næa nguy®n linh tuy«n ! "  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
                return  0
	 end
                -- nhi®m vø ðÕt thành t÷a ðµ ði¬m 
	 treasureX  =  157
	 treasureZ  =  188

	 -- l¤y ðßþc nhà ch½i trß¾c m£t t÷a ðµ 
	 PlayerX  =  GetHumanWorldX(sceneId,selfId)
	 PlayerZ  =  GetHumanWorldZ(sceneId,selfId)

	 Distance  =  floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))

	 if  Distance  >  5  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId," xin/m¶i · thái h° hÑa nguy®n cây (157,188) phø c§n sØ døng [ nguy®n linh tuy«n ] , trß¾c m£t t÷a ðµ khoäng cách hÑa nguy®n cây còn có "..Distance.." thß¾c ")
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
                return  0
end


              return    CallScriptFunction(x300088_g_event,"CheckAccept",sceneId,  selfId,  -1,  -1)
        
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành # tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x300088_OnDeplete(  sceneId,  selfId  )
	 return  1;  -- không tiêu hao 
end

--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tø khí cùng thu¤n phát kÛ nång s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i # tø khí kªt thúc h½n næa các loÕi ði«u ki®n cûng thöa mãn th¶i ði¬m # , mà dçn d¡t 
-- kÛ nång cûng s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i # kÛ nång ðích ngay t× ð¥u , tiêu hao thành công thi hành sau # . 
-- tr· v« 1 : xØ lý thành công # tr· v« 0 : xØ lý th¤t bÕi . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x300088_OnActivateOnce(  sceneId,  selfId  )

            if  sceneId==4  then
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  146,  0);
	 CallScriptFunction(x300088_g_event,"OnUseItem",sceneId,  selfId,  -1)
	 return  1;

	 else
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " hÑa nguy®n th¤t bÕi , xin xác nh§n ngß½i có hay không nh§n nhi®m vø ! "  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
	 end
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim #0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x300088_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end
