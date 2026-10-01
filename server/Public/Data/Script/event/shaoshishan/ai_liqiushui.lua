-- Phiêu Mi¬u phong   lý thu thüy AI

--A  # ti¬u vô tß¾ng công # cho mình dùng cá vô ích kÛ nång .... cho thêm ngçu nhiên cho mµt nhà ch½i th¤t minh ....
--B  # kiªm vû # cho mình dùng mµt vô ích kÛ nång .... kª tiªp 15s bên trong theo thÑ tñ cho toàn bµ v¯n nhà ch½i thêm t±n thß½ng tr¸ giá t× t× gia tång ðích t±n thß½ng buff....
--C  # không câu ch¤p # cho mình dùng mµt thanh buff ðích kÛ nång ....
--D  # bång bÕo # cho mình dùng cá vô ích kÛ nång .... cho thêm ngçu nhiên cho nhà ch½i dß¾i chân ð¬ cá bçy r§p ....
--E  # cu°ng bÕo # cho mình thêm ðiên cu°ng buff.... không h« næa sØ døng nhæng khác kÛ nång ....

-- toàn trình cûng mang có mi­n d¸ch chª ð¸nh kÛ nång ðích buff....
-- chiªn ð¤u b¡t ð¥u ð°ng th¶i cách m²i 10 giây dùng A kÛ nång ....
-- khi HP xu¯ng làm 66% cùng 33% lúc/khi ch¾ sØ døng B kÛ nång ....B kÛ nång ðích kéo dài th¶i gian bên trong .... kÏ tha kÛ nång CD ðªn không sØ døng ....
-- cách m²i 20 giây dùng C kÛ nång ....
-- cách m²i 20 giây dùng D kÛ nång ....


-- chân v¯n s¯ 
x890069_g_ScriptId	 =  890069

-- phó bän suy lu§n chân v¯n s¯ ....
x890069_g_FuBenScriptId  =  890063


-- mi­n d¸ch ð£c ð¸nh kÛ nång buff....
x890069_Buff_MianYi1	 =  10472	 -- mi­n d¸ch mµt ít m£t trái hi®u quä ....
x890069_Buff_MianYi2	 =  10471	 -- mi­n d¸ch bình thß¶ng ¦n thân ....

--A ti¬u vô tß¾ng công ....
x890069_SkillA_ID	 	 	 =  1042
x890069_SkillA_Buff	 	 =	 10271
x890069_SkillA_CD	 	 	 =  80000

--B kiªm vû ....
x890069_SkillB_SkillIDTbl  =  {  1043,  1044,  1045,  1046,  1047,  1048  }
x890069_SkillB_WeatherTbl  =  {  11,  12,  13,  14,  15,  16  }
x890069_SkillB_TalkTbl  =
{
	 " các ngß½i nhæng ngß¶i này th§t r¤t nhàm chán , ð¬ cho các ngß½i nhìn mµt chút ta #Y Ðinh Xuân Thu #W ðích lþi hÕi ! ",
	 " các ngß½i nhæng ngß¶i này th§t r¤t nhàm chán , ð¬ cho các ngß½i nhìn mµt chút ta #Y Ðinh Xuân Thu #W ðích lþi hÕi ! ",
	 " các ngß½i nhæng ngß¶i này th§t r¤t nhàm chán , ð¬ cho các ngß½i nhìn mµt chút ta #Y Ðinh Xuân Thu #W ðích lþi hÕi ! ",
	 " các ngß½i nhæng ngß¶i này th§t r¤t nhàm chán , ð¬ cho các ngß½i nhìn mµt chút ta #Y Ðinh Xuân Thu #W ðích lþi hÕi ! ",
	 " các ngß½i nhæng ngß¶i này th§t r¤t nhàm chán , ð¬ cho các ngß½i nhìn mµt chút ta #Y Ðinh Xuân Thu #W ðích lþi hÕi ! ",
	 " các ngß½i nhæng ngß¶i này th§t r¤t nhàm chán , ð¬ cho các ngß½i nhìn mµt chút ta #Y Ðinh Xuân Thu #W ðích lþi hÕi ! "
}

x890069_SkillB_BuffIDTbl  =
{
	 [1]  =  {10280,10281,10282,10283,10284,10285,10286,10287,10288,10289,10290,10291,10292,10293,10294},
	 [2]  =  {10295,10296,10297,10298,10299,10300,10301,10302,10303,10304,10305,10306,10307,10308,10309},
	 [3]  =  {10310,10311,10312,10313,10314,10315,10316,10317,10318,10319,10320,10321,10322,10323,10324},
	 [4]  =  {10325,10326,10327,10328,10329,10330,10331,10332,10333,10334,10335,10336,10337,10338,10339},
	 [5]  =  {10340,10341,10342,10343,10344,10345,10346,10347,10348,10349,10350,10351,10352,10353,10354},
	 [6]  =  {10355,10356,10357,10358,10359,10360,10361,10362,10363,10364,10365,10366,10367,10368,10369}
}

