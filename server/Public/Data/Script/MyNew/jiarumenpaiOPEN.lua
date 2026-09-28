------  dçn tß·ng NPC
x990010_XinFaList  =  {{1,2,3,4,5,6,55,72},{7,8,9,10,11,12,56,73},{13,14,15,16,17,18,57,74},
{19,20,21,22,23,24,58,75},{25,26,27,28,29,30,59,76},{31,32,33,34,35,36,60,77},
{37,38,39,40,41,42,61,78},{43,44,45,46,47,48,62,79},{49,50,51,52,53,54,63,80},{0,0,0,0,0,0,0,0},
{64,65,66,67,68,69,70,71},{81,82,83,84,85,86,87,88},{89,90,91,92,93,94,95,96},}

x990010_MenPaiShiZhuang  ={10124000,10124001,10124002,10124004,10124003,10124005,10124008,10124006,10124007,0,10124074,10124119,10124943}  

x990010_MenPaiName  ={" Thiªu Lâm "," Minh Giáo "," Cái Bang "," Võ Ðang "," Nga Mi "," Tinh Túc "," Thiên Long "," Thiên S½n "," Tiêu Dao "," không cØa phái "," Mµ Dung "," Ðß¶ng Môn "," QuÖ C¯c "}

x990010_g_scriptId  =  990010
------**********************************
------ sñ ki®n ðóng h² nh§p kh¦u 
------**********************************
function  x990010_OnDefaultEvent(  sceneId,  selfId,  targetId  )

                RestoreHp(  sceneId,  selfId  )  ------ mãn máu 
                RestoreMp(  sceneId,  selfId  )  ------ mãn khí 
                RestoreRage(  sceneId,  selfId  )  ------ mãn gi§n 
	 --LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  18,  0)

	 BeginEvent(  sceneId  )
	 AddText(sceneId,"#YHoan nghênh b¢ng hæu ðªn v¶i NetCo4 . Sau khi gia nh§p môn phái vui lòng ðªn các NPC môn phái ð¬ nâng c¤p tâm pháp!")
	 AddText(sceneId,"#r#G[ Nªu có v¤n ð« gì xin vui lòng liên h® fanpage ho£c GM ð¬ giäi ðáp]")
	 	 AddNumText(  sceneId,  x990010_g_scriptId,  "#cFF0000Gia Nh§p Môn Phái ",  6,  200)
	 	--AddNumText(  sceneId,  x990010_g_scriptId,  "#cffcc00 v¯n dùng/u¯ng ð£c s¡c ",  6,  300)
	 	 AddNumText(  sceneId,  x990010_g_scriptId,  "#cff6633Tuy«n T¯ng T±ng Hþp",  6,  400)
	 	 AddNumText(  sceneId,  x990010_g_scriptId,  "#GTr¸ li®u",  3,  500)
		 AddNumText(sceneId, x990010_g_scriptId, "#c66ccccNh§n Skill S½ C¤p", 6, 918)
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

------**********************************
------ sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
------**********************************
function  x990010_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

          if  GetNumText()  ==  200  then
	     BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,GetSex(sceneId,  selfId))
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    2017101501)
          end

          if  GetNumText()  ==  400  then
	     BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,GetSex(sceneId,  selfId))
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    20170503)
          end
	if  GetNumText()  ==  918  then
	 AddSkill( sceneId, selfId, 21 )
	 AddSkill( sceneId, selfId, 22 )
	 AddSkill( sceneId, selfId, 34 )
	 AddSkill( sceneId, selfId, 35 )
	 AddSkill( sceneId, selfId, 241 )
	 AddSkill( sceneId, selfId, 242 )
	 AddSkill( sceneId, selfId, 243 )
	 AddSkill( sceneId, selfId, 244 )
	 AddSkill( sceneId, selfId, 245 )
	 AddSkill( sceneId, selfId, 246 )
	 AddSkill( sceneId, selfId, 247 )
	 AddSkill( sceneId, selfId, 248 )
	 AddSkill( sceneId, selfId, 249 )
	 AddSkill( sceneId, selfId, 239 )
	 AddSkill( sceneId, selfId, 279 )	
	 AddSkill( sceneId, selfId, 280 )	 	 
	 x990010_NotifyFailBox( sceneId, selfId, targetId, "Các hÕ ðã h÷c ðßþc kÛ nång \"Skill c½ bän s½ c¤p\"." )
	 return
	 end		  

          if  GetNumText()  ==  300  then
	     BeginUICommand(  sceneId  )
                    UICommand_AddString(sceneId,"#cffcc00 bän b±n gi¾i thi®u ");
	     UICommand_AddInt(  sceneId,11)
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS1}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS2}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS3}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS4}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS5}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS6}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS7}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS8}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS9}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS10}");
                    UICommand_AddString(sceneId,"#{XIEZI_LIEYAN_JS11}");
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    20151024)
          end


          if  GetNumText()  ==  500  then
                local  WuYiLev  =  mod(GetMissionData(sceneId,selfId,WUYI_LEVEL),10000)
                if  WuYiLev  >=  10  then
                      x990010_NotifyTip(  sceneId,selfId," này hÕng chÑc nång dùng cho tu chánh vû ý 5 c¤p không có nh§n l¤y ðªn b°i nguyên ði¬m ðªm ðích v¤n ð« , vßþt qua 10 c¤p không có hi®u quä ")
                      return
                end

                local  jiance  =  0
                local  TianFuSkill  =  {}
                            TianFuSkill[0]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_A)/10000)    -- b°i nguyên ði¬m ðªm 
                            TianFuSkill[1]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_A),10000)                    -- thÑ 1 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[2]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_BC)/10000)                -- thÑ 2 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[3]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),10000)                    -- thÑ 3 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[4]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_DE)/10000)                -- thÑ 4 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[5]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10000)                    -- thÑ 5 quy¬n sách kÛ nång c¤p b§c 

                if  TianFuSkill[0]  ~=  0  then
                      jiance  =  1
                end

                for  i=1,5  do
                        if  TianFuSkill[i]  ~=  0  then
                              jiance  =  1
                        end
                end

                if  jiance  >  0  then
                      x990010_NotifyTip(  sceneId,selfId," Các hÕ khí huyªt lßu thông sinh lñc d°i dào, sinh lý cao, sinh lý cao không c¥n phäi chæa tr¸ næa! ")
                      return
                end

                SetMissionData(sceneId,selfId,WUYI_SKILL_A,10000)
                      x990010_NotifyTip(  sceneId,selfId," Các hÕ h°i phøc nguyên khí thành công! ")
                return
          end

