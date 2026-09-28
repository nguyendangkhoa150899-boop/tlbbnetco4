-- hÕt tØ loÕi hoa chân v¯n     xích sa # hÕt   QQ-718805400
-- hoa loÕi chân v¯n 
-- xin/m¶i tôn tr÷ng nguyên sang , chuy¬n tái xin/m¶i chú thích xu¤t xÑ , cám ½n ~

-- chân v¯n s¯ 
x335700_g_scriptId  =  335700

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành # tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x335700_OnDefaultEvent(  sceneId,  selfId  )

end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành # tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x335700_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác # tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x335700_CancelImpacts(  sceneId,  selfId  )
	 return  0;
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành # tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x335700_OnConditionCheck(  sceneId,  selfId  )

            if  sceneId~=2  then
                BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " Chï có th¬ ðªn ÐÕi Lý ðß¶ng ÐÕi Lµ Ðông ho£c là ÐÕi Lµ Tây m¾i có th¬ gieo m¥m "  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
                return  0
            end

	 -- l¤y ðßþc nhà ch½i trß¾c m£t t÷a ðµ 
	 PlayerX  =  GetHumanWorldX(sceneId,selfId)
	 PlayerZ  =  GetHumanWorldZ(sceneId,selfId)

            if  (  PlayerX  <  40  or  PlayerX  >  293  )  or  (  PlayerZ  <  141  or  PlayerZ  >  155  )  then
                BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " V¸ trí này không th¬ gieo m¥m, chï có th¬ ðªn ÐÕi Lµ Ðông ho£c là ÐÕi Lµ Tây m¾i có th¬ loÕi gieo m¥m hÕt gi¯ng"  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
                return  0
            end

                return  1
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành # tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x335700_OnDeplete(  sceneId,  selfId  )
	 return  1;  -- không tiêu hao 
end

--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tø khí cùng thu¤n phát kÛ nång s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i # tø khí kªt thúc h½n næa các loÕi ði«u ki®n cûng thöa mãn th¶i ði¬m # , mà dçn d¡t 
-- kÛ nång cûng s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i # kÛ nång ðích ngay t× ð¥u , tiêu hao thành công thi hành sau # . 
-- tr· v« 1 : xØ lý thành công # tr· v« 0 : xØ lý th¤t bÕi . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x335700_OnActivateOnce(  sceneId,  selfId  )

            if  sceneId==2  then
	 --LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  18,  0);

	 x335700_OnImpactFadeOut(  sceneId,  selfId  )
	 else
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " v§t ph¦m sØ døng th¤t bÕi , xin liên lÕc GM"  )
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
function  x335700_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end

--**********************************
-- tr°ng tr÷t thành công : 
--**********************************
function  x335700_OnImpactFadeOut(  sceneId,  selfId  )

  	 local  PlayerName=GetName(sceneId,selfId)
	 local  guid  =  LuaFnGetGUID(sceneId,  selfId)    ---- l¤y ðßþc nhân v§t GUID
                DelItem(  sceneId,  selfId,  30505260,  1  )
	 local  nMonsterId  =  LuaFnCreateMonster(sceneId,  90,  GetHumanWorldX(sceneId,selfId)+1,  GetHumanWorldZ(sceneId,selfId)+1,  3,  -1,  335701  )
                SetCharacterName(sceneId,  nMonsterId,  "M¥m Cây Tr°ng cüa "..PlayerName.."")
	 LuaFnSetLifeTimeAttrRefix_AttackPhysics(  sceneId,  nMonsterId,  guid  )
	 SetCharacterDieTime(sceneId,  nMonsterId1,  600000)

                if  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ==  mod(GetWeekTime(),10)  then
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  1  and  mod(floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^6),100)  <  10  then
                            SetMissionData(sceneId,selfId,GONGZI_1,GetMissionData(sceneId,selfId,GONGZI_1)+10^6)
                      end
                end
end