--C không câu ch¤p ....
x890069_SkillC_ID	 	 =  645
x890069_SkillC_CD	 	 =  20000

--D bång bÕo ....
x890069_SkillD_ID	 	 =  643
x890069_SkillD_CD	 	 =  20000
x890069_SkillD_SpecObj  =  59

--E cu°ng bÕo ....
x890069_SkillE_Buff1	 =  10234
x890069_SkillE_Buff2	 =  10235
-- b¡t ð¥u tiªn vào cu°ng bÕo trÕng thái th¶i gian ....
x890069_EnterKuangBaoTime	 =  10*60*1000


--AI  Index....
x890069_IDX_StopWatch	 	 	 	 	 	 =  1	 -- giây bi¬u ....
x890069_IDX_SkillA_CD	 	 	 	 	 	 =  2	 --A kÛ nång ðích CD th¶i gian ....
x890069_IDX_SkillB_HPStep	 	 	 	 =  3	 -- lßþng máu c¤p b§c ....
x890069_IDX_SkillB_Step	 	 	 	 	 =  4	 --B kÛ nång ðích Step....0= không phát ðµng   15=buff1  14=buff2  ..  1=buff15
x890069_IDX_SkillB_Type	 	 	 	 	 =  5	 -- trß¾c m£t ðang sØ døng loÕi nào loÕi hình kiªm vû ....
x890069_IDX_SkillC_CD	 	 	 	 	 	 =  6	 --C kÛ nång ðích CD th¶i gian ....
x890069_IDX_SkillD_CD	 	 	 	 	 	 =  7	 --C kÛ nång ðích CD th¶i gian ....
x890069_IDX_KuangBaoTimer	 	 	 	 =  8	 -- cu°ng bÕo tính gi¶ khí ....


x890069_IDX_CombatFlag  	 	 	 =  1	 -- có ch°ng hay chßa v¾i trÕng thái chiªn ð¤u ðích d¤u hi®u ....
x890069_IDX_IsKuangBaoMode	 =  2	 -- có ch°ng hay chßa v¾i cu°ng bÕo mô thÑc ðích d¤u hi®u ....

--**********************************
-- m¾i b¡t ð¥u hóa ....
--**********************************
function  x890069_OnInit(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x890069_ResetMyAI(  sceneId,  selfId  )
end


--**********************************
-- nh¸p tim ....
--**********************************
function  x890069_OnHeartBeat(sceneId,  selfId,  nTick)

	 -- ki¬m tr¡c có phäi hay không chªt ....
	 if  LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  then
	 	 return
	 end

	 -- ki¬m tr¡c có hay không không có · ðây trÕng thái chiªn ð¤u ....
	 if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890069_IDX_CombatFlag  )  then
	 	 return
	 end

	 -- cu°ng bÕo trÕng thái không c¥n ði suy lu§n ....
	 if  1  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890069_IDX_IsKuangBaoMode  )  then
	 	 return
	 end

	 --A kÛ nång nh¸p tim ....
	 if  1  ==  x890069_TickSkillA(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --B kÛ nång nh¸p tim ....
	 if  1  ==  x890069_TickSkillB(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --C kÛ nång nh¸p tim ....
	 if  1  ==  x890069_TickSkillC(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --D kÛ nång nh¸p tim ....
	 if  1  ==  x890069_TickSkillD(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --E kÛ nång nh¸p tim ....
	 if  1  ==  x890069_TickSkillE(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 -- giây bi¬u nh¸p tim ....
	 x890069_TickStopWatch(  sceneId,  selfId,  nTick  )

end


--**********************************
-- tiªn vào chiªn ð¤u ....
--**********************************
function  x890069_OnEnterCombat(sceneId,  selfId,  enmeyId)

	 -- thêm m¾i b¡t ð¥u buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890069_Buff_MianYi1,  0  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890069_Buff_MianYi2,  0  )

	 -- n£ng ðßa AI....
	 x890069_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí tiªn vào trÕng thái chiªn ð¤u ....
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890069_IDX_CombatFlag,  1  )

end


--**********************************
-- r¶i ði chiªn ð¤u ....
--**********************************
function  x890069_OnLeaveCombat(sceneId,  selfId)

	 -- n£ng ðßa AI....
	 x890069_ResetMyAI(  sceneId,  selfId  )

	 -- thü tiêu mình ....
	 LuaFnDeleteMonster(  sceneId,  selfId  )

end


--**********************************
-- giªt chªt ð¸ch nhân ....
--**********************************
function  x890069_OnKillCharacter(sceneId,  selfId,  targetId)

end


--**********************************
-- tØ vong ....
--**********************************
function  x890069_OnDie(  sceneId,  selfId,  killerId  )
	CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)

	 -- n£ng ðßa AI....
	 x890069_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí ðã khiêu chiªn quá lý thu thüy ....
	 CallScriptFunction(  x890069_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "DingChunQiu",  2  )

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
	 	 str  =  format(" Trên núi Thi¬u Th¤t mµt tr§n cu°ng phong n±i lên, ùng ùng th¤y tiªng s¤m t× b¥u tr¶i ðánh xu¯ng,#G nguyên do là #{_INFOUSR%s} lãnh ðÕo ðµi ngû cùng Ðinh Xuân Thu quyªt chiªn.#W Tr§n chiªn kªt thúc, Ðinh Xuân Thu b¸ trúng Sinh TØ Phù, ngã quÜ ð¥u hàng",  playerName);

	 	 AddGlobalCountNews(  sceneId,  str  )
	 end

CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  selfId,  killerId,2  )	 
	 
end


--**********************************
-- n£ng ðßa AI....
--**********************************
function  x890069_ResetMyAI(  sceneId,  selfId  )

	 -- n£ng ðßa tham s± ....
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_StopWatch,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillA_CD,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_HPStep,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Type,  1  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillC_CD,  x890069_SkillC_CD  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillD_CD,  x890069_SkillD_CD  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_KuangBaoTimer,  0  )

	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890069_IDX_CombatFlag,  0  )
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890069_IDX_IsKuangBaoMode,  0  )

