--*****************************--
--*     Code by MrSun 0411    *--
--*****************************--
x990010_g_scriptId = 990010
x990010_g_LenhBaiMonPhai = 30008106
------**********************************

function  x990010_OnDefaultEvent(sceneId,selfId,targetId)

	 	 RestoreHp(  sceneId,  selfId  )   
	 	 RestoreMp(  sceneId,  selfId  ) 
	 	 RestoreRage(  sceneId,  selfId  )  

	 	 BeginEvent(  sceneId  )
	 	 AddText(sceneId,"#b#WTa có th¬ giúp gì cho các hÕ?")			 
	 	 AddNumText( sceneId,x990010_g_scriptId, "#b#u#cFF0000Gia Nh§p Môn Phái ",6,200 )
	 	 --AddNumText( sceneId,x990010_g_scriptId, "#b#u#cFF0000Thay Ğ±i Môn Phái ",6,201 )
	 	 AddNumText( sceneId,x990010_g_scriptId, "#b#u#YNh§n lÕi Skill ( C½ bän ) ",6,202 )		 
		 AddNumText( sceneId,x990010_g_scriptId, "#g0f0ff0Nh§n ĞT",6,40 )
		 --AddNumText( sceneId,x990010_g_scriptId, "#g0f0ff0Nh§n KNB",6,411111 )			 
		 AddNumText( sceneId,x990010_g_scriptId, "#g0f0ff0Nh§n #G#{_EXCHG50000000}",6,50 )
		 AddNumText( sceneId,x990010_g_scriptId, "#b#cFF0000Xóa toàn bµ v§t ph¦m trong tay näi",6,551 )
		 local strGUID = LuaFnGetGUID(sceneId,selfId)
	 	 if strGUID == 1010000001 or strGUID == 1010000002 then
	 	 AddNumText( sceneId, x990010_g_scriptId, "#b#eDC4C18#450 GameMaster #451",1,9711 )
		 end
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

------**********************************

