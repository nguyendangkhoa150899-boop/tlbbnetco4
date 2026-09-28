-- trói ð¸nh hoa loÕi 30505260
-- không trói ð¸nh hoa loÕi 30505268-- cái này bö hoang r½i , chân v¯n không nh¢m vào h¡n 
-- hoa phì 30505261

-- xích sa ? hÕt   QQ-718805400
-- ÐÕi Lý a trong loÕi hoa nhi®m vø 
x002100_g_ScriptId	 =  002100
--************************************************************************
-- sñ ki®n li®t bi¬u 
--************************************************************************
function  x002100_OnDefaultEvent(  sceneId,  selfId,  targetId  )
  
	         BeginEvent(  sceneId  )
	 	     AddText(  sceneId,  "#{SDJZH_091106_05}")
	 	     AddNumText(  sceneId,  x002100_g_ScriptId,  " Nh§n L¤y HÕt Gi¯ng ",6,10  )
	 	   -- AddNumText(  sceneId,  x002100_g_ScriptId,  "Nhi®m vø hoa ",6,99  )
	 	    -- AddNumText(  sceneId,  x002100_g_ScriptId,  " liên quan t¾i loÕi hoa ",11,15  )	 	   
	         EndEvent(  sceneId  )
	         DispatchEventList(  sceneId,  selfId,  targetId  )
        
end

