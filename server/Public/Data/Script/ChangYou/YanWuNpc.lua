---2018Nåm Kinh ði¬n Trò ch½i Cñ Tác Trí thanh Xuân #Phøc c± Long Thành Tranh bá K¸ch bän g¯c 
---Tác giä Q546528533 Xin ð×ng C¡t bö Ho£c Bóp méo Tác giä Tin tÑc 
---Løc tøc Thä ra Càng Nhi«u công nång 

x900054_g_ScriptId	= 900054

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x900054_OnDefaultEvent(sceneId, selfId, targetId)
  
	
	
	
	BeginEvent(sceneId)
	AddText(sceneId,"Thiên hÕ S½ Ð¸nh ,Chí tôn TÕi v¸ .Cái Vån Vß½ng giä Nhß T¥n Hoàng Hán Võ giä ,Giai C¥u ðßþc Dûng sî Dî Uy hiªp TÑ phß½ng ,Ð£c Truy®n Ngô Quân Ý chï .Chú Hoàng kim Ðài ,Tri®u Thiên hÕ anh hùng ThÑc Kiªm V¾i thßþng .#r  H÷c Có Nh§p môn Phân Trß¾c sau ,Hi®p Dî C¤p b§c Ð¸nh Cänh gi¾i #TÕi ðây Vi #G90C¤p Chí 109C¤p #WHi®p sî T± chÑc #GH± g¥m C¤p #WDi­n võ Tái ,Ð°ng Cänh gi¾i Giä Di­n võ Trên ðài ,Dùng võ Danh sách .")
	if GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT) == 0 then
	AddNumText(sceneId, x900054_g_ScriptId,"B¡t ð¥u XÑng ðôi", 2, 1)
	else
	AddNumText(sceneId, x900054_g_ScriptId,"Ðình chï XÑng ðôi", 2, 6)
	end
	AddNumText(sceneId, x900054_g_ScriptId,"Ta ÐÆng c¤p Tình hình cø th¬ và tï mï", 2, 2)
--	AddNumText(sceneId, x900054_g_ScriptId,"Di­n võ Tái Chu Khen thß·ng", 2, 3)
--	AddNumText(sceneId, x900054_g_ScriptId,"Danh kiªm CØa hàng (TÕm Không khai Phóng)", 2, 4)
--	AddNumText(sceneId, x900054_g_ScriptId,"ÐÆng c¤p Bäng xªp hÕng", 2, 5)
	
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x900054_OnEventRequest(sceneId, selfId, targetId, eventId)
--UICommand_AddString
--UICommand_AddInt(sceneId, 0)
if GetNumText() == 1 then--Mãn Huyªt Mãn Nµ 
   	
	SetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT,1)--B¡t ð¥u XÑng ðôi 

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)


		
	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 2)
	UICommand_AddInt(sceneId, GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT))----Hay không Ðình chï 
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, selfId, 20181116)



end
if GetNumText() == 6 then--Mãn Huyªt Mãn Nµ 
   	
	SetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT,0)--B¡t ð¥u XÑng ðôi 

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)



		
	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 1)
	UICommand_AddInt(sceneId, GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT))--Hay không Ðình chï 
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, selfId, 20181116)

end

if GetNumText() == 888 then--Mãn Huyªt Mãn Nµ 
CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 159, 154, 10);
return
end


