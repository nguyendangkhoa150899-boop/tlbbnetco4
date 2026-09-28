
-- chân v¯n s¯ 
x900048_g_scriptId  =  900048
x900048_g_DanrenFB_ComboList=
{
[1]={text="#{DRFB_130111_212}",  tooltip="#{DRFB_130111_49}",rate=1,message="#{DRFB_130111_52}"},
[2]={text="#{DRFB_130111_213}",  tooltip="#{DRFB_130111_50}",rate=2,message="#{DRFB_130111_53}"},
[3]={text="#{DRFB_130111_214}",  tooltip="#{DRFB_130111_51}",rate=5,message="#{DRFB_130111_54}"},
[4]={text="#{DRFB_130111_220}",  tooltip="#{DRFB_130111_222}",rate=10,message="#{DRFB_130111_249}"},
[5]={text="#{DRFB_130111_221}",  tooltip="#{DRFB_130111_223}",rate=25,message="#{DRFB_130111_250}"},
}
x900048_g_srtxt  =  {"#{DRFB_130111_85}","#{DRFB_130111_84}","#{DRFB_130111_06}"}
x900048_g_duhuanbugo  =  "#{DRFB_130111_202}"
x900048_g_sceneIds  =  {

  {  NumText  =  100    ,  item  =  30311001,srtx=" c¥n 30 cái Bí T¸ch Tàn Trang ð¬ ð±i ",itemnum=30},
  {  NumText  =  100    ,  item  =  30311002,srtx="",itemnum=30},
  {  NumText  =  100    ,  item  =  30311003,srtx="",itemnum=30},
  {  NumText  =  100    ,  item  =  30311004,srtx="",itemnum=30},
  {  NumText  =  100    ,  item  =  30311005,srtx="",itemnum=30},
  {  NumText  =  101    ,  item  =  30311006,srtx=" c¥n 60 cái Bí T¸ch Tàn Trang ð¬ ð±i  ",itemnum=60  },
  {  NumText  =  101    ,  item  =  30311007,srtx="",itemnum=60  },
  {  NumText  =  101    ,  item  =  30311008,srtx="",itemnum=60  },
  {  NumText  =  101    ,  item  =  30311009,srtx="",itemnum=60  },
  {  NumText  =  101    ,  item  =  30311010,srtx="",itemnum=60  },
  {  NumText  =  102    ,  item  =  30311011,srtx=" c¥n 180 cái Bí T¸ch Tàn Trang ð¬ ð±i  ",itemnum=180  },
  {  NumText  =  102    ,  item  =  30311012,srtx="",itemnum=180  },
  {  NumText  =  102    ,  item  =  30311013,srtx="",itemnum=180  },
  {  NumText  =  103  ,  item  =  30311014,srtx=" c¥n 300 cái Bí T¸ch Tàn Trang ð¬ ð±i  ",itemnum=300},
  {  NumText  =  103  ,  item  =  30311015,srtx="",itemnum=300},
  {  NumText  =  103  ,  item  =  30311016,srtx="",itemnum=300},


}
x900048_g_suibian  =  38000529
function  x900048_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
--x900048_posidw  =  {[0]=1,[1]=2,[2]=3,[3]=4,[4]=4,[5]=5,[6]=5,[7]=5,[8]=6,[9]=6,[10]=7,[11]=7,[12]=8}
function  x900048_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 strText  =  "        Tiên nhân sáng chª chi võ công b¸ ngß¶i giang h° dñ vì võ h÷c t±ng cß½ng . l¥n này t¾i trß¾c LÕc Dß½ng hy v÷ng mßþn n½i ðây ðem võ h÷c trung nh¤t tinh di®u thâm thúy ch² truy«n cho m÷i ngß¶i . các v¸ giang h° hi®p sî nªu mu¯n ðÕt ðßþc trong ðó mµt hai . xu¯ng l¥n næa ðem dçn dçn các v¸ ði trß¾c #G hß không äo cänh #W l¤y h÷c t§p trong ðó chi #G võ h÷c nghîa lý #W"
	 	 AddText(sceneId,strText)
	 	 strText  =  x900048_g_srtxt[sceneId+1]
	 	 if  sceneId  >  2  then
	 	 strText  =  x900048_g_srtxt[random(1,3)]
	 	 end
	 	 --AddNumText(sceneId,x900048_g_scriptId," nh§n l¤y m²i ngày ngû hành pháp thiªp ",6,1127)
	 	 AddNumText(sceneId,x900048_g_scriptId," Ð±i Võ Lâm Bí T¸ch",6,2)
	 	 --AddNumText(sceneId,x900048_g_scriptId," tra xét v¯n chu hß không khiêu chiªn t¯t nh¤t ðµi ngû ",6,3)
	 	 --AddNumText(sceneId,x900048_g_scriptId," nh§n l¤y tu¥n trß¾c hß không khiêu chiªn vinh dñ tß·ng thß·ng ",6,4)
	 	 --AddNumText(sceneId,x900048_g_scriptId," xªp vào nåm tuy®t ",6,8)
                                AddNumText(sceneId,x900048_g_scriptId," Khiêu chiªn Hß Không Huy­n Cänh ",10,5)
                                AddNumText(sceneId,x900048_g_scriptId," liên quan t¾i hß không äo cänh ",11,6)
                                AddNumText(sceneId,x900048_g_scriptId," liên quan t¾i bí t¸ch ",11,7)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
	 
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x900048_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  GetNumText()  ==  1  then
	 x900048_MsgBox(  sceneId,  selfId,  targetId," chu¦n b¸ m· ra ")  
	   elseif  GetNumText()  ==  2  then
	 BeginEvent(sceneId)
	 	 strText  =  "#{DRFB_130111_197}"
	 	 AddText(sceneId,strText)
	 	 AddNumText(sceneId,x900048_g_scriptId," #ccccc66Ð±i S½ C¤p Bí T¸ch ",6,100)
	 	 AddNumText(sceneId,x900048_g_scriptId," #cffcc00Ð±i Hy Hæu Bí T¸ch ",6,101)
	 	 AddNumText(sceneId,x900048_g_scriptId," #cff6633Ð±i Truy«n Thª Bí T¸ch ",6,102)
	 	 AddNumText(sceneId,x900048_g_scriptId," #cFF0000Ð±i Tuy®t Thª Bí T¸ch ",6,103)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

	   
	 elseif  GetNumText()  ==  3  then
	 x900048_MsgBox(  sceneId,  selfId,  targetId," chu¦n b¸ m· ra ")
	 elseif  GetNumText()  ==  4  then
	 x900048_MsgBox(  sceneId,  selfId,  targetId," chu¦n b¸ m· ra ")
                elseif  GetNumText()  ==  5  then
	   local    itemnumaa  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  38000527)  +  LuaFnGetAvailableItemCount(sceneId,  selfId,  38000527)
	   local    TZtimes  =  mod(GetMissionData(  sceneId,  selfId,  WJMISS  ),100)
	   local    TZchensu  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  )
	   local    ItemUseNum  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANITEM  )
	   local    nowdata  =  GetDayTime()
	   local    missdata  =  floor(ItemUseNum/1000)
	   if  nowdata  ~=  missdata  then
	   SetMissionData(  sceneId,  selfId,  ZHOUTIANITEM,0  )
	   ItemUseNum  =  0
	   end
	   if  TZchensu  <  0  then
	   TZchensu  =  0
	   elseif  TZchensu  >  4  then
	   TZchensu  =  4
	   end
	   local  cennustimes  =  (x900048_g_DanrenFB_ComboList[TZchensu+1].rate  -  TZtimes)  +  25  -  mod(ItemUseNum,1000)
                  if  cennustimes  <  0  then
                  cennustimes  =  0
                  end
	             BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,TZchensu+1);-- bi¬u hi®n quái v§t m¤y hàng 
	             if  TZtimes  <  x900048_g_DanrenFB_ComboList[TZchensu+1].rate  then
	             UICommand_AddInt(sceneId,1)-- mi­n phí m· ra thÑ m¤y cá tß·ng thß·ng c¤p b§c   trø cµt tß·ng thß·ng , 2 l¥n tß·ng thß·ng …… chú ý l¾n nh¤t vì 5
	             else
	             UICommand_AddInt(sceneId,0)-- mi­n phí m· ra thÑ m¤y cá tß·ng thß·ng c¤p b§c   trø cµt tß·ng thß·ng , 2 l¥n tß·ng thß·ng …… chú ý l¾n nh¤t vì 5
	             end
	             UICommand_AddInt(sceneId,cennustimes)--cennustimes);-- có th¬ sØ døng ðích ngû hành pháp thiªp s¯ lßþng *10
	             UICommand_AddInt(sceneId,targetId);-- tiªp nh§n vø ðích NPC  ID
	             UICommand_AddInt(sceneId,(GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  )*5));--  ngài trß¾c m£t ðã thành công khiêu chiªn #G"..tostring(math.floor(g_DanrenFB_MaxBossKilled/5)).." t¥ng #cfff263
	             UICommand_AddInt(sceneId,((GetMissionData(  sceneId,  selfId,  ZHOUTIANCEN  )*5)+5));-- ðánh chªt tùy ý ð¯i thü lúc ð«u nhßng ðÕt ðßþc #G"..tostring(g_DanrenFB_LilianBase).." ði¬m #cfff263 võ h÷c tâm ð¡c . 
	             UICommand_AddInt(sceneId,itemnumaa)--);-- trong túi xách không thêm khóa ðích ngû hành pháp dán s¯ lßþng 
	             EndUICommand(sceneId)
	             DispatchUICommand(sceneId,selfId,20131117)--88990099--80800799--20130225
	   elseif  GetNumText()  ==  6  then
	   x900048_MsgBox(  sceneId,  selfId,  targetId,"#{DRFB_130111_23}")  
	   elseif  GetNumText()  ==  7  then
	   x900048_MsgBox(  sceneId,  selfId,  targetId,"#{WLMJ_130121_73}")  
	   elseif    GetNumText()  >=100  and  GetNumText()  <=103  then
	           BeginEvent(sceneId)
	 	 for  i,  eventId  in  x900048_g_sceneIds  do
                                if  GetNumText()==eventId.NumText  then
                                AddText(sceneId,eventId.srtx)
                                AddRadioItemBonus(  sceneId,  eventId.item,  4  )
                                EndEvent(sceneId)
                                DispatchMissionContinueInfo(sceneId,selfId,targetId,  88908,  0)
                                end
                                end
	   elseif  GetNumText()  ==  8  then
	   if  GetNumText()then
	   return
	   end
	   local  Menpaimis  =  {"#cFF0000( hi®n ph§t tông )","#cFF0000( hi®n khí tông )","#cFF0000( hi®n kiªm tông )","#cFF0000( hi®n ma tông )","#cFF0000( hi®n nho tông )"}
	   local  msiesejisd  =  ""
	   local  missionisdsall  =  GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE  )
	   local  wujeichongbai  =  floor(missionisdsall/1000000)
	   if  missionisdsall  ~=  0  then
	   msiesejisd  =  Menpaimis[wujeichongbai]
	   end
	 BeginEvent(sceneId)
	 	 strText  =  "#cFF0000 chú ý :#W h÷c t§p mµt loÕi tuy®t h÷c ý nghîa , buông tha cho ðã xªp vào ðích nåm tuy®t , m²i xªp vào nåm tuy®t mµt l¥n tiêu hao #cFF0000800#W ði¬m võ h÷c tâm ð¡c , ngài bây gi¶ võ h÷c tâm ð¡c vì #cFF0000"..GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE  ).."#W ði¬m "
	 	 AddText(sceneId,strText)
	 	 AddNumText(sceneId,x900048_g_scriptId," xªp vào ph§t tông "..msiesejisd.."",6,201)
	 	 AddNumText(sceneId,x900048_g_scriptId," xªp vào khí tông "..msiesejisd.."",6,202)
	 	 AddNumText(sceneId,x900048_g_scriptId," xªp vào kiªm tông "..msiesejisd.."",6,203)
	 	 AddNumText(sceneId,x900048_g_scriptId," xªp vào ma tông "..msiesejisd.."",6,204)
	 	 AddNumText(sceneId,x900048_g_scriptId," xªp vào nho tông "..msiesejisd.."",6,205)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
                elseif  GetNumText()  >=  201  and  GetNumText()  <=  205  then
                if  GetNumText()then
	 return
	 end
                local  Menpaimis  =  {" ph§t tông "," khí tông "," kiªm tông "," ma tông "," nho tông "}
                local  menpaistr  =  " không biªt "
                if  mod(GetNumText(),10)  >=  1  and  mod(GetNumText(),10)  <=  5  then
                menpaistr  =  Menpaimis[  mod(GetNumText(),10)]
                end
                if  missionisdsall  ~=  0  then
                if  GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE  )  <  800  then
                x900048_MsgBox(  sceneId,  selfId,  targetId," ngài bây gi¶ có ðßþc "..GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE  ).." ði¬m võ h÷c tâm ð¡c , chßa ðü 800 ði¬m tâm phäi không th¬ xªp vào nåm tuy®t "..menpaistr.."")  
                return
                end
                SetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE,GetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEXINDE  )-800  )
                end
                SetMissionData(  sceneId,  selfId,  ZHOUTIANWUXUEJUEXUE,mod(GetNumText(),10)*1000000)
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)
                for  i  =  850,897  do
                DelSkill(sceneId,  selfId,  i)
                end
                x900048_MsgBox(  sceneId,  selfId,  targetId," chúc m×ng ngß½i , hao t¯n 800 ði¬m võ h÷c tâm ð¡c , xªp vào li­u "..menpaistr.."")
                local  PlayerName  =  GetName(sceneId,selfId)
                AddGlobalCountNews(  sceneId,  "#{_INFOUSR"..PlayerName.."}#Y th§t anh hùng cûng , träi qua lµn mµt cái c¯ g¡ng hao t¯n 800 ði¬m võ h÷c tâm ð¡c , xªp vào li­u nåm tuy®t "..menpaistr.." môn hÕ "  )              
                end                

                                
