-- Phiêu Mi¬u phong   ô lão ðÕi AI

--A	 # kim ðång vÕn ng÷n ðèn # ðµc thuµc tính b¥y công ....
--B  # tê dÕi ðµc dßþc # bình thß¶ng kÛ nång .... toàn bµ v¯n ngçu nhiên ch÷n mµt ngß¶i ð¯i v¾i kÏ buông thä vô ích kÛ nång .... cho thêm kÏ thêm cá buff....
--C  # xanh biªc ba hß½ng lµ # ð¯i v¾i mình sØ døng mµt vô ích kÛ nång .... ð°ng th¶i · trß¾c m£t ð¸ch nhân dß¾i chân ð¬ cá bçy r§p ....
--D  # ðµc tính biªn ð±i # cách m²i 5 giây cho toàn bµ v¯n t¤t cä m÷i ngß¶i thêm mµt buff....

-- toàn trình cûng mang có mi­n d¸ch chª ð¸nh kÛ nång ðích buff....
--20 giây sau b¡t ð¥u tu¥n hoàn buông thä ABC kÛ nång .... lãnh lÕi 20 giây ....
-- m²i 5 giây sØ døng mµt l¥n D....
--BOSS tØ vong ho£c thoát khöi chiªn ð¤u s¨ cho t¤t cä m÷i ngß¶i thanh tr× D ðích buff....


-- chân v¯n s¯ 
x890066_g_ScriptId	 =  890066

-- phó bän suy lu§n chân v¯n s¯ ....
x890066_g_FuBenScriptId  =  890063

-- mi­n d¸ch Buff....
x890066_Buff_MianYi1	 =  10472	 -- mi­n d¸ch mµt ít m£t trái hi®u quä ....
x890066_Buff_MianYi2	 =  10471	 -- mi­n d¸ch bình thß¶ng ¦n thân ....

--ABC kÛ nång ....
x890066_SkillA	 	 	 =  561
x890066_SkillB	 	 	 =  562
x890066_BuffB	 	 	 	 =  18164
x890066_SkillC	 	 	 =  560
x890066_SpeObjC	 	 	 =  54
x890066_SkillABC_CD	 =	 20000

--D kÛ nång ....
x890066_BuffD	 	 	 	 =  18134
x890066_SkillD_CD	 	 =  5000


--AI  Index....
x890066_IDX_CD_SkillABC	 	 =  1	 --ABC kÛ nång ðích CD....
x890066_IDX_CurSkillIndex	 =  2	 -- kª tiªp nên sØ døng ABC trung ðích cái nào kÛ nång ....
x890066_IDX_CD_SkillD	 	 	 =  3	 --D kÛ nång ðích CD....

x890066_IDX_CombatFlag  	 	 =  1	 -- có ch°ng hay chßa v¾i trÕng thái chiªn ð¤u ðích d¤u hi®u ....

x890066_g_Npc_4  =  {  
	 Name	 	 	 =  " Ðinh Xuân Thu ",
	 MonsterID	 =  8,
	 PosX	 	 	 =  129,
	 PosY	 	 	 =  127,
	 ScriptID	 =  890075
}
--**********************************
-- m¾i b¡t ð¥u hóa ....
--**********************************
function  x890066_OnInit(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x890066_ResetMyAI(  sceneId,  selfId  )
end


--**********************************
-- nh¸p tim ....
--**********************************
function  x890066_OnHeartBeat(sceneId,  selfId,  nTick)

	 -- ki¬m tr¡c có phäi hay không chªt ....
	 if  LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  then
	 	 return
	 end

	 -- ki¬m tr¡c có hay không không có · ðây trÕng thái chiªn ð¤u ....
	 if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890066_IDX_CombatFlag  )  then
	 	 return
	 end

	 --ABC kÛ nång nh¸p tim ....
	 if  1  ==  x890066_TickSkillABC(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --D kÛ nång nh¸p tim ....
	 if  1  ==  x890066_TickSkillD(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

end


--**********************************
-- tiªn vào chiªn ð¤u ....
--**********************************
function  x890066_OnEnterCombat(sceneId,  selfId,  enmeyId)

	 -- thêm m¾i b¡t ð¥u buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890066_Buff_MianYi1,  0  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890066_Buff_MianYi2,  0  )

	 -- n£ng ðßa AI....
	 x890066_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí tiªn vào trÕng thái chiªn ð¤u ....
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890066_IDX_CombatFlag,  1  )

end


