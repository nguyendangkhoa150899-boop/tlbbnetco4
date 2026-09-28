--  111998  sáo trang ð±i NPC

--  lß½ng sß thành 

-- chân v¯n s¯ 
x111998_g_ScriptId  =  111998

-- có sñ ki®n ID li®t bi¬u 
--x111998_g_eventList={889070}

x111998_g_EquipList={	 
--  tr÷ng lâu 
{n=1100,id=10553101},{n=1200,id=10553102},{n=1300,id=10553100},{n=1400,id=10553110},{n=1500,id=10553108},{n=1600,id=10553106},
--  bang phach than cham
{n=2100,id=20310185},{n=2200,id=20310186},{n=2300,id=20310187},{n=2400,id=20310188},{n=2500,id=20310189},{n=2600,id=20310190},
-- skill tien cap 
{n=3100,id=30308200},{n=3110,id=30308210},{n=3120,id=30308220},{n=3130,id=30308230},{n=3140,id=30308240},{n=3150,id=30308250},
{n=3160,id=30308260},{n=3170,id=30308270},{n=3180,id=30308280},{n=3190,id=30308290},{n=3200,id=30308300},{n=3210,id=30308310},

-- hoa loÕi th¥n khí 1
{n=4100,id=10305021},{n=4100,id=10305022},{n=4100,id=10305023},{n=4100,id=10305024},
{n=4100,id=10305025},{n=4100,id=10305026},{n=4100,id=10305027},{n=4100,id=10305028},
-- hoa loÕi th¥n khí 2
{n=4200,id=10305029},{n=4200,id=10305030},{n=4200,id=10305031},{n=4200,id=10305032},
{n=4200,id=10305033},{n=4200,id=10305034},{n=4200,id=10305035},
-- thanh tam pho thien chu
{n=7100,id=30307219},{n=7200,id=30307226},
-- Hanh Van Qua
{n=8100,id=30070501},
}
x111998_g_StoneList={
{n=1,id=20310174,num=600,str=" Long H°n Ng÷c "},
{n=2,id=30505078,num=5,str=" Thiên Thß Tàn Hi®t "},
{n=3,id=20310174,num=600,str=" Long H°n Ng÷c "},
{n=4,id=20310174,num=600,str=" Long H°n Ng÷c "},
{n=5,id=20310174,num=600,str=" Long H°n Ng÷c  "},
{n=6,id=20310174,num=2,str=" Long H°n Ng÷c "},
{n=7,id=20310174,num=250,str=" Long H°n Ng÷c "},
{n=8,id=20310174,num=200,str=" Long H°n Ng÷c "},
{n=9,id=50513004,num=3,str=" H°ng Bäo ThÕch c¤p 5 x "},
}
--x111998_g_StoneList={
--{n=1,id=20310185,num=600,str=" Trùng Lâu Chi L® "},
--{n=2,id=20310186,num=600,str=" Trùng Lâu Chi Mang "},
--{n=3,id=20310187,num=600,str=" Trùng Lâu Chi Thß½ng "},
--{n=4,id=20310188,num=600,str=" Trùng Lâu Chi Dß½ng "},
--{n=5,id=20310189,num=600,str=" Thiên Ð¸a Minh Châu  "},
--{n=6,id=20310190,num=600,str=" Lßu Ly Minh Châu "},
--}

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x111998_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"    #cFF0000 [Long H°n Ng÷c] #W r½i tÕi: #YTÑ Tuy®t Trang, Thiªu Th¤t S½n, Ði C¶, Túc C¥u..  #G tiªp tøc c§p nh§t...  ")
	 	 --for  i,  eventId  in  x111998_g_eventList  do
	 	 --	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 	 --end
	 	 --AddNumText(  sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Trùng Lâu Ma Gi¾i ",  6,  1000  )
	 	 AddNumText(  sceneId,  x111998_g_ScriptId,  "#H Ð±i Nguyên Li®u Trùng Lâu ",  6,  2000  )
	 	 AddNumText(  sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Tiªn C¤p ",  6,  3000  )
	 	 --AddNumText(  sceneId,  x111998_g_ScriptId,  "#H Ð±i Cá Tính Th¥n Khí ",  6,  4000  )
	 	 --AddNumText(  sceneId,  x111998_g_ScriptId,  "#H Ð±i Yªu Quyªt ",  6,  7000  )
		--if LuaFnGetGUID( sceneId, selfId ) == 1010000010     then
	 	 AddNumText(  sceneId,  x111998_g_ScriptId,  "#H Ð±i HÕnh V§n Quä ",  6,  8000  )		
		--end		
	 	 AddNumText(  sceneId,  x111998_g_ScriptId,  " R¶i ði",  0,  0  )

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x111998_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x111998_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x111998_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 local  nNumText  =  GetNumText()
	 if  nNumText  ==  0    then
	 	 --  t¡t cØa s± 
	 	 BeginUICommand(sceneId)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  1000)
	 	 return
	 end
	 
	 if  nNumText  ==  1000  or  nNumText  ==  2000  or  nNumText  ==  3000  or  nNumText  ==  4000  or  nNumText  ==  7000  or  nNumText  ==  8000  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  "    M¶i Lña Ch÷n Trang B¸ C¥n Ð±i ! ")
	 	 	 if  nNumText  ==  1000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Trùng Lâu Gi¾i ",  6,  nNumText+100)
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Trùng Lâu Ng÷c ",  6,  nNumText+200)
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Trùng Lâu Liên ",  6,  nNumText+300)
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Trùng Lâu Giáp ",  6,  nNumText+400)
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Trùng Lâu Kiên ",  6,  nNumText+500)
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Trùng Lâu Ð¾i ",  6,  nNumText+600)
	 	 	 end
	 	 	 if  nNumText  ==  2000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Trùng Lâu Chi L®",  6,  nNumText+100)
	 	 	 end
	 	 	 if  nNumText  ==  2000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Trùng Lâu Chi Mang",  6,  nNumText+200)
	 	 	 end	
	 	 	 if  nNumText  ==  2000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Trùng Lâu Chi Thß½ng",  6,  nNumText+300)
	 	 	 end
	 	 	 if  nNumText  ==  2000    then
	 	 	AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Trùng Lâu Chi Dß½ng",  6,  nNumText+400)
	 	 	 end	
	 	 	 if  nNumText  ==  2000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Thiên Ðîa Minh Châu",  6,  nNumText+500)
	 	 	 end	
	 	 	 if  nNumText  ==  2000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i Lßu Li Minh Châu",  6,  nNumText+600)
	 	 	 end			 
	 	 	 if  nNumText  ==  3000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Thiªu Lâm ",  6,  nNumText+100)
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Minh Gíao ",  6,  nNumText+110)
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Cái Bang",  6,  nNumText+120)	
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Võ Ðang ",  6,  nNumText+130)	
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Nga Mi ",  6,  nNumText+140)	
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Tinh Túc ",  6,  nNumText+150)
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Thiên Long ",  6,  nNumText+160)
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Thiên S½n ",  6,  nNumText+170)
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Tiêu Dao ",  6,  nNumText+180)
		 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Mµ Dung ",  6,  nNumText+190)
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Ðß¶ng Môn ",  6,  nNumText+200)
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Tiªn C¤p Qüy C¯c ",  6,  nNumText+210)
			 
	 	 	 end
			 
			 
	 	 	 if  nNumText  ==  4000    then
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i th¥n khí cá tính 102",  6,  nNumText+100)
	 	 	 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i th¥n khí cá tính 102",  6,  nNumText+200)
	 	 	 end
		 	 if  nNumText  ==  7000    then		 
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Thanh Tâm Ph± Thi®n Chú ",  6,  nNumText+100)
		 	 end
		 	 if  nNumText  ==  7000    then		 
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Hoành Täo Càn Khôn ",  6,  nNumText+200)
		 	 end
		 	 if  nNumText  ==  8000    then		 
			 AddNumText(sceneId,  x111998_g_ScriptId,  "#cFF0000 Ð±i HÕnh V§n Quä = H°ng Bäo ThÕch 5",  6,  nNumText+100)
		 	 end			 
	 	 	 AddNumText(  sceneId,  x111998_g_ScriptId,  " R¶i Ði",  0,  0  )			 
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 if  nNumText  >  1000  and  nNumText  <  11000    then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  " NetCo4 kính chào quý b¢ng hæu ! ! ")
	 	 	 
	 	 	 local  nLevel  =  0
	 	 	 if  nNumText  ==  1100  then
	 	 	 	 nLevel  =  1
	 	 	 end
	 	 	 if  nNumText  ==  1200  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  1300  then
	 	 	 	 nLevel  =  3
	 	 	 end
			 if  nNumText  ==  1400  then
	 	 	 	 nLevel  =  4
	 	 	 end
			 if  nNumText  ==  1500  then
	 	 	 	 nLevel  =  5
	 	 	 end
			 if  nNumText  ==  1600  then
	 	 	 	 nLevel  =  6
	 	 	 end
	 	 	 if  nNumText  ==  2100  then
	 	 	 	 nLevel  =  6
	 	 	 end
	 	 	 if  nNumText  ==  2200  then
	 	 	 	 nLevel  =  6
	 	 	 end
	 	 	 if  nNumText  ==  2300  then
	 	 	 	 nLevel  =  6
	 	 	 end
	 	 	 if  nNumText  ==  2400  then
	 	 	 	 nLevel  =  6
	 	 	 end
	 	 	 if  nNumText  ==  2500  then
	 	 	 	 nLevel  =  6
	 	 	 end	
	 	 	 if  nNumText  ==  2600  then
	 	 	 	 nLevel  =  6
	 	 	 end			 
	 	 	 if  nNumText  ==  3100  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3110  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3120  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3130  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3140  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3150  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3160  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3170  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3180  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3190  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3200  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  nNumText  ==  3210  then
	 	 	 	 nLevel  =  2
	 	 	 end			 
	 	 	 if  nNumText  ==  4200  then
	 	 	 	 nLevel  =  6
			 end
	 	 	 if  nNumText  ==  7100  then
	 	 	 	 nLevel  =  7				 
	 	 	 end
	 	 	 if  nNumText  ==  7200  then
	 	 	 	 nLevel  =  8				 
	 	 	 end
	 	 	 if  nNumText  ==  8100  then
	 	 	 	 nLevel  =  9				 
	 	 	 end			 
