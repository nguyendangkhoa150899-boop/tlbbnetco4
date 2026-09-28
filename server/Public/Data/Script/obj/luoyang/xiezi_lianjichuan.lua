x000202_g_ScriptId  =  000202
x000202_g_Yinpiao  =  40002000

x000202_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000202_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000202_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000202_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Các hÕ mu¯n ði ðâu ð¬ luy®n c¤p, xin m¶i lña ch÷n map phù hþp : "  )
	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "[C¤p 30 - 70]: Yªn Vß½ng C± Mµ ",  8,  100)
	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "[C¤p 70 - 90]: T¥n Hoàng Ð¸a Cung ",  8,  200)
                                AddNumText(  sceneId,  x000202_g_ScriptId,  "[C¤p 90 - 119] Tây Vñc ",  8,  300)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000202_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000202_g_ScriptId  =  000202
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
	 	 	 	 x000202_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000202_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end


	 if  GetNumText()  ==  100  then
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "      #Y Yªn Vß½ng C± Mµ , thích hþp 30-70 c¤p ðích nhà ch½i luy®n c¤p . t¥ng thÑ nåm ? t¥ng thÑ tám r½i xu¯ng trân thú #G[ lØa tông thØ ]#Y cùng #G[ huy«n dñc thú ]#Y . c± mµ toàn bµ vì không thêm sát khí cänh tßþng , chú ý an toàn ~"  )
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 1 ",  9,  101)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 2 ",  9,  102)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 3 ",  9,  103)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 4 ",  9,  104)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 5  ",  9,  105)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 6  ",  9,  106)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 7  ",  9,  107)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 8  ",  9,  108)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Yªn Vß½ng C± Mµ 9  ",  9,  109)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if  GetNumText()  ==  101  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  159,  67,  82,  30  )
	 end

	 if  GetNumText()  ==  102  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  160,  78,  91,  30  )
	 end


	 if  GetNumText()  ==  103  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  161,  16,  23,  40  )
	 end

	 if  GetNumText()  ==  104  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  162,  102,  22,  40  )
	 end


	 if  GetNumText()  ==  105  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  163,  28,  28,  50  )
	 end

	 if  GetNumText()  ==  106  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  164,  65,  101,  50  )
	 end


	 if  GetNumText()  ==  107  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  165,  25,  100,  60  )
	 end


	 if  GetNumText()  ==  108  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  166,  18,  20,  60  )
	 end

	 if  GetNumText()  ==  109  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  167,  23,  16,  65  )
	 end


	 if  GetNumText()  ==  200  then
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "      #Y T¥n Hoàng Ð¸a Cung , thích hþp 70-90 c¤p ðích nhà ch½i luy®n c¤p . t¥ng thÑ tß vì không thêm sát khí cänh tßþng , chú ý an toàn . "  )
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#c00ffff T¥n Hoàng Ð¸a Cung 1 ",  9,  201)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#c00ffff T¥n Hoàng Ð¸a Cung 2 ",  9,  202)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#c00ffff T¥n Hoàng Ð¸a Cung 3 ",  9,  203)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 T¥n Hoàng Ð¸a Cung 4 ",  9,  204)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if  GetNumText()  ==  201  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  400,  111,  151,  70  )
	 end

	 if  GetNumText()  ==  202  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  401,  206,  225,  75  )
	 end

	 if  GetNumText()  ==  203  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  402,  221,  216,  75  )
	 end

	 if  GetNumText()  ==  204  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  538,  37,  38,  75  )
	 end



	 if  GetNumText()  ==  300  then
	 	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  "      #Y Tây Vñc c± qu¯c , thích hþp 90-119 c¤p ðích nhà ch½i luy®n c¤p . ð«u vì không thêm sát khí cänh tßþng , chú ý an toàn . "  )
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Höa Di®m S½n ",  9,  301)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Cao Xß½ng Mê Cung ",  9,  302)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Tháp Kh¡c Lý Mµc ",  9,  303)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Côn Lôn Phúc Ð¸a ",  9,  304)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 HÕn Huyªt Lînh ",  9,  305)
	 	 	 AddNumText(  sceneId,  x000202_g_ScriptId,  "#cFF0000 Thánh Höa Cung ",  9,  306)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 end

	 if  GetNumText()  ==  301  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  519,  75,  38,  90  )
	 end


	 if  GetNumText()  ==  302  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  520,  100,  99,  90  )
	 end


	 if  GetNumText()  ==  303  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  427,  42,  28,  90  )
	 end


	 if  GetNumText()  ==  304  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  421,  77,  39,  90  )
	 end


	 if  GetNumText()  ==  305  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  432,  86,  94,  90  )
	 end

	 if  GetNumText()  ==  306  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  537,  26,  66,  90  )
	 end

end