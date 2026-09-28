-- ÐÕi Lý NPC
-- chúc giàu sang 
-- Nhi®m vø Ti«n Lß½ng 
x002102_g_scriptId  =  002102
x002102_g_Type  =  {" s½ c¤p "," trung c¤p "," cao c¤p "}  
x002102_g_ChongLou  =  {10553106,10553108,10553110,10553112,10553113,10553114}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x002102_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,"#{GZRW_090715_01}")
	 	 AddText(sceneId,"        #cFF0000 chú ý : Nhi®m vø Ti«n Lß½ng nh¤t ð¸nh phäi nh§n l¤y nhi®m vø sau m¾i có th¬ có hi®u lñc ! ")
	 	 AddNumText(  sceneId,  x002102_g_ScriptId,  " Nh§n l¤y Nhi®m vø Ti«n Lß½ng ",6,1)
	 	 AddNumText(  sceneId,  x002102_g_ScriptId,  " Ki¬m tra tiªn ðµ Nhi®m vø Ti«n Lß½ng ",6,2)
	 	 AddNumText(  sceneId,  x002102_g_ScriptId,  " Nh§n lînh Ti«n Lß½ng ",6,3)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x002102_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)
      local  CiftEquip  =  -1
      local  type  =  1
      local  myLevel  =  GetLevel(sceneId,  selfId)
      local  nWeekCur  =  mod(GetWeekTime(),10)  -- trß¾c m£t thÑ m¤y chu 
      if  myLevel  >=  80  and  myLevel  <  90  then
            type  =  2
      elseif  myLevel  >=  90  then
            type  =  3
      end


	 if  GetNumText()  ==  1  then
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  >=  1  and  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ~=  nWeekCur  then
                            SetMissionData(sceneId,selfId,GONGZI_1,0)
                            SetMissionData(sceneId,selfId,GONGZI_2,0)
                      end
                      if  myLevel  <  35  then
                            x002102_Notify(  sceneId,  selfId,"        C¤p b§c cüa các hÕ th¤p h½n c¤p ðµ 35  , không th¬ nh§n l¤y Nhi®m vø Ti«n Lß½ng ")
                            return
                      end
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  >=  1  then
                              x002102_Notify(  sceneId,  selfId,"        Các hÕ ðã nh§n l¤y Nhi®m vø Ti«n Lß½ng hôm nay r°i ")
                            return
                      end
                      SetMissionData(sceneId,selfId,GONGZI_1,type*10^8)
                      SetMissionData(sceneId,selfId,GONGZI_2,nWeekCur*10^8)
                      x002102_Notify(  sceneId,  selfId,"        Nh§n l¤y #G"..x002102_g_Type[type].."#W Nhi®m vø Ti«n Lß½ng thành công ! ")
	       BeginUICommand(  sceneId  )
	       UICommand_AddInt(  sceneId,  selfId  )-- cái này không có gì dùng 
	       UICommand_AddInt(  sceneId,  GetMissionData(sceneId,selfId,GONGZI_1)  )  -- m· ð¥u con s¯ thÑ nh¤t kh¯ng chª ti«n lß½ng c¤p b§c 123
	       UICommand_AddInt(  sceneId,  mod(GetMissionData(sceneId,selfId,GONGZI_2),10^8)  )  --
	       UICommand_AddInt(  sceneId,  0  )-- cái này kh¯ng chª Nhi®m vø Ti«n Lß½ng bän m¾i cñu bän 1 là bän m¾i , nhæng khác cñu bän 
	       EndUICommand(  sceneId  )
	       DispatchUICommand(  sceneId,  selfId,    20120517)

        elseif  GetNumText()  ==  2  then
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  >=  1  and  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ~=  nWeekCur  then
                            SetMissionData(sceneId,selfId,GONGZI_1,0)
                            SetMissionData(sceneId,selfId,GONGZI_2,0)
                      end
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  <  1  then
                              x002102_Notify(  sceneId,  selfId,"        các hÕ chßa nh§n l¤y Nhi®m vø Ti«n Lß½ng hôm nay")
                            return
                      end

                      local  xiezi1  =  GetMissionData(sceneId,selfId,GONGZI_1)
                      local  xiezi2  =  mod(GetMissionData(sceneId,selfId,GONGZI_2),10^8)    -- trß¾c hai v¸ dùng cho ghi chép thÑ m¤y chu 

	     BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )-- cái này không có gì dùng 
	     UICommand_AddInt(  sceneId,  xiezi1  )  -- m· ð¥u con s¯ thÑ nh¤t kh¯ng chª ti«n lß½ng c¤p b§c 123
	     UICommand_AddInt(  sceneId,  xiezi2  )  --
	     UICommand_AddInt(  sceneId,  0  )-- cái này kh¯ng chª Nhi®m vø Ti«n Lß½ng bän m¾i cñu bän 1 là bän m¾i , nhæng khác cñu bän 
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    20120517)

        elseif  GetNumText()  ==  3  then
                      local  jiance1  =  GetMissionData(sceneId,selfId,GONGZI_1)
                      local  jiance2  =  mod(GetMissionData(sceneId,selfId,GONGZI_2),10^8)

                      if    floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  <  1  or  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ~=  nWeekCur  then
                            x002102_Notify(  sceneId,  selfId,"        các hÕ chßa nh§n l¤y Nhi®m vø Ti«n Lß½ng hôm nay ")
                            return
                      end

                      if  jiance1  ==  110400202  and  jiance2  ==  3030204  then
	             if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <1  then
	                   x895111_NotifyTips(  sceneId,  selfId,  " ô ðÕo cø c¥n ch×a 1 ch² tr¯ng "  )	 
	                   return
	             end
                            local  GiveMy  =  5000
                            YuanBao(sceneId,selfId,-1,1,  GiveMy  )
                            SetMissionData(sceneId,selfId,GONGZI_1,0)
                            SetMissionData(sceneId,selfId,GONGZI_2,0)
                            CiftEquip  =  random(10000)
                            x002102_Notify(  sceneId,  selfId,"        Nh§n l¤y ti«n lß½ng thành công , chúc m×ng các hÕ ðÕt ðßþc #G"..GiveMy.." nguyên bäo #W cüa ti«n lß½ng .   ")
                            if  CiftEquip  >=  10001  then
                                  local  pos  =  TryRecieveItem(  sceneId,  selfId,  ChongLou[random(1,6)],  1  )
                                  local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)
	 	   local  strText  =  format("#cFF0000 tin tÑc t¯t : #Y nhà ch½i ".."#{_INFOUSR%s}#Y ðang hoàn thành mµt tu¥n Nhi®m vø Ti«n Lß½ng sau này , m®t möi ðích v×a ngã vào ÐÕi Lý #G chúc giàu sang #{_INFOAIM146,120,2, chúc giàu sang } trß¾c m£t , ðÑng d§y lúc ngoài ý mu¯n phát hi®n trong túi nhi«u mµt món #{_INFOMSG%s} , không khöi h°i hµp ~",GetName(sceneId,selfId),transfer)
                                  BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);
                            end

                    elseif  jiance1  ==  204400202  and  jiance2  ==  3020304  then
	             if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <1  then
	                   x895111_NotifyTips(  sceneId,  selfId,  " ðÕo cø lan ít nh¤t c¥n tr¯ng ði mµt v¸ trí "  )	 
	                   return
	             end
                            local  GiveMy  =  15000
                            YuanBao(sceneId,selfId,-1,1,  GiveMy  )
                            SetMissionData(sceneId,selfId,GONGZI_1,0)
                            SetMissionData(sceneId,selfId,GONGZI_2,0)
                            CiftEquip  =  random(10000)
                            x002102_Notify(  sceneId,  selfId,"        nh§n l¤y ti«n lß½ng thành công , chúc m×ng các hÕ ðÕt ðßþc #G"..GiveMy.." nguyên bäo #W ðích ti«n lß½ng .   ")
                            if  CiftEquip  >=  10001  then
                                  local  pos  =  TryRecieveItem(  sceneId,  selfId,  ChongLou[random(1,6)],  1  )
                                  local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)
	 	   local  strText  =  format("#cFF0000 tin tÑc t¯t : #Y nhà ch½i ".."#{_INFOUSR%s}#Y ðang hoàn thành mµt tu¥n Nhi®m vø Ti«n Lß½ng sau này , m®t möi ðích v×a ngã vào ÐÕi Lý #G chúc giàu sang #{_INFOAIM146,120,2, chúc giàu sang } trß¾c m£t , ðÑng d§y lúc ngoài ý mu¯n phát hi®n trong túi nhi«u mµt món #{_INFOMSG%s} , không khöi h°i hµp ~",GetName(sceneId,selfId),transfer)
                                  BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);
                            end

                    elseif  jiance1  ==  304400202  and  jiance2  ==  3020304  then
	             if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <1  then
	                   x895111_NotifyTips(  sceneId,  selfId,  " ðÕo cø lan ít nh¤t c¥n tr¯ng ði mµt v¸ trí "  )	 
	                   return
	             end
                            local  GiveMy  =  20000
                            YuanBao(sceneId,selfId,-1,1,  GiveMy  )
                            SetMissionData(sceneId,selfId,GONGZI_1,0)
                            SetMissionData(sceneId,selfId,GONGZI_2,0)
                            CiftEquip  =  random(10000)
                            x002102_Notify(  sceneId,  selfId,"        nh§n l¤y ti«n lß½ng thành công , chúc m×ng các hÕ ðÕt ðßþc "..GiveMy.." nguyên bäo #W ðích ti«n lß½ng .   ")
                            if  CiftEquip  >=  10001  then
                                  local  pos  =  TryRecieveItem(  sceneId,  selfId,  ChongLou[random(1,6)],  1  )
                                  local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)
	 	   local  strText  =  format("#cFF0000 tin tÑc t¯t : #Y nhà ch½i ".."#{_INFOUSR%s}#Y ðang hoàn thành mµt tu¥n Nhi®m vø Ti«n Lß½ng sau này , m®t möi ðích v×a ngã vào ÐÕi Lý #G chúc giàu sang #{_INFOAIM146,120,2, chúc giàu sang } trß¾c m£t , ðÑng d§y lúc ngoài ý mu¯n phát hi®n trong túi nhi«u mµt món #{_INFOMSG%s} , không khöi h°i hµp ~",GetName(sceneId,selfId),transfer)
                                  BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);
                            end
                    else
                            x002102_Notify(  sceneId,  selfId,"        các hÕ v¯n chu chßa hoàn thành Nhi®m vø Ti«n Lß½ng , không có ti«n lß½ng nhßng nh§n l¤y ! ")
                    return
                    end

              end
