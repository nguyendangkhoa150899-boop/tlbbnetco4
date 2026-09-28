-- 402103
-- Ò°Öí±©×ß»î¶¯

x402103_g_NpcPos = {x=137,y=107}
x402103_g_NpcId = 163

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú 19-145-40 18-149-48
--**********************************
function x402103_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
	StartOneActivity(sceneId, actId, 1)

	local MonsterId = LuaFnCreateMonster( sceneId, x402103_g_NpcId,
											x402103_g_NpcPos.x, x402103_g_NpcPos.y, 3, -1, 402104 )
	SetCharacterName(sceneId, MonsterId, "Vân Phiêu Phiêu")
	SetCharacterTitle(sceneId, MonsterId, "Phß¶ng chü Trùng Ðiêu phß¶ng")
	SetCharacterDieTime(sceneId, MonsterId, 2*1000*60*60)
end

--**********************************
--ÐÄÌøº¯Êý
--**********************************
function x402103_OnTimer( sceneId, actId, uTime )
	
end
