-- Phiªu Mi¬u Phong phó bän ....
-- h¡c ðÕi phách ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x890070_g_ScriptId  =  890070

-- phó bän suy lu§n chân v¯n s¯ ....
x890070_g_FuBenScriptId  =  890063

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x890070_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  " Thi¬u Th¤t S½n là c¤m ð¸a môn phái, kë nào mu¯n xông vào, thì hãy nh§n l¤y cái chªt. "  )
	 	 AddNumText(  sceneId,  x890070_g_ScriptId,  " Quyªt Chiªn ",  10,  1  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x890070_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x890070_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
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
	 local  ret,  msg  =  CallScriptFunction(  x890070_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x890070_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x890070_g_ScriptId,  -1  ,-1  )

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x890070_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 if  7  ==  step  then
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 5 giây  "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 4 giây "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 3 giây "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 2 giây "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 1 giây "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " b¡t ð¥u chiªn ð¤u "  )
	 	 -- thü tiêu NPC....
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "JiuMoZhi_NPC"  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x890070_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "JiuMoZhi_BOSS",  -1,  -1  )
	 	 return
	 end

end