end

--**********************************
-- t¥m xa ði«u døng 
--**********************************
function  x002102_ChaKanGongZiJinDu(  sceneId,  selfId  )
      local  type  =  1
      local  myLevel  =  GetLevel(sceneId,  selfId)
      local  nWeekCur  =  mod(GetWeekTime(),10)  -- trß¾c m£t thÑ m¤y chu 
      if  myLevel  >=  80  and  myLevel  <  90  then
            type  =  2
      elseif  myLevel  >=  90  then
            type  =  3
      end

                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  >=  1  and  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ~=  nWeekCur  then
                            SetMissionData(sceneId,selfId,GONGZI_1,0)
                            SetMissionData(sceneId,selfId,GONGZI_2,0)
                      end
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  <  1  then
                              x002102_NotifyTip(  sceneId,  selfId,"        các hÕ v¯n chu chßa nh§n l¤y quá Nhi®m vø Ti«n Lß½ng , xin/m¶i ði trß¾c tìm - ÐÕi Lý -[ chúc giàu sang ] nh§n l¤y Nhi®m vø Ti«n Lß½ng ")
                            return
                      end

                      local  xiezi1  =  GetMissionData(sceneId,selfId,GONGZI_1)
                      local  xiezi2  =  mod(GetMissionData(sceneId,selfId,GONGZI_2),10^8)    -- trß¾c hai v¸ dùng cho ghi chép thÑ m¤y chu 

	     BeginUICommand(  sceneId  )
	     UICommand_AddInt(  sceneId,  selfId  )-- cái này không có gì dùng 
	     UICommand_AddInt(  sceneId,  xiezi1  )  -- m· ð¥u con s¯ thÑ nh¤t kh¯ng chª ti«n lß½ng c¤p b§c 123
	     UICommand_AddInt(  sceneId,  xiezi2  )  --
	     UICommand_AddInt(  sceneId,  0  )-- cái này kh¯ng chª Nhi®m vø Ti«n Lß½ng bän m¾i cñu bän 1 là bän m¾i , nhæng khác cñu bän 
	     EndUICommand(  sceneId  )
	     DispatchUICommand(  sceneId,  selfId,    20120517)

