-- chân v¯n s¯ 
x300108_g_scriptId  =  300108

x300108_g_EquipList={{n=4100,id=10414541},{n=4100,id=10415541},{n=4100,id=10421541},}

x300108_g_StoneList={{n=1,id=40004570,num=1,str=" hào hi®p chÑng minh "},}

x300108_g_week1  =  2
x300108_g_week2  =  4
x300108_g_hudongtime  ={80,82}  ------2 n½i này ð¸nh nghîa hoÕt ðµng b¡t ð¥u kªt thúc phÕm vi --------
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x300108_UpdateEventList(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 AddText(sceneId,"v¸ này anh hùng ,trong võ lâm träi qua nhi«u nåm mßa gió , cûng t§p ðßþc mµt thân häo võ ngh® , cu¯i cùng gây nên tÕi sao ? tñ ðß½ng dûng phó chiªn trß¶ng , thành l§p không ð¶i chiªn công ! #r        ngày trß¾c , liêu nß¾c ðÕi quân áp cänh , binh truân #G nhÕn cØa quan #W . khác có ðÕi liêu ðÕo tông hoàng ðª cùng ta thiên tØ bày ðánh cuµc , l¤y b¥y hi®p hµi vû th¡ng bÕi ð¸nh T¯ng Liêu chi tranh thành bÕi . còn ðây là tránh khöi chiªn h÷a tiêu yên cØ chï , ngß¶i trong võ lâm tñ ðß½ng thân phó sa trß¶ng , vì dân vì nß¾c . chï c¥n ðÕt t¾i #G80 c¤p #W tr· lên , ta li«n dçn ngß½i ði #G nhÕn cØa quan trß¾c tiªu #W ghi danh , tiªn vào cái này #G hai phe ðoàn ðµi ð¯i kháng #W ðích chiªn trß¶ng . ngß¶i th¡ng , nhßng b¸ #G kim giáp lß½ng câu #W , ngß¶i thua , cûng nhßng ngu d¯t vÕn dân sùng kính , vì anh hùng mà ðÑng loÕn thª . ")
                --AddText(sceneId,"#{SLDZ_100805_01}")
	 AddNumText(  sceneId,  x891002_g_scriptId,  "T¯ng Liêu ðÕi chiªn ghi danh ",6  ,1    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "Tiªn vào T¯ng Liêu chiªn trß¶ng ",6  ,2    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "Nh§n l¤y T¯ng Liêu ðÕi chiªn tß·ng thß·ng ",6  ,3    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  " T¯ng Liêu tích phân ð±i tß·ng thß·ng ",6  ,4    )
	 AddNumText(  sceneId,  x891002_g_scriptId,  "#GLøc bác trang b¸ ",6  ,5    )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x300108_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x300108_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x300108_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
if  GetNumText()  ==  5  then
	 BeginEvent(sceneId)
	 AddNumText(  sceneId,  x001154_g_ScriptId,  "#{SLDZ_100805_04}",  6,  4100  )
	 AddNumText(  sceneId,  x001154_g_ScriptId,  "Løc Bác trang b¸ thång c¤p ",  6,  200  )
	 AddNumText(  sceneId,  x001154_g_ScriptId,  "Løc Bác trang b¸ thång tinh ",  6,  300  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
        return
      end


if  GetNumText()  ==  200  then    -- Løc bác thång c¤p 
	 BeginUICommand(  sceneId  )
	 UICommand_AddInt(  sceneId,  selfId  )
                UICommand_AddInt(  sceneId,  9)
        	 UICommand_AddInt(  sceneId,  500000)--- c¥n ti«n 
	 UICommand_AddInt(  sceneId,  10000000)  -- trang b¸ b¡t ð¥u 
	 UICommand_AddInt(  sceneId,  19999999)    -- trang b¸ kªt thúc 
	 UICommand_AddInt(  sceneId,  20310174)    -- v§t ph¦m id
	 UICommand_AddString(sceneId,"#{SLDZ_100805_92}");
	 UICommand_AddString(sceneId,"#{SLDZ_100805_93}");
	 UICommand_AddString(sceneId,"#cfff263 xin/m¶i bö vào c¥n thång c¤p ðích Løc bác :");
	 UICommand_AddString(sceneId,"#cfff263 xin/m¶i bö vào long h°n ng÷c :");
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    21090722)
return
end


if  GetNumText()  ==  300  then    -- Løc bác thång tinh 
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
                UICommand_AddInt(  sceneId,7)
                EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  20090721)
