-- Lînh Tß·ng NPC

x760396_g_scriptId = 760396

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760396_OnDefaultEvent(sceneId, selfId, targetId)
		local	lev	= GetLevel(sceneId, selfId)
		if lev <90 then
			BeginEvent(sceneId)
	 			AddText(sceneId,"Ngài häo !Ngài Cüa Tß½ng ðß½ng Không ðü C¤p 90 !")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		 		AddText(sceneId,"#c00ffffDûng s¤m Thông thiên Tháp: #r#WM²i ngày #GBu±i t¯i 20Ði¬m -22Click m· Khäi: #r#WNgß¶i ch½i Kªch xù Kinh nghi®m Luy®n C¤p Giai Ð¸a Càng có HoÕt ðµng BOSSXoát Xu¤t !")
				--AddText(sceneId," Tiªn vào Ði«u ki®n: Ngß¶i ch½i C¥n thiªt C¤p b§c Cao h½n 120C¤p")				
		 		AddText(sceneId,"#cff66ccÐ« kÏ: #r#WM²i ngày #GBu±i t¯i 20Ði¬m -22Click m· Khäi #r#W#GM¾i có th¬ Tiªn vào ThØ HoÕt ðµng Cänh tßþng !")
		 		AddNumText(sceneId, x760396_g_ScriptId,"Thông thiên Ð¸a cung Truy«n t¯ng", 6, 30)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760396_OnEventRequest(sceneId, selfId, targetId, eventId)

	if GetNumText() == 30 then
   
    local nQuarter = mod(GetQuarterTime(),100);
     --  if nQuarter <1 or nQuarter>= 90 then
     -- BeginEvent(sceneId)
	---	AddText(sceneId,"Hi®n tÕi không phäi HoÕt ðµng th¶i gian ,Vô pháp Tiªn vào Thông thiên Tháp HoÕt ðµng Bän ð°!")
	--	EndEvent(sceneId)
	--	DispatchEventList(sceneId,selfId,targetId)
	--	return 0
	--end
	local reply = CostMoney(sceneId,selfId,100)
		if reply == -1 then
			x760396_MsgBox(sceneId, selfId, targetId," #YTi¬u tØ ,Ti«n ðâu ,Ngß½i Không nói Ngß½i Có ti«n MÕ?Ma tý ,TØ QuÖ nghèo ,Không có ti«n Tß·ng L×a d¯i Ngã ,C±n Xa mµt chút !")
			return	
		end
   CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 581,252,359)--Truy«n t¯ng 
  end
end

function x760396_OnCopySceneTimer(sceneId, nowTime)
	
end

function x760396_OnHuashanSceneTimer(sceneId, selfId)
	
	-- Ki¬m tra ðo lß¶ng Cái này cänh tßþng Nµi Có phäi hay không Có Ngß¶i ch½i ,Nªu không có ,Trñc tiªp Phän h°i 
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0 then
		return
	end
	
	--Ki¬m tra ðo lß¶ng Trß¾c m£t Có phäi hay không Dûng s¤m Thông thiên Tháp Cüa HoÕt ðµng th¶i gian ,Nªu Không phäi ,Li«n ðem Cänh tßþng Nµi Cüa S· hæu Ngß¶i ch½i Ðô TÐi ra ngoài 
	local bIsTime = 1
	local CreateMonster = 1
	local NeedBox = 1
	
	local nQuarter = mod(GetQuarterTime(),100);
		
	if nQuarter <82 or nQuarter>= 90 then
		bIsTime = 0
		local i
		for i=0, nHumanNum-1 do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"#PHoÕt ðµng Kªt thúc .")
			EndEvent()

				CallScriptFunction((400900),"TransferFunc",sceneId, nHumanId, 0, 159, 115)
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
				CallScriptFunction((400900),"TransferFunc",sceneId, nHumanId, 0, 159, 115)
			end
		end --END for i=0, nHumanNum-1 do
	end

--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760396_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760396_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
--**********************************
--Tin tÑc Ð« kÏ 
--**********************************
function x760396_MsgBox(sceneId, selfId, str)	
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--Ð¯i thoÕi Ð« kÏ 
--**********************************
function x760396_TalkMsg(sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)
   AddText(sceneId, str)   
 EndEvent(sceneId)
 DispatchEventList(sceneId,selfId,targetId)  
end

function x760396_MsgBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
