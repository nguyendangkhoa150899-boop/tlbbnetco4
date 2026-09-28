-- 300068 
-- Èó»êµ¤
-- Ê¹ÓÃÖ®ºóÓÀ¾ÃÔö¼Ó5µãÇ±ÄÜ¡£

-- ½Å±¾ºÅ
x300068_g_scriptId = 300068

-- Èó»êµ¤
x300068_g_ItemId = 30900078
--**********************************
-- ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x300068_OnDefaultEvent( sceneId, selfId, nItemIndex)
	-- ÊÇ·ñÊ¹ÓÃ¹ýÈó»êµ¤£¬Ä¿Ç°Ö»ÓÐÈó»êµ¤»á¶ÔMD_EX_HUMAN_QIANNENG_SUBJOIN½øÐÐ²Ù×÷
	local Runhundan_Point = GetMissionData( sceneId, selfId, MD_EX_HUMAN_QIANNENG_SUBJOIN )
	if( Runhundan_Point > 10 ) then
		BeginEvent( sceneId )
			AddText( sceneId, "Chï có th¬ sØ døng 1 l¥n trong ngày" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	else
		if( x300068_DelRunhundan(sceneId, selfId, nItemIndex ) > 0 ) then
			
			--¼ÓÉÏ5¸ö¶îÍâÊôÐÔµã
			local RemainPoint = GetPlayerRemainPoints(sceneId, selfId)
			RemainPoint = RemainPoint + 35
			SetPlayerRemainPoints(sceneId, selfId, RemainPoint)
			
			--¼ÇÂ¼Èó»êµ¤¶îÍâ¼Ó³Éµã£¬Èó»êµ¤¼Ó³ÉµãÖ»ÓÐ5
			SetMissionData( sceneId, selfId, MD_EX_HUMAN_QIANNENG_SUBJOIN, 5 )
			AuditRunHunDan( sceneId, selfId, x300068_g_ItemId )
			
			BeginEvent( sceneId )
				AddText( sceneId, "Các hÕ ðã nh§n ðßþc 35 ði¬m tìm nång." )
			EndEvent( sceneId )
			DispatchEventList( sceneId,selfId,-1 )
		end
	end
	
--
--		INT nQianNeng = pHuman->GetMissionData(MD_EX_HUMAN_QIANNENG_SUBJOIN) + 5;
--		pHuman->SetMissionData(MD_EX_HUMAN_QIANNENG_SUBJOIN, nQianNeng);
--
end

function x300068_IsSkillLikeScript( sceneId, selfId )
 	return 0
end

function x300068_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end


function x300068_DelRunhundan( sceneId, selfId, nItemIndex)
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId == x300068_g_ItemId then
		local EraseRet = EraseItem( sceneId, selfId, nItemIndex )
		if EraseRet < 0 then      --Èç¹ûÉ¾³ýÊ§°Ü,½«²»»áÔö¼ÓÍæ¼ÒÊôÐÔ
			return 0
		else
			return 1			--É¾³ý³É¹¦
		end
	else
		return 0
	end
end
