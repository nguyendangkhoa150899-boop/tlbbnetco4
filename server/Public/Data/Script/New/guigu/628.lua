--Chú ý: 

--V§t ph¦m KÛ nång Cüa Logic Chï có th¬ SØ døng C½ s· KÛ nång cùng K¸ch bän g¯c Lai Thñc hi®n 

--K¸ch bän g¯c:

--Dß¾i Th¸ K¸ch bän g¯c DÕng L®:


------------------------------------------------------------------------------------------
--Gi¯ng nhau V§t ph¦m Cüa Cam ch¸u K¸ch bän g¯c 

--K¸ch bän g¯c Hào 
x760628_g_scriptId = 760628 --Lâm th¶i Tä Cái này,Chân chính Dùng Th¶i ði¬m Nh¤t ð¸nh phäi Cäi.

--Yêu c¥u C¤p b§c 

--Hi®u quä ID


--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760628_OnDefaultEvent(sceneId, selfId, bagIndex)
-- Không c¥n Cái này Tiªp l¶i ,Ðãn Yªu Giæ lÕi Không Hàm s¯ 
end

--**********************************
--Cái này V§t ph¦m Cüa SØ døng quá trình Hay không Cùng loÕi v¾i KÛ nång: 
--H® th¯ng Hµi — ch¤p hành B¡t ð¥u khi Ki¬m tra ðo lß¶ng Cái này Hàm s¯ Cüa Phän h°i Tr¸ ,Nªu Phän h°i Th¤t bÕi T¡c Xem nh© M£t sau Cùng loÕi KÛ nång Cüa Ch¤p hành .
--Phän h°i 1#KÛ nång Cùng loÕi V§t ph¦m ,Có th¬ Tiªp tøc Cùng loÕi KÛ nång Cüa Ch¤p hành #Phän h°i 0#Xem nh© M£t sau Thao tác .
--**********************************
function x760628_IsSkillLikeScript(sceneId, selfId)
	return 1; --Cái này Cß¾c B±n yêu c¥u Ðµng tác Duy trì 
end

--**********************************
--Trñc tiªp Hüy bö Hi®u quä: 
--H® th¯ng S¨ trñc tiªp Thuyên chuy¬n Cái này Tiªp l¶i ,T¸nh Cån cÑ Cái này Hàm s¯ Cüa Phän h°i Tr¸ Xác ð¸nh V« sau Lßu trình Hay không Ch¤p hành .
--Phän h°i 1#Ðã Hüy bö Ð¯i Ñng Hi®u quä ,Không h« Ch¤p hành Kª tiªp Thao tác #Phän h°i 0#Không có Ki¬m tra ðo lß¶ng Ðªn Tß½ng quan Hi®u quä ,Tiªp tøc Ch¤p hành .
--**********************************
function x760628_CancelImpacts(sceneId, selfId)
	return 0; --Không c¥n Cái này Tiªp l¶i ,Ðãn Yªu Giæ lÕi Không Hàm s¯,H½n næa Trß¾c sau Phän h°i 0.
end

--**********************************
--Ði«u ki®n Ki¬m tra ðo lß¶ng Nh§p kh¦u: 
--H® th¯ng S¨ · KÛ nång Ki¬m tra ðo lß¶ng Cüa Th¶i gian Ði¬m Thuyên chuy¬n Cái này Tiªp l¶i ,T¸nh Cån cÑ Cái này Hàm s¯ Cüa Phän h°i Tr¸ Xác ð¸nh V« sau Lßu trình Hay không Ch¤p hành .
--Phän h°i 1#Ði«u ki®n Ki¬m tra ðo lß¶ng Thông qua ,Có th¬ Tiªp tøc Ch¤p hành #Phän h°i 0#Ði«u ki®n Ki¬m tra ðo lß¶ng Th¤t bÕi ,Gián ðoÕn Kª tiªp Ch¤p hành .
--**********************************
function x760628_OnConditionCheck(sceneId, selfId)
	--Ki¬m tra SØ døng V§t ph¦m 
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end


	return 1; --Không c¥n B¤t lu§n cái gì ði«u ki®n ,H½n næa Trß¾c sau Phän h°i 1.
end

--**********************************
--Tiêu hao Ki¬m tra ðo lß¶ng C§p XØ lý Nh§p kh¦u: 
--H® th¯ng S¨ · KÛ nång Tiêu Háo th¶i gian Ði¬m Thuyên chuy¬n Cái này Tiªp l¶i ,T¸nh Cån cÑ Cái này Hàm s¯ Cüa Phän h°i Tr¸ Xác ð¸nh V« sau Lßu trình Hay không Ch¤p hành .
--Phän h°i 1#Tiêu hao XØ lý Thông qua ,Có th¬ Tiªp tøc Ch¤p hành #Phän h°i 0#Tiêu hao Ki¬m tra ðo lß¶ng Th¤t bÕi ,Gián ðoÕn Kª tiªp Ch¤p hành .
--Chú ý: Giá Không riêng Phø trách Tiêu hao Ki¬m tra ðo lß¶ng Cûng phø trách Tiêu hao Ch¤p hành .
--**********************************
function x760628_OnDeplete(sceneId, selfId)
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--Chï biªt Ch¤p hành Mµt l¥n Nh§p kh¦u: 
--Tø khí Hòa Thu¤n phát KÛ nång Hµi — tiêu hao Hoàn thành sau Thuyên chuy¬n Cái này Tiªp l¶i #Tø khí Kªt thúc H½n næa Các loÕi Ði«u ki®n Ðô Thöa mãn Th¶i ði¬m #,Nhi Dçn ðß¶ng 
--KÛ nång Cûng s¨ · Tiêu hao xong Thành H§u Thuyên chuy¬n Cái này Tiªp l¶i #KÛ nång Cüa Ngay t× ð¥u ,Tiêu hao Thành công Ch¤p hành Lúc sau #.
--Phän h°i 1#XØ lý Thành công #Phän h°i 0#XØ lý Th¤t bÕi .
--Chú: N½i này là KÛ nång Có hi®u lñc Mµt l¥n Nh§p kh¦u 
--**********************************
function x760628_OnActivateOnce(sceneId, selfId)
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
		local PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5652, 0);
		else
			PlayerSex ="Thiªu hi®p"
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5653, 0);
		end
	
	return 1;
end

--**********************************
--Dçn ðß¶ng Tim ð§p XØ lý Nh§p kh¦u: 
--Dçn ðß¶ng KÛ nång S¨ · M²i l¥n Tim ð§p Kªt thúc Ði®u hát th¸nh hành Døng Cái này Tiªp l¶i .
--Phän h°i: 1Tiªp tøc L¥n sau Tim ð§p #0#Gián ðoÕn Dçn ðß¶ng .
--Chú: N½i này là KÛ nång Có hi®u lñc Mµt l¥n Nh§p kh¦u 
--**********************************
function x760628_OnActivateEachTick(sceneId, selfId)
	return 1; --Không phäi Dçn ðß¶ng Tính K¸ch bän g¯c, Chï Giæ lÕi Không Hàm s¯.
end

--**********************************
-- B¡t m¡t Th¤t bÕi Ð« kÏ 
--**********************************
function x760628_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
