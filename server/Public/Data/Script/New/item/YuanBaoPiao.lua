-- chân v¯n s¯ 
x100001_g_scriptId  =  100001  -- tÕm th¶i viªt cái này , chân chính dùng th¶i ði¬m nh¤t ð¸nh phäi ð±i .

function  x100001_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x100001_OnDefaultEvent(  sceneId,  selfId  )

end
--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tr· v« 1 : xØ lý thành công ; tr· v« 0 : xØ lý th¤t bÕi . 
--**********************************
function  x100001_OnActivateOnce(  sceneId,  selfId  )
	 local  itemTblIndex  =  LuaFnGetItemIndexOfUsedItem(  sceneId,  selfId  )
	 
	 if  itemTblIndex==  39910001  then  --1000 ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  1000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
	 if  itemTblIndex==  39910002  then  --2000 ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  2000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
	 if  itemTblIndex==  39910003  then  --5000 ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  5000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
	 if  itemTblIndex==  39910004  then  --1W ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  10000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
	 if  itemTblIndex==  39910005  then  --5W ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  50000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
	 if  itemTblIndex==  39910006  then  --10W ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  100000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
	 if  itemTblIndex==  39900000  then  --20W ði¬m nguyên bäo phiªu 
	 	 local  Piao  =  200000
	 	 local  bRet  =  0;
	 	 local	 bagpos  =  GetItemBagPos(  sceneId,  selfId,  itemTblIndex,  0  )
	 	 if  LuaFnLockCheck(  sceneId,  selfId,  bagpos,  0  )  <  0  then
	 	 	 local  nItemNum  =  LuaFnGetAvailableItemCount(  sceneId,  selfId,  itemTblIndex  );	 
	 	 	 if  nItemNum  <=  0  then
	 	 	 	 x100001_MsgBox(  sceneId,  selfId,  targetId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 	 	 return  0;
	 	 	 end
	 	 end
	 	 YuanBao(sceneId,selfId,-1,1,  Piao  )
	 	 x100001_Tips(  sceneId,  selfId," Gia Tång thành công "..(Piao).." ði¬m nguyên bäo . "  )
	 	 LuaFnDelAvailableItem(sceneId,selfId,itemTblIndex,1)	 -- thü tiêu v§t ph¦m 
	 	 return
	 end
	 
end
--**********************************
--  tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x100001_CancelImpacts(  sceneId,  selfId  )
	 return  0
end

--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u , phø trách tiêu hao ki¬m tr¡c cùng thi hành : 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x100001_OnDeplete(  sceneId,  selfId  )
	 return  1
end


--**********************************
--  ði«u ki®n ki¬m tr¡c nh§p kh¦u : tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x100001_OnConditionCheck(  sceneId,  selfId  )
	 return  1
end
--**********************************
--  
--**********************************
function  x100001_IsSkillLikeScript(  sceneId,  selfId)
	 return  1
end
function  x100001_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ .
end