-- Phiêu Mi¬u phong   Trác B¤t Phàm AI

--A	 # kiªm mang # sØ døng mµt vô ích kÛ nång .... næa theo nhß môn phái setdamage....
--B  # kim giáp # cho mình dùng mµt thêm buff ðích kÛ nång ....
--C  # gß½ng sáng # cho mình dùng mµt thêm buff ðích kÛ nång ....
--D	 # b¢ng hæu # b¤t bình nói ngß¶i lúc chªt cho mình dùng mµt thêm buff ðích kÛ nång ....


-- toàn trình cûng mang có mi­n d¸ch chª ð¸nh kÛ nång ðích buff....
-- cách m²i 40 giây ð¯i v¾i trß¾c m£t ð¸ch nhân sØ døng A....
-- cách m²i 30 giây thay phiên sØ døng BC....
-- tØ vong lúc tìm kiªm b¤t bình nói ngß¶i .... thiªt trí kÏ c¥n sØ døng cu°ng bÕo kÛ nång ....
-- tØ vong lúc phát hi®n b¤t bình nói ngß¶i ðã chªt .... là khai sáng mµt ngß¶i khác BOSS....


-- chân v¯n s¯ 
x890067_g_ScriptId	 =  890067

-- phó bän suy lu§n chân v¯n s¯ ....
x890067_g_FuBenScriptId  =  890063

-- mi­n d¸ch Buff....
x890067_Buff_MianYi1	 =  10472	 -- mi­n d¸ch mµt ít m£t trái hi®u quä ....
x890067_Buff_MianYi2	 =  10471	 -- mi­n d¸ch bình thß¶ng ¦n thân ....

-- kÛ nång ....
x890067_SkillID_A	 	 =  748
x890067_SkillID_B	 	 =  750
x890067_SkillID_C	 	 =  751
x890067_SkillID_D	 	 =  635

x890067_BuffID_D1	 	 =  6781
x890067_BuffID_D2	 	 =  6781

x890067_SkillCD_A	 	 =	 40000
x890067_SkillCD_BC	 =	 30000

x890067_SkillA_Damage  =
{
	 [0]  =  23815,
	 [1]  =  16570,
	 [2]  =  18820,
	 [3]  =  11978,
	 [4]  =  13170,
	 [5]  =  15610,
	 [6]  =  14496,
	 [7]  =  15240,
	 [8]  =  14070,
	 [9]  =  99999
}

x890067_BrotherName  =  " Tß Mã lâm "	 -- huynh ð® ðích tên ....


--AI  Index....
x890067_IDX_KuangBaoMode	 =  1	 -- cu°ng bÕo mô thÑc ....0 không cu°ng bÕo   1 c¥n tiªn vào cu°ng bÕo   2 ðã tiªn vào cu°ng bÕo 
x890067_IDX_CurSkillIndex	 =  2	 -- kª tiªp nên sØ døng BC trung ðích cái nào kÛ nång ....
x890067_IDX_CD_SkillA	 	 	 =  3	 --A kÛ nång ðích CD....
x890067_IDX_CD_SkillBC	 	 =  4	 --BC kÛ nång ðích CD....

x890067_IDX_CombatFlag  	 	 =  1	 -- có ch°ng hay chßa v¾i trÕng thái chiªn ð¤u ðích d¤u hi®u ....