------**********************************
function x990010_OnEventRequest(sceneId,selfId,targetId,eventId)
local nam = LuaFnGetName(sceneId,selfId)
local strGUID = LuaFnGetGUID( sceneId, selfId )
local key = GetNumText()		


         --Skill Co ban
         if GetNumText() == 202 then
         AddSkill(sceneId,selfId,238) 
         AddSkill(sceneId,selfId,241) 	
         AddSkill(sceneId,selfId,242) 	
         AddSkill(sceneId,selfId,243) 	
         AddSkill(sceneId,selfId,244) 	
         AddSkill(sceneId,selfId,245) 	
         AddSkill(sceneId,selfId,246) 	
         AddSkill(sceneId,selfId,247) 	
         AddSkill(sceneId,selfId,248) 		
         AddSkill(sceneId,selfId,249) 			 		
         x990010_NotifyTip( sceneId, selfId, "Nh§n lÕi Skill c½ bän thành công!")
         end
	
         --GM
         if GetNumText() == 9711 then
         LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 2690, 0 )
         x990010_NotifyTip( sceneId, selfId, "#1" )
         end
	
         --Nhan KNB Khóa
         if GetNumText() == 40 then
         BeginEvent( sceneId )
         ZengDian(sceneId,selfId,targetId,1, 500000)
         x990010_NotifyFailBox(sceneId, selfId,targetId, "Chúc m×ng ! #WBÕn ğã nh§n ğßşc #Y500.000 #GĞT")
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId)
         end
		 
         --Nhan KNB
         if GetNumText() == 41 then
         BeginEvent( sceneId )
         local yuanbao = 0
         YuanBao(sceneId,selfId,targetId,1,yuanbao)
         x990010_NotifyFailBox(sceneId, selfId,targetId, "#YChúc m×ng ! #WBÕn ğã nh§n ğßşc #G"..yuanbao.." #WKNB !")
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId)
         end
		 
         --Vang
         if GetNumText() == 50 then
         BeginEvent( sceneId )
         AddMoneyJZ( sceneId, selfId, 50000000 )
         AddMoney( sceneId, selfId, 50000000 )
         x990010_NotifyFailBox(sceneId, selfId,targetId, "Chúc m×ng ! #WBÕn ğã nh§n ğßşc #G#{_EXCHG50000000}")
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId)
         end		 		 

         --Xóa Item	
         if GetNumText() == 551 then
         BeginEvent( sceneId )
         AddText( sceneId, "#b#cFF0000Lßu İ : #GSau khi sØ døng chÑc nång này toàn bµ #Hv§t ph¦m #Gtrong #Htay näi #Gs¨ b¸ xóa bö" )
         AddText( sceneId, "#YBQT s¨ không hoàn trä s¯ #Hv§t ph¦m #Ycüa bÕn khi sØ døng chÑc nång này" )
         AddText( sceneId, "#YĞ÷c kÛ #cFF0000Lßu İ #Ytrß¾c khi thñc hi®n ğ¬ tránh rüi do xäy ra" )
         AddNumText( sceneId, x990010_g_scriptId, "#b#cFF0000Tôi ğ°ng ı", 1, 552 )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId,targetId)
         end

         if GetNumText() == 552 then
         local ClearCount = 0
         for i = 1, 60 - 1 do
         if LuaFnEraseItem(sceneId, selfId, i) > 0 then
         ClearCount = ClearCount + 1
         end
         end
         x990010_NotifyFailTips(sceneId, selfId, "T±ng cµng có t¤t cä #Y"..ClearCount.." #Gv§t ph¦m #Wb¸ Xóa")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId)
         end

         --Gia Nhap Mon Phai
         if GetNumText() == 200 then
         BeginEvent( sceneId )
         AddText(sceneId,"#b#WCh÷n môn phái mu¯n gia nh§p !")
         AddText(sceneId,"#b#WSau khi gia nh§p môn phái tâm pháp s¨ ğÕt c¤p 30 !")		 
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GTinh Túc", 6, 320)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GTiêu Dao", 6, 321)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GThiªu Lâm", 6, 322)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GThiên S½n", 6, 323)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GThiên Long", 6, 324)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GNga My", 6, 325)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GVõ Ğang", 6, 326)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GMinh Giáo", 6, 327)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GCái Bang", 6, 328)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GMµ Dung", 6, 329)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GĞß¶ng Môn", 6, 330)
         AddNumText( sceneId, x990010_g_scriptId, "Gia nh§p #GQuÖ C¯c", 6, 331)		
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end

         if GetNumText() == 320 then
         if GetMenPai(sceneId, selfId) == 1 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
         LuaFnSetXinFaLevel(sceneId,selfId,31,50)
         LuaFnSetXinFaLevel(sceneId,selfId,32,50)
         LuaFnSetXinFaLevel(sceneId,selfId,33,50)
         LuaFnSetXinFaLevel(sceneId,selfId,34,50)
         LuaFnSetXinFaLevel(sceneId,selfId,35,50)
         LuaFnSetXinFaLevel(sceneId,selfId,36,50)
         LuaFnSetXinFaLevel(sceneId,selfId,60,50)
         LuaFnSetXinFaLevel(sceneId,selfId,77,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10303400,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 321 then
         if GetMenPai(sceneId, selfId) == 8 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
         LuaFnSetXinFaLevel(sceneId,selfId,49,50)
         LuaFnSetXinFaLevel(sceneId,selfId,50,50)
         LuaFnSetXinFaLevel(sceneId,selfId,51,50)
         LuaFnSetXinFaLevel(sceneId,selfId,52,50)
         LuaFnSetXinFaLevel(sceneId,selfId,53,50)
         LuaFnSetXinFaLevel(sceneId,selfId,54,50)
         LuaFnSetXinFaLevel(sceneId,selfId,63,50)
         LuaFnSetXinFaLevel(sceneId,selfId,80,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10304400,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 322 then
         if GetMenPai(sceneId, selfId) == 0 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
         LuaFnSetXinFaLevel(sceneId,selfId,1,50)
         LuaFnSetXinFaLevel(sceneId,selfId,2,50)
         LuaFnSetXinFaLevel(sceneId,selfId,3,50)
         LuaFnSetXinFaLevel(sceneId,selfId,4,50)
         LuaFnSetXinFaLevel(sceneId,selfId,5,50)
         LuaFnSetXinFaLevel(sceneId,selfId,6,50)
         LuaFnSetXinFaLevel(sceneId,selfId,55,50)
         LuaFnSetXinFaLevel(sceneId,selfId,72,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10301401,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 98, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 323 then
         if GetMenPai(sceneId, selfId) == 7 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
         LuaFnSetXinFaLevel(sceneId,selfId,43,50)
         LuaFnSetXinFaLevel(sceneId,selfId,44,50)
         LuaFnSetXinFaLevel(sceneId,selfId,45,50)
         LuaFnSetXinFaLevel(sceneId,selfId,46,50)
         LuaFnSetXinFaLevel(sceneId,selfId,47,50)
         LuaFnSetXinFaLevel(sceneId,selfId,48,50)
         LuaFnSetXinFaLevel(sceneId,selfId,62,50)
         LuaFnSetXinFaLevel(sceneId,selfId,79,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10305400,1 ) )
         AddSkill(  sceneId, selfId, 514)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 324 then
         if GetMenPai(sceneId, selfId) == 6 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
         LuaFnSetXinFaLevel(sceneId,selfId,37,50)
         LuaFnSetXinFaLevel(sceneId,selfId,38,50)
         LuaFnSetXinFaLevel(sceneId,selfId,39,50)
         LuaFnSetXinFaLevel(sceneId,selfId,40,50)
         LuaFnSetXinFaLevel(sceneId,selfId,41,50)
         LuaFnSetXinFaLevel(sceneId,selfId,42,50)
         LuaFnSetXinFaLevel(sceneId,selfId,61,50)
         LuaFnSetXinFaLevel(sceneId,selfId,78,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10305401,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 325 then
         if GetMenPai(sceneId, selfId) == 4 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
         LuaFnSetXinFaLevel(sceneId,selfId,25,50)
         LuaFnSetXinFaLevel(sceneId,selfId,26,50)
         LuaFnSetXinFaLevel(sceneId,selfId,27,50)
         LuaFnSetXinFaLevel(sceneId,selfId,28,50)
         LuaFnSetXinFaLevel(sceneId,selfId,29,50)
         LuaFnSetXinFaLevel(sceneId,selfId,30,50)
         LuaFnSetXinFaLevel(sceneId,selfId,59,50)
         LuaFnSetXinFaLevel(sceneId,selfId,76,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10302400,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 326 then
         if GetMenPai(sceneId, selfId) == 3 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
         LuaFnSetXinFaLevel(sceneId,selfId,19,50)
         LuaFnSetXinFaLevel(sceneId,selfId,20,50)
         LuaFnSetXinFaLevel(sceneId,selfId,21,50)
         LuaFnSetXinFaLevel(sceneId,selfId,22,50)
         LuaFnSetXinFaLevel(sceneId,selfId,23,50)
         LuaFnSetXinFaLevel(sceneId,selfId,24,50)
         LuaFnSetXinFaLevel(sceneId,selfId,58,50)
         LuaFnSetXinFaLevel(sceneId,selfId,75,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10302401,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 327 then
         if GetMenPai(sceneId, selfId) == 1 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
         LuaFnSetXinFaLevel(sceneId,selfId,7,50)
         LuaFnSetXinFaLevel(sceneId,selfId,8,50)
         LuaFnSetXinFaLevel(sceneId,selfId,9,50)
         LuaFnSetXinFaLevel(sceneId,selfId,10,50)
         LuaFnSetXinFaLevel(sceneId,selfId,11,50)
         LuaFnSetXinFaLevel(sceneId,selfId,12,50)
         LuaFnSetXinFaLevel(sceneId,selfId,56,50)
         LuaFnSetXinFaLevel(sceneId,selfId,73,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10300400,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
		 
         if GetNumText() == 328 then
         if GetMenPai(sceneId, selfId) == 2 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
         LuaFnSetXinFaLevel(sceneId,selfId,13,50)
         LuaFnSetXinFaLevel(sceneId,selfId,14,50)
         LuaFnSetXinFaLevel(sceneId,selfId,15,50)
         LuaFnSetXinFaLevel(sceneId,selfId,16,50)
         LuaFnSetXinFaLevel(sceneId,selfId,17,50)
         LuaFnSetXinFaLevel(sceneId,selfId,18,50)
         LuaFnSetXinFaLevel(sceneId,selfId,57,50)
         LuaFnSetXinFaLevel(sceneId,selfId,74,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10301400,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end
	
         if GetNumText() == 329 then
         if GetMenPai(sceneId, selfId) == 10 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 10)
         LuaFnSetXinFaLevel(sceneId,selfId,64,50)
         LuaFnSetXinFaLevel(sceneId,selfId,65,50)
         LuaFnSetXinFaLevel(sceneId,selfId,66,50)
         LuaFnSetXinFaLevel(sceneId,selfId,67,50)
         LuaFnSetXinFaLevel(sceneId,selfId,68,50)
         LuaFnSetXinFaLevel(sceneId,selfId,69,50)
         LuaFnSetXinFaLevel(sceneId,selfId,70,50)
         LuaFnSetXinFaLevel(sceneId,selfId,71,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10302402,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end

         if GetNumText() == 330 then
         if GetMenPai(sceneId, selfId) == 11 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 11)
         LuaFnSetXinFaLevel(sceneId,selfId,81,50)
         LuaFnSetXinFaLevel(sceneId,selfId,82,50)
         LuaFnSetXinFaLevel(sceneId,selfId,83,50)
         LuaFnSetXinFaLevel(sceneId,selfId,84,50)
         LuaFnSetXinFaLevel(sceneId,selfId,85,50)
         LuaFnSetXinFaLevel(sceneId,selfId,86,50)
         LuaFnSetXinFaLevel(sceneId,selfId,87,50)
         LuaFnSetXinFaLevel(sceneId,selfId,88,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10306006,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end

         if GetNumText() == 331 then
         if GetMenPai(sceneId, selfId) == 12 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         elseif GetMenPai(sceneId, selfId) ~= 9 then
         BeginEvent(sceneId)
         AddText(sceneId,"#b#WNgß½i ğã có môn phái r°i - không th¬ nh§n lÕi")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId )
         else
         LuaFnJoinMenpai(sceneId, selfId, targetId, 12)
         LuaFnSetXinFaLevel(sceneId,selfId,89,50)
         LuaFnSetXinFaLevel(sceneId,selfId,90,50)
         LuaFnSetXinFaLevel(sceneId,selfId,91,50)
         LuaFnSetXinFaLevel(sceneId,selfId,92,50)
         LuaFnSetXinFaLevel(sceneId,selfId,93,50)
         LuaFnSetXinFaLevel(sceneId,selfId,94,50)
         LuaFnSetXinFaLevel(sceneId,selfId,95,50)
         LuaFnSetXinFaLevel(sceneId,selfId,96,50)
         LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, 10307006,1 ) )
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         local	nam	= LuaFnGetName( sceneId, selfId )
         SetMissionData(sceneId, selfId, ZHOUTIANWUXUEXINDE, day);
         BeginEvent( sceneId )
         AddText( sceneId, "#b#WGia nh§p môn phái thành công #rChúc bÕn ch½i game vui vë" )
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         end


         --Thay Doi Mon Phai
         if GetNumText() == 201 then
         BeginEvent( sceneId )
         AddText(sceneId,"#b#WCh÷n môn phái mu¯n thay ğ±i !")
         AddText(sceneId,"#b#WSau khi thay ğ±i môn phái tâm pháp s¨ ğÕt c¤p 90 !")			
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GTinh Túc", 6, 530)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GTiêu Dao", 6, 531)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GThiªu Lâm", 6, 532)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GThiên S½n", 6, 533)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GThiên Long", 6, 534)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GNga My", 6, 536)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GVõ Ğang", 6, 535)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GMinh Giáo", 6, 537)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GCái Bang", 6, 538)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GMµ Dung", 6, 539)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GĞß¶ng Môn", 6, 540)
         AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GQuÖ C¯c", 6, 541)	
         --AddNumText( sceneId, x990010_g_scriptId, "Chuy¬n phái #GĞào Hoa Ğäo", 6, 542)		 
         EndEvent( sceneId )
         DispatchEventList( sceneId, selfId, targetId )
         end
         if key >=530 and key <= 542 then
         if LuaFnGetAvailableItemCount(sceneId, selfId, x990010_g_LenhBaiMonPhai) < 1 then
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WBÕn không có #G"..GetItemName(sceneId, x990010_g_LenhBaiMonPhai) )		
         return
         elseif mp == 12 and VT_MP == 0 then
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WBÕn chßa gia nh§p môn phái" )
         return
         else		
         x990010_DoiPhai( sceneId, selfId, targetId )
         end
         end	
		 
