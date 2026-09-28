-- Phiªu Mi¬u Phong phó bän ....
-- phù mçn nghi ð¯i thoÕi chân v¯n ....

-- chân v¯n s¯ 
x890073_g_ScriptId  =  890073

-- phó bän suy lu§n chân v¯n s¯ ....
x890073_g_FuBenScriptId  =  890063

-- ch¤n nhiªp buff bi¬u ....
x890073_g_ZhenSheBuffTbl  =  {  10264,  10265,  10266  }
-- thú v¸ buff bi¬u ....
x890073_g_YouQuBuffTbl  =  {  10261,  10262,  10263  }


--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ ....
--**********************************
function  x890073_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  "Thiªu Hi®p nªu mu¯n · Thiªu Th¤t S½n quyªt chiªn, trß¾c hªt hãy ðánh bÕi Trang Tø Hi«n cùng Mµ Dung phøc, r°i hãy tr· lÕi ta ch² này tiªp tøc chiªn ð¤u. "  )

	 	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn song tØ ....	 
	 	 if  1  ==  CallScriptFunction(  x890073_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "ShuangZi"  )  then
	 	 	 AddNumText(  sceneId,  x890073_g_ScriptId,  " Khiêu Chiªn Hung Th¥n Ác Sát ",  10,  1  )
	 	 end

	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x890073_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 -- nªu nhß ðang kích hoÕt BOSS là tr· v« ....
	 if  1  ==  CallScriptFunction(  x890073_g_FuBenScriptId,  "IsPMFTimerRunning",  sceneId  )  then
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

	 -- phán ðoán trß¾c m£t có ðßþc hay không khiêu chiªn song tØ ....	 
	 if  1  ~=  CallScriptFunction(  x890073_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "ShuangZi"  )  then
	 	 return
	 end

	 -- nªu nhß ðang cùng khác BOSS chiªn ð¤u là tr· v« ....
	 local  ret,  msg  =  CallScriptFunction(  x890073_g_FuBenScriptId,  "CheckHaveBOSS",  sceneId  )
	 if  1  ==  ret  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  msg  )
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end

	 -- m· ra Phiªu Mi¬u Phong tính gi¶ khí t¾i kích hoÕt mình ....
	 CallScriptFunction(  x890073_g_FuBenScriptId,  "OpenPMFTimer",  sceneId,  16,  x890073_g_ScriptId,  -1  ,-1  )
	 
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

end

--**********************************
-- Phiªu Mi¬u Phong tính gi¶ khí ðích OnTimer....
--**********************************
function  x890073_OnPMFTimer(  sceneId,  step,  data1,  data2  )

	 if  16  ==  step  then
	 	 MonsterTalk(sceneId,  -1,  "",  "#{CJG_101231_165}"  )
	 	 return
	 end

	 if  13  ==  step  then
	 	 MonsterTalk(sceneId,  -1,  "",  "#{CJG_101231_164}"  )
	 	 return
	 end

	 if  10  ==  step  then
	 	 MonsterTalk(sceneId,  -1,  "",  "#{CJG_101231_170}"  )
	 	 return
	 end

	 if  7  ==  step  then
	 	 MonsterTalk(sceneId,  -1,  "",  "#{CJG_101231_181}"  )
	 	 x890073_UseZhenShe(  sceneId  )
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 5 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  6  ==  step  then
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 4 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  5  ==  step  then
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 3 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  4  ==  step  then
	 	 MonsterTalk(sceneId,  -1,  "",  "#{PMF_20080530_04}"  )
	 	 x890073_UseYouQu(  sceneId  )
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 2 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  3  ==  step  then
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u 1 giây sau b¡t ð¥u "  )
	 	 return
	 end

	 if  2  ==  step  then
	 	 -- ð« kÏ chiªn ð¤u b¡t ð¥u ....
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "DeleteBOSS",  sceneId,  "LiFan_NPC"  )
	 	 return
	 end

	 if  1  ==  step  then
	 	 -- thành l§p BOSS....
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "YaoBoDang_BOSS",  -1,  -1  )
	 	 CallScriptFunction(  x890073_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "SiMaLing_BOSS",  -1,  -1  )
	 	 return
	 end

end

--**********************************
-- phát ðµng ch¤n nhiªp ....
--**********************************
function  x890073_UseZhenShe(  sceneId  )

	 local  bossId  =  CallScriptFunction(  x890073_g_FuBenScriptId,  "FindBOSS",  sceneId,  "LiFan_NPC"  )
	 if  bossId  ==  -1  then
	 	 return
	 end

	 local  idx  =  random(  getn(x890073_g_ZhenSheBuffTbl)  )
	 local  buffId  =  x890073_g_ZhenSheBuffTbl[idx]

	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  bossId,  bossId,  nHumanId,  buffId,  0  )
	 	 end
	 end

end

--**********************************
-- phát ðµng thú v¸ ....
--**********************************
function  x890073_UseYouQu(  sceneId  )

	 local  bossId  =  CallScriptFunction(  x890073_g_FuBenScriptId,  "FindBOSS",  sceneId,  "LiFan_NPC"  )
	 if  bossId  ==  -1  then
	 	 return
	 end

	 local  idx  =  random(  getn(x890073_g_YouQuBuffTbl)  )
	 local  buffId  =  x890073_g_YouQuBuffTbl[idx]

	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  bossId,  bossId,  nHumanId,  buffId,  0  )
	 	 end
	 end

end