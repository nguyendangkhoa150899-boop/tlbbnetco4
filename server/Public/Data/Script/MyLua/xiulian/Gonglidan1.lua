-- chú ý : 

-- v§t ph¦m kÛ nång ðích suy lu§n chï có th¬ sØ døng trø cµt kÛ nång và chân v¯n là thñc hi®n 

-- chân v¯n :

-- tr· xu¯ng là chân v¯n dÕng l® :


--obj_71.lua
------------------------------------------------------------------------------------------
-- mµt loÕi v§t ph¦m ðích cam ch¸u chân v¯n 

-- chân v¯n s¯ 
x390102_g_scriptId  =  390102  -- tÕm th¶i viªt cái này , chân chính dùng th¶i ði¬m nh¤t ð¸nh phäi ð±i .

-- c¥n c¤p b§c 

-- hi®u quä ID
x390102_g_Impact1  =  3003  -- tÕm th¶i viªt cái này 
x390102_g_Impact2  =  -1  -- không c¥n 
x390102_g_SpecailObj  =  94--

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x390102_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end

--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x390102_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v¯n c¥n ðµng tác üng hµ 
end

--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x390102_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end

--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x390102_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end
                local  VIP=GetMissionData(sceneId,selfId,CHONG_ZHI_CHONGSHU)
	 local  gongli=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )	 
	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,  XIULIAN_GONG_CS  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()
	 if  nDayCount  ==  -1  then
--	 	 x390102_NotifyTips(  sceneId,  selfId,  "GetMissionData tác dçn càng gi¾i , xin/m¶i ki¬m tra ScriptGlobal.lua")
	 return  0
	 elseif  nLastDay  ==  nToday  and  nCount  >=  tonumber(5+VIP)  then
                                x390102_NotifyTips(  sceneId,  selfId,  " ngài hôm nay dùng công lñc ðan s¯ lßþng ðã ðÕt l¾n nh¤t tr¸ giá , tång lên VIP c¤p b§c có th¬ gia tång m²i ngày dùng công lñc ðan s¯ l¥n . "  )
	 return  0
                elseif  gongli  >=  100  then
	 	 x390102_NotifyTips(  sceneId,  selfId,  " công lñc cüa ngß½i trß¾c m£t ðã ð¥y , không c¥n gia tång "  )
                      return  0
	 else
	 	 	 return  1;
	 end
  -- không c¥n b¤t kÏ ði«u ki®n gì , h½n næa thüy chung tr· v« 1 . 
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x390102_OnDeplete(  sceneId,  selfId  )
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
function  x390102_OnActivateOnce(  sceneId,  selfId  )

                local  VIP=GetMissionData(sceneId,selfId,CHONG_ZHI_CHONGSHU)
	 local  gongli=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )
	 local  num=100	 -- n½i này là cái này v§t ph¦m thêm công lñc ðích tr¸ s¯ 
	 local  total=gongli+num

	 if  total>100  then	 -- cái này là kh¯ng chª công lñc ðích l¾n nh¤t tr¸ giá là 100
	 	 total=100
	 end
	 SetMissionData(sceneId,  selfId,  XIULIAN_GONGLI,  total);
	 CallScriptFunction(  390101,  "ReturnAttr",  sceneId,  selfId  )	 -- phàm là sØa ð±i ðªn tu luy®n thuµc tính ðích , ð«u phäi cµng thêm chuyªn ði này , ð¬ cho khách hàng bßng ðích bi¬u hi®n cùng bß¾c 
	 x390102_NotifyTips(  sceneId,  selfId,  " công lñc cüa ngß½i tång lên 100"  )

	 local  nDayCount  =  GetMissionData(  sceneId,  selfId,  XIULIAN_GONG_CS  )
	 local  nLastDay  =  GetHighWord(  nDayCount  )
	 local  nCount  =  GetLowWord(  nDayCount  )
	 local  nToday  =  GetDayTime()
	 	 	 -- ð±i m¾i s¯ l¥n 
	 	 	 local  nData  =  0
	 	 	 if  nLastDay  ~=  nToday  then
	 	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 	 nData  =  SetLowWord(  nData,  1  )
	 	 	 else
	 	 	 	 nData  =  SetHighWord(  nData,  nToday  )
	 	 	 	 nData  =  SetLowWord(  nData,  nCount  +  1  )
	 	 	 end
	 	 	 SetMissionData(  sceneId,  selfId,  XIULIAN_GONG_CS,  nData  )

                if  VIP  <=  1  then
	       x390102_NotifyTips(  sceneId,  selfId,  " ngài là bình thß¶ng hµi viên , m²i ngày nhßng dùng công lñc ðan 5 viên , trß¾c m£t ðã dùng "..tonumber(nCount+1).." viên , còn có th¬ dùng "..tonumber(5-nCount-1).." viên   "  )
                else
	       x390102_NotifyTips(  sceneId,  selfId,  " ngài là VIP"..VIP.." c¤p hµi viên , m²i ngày nhßng dùng công lñc ðan "..tonumber(VIP+5).." viên , trß¾c m£t ðã dùng "..tonumber(nCount+1).." viên , còn có th¬ dùng "..tonumber(VIP+5-nCount-1).." viên   "  )
                end
	 	 
	 return  1;
end

--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x390102_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end


--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x390102_NotifyTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end