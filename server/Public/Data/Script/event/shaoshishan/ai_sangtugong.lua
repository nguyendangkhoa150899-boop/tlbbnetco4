-- Phiêu Mi¬u phong   tang ð¤t công AI

--A  # ðµn th± #BOSS ðích HP m²i t±n th¤t 20% là s¨ biªn m¤t 20 giây .... ð°ng th¶i khai sáng ti¬u quái theo thÑ tñ vì 1122 chï .. tØ vong or thoát khöi chiªn ð¤u biªn m¤t ....
--B  # lông trâu ðµc châm # không phäi là ðµn th± trÕng thái lúc cách m²i 20 mµt l¥n ðÕi phÕm vi công kích .... ðµn th± trÕng thái hÕ CD bình thß¶ng ði chÆng qua là không sØ døng .... ðµn th± kªt thúc lúc thanh CD....
--C  # xu¤t th± vån v§t # tiªn vào ðµn th± lúc ngçu nhiên ðÕt ðßþc 2 cá buff.... ð°ng th¶i thanh tr× l¥n trß¾c ðích 2 cá buff....
--D  # ðiên cu°ng # chiªn ð¤u 5 phút sau cho mình cùng t¤t cä cß½ng thi thêm mµt kích trí mÕng buff.... không h« næa sØ døng AB(C)....

-- toàn trình cûng mang có mi­n d¸ch chª ð¸nh kÛ nång ðích buff....
-- thoát khöi chiªn ð¤u ho£c tØ vong lúc thü tiêu cß½ng thi ....


-- chân v¯n s¯ 
x890065_g_ScriptId	 =  890065

-- phó bän suy lu§n chân v¯n s¯ ....
x890065_g_FuBenScriptId  =  890063


-- mi­n d¸ch ð£c ð¸nh kÛ nång buff....
x890065_Buff_MianYi1	 =  10472	 -- mi­n d¸ch mµt ít m£t trái hi®u quä ....
x890065_Buff_MianYi2	 =  10471	 -- mi­n d¸ch bình thß¶ng ¦n thân ....

--A ðµn th± ....
x890065_SkillA_TuDun	 	 	 	 =  1028
x890065_SkillA_ChildName	 	 =  " bång tàm "
x890065_SkillA_ChildBuff	 	 =  10246
x890065_SkillA_ChildTime	 	 =  5000	 	 -- ðµn th± th¶i gian bao lâu sau b¡t ð¥u cà ti¬u quái ....
x890065_SkillA_Time	 	 	 	 	 =  20000	 	 -- ðµn th± kéo dài th¶i gian ....


--B lông trâu ðµc châm ....
x890065_SkillB_NiuMaoDuZhen  =  751
-- lãnh lÕi th¶i gian ....
x890065_SkillB_CD	 	 	 	 	 	 =  60000


--C xu¤t th± vån v§t kÛ nång ðích buff li®t bi¬u ....
--x890065_SkillC_ChutuBuff1  =  {  10237,  10238  }
--x890065_SkillC_ChutuBuff2  =  {  10239,  10240,  10241,  10242  }

x890065_SkillC_ChutuBuff1  =  {  6446,  6446  }
x890065_SkillC_ChutuBuff2  =  {  6446,  6446,  6446,  6446  }

--D ðiên cu°ng ....
x890065_SkillD_Buff1	 =  10217
x890065_SkillD_Buff2	 =  10217
-- b¡t ð¥u tiªn vào cu°ng bÕo trÕng thái th¶i gian ....
x890065_EnterKuangBaoTime	 =  5*60*1000


--AI  Index....
x890065_IDX_HPStep	 	 	 	 	 	 	 =  1	 -- lßþng máu c¤p b§c ....
x890065_IDX_SkillB_CD	 	 	 	 	 	 =  2	 --B kÛ nång ðích CD th¶i gian ....
x890065_IDX_KuangBaoTimer	 	 	 	 =  3	 -- cu°ng bÕo tính gi¶ khí ....
x890065_IDX_TuDunTimer	 	 	 	 	 =  4	 -- ðµn th± tính gi¶ khí .... dùng cho tính toán khi nào ðµn th± kªt thúc ....
x890065_IDX_NeedCreateChildNum	 =  5	 -- c¥n khai sáng ti¬u quái ðích s¯ lßþng ....

