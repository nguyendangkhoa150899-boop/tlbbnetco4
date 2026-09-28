x000204_g_ScriptId  =  000204
x000204_g_Yinpiao  =  40002000

x000204_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000204_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000204_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000204_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Võ Lâm suy tàn anh hùng hµi, Giang H° Chinh Chiªn kh¡p Càn Khôn, mu¯n l§p công danh hi¬n hÕch thì t¾i g£p ta "  )
	 	 AddNumText(  sceneId,  x000204_g_scriptId,  " Chiªn Trß¶ng Trác Lµc ",  10,  100)
	 	 AddNumText(  sceneId,  x000204_g_scriptId,  " Chiªn Trß¶ng Tranh Bá ",  10,  200)
	 	 AddNumText(  sceneId,  x000204_g_scriptId,  " Chiªn Trß¶ng T¯ng Liêu ",  10,  300)
	 	 AddNumText(  sceneId,  x000204_g_scriptId,  " Phøng Hoàng Tranh Bá ",  10,  400)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000204_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000204_g_scriptId  =  000204
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
	 	 	 	 x000204_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000204_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end

	 if  GetNumText()  ==  100  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  361,  192,  45  )
                end

	 if  GetNumText()  ==  200  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  349,  226,  70  )
                end

	 if  GetNumText()  ==  300  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  291,  240,  70  )
                end

	 if  GetNumText()  ==  400  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  420,  149,  150,  70  )
                end


end