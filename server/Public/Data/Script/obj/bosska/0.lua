--890000×ÏÒøËéÆ¬¶Ò»»
x890000_g_ScriptId = 890000
x890000_g_itemId = 39901005
x890000_g_MonsterId = 39799


--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x890000_UpdateEventList( sceneId, selfId,targetId )		 
	if sceneId ~= 573 then
		BeginEvent(sceneId)
			AddText(sceneId,"Cänh này không th¬ tri®u h°i. Hãy ðªn Nh¤t Kiªm Kì Tr§n 'Ngß¶i d¸ch chuy¬n phø bän chuy¬n ðªn bän ð° chuyên døng")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return 0;
	end
	
	local level = GetLevel( sceneId, selfId )
	if not level or level < 75 then
		BeginEvent( sceneId )
			AddText( sceneId, "ÐÆng c¤p không ðü 75 không th¬ sØ døng" )
		EndEvent( )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x890000_g_itemId, 1) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "Các hÕ phäi có 1 cái Boss tÕp thiªn ta m¾i có th¬ tri®u h°i, ki¬m tra xem v§t ph¦m có b¸ khóa hay không!" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId, x890000_g_MonsterId, 32, 33, 25, 244, -1);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
		--	SetCharacterTitle(sceneId, nObjID, "QuÖ Kiªm");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
            local  nam= LuaFnGetName( sceneId, selfId )
		  local strText = format ("#b#cff00f0Chúc m×ng #c00ff00"..nam.."#b#cff00f0 sØ døng thành công BOSS tÕp phiªn tri®u h°i ra Nam Hoài Th¥n Thú. Sau khi BOSS b¸ tiêu di®t khä nång r½i ra thÕch ð¥u bäo tß½ng, nguyên li®u chª ra ðÕo cø c¤p!!#Y", nam)						
		  local strText = format ("@*;SrvMsg;SCA:#b#cff00f0Chúc m×ng #c00ff00"..nam.."#b#cff00f0 sØ døng thành công BOSS tÕp phiªn tri®u h°i ra Nam Hoài Th¥n Thú. Sau khi BOSS b¸ tiêu di®t khä nång r½i ra thÕch ð¥u bäo tß½ng, nguyên li®u chª ra ðÕo cø c¤p!!#Y", nam)						
		      BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		   return
end
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x890000_OnDefaultEvent( sceneId, selfId,targetId )
	x890000_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x890000_OnEventRequest( sceneId, selfId, targetId, eventId )
end