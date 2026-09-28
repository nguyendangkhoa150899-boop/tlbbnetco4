
x889823_g_scriptId = 889823
x889823_g_sitem1 = {}
x889823_g_sitem1[38002011]=100
x889823_g_sitem1[38002012]=100
x889823_g_sitem1[38002013]=500
x889823_g_sitem1[38002014]=500
x889823_g_sitem1[38002015]=1000
x889823_g_sitem1[38002016]=1000


--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x889823_OnDefaultEvent(sceneId, selfId, bagIndex)
-- Không c¥n Cái này Tiªp l¶i ,Ðãn Yªu Giæ lÕi Không Hàm s¯ 
end

--**********************************
--Cái này V§t ph¦m Cüa SØ døng quá trình Hay không Cùng loÕi v¾i KÛ nång: 
--H® th¯ng Hµi — ch¤p hành B¡t ð¥u khi Ki¬m tra ðo lß¶ng Cái này Hàm s¯ Cüa Phän h°i Tr¸ ,Nªu Phän h°i Th¤t bÕi T¡c Xem nh© M£t sau Cùng loÕi KÛ nång Cüa Ch¤p hành .
--Phän h°i 1:KÛ nång Cùng loÕi V§t ph¦m ,Có th¬ Tiªp tøc Cùng loÕi KÛ nång Cüa Ch¤p hành ;Phän h°i 0:Xem nh© M£t sau Thao tác .
--**********************************
function x889823_IsSkillLikeScript(sceneId, selfId)
	return 1; --Cái này Cß¾c B±n yêu c¥u Ðµng tác Duy trì 
end

--**********************************
--Trñc tiªp Hüy bö Hi®u quä: 
--H® th¯ng S¨ trñc tiªp Thuyên chuy¬n Cái này Tiªp l¶i ,T¸nh Cån cÑ Cái này Hàm s¯ Cüa Phän h°i Tr¸ Xác ð¸nh V« sau Lßu trình Hay không Ch¤p hành .
--Phän h°i 1:Ðã Hüy bö Ð¯i Ñng Hi®u quä ,Không h« Ch¤p hành Kª tiªp Thao tác ;Phän h°i 0:Không có Ki¬m tra ðo lß¶ng Ðªn Tß½ng quan Hi®u quä ,Tiªp tøc Ch¤p hành .
--**********************************
function x889823_CancelImpacts(sceneId, selfId)
	return 0; --Không c¥n Cái này Tiªp l¶i ,Ðãn Yªu Giæ lÕi Không Hàm s¯,H½n næa Trß¾c sau Phän h°i 0.
end

--**********************************
--Ði«u ki®n Ki¬m tra ðo lß¶ng Nh§p kh¦u: 
--H® th¯ng S¨ · KÛ nång Ki¬m tra ðo lß¶ng Cüa Th¶i gian Ði¬m Thuyên chuy¬n Cái này Tiªp l¶i ,T¸nh Cån cÑ Cái này Hàm s¯ Cüa Phän h°i Tr¸ Xác ð¸nh V« sau Lßu trình Hay không Ch¤p hành .
--Phän h°i 1:Ði«u ki®n Ki¬m tra ðo lß¶ng Thông qua ,Có th¬ Tiªp tøc Ch¤p hành ;Phän h°i 0:Ði«u ki®n Ki¬m tra ðo lß¶ng Th¤t bÕi ,Gián ðoÕn Kª tiªp Ch¤p hành .
--**********************************
function x889823_OnConditionCheck(sceneId, selfId)
	--Ki¬m tra SØ døng V§t ph¦m 
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local	bagId	= LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	
	if x889823_g_sitem1[itemTblIndex] == nil then
	x889823_ShowNotice(sceneId, selfId,"V§t ph¦m Bên trong Sai l¥m")
	return 0
	end

	if LuaFnLockCheck(sceneId, selfId, bagId, 0) <0 then
		return 0
	end		
	return 1; --Không c¥n B¤t lu§n cái gì ði«u ki®n ,H½n næa Trß¾c sau Phän h°i 1.
end

