
x990013_XinFaList = {{1,2,3,4,5,6,55,72},{7,8,9,10,11,12,56,73},{13,14,15,16,17,18,57,74},
{19,20,21,22,23,24,58,75},{25,26,27,28,29,30,59,76},{31,32,33,34,35,36,60,77},
{37,38,39,40,41,42,61,78},{43,44,45,46,47,48,62,79},{49,50,51,52,53,54,63,80},{97,98,99,100,101,102,103,104},
{64,65,66,67,68,69,70,71},{81,82,83,84,85,86,87,88},{89,90,91,92,93,94,95,96},{97,98,99,100,101,102,103,104},}

x990013_MenPaiShiZhuang ={10124000,10124001,10124002,10124004,10124003,10124005,10124008,10124006,10124007,10125036,10124074,10124119,10124943} 

x990013_MenPaiName  ={" Thiªu Lâm "," Minh Giáo "," Cái Bang "," Võ Ðang "," Nga Mi "," Tinh Túc "," Thiên Long "," Thiên S½n "," Tiêu Dao "," Ðào Hoa Ðäo "," Mµ Dung "," Ðß¶ng Môn "," QuÖ C¯c "," Tân Thü ",}

x990013_MyXinFa = {}

x990013_g_scriptId = 990013
------**********************************

function  x990013_OnDefaultEvent(  sceneId,  selfId,  targetId  )

                RestoreHp(  sceneId,  selfId  )   
                RestoreMp(  sceneId,  selfId  ) 
                RestoreRage(  sceneId,  selfId  )  

	 BeginEvent(  sceneId  )
	 	 AddText(sceneId,"#b#WTa có th¬ giúp gì cho các hÕ?")
		 --AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GTrùng Lâu", 6, 2207 )		 
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GCông Lñc Ðan", 6, 2209 )	
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GBí T¸ch + VHTÐ", 6, 2208 )			 
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GNguyên Li®u #Y( Ám Khí )", 6, 2210 )		 
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GNguyên Li®u #Y( Long Vån )", 6, 2211 )			
		 --AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GNguyên Li®u #Y( Võ H°n )", 6, 2212 )	
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GNguyên Li®u #Y( L®nh Bài )", 6, 2213 )	
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GCß¶ng Hóa Quy¬n Trøc #Y( 99 )", 6, 2214 )		 
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GTØ Vi Linh Phách #Y( Vß½ng Quy«n )", 6, 2216 )	
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GCØu Thiên Ng÷c Toái #Y( Bäo Giám )", 6, 2217 )	
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GLy Höa + T¦y #Y( Tinh Thông )", 6, 2218 )	
		 AddNumText( sceneId,x990013_g_scriptId, " Nh§n #GDßþc Tr¥n + Chân Nguyên", 6, 2219 )					 
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

------**********************************

