-- chân v¯n s¯ 
x001086_g_scriptId  =  001086  
x001086_g_beginTime1  =  19  *  60  +  30;
x001086_g_endTime1  =  22  *  60  ;

-- có sñ ki®n ID li®t bi¬u 
x001086_g_eventList={808131,808133,808134}
--x001086_g_eventList={210200,210201}

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x001086_UpdateEventList(  sceneId,  selfId,targetId  )
        local    PlayerName=GetName(sceneId,selfId)
	 local    PlayerSex=GetSex(sceneId,selfId)

	 if  PlayerSex  ==  0  then
	 	 PlayerSex  =  " Cô Nß½ng "
	 else
	 	 PlayerSex  =  " Thiªu Hi®p "
	 end
	 BeginEvent(sceneId)
	 AddText(sceneId,"        M²i khi mùa hÕ ðªn, ðÕi hi®p nhà không có sØa s± và thß¶ng hay s¯c nhi®t? Ta Lß½ng ðÕo sî thúi có Tiêu ThØ dßþc lß½ng phß½ng, không biªt #G"..PlayerName..PlayerSex.." #W tìm ta có chuy®n gì ? ")
	 --AddNumText(sceneId,x001086_g_ScriptId,"#{XCHQ_90609_2}",6,100)    -- hÕ thi«n hàn tuy«n 
                --AddNumText(sceneId,x001086_g_ScriptId,"#{XCHQ_90609_1}",6,400)    -- tr÷ng hÕ tr× ma 
					 	 AddNumText(sceneId,x001086_g_sceneId,	" #ef12345#Y ChÑc nång tÕm khoá", 6,3333333333 )	
	 --AddNumText(sceneId,x001086_g_ScriptId,"#G HÑa Nguy®n Quä ð±i thß·ng ",6,300)    -- HÑa Nguy®n Quä ð±i tß·ng thß·ng 
	 AddNumText(sceneId,x001086_g_ScriptId,"#{SQXY_09061_6}",11,9991)    -- liên quan t¾i 1001 quä nguy®n v÷ng 
	 AddNumText(sceneId,x001086_g_ScriptId,"#{XCHQ_90609_4}",11,9992)    -- liên quan t¾i hÕ thi«n hàn tuy«n 
	 AddNumText(sceneId,x001086_g_ScriptId,"#{XCHQ_90609_3}",11,9993)    -- liên quan t¾i tr÷ng hÕ tr× ma 
	 for  i,  eventId  in  x001086_g_eventList  do
	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	 end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x001086_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 x001086_UpdateEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x001086_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  1  and  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  1  then
	 	 BeginEvent(  sceneId  )  
	 	           strText  =  "        ðÕo cø lan cùng tài li®u lan ít nh¤t c¥n 1 quä ch² tr¯ng ! "
	 	           AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	 return
                end

	 if	 GetNumText()  ==  300	 then
	                 BeginEvent(sceneId)			 
	 	 --AddText(  sceneId,  "#r    #W1 quä #G HÑa Nguy®n Quä #W ð±i #G Tß½ng Khuông Canh Hoán Thiªp #W mµt #r    #W7 quä #G HÑa Nguy®n Quä #W ð±i #G Chí Tôn Cß¶ng Hoá Tinh Hoa #W mµt #r    #W20 quä #G HÑa Nguy®n Quä #W ð±i #G H°ng Bäo ThÕch (C¤p 7 )#W mµt #r ")
	 	 --AddText(  sceneId, "  #cFF0000 Xin m¶i các lña ph¥n quà ð¬ ð±i và ðäm bäo trong ô ÐÕo Cu, Nguyên Li®u ít nh¤t mµt ch² tr¯ng . "  )
	 	 --AddNumText(  sceneId,  x001086_g_ScriptId,  " Ð±i Tß½ng Khuông Canh Hoán Thiªp ",  6,  311  )
	 	 --AddNumText(  sceneId,  x001086_g_ScriptId,  " Ð±i Chí Tôn Cß¶ng Hoá Tinh Hoa ",  6,  321  )
	 	 --AddNumText(  sceneId,  x001086_g_ScriptId,  " Ð±i H°ng Bäo ThÕch (C¤p 7 )",  6,  351  )
	                 EndEvent(sceneId)
	                 DispatchEventList(sceneId,selfId,targetId)
	 end

	 if            GetNumText()  ==  311	 then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20502010)  <  1  then
	 	       BeginEvent(  sceneId  )  
	 	           strText  =  "        #Y Các hÕ không ðü HÑa Nguy®n Quä 1 quäi ! "
	 	           AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
                                end
                                if    LuaFnDelAvailableItem(sceneId,selfId,20502010,1)  ~=  1  then
	 	       BeginEvent(  sceneId  )  
	 	           strText  =  "        #Y các hÕ HÑa Nguy®n Quä kh¤u tr× th¤t bÕi ! "
	 	           AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
                                end
                                TryRecieveItem(  sceneId,  selfId,  38010001,  1  )
	 BeginEvent(  sceneId  )  
	       strText  =  "        #Y ð±i thành công ! "
	       AddText(  sceneId,  strText  )
	       EndEvent(  sceneId  )
	       DispatchEventList(  sceneId,  selfId,  targetId  )
	 return
                end


	 if            GetNumText()  ==  321	 then	 
	 	 c0  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  20502010)
                        if  c0  >=7  then
	 	                         BeginEvent(  sceneId  )  
	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,20502010,7)-- thü tiêu HÑa Nguy®n Quä 
	 	 	 	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  38000571,  1)-- cho chí tôn cß¶ng hóa 
	 	 	 	         local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
	 	 	 	 	 --x001086_ShowRandomSystemNotice(  sceneId,  selfId,  szItemTransfer  )
	 	                         LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
	 	 	 	 strText  =  "        #Y chúc m×ng các hÕ , ðÕt ðßþc #b#G Chí Tôn Cß¶ng Hoá Tinh Hoa ! "
	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 EndEvent(  sceneId  )
	 	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
                          else
	 	 	 	 BeginEvent(  sceneId  )  
	 	 	 	 strText  =  "        #Y Các hÕ không ðü HÑa Nguy®n Quä 7 quäi! "
	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 EndEvent(  sceneId  )
	 	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 end
                end


	 if  GetNumText()  ==  351  then
	 	 c0  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  20502010)
                        if  c0  >=20  then
	 	                         BeginEvent(  sceneId  )  
	 	 	 	 	 LuaFnDelAvailableItem(sceneId,selfId,20502010,20)-- thü tiêu HÑa Nguy®n Quä 
	 	 	 	 	 local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  50713004,  1)-- cho h°ng bäo thÕch 
	 	 	 	         local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
	 	 	 	 	 --x001086_ShowRandomSystemNotice2(  sceneId,  selfId,  szItemTransfer  )
	 	                         LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
	 	 	 	 strText  =  "        #Y Chúc m×ng các hÕ , ðÕt ðßþc #b#G H°ng Bäo ThÕch (C¤p 7 ) ! "
	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 EndEvent(  sceneId  )
	 	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
			 	 local  nam  =  LuaFnGetName(  sceneId,  selfId  )
	 	 BroadMsgByChatPipe(  sceneId,  selfId,  "#cff66cc[ Lß½ng ÐÕo Sî Thúi]:#B Chúc m×ng  #cff0000"..nam.."  #B ðã ð±i #G HÑa Nguy®n Quä #B thành công l¤y #cFF0000H°ng Bäo ThÕch (C¤p 7) ",  4  )
                          else
	 	 	 	 BeginEvent(  sceneId  )  
	 	 	 	 strText  =  "        #Y Các hÕ không ðü HÑa Nguy®n Quä 20 quä ! "
	 	 	 	 AddText(  sceneId,  strText  )
	 	 	 EndEvent(  sceneId  )
	 	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	           end
                end
	 if  GetNumText()  ==  400  then
	 	 
	     local  nHour  =  GetHour();
	     local  nMinute  =  GetMinute();
	     local  nCurTempTime  =  nHour  *  60  +  nMinute
	       if  nCurTempTime  <  x001086_g_beginTime1  or  nCurTempTime  >  x001086_g_endTime1  then
	 	       BeginEvent(sceneId)
	 	 	 AddText(sceneId," bây gi¶ còn không có ðªn tr÷ng hÕ tr× ma ðích th¶i gian ! ")
	 	 	 EndEvent(  )
	 	 	 DispatchMissionTips(sceneId,selfId)
                                        BeginEvent(sceneId)
                                                AddText(sceneId,"#Y tr÷ng hÕ tr× ma   :")
	 	 	 AddText(sceneId,  "        #G l¶i nói ngàn nåm trß¾c Trung Nguyên ðÕi hÕn , hoàng ðª vì cÑu v¾t thß½ng sinh , ðem thØ ma phong v¾i hoàng tuy«n dß¾i . mùa hè lÕi t¾i , mµt ít pháp lñc cao thâm chi thØ ma li«n tránh thoát bùa ðích trói buµc ði ra nguy hÕi nhân gian . ")
                                                AddText(sceneId,  "        #G tr÷ng hÕ trong lúc , #Y m²i ngày bu±i t¯i ðích 19:30 ðªn 22 : 00#G là thØ ma cØa h½i hß nhßþc th¶i ði¬m . nªu ðÕi hi®p có th¬ b¡t · cái này th¶i c½ di®t tr× nhæng thÑ này thØ ma , không chï có có th¬ vì dân tr× hÕi , còn có th¬ có giúp tång lên tu vi . ")
	 	 	 	 	 	 AddText(sceneId,  "#Y        tr÷ng yªu ð« kÏ : #P cái này liên hoàn nhi®m vø c¥n nhi®m vø cüa các hÕ túi ít nh¤t phäi có 7 quä ch² tr¯ng , nªu nhß ch² tr¯ng chßa ðü , xin m¶i trß¾c ðem chiªm v¸ ðích nhi®m vø hoàn thành ho£c buông tha cho nhæng nhi®m vø này , lßu chân v¸ trí tr· lÕi nh§n l¤y nhi®m vø . ")
                                                AddText(sceneId,"#cFF0000          bây gi¶ còn không có ðªn tr÷ng hÕ tr× ma ðích th¶i gian ! ")
	 	 	 EndEvent(  )
	 	 	 DispatchEventList(sceneId,selfId)
	 	 	 return  0
	         else
                  local  nData_cm  =  0
	 	 	 	 	 
                      local  nDayCount  =  GetMissionData(  sceneId,  selfId,MD_ZHONGXIACHUMO_TIME  )
	               local  nLastDay  =  GetHighWord(  nDayCount  )
	               local  nCount  =  GetLowWord(  nDayCount  )
	               local  nToday  =  GetDayTime()
	 	 
	 	   -- ki¬m tr¡c hôm nay là hay không vßþt qua 1 l¥n 
                      if  nLastDay  ==  nToday  and  nCount  >=  1  then
	 	 	 x001086_NotifyFailTips(  sceneId,  selfId,  "#Y tr÷ng hÕ tr× ma nhi®m vø m²i ngày chï có th¬ làm 1 l¥n , xin m¶i ngày mai tr· lÕi nh§n l¤y . "  )
	 	             return
                      end
                  local  td  =  GetTime2Day()
	           local  lt  =  GetMissionData(sceneId,selfId,MD_ZHONGXIACHUMO_TIME)
	           if  td  ==  lt  then
	 	 	 x001086_NotifyFailTips(  sceneId,  selfId,  "#Y tr÷ng hÕ tr× ma nhi®m vø m²i ngày chï có th¬ làm 1 l¥n , xin m¶i ngày mai tr· lÕi nh§n l¤y . "  )
	             
	 	         return
	             else
	 	         if  nLastDay  ~=  nToday  then
	 	 	 	 nData_cm  =  SetHighWord(  nData_cm,  nToday  )
	 	 	 	 nData_cm  =  SetLowWord(  nData_cm,  1  )
	 	 	 else
	 	 	 	 nData_cm  =  SetHighWord(  nData_cm,  nToday  )
	 	 	 	 nData_cm  =  SetLowWord(  nData_cm,  nCount  +  2  )
	 	 	 end
                      SetMissionData(  sceneId,  selfId,  MD_ZHONGXIACHUMO_TIME,  nData_cm  )
	                 CallScriptFunction(  808134,"OnDefaultEvent",  sceneId,  selfId,  targetId  )
	 	       
	               end
	 	                 --AddItem(  sceneId,x808134_g_rws,  1  )
	 	 	 	 
	 	 	 	 
	         end
end


	 if            GetNumText()  ==  9991  then
	 	 BeginEvent(  sceneId  )
	 	             AddText(  sceneId,  "#{SQXY_09061_39}"  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if            GetNumText()  ==  9992  then
	 	 BeginEvent(  sceneId  )
	 	             AddText(  sceneId,  "#{XCHQ_90609_5}"  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if            GetNumText()  ==  9993  then
	 	 BeginEvent(  sceneId  )
	 	             AddText(  sceneId,  "#{ZXCM_090602_40}"  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 for  i,  findId  in  x001086_g_eventList  do
	 	 if  eventId  ==  findId  then
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x001086_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x001086_g_eventList  do
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
function  x001086_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x001086_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x001086_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x001086_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x001086_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x001086_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )
	 for  i,  findId  in  x001086_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x001086_OnDie(  sceneId,  selfId,  killerId  )
end
--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x001086_NotifyFailTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end