end


--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x002102_Notify(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId  )
end

--**********************************
-- màn änh trung gian b¡t m¡t ð« kÏ 
--**********************************
function  x002102_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

function  x002102_XieziDongtai(  sceneId,  selfId,  clickId)
          local  JuBaoData1  =  GetMissionData(sceneId,selfId,JUBAOPEN_1)
          local  JuBaoData2  =  GetMissionData(sceneId,selfId,JUBAOPEN_2)
          local  JuBaoData3  =  GetMissionData(sceneId,selfId,JUBAOPEN_3)

          if  clickId  ==  111  then    -- m· ra gi¾i m£t 
                      x002102_OnEventXieZi1(sceneId,selfId)
                      x002102_OnEventXieZi2(sceneId,selfId)

          elseif  clickId  ==  222  then    -- tång thêm chúc phúc 
                if  JuBaoData3  -  LuaFnGetCurrentTime()  >  0  then
                      local  yushijian  =  floor((JuBaoData3  -  LuaFnGetCurrentTime())/60)
                      x002102_NotifyTip(  sceneId,  selfId,  " Tø Bäo B°n m²i gi¶ chï có th¬ chúc phúc mµt l¥n , các hÕ còn c¥n "..yushijian.." phút sau m¾i có th¬ l¥n næa chúc phúc "  )
                      return	 
                else
                      SetMissionData(sceneId,selfId,JUBAOPEN_3,0)
                end

                if  mod(JuBaoData1,100)  >=  20  then
                          x002102_NotifyTip(  sceneId,  selfId,  " Tø Bäo B°n cüa các hÕ ðã ð¥y , không th¬ chÑa càng nhi«u h½n chúc phúc li­u ! "  )	 
                      return
                end
                if  mod(JuBaoData1,100)  ==  19  then
                      SetMissionData(sceneId,selfId,JUBAOPEN_1,JuBaoData1+1101)
                      SetMissionData(sceneId,selfId,JUBAOPEN_2,LuaFnGetCurrentTime()+10800)
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ==  mod(GetWeekTime(),10)  then
                            if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  2  or  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  3  and  floor(mod(GetMissionData(sceneId,selfId,GONGZI_2),10^6)/10^4)  <  2  then
                                  SetMissionData(sceneId,selfId,GONGZI_2,GetMissionData(sceneId,selfId,GONGZI_2)+10^4)
                            end
                      end
                      x002102_NotifyTip(  sceneId,  selfId,  " Tø Bäo B°n cüa các hÕ ðã ð¥y , xin/m¶i v¾i 3 gi¶ sau này nh§n l¤y "  )
                      LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	       x002102_XieziDongtai(  sceneId,  selfId,  111)
                else
                      --SetMissionData(sceneId,selfId,JUBAOPEN_1,JuBaoData1+101)  -- che gi¤u n½i này , dçn kình không üng hµ , không th¬ làm loÕi này phäng quan 
                      SetMissionData(sceneId,selfId,JUBAOPEN_1,JuBaoData1+1)
                      SetMissionData(sceneId,selfId,JUBAOPEN_3,LuaFnGetCurrentTime()+3600)
                      x002102_NotifyTip(  sceneId,  selfId,  " Chúc phúc thành công : chúc m×ng các hÕ , Tø Bäo B°n l¤y ðßþc chúc phúc +1 ! "  )
                      LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	       x002102_XieziDongtai(  sceneId,  selfId,  111)
                end

          elseif  clickId  ==  333  then    -- nh§n l¤y chúc phúc 
                local  biaozhi  =  JuBaoData2  -  LuaFnGetCurrentTime()
                if  JuBaoData2  >  0  and  biaozhi  <=  0  then
                      local  GetYB  =  random(20000,30000)
                      YuanBao(sceneId,selfId,-1,1,  GetYB  )
                      SetMissionData(sceneId,selfId,JUBAOPEN_1,0)
                      SetMissionData(sceneId,selfId,JUBAOPEN_2,0)
                      x002102_NotifyTip(  sceneId,  selfId,  " Nh§n l¤y thành công , chúc m×ng các hÕ ðÕt ðßþc "..GetYB.." nguyên bäo "  )
                      LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0);
	       x002102_XieziDongtai(  sceneId,  selfId,  111)
                else
                      x002102_NotifyTip(  sceneId,  selfId,  " nh§n l¤y th¶i gian chßa t¾i , xin/m¶i kiên nhçn ch¶ ðþi "  )
                end
        end
