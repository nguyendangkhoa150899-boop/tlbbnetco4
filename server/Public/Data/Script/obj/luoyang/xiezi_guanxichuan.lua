x000207_g_ScriptId  =  000207
x000207_g_Yinpiao  =  40002000

x000207_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000207_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000207_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000207_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y kªt hôn ðích nhà ch½i , có th¬ kích hoÕt vþ ch°ng kÛ nång . kªt bái ðích nhà ch½i , có th¬ kích hoÕt kim lan tr§n pháp kÛ nång . "  )
	 	 AddNumText(  sceneId,  x000207_g_scriptId,  " Ta mu¯n Kªt Hôn ",  13,  100)
	 	 AddNumText(  sceneId,  x000207_g_scriptId,  " Ta mu¯n Kªt Bái ",  13,  200)
	 	 AddNumText(  sceneId,  x000207_g_scriptId,  " Ta mu¯n L§p Bang",  13,  300)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000207_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000207_g_scriptId  =  000207
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
	 	 	 	 x000207_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000207_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end

	 if  GetNumText()  ==  100  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  142,  184,  20  )
                end

	 if  GetNumText()  ==  200  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  242,  202,  20  )
                end


	 if  GetNumText()  ==  300  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  238,  236,  20  )
                end

end

