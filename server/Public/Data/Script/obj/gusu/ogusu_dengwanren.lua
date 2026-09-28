-- mµ vinh NPC--
-- truy«n t¯ng ....

--                ___  __                                                                      --
--            _{___{__}\                                                                  --
--          {_}              `\)                                                              --
--        {_}                  `                          _.-''''--.._              -- nhi«u truy«n t¯ng chân v¯n 
--        {_}                                          //'.--.      \___.            -- hÕt tØ luy®n chª 
--          {  }__,_.--~~~-~~~-~~-::.---.  `-.\      `.)          --QQ718805400
--            `-.{_{_{_{_{_{_{_{_//      --  8;=-  `                    -- th×a nh§n chân v¯n ð¸nh chª 
--                  `-:,_.:,_:,_:,.`\\._  ..'=-  ,                        -- th×a nh§n bän b±n ð¸nh chª 
--                          //  //  //  //`-.`\`        .-'/                      --
--                        <<  <<  <<  <<          \  `--'    /----)              --
--                          ^    ^      ^      ^        `-.....--'''                --

x002118_g_ScriptId	 =  002118
x002118_g_xuanWuDaoId=400918  --[tx42913]
-- môn phái tin tÑc ( môn phái tên , SceneID , PosX , PosY , môn phái ID)
x002118_g_mpInfo	 	 =  {}
x002118_g_mpInfo[0]	 =  {  "Tinh túc ",  16,    96,  152,  MP_XINGSU  }
x002118_g_mpInfo[1]	 =  {  "Tiêu dao ",  14,    67,  145,  MP_XIAOYAO  }
x002118_g_mpInfo[2]	 =  {  "Thiªu Lâm ",    9,    96,  127,  MP_SHAOLIN  }
x002118_g_mpInfo[3]	 =  {  "Thiên S½n ",  17,    95,  120,  MP_TIANSHAN  }
x002118_g_mpInfo[4]	 =  {  "Thiên long ",  13,    96,  120,  MP_DALI  }
x002118_g_mpInfo[5]	 =  {  "Nga Mi ",  15,    89,  139,  MP_EMEI  }
x002118_g_mpInfo[6]	 =  {  "Võ Ðß½ng ",  12,  103,  140,  MP_WUDANG  }
x002118_g_mpInfo[7]	 =  {  "Minh giáo ",  11,    98,  167,  MP_MINGJIAO  }
x002118_g_mpInfo[8]	 =  {  "Cái Bang ",  10,    91,  116,  MP_GAIBANG  }
x002118_g_mpInfo[9]	 =  {  "Mµ Dung ",  435,    29,  135,  MP_WUMENPAI  }
x002118_g_mpInfo[10]	 =  {  "Ðß¶ng môn ",  495,    123,  69,  MP_TANGMEN  }
x002118_g_mpInfo[11]	 =  {  "QuÖ c¯c ",  197,    87,  151,  MP_GUIGU  }

x002118_g_Yinpiao  =  40002000  

x002118_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x002118_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x002118_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x002118_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

                local  NPCName  =  GetMenPai(sceneId,targetId)
	 local	 mp
	 local	 i	 	 =  0
	 BeginEvent(  sceneId  )

         
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - ÐÕi Lý ",  9,  1006  )
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - LÕc Dß½ng ",  9,  1001  )
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - LÕc Dß½ng- CØu châu thß½ng hµi ",  9,  1002  )
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - Tô Châu ",  9,  1003  )
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - Tô Châu-thþ rèn ",  9,  1004  )
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - Lâu lan",  9,  1005  )
	 	 --AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ -  thúc sông c± tr¤n ",  9,  1016  )
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Thành ph¯ - #GPhßþng minh tr¤n ",  9,  1017  )
	 	 --[tx42913]
                  CallScriptFunction(  x002118_g_xuanWuDaoId,  "OnEnumerate",sceneId,  selfId,  targetId  )  
	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "T¾i môn phái khác",  9,  1011  )
	 	 
	 	 --for  i,  mp  in  x002118_g_mpInfo  do
	 	 	 --AddNumText(  sceneId,  x002118_g_ScriptId,  " môn phái   -  "..mp[1],  9,  i  )
	 	 --end
	 	 --  ta nhß thª nào m¾i có th¬ ði ðôn hoàng cùng tung s½n 
	 	 AddNumText(  sceneId,  x002118_g_scriptId,  " ta nhß thª nào m¾i có th¬ ði ðôn hoàng cùng tung s½n ",  11,  2000  )
	 
	 
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x002118_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 -- tào v§n c¤m chï truy«n t¯ng ....
	 if  GetTeamId(sceneId,selfId)>=0  and  
	 	 IsTeamFollow(sceneId,  selfId)==1  and
	 	 LuaFnIsTeamLeader(sceneId,selfId)==1  then
	 	 num=LuaFnGetFollowedMembersCount(  sceneId,  selfId)
	 	 local  mems  =  {}
	 	 for	 i=0,num-1  do
	 	 	 mems[i]  =  GetFollowedMember(sceneId,  selfId,  i)
	 	 	 if  mems[i]  ==  -1  then
	 	 	 	 return
	 	 	 end
	 	 	 if  IsHaveMission(sceneId,mems[i],4021)  >  0  then
	 	 	 	 x002118_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x002118_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end

	 -- ki¬m tr¡c Impact trÕng thái trú lßu hi®u quä 
	 for  i,  ImpactId  in  x002118_g_Impact_NotTransportList  do
	 	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  ImpactId)  ~=  0  then
	 	 	 x002118_MsgBox(  sceneId,  selfId,  targetId,  x002118_g_TalkInfo_NotTransportList[i]  )	 	 	 
	 	 	 return  0
	 	 end
	 end

	 
	 -- tr· v« môn phái ....
	 local	 arg	 =  GetNumText()
	 local	 mp
	 local	 i	 	 =  0
	 local	 id	 =  LuaFnGetMenPai(  sceneId,  selfId  )
                local  xiezi=GetHumanMaxVigor(sceneId,selfId)  
	 if  arg  ==  1000  then	 	 -- tr· v« môn phái 
	 	 if  id  ==  9  and  xiezi  <  25000  then
	 	 	 x002118_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i còn không có gia nh§p b¤t kÏ môn phái nào ! "  )
	 	 else
	 	 	 mp	 =  x002118_GetMPInfo(  id  )
	 	 	 if  mp  ~=  nil  then
	 	 	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  mp[2],  mp[3],  mp[4]  )
	 	 	 end
	 	         if  id  ==  9  and  xiezi  >  25000  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  197,  87,  151  )
                                end
	 	 end
	 	 return
	 end

	 -- quÖ c¯c 
    	 --if  arg  ==  9999  then
	 	 --CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  197,  87,  151  )
	 	 --return
	 --end

                -- ÐÕi Lý 
                if  arg  ==  1006  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  253,  122  )
	 	 return
	 end

	 -- LÕc Dß½ng ....
	 if  arg  ==  1001  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  233,  321  )
	 	 return
	 end

	 -- LÕc Dß½ng CØu châu ....
	 if  arg  ==  1002  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  325,  270  )
	 	 return
	 end

	 -- Tô Châu ....
	 if  arg  ==  1003  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  202,257  )
	 	 return
	 end

	 -- Tô Châu thþ rèn ....
	 if  arg  ==  1004  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  331,  226  )
	 	 return
	 end

	 -- lâu lan ....
	 if  arg  ==  1005  then
                  if  GetLevel(  sceneId,  selfId  )  >=  75  then    
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  288,  136,  75  )
	 	 return
	                 end
                            	 x002118_MsgBox(  sceneId,  selfId,  targetId,  "    c¤p b§c cüa ngß½i chßa ðü 75 c¤p , tÕm th¶i không th¬ sØ døng . "  )
                        end

	 -- phßþng minh tr¤n ....
	 if  arg  ==  1017  then
                  if  GetLevel(  sceneId,  selfId  )  >=  85  then    
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  158,  120,  75  )
	 	 return
	                 end
                            	 x002118_MsgBox(  sceneId,  selfId,  targetId,  "    c¤p b§c cüa ngß½i chßa ðü 85 c¤p , tÕm th¶i không th¬ vào ngày hoang c± tr¤n . "  )
                                end

	 if  arg  ==  1011  then	 	 
	 	 BeginEvent(  sceneId  )
	 	                                 --AddNumText(  sceneId,  x002118_g_ScriptId,  "#G khäo nghi®m   -  quÖ c¯c ",  9,  9999  )
	 	 	 for  i,  mp  in  x002118_g_mpInfo  do
	 	 	 	 AddNumText(  sceneId,  x002118_g_ScriptId,  "Môn phái-"..mp[1],  9,  i  )
	 	 	 end
	 	 	 
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 
	 	 return
	 end
	 
	 if  arg  ==  1016  then	 	 -- thúc sông c± tr¤n 
	 	 	 --  add  by  zchw
	 	 BeginUICommand(sceneId)
	 	 	 UICommand_AddInt(sceneId,  x002118_g_ScriptId);
	 	 	 --  zchw  fix  Transfer  bug
	 	 	 UICommand_AddInt(sceneId,  targetId);
	 	 	 UICommand_AddString(sceneId,  "GotoShuHeGuZhen");
	 	 	 UICommand_AddString(sceneId,  " thúc sông c± tr¤n vì không thêm sát khí cänh tßþng , xin chú ý an toàn . ngß½i xác nh§n mu¯n ði vào sao ? ");
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  24)
	 	 return
	 end
