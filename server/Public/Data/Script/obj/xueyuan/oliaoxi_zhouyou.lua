--ÖÜÓÎ
--´åÃñ
--ÆÕÍ¨

x021009_g_scriptId = 021009

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x021009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    B¢ng hæu, quái v§t trên Ngân Ngai Tuyªt Nguyên này con nào cûng có th¥n lñc cüa hàn bång, Chï có ðü ði¬m #Gkháng bång#W m¾i có khä tung hoành · n½i này, TÕi hÕ có th¬ giúp các hÕ thång 1 ít kháng bång, nhßng sñ kháng bång cao còn xem vào n± lñc cüa ngß½i.")
		AddNumText(sceneId, x021009_g_scriptId, "Tång mµt ít kháng bång",6,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x021009_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 153, 0)
	end
end
