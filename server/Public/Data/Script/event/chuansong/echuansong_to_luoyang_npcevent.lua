--ÊÂ¼ş
--´«ËÍµ½ÂåÑô

--½Å±¾ºÅ
x400919_g_ScriptId = 400919

--ÈÎÎñÎÄ±¾ÃèÊö
x400919_g_MissionName="V« LÕc Dß½ng"
x400919_g_MissionInfo="Yên môn Lan Lång qu§n là n½i Liêu qu¯c thß¶ng v§n t¯ng lß½ng thäo ği ngang qua, hi®n gi¶ trên ğß¶ng xu¤t hi®n r¤t nhi«u Thäo Nguyên Lang, khi có ngß¶i giªt hªt Thäo Nguyên Lang · Yên môn thì m¾i dám ra ngoài v§n chuy¬n thäo li®u. "  --ÈÎÎñÃèÊö
x400919_g_MissionTarget="Giªt chªt 5 con Thäo Nguyên Lang"		--ÈÎÎñÄ¿±ê
x400919_g_ContinueInfo="Có phäi các hÕ ğã giªt 5 con Thäo Nguyên Lang không? B÷n nó · phía nam thôn, ği 1 chút s¨ th¤y. C¦n th§n, b¸ 1 b¥y Thäo Nguyên Lang bao vây xung quanh thì các hÕ s¨ ği ğ¶i ğ¤y. "		--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x400919_g_MissionComplete="Cám ½n, chúng tôi cu¯i cùng cûng ğã dám ra khöi cØa r°i"					--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

--**********************************
--Èë¿Úº¯Êı
--**********************************
function x400919_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 255, 250)
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x400919_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x400919_g_ScriptId,x400919_g_MissionName)
end