return
end


if  GetNumText()  >  4000  and  GetNumText()  <  5000    then
      local  LiuBoQiHe  =  LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
      local  aaaaa=GetMissionData(sceneId,selfId,MD_CHESS_SONG)
      local  bbbbb=GetMissionData(sceneId,selfId,MD_CHESS_LIAO)
      local  DaojuNum  =  LuaFnGetPropertyBagSpace(sceneId,  selfId)
      if  LiuBoQiHe  <  1    then
            x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          ngß½i không có #G[ Løc bác kÏ hµp ]#W , tao nåm ! ! "  )
            return
      end
      if  DaojuNum  <  2  then
            x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          xin/m¶i ít nh¤t tr¯ng ði 2 cá tài li®u lan ! "  )
            return
      end
      if  aaaaa>1222225  or  bbbbb>1222225  then
            x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "ngài ðích #G[ Løc bác kÏ hµp ]#W , còn không có t§p mãn con c¶ , tiªp tøc c¯ g¡ng ði ~"  )
            return
      end
	 	 BeginEvent(sceneId)
	 	 	 local  nLevel  =  0
	 	 	 if  GetNumText()  ==  4100  then
	 	 	       --AddText(sceneId,  "#{HXYSJ_141031_178}")
	 	 	       AddText(sceneId,  "#cFF0000 c¥n t§p mãn #H[ Løc bác kÏ hµp ]#cFF0000, m¾i có th¬ ð±i trang b¸ ")
	 	 	 	 nLevel  =  1
	 	 	 end
	 
	 	 	 local  szStr  =  ""
	 	 	 AddText(sceneId,  szStr)	 
	 	 	 for  i,  item  in  x300108_g_EquipList  do
	 	 	 	 if  item.n  ==  GetNumText()    then
	 	 	 	 	 AddRadioItemBonus(  sceneId,  item.id,  3  )
	 	 	 	 end
	 	 	 end
        EndEvent(sceneId)
        DispatchMissionContinueInfo(sceneId,selfId,targetId,  x300108_g_ScriptId,  0)	 
end


if  GetNumText()  ==  3  then
-- sØa sang lÕi chu¦n b¸ h§u kÏ gia nh§p ð±i danh hi®u cùng cÞi ngña 
return
end

if  GetNumText()  ==  4  then
-- sØa sang lÕi chu¦n b¸ h§u kÏ gia nh§p ð±i danh hi®u cùng cÞi ngña 
return
end


if  GetNumText()  ==  1  then
local  mymissdata  =  GetMissionData(sceneId,  selfId,  MD_SONGLIAO_BAOMING)
local  nWeek  =  GetTodayWeek()
local  nToday  =  GetTime2Day()
local  begintime  =  x300108_g_hudongtime[1]
local  endtime  =  x300108_g_hudongtime[2]
local  nowtime    =  mod(GetQuarterTime(),100);

if  mymissdata  ==  nToday  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " ngài ðã báo quá tên "  )
return
end

if  GetLevel(sceneId,  selfId)  <  50  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " ngài c¤p b§c chßa ðü 50 c¤p không cách nào ghi danh "  )
return
end

if  nWeek  ~=  x300108_g_week1  and  nWeek  ~=  x300108_g_week2  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " hôm nay không có T¯ng Liêu ðÕi chiªn a , xin/m¶i · m²i tu¥n hai ? thÑ Løc bu±i t¯i 20:30 tìm ta ghi danh ! "  )
return
end

