--LÕc Dß½ng NPC
--Vß½ng ÐÑc Quý 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760334_g_ScriptId			= 760334

--Vû khí cØa hàng 
x760334_g_shoptableindex= 281

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760334_OnDefaultEvent(sceneId, selfId, targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{SYZN_130820_2}")
	--AddNumText(sceneId, x760334_g_ScriptId,"Mua s¡m Tình yêu Món ð° ch½i", 7, 100)
	--AddNumText(sceneId, x760334_g_ScriptId,"Tß ch¤t Giám ð¸nh", 6, 101)
	--AddNumText(sceneId, x760334_g_ScriptId,"Mµt l¥n næa Giám ð¸nh Trang b¸ Tß ch¤t", 6, 102)
	--AddNumText(sceneId, x760334_g_ScriptId,"Trang b¸ Tß ch¤t Giám ð¸nh Gi¾i thi®u", 11, 105)
	AddNumText(sceneId, x760334_g_ScriptId,"V« Phu thê C¥u TØ", 11, 106)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760334_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 105 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_help_081}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	
	if GetNumText() == 106 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SYZN_130820_18}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	local	key	= GetNumText()
	if key == 100 then
		DispatchShopItem(sceneId, selfId, targetId, x760334_g_shoptableindex)
	elseif key == 101 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1001)
	elseif key == 102 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 112233)
	end
end