--**************************************************************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**************************************************************************
function  x002100_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	     local	 key	 =  GetNumText()

	     if  key  ==  10  then
  	 
	           local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )	     
	           if  FreeSpace  <  4    then
	                 x002100_MsgBox(sceneId,  selfId,targetId,"        Xin hãy ch×a tr¯ng 4 ô ðÕo cø "  )
	                 return
	           end
	 	     
	           local  level  =  GetLevel(  sceneId,  selfId  )
	           if  level  <  104  then
	                 x002100_MsgBox(sceneId,  selfId,targetId,"        C¤p b§c cüa ngß½i chßa ðü 105 c¤p không cách nào nh§n l¤y nhi®m vø hoa "  )
	 	 return
	           end

	           local  td  =  GetTime2Day()
	           local  lt  =  GetMissionData(sceneId,selfId,MD_ZHONGHUA_TIME)
	           if  td  ==  lt  then  
	                 x002100_MsgBox(sceneId,  selfId,targetId,"        M²i ngày chï có th¬ nh§n l¤y nhi®m vø hoa mµt l¥n , mu¯n ðÕt ðßþc nhi«u hÕt gi¯ng , hãy làm mµt cái #G Nhi®m vø hoa #W ði! "  )
	 	 return
	           end

                          for  i  =  1,3  do    -- ðÕt ðßþc 3 viên hoa loÕi 
                                  TryRecieveItem(  sceneId,  selfId,  30505260,  1)    
                          end
                          for  i  =  1,10  do  -- ðÕt ðßþc 10 cá hoa phì 
                                  TryRecieveItem(  sceneId,  selfId,  30505261,  1)    
                          end
                                  LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)    -- t¾i cá huy­n kh¯c ð£c hi®u 
	                   SetMissionData(sceneId,selfId,MD_ZHONGHUA_TIME,td)
	                 x002100_MsgBox(sceneId,  selfId,targetId," chúc m×ng ngß½i ðÕt ðßþc ba viên hoa tß½i ðích m¥m móng cùng 10 cá hoa phì "  )
	         local  playerName  =  GetName(sceneId,selfId)
        	         local  strText  =  format("#G#{_INFOUSR%s}#W ðang #c00ffff ÐÕi Lý [185,65]#cff99ff a trong #W ch² höi thåm loÕi hoa ðích kinh nghi®m , a trong lÕi khÆng khái ðích ðßa cho h¡n ba viên #G hoa tß½i ðích m¥m móng ! ",playerName  )  
	         BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end


	 if  key  ==  99  then
	 local  PlayerName  =  GetName(  sceneId,  selfId  )
	 local  PlayerSex  =  GetSex(  sceneId,  selfId  )

	 if  PlayerSex  ==  0  then
	 	 PlayerSex  =  " cô nß½ng "
	 else
	 	 PlayerSex  =  " thiªu hi®p "
	 end

	 BeginEvent(sceneId)
	 AddText(  sceneId,  "        #P"..PlayerName..PlayerSex..":#G  ngß½i mÕnh khöe ! · ch² này cüa ta nhßng ngçu nhiên nh§n l¤y mµt loÕi nhi®m vø , nh§n l¤y nhi®m vø sau , theo nhß ð« kÏ hoàn thành r°i ðªn ta ch² này trä lÕi nhi®m vø là ðßþc . "  )
	 AddNumText(  sceneId,  x002100_g_ScriptId,  "Bách hoa duyªn ",  3,  501)
                if  IsHaveMission(sceneId,selfId,1450)  >  0  or  IsHaveMission(sceneId,selfId,1451)  >  0  or  IsHaveMission(sceneId,selfId,1452)  >  0
                      or  IsHaveMission(sceneId,selfId,1453)  >  0  or  IsHaveMission(sceneId,selfId,1454)  >  0  or  IsHaveMission(sceneId,selfId,1455)  >  0  then
	             AddNumText(  sceneId,  x002100_g_ScriptId,  " hüy bö nh§n l¤y ðích nhi®m vø ",  6,  513  )
                end
                AddNumText(  sceneId,  x002100_g_ScriptId,  " liên quan t¾i hoa loÕi nhi®m vø ",  11,  512)
                AddNumText(  sceneId,  x002100_g_ScriptId,  " r¶i ði ……",  9,  500  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
              end


          if  nNumText==500    then
	 --  t¡t cØa s± 
                BeginUICommand(sceneId)
                EndUICommand(sceneId)
                DispatchUICommand(sceneId,selfId,  1000)
                return
            end


if  key==512    then
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "#Y liên quan t¾i loÕi hoa ")
                AddText(  sceneId,  "        ngß¶i Ba Tß yêu hoa , tña nhß ÐÕi Lý nhân ái hoa mµt dÕng , chúng ta l¥n này mang ðªn không ít Ba Tß ðích hoa loÕi , có #Y Ba Tß hoa h°ng #W ðích m¥m móng , cûng có #Y Ba Tß cúc #W cùng #Y Ba Tß lan #W ðích m¥m móng , ta m²i ngày s¨ cho t¾i ch² cüa ta ðích ngß¶i tình nguy®n phát mµt m¥m móng , hy v÷ng có th¬ · n½i này phiªn trên ð¤t b°i døc ra #Y Ba Tß hoa h°ng #W ðích sän ph¦m m¾i loÕi . ")
	 	 AddText(  sceneId,  "        bÕn t¯t cüa ta #R ba ð¡p trong #W là mµt tinh minh hoa thß½ng , #Y Ba Tß hoa h°ng #W · Ba Tß là #G ðáng giá ti«n nh¤t ðích hoa #W li­u , nªu nhß ngß½i tr°ng ra t¾i hoa là #Y Ba Tß hoa h°ng #W, nhß v§y ngß½i có th¬ ði tìm h¡n , h¡n s¨ cho ngß½i #G phong phú tß·ng thß·ng . ")
	 	 AddText(  sceneId,  "        v« ph¥n có th¬ tr°ng ra hoa gì , ta · g·i m¥m móng ðích th¶i ði¬m không th¬ nói cho ngß½i biªt , làm mµt loÕi hoa ngß¶i , ta h½n quan tâm ngß½i loÕi hoa ðích quá trình , ta tin tß·ng , chï c¥n ngß½i døng tâm loÕi hoa , ngß½i có th¬ ðßþc ðªn so n· hoa kªt quä thu hoÕch l¾n h½n . ")
	 	 AddText(  sceneId,  "        chï có · #G ÐÕi Lý ðông ðß¶ng cái cùng tây ðß¶ng cái có th¬ tr°ng tr÷t hoa tß½i #W , truy«n t¯ng ði¬m phø c§n phäi không có th¬ tr°ng tr÷t ðích . ")
	 	 AddText(  sceneId,  "        loÕi hoa c¥n #G thi m§p #W , #G cây gi¯ng thi m§p 3 l¥n #W là ðßþc l¾n lên vì #G thành thøc hoa tß½i , #W nhßng là #G m²i ngß¶i chï có th¬ ð¯i v¾i cùng cá cây gi¯ng thi m§p mµt l¥n , #W t§n lñc g÷i càng nhi«u h½n b¢ng hæu t¾i thi m§p ði . ")
	 	 AddText(  sceneId,  "        #G thi m§p #W có th¬ có ðßþc #G ðÕi lßþng kinh nghi®m #W, mà #G hái hoa tß½i #W có th¬ l¤y ðßþc #Y Ba Tß hoa h°ng #W nga , #Y Ba Tß hoa h°ng #W có th¬ ð±i #Y trân thú : Hoa tiên tØ ? trân thú : th¥n xí nga ? ði®p yêu hoa cùng khôi l²i lang #W . cho dù ngß½i không có ðßþc #Y Ba Tß hoa h°ng #W, cûng có th¬ ðßþc kÏ tha mµt ít r¤t ðáng ti«n ðích hoa tß½i . ")
	 	 AddText(  sceneId,  "        #G hoa tß½i thành thøc sau có 3 phút là chï có tr°ng tr÷t nên hoa tß½i ngß¶i cüa m¾i có th¬ hái ðích , qua trong khoäng th¶i gian này , t¤t cä m÷i ngß¶i có th¬ hái li­u . ")
	 	 AddText(  sceneId,  "        vô lu§n là hoa tß½i ðích cây gi¯ng còn là thành thøc hoa tß½i , nªu nhß không có ngß¶i #G thi m§p #W, ho£c là #G hái #W,#G30 phút sau s¨ tñ ðµng biªn m¤t #W . ")
	 	 AddText(  sceneId,  "        nªu nhß ngß½i nghî l¤y ðßþc #G càng nhi«u h½n hoa phì cùng m¥m móng #W, có th¬ giúp ta làm mµt ít nhi®m vø , hoàn thành nh¤t ð¸nh hoàn ðªm , ta s¨ cho ngß½i #G ngÕch ngoÕi ðích m¥m móng #W , ngoài ra , m²i hoàn thành mµt vòng , ta s¨ cho ngß½i mµt ít #G hoa phì #W . ")
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
end

