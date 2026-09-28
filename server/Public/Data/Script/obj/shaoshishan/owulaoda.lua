-- Phiªu Mi¬u Phong phó bän ....
-- ô lão ðÕi ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x890072_g_ScriptId  =  890072

-- phó bän suy lu§n chân v¯n s¯ ....
x890072_g_FuBenScriptId  =  890063

-- chiªn bÕi ô lão ðÕi ð¯i thoÕi chân v¯n s¯ ....
x890072_g_LossScriptId  =  890075

--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x890072_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 BeginEvent(sceneId)

	 	 AddText(  sceneId,  " Hßng phøc ÐÕi Yªn ðã vô v÷ng, các ngß½i còn t¾i qu¤y r¥y ta. Thiên ðß¶ng có l¯i ngß½i không ði, ð¸a ngøc không cØa ngß½i lÕi vào! "  )
	 	 AddNumText(  sceneId,  x890072_g_ScriptId,  " Khiêu Chiªn ",  10,  1  )

	 	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn lý thu thüy ....	 
	 	 --if  1  ==  CallScriptFunction(  x890072_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "DingChunQiu"  )  then
	 	 	 --AddNumText(  sceneId,  x890072_g_ScriptId,  " quyªt chiªn lý thu thüy ? ",  10,  2  )
	 	 --end

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x890072_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x890072_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
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
	 local  ret,  msg  =  CallScriptFunction(  x890072_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 if  GetNumText()  ==  1  then

	 	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn ô lão ðÕi ....	 
	 	 if  1  ~=  CallScriptFunction(  x890072_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "MuRongFu"  )  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(  sceneId,  "#{PMF_20080521_11}"  )
	 	 	 EndEvent(sceneId)
	 	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 	 return
	 	 end
	 	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x890072_g_ScriptId,  -1  ,-1  )

	 elseif  GetNumText()  ==  2  then

	 	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn lý thu thüy ....	 
	 	 if  1  ~=  CallScriptFunction(  x890072_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "DingChunQiu"  )  then
	 	 	 return
	 	 end
	 	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt lý thu thüy ....
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x890072_g_LossScriptId,  -1  ,-1  )

	 end

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x890072_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 if  7  ==  step  then
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 5 giây "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 4 giây "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 3 giây "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 2 giây "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u sau 1 giây "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " b¡t ð¥u chiªn ð¤u, dzôôôôôôôô "  )
	 	 -- thü tiêu NPC....
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "MuRongFu_NPC"  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x890072_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "MuRongFu_BOSS",  -1,  -1  )
	 	 return
	 end

end