if  nowtime  <  begintime  or  nowtime  >  endtime  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " bây gi¶ không phäi là T¯ng Liêu th¶i gian , không cách nào ghi danh "  )
return
end

      local  aaaaa=GetMissionData(sceneId,selfId,MD_CHESS_SONG)
      local  bbbbb=GetMissionData(sceneId,selfId,MD_CHESS_LIAO)
      local  LiuBoQiHe  =  LuaFnGetAvailableItemCount(sceneId,selfId,40004570)
      local  TaskBagNum  =  LuaFnGetTaskItemBagSpace(sceneId,  selfId)

      if  TaskBagNum  <  10  then
            x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          xin/m¶i ít nh¤t tr¯ng ði 10 cá nhi®m vø lan ! "  )
            return
      end
      if  LiuBoQiHe  >  0    then
              if  aaaaa>=1222225  and  bbbbb>=1222225  then
                    x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          ngài trên ngß¶i có ðã t§p mãn ðích #G[ Løc bác kÏ hµp ]#W , m¶i dùng trß¾c nó #G ð±i Løc bác trang b¸ #W ! sau ðó s¨ t¾i tìm ta ghi danh ~"  )
                    return
            else
            SetMissionData(sceneId,selfId,MD_SONGLIAO_BAOMING,nToday)
                    x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "#G        chúc m×ng ngài , thành công ghi danh ! #r  #r        #W ngài ðích [ Løc bác kÏ hµp ] chßa t§p mãn , xin/m¶i ðón thêm næa l® . t§p mãn sau có th¬ tìm ta ð±i #G Løc bác trang b¸ #W mµt món . "  )
                    return
            end
        else
            SetMissionData(sceneId,selfId,MD_SONGLIAO_BAOMING,nToday)
            TryRecieveItem(  sceneId,  selfId,  40004570,  1)
            x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "#G        chúc m×ng ngài , thành công ghi danh ! #r  #r        #W chú ý tra xét nhi®m vø cüa ngài lan , ðÕt ðßþc #G[ Løc bác kÏ hµp ]#W mµt , · T¯ng Liêu ðÕi chiªn trung ðánh chªt ð¯i phß½ng NPC là ðßþc ðÕt ðßþc con c¶ , chú mãn kÏ hµp sau có th¬ tìm ta ð±i # Løc bác trang b¸ #W . "  )
            return
      end
end


if  GetNumText()  ==  2  then
if  GetLevel(sceneId,  selfId)  <  50  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " ngài c¤p b§c chßa ðü 50 c¤p xin không c¥n phi pháp tiªn vào "  )
return
end

local  isdaliaoornot  =  GetMissionData(sceneId,  selfId,  MD_SONGLIAO_BAOMING)
if  isdaliaoornot  ~=  GetTime2Day()  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " xin/m¶i ngài trß¾c ghi danh "  )
return
end

local  selfHasTeamFlag  =  LuaFnHasTeam(sceneId,  selfId);
if  selfHasTeamFlag  and  selfHasTeamFlag  ==  1  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " xin/m¶i trß¾c giäi tán ðµi ngû m¾i có th¬ ði vào "  )
return
end  
local  selfHasDRideFlag  =  LuaFnGetDRideFlag(sceneId,  selfId);
if  selfHasDRideFlag  and  selfHasDRideFlag  ==  1  then
x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " hai ngß¶i ng°i kÜ trÕng thái hÕ không cách nào tiªn vào "  )
return
end
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  95,  0)
NewWorld(  sceneId,  selfId,  550,random(28,32),random(28,32)  )

return
end

end



--  thanh tr× cänh tßþng bên trong ðích XX trách 
--**********************************
function  x300108_ClearMonsterByName(sceneId,  szName)
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  nMonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  GetName(sceneId,  nMonsterId)==  szName  then
	 	 	 LuaFnDeleteMonster(sceneId,  nMonsterId)
	 	 end
	 end