------**********************************
function x990013_OnEventRequest(sceneId,selfId,targetId,eventId)

         --Bi Ti Tan Diep
         if GetNumText() == 2207 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,10553100,1) 	
         AddItem(sceneId,10553101,1) 	
         AddItem(sceneId,10553102,1) 			  			 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
		 
         --Bi Ti Tan Diep
         if GetNumText() == 2208 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,30311027,1) 	
         AddItem(sceneId,30311029,1) 	
         AddItem(sceneId,30311031,1) 			 
         AddItem(sceneId,38000531,100) 			 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
		 
         --Cong Luc Dan
         if GetNumText() == 2209 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,39999901,10) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
		 
         --Long Van
         if GetNumText() == 2210 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,10155109,1) 
         AddItem(sceneId,10155119,1)
         AddItem(sceneId,10155129,1)	
         AddItem(sceneId,10155139,1)		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
		 
         --Long Van
         if GetNumText() == 2211 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20310181,100) 
         AddItem(sceneId,20310182,100)
         AddItem(sceneId,20310183,100)		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end	

         --Vo Hon
         if GetNumText() == 2212 then
		 BeginEvent( sceneId )
		    AddText(sceneId,"#b#WTa có th¬ giúp gì cho các hÕ?")	 		 
			AddNumText( sceneId, x990013_g_scriptId, "Nh§n #GNhu§n H°n ThÕch-Ngñ #Y( 1-7 )", 1, 760 )
			AddNumText( sceneId, x990013_g_scriptId, "Nh§n #GNhu§n H°n ThÕch-Kích #Y( 1-7 )", 1, 761 )
			AddNumText( sceneId, x990013_g_scriptId, "Nh§n #GNhu§n H°n ThÕch-Phá #Y( 1-7 )", 1, 762 )
			AddNumText( sceneId, x990013_g_scriptId, "Nh§n #GNhu§n H°n ThÕch-BÕo #Y( 1-7 )", 1, 763 )			
		 EndEvent( sceneId )
		 DispatchEventList( sceneId, selfId,targetId)
	     end
         --Vo Hon
         if GetNumText() == 760 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20310122,1) 
         AddItem(sceneId,20310123,1) 
         AddItem(sceneId,20310124,1) 
         AddItem(sceneId,20310125,1) 
         AddItem(sceneId,20310126,1) 
         AddItem(sceneId,20310127,1) 
         AddItem(sceneId,20310128,1) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
         --Vo Hon
         if GetNumText() == 761 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20310131,1) 
         AddItem(sceneId,20310132,1) 
         AddItem(sceneId,20310133,1) 
         AddItem(sceneId,20310134,1) 
         AddItem(sceneId,20310135,1) 
         AddItem(sceneId,20310136,1) 
         AddItem(sceneId,20310137,1) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
         --Vo Hon
         if GetNumText() == 762 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20310140,1) 
         AddItem(sceneId,20310141,1) 
         AddItem(sceneId,20310142,1) 
         AddItem(sceneId,20310143,1) 
         AddItem(sceneId,20310144,1) 
         AddItem(sceneId,20310145,1) 
         AddItem(sceneId,20310146,1) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
         --Vo Hon
         if GetNumText() == 763 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20310149,1) 
         AddItem(sceneId,20310150,1) 
         AddItem(sceneId,20310151,1) 
         AddItem(sceneId,20310152,1) 
         AddItem(sceneId,20310153,1) 
         AddItem(sceneId,20310154,1) 
         AddItem(sceneId,20310155,1) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end		 

         --Lenh Bai
         if GetNumText() == 2213 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,38001021,100) 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end	

         --Cuong Hoa Quyen Truc
         if GetNumText() == 2214 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,38001111,10) 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end
		 
         --Tu Vi Linh Phach
         if GetNumText() == 2216 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,30600084,1000) 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end		

         --Cuu Thien Ngoc Toai
         if GetNumText() == 2217 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20800033,1000) 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end	

         --Ly Hoa + Tay
         if GetNumText() == 2218 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,20700063,1000) 
         AddItem(sceneId,20700055,100) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end	

         --Duoc Tran Chan Nguyen
         if GetNumText() == 2219 then
         BeginEvent( sceneId )
         BeginAddItem(sceneId)
         AddItem(sceneId,38000952,100) 		 
         AddItem(sceneId,38000304,100) 
         AddItem(sceneId,38501009,1)
         AddItem(sceneId,38502009,1)		 
         AddItem(sceneId,38503009,1) 
         AddItem(sceneId,38504009,1) 
         AddItem(sceneId,38505009,1) 
         AddItem(sceneId,38516009,1) 
         AddItem(sceneId,38517009,1) 
         AddItem(sceneId,38518009,1) 
         AddItem(sceneId,38519009,1) 		 
         EndAddItem(sceneId,selfId)
         AddItemListToHuman(sceneId,selfId)
         x990013_NotifyFailTips(sceneId, selfId, "Nh§n Thành Công")
         end		 
	
         if GetNumText() == 551 then
		 BeginEvent( sceneId )
			AddText( sceneId, "#b#cFF0000Lßu Ý : #GSau khi sØ døng chÑc nång này toàn bµ #Hv§t ph¦m #Gtrong #Htay näi #Gs¨ b¸ xóa bö" )
			AddText( sceneId, "#YBQT s¨ không hoàn trä s¯ #Hv§t ph¦m #Ycüa bÕn khi sØ døng chÑc nång này" )
			AddText( sceneId, "#YÐ÷c kÛ #cFF0000Lßu Ý #Ytrß¾c khi thñc hi®n ð¬ tránh rüi do xäy ra" )
			AddNumText( sceneId, x990013_g_scriptId, "#b#cFF0000Tôi ð°ng ý", 1, 552 )
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
         x990013_NotifyFailTips(sceneId, selfId, "T±ng cµng có t¤t cä #Y"..ClearCount.." #Gv§t ph¦m #Wb¸ Xóa")
         EndEvent(sceneId)
         DispatchEventList(sceneId,selfId,targetId)
         end

end
------**********************************
function x990013_MP_MenPaiCall(sceneId,selfId,idxx,idxxx)

