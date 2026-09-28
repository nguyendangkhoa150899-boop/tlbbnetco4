-- Lînh Tß·ng NPC

x760422_g_scriptId = 760422

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760422_OnDefaultEvent(sceneId, selfId, targetId)
		local	lev	= GetLevel(sceneId, selfId)
		if lev <90 then
			BeginEvent(sceneId)
	 			AddText(sceneId,"Ngài häo !Ngài Cüa Tß½ng ðß½ng Không ðü C¤p 90 !")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		 		AddText(sceneId,"#{JXPVP_170814_04}")				
		 		AddNumText(sceneId, x760422_g_ScriptId,"Ngû phß½ng Cänh", 6, 30)
			AddNumText(sceneId, x760422_g_ScriptId,"V« Ngû phß½ng Kính", 11, 99900)					
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760422_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 99900 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{JXPVP_170814_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	if GetNumText() == 30 then
   
    local nQuarter = mod(GetQuarterTime(),100);
       if nQuarter <64 or nQuarter>= 84 then
      BeginEvent(sceneId)
		AddText(sceneId,"Chï có TÕi M²i ngày 16:00-16:30,20:00-20:30Trong lúc ,M¾i có th¬ Ði trß¾c Ngû phß½ng Cänh .")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
   CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 711, 91, 91,85)--Truy«n t¯ng 
  end
end

function x760422_OnCopySceneTimer(sceneId, nowTime)
	
end

function x760422_OnHuashanSceneTimer(sceneId, selfId)
	
	-- Ki¬m tra ðo lß¶ng Cái này cänh tßþng Nµi Có phäi hay không Có Ngß¶i ch½i ,Nªu không có ,Trñc tiªp Phän h°i 
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0 then
		return
	end
	
	--Ki¬m tra ðo lß¶ng Trß¾c m£t Có phäi hay không Ngû phß½ng Cänh Cüa HoÕt ðµng th¶i gian ,Nªu Không phäi ,Li«n ðem Cänh tßþng Nµi Cüa S· hæu Ngß¶i ch½i Ðô TÐi ra ngoài 
	local bIsTime = 1
	local CreateMonster = 1
	local NeedBox = 1
	
	local nQuarter = mod(GetQuarterTime(),100);
		
	if nQuarter <64 or nQuarter>= 84 then
		bIsTime = 0
		local i
		for i=0, nHumanNum-1 do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"#PHoÕt ðµng Kªt thúc .")
			EndEvent()

				--CallScriptFunction((400900),"TransferFunc",sceneId, nHumanId, 710, 136, 169)
			end
		end --END for i=0, nHumanNum-1 do
	end

	-- Nªu bIsTime == 0,Li«n ðem S· hæu Ngß¶i ch½i TÐi ra ngoài 
	if bIsTime == 0  then
			
		local i
		for i=0, nHumanNum-1 do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"#PHoÕt ðµng Kªt thúc .")
			EndEvent()
				end
				--CallScriptFunction((400900),"TransferFunc",sceneId, nHumanId, 708, 136, 169)
			end
		end --END for i=0, nHumanNum-1 do
	end

--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760422_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760422_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
--**********************************
--Tin tÑc Ð« kÏ 
--**********************************
function x760422_MsgBox(sceneId, selfId, str)	
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760422_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)   
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

function x760422_MsgBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
