-- Phiªu Mi¬u Phong phó bän ....
-- h¡c ðÕi phách ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x894003_g_ScriptId  =  894003

-- phó bän suy lu§n chân v¯n s¯ ....
x894003_g_FuBenScriptId  =  894000

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x894003_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(sceneId)
	     local  bossId  =  CallScriptFunction(  x894003_g_FuBenScriptId,  "FindBOSS",  sceneId,  "HUAYAO_FENGYIN"  )
                    if  bossId  >=  0  then
	 	 AddText(  sceneId,  "Tam th¥n thú huy­n tßþng chï còn lÕi thÑ nh¤t , chß v¸ cñ #G ngû hành chi bäo #W chï có mµt bß¾c chi diêu , nhß thª kh¦n yªu quan ð¥u , chß v¸ vÕn vÕn không th¬ thß giän . #r        ngü say n½i này ðích chính là #R nhiªp linh c± hoa #W chi huy­n tßþng , tuy không bän th¬ ðßþc ôn thiên hÕ ch¤n nhiªp thiên ð¸a chi ðµc , cûng c¥n võ ngh® siêu qu¥n hÕng ngß¶i lÕi v×a ð¸ch n±i . tÕi hÕ t¤t nhiên tin tß·ng chß v¸ khä nång , nhßng vçn phäi nh¡c nh· chß v¸ c¦n th§n này hung v§t . "  )
	 	 AddNumText(  sceneId,  x894003_g_ScriptId,  "Khiêu chiªn",  6,  1  )
	 	 AddNumText(  sceneId,  x894003_g_ScriptId,  "R¶i ði ",  6,  2  )
                    else
	 	 AddText(  sceneId,    "không h± là ðÕi vû ðích h§u nhân , quä nhiên kiêu dûng d¸ thß¶ng . thiªu hi®p hôm nay s· hành chuy®n tình , nh¤t ð¸nh là tÕo phúc vÕn dân to l¾n kª . còn ðây là xã t¡c chi phúc , thß½ng sinh may m¡n . mong r¢ng thiªu hi®p a tiªp tøc tinh tiªn , tång lên tu vi , ti«n ð° nh¤t ð¸nh b¤t khä hÕn lßþng ! "  )
	 	 AddNumText(  sceneId,  x894003_g_ScriptId,  "R¶i ði",  6,  2  )
                    end
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x894003_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  GetNumText()  ==  2  then
                      NewWorld(sceneId,  selfId,580,286,81)
                return
                end

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x894003_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
	 	 return
	 end

	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  "#{PMF_20080521_07}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end

	 -- nªu nhß ðang cùng khác BOSS chiªn ð¤u là tr· v« ....
	 local  ret,  msg  =  CallScriptFunction(  x894003_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x894003_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x894003_g_ScriptId,  -1  ,-1  )

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x894003_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 local  bossId  =  CallScriptFunction(  x894003_g_FuBenScriptId,  "FindBOSS",  sceneId,  "HUAYAO_FENGYIN"  )
                if  bossId  <  0  then
	 	 return        -- n½i này dùng ð¬ ð¯i phó thao ðän nhà ch½i 
	 end

	 if  7  ==  step  then
	 	 -- thü tiêu NPC....
	 	 --CallScriptFunction(  x894003_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "CANGLINGZI_3"  )
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 5 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 4 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 3 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 2 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 1 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "HUAYAO_FENGYIN"  )
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x894003_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "HUAYAO_BOSS",  -1,  -1  )
	 	 return
	 end

end