end
--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x900048_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 -- xØ lý ð« giao sau ðích bi¬u hi®n tình hu¯ng 
	 -- vì an toàn , n½i này phäi c¦n th§n , không th¬ ra l²i 
	 local  nItemIndex  =  -1
	 	 for  i,  eventId  in  x900048_g_sceneIds  do
	 	 if  eventId.item  ==  selectRadioId    then
	 	 	 nItemIndex  =  i
	 	 end
	 end
	 if  nItemIndex  ==  -1    then
	 x900048_MsgBox(  sceneId,  selfId,targetId,"#{DRFB_130111_203}")
	 return
	 end
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,    x900048_g_suibian)  <  x900048_g_sceneIds[nItemIndex].itemnum  then
	 x900048_MsgBox(  sceneId,  selfId,targetId,x900048_g_duhuanbugo)
	 return
	 end
                if  LuaFnGetPropertyBagSpace(sceneId,  selfId)  <  1    then
	 x900048_MsgBox(  sceneId,  selfId,targetId,"#{DRFB_130111_205}")
	 return
	 end
	 LuaFnDelAvailableItem(sceneId,selfId,x900048_g_suibian,x900048_g_sceneIds[nItemIndex].itemnum)
	 local  geiitem  =  TryRecieveItem(  sceneId,  selfId,  selectRadioId,  1)
	 local  szTransferEquip  =  GetBagItemTransfer(  sceneId,  selfId,  geiitem  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)
                x900048_MsgBox(  sceneId,  selfId,  targetId," Chúc m×ng các hÕ ðã ð±i ðßþc thành công mµt quy¬n [#{_ITEM"..selectRadioId.."}]")
                local  PlayerName  =  GetName(sceneId,selfId)
                local  MosterName  =  GetName(sceneId,targetId)
                AddGlobalCountNews(  sceneId,  "#{_INFOUSR"..PlayerName.."}#Y r¤t cung kính dâng lên cho ÐÕi Sß #G["..MosterName.."]#Y #R"..x900048_g_sceneIds[nItemIndex].itemnum.."#Y cái [#{_ITEM"..x900048_g_suibian.."}], ÐÕi Sß #G["..MosterName.."]#Y ch¤p nh§n ban t£ng cho#{_INFOUSR"..PlayerName.."} mµt quy¬n Bí T¸ch #ef12345#Y#{_INFOMSG"..szTransferEquip.."} "  )              
end
	 
function  x900048_MsgBox(  sceneId,  selfId,targetId,txt)
	 	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  txt  )	 	 
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )

end	 	 