--**********************************
-- m¾i b¡t ð¥u hóa ....
--**********************************
function  x890067_OnInit(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x890067_ResetMyAI(  sceneId,  selfId  )
end


--**********************************
-- nh¸p tim ....
--**********************************
function  x890067_OnHeartBeat(sceneId,  selfId,  nTick)

	 -- ki¬m tr¡c có phäi hay không chªt ....
	 if  LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  then
	 	 return
	 end

	 -- ki¬m tr¡c có hay không không có · ðây trÕng thái chiªn ð¤u ....
	 if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890067_IDX_CombatFlag  )  then
	 	 return
	 end

	 --A kÛ nång nh¸p tim ....
	 if  1  ==  x890067_TickSkillA(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --BC kÛ nång nh¸p tim ....
	 if  1  ==  x890067_TickSkillBC(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --D kÛ nång nh¸p tim ....
	 if  1  ==  x890067_TickSkillD(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

end


--**********************************
-- tiªn vào chiªn ð¤u ....
--**********************************
function  x890067_OnEnterCombat(sceneId,  selfId,  enmeyId)

	 -- thêm m¾i b¡t ð¥u buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890067_Buff_MianYi1,  0  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890067_Buff_MianYi2,  0  )

	 -- n£ng ðßa AI....
	 x890067_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí tiªn vào trÕng thái chiªn ð¤u ....
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890067_IDX_CombatFlag,  1  )

end


--**********************************
-- r¶i ði chiªn ð¤u ....
--**********************************
function  x890067_OnLeaveCombat(sceneId,  selfId)

	 -- n£ng ðßa AI....
	 x890067_ResetMyAI(  sceneId,  selfId  )

	 -- l¥n l¸ch cänh tßþng trong t¤t cä trách .... tìm kiªm huynh ð® cûng ðem thü tiêu ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  x890067_BrotherName  ==  GetName(  sceneId,  MonsterId  )  then
	 	 	 LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 end
	 end

	 -- thü tiêu mình ....
	 LuaFnDeleteMonster(  sceneId,  selfId  )

end


--**********************************
-- giªt chªt ð¸ch nhân ....
--**********************************
function  x890067_OnKillCharacter(sceneId,  selfId,  targetId)

end


--**********************************
-- tØ vong ....
--**********************************
function  x890067_OnDie(  sceneId,  selfId,  killerId  )
	 -- n£ng ðßa AI....
	 x890067_ResetMyAI(  sceneId,  selfId  )

	 local  bFind  =  0

	 -- l¥n l¸ch cänh tßþng trong t¤t cä trách .... tìm kiªm huynh ð® .... cho kÏ thiªt trí c¥n sØ døng cu°ng bÕo kÛ nång ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  x890067_BrotherName  ==  GetName(  sceneId,  MonsterId  )  and  LuaFnIsCharacterLiving(sceneId,  MonsterId)  ==  1  then
	 	 	 bFind  =  1
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  MonsterId,  x890067_IDX_KuangBaoMode,  1  )
	 	 end
	 end

	 -- nªu nhß không tìm ðßþc huynh ð® là nói rõ li«n còn dß lÕi mình mµt cái ....
	 if  0  ==  bFind  then
	 	 -- khai sáng ðoan mµc nguyên ....
	 	 local  MstId  =  CallScriptFunction(  x890067_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "YouDanZhi_BOSS",  -1,  -1  )
	 	 LuaFnNpcChat(sceneId,  MstId,  0,  "#{CJG_101231_244}")
	 	 -- thiªt trí ðã khiêu chiªn quá song tØ ....
	 	 CallScriptFunction(  x890067_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "ShuangZi",  2  )
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
	 	 str  =  format("#{_INFOUSR%s} mang ðµi ngû · thi¬u th¤t trên núi d­ dàng ðem #G Diêu bá khi #W ðánh bÕi . #W nh£t lên trên ð¤t tán lÕc ðích #cFF0000##{_ITEM%s}##W bäo v§t sau , tiªp tøc hß¾ng thi¬u th¤t ðïnh núi bßng ðînh vào . ",  playerName);

	 	 AddGlobalCountNews(  sceneId,  str  )
	 end

CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  selfId,  killerId,2  )
end


--**********************************
-- n£ng ðßa AI....
--**********************************
function  x890067_ResetMyAI(  sceneId,  selfId  )

	 -- n£ng ðßa tham s± ....
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_KuangBaoMode,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CurSkillIndex,  1  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillA,  x890067_SkillCD_A  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillBC,  x890067_SkillCD_BC  )
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890067_IDX_CombatFlag,  0  )

end