x890065_IDX_CombatFlag  	 	 	 =  1	 -- có ch°ng hay chßa v¾i trÕng thái chiªn ð¤u ðích d¤u hi®u ....
x890065_IDX_IsTudunMode	 	 	 =  2	 -- có ch°ng hay chßa v¾i ðµn th± mô thÑc ðích d¤u hi®u ....
x890065_IDX_IsKuangBaoMode	 =  3	 -- có ch°ng hay chßa v¾i cu°ng bÕo mô thÑc ðích d¤u hi®u ....

--**********************************
-- m¾i b¡t ð¥u hóa ....
--**********************************
function  x890065_OnInit(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x890065_ResetMyAI(  sceneId,  selfId  )
end


--**********************************
-- nh¸p tim ....
--**********************************
function  x890065_OnHeartBeat(sceneId,  selfId,  nTick)

	 -- ki¬m tr¡c có phäi hay không chªt ....
	 if  LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  then
	 	 return
	 end

	 -- ki¬m tr¡c có hay không không có · ðây trÕng thái chiªn ð¤u ....
	 if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_CombatFlag  )  then
	 	 return
	 end

	 -- cu°ng bÕo trÕng thái không c¥n ði suy lu§n ....
	 if  1  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsKuangBaoMode  )  then
	 	 return
	 end

	 -- thi hành cu°ng bÕo suy lu§n ....
	 if  1  ==  x890065_DoSkillD_KuangBao(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 -- thi hành ðµn th± suy lu§n ....
	 if  1  ==  x890065_SkillLogicA_TunDun(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 -- thi hành lông trâu ðµc châm suy lu§n ....
	 if  1  ==  x890065_SkillLogicB_NiuMaoDuZhen(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

end


--**********************************
-- tiªn vào chiªn ð¤u ....
--**********************************
function  x890065_OnEnterCombat(sceneId,  selfId,  enmeyId)

	 -- thêm m¾i b¡t ð¥u buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_Buff_MianYi1,  0  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_Buff_MianYi2,  0  )

	 -- n£ng ðßa AI....
	 x890065_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí tiªn vào trÕng thái chiªn ð¤u ....
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_CombatFlag,  1  )

end


--**********************************
-- r¶i ði chiªn ð¤u ....
--**********************************
function  x890065_OnLeaveCombat(sceneId,  selfId)

	 -- n£ng ðßa AI....
	 x890065_ResetMyAI(  sceneId,  selfId  )

	 -- thü tiêu mình ....
	 LuaFnDeleteMonster(  sceneId,  selfId  )

	 -- khai sáng ð¯i thoÕi NPC....
	 local  MstId  =  CallScriptFunction(  x890065_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "ZhuangJuXian_NPC",  -1,  -1  )
	 SetUnitReputationID(  sceneId,  MstId,  MstId,  0  )

end


--**********************************
-- giªt chªt ð¸ch nhân ....
--**********************************
function  x890065_OnKillCharacter(sceneId,  selfId,  targetId)

end


--**********************************
-- tØ vong ....
--**********************************
function  x890065_OnDie(  sceneId,  selfId,  killerId  )

	 -- n£ng ðßa AI....
	 x890065_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí ðã khiêu chiªn quá tang ð¤t công ....
	 CallScriptFunction(  x890065_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "ZhuangJuXian",  2  )

	 -- nªu nhß còn không có khiêu chiªn quá ô lão ðÕi là có th¬ khiêu chiªn ô lão ðÕi ....
	 if  2  ~=  CallScriptFunction(  x890065_g_FuBenScriptId,  "GetBossBattleFlag",  sceneId,  "MuRongFu"  )	 then
	 	 CallScriptFunction(  x890065_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "MuRongFu",  1  )
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

	 	 str  =  format("#Y Trang Tø Hi«n #W cûng không ð¸ch lÕi ðµi ngû cüa #cFF0000 #{_INFOUSR%s}#W và b¸ ðánh liên tiªp ðªn n²i vÞ m£t nÕ, phäi chÕy tr¯n ði. ",  playerName);

	 	 AddGlobalCountNews(  sceneId,  str  )
	 end

CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  selfId,  killerId,2  )	 
	 
end