end

------**********************************
------ sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
------**********************************
function  x990010_AddMenPai(  sceneId,  selfId,  MenPaiId  )

if  GetMenPai(sceneId,selfId)  ~=  9  then
      x990010_NotifyTip(  sceneId,  selfId,  " Các hÕ ðã gia nh§p môn phái, các hÕ là ai...lão phu không biªt...các hÕ ði ra ðiiiiiiiiiiiii "  )
      return
end
if  MenPaiId  ==9  or  MenPaiId  <  0  or  MenPaiId  >  12  then
      return
end
if  GetLevel(sceneId,  selfId)  <  10  then
      x990010_NotifyTip(  sceneId,selfId,"T× c¤p 10 tr· lên m¾i có th¬ Gia Nh§p Môn Phái ")
      return
end
if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  3  then
      x990010_NotifyTip(  sceneId,selfId," Xin ch×a tr¯ng ô ðÕo cø, nguyên ít nh¤t 3 ch² ! ")
      return
end

	 LuaFnJoinMenpai(sceneId,  selfId,  1,  MenPaiId)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][1],10)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][2],1)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][3],1)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][4],10)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][5],10)
	 LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][6],1)
	 --LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][7],1)
	 --LuaFnSetXinFaLevel(sceneId,selfId,x990010_XinFaList[MenPaiId+1][8],1)

	 local	 nam	 =  LuaFnGetName(  sceneId,  selfId  )
	 BroadMsgByChatPipe(  sceneId,  selfId,  " #985 #G Chúc m×ng#cFF0000 ["..nam.."] #G gia nh§p thành công vào môn phái #cFF0000"..x990010_MenPaiName[MenPaiId+1].."#Gtoàn th¬ giang h° k¸ch li®t phän ð¯i! #411 ",  4  )	 	 
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  168,  0)
                SetMissionData(sceneId,selfId,MY_JIARUMENPAI,1)    --1 vì ðã gia nh§p môn phái phán ðoán tiªp l¶i 
	 SetMissionData(sceneId,selfId,MD_SHUANGXIANGPAO_LASTTIME,GetDayTime())    -- ghi chép gia nh§p môn phái nh§t kÏ 
                SetMissionData(sceneId,selfId,XIEZI_XINFA_SCORE,107)    -- thiªt trí m¾i b¡t ð¥u tâm pháp bình phân --20+6+6+30+30+6+8+1

	 -- môn phái tß·ng thß·ng tri®u t§p làm 
	 for  i=1,20  do
	         TryRecieveItem(sceneId,selfId,30501001,1)
	 end
                TryRecieveItem(sceneId,selfId,x990010_MenPaiShiZhuang[MenPaiId+1],1)    -- cho th¶i trang 
                x990010_NotifyTip(sceneId,selfId," chúc m×ng ngß½i gia nh§p "..x990010_MenPaiName[MenPaiId+1].." , nh§n ðßþc #{_ITEM"..x990010_MenPaiShiZhuang[MenPaiId+1].."}?#{_ITEM30501001}*20")
	 LuaFnSendSystemMail(  sceneId,  GetName(sceneId,selfId),  "        #W chúc m×ng Các hÕ ðã tr· thành #gfff0f0"..x990010_MenPaiName[MenPaiId+1].."#g000000#W ðích ð® tØ , Các hÕ có th¬ m²i ngày làm nhi®m vø , #gfff0f0 c¤p b§c b¤t ð°ng #g000000#W làm sß môn nhi®m vø th¶i ði¬m #gfff0f0 nhi«u l¥n kinh nghi®m tß·ng thß·ng s¯ l¥n cûng b¤t ð°ng #g000000#W nga ! còn có th¬ tìm #gfff0f0 LÕc Dß½ng #g000000#W d¸ch trÕm ch² ðích #gfff0f0 khâu ðßþc lÕc [232,319] giúp mµt tay ðßa tin #g000000#W , kiªm mµt chút ti«n linh hoa . Các hÕ cûng có th¬ t× LÕc Dß½ng bên trái ðích cØa thành ði ra ngoài , ðªn #gfff0f0 ðôn hoàng #g000000#W giªt trách luy®n c¤p , nªu nhß không biªt cø th¬ phß½ng v¸ , có th¬ tìm dß½ng vån nghi­m tß¾ng quân thü hÕ ðích v® binh höi thåm . "  )
        return
end
function x990010_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function  x990010_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