--**********************************
-- r¶i ði chiªn ð¤u ....
--**********************************
function  x890066_OnLeaveCombat(sceneId,  selfId)

	 -- n£ng ðßa AI....
	 x890066_ResetMyAI(  sceneId,  selfId  )

	 -- thü tiêu mình ....
	 LuaFnDeleteMonster(  sceneId,  selfId  )

	 -- khai sáng ð¯i thoÕi NPC....
	 local  MstId  =  CallScriptFunction(  x890066_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "MuRongFu_NPC",  -1,  -1  )
	 SetUnitReputationID(  sceneId,  MstId,  MstId,  0  )

end


--**********************************
-- giªt chªt ð¸ch nhân ....
--**********************************
function  x890066_OnKillCharacter(sceneId,  selfId,  targetId)

end


--**********************************
-- tØ vong ....
--**********************************
function  x890066_OnDie(  sceneId,  selfId,  killerId  )

	 -- n£ng ðßa AI....
	 x890066_ResetMyAI(  sceneId,  selfId  )

	 -- thü tiêu mình ....
	 SetCharacterDieTime(  sceneId,  selfId,  3000  )

	 -- m· ra ô lão ðÕi tØ vong tính gi¶ khí ....
	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 CallScriptFunction(  x890066_g_FuBenScriptId,  "OpenMuRongFuDieTimer",  sceneId,  4,  x890066_g_ScriptId,  x,  z  )

	 -- thiªt trí ðã khiêu chiªn quá ô lão ðÕi ....
	 CallScriptFunction(  x890066_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "MuRongFu",  2  )

	 -- nªu nhß còn không có khiêu chiªn quá song tØ là có th¬ khiêu chiªn song tØ ....
	 if  2  ~=  CallScriptFunction(  x890066_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "ShuangZi"  )	 then
	 	 CallScriptFunction(  x890066_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "ShuangZi",  1  )
	 end
	 
	 --  zchw  toàn c¥u thông báo 
	 local	 playerName	 =  GetName(  sceneId,  killerId  )
	 
	 -- giªt chªt quái v§t chính là süng v§t là l¤y ðßþc kÏ chü tên cüa ngß¶i ....
	 local  playerID  =  killerId
	 local  objType  =  GetCharacterType(  sceneId,  killerId  )
	 if  objType  ==  3  then
	 	 playerID  =  GetPetCreator(  sceneId,  killerId  )
	 	 playerName  =  GetName(  sceneId,  playerID  )
	 end
	 
	 -- nªu nhß nhà ch½i h÷p thành ðµi li­u là l¤y ðßþc ðµi trß·ng tên ....
	 local  leaderID  =  GetTeamLeader(  sceneId,  playerID  )
	 if  leaderID  ~=  -1  then
	 	 playerName  =  GetName(  sceneId,  leaderID  )
	 end

	 if  playerName  ~=  nil  then
	 	 str  =  format(" Thi¬u Th¤t S½n: #Y Mµ Dung phøc #W : ho khan # ho khan # ho khan, m£c dù ta phøc hßng ÐÕi Yªn vô v÷ng, #cFF0000 nhßng #cFF0000#{_INFOUSR%s}#W ngß½i cûng không c¥n ð¡c ý, nhæng thÑ khác huynh ð® ta s¨ vì ta báo thù! ",  playerName);
	 	 AddGlobalCountNews(  sceneId,  str  )
	 end


CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  selfId,  killerId,2  )	 
end


--**********************************
-- n£ng ðßa AI....
--**********************************
function  x890066_ResetMyAI(  sceneId,  selfId  )

	 -- n£ng ðßa tham s± ....
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillABC,  x890066_SkillABC_CD  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CurSkillIndex,  1  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillD,  x890066_SkillD_CD  )
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890066_IDX_CombatFlag,  0  )

	 -- cho t¤t cä m÷i ngß¶i thanh tr× D ðích buff....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnCancelSpecificImpact(  sceneId,  nHumanId,  x890066_BuffD  )
	 	 end
	 end

end


--**********************************
--ABC kÛ nång nh¸p tim ....
--**********************************
function  x890066_TickSkillABC(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillABC  )
	 if  cd  >  nTick  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillABC,  cd-nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillABC,  x890066_SkillABC_CD-(nTick-cd)  )

	 	 local  CurSkill  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CurSkillIndex  )
	 	 if  CurSkill  ==  1  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CurSkillIndex,  2  )
	 	 	 return  x890066_UseSkillA(  sceneId,  selfId  )
	 	 elseif  CurSkill  ==  2  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CurSkillIndex,  3  )
	 	 	 return  x890066_UseSkillB(  sceneId,  selfId  )
	 	 elseif  CurSkill  ==  3  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CurSkillIndex,  1  )
	 	 	 return  x890066_UseSkillC(  sceneId,  selfId  )
	 	 end

	 end

