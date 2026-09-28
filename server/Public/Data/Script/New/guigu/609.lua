--QuÖ C¯c NPC
--QuÖ C¯c 
--Bình thß¶ng 

x760609_g_scriptId = 760609

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760609_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{THD_190613_23}")
		--AddNumText(sceneId,x760609_g_scriptId,"Kích th¯i Thüy Phï",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760609_OnEventRequest(sceneId, selfId, targetId, eventId)
	if	GetNumText()==0	then
		if	GetLevel(sceneId, selfId)<90 then	
			BeginEvent(sceneId)
			local strText ="Nªu mu¯n Kích th¯i Thüy Phï ,Nhu Ð¡c Cø b¸ Nh¤t ð¸nh Bän lînh ,Thiªu hi®p Ngß½i Chßa ÐÕt t¾i #Gc¤p 90 #W,Vçn là trß¾c KhÑ N½i khác Rèn luy®n Mµt phen LÕi ðªn Ba ."
			AddText(sceneId, strText)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 331,254,181)
		end
	end
end