--**********************************
-- n£ng ðßa AI....
--**********************************
function  x890065_ResetMyAI(  sceneId,  selfId  )

	 -- n£ng ðßa tham s± ....
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_HPStep,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_SkillB_CD,  x890065_SkillB_CD  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_KuangBaoTimer,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_TuDunTimer,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_NeedCreateChildNum,  0  )

	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_CombatFlag,  0  )
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsTudunMode,  0  )
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsKuangBaoMode,  0  )

	 -- thanh tr× buff....
	 for  i,  buffId  in  x890065_SkillC_ChutuBuff1  do
	 	 LuaFnCancelSpecificImpact(  sceneId,  selfId,  buffId  )
	 end

	 for  i,  buffId  in  x890065_SkillC_ChutuBuff2  do
	 	 LuaFnCancelSpecificImpact(  sceneId,  selfId,  buffId  )
	 end

	 LuaFnCancelSpecificImpact(  sceneId,  selfId,  x890065_SkillD_Buff1  )
	 LuaFnCancelSpecificImpact(  sceneId,  selfId,  x890065_SkillD_Buff2  )

	 -- thanh tr× ti¬u quái ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  GetName(sceneId,  MonsterId)  ==  x890065_SkillA_ChildName  then
	 	 	 LuaFnDeleteMonster(sceneId,  MonsterId)
	 	 end
	 end

end


--**********************************
-- cu°ng bÕo kÛ nång ....
--**********************************
function  x890065_DoSkillD_KuangBao(  sceneId,  selfId  )

	 -- thêm cu°ng bÕo buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_SkillD_Buff1,  0  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_SkillD_Buff2,  0  )

	 -- cho t¤t cä ti¬u quái thêm cu°ng bÕo ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  GetName(sceneId,  MonsterId)  ==  x890065_SkillA_ChildName  then
	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  MonsterId,  MonsterId,  MonsterId,  x890065_SkillD_Buff1,  0  )
	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  MonsterId,  MonsterId,  MonsterId,  x890065_SkillD_Buff2,  0  )
	 	 end
	 end

end


--**********************************
-- ðµn th± suy lu§n ....
--**********************************
function  x890065_SkillLogicA_TunDun(  sceneId,  selfId,  nTick  )


	 -- ðµn th± mô thÑc là ð±i m¾i ðµn th± tính gi¶ khí ....
	 if  1  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsTudunMode  )  then

	 	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_TuDunTimer  )
	 	 if  cd  >  nTick  then

	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_TuDunTimer,  cd-nTick  )
	 	 	 -- nªu nhß ðªn cà ti¬u quái ðích th¶i gian h½n næa l¥n này ðµn th± còn không có ph¾t qua ti¬u quái ....
	 	 	 if  cd  <  (x890065_SkillA_Time-x890065_SkillA_ChildTime)  then
	 	 	 	 local  needCreateNum  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_NeedCreateChildNum  )
	 	 	 	 if  needCreateNum  >  0  then
	 	 	 	 	 -- khai sáng ti¬u quái ....
	 	 	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_NeedCreateChildNum,  0  )
	 	 	 	 	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 	 	 	 	 for  i=1,  needCreateNum  do
	 	 	 	 	 	 local  MstId  =  CallScriptFunction(  x890065_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "JiangShi_BOSS",  x,  z  )
	 	 	 	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  MstId,  MstId,  MstId,  x890065_SkillA_ChildBuff,  0  )
	 	 	 	 	 	 SetCharacterName(  sceneId,  MstId,  x890065_SkillA_ChildName  )
	 	 	 	 	 end
	 	 	 	 end
	 	 	 end

	 	 else

	 	 	 -- ðµn th± kªt thúc .... thiªt trí r¶i ði ðµn th± trÕng thái ....
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_TuDunTimer,  0  )
	 	 	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsTudunMode,  0  )
	 	 	 -- n£ng ðßa lông trâu ðµc châm CD....
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_SkillB_CD,  x890065_SkillB_CD  )

	 	 end


	 -- không phäi là ðµn th± mô thÑc là ki¬m tr¡c có ðßþc hay không tiªn vào ðµn th± mô thÑc ....
	 else


	 	 -- m²i giäm b¾t 20% máu lúc tiªn vào ðµn th± mô thÑc ....
	 	 local  CurPercent  =  GetHp(  sceneId,  selfId  )  /  GetMaxHp(  sceneId,  selfId  )
	 	 local  LastStep  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_HPStep  )
	 	 local  CurStep  =  -1
	 	 if  CurPercent  <=  0.2  then
	 	 	 CurStep  =  4
	 	 elseif  CurPercent  <=  0.4  then
	 	   	 CurStep  =  3
	 	 elseif  CurPercent  <=  0.6  then
	 	   	 CurStep  =  2
	 	 elseif  CurPercent  <=  0.8  then
	 	 	 CurStep  =  1
	 	 end

	 	 -- tiªn hành ðµn th± ....
	 	 if  CurStep  >  LastStep  then
	 	 	 -- cho mình thiªt trí ¦n thân and không th¬ công kích ....
	 	 	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 	 	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890065_SkillA_TuDun,  selfId,  x,  z,  0,  1  )

	 	 	 -- ngçu nhiên ðÕt ðßþc 2 cá buff( xu¤t th± vån v§t )....
	 	 	 local  idx1  =  random(  getn(x890065_SkillC_ChutuBuff1)  )
	 	 	 -- LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_SkillC_ChutuBuff1[idx1],  0  )   -- [NetCo4 03/10] TAT: server cu thay buff goc 10237-10242 bang 6446 (hoi 50% mau) -> 2 lan = hoi day moi khi chui dat
	 	 	 local  idx2  =  random(  getn(x890065_SkillC_ChutuBuff2)  )
	 	 	 -- LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_SkillC_ChutuBuff2[idx2],  0  )   -- [NetCo4 03/10] TAT: server cu thay buff goc 10237-10242 bang 6446 (hoi 50% mau) -> 2 lan = hoi day moi khi chui dat

	 	 	 local  NeedCreateNum  =  1
	 	 	 if  CurStep  ==  3  or  CurStep  ==  4  then
	 	 	 	 NeedCreateNum  =  2
	 	 	 end

	 	 	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsTudunMode,  1  )
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_NeedCreateChildNum,  NeedCreateNum  )
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_HPStep,  CurStep  )
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_TuDunTimer,  x890065_SkillA_Time  )
	 	 	 return  1
	 	 end


	 end

	 return  0