local MenPaiJS = {"Thiªu Lâm",
                  "Minh Giáo",
                  "Cái Bang",
                  "Võ Ðang",
                  "Nga My",
                  "Tinh Túc",
                  "Thiên Long",
                  "Thiên S½n",
                  "Tiêu Dao",
                  "Ðào Hoa Ðäo",
                  "Mµ Dung",
                  "Ðß¶ng Môn",
                  "QuÖ C¯c",
                  "Ðào Hoa Ðäo",
                  }
	  if idxx<1 or idxx >11 then
		--return
	  end
		local OldMenPai = GetMenPai(sceneId,selfId)
		if OldMenPai == 9 and HaveXinFa(sceneId,selfId,99) > 0 then
		OldMenPai = 13
		end


	if idxxx == 1 then
	x990013_AddMenPai( sceneId, selfId,idxx,idxxx )
	elseif idxxx == 5 then
	x990013_AddMenPai( sceneId, selfId,idxx,idxxx )
	else
	local a = GetHumanAttr(sceneId, selfId, 3)
    local b = GetHumanAttr(sceneId, selfId, 4)
    local c = GetHumanAttr(sceneId, selfId, 5)
    local d = GetHumanAttr(sceneId, selfId, 6)
	BeginUICommand( sceneId )
	UICommand_AddString(sceneId,"Thay ð±i #YMôn phái #Wc¥n có #GL®nh Bài Môn Phái")
	UICommand_AddString(sceneId,MenPaiJS[idxx])
	UICommand_AddInt( sceneId,77)
	UICommand_AddInt( sceneId, targetId )
        UICommand_AddInt( sceneId, OldMenPai )
	UICommand_AddInt( sceneId, idxx-1  )
	UICommand_AddInt( sceneId, a )
	UICommand_AddInt( sceneId, b )
	UICommand_AddInt( sceneId, c )
	UICommand_AddInt( sceneId, d )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 20181212 )	
	end
  
	  