end

--**********************************
--A kÛ nång nh¸p tim ....
--**********************************
function  x890069_TickSkillA(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillA_CD  )
	 if  cd  >  nTick  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillA_CD,  cd-nTick  )
	 	 return  0
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillA_CD,  x890069_SkillA_CD-(nTick-cd)  )
	 	 return  x890069_UseSkillA(  sceneId,  selfId  )
	 end

end

--**********************************
--B kÛ nång nh¸p tim ....
--**********************************
function  x890069_TickSkillB(  sceneId,  selfId,  nTick  )

	 local  CurPercent  =  GetHp(  sceneId,  selfId  )  /  GetMaxHp(  sceneId,  selfId  )
	 local  LastStep  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_HPStep  )
	 local  CurStep  =  0
	 if  CurPercent  <=  0.3333  then
	 	 CurStep  =  2
	 elseif  CurPercent  <=  0.6666  then
	 	 CurStep  =  1
	 end

	 if  CurStep  >  LastStep  then

	 	 -- thiªt trí tham s± ....
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_HPStep,  CurStep  )
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step,  15  )
	 	 local  JianWuType  =  random(  getn(x890069_SkillB_SkillIDTbl)  )
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Type,  JianWuType  )

	 	 -- kêu thoÕi ....
	 	 MonsterTalk(sceneId,  -1,  "",  x890069_SkillB_TalkTbl[JianWuType]  )

	 	 -- ð¬ toàn trß¶ng cänh pháo bông ....
	 	 LuaFnSetSceneWeather(sceneId,  x890069_SkillB_WeatherTbl[JianWuType],  15000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  9,  130,  127,  3000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  9,  130,  125,  3000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  11,  130,  129,  3000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  11,  137,  132,  3000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  11,  138,  121,  3000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  11,  121,  121,  3000  )
	 	 CreateSpecialObjByDataIndex(sceneId,  selfId,  11,  120,  133,  3000  )

	 	 -- ð¯i v¾i mình sØ døng vô ích kÛ nång ....
	 	 --local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 	 --LuaFnUnitUseSkill(  sceneId,  selfId,  x890069_SkillB_SkillIDTbl[JianWuType],  selfId,  x,  z,  0,  1  )

	 	 return  1

	 end

	 return  0

end

--**********************************
--C kÛ nång nh¸p tim ....
--**********************************
function  x890069_TickSkillC(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillC_CD  )
	 if  cd  >  nTick  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillC_CD,  cd-nTick  )
	 	 return  0
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillC_CD,  x890069_SkillC_CD-(nTick-cd)  )
	 	 return  x890069_UseSkillC(  sceneId,  selfId  )
	 end

