-- tr÷ng hÕ tr× ma chân v¯n mµt vân tß¾c v¾i 2017 nåm 7 tháng 

-- chân v¯n s¯ 
x808133_g_scriptId  =  808133
x808133_g_beginTime1  =  19  *  60  +  30;
x808133_g_endTime1  =  22  *  60  ;
-- có sñ ki®n ID li®t bi¬u 
x808133_g_eventList={808134}
--x808133_g_MissionId  =  1439
--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x808133_UpdateEventList(  sceneId,  selfId,  targetId  )
	 
end
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x808133_OnDefaultEvent(  sceneId,  selfId,  targetId  )--sceneId,  selfId,  targetId
	 x808133_UpdateEventList(  sceneId,  selfId,  targetId  )
	 local  PlayerName  =  GetName(  sceneId,  selfId  )
	 local  PlayerSex  =  GetSex(  sceneId,  selfId  )

	 if  PlayerSex  ==  0  then
	 	 PlayerSex  =  " cô nß½ng "
	 else
	 	 PlayerSex  =  " thiªu hi®p "
	 end
	 BeginEvent(sceneId)
	 AddText(  sceneId,  "        #P"..PlayerName..PlayerSex..":#G  ngß½i mÕnh khöe ! l¶i nói ngàn nåm trß¾c Trung Nguyên ðÕi hÕn , hoàng ðª vì cÑu v¾t thß½ng sinh , ðem thØ ma phong v¾i hoàng tuy«n dß¾i . mùa hè lÕi t¾i , mµt ít pháp lñc cao thâm chi thØ ma li«n tránh thoát bùa ðích trói buµc ði ra nguy hÕi nhân gian . #r          tr÷ng hÕ trong lúc , #G m²i ngày 19:00 ðªn 22:00#W là thØ ma cØa h½i hß nhßþc th¶i ði¬m . nªu ðÕi hi®p có th¬ b¡t · cái này th¶i c½ di®t tr× nhæng thÑ này thØ ma , không chï có có th¬ vì dân tr× hÕi , còn có th¬ có giúp tång lên tu vi . "  )
	 AddNumText(  sceneId,  x808133_g_ScriptId,  " tr÷ng hÕ tr× ma ",  6,  1)
        AddNumText(  sceneId,  x808133_g_ScriptId,  " r¶i ði ..",  9,  0  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x808133_OnEventRequest(  sceneId,  selfId,  targetId)
      
        if  nNumText==0    then
	 --  t¡t cØa s± 
              BeginUICommand(sceneId)
              EndUICommand(sceneId)
              DispatchUICommand(sceneId,selfId,  1000)
              return
	 --end

        elseif  nNumText==1    then
	         local  PlayerLevel    =  GetLevel(sceneId,  selfId)
                local  PlayerName  =  GetName(  sceneId,  selfId  )
	         local  PlayerSex  =  GetSex(  sceneId,  selfId  )
                if  PlayerSex  ==  0  then
	 	 PlayerSex  =  " cô nß½ng "
	         else
	 	 PlayerSex  =  " thiªu hi®p "
	         end
	       if  PlayerLevel  <  30  then
	 	 BeginEvent(sceneId)
                        AddText(  sceneId,  "        #R"..PlayerName..PlayerSex..":"  )
	         AddText(  sceneId,  "        #G ngß½i c¤p b§c không t¾i 30 c¤p , 30 c¤p sau m¾i có th¬ nh§n l¤y tr÷ng hÕ tr× ma nhi®m vø ! #r#Y        nhanh ði thång c¤p sau tr· lÕi ði . "  )
	         EndEvent(sceneId)
	         DispatchEventList(sceneId,selfId,targetId)
	           return
	         end
	     --CallScriptFunction(  808134,  "OnDefaultEvent",  sceneId,  selfId,  targetId  )  -- nhi®m vø chân v¯n ID , cänh tßþng ID , nhà ch½i vai trò ID , møc tiêu ID
            for  i,  eventId  in  x808133_g_eventList  do
	 	 CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	         end
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId,targetId)                            
        end
end

--function  x808133_IsActivityOpen(sceneId)
	 --local  nHour  =  GetHour();
	 --local  nMinute  =  GetMinute();
	 --local  nCurTempTime  =  nHour  *  60  +  nMinute;
	 --if  nCurTempTime  >=  x808133_g_beginTime1  and  nCurTempTime  <  x808133_g_endTime1  then
	 	 --for  i,  eventId  in  x808133_g_eventList  do
	 	 --CallScriptFunction(  eventId,  "OnEnumerate",sceneId,  selfId,  targetId  )
	         --end
	       --EndEvent(sceneId)
	     --  DispatchEventList(sceneId,selfId,targetId)
	 --else
	 --return  0;
	 --end
--end
--**********************************
--print(nRet_rw)
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************

function  x808133_OnMissionAccept(  sceneId,  selfId,  targetId  )
	 
	 	 	 --local  ret1  =  CallScriptFunction(  x808133_IsActivityOpen,  "CheckAccept",  sceneId,  selfId,  targetId  )
	 	 	 --local  ret1  =  CallScriptFunction(  sceneId,  selfId,  targetId  )
	 	 	 --if  ret1  >  0  then
	 	 	 --	 CallScriptFunction(  808134,  "OnDefaultEvent",  sceneId,  selfId,  targetId  )  -- nhi®m vø chân v¯n ID , cänh tßþng ID , nhà ch½i vai trò ID , møc tiêu ID
	 	 	 --end
	 	 	 --return
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x808133_OnMissionRefuse(  sceneId,  selfId,  targetId,  x808133_MY_ZH  )
	 	 	 x808133_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
end

--**********************************
-- tiªp tøc # ðã nh§n nhi®m vø #
--**********************************
function  x808133_OnMissionContinue(  sceneId,  selfId,  targetId,  x808133_MY_ZH  )

	 	 	 CallScriptFunction(  808134,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x808133_OnMissionSubmit(  sceneId,  selfId,  targetId,  x808133_MY_ZH,  selectRadioId  )
	 
	 	 	 CallScriptFunction(  808134,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 

end

--**********************************
-- tØ vong sñ ki®n 
--**********************************
function  x808133_OnDie(  sceneId,  selfId,  killerId  )
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x808133_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 
end