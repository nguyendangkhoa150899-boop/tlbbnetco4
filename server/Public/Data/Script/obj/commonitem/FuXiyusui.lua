-- chân v¯n s¯ 
x892626_g_scriptId  =  892626  -- tÕm th¶i viªt cáii này , chân chính dùng th¶i ði¬m nh¤t ð¸nh phäi ð±i .

function  x892626_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x892626_OnDefaultEvent(  sceneId,  selfId  )

end
--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tr· v« 1 : xØ lý thành công ; tr· v« 0 : xØ lý th¤t bÕi . 
--**********************************
function  x892626_OnActivateOnce(  sceneId,  selfId  )
	 local  itemTblIndex  =  LuaFnGetItemIndexOfUsedItem(  sceneId,  selfId  )
	 
	 if  itemTblIndex==  38002051  then  -- phøc hi ng÷c b¬ 
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x892626_Tips(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end

	                 if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	                       x892626_Tips(  sceneId,  selfId,  " ðÕo cø lan ít nh¤t dñ lßu 2 cái không gian "  )	 
	                       return
	                 end

                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38002051)  <  5  then    -- phøc hi ng÷c b¬ biên s¯ 
                                      x892626_Tips(  sceneId,  selfId,  " c¥n [ phøc hi ng÷c b¬ ] ít nh¤t 5 cái "  )	 
                                      return
                                end

                                if    LuaFnDelAvailableItem(sceneId,selfId,38002051,5)  ~=  1  then
                                        x892626_Tips(  sceneId,  selfId,  "[ phøc hi ng÷c b¬ ] kh¤u tr× th¤t bÕi "  )
                                        return
                                end

                                TryRecieveItem(  sceneId,  selfId,  38002049,  1  )
	 	 x892626_Tips(  sceneId,  selfId," chúc m×ng ngài thành công hþp thành mµt [ phøc hi ng÷c ] . "  )
                                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	 	 return
	 end

end
--**********************************
--  tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x892626_CancelImpacts(  sceneId,  selfId  )
	 return  0
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u , phø trách tiêu hao ki¬m tr¡c cùng thi hành : 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x892626_OnDeplete(  sceneId,  selfId  )
	 return  1
end


--**********************************
--  ði«u ki®n ki¬m tr¡c nh§p kh¦u : tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x892626_OnConditionCheck(  sceneId,  selfId  )
	 return  1
end
--**********************************
--  
--**********************************
function  x892626_IsSkillLikeScript(  sceneId,  selfId)
	 return  1
end
function  x892626_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end