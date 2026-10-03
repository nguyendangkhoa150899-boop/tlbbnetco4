x000201_g_ScriptId  =  000201
x000201_g_Yinpiao  =  40002000

x000201_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000201_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000201_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000201_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y Mu¯n ði phø bÕn, ta có th¬ ðßa các hÕ ðªn ðó: "  )
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  " Phø Bän Thß¶ng ",  6,  1)
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  " Phø Bän Khó ",  6,  2)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000201_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000201_g_scriptId  =  000201
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
	 	 	 	 x000201_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000201_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end


	 if  GetNumText()  ==  1  then
	       BeginEvent(sceneId)
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=10 c¤p ]  Trân Long KÏ Cuµc ",  10,  404)--0  364  228
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=30 c¤p ]  Túc C¥u ",  10,  405)--0  298  192
                                AddNumText(  sceneId,  x000201_g_scriptId,  "[=40 c¤p ]  Q Tô Châu ",  10,  406)--1  133  258
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=75 c¤p ]  Q Lâu Lan ",  10,  415)--186  296  72
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=75 c¤p ]  Lâu Lan T¥m Bäo  ",  10,  409)--186  163  79
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=75 c¤p ]  Thiên Long Äo Cänh",  10,  408)--186  178  117
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId,targetId)
	 end


	 if  GetNumText()  ==  2  then
	       BeginEvent(sceneId)
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=90 c¤p ]  Thäo PhÕt Yªn TØ Ô",  10,  411)--4    69  120
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=75 c¤p ]  Phiªu Mi¬u Phong ",  10,  413)  --186  189  218
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=90 c¤p ]  TÑ Tuy®t Trang",  10,  414)  --1  195  214
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=90 c¤p ]  Thiªu Th¤t S½n ",  10,  410)--2  70  59
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=108 c¤p ]  Huyªt Chiªn NhÕn Môn Quan ",  10,  412)--0    295  224
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=80 c¤p ]  Sát Tinh ",  10,  401)--2  131  77
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=75 c¤p ]  Hß Không Huy«n Cänh ( mµt ngß¶i )",  10,  403)--0  217  242
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=75 c¤p ]  Lang Huyên Phúc Ð¸a",  10,  407)  --2  293  91
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=80 c¤p ]  Binh Thánh KÏ Tr§n ",  10,  402)--186  205  175
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=85 c¤p ]  Phøng Minh Vß½ng Lång ",  10,  416)--580  288  67
	 	 AddNumText(  sceneId,  x000201_g_scriptId,  "[=85 c¤p ]  #G Tam Th¥n Äo Cänh",  10,  417)--580  286  81
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId,targetId)
	 end


	 if  GetNumText()  ==  401  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  131,  77,  75  )
	 end

	 if  GetNumText()  ==  402  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  205,  175,  80  )
	 end

	 if  GetNumText()  ==  403  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  217,  242,  75  )
	 end

	 if  GetNumText()  ==  404  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  364,  228,  10  )
	 end
	 
	 if  GetNumText()  ==  405  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  298,  192,  30  )
	 end
	 
	 if  GetNumText()  ==  406  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  133,  258,  40  )
	 end
	 
	 if  GetNumText()  ==  407  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  293,  91,  75  )
	 end
	 
	 if  GetNumText()  ==  408  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  178,  117,  75  )
	 end
	 
	 if  GetNumText()  ==  409  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  163,  79,  75  )
	 end
	 
	 if  GetNumText()  ==  410  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  70,  59,  75  )
	 end
	 
	 if  GetNumText()  ==  411  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  4,  69,  120,  75  )
	 end
	 
	 if  GetNumText()  ==  412  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  0,  295,  224,  75  )
	 end
	 
	 if  GetNumText()  ==  413  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  189,  218,  75  )
	 end
	 
	 if  GetNumText()  ==  414  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  195,  214,  75  )
	 end
	 
	 if  GetNumText()  ==  415  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  186,  296,  72,  75  )
	 end

	 if  GetNumText()  ==  416  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  288,  67,  85  )
	 end

	 if  GetNumText()  ==  417  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  580,  286,  81,  85  )
	 end

end