x000205_g_ScriptId  =  000205
x000205_g_Yinpiao  =  40002000

x000205_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000205_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000205_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000205_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Toàn Bµ h® Th¯ng Trang B¸ ð«u · ðây, m¶i các hÕ lña ch÷n chÑc nång c¥n ði ðªn: "  )
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Trang B¸ Tß½ng Quan ",  6,  100)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Th¥n Khí Tß½ng Quan ",  6,  200)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Ám Khí Tß½ng Quan ",  6,  300)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " >>>Võ H°n Tß½ng Quan ",  9,  400)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " >>>Long Vån Tß½ng Quan ",  9,  500)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " >>>Bá Vß½ng L®nh Tß½ng Quan ",  9,  600)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " >>>Hào Hi®p Ân Tß½ng quan ",  9,  700)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000205_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000205_g_scriptId  =  000205
	 -- ðµi ngû Tß½ng Quan 
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
	 	 	 	 x000205_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n Tß½ng Quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000205_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end



	 if  GetNumText()  ==  100  then
	 	 BeginEvent(  sceneId  )
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Trang B¸ Ðøc-Tháo-Khäm",  9,  101)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Trang B¸ Cß¶ng Hóa-Giám Ð¸nh-Kh¡c Minh ",  9,  102)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Trang B¸ Ðiêu Vån ",  9,  103)--0  364  228
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Trang B¸ Tinh Thông ",  9,  104)--1  361  242
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Trang B¸ Thång Linh Vß½ng Quy«n ",  9,  105)--0  364  228
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if  GetNumText()  ==  101  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  279,  320,  10  )
	 end

	 if  GetNumText()  ==  102  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  305,  292,  10  )
	 end

	 if  GetNumText()  ==  103  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  319,  315,  10  )
	 end

	 if  GetNumText()  ==  104  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  361,  242,  10  )
	 end

	 if  GetNumText()  ==  105  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  153,  77,  85  )
	 end


	 if  GetNumText()  ==  200  then
	 	 BeginEvent(  sceneId  )
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Th¥n Khí Chª TÕo ",  9,  201)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Th¥n Khí Luy®n H°n ",  9,  202)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Thßþng C± Th¥n Khí Chª TÕo ",  9,  203)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  "#G Ð±i Trùng Lâu/Nâng C¤p Chân-Trùng Lâu ",  9,  204)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if  GetNumText()  ==  201  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  352,  233,  10  )
	 end

	 if  GetNumText()  ==  202  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  352,  238,  10  )
	 end

	 if  GetNumText()  ==  203  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  195,  217,  85  )
	 end

	 if  GetNumText()  ==  204  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  262,  254,  50  )
	 end

	 if  GetNumText()  ==  300  then
	 	 BeginEvent(  sceneId  )
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Ð±i [ Hoa Mai Thiêu ]",  9,  301)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Lên C¤p [ Bång Phách Th¥n Châm ]",  9,  302)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " Ám Khí Chª TÕo Tß½ng Quan ",  9,  303)
	 	 AddNumText(  sceneId,  x000205_g_scriptId,  " #GKim Sí Linh Vû Tß½ng Quan ",  9,  304)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end


	 if  GetNumText()  ==  301  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  212,  322,  10  )
	 end

	 if  GetNumText()  ==  302  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  136,  119,  75  )
	 end

	 if  GetNumText()  ==  303  or  GetNumText()  ==  304  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  209,  342,  10  )
	 end


	 if  GetNumText()  ==  400  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  143,  194,  65  )
	 end

	 if  GetNumText()  ==  500  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  152,  69,  85  )
	 end


	 if  GetNumText()  ==  600  or  GetNumText()  ==  700  then
	 	 -- có hay không · tào v§n 
	 	 local  haveImpact  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  113)
	 	 if  haveImpact  ==  1  then
	 	 	 	 BeginEvent(sceneId)
	 	 	 	 	 strText  =  " th§t xin l²i , ngài bây gi¶ xØ vu chuy¬n v§n trÕng thái . "
	 	 	 	 	 AddText(sceneId,strText);
	 	 	 	 EndEvent(sceneId)
	 	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 	 return
	 	 end
	 	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 	 if  GetItemCount(sceneId,  selfId,  x000205_g_Yinpiao)>=1    then
	 	 	 BeginEvent(  sceneId  )
	 	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 	 EndEvent(  sceneId  )
	 	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end

	 	 if  IsShutout(  sceneId,  selfId,  ONOFF_T_GUILD  )  ==  -1  then
	 	       BeginEvent(  sceneId  )
                                            AddText(  sceneId,  "        loÕi này Trang B¸ c¥n ðang giúp s¨ thành ph¯ chª tÕo , ngß½i hay là trß¾c gia nh§p mµt bang hµi ði ! "  )
	 	             EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      return
                                end

	 	 if(CityGetSelfCityID(sceneId,  selfId)  ~=  -1)  then
	 	       CityMoveTo(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )
                                            AddText(  sceneId,  "        ngß½i bang hµi cûng không  có thân thïnh thành ph¯ , vì v§y ngß½i không th¬ ðánh tÕo loÕi này Trang B¸ ! "  )
	 	             EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	               end
                end

end


