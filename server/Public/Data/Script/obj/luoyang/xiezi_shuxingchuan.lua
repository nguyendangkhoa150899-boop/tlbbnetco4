x000206_g_ScriptId  =  000206
x000206_g_Yinpiao  =  40002000

x000206_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000206_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000206_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000206_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Thuµc tính tång lên , ði¬m kích ð¯i Ñng chÑc nång "  )
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " Trân Thú KÛ Nång ",  6,  100)
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " >>>Con Cái -Nuôi DÕy ",  9,  200)
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " >>>Tu Luy®n Thuµc Tính",  9,  300)
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " >>>Ngû Tuy®t Bí T¸ch ",  9,  400)
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " >>>Chân Nguyên Ngßng Tø ",  9,  500)
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " >>>Ngû Hành Bäo Giám ",  9,  600)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000206_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000206_g_scriptId  =  000206
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
	 	 	 	 x000206_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000206_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end


	 if  GetNumText()  ==  100  then
	       BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Ta có th¬ ðßa các hÕ ði ðªn n½i luy®n kill pet, hoàn ð°ng, nâng ngµ tính... "  )
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " Trân Thú Hoàn ð°ng - H÷c Kill Pet",  9,  101)
	 	 AddNumText(  sceneId,  x000206_g_scriptId,  " Nâng Ngµ Tính Trân Thú",  9,  102)
	     EndEvent(sceneId)
	     DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  101  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  277,  295,  10  )
                end

	 if  GetNumText()  ==  102  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  173,  237,  10  )
                end


	 if  GetNumText()  ==  200  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  149,  184,  50  )
                end

	 if  GetNumText()  ==  300  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  242,  30,  70  )
                end

	 if  GetNumText()  ==  400  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  218,  239,  75  )
                end

	 if  GetNumText()  ==  500  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  351,  228,  80  )
                end

	 if  GetNumText()  ==  600  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  248,  219,  85  )
                end
end