--	 if  GetNumText()  ==  5100  then
--	               	 local  nStoneId0  =  30503097
--	               	 local  nStoneId1  =  10555559
--	 	 	 local  nStoneId2  =  10555569
--	 	 	 local  nStoneId3  =  10555579
--	 	 	 local  nStoneId4  =  10555589
--	 	 	 local  nStoneId5  =  30503098
--	 	 c0  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId0)
--	 	 c1  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId1)
--	 	 c2  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId2)
--	 	 c3  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId3)
--	 	 c4  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId4)
--	 	 c5  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  nStoneId5)
  --                      if  c0  >=10  and  c1  >=1  and  c2>=1  and  c3>=1  and  c4>=1  and  c5>=10  then
--	 	 	 	 BeginEvent(  sceneId  )  
--	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,30503097,10)-- thü tiêu v§t ph¦m 
----	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10555559,1)-- thü tiêu v§t ph¦m 
--	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10555569,1)-- thü tiêu v§t ph¦m 
--	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10555579,1)-- thü tiêu v§t ph¦m 
--	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,10555589,1)-- thü tiêu v§t ph¦m 
--	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,30503098,10)-- thü tiêu v§t ph¦m 
--	 	 	 	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  10555800,  1)-- cho v§t ph¦m 
--	 	 	 	               local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
--	 	 	 	 	 x889063_ShowRandomSystemNotice(  sceneId,  selfId,  szItemTransfer  )
--	 	 	 	 	 strText  =  "#G chúc m×ng ngß½i , thành công ð±i   chí tôn th§t · tr÷ng lâu bµ/vö   món mµt trong ! "
--	 	 	 	 	 AddText(  sceneId,  strText  )
--	 	 	 	 EndEvent(  sceneId  )
--                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
--                                        else
  --                            	 BeginEvent(  sceneId  )  