end


function  x002102_OnEventXieZi1(  sceneId,  selfId)
	     BeginUICommand(  sceneId  )
	     EndUICommand(  sceneId  )    --tostring()
	     UICommand_AddString(sceneId,"        Tø Bäo B°n có th¬ th×a tái mÛ häo chúc phúc , m²i gi¶ có th¬ vì Tø Bäo B°n tång thêm mµt ph¥n chúc phúc , khi Tø Bäo B°n cüa các hÕ mãn tái chúc phúc ðích th¶i ði¬m , träi qua 3 gi¶ ðích luy®n hóa , li«n có th¬ chuy¬n hóa ngçu nhiên s¯ lßþng ðích nguyên bäo , ngàn vÕn không nên bö qua cái c½ hµi t¯t này nga ~  ")    
	     DispatchUICommand(  sceneId,  selfId,    20170421)
end

function  x002102_OnEventXieZi2(  sceneId,  selfId)
                    local  JuBaoData1  =  GetMissionData(sceneId,selfId,JUBAOPEN_1)      -- có ðßþc hay không nh§n l¤y , có ðßþc hay không chúc phúc , tip tiªn ðµ 
                    local  JuBaoData2  =  GetMissionData(sceneId,selfId,JUBAOPEN_2)
                    local  JuBaoData3  =  GetMissionData(sceneId,selfId,JUBAOPEN_3)      -- m²i gi¶ ký ðªn ghi chép 

	     local  nExp  =  mod(JuBaoData1,100)
	     local  count  =  0
	     local  lingqu  =  0
	     local  zhufu  =  floor(mod(JuBaoData1,1000)/100)
	     local  lingAA  =  floor(JuBaoData1/1000)

              if  JuBaoData2  >  0  then
	     count  =  JuBaoData2  -  LuaFnGetCurrentTime()
              end

              if  lingAA  ~=  0  and  count  <=  0  then
	     lingqu  =  1
              end

	     BeginUICommand(  sceneId  )
	     EndUICommand(  sceneId  )
	       UICommand_AddInt(  sceneId,nExp)
	       UICommand_AddInt(  sceneId,count)
	       UICommand_AddInt(  sceneId,zhufu)
	       UICommand_AddInt(  sceneId,lingqu)
	     DispatchUICommand(  sceneId,  selfId,    20170422)
end


function  x002102_ShiMenCheck(  sceneId,  selfId)
                if  floor(GetMissionData(sceneId,selfId,GONGZI_2)/10^8)  ==  mod(GetWeekTime(),10)  then
                      if  floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  1  or
                            floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  2  or
                            floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^8)  ==  3  and  mod(floor(GetMissionData(sceneId,selfId,GONGZI_1)/10^4),100)  <  40  then
                            SetMissionData(sceneId,selfId,GONGZI_1,GetMissionData(sceneId,selfId,GONGZI_1)+10^4)
                      end
                end
                CallScriptFunction(  890536,"JianCe",sceneId,selfId)  -- ki¬m tr¡c có hay không ngày ðó 
                if  floor(mod(GetMissionData(sceneId,selfId,HUOYUEFB_1),10^9)/10^7)    <  20  then
                      SetMissionData(sceneId,selfId,HUOYUEZHI,GetMissionData(sceneId,selfId,HUOYUEZHI)+3)  -- hoÕt dßþc tr¸ giá +3
                      SetMissionData(sceneId,selfId,HUOYUEFB_1,GetMissionData(sceneId,selfId,HUOYUEFB_1)+10^7)
                end
end