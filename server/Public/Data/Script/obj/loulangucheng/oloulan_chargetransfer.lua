-- created by ×ó´ºÎ°

x400959_g_ScriptId = 400959; --½Å±¾ºÅ
x400959_g_name	="Xa Truy«n Phúc";

--´«ËÍÄ¿±ê
x400959_g_transfer_target =
{
	[1] = {x = 215, z = 337, scene_num = 0}, 		--ÂåÑô
	[2] = {x = 334, z = 246, scene_num = 1}, 		--ËÕÖİ
	[3] = {x = 377, z = 185, scene_num = 2}, 		--´óÀí
	[4] = {x = 206, z = 266, scene_num = 34}, 	--ÄÏº£
	[5] = {x = 186, z = 43, scene_num = 28},		--ÄÏÚ¯
	[6] = {x = 158, z = 113, scene_num = 22}, 	--³¤°×É½
}

-- ÊÕ·Ñ½ğ¶î
x400959_g_transfer_cost = 5000; -- 50Òø½»×Ó

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x400959_OnDefaultEvent( sceneId, selfId, targetId )
	x400959_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--ÊÂ¼şÁĞ±í
--**********************************
function x400959_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{SFCS_80828_01}" );
		AddNumText(sceneId, x400959_g_ScriptId, "LÕc Dß½ng", 9, 1);
		AddNumText(sceneId, x400959_g_ScriptId, "Tô Châu", 9, 2);
		AddNumText(sceneId, x400959_g_ScriptId, "ĞÕi Lı", 9, 3);
		AddNumText(sceneId, x400959_g_ScriptId, "Nam Häi", 9, 4);
		AddNumText(sceneId, x400959_g_ScriptId, "Nam Chiêu", 9, 5);
		AddNumText(sceneId, x400959_g_ScriptId, "Trß¶ng BÕch S½n", 9, 6);
		--AddNumText(sceneId, x400959_g_ScriptId, "Nhî Häi", 9, 878);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x400959_OnEventRequest( sceneId, selfId, targetId, eventId )
	--ÅÜÉÌÏà¹Ø
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin thÑ l²i trên ngß¶i các hÕ ğang giæ ngân phiªu, chÕy thß½ng nhân! Ta không th¬ giúp ğßşc." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--¶ÓÎéÏà¹Ø
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin thÑ l²i vì ğß¾ng xá quá xa, nång lñc cüa chúng tôi hÕn chª vì v§y không ch¤p nh§n ğµi làm nhi®m vø v§n chuy¬n thß½ng nhân, vui lòng ğ¬ lÕi ğµi thß½ng nhân và d¸ch chuy¬n mµt mình!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--äîÔËÏà¹Ø
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "  Các hÕ có nhi®m vø ch· hàng b¢ng ğß¶ng thuÖ, d¸ch trÕm chúng ta không th¬ cung c¤p d¸ch vø cho ngß½i")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText () == 878 then
	    local Code = 31000108
	    BeginEvent(sceneId)
			for i = 1, 100 do
		        TryRecieveItem(sceneId, selfId, Code, 1)
	        end
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	--
	local id = GetNumText();
	if id >=1 and id <= 6 then
		BeginEvent(sceneId)
			--"±¾´Î´«ËÍÊÕÈ¡50Òø½»×Ó£¬ÄãÒª´«ËÍÂğ£¿"
			AddText(sceneId, "#{FFCS_081210_1}")
			if id == 1 then	
				AddNumText(sceneId, x400959_g_ScriptId, "Duy®t", 0, 11);
			elseif id == 2 then
				AddNumText(sceneId, x400959_g_ScriptId, "Duy®t", 0, 21);
			elseif id == 3 then
				AddNumText(sceneId, x400959_g_ScriptId, "Duy®t", 0, 31);
			elseif id == 4 then
				AddNumText(sceneId, x400959_g_ScriptId, "Duy®t", 0, 41);
			elseif id == 5 then
				AddNumText(sceneId, x400959_g_ScriptId, "Duy®t", 0, 51);
			elseif id == 6 then
				AddNumText(sceneId, x400959_g_ScriptId, "Duy®t", 0, 61);
			end
			AddNumText(sceneId, x400959_g_ScriptId, "Hüy", 0, 100);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 100 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	else
		local index = floor(id/10);
		local pos_x = x400959_g_transfer_target[index]["x"];
		local pos_z = x400959_g_transfer_target[index]["z"];
		local scene_num = x400959_g_transfer_target[index]["scene_num"];
			
		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)

		--Ç®¹»Âğ£¿
		if (nMoneyJZ + nMoney) >= x400959_g_transfer_cost then 
				
			-- ÊÕ·Ñ
			-- Ê¹ÓÃ´øÓÅÏÈ¼¶µÄ½ğÇ®ÏûºÄº¯Êı
			if LuaFnCostMoneyWithPriority (sceneId, selfId, x400959_g_transfer_cost) == -1 then
				BeginEvent(sceneId)
					AddText(sceneId, "Thu phí th¤t bÕi!");
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			else
				-- ´«ËÍ
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, scene_num, pos_x, pos_z); 
			end

		-- Ç®²»¹»
		else
			BeginEvent(sceneId)
				AddText(sceneId, "Không ğü ngân lßşng!");
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			return

		end
	end	
end
