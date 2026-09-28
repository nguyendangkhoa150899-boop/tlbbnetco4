-- Phiªu Mi¬u Phong phó bän ....
-- chiªn bÕi ô lão ðÕi ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x890075_g_ScriptId  =  890075

-- phó bän suy lu§n chân v¯n s¯ ....
x890075_g_FuBenScriptId  =  890063


--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x890075_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  " Ta là Ðinh Xuân Thu, mu¯n cùng ta chiªn ð¤u ß!, trß¾c tiên ngß½i hãy ðánh bÕi nhæng khác ð¯i thü khác r°i hãy nói! ngß½i hãy c¦n th§n toàn thay tr· lÕi ðây ð¬ cùng ta phân ð¸nh cao th¤p !"  )

	 	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn lý thu thüy ....	 
	 	 if  1  ==  CallScriptFunction(  x890075_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "DingChunQiu"  )  then
	 	 	 AddNumText(  sceneId,  x890075_g_ScriptId,  " quyªt chiªn Ðinh Xuân Thu ? ",  10,  1  )
	 	 end

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x890075_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x890075_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
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

	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn lý thu thüy ....	 
	 if  1  ~=  CallScriptFunction(  x890075_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "DingChunQiu"  )  then
	 	 return
	 end

	 -- nªu nhß ðang cùng khác BOSS chiªn ð¤u là tr· v« ....
	 local  ret,  msg  =  CallScriptFunction(  x890075_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x890075_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  7,  x890075_g_ScriptId,  -1  ,-1  )
	 
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x890075_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 if  7  ==  step  then
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 5 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 4 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 3 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 2 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 1 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 --local  nMonsterNum  =  GetMonsterCount(sceneId)
	 --for  i=0,  nMonsterNum-1  do
	 	 --local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 --if  42206  ==  GetMonsterDataID(  sceneId,  MonsterId  )  then
	 	 	 --LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 	 --LuaFnSendSpecificImpactToUnit(sceneId,  MonsterId,  MonsterId,  MonsterId,  152,  0)
	 	 	 --SetCharacterDieTime(  sceneId,  MonsterId,  1000  )
	 	 --end
	 --end
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "DingChunQiu_NPC"  )
	 	 return
	 end
	 if  1  ==  step  then
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x890075_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "DingChunQiu_BOSS",  -1,  -1  )
	 	 return
	 end

end