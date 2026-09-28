-- Éú³¤µã ²É¼¯[²É¿ó²ÉÒ©]

-- ½Å±¾ºÅ
x710531_g_ScriptId = 710531

-- Éú³¤µãĞÅÏ¢
x710531_g_GPInfo = {}

-- Ëæ»úÒò×Ó
x710531_g_RandNum = 10000

-- abilityId: Éú³¤µã¶ÔÓ¦¼¼ÄÜ name: Éú³¤µãµÄÃû×Ö
-- mainId: Ö÷Òªµô³öÎï mExtraCountOdds: Ö÷Òªµô³öÎï¶îÍâµô³öÊıÁ¿µÄ¼¸ÂÊ
-- associatedId: ¸±²úÆ·ÁĞ±í£¬aOdds ¼¸ÂÊ³öÏÖÊ±Ëæ»ú³öÒ»¸ö£¬ÁĞ±í¿ÉÒÔÎª¿Õ aOdds: ¸±²úÆ·µô³öÂÊ aExtraCountOdds: ³öÏÖ¸±²úÆ·ºó¶îÍâÊıÁ¿¼¸ÂÊ
-- rareId: Ï¡ÓĞÎïÆ·£¬Ï¡ÓĞÎïÆ·¿ÉÒÔÃ»ÓĞ£¬Ìî -1£¬ rOdds: Ï¡ÓĞÎïÆ·µô³öÂÊ
-- needLevel: ²É¼¯´ËÉú³¤µãĞèÒªµÄ¼¶±ğ

-- ÒÔÏÂ²¿·ÖÎª²İÒ©

x710531_g_GPInfo[776] = { abilityId = ABILITY_CAIYAO, name = "Kính H° Thiên Niên Thäo", mainId = 40004414 }

-- ÒÔÉÏ²¿·ÖÎª²İÒ©

-- ³¤Éú³¤µã
function x710531_OnCreate( sceneId, growPointType, x, y )
	
	
	-------------------------------------------------------------------	
	--»î¶¯ÊÇ·ñ¿ªÊ¼
	local actId = 36;	
	local bActStatus = GetActivityParam( sceneId, actId, 0 );
	
	if bActStatus <= 0 then
		return -1;
	end
	
	--²İÒ©ÊÇ·ñÒÑ¾­²úÉú
	local bQianNianCaoGen = GetActivityParam( sceneId, actId, 1 );

	if bQianNianCaoGen > 0 then
		return -1;
	end
	-------------------------------------------------------------------

	
--	PrintStr("growPointType".."x:"..x.."y:"..y);

	-- Ã¿¸öÉú³¤µã×îÉÙÄÜµÃµ½Ò»¸öÎïÆ·£¬ÕâÀïÖ±½Ó·ÅÈë itembox ÖĞÒ»¸ö
	local ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, 40004414 )	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,30*60*1000)	--Éè¶¨»ØÊÕÊ±¼ä
	
	SetActivityParam( sceneId, actId, 1, 1 );
	
--	local message = format("@*;SrvMsg;SCA:#{JingHu_LingYao_00}" );	
--	AddGlobalCountNews( sceneId, message )

end

-- µã»÷Éú³¤µãÊ±
function x710531_OnOpen( sceneId, selfId, targetId )



	return OR_OK
end

-- ½ø¶ÈÌõ×ßÍêÁË
function x710531_OnProcOver( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	-- ÏûºÄ¾«Á¦
--	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	return OR_OK
end

-- Ïä×Ó¼ñÍêÁË£¬»ØÊÕ
function x710531_OnRecycle( sceneId, selfId, targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	--Í³¼ÆÊı¾İ
	LuaFnAuditHDXianCaoZhengDuo(sceneId, selfId, "Hái thu th§p Tiên thäo");

--	LuaFnAuditAbility(sceneId, selfId, GPInfo.abilityId, -1, -1)
	-- Ôö¼ÓÊìÁ·¶È
--	CallScriptFunction( ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	--·µ»Ø1£¬Éú³¤µã»ØÊÕ
	return 1
end

function x710531_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x710531_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
