--ÃÅÅÉÁîÅÆ

-- ½Å±¾ºÅ
x890061_g_ScriptId	= 890061
x890061_g_ItemId = 39901003
x890061_g_UseScriptId = 890062
--**********************************
-- ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x890061_OnDefaultEvent( sceneId, selfId )
local	key	= GetNumText()
	BeginEvent( sceneId )
		AddText( sceneId, "Các hÕ mu¯n ð±i môn phái näo?" )
		AddNumText( sceneId, x890061_g_UseScriptId, "Mµ Dung",3,29 )
		AddNumText( sceneId, x890061_g_ScriptId, "Tinh Túc",3,20 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Tiêu Dao",3,21 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Thiªu Lâm",3,22 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Thiên S½n",3,23 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Thiên Long",3,24 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Nga My",3,25 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Võ Ðang",3,26 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Minh Giáo",3,27 )
		AddNumText( sceneId, x890061_g_UseScriptId, "Cái Bang",3,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )

--**********************************
-- 
--**********************************
function x890061_IsSkillLikeScript( sceneId, selfId)
	return 0
end