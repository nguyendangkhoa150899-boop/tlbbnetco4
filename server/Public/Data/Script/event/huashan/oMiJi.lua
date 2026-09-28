-- »ªÉ½ÂÛ½£
-- ÃØ¼®½Å±¾

x001235_g_scriptId = 001235

x001235_g_SmallBoxBuff = {
				{name="TØ s¡c bí kíp",buff=8053},
				{name="Hoàng s¡c bí kíp",buff=8052},
				{name="Løc s¡c bí kíp",buff=8051},
				{name="BÕch s¡c bí kíp",buff=8050},
				{name="H¡c s¡c bí kíp",buff=8049},
				{name="Lam s¡c bí kíp",buff=8048},
				{name="H°ng s¡c bí kíp",buff=8047},
}

--**********************************
--ÌØÊâ½»»¥:Ìõ¼şÅĞ¶Ï
--**********************************
function x001235_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- ÏŞÖÆÉíÉÏµÄbuff
	return 1
end

--**********************************
--ÌØÊâ½»»¥:ÏûºÄºÍ¿Û³ı´¦Àí
--**********************************
function x001235_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:¾ÛÆøÀà³É¹¦ÉúĞ§´¦Àí
--**********************************
function x001235_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- °´ÕÕÕâ¸öNpcµÄĞÕÃû¸øÍæ¼Ò+buff£¬
	local szName = GetName(sceneId, selfId)
	for i=1, getn(x001235_g_SmallBoxBuff)  do
		if szName == x001235_g_SmallBoxBuff[i].name  then
			LuaFnDeleteMonster(sceneId, selfId)
			LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x001235_g_SmallBoxBuff[i].buff, 100 )
		end
	end	
	
	return 1
end

--**********************************
--ÌØÊâ½»»¥:Òıµ¼ÀàÃ¿Ê±¼ä¼ä¸ôÉúĞ§´¦Àí
--**********************************
function x001235_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥¿ªÊ¼Ê±µÄÌØÊâ´¦Àí
--**********************************
function x001235_OnActivateActionStart( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--ÌØÊâ½»»¥:½»»¥³·ÏûÊ±µÄÌØÊâ´¦Àí
--**********************************
function x001235_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--ÌØÊâ½»»¥:½»»¥ÖĞ¶ÏÊ±µÄÌØÊâ´¦Àí
--**********************************
function x001235_OnActivateInterrupt( sceneId, selfId, activatorId )
	return 0
end

function x001235_OnActivateInterrupt( sceneId, selfId, activatorId )

end

