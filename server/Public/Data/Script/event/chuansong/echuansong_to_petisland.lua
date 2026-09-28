--ÊÂ¼þ
--´«ËÍµ½ÕäÊÞµº

--½Å±¾ºÅ
x400918_g_ScriptId = 400918

--ÈÎÎñÎÄ±¾ÃèÊö
x400918_g_MissionName="Ðªn Huy«n Vû Ðäo"
x400918_g_MissionInfo="Chuy¬n ðªn Trân thú ðäo"  --ÈÎÎñÃèÊö
x400918_g_MissionTarget="Chuy¬n ðªn Trân thú ðäo"		--ÈÎÎñÄ¿±ê
x400918_g_ContinueInfo="Chuy¬n ðªn Trân thú ðäo"		--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x400918_g_MissionComplete="Chuy¬n ðªn Trân thú ðäo"					--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

--**********************************
--Èë¿Úº¯Êý
--**********************************
function x400918_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾

	-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓÐ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, 40002000) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Các hÕ ðang giæ ngân phiªu, chÕy thß½ng nhân! Ta không th¬ giúp ðßþc." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--äîÔËÏà¹Ø
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				BeginEvent( sceneId )
					AddText( sceneId, "  Thành viên trong nhóm ngß½i có ngß¶i có nhi®m vø ch· hàng b¢ng ðß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho ngß½i" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Các hÕ có nhi®m vø ch· hàng b¢ng ðß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho ngß½i" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 39, 109, 25)

end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x400918_OnEnumerate( sceneId, selfId, targetId )
	--µÈ¼¶´ïµ½10¼¶¾ÍÏÔÊ¾´«ËÍÑ¡Ïî
	if GetLevel( sceneId, selfId ) >= 10 then
		AddNumText(sceneId,x400918_g_ScriptId,x400918_g_MissionName, 9, -1)
	else
		return
	end
end
