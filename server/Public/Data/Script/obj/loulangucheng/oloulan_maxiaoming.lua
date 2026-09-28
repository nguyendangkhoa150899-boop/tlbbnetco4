--Â¥À¼NPC
--ÂíæçÃù
--ÆÕÍ¨

x001158_g_ScriptId	= 001158

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x001158_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  Trong tây vñc, BÕch LÕc Ğà là thÑ cßŞi hiªm có. Trß¾c ğây chï có quı tµc m¾i cßŞi nhæng loÕi thú cao sang này. Nhßng gi¶ ğây thì lÕi khác, ngß¶i trong khu tây vñc này xem BÕch LÕc Ğà là thú cßŞi tß½ng trßng cho sñ tài phú.#r#GTÕi hÕ ğây hi®n ğang có bán." )
		AddNumText( sceneId, x001158_g_ScriptId, "Mua v§t cßŞi", 7, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x001158_OnEventRequest( sceneId, selfId, targetId )
	local	key	= GetNumText()
	if key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, 185 )
	end
end

--**********************************
--¶Ô»°¿òÌáÊ¾
--**********************************
function x001158_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
