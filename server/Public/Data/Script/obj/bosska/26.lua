--890026×ÏÒøËéÆ¬¶Ò»»
x890026_g_ScriptId = 890026
x890026_g_itemId = 39901031
x890026_g_MonsterId = 39726


--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x890026_UpdateEventList( sceneId, selfId,targetId )		 
	if sceneId ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"Cänh này không th¬ tri®u h°i. Hãy ðªn LÕc Dß½ng 'Ngß¶i d¸ch chuy¬n phø bän chuy¬n ðªn bän ð° chuyên døng")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return 0;
	end

	local level = GetLevel( sceneId, selfId )
	if not level or level < 21 then
		BeginEvent( sceneId )
			AddText( sceneId, "ÐÆng c¤p không ðü 21 không th¬ sØ døng" )
		EndEvent( )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x890026_g_itemId, 1) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "Các hÕ phäi có 1 cái Boss tÕp thiªn ta m¾i có th¬ tri®u h°i, ki¬m tra xem v§t ph¦m có b¸ khóa hay không!" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId, x890026_g_MonsterId, posX, posZ, 1, 253, 0);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
			SetCharacterTitle(sceneId, nObjID, "Lý Thu Thüy");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
            local  nam= LuaFnGetName( sceneId, selfId )
		  local strText = format ("#b#cff00f0Chúc m×ng #c00ff00"..nam.."#b#cff00f0 sØ døng thành công BOSS tÕp phiªn tri®u h°i ra Lý Thu Thüy. Sau khi BOSS b¸ tiêu di®t khä nång r½i ra ði¬m t£ng, thÕch ð¥u bäo tß½ng, nguyên li®u chª ra ðÕo cø c¤p!!#Y", nam)						
		      BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		   return
end
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x890026_OnDefaultEvent( sceneId, selfId,targetId )
	x890026_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x890026_OnEventRequest( sceneId, selfId, targetId, eventId )
end