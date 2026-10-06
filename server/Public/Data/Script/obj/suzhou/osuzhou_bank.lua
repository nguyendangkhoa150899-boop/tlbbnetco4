
x001026_g_scriptId = 1026


function x001026_OnDefaultEvent( sceneId, selfId,targetId )
	  BeginEvent(sceneId)
     
			AddNumText(sceneId, 7, "M· ngân kh¯",5,-1)
			AddNumText(sceneId, 8, "Mua rß½ng chÑa ð° m¾i",5,-1)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
function x001026_OnEventRequest( sceneId, selfId, targetId, eventId )
	BeginEvent(sceneId)
		--´ò¿ªÒøÐÐ
		if eventId == 7 then
			if GetBankRentIndex(sceneId, selfId) > 60 then EnableBankRentIndex(sceneId, selfId, 5) BeginEvent(sceneId) AddText(sceneId, "R\223\189ng th\209 4 b\184 l\178i engine, kho \240\227 tr\183 v\171 60 \244 (\240\176 kh\244ng m\164t). Li\234n h\174 admin \240\172 \240\223\254c ho\224n ti\171n r\223\189ng 4.") EndEvent(sceneId) DispatchMissionTips(sceneId, selfId) end   -- [NetCo4 06/10] kho toi da 60: thu ruong 4 (o 61-80 lam server da nguoi choi)
			BankBegin(sceneId, selfId)	
		--¹ºÂòÐÂµÄ×âÁÞÏä
		elseif eventId == 8 then
			EnableBankRentIndex(sceneId, selfId, 2)
		end

  EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
