-- Lâu Lan NPC
-- d¸ch trÕm ....
-- ða truy®n t¯ng cß¾c bän , hÕt tØ nguyên sang , QQ-718805400, th×a tiªp bän bän ð¸nh chª ? cß¾c bän ð¸nh chª . kÛ thu§t bäo chß¾ng 

x001100_g_ScriptId	 =  001100

-- Môn Phái tín tÑc ( Môn Phái danh xßng , SceneID , PosX , PosY , Môn Phái ID)
x001100_g_mpInfo	 	 =  {}
x001100_g_mpInfo[0]	 =  {  " Tinh Túc ",  16,    96,  152,  MP_XINGSU  }
x001100_g_mpInfo[1]	 =  {  " Tiêu Dao ",  14,    67,  145,  MP_XIAOYAO  }
x001100_g_mpInfo[2]	 =  {  " Thi¬u Lâm ",    9,    96,  127,  MP_SHAOLIN  }
x001100_g_mpInfo[3]	 =  {  " Thiên S½n ",  17,    95,  120,  MP_TIANSHAN  }
x001100_g_mpInfo[4]	 =  {  " Thiên Long ",  13,    96,  120,  MP_DALI  }
x001100_g_mpInfo[5]	 =  {  " Nga Mi ",  15,    89,  139,  MP_EMEI  }
x001100_g_mpInfo[6]	 =  {  " Võ Ðang ",  12,  103,  140,  MP_WUDANG  }
x001100_g_mpInfo[7]	 =  {  " Minh Giáo ",  11,    98,  167,  MP_MINGJIAO  }
x001100_g_mpInfo[8]	 =  {  " Cái Bang ",  10,    91,  116,  MP_GAIBANG  }
x001100_g_mpInfo[9]	 =  {  " Mµ Dung ",  435,    29,  135,  MP_GUSU  }
x001100_g_mpInfo[10]	 =  {  " Ðß¶ng Môn ",  495,    129,  71,  MP_TANGMEN  }
x001100_g_mpInfo[11]	 =  {  " Qüy C¯c ",  197,    87,  151,  MP_GUIGU  }
x001100_g_Yinpiao  =  40002000  

x001100_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy®n t¯ng ðích Impact
x001100_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy®n t¯ng ðích Impact ð« kÏ tín tÑc 