if GetNumText() == 2 then--Mãn Huyªt Mãn Nµ #
local star = GetMissionData(sceneId,selfId,MAXDUANWEI1)--Tinh tinh S± 
local maxd = GetMissionData(sceneId,selfId,MAXDUANWEI2)--ÐÕi ÐÆng c¤p Tiªp l¶i 
local number = GetMissionData(sceneId,selfId,MAXDUANWEI3)--ÐoÕn ng¡n Con s¯ 
local wuyu = GetMissionData(sceneId,selfId,MAXDUANWEI4)--Võ Dñ 
	BeginUICommand(sceneId)
	UICommand_AddString(sceneId,"2018")--Nåm 
	UICommand_AddString(sceneId,"12")--Tháng 
	UICommand_AddString(sceneId,"10")--Ngày 
	UICommand_AddInt(sceneId, 1)--Tái Quý Kh¯ng chª --Tay ðµng Kh¯ng chª Tái Quý #Không c¥n Tiªp l¶i 
	UICommand_AddInt(sceneId, maxd)--ÐÕi ÐoÕn --
	UICommand_AddInt(sceneId, number)--ÐoÕn ng¡n Con s¯ 
	UICommand_AddInt(sceneId, star)--Tinh tinh S± 
	UICommand_AddInt(sceneId, wuyu)--Võ Dñ 
	UICommand_AddInt(sceneId, 1)--Tái Quý Kªt thúc Khen thß·ng Cái nút Kh¯ng chª 1Vi Khä Lînh 0Vi Không th¬ 
	UICommand_AddInt(sceneId, targetId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId, selfId, 20181112)	
end

end
-- add by zchw

--**********************************
--Thiªt trí NPCTin tÑc #Yêu c¥u Cái rß½ng K¸ch bän g¯c callHàm s¯ LÕi ðây 
--**********************************
function x900054_GetMPInfo(sceneId,selfId)

  	if GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT) == 0 then
	SetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT,0)
	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 1)
	UICommand_AddInt(sceneId, GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT))--Hay không Ðình chï 
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, selfId, 20181116)
	return
	end
	
	
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)	
	local adddd = 0
	local bdddd = 0
	for i=0, nHumanCount-1 do
		nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
     if nHumanId ~= selfId then
		
		bdddd = nHumanId
		end
	end
local PingFengB = GetMissionData(sceneId, selfId, MD_RELATION_YINCHUAN) --Tñ thân Cho ði¬m 
local PingFengA = GetMissionData(sceneId, bdddd, MD_RELATION_YINCHUAN) --Ð¯i thü Cho ði¬m 


if GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT) == 1 and GetMissionData(sceneId,bdddd,MD_QUIZ_DAYCOUNT) == 1 then
  
 --if PingFengB + 20000 <= PingFengA or PingFengB - 20000 <= PingFengA then
  
  if bdddd> 1000 then

   BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 3)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, selfId, 20181116)
	
	
	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 3)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, bdddd, 20181116)
	
end
  
  if LuaFnHasTeam(sceneId, selfId) == 0 and LuaFnHasTeam(sceneId, bdddd) == 0 then
    
  CallScriptFunction(806014,"DoChallenge", sceneId, selfId, bdddd)
  SetMissionData(sceneId,nHumanId,MD_QUIZ_DAYCOUNT,0) 
  else
   if LuaFnHasTeam(sceneId, bdddd) == 1 then
	x900054_NotifyFailTips(sceneId, bdddd,"M¶i R¶i khöi Ðµi ngû H§u LÕi ðªn Tiªn hành XÑng ðôi #Trß¾c m¡t Chï Duy trì 1V1")
 	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 1)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, bdddd, 20181116)	
	
   BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 1)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, selfId, 20181116)
	end

   if LuaFnHasTeam(sceneId, selfId) == 1 then
	x900054_NotifyFailTips(sceneId, selfId,"M¶i R¶i khöi Ðµi ngû H§u LÕi ðªn Tiªn hành XÑng ðôi #Trß¾c m¡t Chï Duy trì 1V1")
 	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 1)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, selfId, 20181116)	


 	BeginUICommand(sceneId)
   UICommand_AddInt(sceneId, 1)
   EndUICommand(sceneId)
   DispatchUICommand(sceneId, bdddd, 20181116)	
	
	-- end	
	
end
  SetMissionData(sceneId,nHumanId,MD_QUIZ_DAYCOUNT,0)

end
end
end

--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x900054_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x900054_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x900054_MsgBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x900054_Restore_hpmp(sceneId, selfId, targetId)

end