function x990010_DoiPhai(sceneId,selfId,targetId)
	
         if GetNumText() == 530 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
         LuaFnSetXinFaLevel(sceneId,selfId,31,90)
         LuaFnSetXinFaLevel(sceneId,selfId,32,90)
         LuaFnSetXinFaLevel(sceneId,selfId,33,90)
         LuaFnSetXinFaLevel(sceneId,selfId,34,90)
         LuaFnSetXinFaLevel(sceneId,selfId,35,90)
         LuaFnSetXinFaLevel(sceneId,selfId,36,90)
         LuaFnSetXinFaLevel(sceneId,selfId,60,90)
         LuaFnSetXinFaLevel(sceneId,selfId,77,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 531 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
         LuaFnSetXinFaLevel(sceneId,selfId,49,90)
         LuaFnSetXinFaLevel(sceneId,selfId,50,90)
         LuaFnSetXinFaLevel(sceneId,selfId,51,90)
         LuaFnSetXinFaLevel(sceneId,selfId,52,90)
         LuaFnSetXinFaLevel(sceneId,selfId,53,90)
         LuaFnSetXinFaLevel(sceneId,selfId,54,90)
         LuaFnSetXinFaLevel(sceneId,selfId,63,90)
         LuaFnSetXinFaLevel(sceneId,selfId,80,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 532 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
         LuaFnSetXinFaLevel(sceneId,selfId,1,90)
         LuaFnSetXinFaLevel(sceneId,selfId,2,90)
         LuaFnSetXinFaLevel(sceneId,selfId,3,90)
         LuaFnSetXinFaLevel(sceneId,selfId,4,90)
         LuaFnSetXinFaLevel(sceneId,selfId,5,90)
         LuaFnSetXinFaLevel(sceneId,selfId,6,90)
         LuaFnSetXinFaLevel(sceneId,selfId,55,90)
         LuaFnSetXinFaLevel(sceneId,selfId,72,90)
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 533 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
         LuaFnSetXinFaLevel(sceneId,selfId,43,90)
         LuaFnSetXinFaLevel(sceneId,selfId,44,90)
         LuaFnSetXinFaLevel(sceneId,selfId,45,90)
         LuaFnSetXinFaLevel(sceneId,selfId,46,90)
         LuaFnSetXinFaLevel(sceneId,selfId,47,90)
         LuaFnSetXinFaLevel(sceneId,selfId,48,90)
         LuaFnSetXinFaLevel(sceneId,selfId,62,90)
         LuaFnSetXinFaLevel(sceneId,selfId,79,90)
         AddSkill(  sceneId, selfId, 514)		
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 534 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
         LuaFnSetXinFaLevel(sceneId,selfId,37,90)
         LuaFnSetXinFaLevel(sceneId,selfId,38,90)
         LuaFnSetXinFaLevel(sceneId,selfId,39,90)
         LuaFnSetXinFaLevel(sceneId,selfId,40,90)
         LuaFnSetXinFaLevel(sceneId,selfId,41,90)
         LuaFnSetXinFaLevel(sceneId,selfId,42,90)
         LuaFnSetXinFaLevel(sceneId,selfId,61,90)
         LuaFnSetXinFaLevel(sceneId,selfId,78,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 536 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
         LuaFnSetXinFaLevel(sceneId,selfId,25,90)
         LuaFnSetXinFaLevel(sceneId,selfId,26,90)
         LuaFnSetXinFaLevel(sceneId,selfId,27,90)
         LuaFnSetXinFaLevel(sceneId,selfId,28,90)
         LuaFnSetXinFaLevel(sceneId,selfId,29,90)
         LuaFnSetXinFaLevel(sceneId,selfId,30,90)
         LuaFnSetXinFaLevel(sceneId,selfId,59,90)
         LuaFnSetXinFaLevel(sceneId,selfId,76,90)
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 535 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
         LuaFnSetXinFaLevel(sceneId,selfId,19,90)
         LuaFnSetXinFaLevel(sceneId,selfId,20,90)
         LuaFnSetXinFaLevel(sceneId,selfId,21,90)
         LuaFnSetXinFaLevel(sceneId,selfId,22,90)
         LuaFnSetXinFaLevel(sceneId,selfId,23,90)
         LuaFnSetXinFaLevel(sceneId,selfId,24,90)
         LuaFnSetXinFaLevel(sceneId,selfId,58,90)
         LuaFnSetXinFaLevel(sceneId,selfId,75,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 537 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
         LuaFnSetXinFaLevel(sceneId,selfId,7,90)
         LuaFnSetXinFaLevel(sceneId,selfId,8,90)
         LuaFnSetXinFaLevel(sceneId,selfId,9,90)
         LuaFnSetXinFaLevel(sceneId,selfId,10,90)
         LuaFnSetXinFaLevel(sceneId,selfId,11,90)
         LuaFnSetXinFaLevel(sceneId,selfId,12,90)
         LuaFnSetXinFaLevel(sceneId,selfId,56,90)
         LuaFnSetXinFaLevel(sceneId,selfId,73,90)
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 538 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
         LuaFnSetXinFaLevel(sceneId,selfId,13,90)
         LuaFnSetXinFaLevel(sceneId,selfId,14,90)
         LuaFnSetXinFaLevel(sceneId,selfId,15,90)
         LuaFnSetXinFaLevel(sceneId,selfId,16,90)
         LuaFnSetXinFaLevel(sceneId,selfId,17,90)
         LuaFnSetXinFaLevel(sceneId,selfId,18,90)
         LuaFnSetXinFaLevel(sceneId,selfId,57,90)
         LuaFnSetXinFaLevel(sceneId,selfId,74,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 539 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 10)
         LuaFnSetXinFaLevel(sceneId,selfId,64,90)
         LuaFnSetXinFaLevel(sceneId,selfId,65,90)
         LuaFnSetXinFaLevel(sceneId,selfId,66,90)
         LuaFnSetXinFaLevel(sceneId,selfId,67,90)
         LuaFnSetXinFaLevel(sceneId,selfId,68,90)
         LuaFnSetXinFaLevel(sceneId,selfId,69,90)
         LuaFnSetXinFaLevel(sceneId,selfId,70,90)
         LuaFnSetXinFaLevel(sceneId,selfId,71,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 540 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 11)
         LuaFnSetXinFaLevel(sceneId,selfId,81,90)
         LuaFnSetXinFaLevel(sceneId,selfId,82,90)
         LuaFnSetXinFaLevel(sceneId,selfId,83,90)
         LuaFnSetXinFaLevel(sceneId,selfId,84,90)
         LuaFnSetXinFaLevel(sceneId,selfId,85,90)
         LuaFnSetXinFaLevel(sceneId,selfId,86,90)
         LuaFnSetXinFaLevel(sceneId,selfId,87,90)
         LuaFnSetXinFaLevel(sceneId,selfId,88,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)		 
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_LenhBaiMonPhai,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 541 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 12)
         LuaFnSetXinFaLevel(sceneId,selfId,89,90)
         LuaFnSetXinFaLevel(sceneId,selfId,90,90)
         LuaFnSetXinFaLevel(sceneId,selfId,91,90)
         LuaFnSetXinFaLevel(sceneId,selfId,92,90)
         LuaFnSetXinFaLevel(sceneId,selfId,93,90)
         LuaFnSetXinFaLevel(sceneId,selfId,94,90)
         LuaFnSetXinFaLevel(sceneId,selfId,95,90)
         LuaFnSetXinFaLevel(sceneId,selfId,96,90)
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_MonPhaiChuyenHoanLenh,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )
		 
         elseif GetNumText() == 542 then
         LuaFnJoinMenpai(sceneId, selfId, targetId, 9)
         LuaFnSetXinFaLevel(sceneId,selfId,97,90)
         LuaFnSetXinFaLevel(sceneId,selfId,98,90)
         LuaFnSetXinFaLevel(sceneId,selfId,99,90)
         LuaFnSetXinFaLevel(sceneId,selfId,100,90)
         LuaFnSetXinFaLevel(sceneId,selfId,101,90)
         LuaFnSetXinFaLevel(sceneId,selfId,102,90)
         LuaFnSetXinFaLevel(sceneId,selfId,103,90)
         LuaFnSetXinFaLevel(sceneId,selfId,104,90)
         AddSkill( sceneId, selfId, 760)
         AddSkill( sceneId, selfId, 761)
         AddSkill( sceneId, selfId, 762)
         AddSkill( sceneId, selfId, 763)
         AddSkill( sceneId, selfId, 764)
         AddSkill( sceneId, selfId, 765)
         AddSkill( sceneId, selfId, 766)
         AddSkill( sceneId, selfId, 767)
         AddSkill( sceneId, selfId, 768)
         AddSkill( sceneId, selfId, 769)
         AddSkill( sceneId, selfId, 770)
         AddSkill( sceneId, selfId, 771)
         AddSkill( sceneId, selfId, 772)
         AddSkill( sceneId, selfId, 773)
         AddSkill( sceneId, selfId, 774)
         AddSkill( sceneId, selfId, 775)
         AddSkill( sceneId, selfId, 776)
         AddSkill( sceneId, selfId, 777)
         AddSkill( sceneId, selfId, 778)
         AddSkill( sceneId, selfId, 779)
         AddSkill( sceneId, selfId, 780)		 
         LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
         LuaFnDelAvailableItem(sceneId,selfId,x990010_g_MonPhaiChuyenHoanLenh,1)	
         x990010_NotifyFailBox( sceneId, selfId, targetId, "#b#WThay ğ±i môn phái thành công #rChúc bÕn ch½i game vui vë" )		 
         end
         end 



		 
end
------**********************************
function x990010_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
------**********************************
function x990010_NotifyFailTips(sceneId,selfId,Tip)
	BeginEvent(sceneId)
	AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
------**********************************
function x990010_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end