--[tx42913]
	 if  eventId  ==  x002118_g_xuanWuDaoId  then  -- ði huy«n vû ðäo 
	 	 CallScriptFunction(  x002118_g_xuanWuDaoId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 return
	 end

	 
	 -- môn phái ....
	 for  i,  mp  in  x002118_g_mpInfo  do
	 	 if  arg  ==  i  then
	 	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  mp[2],  mp[3],  mp[4]  )
	 	 	 return
	 	 end
	 end

end
--    add  by  zchw
function  x002118_GotoShuHeGuZhen(  sceneId,  selfId,  targetId  )
	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  420,  200,  211,  20  );
	 return
end

--add  by  WTT
--function  x002118_GotoShuHeGuZhen(  sceneId,  selfId,  targetId  )
	 --CallScriptFunction((400900),  "TransferFuncFromNpc",  sceneId,  selfId,  420,  200,  211,  20  );
	 --return
--end

--**********************************
-- cån cÑ môn phái ID l¤y ðßþc môn phái tin tÑc 
--**********************************
function  x002118_GetMPInfo(  mpID  )
	 local	 mp
	 local	 i	 	 =  0
	 for  i,  mp  in  x002118_g_mpInfo  do
	 	 if  mp[5]  ==  mpID  then
	 	 	 return  mp
	 	 end
	 end
	 return  nil
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x002118_MsgBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end