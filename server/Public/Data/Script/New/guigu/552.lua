--K¸ch bän g¯c Hào 
x760552_g_scriptId = 760552

--S· có ðßþc Sñ ki®n IDDanh sách 

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760552_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"Thiªu hi®p Ngß½i häo ,R¤t vui Ý vì Ngß½i C¯ng hiªn sÑc lñc !Ngß½i tß·ng T¯ Ði¬m cái gì Ni ?")
		--AddNumText(sceneId,x760552_g_scriptId,"C± Kính G·i bán Hành",7,2)		
		AddNumText(sceneId,x760552_g_scriptId,"C± Kính G·i bán Hành Gi¾i thi®u",11,10)			
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x760552_OnEventRequest(sceneId, selfId, targetId, eventId)
	
	if GetNumText() == 2 then
			BeginEvent(sceneId)
			EndEvent(sceneId)
		DispatchUICommand(sceneId,selfId, 701900)
			return
	end	
	if GetNumText() == 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{KVKGZ_110620_118}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end	

end