return
end
------**********************************
function x990013_AddMenPai( sceneId, selfId, MenPaiId, type)
      --if LuaFnGetAvailableItemCount(sceneId, selfId, 30008106) < 0 then
         --x990013_NotifyFailBox( sceneId, selfId, targetId, "Ngß½i không có #G"..GetItemName(sceneId, 30008106) )		
         --return
      --end

      if type == 1 then
      if GetMenPai(sceneId,selfId) == 9 and HaveXinFa(sceneId,selfId,99) > 0 then
         --x990013_NotifyTip( sceneId, selfId, "Ð±i môn phái c¥n L®nh Bài Môn Phái" )
         type = 5
		MenPaiId = MenPaiId - 1
      end
	  
      if GetMenPai(sceneId,selfId) ~= 9 or HaveXinFa(sceneId,selfId,99) > 0 then
         x990013_NotifyTip( sceneId, selfId, "Ð±i môn phái c¥n L®nh Bài Môn Phái" )
         return
      end
      end
	
      if type == 1 then
      if GetLevel(sceneId, selfId) < 10 then
         x990013_NotifyTip( sceneId,selfId,"C¤p 10 m¾i có th¬ gia nh§p")
         return
      end
      if LuaFnGetPropertyBagSpace(sceneId,selfId) < 3 then
         x990013_NotifyTip( sceneId,selfId,"Yêu c¥u tay näi có 3 ô tr¯ng")
         return
      end
      if MenPaiId <= 9 then
	  MenPaiId = MenPaiId - 1
	  elseif MenPaiId > 10 then
	  MenPaiId = MenPaiId -1
	  end
		if MenPaiId == 13 then
			LuaFnJoinMenpai(sceneId, selfId, 1, 1)
			MenPaiId = 9
			LuaFnJoinMenpai(sceneId, selfId, 1, MenPaiId)
		else
			LuaFnJoinMenpai(sceneId, selfId, 1, MenPaiId)
		end
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][1],120)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][2],120)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][3],120)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][4],120)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][5],120)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][6],120)
	
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][7],120)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][8],120)
	if MenPaiId == 9 then
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
	end
	local	nam	= LuaFnGetName( sceneId, selfId )
	 BroadMsgByChatPipe(  sceneId,  selfId,  "#411#G ["..nam.."] #Wgia nh§p thành công vào môn phái #cFF0000"..x990013_MenPaiName[MenPaiId+1].."",  4  )	 	 
	--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)
    SetMissionData(sceneId,selfId,204,1)
	SetMissionData(sceneId,selfId,MD_SHUANGXIANGPAO_LASTTIME,GetDayTime()) 
    SetMissionData(sceneId,selfId,XIEZI_XINFA_SCORE,107) 
    --LuaFnDelAvailableItem(sceneId,selfId,30008106,1)	

    TryRecieveItem(sceneId,selfId,x990013_MenPaiShiZhuang[MenPaiId+1],1) 
    x990013_NotifyTip(sceneId,selfId,"Chúc m×ng bÕn gia nh§p "..x990013_MenPaiName[MenPaiId+1].." ðÕt ðßþc#{_ITEM"..MenPaiShiZhuang[MenPaiId+1].."},#{_ITEM30501001}*20")
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#WChúc m×ng bÕn tr· thành #gfff0f0"..x990013_MenPaiName[MenPaiId+1].." #g000000#Wð® tØ, ngài có th¬ m²i ngày làm nhi®m vø, #gfff0f0c¤p b§c b¤t ð°ng #g000000#Wlàm sß môn nhi®m vø th¶i ði¬m #gfff0f0nhi«u l¥n kinh nghi®m khen thß·ng s¯ l¥n cûng b¤t ð°ng #g000000#Wnga! Còn có th¬ tìm #gfff0f0LÕc Dß½ng #g000000#WtrÕm d¸ch ch² #gfff0f0khâu hành LÕc [232,319] h² trþ truy«n tin #g000000#W,kiªm mµt chút ti«n tiêu v£t. Ngài cûng có th¬ t× LÕc Dß½ng bên trái cØa thành ði ra ngoài, ðªn #gfff0f0Ðôn Hoàng #g000000#Wsát quái luy®n c¤p, nªu không biªt cø th¬ phß½ng v¸,có th¬ tìm dß½ng vån quäng tß¾ng quân thü hÕ v® binh dò höi." )
       return
   end
   
      if type == 5 then
      if GetMenPai(sceneId,selfId) == 9 and HaveXinFa(sceneId,selfId,99) < 1 then
         x990013_NotifyTip( sceneId, selfId, "BÕn phäi gia nh§p môn phái trß¾c." )
         return
      end
	if MenPaiId > 12 then
	MenPaiId =9
	end
	  
      if GetMenPai(sceneId,selfId) == MenPaiId then
         x990013_NotifyTip( sceneId, selfId, "M¶i bÕn lña ch÷n môn phái c¥n Ð±i" )
         return
      end
		local menpaiPoint = LuaFnGetAvailableItemCount(sceneId, selfId, 30008106)
		if menpaiPoint < 1 then
			x990013_NotifyTip( sceneId, selfId, "Ð±i môn phái c¥n L®nh Bài Môn Phái" )
			return
		end
		LuaFnDelAvailableItem(sceneId,selfId,30008106,1)    
      for i = 1,8 do
        if HaveXinFa(sceneId,selfId,x990013_XinFaList[GetMenPai(sceneId,selfId)+1][i]) > 0 then
           x990013_MyXinFa[i] = HaveXinFa(sceneId,selfId,x990013_XinFaList[GetMenPai(sceneId,selfId)+1][i])
        else
           if i < 7 then
              x990013_MyXinFa[i] = 1
           else
              x990013_MyXinFa[i] = 0
           end
        end
      end

	LuaFnJoinMenpai(sceneId, selfId, 1, MenPaiId)
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][1],x990013_MyXinFa[1])
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][2],x990013_MyXinFa[2])
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][3],x990013_MyXinFa[3])
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][4],x990013_MyXinFa[4])
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][5],x990013_MyXinFa[5])
	LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][6],x990013_MyXinFa[6])
    SetMissionData(sceneId,selfId,204,1)  
        if x990013_MyXinFa[7] > 0 then
	   LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][7],x990013_MyXinFa[7])
        end

        if x990013_MyXinFa[8] > 0 then
	   LuaFnSetXinFaLevel(sceneId,selfId,x990013_XinFaList[MenPaiId+1][8],x990013_MyXinFa[8])
        end
	if MenPaiId == 9 then
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
	end
        CallScriptFunction( 890099, "Mijimiss", sceneId, selfId)
        CallScriptFunction( 892112, "UpWuHunSkills", sceneId, selfId)
        CallScriptFunction( 900033, "WUYI_SKILLJICHENG", sceneId, selfId)

	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#411#G ["..nam.."] #Wgia nh§p thành công vào môn phái #cFF0000"..x990013_MenPaiName[MenPaiId+1].."", 4 )		
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)

	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#WChúc m×ng bÕn tr· thành #gfff0f0"..x990013_MenPaiName[MenPaiId+1].." #g000000#Wð® tØ, ngài có th¬ m²i ngày làm nhi®m vø, #gfff0f0c¤p b§c b¤t ð°ng #g000000#Wlàm sß môn nhi®m vø th¶i ði¬m #gfff0f0nhi«u l¥n kinh nghi®m khen thß·ng s¯ l¥n cûng b¤t ð°ng #g000000#Wnga! Còn có th¬ tìm #gfff0f0LÕc Dß½ng #g000000#WtrÕm d¸ch ch² #gfff0f0khâu hành LÕc [232,319] h² trþ truy«n tin #g000000#W,kiªm mµt chút ti«n tiêu v£t. Ngài cûng có th¬ t× LÕc Dß½ng bên trái cØa thành ði ra ngoài, ðªn #gfff0f0Ðôn Hoàng #g000000#Wsát quái luy®n c¤p, nªu không biªt cø th¬ phß½ng v¸,có th¬ tìm dß½ng vån quäng tß¾ng quân thü hÕ v® binh dò höi." )
       return
   end

end


------**********************************
function x990013_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
------**********************************
function x990013_NotifyFailTips(sceneId,selfId,Tip)
	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
------**********************************
function x990013_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end