--	 	 	 	 	 strText  =  "#G ngß½i tài li®u không ðü , ð±i   chí tôn th§t · tr÷ng lâu liên   c¥n : #W phßþng hoàng ðích vû mao 10 cá ?#G th¥n long ðích väy 10 cá cùng v¾i   bång ? lØa ? huy«n ? ðµc 4 thuµc tính mãn c¤p ðiêu vån th§t · tr÷ng lâu liên các mµt ! #r m²i tr÷ng lâu cûng c¯ ð¸nh mµt ði¬m chuª ðích v¸ trí ! "
--	 	 	 	 	 AddText(  sceneId,  strText  )	 	 	 	 	 
--	 	 	 	 EndEvent(  sceneId  )
  --                            	 DispatchEventList(  sceneId,  selfId,  targetId  )
--	 	 	 end

	 

	 
	 	 	 local  szStr  =  " Ð¬ ð±i trang b¸ này c¥n kiªm v« cho ta #Y"  ..  x111998_g_StoneList[nLevel].str  
	 	 	 	 	 	 	 	 	 	 ..  "#Y"..  tostring(x111998_g_StoneList[nLevel].num)  ..  " #Wcái"
	 	 	 AddText(sceneId,  szStr)
	 	 	 
	 	 	 for  i,  item  in  x111998_g_EquipList  do
	 	 	 	 if  item.n  ==  nNumText    then
	 	 	 	 	 AddRadioItemBonus(  sceneId,  item.id,  4  )
	 	 	 	 end
	 	 	 end
        EndEvent(sceneId)
        --DispatchMissionDemandInfo(sceneId,selfId,targetId,  x111998_g_ScriptId,  x210200_g_MissionId)
        DispatchMissionContinueInfo(sceneId,selfId,targetId,  x111998_g_ScriptId,  0)
	 	 
	 end

	 for  i,  findId  in  x111998_g_eventList  do
	 	 if  eventId  ==  findId  then	 	 	 
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end
--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x111998_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x111998_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
end
--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x111998_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x111998_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x111998_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x111998_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x111998_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x111998_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x111998_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )

	 -- xØ lý ð« giao sau ðích bi¬u hi®n tình hu¯ng 
	 -- vì an toàn , n½i này phäi c¦n th§n , không th¬ ra l²i 
	 local  nItemIndex  =  -1
	 
	 for  i,  item  in  x111998_g_EquipList  do
	 	 if  item.id  ==  selectRadioId    then
	 	 	 nItemIndex  =  i
	 	 end
	 end
	 
	 if  nItemIndex  ==  -1    then
	 	 return
	 end
	 
	 --  nhìn xong nhà có phäi hay không ðü tài li®u ð« giao 
	 local  nLevel  =  0
	 if  x111998_g_EquipList[nItemIndex].n  ==  1100  then
	 	 nLevel  =  1
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  1200  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  1300  then
	 	 nLevel  =  3
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  1400  then
	 	 nLevel  =  4
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  1500  then
	 	 nLevel  =  5
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  1600  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  2100  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  2200  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  2300  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  2400  then
	 	 nLevel  =  6
	 end	
	 if  x111998_g_EquipList[nItemIndex].n  ==  2500  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  2600  then
	 	 nLevel  =  6
	 end	 
	 if  x111998_g_EquipList[nItemIndex].n  ==  3100  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3110  then
	 	 nLevel  =  2
	 end	 
	 if  x111998_g_EquipList[nItemIndex].n  ==  3120  then
	 	 nLevel  =  2
	 end	
	 if  x111998_g_EquipList[nItemIndex].n  ==  3130  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3140  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3150  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3160  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3170  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3180  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3190  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3200  then
	 	 nLevel  =  2
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  3210  then
	 	 nLevel  =  2
	 end 
	 if  x111998_g_EquipList[nItemIndex].n  ==  4100  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  4200  then
	 	 nLevel  =  6
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  7100  then
	 	 nLevel  =  7
	 end
	 if  x111998_g_EquipList[nItemIndex].n  ==  7200  then
	 	 nLevel  =  8
	 end
	 	 if  x111998_g_EquipList[nItemIndex].n  ==  8100  then
	 	 nLevel  =  9
	 end

	 local  bStoneOk  =  0
	 if  GetItemCount(sceneId,  selfId,  x111998_g_StoneList[nLevel].id)  >=  x111998_g_StoneList[nLevel].num    then
	 	 bStoneOk  =  1
	 end
	 
	 if    bStoneOk  ==  0  then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Không có ðü v§t ph¦m, không th¬ ð±i . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 
	 --  ki¬m tra có phäi hay không có ð¥y ðü ðá có th¬ kh¤u tr× 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  x111998_g_StoneList[nLevel].id)  <  x111998_g_StoneList[nLevel].num      then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Không có ðü v§t ph¦m, không th¬ ð±i . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 	 
	 end
	 
	 --  ki¬m tra túi ðeo lßng không gian 
	 BeginAddItem(sceneId)
	 	 AddItem(sceneId,  selectRadioId,  1)
	 local  bBagOk  =  EndAddItem(sceneId,  selfId)
	 
	 if  bBagOk  <  1  then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Tay näi không ðü ch² tr¯ng "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 local  nItemBagIndexStone  =  GetBagPosByItemSn(sceneId,  selfId,  x111998_g_StoneList[nLevel].id)
	 local  szTransferStone  =  GetBagItemTransfer(sceneId,selfId,  nItemBagIndexStone)
	 
	 --  thü tiêu tß½ng quan ðá 
	 local  bDelOk  =  LuaFnDelAvailableItem(sceneId,selfId,  x111998_g_StoneList[nLevel].id,  x111998_g_StoneList[nLevel].num)
	 
	 if  bDelOk  <  1    then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Kh¤u Tr× Ðá. "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 else
	 	 -- cho hoàn nhà ð° , hoàn thành 
	 	 --  AddItemListToHuman(sceneId,selfId)
	 	 --
	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  x111998_g_EquipList[nItemIndex].id,  1  );
	 	 
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Trao ð±i thành công . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 
	 	 local  message;	 
	 	 local  randMessage  =  random(3);
	 	 local  sItemName  =  GetItemName(sceneId,  x111998_g_EquipList[nItemIndex].id)
	 	 
	 	 local  szTransferEquip  =  GetBagItemTransfer(sceneId,selfId,  nBagIndex)
	 	 
	 	 if  randMessage  ==  1  then
	 	       	 message  =  format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#I mµt mñc cung kính ðßa ðªn#G LÕc Dß½ng #R Lßu Thi Thi#I Haha : r¤t t¯t, r¤t t¯t #{_INFOMSG%s}#{WLS_11}",  LuaFnGetName(sceneId,  selfId),  x111998_g_StoneList[nLevel].num,  szTransferStone,  szTransferEquip);
	 	 elseif  randMessage  ==  2  then
	 	 	 message  =  format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}	 #I ðßa ðªn #G LÕc Dß½ng #R Lßu Thi Thi#I ch¡p tay : “ làm phi«n làm phi«n , #{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}",  LuaFnGetName(sceneId,  selfId),  x111998_g_StoneList[nLevel].num,  szTransferStone,  szTransferStone,  szTransferEquip);
	 	 else
	 	 	 message  =  format("#W#G Lßu Thi Thi #R Ð±i Quà #I ðã nh§n #Y%d#cffffcc viên #W#{_INFOMSG%s}#cffffcc t× ngß¶i ch½i : #W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}",  x111998_g_StoneList[nLevel].num,  szTransferStone,  LuaFnGetName(sceneId,  selfId),  szTransferEquip);
	 	 end
	 	 
	 	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);
	 	 
	 	 return
	 end

	 for  i,  findId  in  x111998_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x111998_OnDie(  sceneId,  selfId,  killerId  )
end