end


--**********************************
-- lông trâu ðµc châm suy lu§n ....
--**********************************
function  x890065_SkillLogicB_NiuMaoDuZhen(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_SkillB_CD  )
	 if  cd  >  nTick  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_SkillB_CD,  cd-nTick  )
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_SkillB_CD,  x890065_SkillB_CD-(nTick-cd)  )
	 	 -- không phäi là ðµn th± trÕng thái m¾i có th¬ dùng ....
	 	 if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsTudunMode  )  then
	 	 	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 	 	 MonsterTalk(  sceneId,  -1,  "",  "#{PMF_20080530_16}"  )
	 	 	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890065_SkillB_NiuMaoDuZhen,  selfId,  x,  z,  0,  0  )
	 	 	 return  1
	 	 end
	 end

	 return  0

end


--**********************************
-- cu°ng bÕo suy lu§n ....
--**********************************
function  x890065_DoSkillD_KuangBao(  sceneId,  selfId,  nTick  )

	 -- ki¬m tr¡c có hay không ðªn cu°ng bÕo th¶i ði¬m ....
	 local  kbTime  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_KuangBaoTimer  )
	 if  kbTime  <  x890065_EnterKuangBaoTime  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890065_IDX_KuangBaoTimer,  kbTime+nTick  )

	 else

	 	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890065_IDX_IsKuangBaoMode,  1  )
	 	 -- thêm cu°ng bÕo buff....
	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_SkillD_Buff1,  0  )
	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890065_SkillD_Buff2,  0  )
	 	 -- cho t¤t cä ti¬u quái thêm cu°ng bÕo buff....
	 	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 	 for  i=0,  nMonsterNum-1  do
	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 if  GetName(sceneId,  MonsterId)  ==  x890065_SkillA_ChildName  then
	 	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  MonsterId,  MonsterId,  MonsterId,  x890065_SkillD_Buff1,  0  )
	 	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  MonsterId,  MonsterId,  MonsterId,  x890065_SkillD_Buff2,  0  )
	 	 	 end
	 	 end
	 	 return  1

	 end


	 return  0

end