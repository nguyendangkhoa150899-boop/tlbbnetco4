x000208_g_ScriptId  =  000208
x000208_g_Yinpiao  =  40002000

x000208_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000208_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000208_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000208_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 --AddText(  sceneId,  "      #Y kªt hôn ðích nhà ch½i , có th¬ kích hoÕt vþ ch°ng kÛ nång . kªt bái ðích nhà ch½i , có th¬ kích hoÕt kim lan tr§n pháp kÛ nång . "  )
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Ta Mu¯n Làm Ð©p",  3,  100)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " H÷c T§p Phò Trþ KÛ Nång ",  3,  200)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Ð±i V§t Ph¦m - Trang B¸ ",  3,  300)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " >>>Ði CØu Châu Thß½ng Hµi- M· ti®m ",  9,  400)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000208_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000208_g_scriptId  =  000208
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
	 	 	 	 x000208_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000208_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end

	 if  GetNumText()  ==  100  then
	       BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Ta có th¬ ðßa các hÕ ðªn ch² làm ð©p, các hÕ s¨ ð©p vl luôn... #1~"  )
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Nhuµm Tóc - Ð±i Ki¬u Tóc ",  9,  101)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Thay N«n Nhân V§t - Ð±i M£t",  9,  102)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Nhuµm Th¶i Trang - Ði¬m Chuª ",  9,  103)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Ta Mu¯n Ð±i Tên ",  9,  104)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Ta Mu¯n qua Thái Lan Chuy¬n gi¾i ",  9,  105)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Thú H°n Phø Th¬ ",  9,  106)
	     EndEvent(sceneId)
	     DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  101  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  348,  271,  10  )
                end

	 if  GetNumText()  ==  102  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  351,  271,  10  )
                end

	 if  GetNumText()  ==  103  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  344,  271,  10  )
                end

	 if  GetNumText()  ==  104  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  238,  252,  10  )
                end

	 if  GetNumText()  ==  105  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  172,  359,  10  )
                end

	 if  GetNumText()  ==  106  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  173,  233,  10  )
                end

	 if  GetNumText()  ==  200  then
	       BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y H÷c chª ð° tinh thiªt, väi bông, bí ngân, ð° chª 9x, chª luy®n phù thì qua ðây nhé!"  )
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " Tinh Chª - Tinh Luy®n - Tinh Công ",  9,  201)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  " H÷c chª Luy®n Ð¸nh V¸ Phù ",  9,  202)
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  201  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  363,  247,  10  )
                end

	 if  GetNumText()  ==  202  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  29,  239,  30  )
                end

	 if  GetNumText()  ==  300  then
	       BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Kích hoÕt thë GiftCode Ho£c ð±i trang b¸ Ám Khí, Trùng Lâu..."  )
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  "Ð±i Trùng Lâu - Ð±i Trang B¸ ",  9,  301)
	 	 AddNumText(  sceneId,  x000208_g_scriptId,  "Kích HoÕt GiftCode - CODE VIP ",  9,  302)
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  301  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  265,  255,  10  )    -- cái này t÷a ðµ hÕt viªt , ðªn lúc ðó ð±i 
                end

	 if  GetNumText()  ==  302  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  156,  170,  10  )
                end

	 if  GetNumText()  ==  400  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  329,  296,  10  )
                end


end

