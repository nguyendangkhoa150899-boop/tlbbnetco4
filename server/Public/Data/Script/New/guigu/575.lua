			
--BUS
--ÐÕi lý CØa nam Phø c§n Bay ði TÕp hoá cØa hàng 

x760575_g_ScriptId = 760575
x760575_g_busGuilList = {1000005, 1000007}
function x760575_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Chào m×ng các hÕ ðªn v¾i thª gi¾i Thiên Long Bát Bµ#rDu Thiên..Du Thiên Dã NgoÕi...! #RTrong nhu có cß½ng v§y trong nhß½ng có....gì?")
	AddNumText(sceneId, x760575_g_scriptId, "Du Thiên",6, 1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x760575_OnEventRequest( sceneId, selfId, targetId,eventId )
	local bSucceeded = 0;
	strText ="Thú cßÞi chßa t¾i , bÕn vui lòng ch¶ 1 lát...!";
	for i, busGuid in x760575_g_busGuilList do
		busId = LuaFnBusGetObjIDByGUID(sceneId, busGuid);
		if busId then
			if busId ~= -1 then
				ret = LuaFnBusAddPassenger_Shuttle(sceneId, busId, selfId, targetId, 0);
				if ret == OR_OK then
					strText ="Vui lòng ðþi c¤t cánh....."
					bSucceeded = 1;
						local szMsg = format("@*;SrvMsg;SCA:#HGiang h° tß½ng truy«n #{_INFOUSR%s} #Hkh·i hành chuyªn du ngoÕn #G"..GetSceneName(sceneId).." #H Th§t ðáng ngßÞng mµ!",LuaFnGetName(sceneId,selfId))
						AddGlobalCountNews(sceneId,szMsg)
					break
				elseif ret == OR_BUS_PASSENGERFULL then
					strText ="Ch² ng°i ðã ð¥y , vui lòng ch¶ chuyªn sau."
					break
				elseif ret == OR_BUS_HASMOUNT then
					strText ="Khi cßÞi v§t, các hÕ không th¬ thñc hi®n thao tác này"
					break
				elseif ret == OR_BUS_HASPET then
					strText ="Khi mang theo trân thú, các hÕ không th¬ thñc hi®n thao tác này"
					break
				elseif ret == OR_BUS_CANNOT_TEAM_FOLLOW then
					strText ="Khi l§p ðµi ði theo, các hÕ không th¬ thñc hi®n thao tác này"
					break
				elseif ret == OR_BUS_CANNOT_DRIDE then
					strText ="Khi cßÞi 2 ngß¶i, các hÕ không th¬ thñc hi®n thao tác này"
					break
				elseif ret == OR_BUS_CANNOT_CHANGE_MODEL then
					strText ="Khi biªn thân, các hÕ không th¬ thñc hi®n thao tác này"
					break
				else
				end
			end
		end
	end

	BeginEvent(sceneId)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bSucceeded == 1 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
	end
end

function x760575_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end


--**********************************

--ÁÐ¾ÙÊÂ¼þ

--**********************************

function x760575_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x760575_g_ScriptId,"T¾i cØa hàng tÕp hóa.", 9, -1);
end