end


--**********************************
--D kÛ nång nh¸p tim ....
--**********************************
function  x890066_TickSkillD(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillD  )
	 if  cd  >  nTick  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillD,  cd-nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890066_IDX_CD_SkillD,  x890066_SkillD_CD-(nTick-cd)  )
	 	 return  x890066_UseSkillD(  sceneId,  selfId  )

	 end

end


--**********************************
-- sØ døng A kÛ nång ....
--**********************************
function  x890066_UseSkillA(  sceneId,  selfId  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890066_SkillA,  selfId,  x,  z,  0,  1  )
	 return  1

end


--**********************************
-- sØ døng B kÛ nång ....
--**********************************
function  x890066_UseSkillB(  sceneId,  selfId  )

	 -- phó bän trung hæu hi®u ðích nhà ch½i ðích li®t bi¬u ....
	 local  PlayerList  =  {}

	 -- ðem hæu hi®u ngß¶i cüa gia nh§p li®t bi¬u ....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 PlayerList[i+1]  =  nHumanId
	 	 end
	 end

	 -- ngçu nhiên ch÷n lña mµt nhà ch½i ....
	 local  numPlayer  =  getn(PlayerList)
	 if  numPlayer  <=  0  then
	 	 return  0
	 end
	 local  PlayerId  =  PlayerList[  random(numPlayer)  ]

	 -- ð¯i v¾i kÏ sØ døng kÛ nång ....
	 local  x,z  =  GetWorldPos(  sceneId,  PlayerId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890066_SkillB,  PlayerId,  x,  z,  0,  1  )

	 -- cho kÏ thêm buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  PlayerId,  x890066_BuffB,  0  )

	 return  1

end


--**********************************
-- sØ døng C kÛ nång ....
--**********************************
function  x890066_UseSkillC(  sceneId,  selfId  )

	 -- ðÕt ðßþc trß¾c m£t ð¸ch nhân ....
	 local  enemyId  =  GetMonsterCurEnemy(  sceneId,  selfId  )
	 if  enemyId  <=  0  then
	 	 return  0
	 end
	 if  GetCharacterType(  sceneId,  enemyId  )  ==  3  then
	 	 enemyId  =  GetPetCreator(  sceneId,  enemyId  )
	 end

	 -- · nên ð¸ch nhân dß¾i chân ð¬ cá bçy r§p ....
	 local  x,z  =  GetWorldPos(  sceneId,  enemyId  )
	 CreateSpecialObjByDataIndex(  sceneId,  selfId,  x890066_SpeObjC,  x,  z,  0  )

	 -- kêu thoÕi ....
	 MonsterTalk(  sceneId,  -1,  "",  "#{PMF_20080530_17}"  )

	 -- ð¯i v¾i mình sØ døng mµt chï có ð£c hi®u ðích vô ích kÛ nång ....
	 x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890066_SkillC,  selfId,  x,  z,  0,  1  )

	 return  1

end


--**********************************
-- sØ døng D kÛ nång ....
--**********************************
function  x890066_UseSkillD(  sceneId,  selfId  )

	 -- cho phó bän trong t¤t cä m÷i ngß¶i thêm buff....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  nHumanId,  x890066_BuffD,  0  )
	 	 end
	 end

end


--**********************************
-- ô lão ðÕi tØ vong tính gi¶ khí OnTimer....
-- dùng cho kh¯ng chª tØ vong sau kéo dài cà xu¤t chiªn bÕi ô lão ðÕi ....
--**********************************
function  x890066_OnJiuMoZhiDieTimer(  sceneId,  step,  posX,  posY  )

	 if  1  ==  step  then
	 	 -- khai sáng chiªn bÕi ðích ô lão ðÕi NPC....
	 local  MstId  =  LuaFnCreateMonster(sceneId,  x890066_g_Npc_4.MonsterID,  x890066_g_Npc_4.PosX,  x890066_g_Npc_4.PosY,  3,  0,  x890066_g_Npc_4.ScriptID  )
	 SetCharacterName(  sceneId,  MstId,  x890066_g_Npc_4.Name  )
	 SetUnitReputationID(  sceneId,  MstId,  MstId,  0  )
	 end

end