--**********************************
-- sñ ki®n giao h² nh§p kh¦u 
--**********************************
function  x001100_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 
	 --  ki¬m tr¡c ngoÕn gia thân thßþng th¸ b¤t th¸ hæu “ ngân phiªu ” giá cá ðông tây , hæu tñu b¤t nång sØ døng giá lý ðích công nång 
	 if  GetItemCount(sceneId,  selfId,  x001100_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    nhî thân thßþng hæu ngân phiªu , chính tÕi bào thß½ng ! ngã b¤t nång bang trþ nhî . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

                local  NPCName  =  GetName(sceneId,targetId)
	 local	 mp
	 local	 i	 	 =  0
	 BeginEvent(  sceneId  )

	 	 --AddNumText(  sceneId,  x001100_g_ScriptId,  "#G tr¡c thí - Qüy C¯c ",  9,  9999  )
                      if  NPCName  ==  " c½ vû kÏ "  then
	 	 AddText(  sceneId,  "#{HDYD_120822_183}")
	 	 --AddNumText(  sceneId,  x001100_g_ScriptId,  "#H truy®n t¯ng -  huy«n häi ",  9,  997  )
	 	 --AddNumText(  sceneId,  x001100_g_ScriptId,  "#H truy®n t¯ng -  ðÕi côn di hài ",  9,  998  )
	 	 --AddNumText(  sceneId,  x001100_g_ScriptId,  "#Y ti«n vãng thüy nguy®t ðµng thiên ",  9,  999  )

                      elseif  NPCName  ==  " ðoan khánh "  then
	 	 AddText(  sceneId,  " li®t di­m Thiên Long hoan nghênh nhî ! xích sa ? hÕt hoan nghênh nhî ! hæu bug thïnh c§p thì hß¾ng hÕt tØ phän quÛ , hÕt tØ Thiên Long kÛ thu§t qu¥n : 555132139  . ")
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Phßþng Minh Tr¤n ",  9,  996  )

                      elseif  NPCName  ==  " la bí "  then
	 	 AddText(  sceneId,  "        thiên ngoÕi thánh cänh phong quang y nï , mÛ b¤t th¡ng thu , trÑ thñc nhßþng nhân lßu liên vong phän a ! ")
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Môn Phái ",  9,  1000  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng ",  9,  1001  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng - cØu châu thß½ng hµi ",  9,  1002  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu",  9,  1003  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu  -  thiªt tßþng phô ",  9,  1004  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - ÐÕi Lý ",  9,  1005  )
	 	 AddNumText(  sceneId,  x900028_g_ScriptId,  " Thành Th¸ - Lâu Lan ",  9,  1015  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Thúc Hà C± Tr¤n ",  9,  1016  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Ði ðªn các Môn Phái khác ",  9,  1011  )

                      elseif  NPCName  ==  " ngô ðÑc xß½ng "  or  NPCName  ==  " uông hÕn "  then
	 	 AddText(  sceneId,  "#{XIYU_20071228_01}")
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Môn Phái ",  9,  1000  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu",  9,  1003  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu  -  thiªt tßþng phô ",  9,  1004  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - ÐÕi Lý ",  9,  1005  )
	 	 AddNumText(  sceneId,  x900028_g_ScriptId,  " Thành Th¸ - Lâu Lan ",  9,  1015  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Thúc Hà C± Tr¤n ",  9,  1016  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - #G Phßþng Minh Tr¤n ",  9,  1020  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Ði ðªn các Môn Phái khác ",  9,  1011  )

                      elseif  NPCName  ==  " lý th×a phong "  or  NPCName  ==  " ð£ng m§u "  then
	 	 AddText(  sceneId,  "#{XIYU_20071228_01}")
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Môn Phái ",  9,  1000  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng ",  9,  1001  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng - cØu châu thß½ng hµi ",  9,  1002  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - ÐÕi Lý ",  9,  1005  )
	 	 AddNumText(  sceneId,  x900028_g_ScriptId,  " Thành Th¸ - Lâu Lan ",  9,  1015  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Thúc Hà C± Tr¤n ",  9,  1016  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - #G Phßþng Minh Tr¤n ",  9,  1020  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Ði ðªn các Môn Phái khác ",  9,  1011  )

                      elseif  NPCName  ==  " thôi phùng cØu "  then
	 	 AddText(  sceneId,  "#{XIYU_20071228_01}")
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Môn Phái ",  9,  1000  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng ",  9,  1001  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng - cØu châu thß½ng hµi ",  9,  1002  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu",  9,  1003  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu  -  thiªt tßþng phô ",  9,  1004  )
	 	 AddNumText(  sceneId,  x900028_g_ScriptId,  " Thành Th¸ - Lâu Lan ",  9,  1015  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Thúc Hà C± Tr¤n ",  9,  1016  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - #G Phßþng Minh Tr¤n ",  9,  1020  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Ði ðªn các Môn Phái khác ",  9,  1011  )

                      elseif  NPCName  ==  " t× hà khách "  then
	 	 AddText(  sceneId,  "#{SHGZ_001}")
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Môn Phái ",  9,  1000  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng ",  9,  1001  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng - cØu châu thß½ng hµi ",  9,  1002  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu",  9,  1003  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu  -  thiªt tßþng phô ",  9,  1004  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - ÐÕi Lý ",  9,  1005  )
	 	 AddNumText(  sceneId,  x900028_g_ScriptId,  " Thành Th¸ - Lâu Lan ",  9,  1015  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - #G Phßþng Minh Tr¤n ",  9,  1020  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Ði ðªn các Môn Phái khác ",  9,  1011  )

                      elseif  NPCName  ==  "Ngäi Ni Ngõa Nhî"  then
	 	 AddText(  sceneId,  "#{loulan_yizhan_20080329}")	 	   
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Quay V« Môn Phái ",  9,  1000  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng ",  9,  1001  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - LÕc Dß½ng - cØu châu thß½ng hµi ",  9,  1002  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu",  9,  1003  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Tô Châu  -  thiªt tßþng phô ",  9,  1004  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - ÐÕi Lý ",  9,  1005  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - Thúc Hà C± Tr¤n ",  9,  1016  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Thành Th¸ - #G Phßþng Minh Tr¤n ",  9,  1020  )
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Ði ðªn các Môn Phái khác ",  9,  1011  )
	 	 
	 	 --for  i,  mp  in  x001100_g_mpInfo  do
	 	 	 --AddNumText(  sceneId,  x001100_g_ScriptId,  " Môn Phái - "..mp[1],  9,  i  )
	 	 end
	 
	 	 --  Làm sao ð¬ ði ðªn Ðôn Hoàng 
	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Làm sao ð¬ ði ðªn Ðôn Hoàng ",  11,  2000  )

	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )

