-- tr× ác thiên kiªp lâu   ## Tß Mã tiêu dao   chæa tr¸ 
-- tr× ác vø tçn 
-- phó cß¾p sinh 

x895105_g_ScriptId	 =  895105
x895105_g_Yinpiao  =  40002000
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x895105_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có " ngân phiªu " v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x895105_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i b¢ng hæu có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp b¢ng hæu . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 local	 mp
	 local	 i	 	 =  0
	 BeginEvent(  sceneId  )
                                if  GetLevel(  sceneId,  selfId  )  >=  80  then
                                                AddText(  sceneId,  "    Giang H° rµng l¾n c¥n b¢ng hæu hành hi®p trßþng nghîa, Thiên Kiªp Lâu nhö bé b¢ng hæu không c¥n tr· lÕi næa, xin cung ti­n b¢ng hæu "  )
	 	 elseif  GetLevel(  sceneId,  selfId  )  >=  10  then
	 	 	 AddText(  sceneId,  "#{TJL_090714_01}"  )
	 	 	 AddNumText(  sceneId,  x895105_g_ScriptId,  "#gFF7F24 Ði ðªn Thiên Kiªp Lâu ",  9,  1001  )
	 	 else
	 	 	 AddText(  sceneId,  "    thiên kiªp lâu hung hi¬m d¸ thß¶ng , c¤p b§c chßa ðü 10 c¤p , còn là ð×ng ði mÕo hi¬m . "  )
	 	 end
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x895105_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

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
	 	 	 	 x895105_MsgBox(  sceneId,  selfId,  targetId,  "    b¢ng hæu ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , ta không th¬ ðßa các b¢ng hæu ði thiên kiªp lâu . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x895105_MsgBox(  sceneId,  selfId,  targetId,  "    b¢ng hæu có tào v§n \ hàng thß½ng trong ngß¶i , ta không th¬ ðßa b¢ng hæu ði thiên kiªp lâu . "  )
	 	 return
	 end

                local  mylevel  =  GetLevel(  sceneId,  selfId  )
                local  iniLevel  
                            iniLevel  =  floor(  mylevel/10  )  *  10
	 if  GetNumText()  ==  1001  then	 	 -- tr× ác thiên kiªp lâu 
                          if  iniLevel  ==  10  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          elseif  iniLevel  ==  20  then
                                CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          elseif  iniLevel  ==  30  then
                                CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          elseif  iniLevel  ==  40  then
                                CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          elseif  iniLevel  ==  50  then
                                CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          elseif  iniLevel  ==  60  then
                                CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          elseif  iniLevel  ==  70  then
                                CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  492,  82,  78,  10  );
                          end
	           return
	 end


end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x895105_MsgBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end