if  key==513    then
      for  i  =  1450,1455  do
              DelMission(  sceneId,  selfId,  i  )
      end
      SetMissionData(sceneId,selfId,MD_XIANHUAZHONGZI,LuaFnGetCurrentTime()+900)
      BeginEvent(sceneId)	       
	 AddText(sceneId,"  #gFF83FA nhi®m vø cüa ngß½i ðã thü tiêu thành công ! ")
      EndEvent(sceneId)        -- phú tr¸ giá kªt thúc 
      DispatchEventList(  sceneId,  selfId,  targetId  )
      return
end

    if  key==501    then
      if  GetMissionData(sceneId,selfId,MD_XIANHUAZHONGZI)  >  LuaFnGetCurrentTime()  then  
            BeginEvent(sceneId)	       
	   AddText(sceneId,"    ngß½i m¾i v×a bö qua nhi®m vø , c¥n #G"..GetMissionData(sceneId,selfId,MD_XIANHUAZHONGZI)-LuaFnGetCurrentTime().."#W giây sau m¾i có th¬ l¥n næa ch£n l¤y bách hoa duyªn nhi®m vø . ")
            EndEvent(sceneId)        -- phú tr¸ giá kªt thúc 
            DispatchEventList(  sceneId,  selfId,  targetId  )
          return
      end
	 local  PlayerLevel    =  GetLevel(sceneId,  selfId)
                local  PlayerName  =  GetName(  sceneId,  selfId  )
	 local  PlayerSex  =  GetSex(  sceneId,  selfId  )
                if  PlayerSex  ==  0  then
	 	 PlayerSex  =  " cô nß½ng "
	 else
	 	 PlayerSex  =  " thiªu hi®p "
	 end
	 if  PlayerLevel  <  105  then
	 	 BeginEvent(sceneId)
                        AddText(  sceneId,  "        #R"..PlayerName..PlayerSex..":"  )
	         AddText(  sceneId,  "        #G ngß½i c¤p b§c không t¾i 105 c¤p , 20 c¤p sau m¾i có th¬ nh§n l¤y loÕi hoa nhi®m vø ! #r#Y        nhanh ði thång c¤p sau tr· lÕi ði . "  )
	         EndEvent(sceneId)
	         DispatchEventList(sceneId,selfId,targetId)
	           return
	 end
	 local ymd = GetTime2Day();
		local dayCount = 0;			
		dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME);
		if mod(dayCount, 10) >= 5 and ymd == floor(dayCount/10) then
			x002100_MsgBox(sceneId, selfId, targetId, "M²i ngày chï nhân 5 l¥n NV");
			return									
		end
	 
	          
          --******************************** phán ðoán có hay không ðã có nhi®m vø 
	 if    IsHaveMission(sceneId,selfId,x002117_g_MissionId)  >  0    or  IsHaveMission(sceneId,selfId,x002091_g_MissionId)  >  0    or  IsHaveMission(sceneId,selfId,x002106_g_MissionId)  >  0    or  IsHaveMission(sceneId,selfId,x002107_g_MissionId)  >  0    or  IsHaveMission(sceneId,selfId,x002108_g_MissionId)  >  0    or  IsHaveMission(sceneId,selfId,x002109_g_MissionId)  >  0    then
	 -- nªu nhß ðã nh§n này nhi®m vø   
              	 if  IsHaveMission(sceneId,selfId,x002117_g_MissionId)  >  0  then
	 	 	 -- g·i nhi®m vø nhu c¥u ðích tin tÑc 
	 	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,x002117_g_MissionName)
	 	 	 AddText(sceneId,x002117_g_MissionContinue)
	 	 	 for  i,  item  in  x002117_g_DemandItem  do
	 	 	 	 AddItemDemand(  sceneId,  item.id,  item.num  )
	 	 	 end
	 	 	 AddMoneyBonus(  sceneId,  x002117_g_MoneyBonus  )
	 	 	 local dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME); 
			if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
			end
			SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, dayCount+1);
			 EndEvent(  )
	 	 	 bDone  =  x002117_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x002117_g_ScriptId,x002117_g_MissionId,bDone)
	 	 end	 
	 	 if    IsHaveMission(sceneId,selfId,x002091_g_MissionId)  >  0  then
	 	         BeginEvent(sceneId)
	 	 	 AddText(sceneId,x002091_g_MissionName)
	 	 	 AddText(sceneId,x002091_g_MissionContinue)
	 	 	 for  i,  item  in  x002091_g_DemandItem  do
	 	 	 	 AddItemDemand(  sceneId,  item.id,  item.num  )
	 	 	 end
	 	 	 AddMoneyBonus(  sceneId,  x002091_g_MoneyBonus  )
	 	 	 local dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME); 
			if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
			end
			SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, dayCount+1);
			 EndEvent(  )
	 	 	 bDone  =  x002091_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x002091_g_ScriptId,x002091_g_MissionId,bDone)
	 	 end
	 	 if    IsHaveMission(sceneId,selfId,x002106_g_MissionId)  >  0  then
	 	         BeginEvent(sceneId)
	 	 	 AddText(sceneId,x002106_g_MissionName)
	 	 	 AddText(sceneId,x002106_g_MissionContinue)
	 	 	 for  i,  item  in  x002106_g_DemandItem  do
	 	 	 	 AddItemDemand(  sceneId,  item.id,  item.num  )
	 	 	 end
	 	 	 AddMoneyBonus(  sceneId,  x002106_g_MoneyBonus  )
	 	 	 local dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME); 
			if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
			end
			SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, dayCount+1);
			 EndEvent(  )
	 	 	 bDone  =  x002106_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x002106_g_ScriptId,x002106_g_MissionId,bDone)
	 	 end	 
	 	 if    IsHaveMission(sceneId,selfId,x002107_g_MissionId)  >  0  then
	 	         BeginEvent(sceneId)
	 	 	 AddText(sceneId,x002107_g_MissionName)
	 	 	 AddText(sceneId,x002107_g_MissionContinue)
	 	 	 for  i,  item  in  x002107_g_DemandItem  do
	 	 	 	 AddItemDemand(  sceneId,  item.id,  item.num  )
	 	 	 end
	 	 	 AddMoneyBonus(  sceneId,  x002107_g_MoneyBonus  )
	 	 	 local dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME); 
			if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
			end
			SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, dayCount+1);
			 EndEvent(  )
	 	 	 bDone  =  x002107_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x002107_g_ScriptId,x002107_g_MissionId,bDone)
	 	 end	 
	 	 if    IsHaveMission(sceneId,selfId,x002108_g_MissionId)  >  0  then
	 	         BeginEvent(sceneId)
	 	 	 AddText(sceneId,x002108_g_MissionName)
	 	 	 AddText(sceneId,x002108_g_MissionContinue)
	 	 	 for  i,  item  in  x002108_g_DemandItem  do
	 	 	 	 AddItemDemand(  sceneId,  item.id,  item.num  )
	 	 	 end
	 	 	 AddMoneyBonus(  sceneId,  x002108_g_MoneyBonus  )
	 	 	 local dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME); 
			if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
			end
			SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, dayCount+1);
			 EndEvent(  )
	 	 	 bDone  =  x002108_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x002108_g_ScriptId,x002108_g_MissionId,bDone)
	 	 end	 
	 	 if    IsHaveMission(sceneId,selfId,x002109_g_MissionId)  >  0  then
                                          local  strText  =  format("        #P ngß½i th¤y mu¯n bái phöng danh nhân sao ?           #r#Y ngß½i có th¬ ði¬m kích Alt+Q tra xét nhi®m vø møc tiêu . ")
	 	         BeginEvent(sceneId)
	 	 	 AddText(sceneId,x002109_g_MissionName)
                                                  AddText(sceneId,  strText)
	 	 	 AddMoneyBonus(  sceneId,  x002109_g_MoneyBonus  )
	 	 	local dayCount = GetMissionData(sceneId, selfId, MD_DRAWPAY_TIME); 
			if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
			end
			SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, dayCount+1);
			 EndEvent(  )
	 	 	 bDone  =  x002109_CheckSubmit(  sceneId,  selfId  )
	 	 	 DispatchMissionDemandInfo(sceneId,selfId,targetId,x002109_g_ScriptId,x002109_g_MissionId,bDone)
	 	 end
	 	 -- thöa mãn nhi®m vø tiªp thu ði«u ki®n 
	 else  
	 	 odds  =  random(  60000  )
                if  odds>=0  and  odds<=10000  then
                  nRet_rw=1
                elseif  odds>=10001  and  odds<=20000    then
                  nRet_rw=2
                elseif  odds>=20001  and  odds<=30000    then
                  nRet_rw=3
                elseif  odds>=30001  and  odds<=40000    then
                  nRet_rw=4
                elseif  odds>=40001  and  odds<=50000    then
                  nRet_rw=5
                elseif  odds>=50001  and  odds<=60000    then
                  nRet_rw=6
                end
          --********************************************
	           if  nRet_rw==1  then  
	           x002100_MY_ZH=002091
	           elseif  nRet_rw==2  then
	           x002100_MY_ZH=002117
	           elseif  nRet_rw==3  then
	           x002100_MY_ZH=002106
	           elseif  nRet_rw==4  then
	           x002100_MY_ZH=002107
	           elseif  nRet_rw==5  then
	           x002100_MY_ZH=002108
	           elseif  nRet_rw==6  then
	           x002100_MY_ZH=002109
                  end
	           CallScriptFunction(  x002100_MY_ZH,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
			   --SetMissionData(sceneId,selfId,MD_DRAWPAY_TIME,td)
			   
	           return
	 	 	 
        end	 --**********************************                      
    end


                if  key  ==  15  then
	 BeginEvent(  sceneId  )
	 	     AddText(  sceneId,  "        ÐÕi Lý là mµt xinh ð©p ð¸a phß½ng , b¯n mùa nhß xuân . ð¯i v¾i mµt loÕi hoa ngß¶i ðªn nói , n½i này chính là mµt cái thiên ðß¶ng . ta nåm nay mang ðªn mµt ít Tây Vñc ðích hoa loÕi , hy v÷ng · n½i này xinh ð©p thành ph¯ cûng có th¬ r½i xu¯ng ð¤t näy m¥m , nhßng c¥n mµt ít yêu hoa ngß¶i cüa t¾i b°i døc . chï c¥n ngß½i c¤p b§c thöa mãn 20 c¤p , li«n có th¬ · #Y tr¥m ng§m hß½ng #W cô nß½ng n½i ðó lînh nhi®m vø li­u . ")
                                    AddText(  sceneId,  "        loÕi hoa nhi®m vø t±ng cµng 6 loÕi , lînh nhi®m vø lúc ðem ngçu nhiên l¤y ðßþc mµt loÕi nhi®m vø , theo nhß nhi®m vø ð« kÏ sau khi hoàn thành , r°i ðªn #Y tr¥m ng§m hß½ng #W n½i ðó trä lÕi nhi®m vø , là ðßþc l¤y ðßþc hoa loÕi cùng hoa phì cùng v¾i kinh nghi®m cùng kim ti«n , cûng l¤y ðßþc v§t ph¦m tß·ng thß·ng . ")
                                    AddText(  sceneId,  "        l¤y ðßþc hoa loÕi nhßng · ÐÕi Lý ðông ðß¶ng cái phø c§n tr°ng tr÷t , dùng l¤y ðßþc hoa phì thi m§p li«n có th¬ hoàn thành loÕi lo?i hoa­u . ")	 	     	 	   
	         EndEvent(  sceneId  )
	         DispatchEventList(  sceneId,  selfId,  targetId  )	 
	 end
	 	 
end	 

--**************************************************************************
-- ð¯i thoÕi 
--**************************************************************************

function  x002100_MsgBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end



--**********************************
--print(nRet_rw)
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************

function  x002100_OnMissionAccept(  sceneId,  selfId,  targetId,  x002100_MY_ZH  )
	 
	 	 	 
	 	 	 local  ret1  =  CallScriptFunction(  x002100_MY_ZH,  "CheckAccept",  sceneId,  selfId,  targetId  )
	 	 	 if  ret1  >  0  then
	 	 	 	 CallScriptFunction(  x002100_MY_ZH,  "OnAccept",  sceneId,  selfId,  targetId,  x002100_MY_ZH  )  -- nhi®m vø chân v¯n ID , cänh tßþng ID , nhà ch½i vai trò ID , møc tiêu ID
	 	 	 end
	 	 	 return
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x002100_OnMissionRefuse(  sceneId,  selfId,  targetId,  x002100_MY_ZH  )
	 	 	 x002100_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x002100_OnMissionContinue(  sceneId,  selfId,  targetId,  x002100_MY_ZH  )

	 	 	 CallScriptFunction(  x002100_MY_ZH,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x002100_OnMissionSubmit(  sceneId,  selfId,  targetId,  x002100_MY_ZH,  selectRadioId  )
	 
	 	 	 CallScriptFunction(  x002100_MY_ZH,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 

end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x002100_OnDie(  sceneId,  selfId,  killerId  )
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x002100_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end