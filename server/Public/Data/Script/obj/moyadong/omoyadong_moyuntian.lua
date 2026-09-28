--NPC
--
--ÆÕÍ¨

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x018112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC¶Ô»°
--**********************************
		AddText(sceneId,"  Ma Nhai Ðµng là n½i cß ngø cüa T¥n Gia TrÕi Phi T£c, nªu nhß công lñc cüa các hÕ th¤p, t¯t nh¤t kiªm thêm nhæng v¸ b¢ng hæu khác ð¬ tiªn vào cho an toàn.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