end
--**********************************
--  ki¬m tr¡c cänh tßþng bên trong ðích XX trách 
--**********************************
function  x300108_MonsterByName(sceneId,  szName)
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  nMonsterId  =  GetMonsterObjID(sceneId,i)
	 if  GetName(sceneId,  nMonsterId)==  szName  then
	 	 	 return  1
	 	 end
	 end
	 return  0
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x300108_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )

	 -- xØ lý ð« giao sau ðích bi¬u hi®n tình hu¯ng 
	 -- vì an toàn , n½i này phäi c¦n th§n , không th¬ ra l²i 
	 local  nItemIndex  =  -1
	 
	 for  i,  item  in  x300108_g_EquipList  do
	 	 if  item.id  ==  selectRadioId    then
	 	 	 nItemIndex  =  i
	 	 end
	 end
	 
	 if  nItemIndex  ==  -1    then
	 	 return
	 end
	 
	 --  nhìn xong nhà có phäi hay không ðü tài li®u ð« giao 
	 local  nLevel  =  0
	 if  x300108_g_EquipList[nItemIndex].n  ==  4100  then
	 	 nLevel  =  1
	 end

	 local  bStoneOk  =  0
	 if  GetItemCount(sceneId,  selfId,  x300108_g_StoneList[nLevel].id)  >=  x300108_g_StoneList[nLevel].num    then
	 	 bStoneOk  =  1
	 end
	 
	 if    bStoneOk  ==  0  then
                        x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          ngß½i không có #G[ Løc bác kÏ hµp ]#W , tao nåm ! ! "  )
	 	 return
	 end
                if  LuaFnGetPropertyBagSpace(sceneId,  selfId)  <  2  then
                      x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          xin/m¶i ít nh¤t tr¯ng ði 2 cá tài li®u lan ! "  )
                      return
                end
                if  GetMissionData(sceneId,selfId,MD_CHESS_SONG)<1222225  or  GetMissionData(sceneId,selfId,MD_CHESS_LIAO)<1222225  then
                      x300108_MsgBoxMane(  sceneId,  selfId,targetId,  "          ngài ðích #G[ Løc bác kÏ hµp ]#W , còn không có t§p mãn con c¶ , tiªp tøc c¯ g¡ng ði ~"  )
                      return
                end

	 --  ki¬m tra có phäi hay không có ð¥y ðü ðá có th¬ kh¤u tr× 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  x300108_g_StoneList[nLevel].id)  <  x300108_g_StoneList[nLevel].num      then
                      x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " ngß½i không có ð¥y ðü ð±i v§t ph¦m có th¬ b¸ kh¤u tr× , xin/m¶i ki¬m tra v§t ph¦m là hay không khóa lÕi . "  )
	 	 return
	 end

	 local  nItemBagIndexStone  =  GetBagPosByItemSn(sceneId,  selfId,  x300108_g_StoneList[nLevel].id)
	 local  szTransferStone  =  GetBagItemTransfer(sceneId,selfId,  nItemBagIndexStone)
	 
	 --  thü tiêu tß½ng quan ðá 
	 local  bDelOk  =  LuaFnDelAvailableItem(sceneId,selfId,  x300108_g_StoneList[nLevel].id,  x300108_g_StoneList[nLevel].num)
	 
	 if  bDelOk  <  1    then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " kh¤u tr× kÏ hµp th¤t bÕi . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
                                DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 else
                                TryRecieveItem(  sceneId,  selfId,  x300108_g_EquipList[nItemIndex].id-1+random(3),  1)
                                x300108_MsgBoxMane(  sceneId,  selfId,targetId,  " ð±i thành công . "  )	 	 	 
	 	 return
	 end

	 for  i,  findId  in  x300108_g_eventList  do
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
-- tin tÑc ð« kÏ 
--**********************************
function  x300108_MsgBox(  sceneId,  selfId,  str  )	 
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--**********************************
-- tin tÑc ð« kÏ 
--**********************************
function  x300108_MsgBoxMane(  sceneId,  selfId,targetId,  str  )	 
	 BeginEvent(sceneId)
	 AddText(sceneId,str)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end