end

--**********************************
--D kÛ nång nh¸p tim ....
--**********************************
function  x890069_TickSkillD(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillD_CD  )
	 if  cd  >  nTick  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillD_CD,  cd-nTick  )
	 	 return  0
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillD_CD,  x890069_SkillD_CD-(nTick-cd)  )
	 	 return  x890069_UseSkillD(  sceneId,  selfId  )
	 end

end

--**********************************
--E kÛ nång nh¸p tim ....
--**********************************
function  x890069_TickSkillE(  sceneId,  selfId,  nTick  )

	 -- nªu nhß ðang dùng B kÛ nång là trß¾c ch¶ ðþi ....
	 if  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step  )  >  0  then
	 	 return  0
	 end

	 -- ki¬m tr¡c có hay không ðªn cu°ng bÕo th¶i ði¬m ....
	 local  kbTime  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_KuangBaoTimer  )
	 if  kbTime  <  x890069_EnterKuangBaoTime  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_KuangBaoTimer,  kbTime+nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890069_IDX_IsKuangBaoMode,  1  )
	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890069_SkillE_Buff1,  0  )
	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890069_SkillE_Buff2,  0  )
	 	 return  1

	 end

end

--**********************************
-- giây bi¬u nh¸p tim ....
--**********************************
function  x890069_TickStopWatch(  sceneId,  selfId,  nTick  )

	 -- hÕn chª m²i giây m¾i có th¬ thi hành mµt l¥n ....
	 local  time  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_StopWatch  )
	 if  (time  +  nTick)  >  1000  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_StopWatch,  time+nTick-1000  )
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_StopWatch,  time+nTick  )
	 	 return
	 end


	 -------------------------
	 -- kiªm vû kÛ nång suy lu§n ....
	 -------------------------
	 local  buffStep  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step  )
	 local  skillType  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Type  )
	 if  buffStep  >=  1  and  buffStep  <=  15  then

	 	 -- tìm kiªm phù mçn nghi ....
	 	 local  bossId  =  CallScriptFunction(  x890069_g_FuBenScriptId,  "FindBOSS",  sceneId,  "LiFan_NPC"  )
	 	 if  bossId  <=  0  then
	 	 	 return  0
	 	 end

	 	 -- ð¬ cho phù mçn nghi cho nhà ch½i thêm buff....
	 	 local  buffTbl  =  x890069_SkillB_BuffIDTbl[skillType]
	 	 local  buffId  =  buffTbl[16-buffStep]
	 	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 for  i=0,  nHumanCount-1  do
	 	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  nHumanId)  ==  1  then
	 	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  bossId,  bossId,  nHumanId,  buffId,  0  )
	 	 	 end
	 	 end

	 end

	 if  buffStep  >  0  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step,  buffStep-1  )
	 end


end

--**********************************
-- sØ døng A kÛ nång ....
--**********************************
function  x890069_UseSkillA(  sceneId,  selfId  )

	 -- nªu nhß ðang dùng B kÛ nång là nhäy quá ....
	 if  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step  )  >  0  then
	 	 return  0
	 end

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

	 -- ð¯i v¾i mình sØ døng mµt vô ích kÛ nång ....
	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890069_SkillA_ID,  selfId,  x,  z,  0,  1  )

	 -- cho nhà ch½i thêm th¤t minh buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  PlayerId,  x890069_SkillA_Buff,  0  )

	 return  1

end

--**********************************
-- sØ døng C kÛ nång ....
--**********************************
function  x890069_UseSkillC(  sceneId,  selfId  )

	 -- nªu nhß ðang dùng B kÛ nång là nhäy quá ....
	 if  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step  )  >  0  then
	 	 return  0
	 end

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890069_SkillC_ID,  selfId,  x,  z,  0,  1  )
	 return  1

end

--**********************************
-- sØ døng D kÛ nång ....
--**********************************
function  x890069_UseSkillD(  sceneId,  selfId  )

	 -- nªu nhß ðang dùng B kÛ nång là nhäy quá ....
	 if  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890069_IDX_SkillB_Step  )  >  0  then
	 	 return  0
	 end

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

	 -- sØ døng vô ích kÛ nång ....
	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890069_SkillD_ID,  selfId,  x,  z,  0,  1  )

	 -- · nên nhà ch½i dß¾i bàn chân ð¬ bçy r§p ....
	 x,z  =  GetWorldPos(  sceneId,  PlayerId  )
	 CreateSpecialObjByDataIndex(sceneId,  selfId,  x890069_SkillD_SpecObj,  x,  z,  0)

	 return  1

end