--**********************************
--Tiêu hao Ki¬m tra ðo lß¶ng C§p XØ lý Nh§p kh¦u: 
--H® th¯ng S¨ · KÛ nång Tiêu Háo th¶i gian Ði¬m Thuyên chuy¬n Cái này Tiªp l¶i ,T¸nh Cån cÑ Cái này Hàm s¯ Cüa Phän h°i Tr¸ Xác ð¸nh V« sau Lßu trình Hay không Ch¤p hành .
--Phän h°i 1:Tiêu hao XØ lý Thông qua ,Có th¬ Tiªp tøc Ch¤p hành ;Phän h°i 0:Tiêu hao Ki¬m tra ðo lß¶ng Th¤t bÕi ,Gián ðoÕn Kª tiªp Ch¤p hành .
--Chú ý: Giá Không riêng Phø trách Tiêu hao Ki¬m tra ðo lß¶ng Cûng phø trách Tiêu hao Ch¤p hành .
--**********************************
function x889823_OnDeplete(sceneId, selfId)
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--Chï biªt Ch¤p hành Mµt l¥n Nh§p kh¦u: 
--Tø khí Hòa Thu¤n phát KÛ nång Hµi — tiêu hao Hoàn thành sau Thuyên chuy¬n Cái này Tiªp l¶i (Tø khí Kªt thúc H½n næa Các loÕi Ði«u ki®n Ðô Thöa mãn Th¶i ði¬m ),Nhi Dçn ðß¶ng 
--KÛ nång Cûng s¨ · Tiêu hao xong Thành H§u Thuyên chuy¬n Cái này Tiªp l¶i (KÛ nång Cüa Ngay t× ð¥u ,Tiêu hao Thành công Ch¤p hành Lúc sau ).
--Phän h°i 1:XØ lý Thành công ;Phän h°i 0:XØ lý Th¤t bÕi .
--Chú: N½i này là KÛ nång Có hi®u lñc Mµt l¥n Nh§p kh¦u 
--**********************************
function x889823_OnActivateOnce(sceneId, selfId)
 local itemTblIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
 local	bagId	= LuaFnGetBagIndexOfUsedItem(sceneId, selfId)	
 if x889823_g_sitem1[itemTblIndex] == nil then
   x889823_ShowNotice(sceneId, selfId,"L²i nµi bµ - Liên h® GM")
   return 0
 end

  if itemTblIndex>=38002011 and itemTblIndex <= 38002016 then
   local QiLingnum = mod(GetMissionData(sceneId, selfId, MD_XIEZI_QILINGZHI),100000);
   if QiLingnum + x889823_g_sitem1[itemTblIndex]>= 99999 then
     x889823_ShowNotice(sceneId, selfId,"Khª Linh ðang ð¥y , vui lòng sØ døng b¾t ði¬m Khª Linh sau ðó thØ lÕi.")
     return 0
   end
   SetMissionData(sceneId, selfId, MD_XIEZI_QILINGZHI,floor(GetMissionData(sceneId, selfId, MD_XIEZI_QILINGZHI)/100000)+QiLingnum+x889823_g_sitem1[itemTblIndex]);
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
   CallScriptFunction(889138,"YuShouOpen",sceneId,selfId,1)
   x889823_ShowNotice(sceneId, selfId,"Gia tång "..x889823_g_sitem1[itemTblIndex].." Ði¬m Khª Linh")
	return 1;
  end
end
--**********************************
--Dçn ðß¶ng Tim ð§p XØ lý Nh§p kh¦u: 
--Dçn ðß¶ng KÛ nång S¨ · M²i l¥n Tim ð§p Kªt thúc Ði®u hát th¸nh hành Døng Cái này Tiªp l¶i .
--Phän h°i: 1Tiªp tøc L¥n sau Tim ð§p ;0:Gián ðoÕn Dçn ðß¶ng .
--Chú: N½i này là KÛ nång Có hi®u lñc Mµt l¥n Nh§p kh¦u 
--**********************************
function x889823_OnActivateEachTick(sceneId, selfId)
	return 1; --Không phäi Dçn ðß¶ng Tính K¸ch bän g¯c, Chï Giæ lÕi Không Hàm s¯.
end
function x889823_ShowNotice(sceneId, selfId, strNotice)
	BeginEvent(sceneId)
		AddText(sceneId, strNotice)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)  
end


