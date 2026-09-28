--ÂåÑôNPC
--½ðÁùÒ¯
--ÆÕÍ¨

x000100_g_scriptId 	= 181000
x000100_g_gotoact	 	= 2
x000100_g_YBBTIntro =11     --Ôª±¦°ÚÌ¯½éÉÜ
x000100_g_leave			= 20

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x000100_OnDefaultEvent( sceneId, selfId,targetId )
local	nam	= LuaFnGetName( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId,"Chào m×ng khách quý, v×a th¤y ngài hi®n di®n ta ðã l®nh cho thông tri t±ng bµ bên kia làm th§t t¯t công vi®c thiªt ðãi. Ngài mu¯n ði t±ng bµ cüa chúng ta không ?")
		AddNumText( sceneId, x000100_g_scriptId, "Tiªn vào Ti«n Trang T±ng bµ", 9, x000100_g_gotoact)
		AddNumText( sceneId, x000100_g_scriptId, "Gi¾i thi®u qu¥y bày bán nguyên bäo", 11, x000100_g_YBBTIntro)
		AddNumText( sceneId, x000100_g_scriptId, "R¶i ði", -1, x000100_g_leave)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x000100_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x000100_g_gotoact then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 181,65,62)
	elseif GetNumText() == x000100_g_YBBTIntro then
	  BeginEvent( sceneId )
			AddText( sceneId, "#{YBBT_081023_2}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == x000100_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
      end
end
