x000203_g_ScriptId  =  000203
x000203_g_Yinpiao  =  40002000

x000203_g_Impact_NotTransportList  =  {  5929,  5944  }  --  c¤m chï truy«n t¯ng ðích Impact
x000203_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}",  "#{XSHCD_20080418_099}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x000203_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 --  ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x000203_g_Yinpiao)>=1    then
	 	 BeginEvent(  sceneId  )
	 	 	 AddText(  sceneId,  "    trên ngß¶i ngß½i có ngân phiªu , ðang chÕy thß½ng ! ta không th¬ giúp giúp ngß½i . "  )
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 return
	 end

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "      #Y HoÕt ðµng NPC , Ði¬m Kích ð¯i Ñng chÑc nång "  )
	 	 --AddNumText(  sceneId,  x000203_g_scriptId,  " #G Tu Luy®n Vû Ý ",  6,  300)
		 AddNumText(  sceneId,  x000203_g_scriptId,  " HoÕt Ðµng M²i Ngày ",  6,  100)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " HoÕt Ðµng Dã NgoÕi ",  6,  200)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x000203_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)

	 x000203_g_scriptId  =  000203
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
	 	 	 	 x000203_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i ðµi ngû thành viên trung có ngß¶i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 	 	 return
	 	 	 end
	 	 end
	 end

	 -- tào v§n tß½ng quan 
	 if  IsHaveMission(sceneId,selfId,4021)  >  0  then
	 	 x000203_MsgBox(  sceneId,  selfId,  targetId,  "    ngß½i có tào v§n \ hàng thß½ng trong ngß¶i , chúng ta d¸ch không th¬ ðÑng vì ngß½i cung c¤p truy«n t¯ng phøc vø . "  )
	 	 return
	 end

	if  GetNumText()  ==  300  then
	       BeginEvent(sceneId)
	 	 --AddText(  sceneId,  "      #Y trân thú chª tÕo , ði¬m kích ð¯i Ñng chÑc nång "  )
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  "#YNhai S½n Ðäo",  9,  301)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  "#YVân Phù",  9,  302)
	 	 
	 	 
	     EndEvent(sceneId)
	     DispatchEventList(sceneId,selfId,targetId)
     end
	 if  GetNumText()  ==  301  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  708,  54,  94,  10  )
                end
				if  GetNumText()  ==  302  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  710,  130,  155,  10  )
                end
	 if  GetNumText()  ==  100  then
	       BeginEvent(sceneId)
	 	 --AddText(  sceneId,  "      #Y trân thú chª tÕo , ði¬m kích ð¯i Ñng chÑc nång "  )
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " Bách Biªn Ph± Di®n ",  9,  101)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " Rút Thåm May M¡n ",  9,  102)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " HÑa Nguy®n Thái H° ",  9,  103)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " ÐÕi Lý Tr°ng Hoa ",  9,  104)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " Nhi®m Vø Ti«n Lß½ng ",  9,  105)
	 	 AddNumText(  sceneId,  x000203_g_scriptId,  " Các HoÕt Ðµng Khác ",  15,  106)
	     EndEvent(sceneId)
	     DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  101  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  263,  259,  10  )
                end

	 if  GetNumText()  ==  102  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  229,  342,  30  )
                end

	 if  GetNumText()  ==  103  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  1,  277,  275,  30  )
                end

	 if  GetNumText()  ==  104  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  185,  71,  30  )
                end

	 if  GetNumText()  ==  105  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  2,  148,  123,  35  )
                end

	 if  GetNumText()  ==  106  then
	       BeginEvent(sceneId)
	 	 AddText(  sceneId,  "#Y Các HoÕt Ðµng Khác : #r    #W1. ði¬m kích trên màn änh phß½ng ðích #G“ phúc hàng thiên long ”#W cái nút , có th¬ t¯n hao nh¤t ð¸nh nguyên bäo tiªn hành c¥u phúc , c¥u phúc nhßng l¤y ðßþc ðÕi lßþng kinh nghi®m . m²i ngày nhßng tiªn hành 3 l¥n c¥u phúc hoÕt ðµng ~#r    2. ði¬m kích bÕn t¯t gi¾i m£t ðích #G“ ðµng tînh ”#W cái nút , có th¬ m· ra #H tø bäo b°n gi¾i m£t #W , m²i gi¶ có th¬ mu¯n tø bäo b°n tång thêm mµt l¥n chúc phúc , tø bäo b°n t§p mãn sau , nhßng l¤y ðßþc ngçu nhiên s¯ lßþng ðích nguyên bäo ~"  )
	     EndEvent(sceneId)
	     DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  200  then
	       BeginEvent(sceneId)
	 	 --AddText(  sceneId,  "      #Y trân thú chª tÕo , ði¬m kích ð¯i Ñng chÑc nång "  )
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff NhÕn Nam BÕo Long ",  10,  201)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Kính H° Ti¬u Long ",  10,  202)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Võ Di Bång Yêu ",  10,  203)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Thß½ng S½n Huy«n Kích Kim Cang ",  10,  204)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Huy«n Vû Ðäo Ðµc Cáp Vß½ng ",  10,  205)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Thäo Nguyên BÕch Minh Kh·i ",  10,  206)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Thánh Thú S½n Long Quy ",  10,  207)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Thánh Thú S½n Bäo Rß½ng ",  10,  208)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Ngân Nga Tuyªt Nguyên ",  10,  209)
	 	 AddNumText(  sceneId,  x002026_g_scriptId,  "#c00ffff Thái Hoàng Th¥n Vñc ",  10,  210)
	     EndEvent(sceneId)
	     DispatchEventList(sceneId,selfId,targetId)
                end

	 if  GetNumText()  ==  201  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  18,  235,  88,  70  )
	 end

	 if  GetNumText()  ==  202  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  5,  236,  89,  70  )
	 end

	 if  GetNumText()  ==  203  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  32,  101,  122,  70  )
	 end

	 if  GetNumText()  ==  204  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  25,  162,  71,  70  )
	 end

	 if  GetNumText()  ==  205  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  39,  162,  43,  70  )
	 end

	 if  GetNumText()  ==  206  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  20,  225,  255,  70  )
	 end

	 if  GetNumText()  ==  207  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  158,  164,  46,  70  )
	 end

	 if  GetNumText()  ==  208  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  158,  137,  130,  70  )
	 end

                if  GetNumText()  ==  209  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  188,  74,  41,  70  )
	 end
	 
                if  GetNumText()  ==  210  then
	 	 CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  508,  160,  160,  70  )
	 end
end