--**********************************
--A kÛ nång nh¸p tim ....
--**********************************
function  x890067_TickSkillA(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillA  )
	 if  cd  >  nTick  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillA,  cd-nTick  )
	 	 return  0
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillA,  x890067_SkillCD_A-(nTick-cd)  )
	 	 return  x890067_UseSkillA(  sceneId,  selfId  )
	 end

end


--**********************************
--BC kÛ nång nh¸p tim ....
--**********************************
function  x890067_TickSkillBC(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillBC  )
	 if  cd  >  nTick  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillBC,  cd-nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CD_SkillBC,  x890067_SkillCD_BC-(nTick-cd)  )

	 	 local  CurSkill  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CurSkillIndex  )
	 	 if  CurSkill  ==  1  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CurSkillIndex,  2  )
	 	 	 return  x890067_UseSkillB(  sceneId,  selfId  )
	 	 elseif  CurSkill  ==  2  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_CurSkillIndex,  1  )
	 	 	 return  x890067_UseSkillC(  sceneId,  selfId  )
	 	 end

	 end

end


--**********************************
--D kÛ nång nh¸p tim ....
--**********************************
function  x890067_TickSkillD(  sceneId,  selfId,  nTick  )

	 -- ðÕt ðßþc trß¾c m£t cu°ng bÕo mode....
	 local  CurMode  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_KuangBaoMode  )

	 if  CurMode  ==  0  or  CurMode  ==  2  then

	 	 -- nªu nhß không c¥n cu°ng bÕo ho£c là ðã cu°ng bÕo li­u là tr· v« ....
	 	 return  0

	 elseif  CurMode  ==  1  then

	 	 -- nªu nhß c¥n cu°ng bÕo là sØ døng cu°ng bÕo kÛ nång ....
	 	 local  ret  =    x890067_UseSkillD(  sceneId,  selfId  )
	 	 if  ret  ==  1  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890067_IDX_KuangBaoMode,  2  )
	 	 	 return  1
	 	 else
	 	 	 return  0
	 	 end

	 end

end


--**********************************
-- sØ døng A kÛ nång ....
--**********************************
function  x890067_UseSkillA(  sceneId,  selfId  )

	 -- ðÕt ðßþc trß¾c m£t ð¸ch nhân ....
	 local  enemyId  =  GetMonsterCurEnemy(  sceneId,  selfId  )
	 if  enemyId  <=  0  then
	 	 return  0
	 end
	 if  GetCharacterType(  sceneId,  enemyId  )  ==  3  then
	 	 enemyId  =  GetPetCreator(  sceneId,  enemyId  )
	 end

	 -- sØ døng mµt vô ích kÛ nång ....
	 local  x,z  =  GetWorldPos(  sceneId,  enemyId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890067_SkillID_A,  enemyId,  x,  z,  0,  1  )

	 -- theo nhß môn phái tr× máu ....
	 local  MenPai  =  GetMenPai(  sceneId,  enemyId  )
	 local  Damage  =  x890067_SkillA_Damage[  MenPai  ]
	 IncreaseHp(  sceneId,  enemyId,  -Damage  )

	 -- kêu thoÕi ....
	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_279}"..GetName(sceneId,enemyId).."#{CJG_101231_280}"  )

	 return  1

end


--**********************************
-- sØ døng B kÛ nång ....
--**********************************
function  x890067_UseSkillB(  sceneId,  selfId  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890067_SkillID_B,  selfId,  x,  z,  0,  1  )
	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_281}"  )
	 return  1

end


--**********************************
-- sØ døng C kÛ nång ....
--**********************************
function  x890067_UseSkillC(  sceneId,  selfId  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890067_SkillID_C,  selfId,  x,  z,  0,  1  )
	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_283}"  )
	 return  1

end


--**********************************
-- sØ døng D kÛ nång ....
--**********************************
function  x890067_UseSkillD(  sceneId,  selfId  )

	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890067_BuffID_D1,  5000  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890067_BuffID_D2,  5000  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890067_SkillID_D,  selfId,  x,  z,  0,  1  )

	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_308}"  )
	 return  1

end
