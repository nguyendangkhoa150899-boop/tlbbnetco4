-- Áì½±NPC

x893080_g_scriptId = 893080
x893080_g_FuBenScriptId = 893063

--**********************************
--Su kien lan nhau cua vao
--**********************************
function x893080_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    TÑ tuy®t trang bên trong hµ vi®n giáo ð¥u phi thß¶ng lþi hÕi, không có Thiên s½n là r¤t khó xông qua ðó, chï c¥n xao vang ð¯i di®n ði¬m ðÕi chung khä ðem này ðó giáo ð¥u ði ði")
		AddNumText( sceneId, x893080_g_scriptId, "#c00ff00Tàng Hình", 6, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Su kien liet biet lua chon hang nhat
--**********************************
function x893080_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then

		--if GetMenPai(sceneId,selfId) ~= MP_SHAOLIN and GetMenPai(sceneId,selfId) ~= MP_MINGJIAO and GetMenPai(sceneId,selfId) ~= MP_GAIBANG and GetMenPai(sceneId,selfId) ~= MP_TIANSHAN then
			--BeginEvent(sceneId)
	   			--AddText( sceneId,"Ngß½i không phäi c§n chiªn môn phái, không th¬ th¤y ðßþc phan tinh tinh ¦n thân hi®u quä")
			--EndEvent(sceneId)
			--DispatchEventList(sceneId,selfId,targetId)
		--else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 687, 0 )
			BeginEvent(sceneId)
	   			AddText( sceneId, "Ta ðã mu¯n thành công cho ngß½i sØ døng ¦n thân ph¤n mÕt, chú ý phäi thu h°i trân thú, nªu không không có ¦n thân hi®u quä" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		--end

	end
end
