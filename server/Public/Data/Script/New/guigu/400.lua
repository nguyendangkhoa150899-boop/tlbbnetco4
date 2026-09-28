--Ðµng thái Sinh thành Cüa Cß½ng thi 

x760400_g_scriptId=760400



--**********************************

--Sñ ki®n Lçn nhau Nh§p kh¦u 

--**********************************

function x760400_OnDefaultEvent(sceneId, selfId, targetId)

	--Phán ðoán Hay không Có th¬ Kích hoÕt Cai npcCüa Ði«u ki®n 

	--PrintStr("haha...Ta là Cß½ng thi")

	local npcLevel = GetCharacterLevel(sceneId, targetId)

	local teamCount = GetTeamMemberCount(sceneId, selfId)

	local teamLeaderID = GetTeamLeader(sceneId, selfId)

	local teamLeaderLevel = GetCharacterLevel(sceneId, teamLeaderID)

	

	--PrintNum(teamLeaderID)

	--PrintNum(teamCount)

	--PrintNum(teamLeaderLevel)

	--PrintNum(npcLevel)

	
	--L¤y ðßþc Ngß¶i ch½i Phø c§n Ðµi hæu S¯ lßþng (Bao g°m Chính mình )
	local nearteammembercount = GetNearTeamCount(sceneId, selfId)
	if nearteammembercount <1 then	

		BeginEvent(sceneId)

			AddText(sceneId,"Ðäm Dám xem thß¶ng Ngã ,Ngß½i Yêu c¥u Chính mình khai Cái T± Nhân s¯ B¤t HÕn ð¸nh ,Nhßng là C¥n phäi có T± Nga, Ha ha .")

		EndEvent(sceneId)

		DispatchEventList(sceneId,selfId,targetId)

		return

	elseif teamLeaderLevel <npcLevel then

		--Ð« kÏ Ði«u ki®n Không hþp 

		BeginEvent(sceneId)

			AddText(sceneId,"Ðäm Dám xem thß¶ng Ngã ,C¤p b§c LÕi cao Ta Li«n biªt Sñ lþi hÕi cüa ta R°i")

		EndEvent(sceneId)

		DispatchEventList(sceneId,selfId,targetId)

		return



	else

		--Kích hoÕt npc

		--PrintStr("active npc...")

		--Thiªt trí Ð¯i Quái Là ð¸ch Ð¯i Trß¾c m¡t Th¸ 28Hào Th¸ Ð¯i ð¸ch Cüa ,Nªu có Nhân Thay ð±i Tß½ng Ñng Thª lñc Danh v÷ng Ta ðây Tñu Thäm !!:-(((
		SetUnitReputationID(sceneId, selfId, targetId, 28)


	end

	

end



function x760400_OnDie(sceneId, selfId, killerId)



end