end

--**********************************
-- sñ ki®n li®t bi¬u tuy¬n trung nh¤t hÕng 
--**********************************
function  x001100_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 if  GetNumText()  ==  1011  then
	 local	 mp
	 local	 i	 	 =  0
	 	 BeginEvent(  sceneId  )
	 	                                 --AddNumText(  sceneId,  x001100_g_ScriptId,  "#G tr¡c thí - Qüy C¯c ",  9,  9999  )
	 	 	 for  i,  mp  in  x001100_g_mpInfo  do
	 	 	 	 AddNumText(  sceneId,  x001100_g_ScriptId,  " Môn Phái - "..mp[1],  9,  i  )
	 	 	 end
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end
	 -- ðµi ngû tß½ng quan 
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
	 	 	 	 x001100_MsgBox(  sceneId,  selfId,  targetId,  "    nhî ðµi ngû thành viên trung hæu nhân hæu tào v§n hóa thß½ng tÕi thân , ngã môn d¸ch trÕm b¤t nång vi nhî ð« cung truy®n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x001100_MsgBox(  sceneId,  selfId,  targetId,  "    nhî hæu tào v§n hóa thß½ng tÕi thân , ngã môn d¸ch trÕm b¤t nång vi nhî ð« cung truy®n t¯ng phøc vø . "  )
	 	 return
	 end

	 -- ki¬m tr¡c Impact trÕng thái trú lßu hi®u quä 
	 for  i,  ImpactId  in  x001100_g_Impact_NotTransportList  do
	 	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  ImpactId)  ~=  0  then
	 	 	 x001100_MsgBox(  sceneId,  selfId,  targetId,  x001100_g_TalkInfo_NotTransportList[i]  )	 	 	 
	 	 	 return  0
	 	 end
	 end

	 -- thu§n lþi truy®n t¯ng 
	 local	 arg	 =  GetNumText()
	 local	 mp
	 local	 i	 	 =  0
	 local	 id	 =  LuaFnGetMenPai(  sceneId,  selfId  )
                local  xiezi=GetHumanMaxVigor(sceneId,selfId)  
	 if  arg  ==  1000  then	 	 -- Quay V« Môn Phái 
	 	 if  id  ==  9  and  xiezi  <  25000  then
	 	 	 x001100_MsgBox(  sceneId,  selfId,  targetId,  "    nhî hoàn mµt hæu gia nh§p nhâm hà Môn Phái ! "  )
	 	 else
	 	 	 mp	 =  x001100_GetMPInfo(  id  )
	 	         if  mp  ~=  nil  then
	 	 	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  mp[2],  mp[3],  mp[4],  11  )
	 	 	 end
	 	         if  id  ==  9  and  xiezi  >  25000  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  197,  87,  151  )
                                end
	 	 end

	 	 return
	 end


    	 if  arg  ==  9999  then	 	 -- Qüy C¯c 
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  197,  87,  151  )
	 	 return
	                 end

    	 if  arg  ==  996  then	 	 -- phßþng minh -- tòng thüy nguy®t Quay V« 
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  158,  120,  75  )
	 	 return
	                 end

	 if  GetNumText()==  997  then	 	 -- huy«n häi 
	       CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  544,  232,  232,  10  );
	 	 return
	 end

	 if  GetNumText()==  998  then	 	 -- ðÕi côn di hài 
	       CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  545,  42,  95,  10  );
	 	 return
	 end

	 if  GetNumText()==  999  then	 	 -- thüy nguy®t ðµng thiên 
	       CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  546,  35,  71,  10  );
	 	 return
	 end

	 if  arg  ==  1001  then	 	 -- LÕc Dß½ng 
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  238,  321  )
	 	 return
	 end
	 if  arg  ==  1002  then	 	 -- LÕc Dß½ng cØu châu 
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  327,  269  )
	 	 return
	 end
	 if  arg  ==  1003  then	 	 -- Tô Châu
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  202,  257  )
	 	 return
	 end
	 if  arg  ==  1004  then	 	 -- Tô Châuthiªt tßþng 
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  333,  224  )
	 	 return
	 end

    	 if  arg  ==  1005  then	 	 -- ÐÕi Lý 
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  253,  122  )
	 	 return
	 end

    	 if  arg  ==  1015  then	 	 -- Lâu Lan 
                  if  GetLevel(  sceneId,  selfId  )  >=  75  then    
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  288,  136,  75  )
	 	 return
	                 end
                            	 x001100_MsgBox(  sceneId,  selfId,  targetId,  "    nhî ðích ðÆng c¤p b¤t túc 75 c¤p , tÕm thì b¤t nång sØ døng . "  )
                                end

    	 if  arg  ==  1020  then	 	 -- phßþng minh 
                  if  GetLevel(  sceneId,  selfId  )  >=  85  then    
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  158,  120,  75  )
	 	 return
	                 end
                            	 x001100_MsgBox(  sceneId,  selfId,  targetId,  "    nhî ðích ðÆng c¤p b¤t túc 85 c¤p , tÕm thì b¤t nång tiªn nh§p thiên hoang c± tr¤n . "  )
                                end
	 for  i,  mp  in  x001100_g_mpInfo  do
	 	 if  arg  ==  i  then
	 	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  mp[2],  mp[3],  mp[4]  )
	 	 	 return
	 	 end
	 end

	 if  GetNumText()==  1016  then	 	 -- Thúc Hà C± Tr¤n 
	 	 --  add  by  zchw
	 	 BeginUICommand(sceneId)
	 	 	 UICommand_AddInt(sceneId,  x001100_g_ScriptId);
	 	 	 --  zchw  fix  Transfer  bug
	 	 	 UICommand_AddInt(sceneId,  targetId);
	 	 	 UICommand_AddString(sceneId,  "GotoShuHeGuZhen");
	 	 	 UICommand_AddString(sceneId,  " Thúc Hà C± Tr¤n vi b¤t gia sát khí tràng cänh , thïnh chú ý an toàn . nhî xác nh§n yªu tiªn nh§p mÕ ? ");
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  24)
	                 
	 	 return
	 end
	 	 
	 if  GetNumText()  ==  2000  then	 	 --
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "#{GOTO_DUNHUANF_SONGSHAN}"  )  
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 
	 	 return
	 end
end
--    add  by  zchw
function  x001100_GotoShuHeGuZhen(  sceneId,  selfId,  targetId  )

	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  420,  200,  211,  20  );
	 return
end
--**********************************
-- cån cß Môn Phái ID hoÕch thü Môn Phái tín tÑc 
--**********************************
function  x001100_GetMPInfo(  mpID  )
	 local	 mp
	 local	 i	 	 =  0
	 for  i,  mp  in  x001100_g_mpInfo  do
	 	 if  mp[5]  ==  mpID  then
	 	 	 return  mp
	 	 end
	 end
	 return  nil
end

--**********************************
-- ð¯i thoÕi song kh¦u tín tÑc ð« kÏ 
--**********************************
function  x001100_MsgBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end