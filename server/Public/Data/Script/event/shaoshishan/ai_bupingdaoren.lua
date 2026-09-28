-- Phiêu Mi¬u phong   b¤t bình nói ngß¶i AI

--F	 # th¥m lôi # ð¯i v¾i mình dùng mµt vô ích kÛ nång .... cho thêm nhà ch½i thêm cá sau khi kªt thúc s¨ tr· v« ði«u chân v¯n ðích buff.... tr· v« ði«u lúc ð¬ cho BOSS cho kÏ ngß¶i chung quanh thêm thß½ng hàn buff cûng kêu thoÕi ....
--G  # tinh coi là # cho mình dùng mµt thêm buff ðích kÛ nång ....
--H  # pháo bông # ð¯i v¾i mình dùng mµt vô ích kÛ nång .... cho thêm nhà ch½i thêm cá sau khi kªt thúc s¨ tr· v« ði«u chân v¯n ðích buff.... tr· v« ði«u lúc kêu thoÕi ....
--I	 # b¢ng hæu # Trác B¤t Phàm lúc chªt cho mình dùng mµt thêm buff ðích kÛ nång ....


-- toàn trình cûng mang có mi­n d¸ch chª ð¸nh kÛ nång ðích buff....
-- cách m²i 30 giây ð¯i v¾i ngçu nhiên nhà ch½i ngçu nhiên sØ døng FH....
-- cách m²i 45 giây ð¯i v¾i mình sØ døng G....
-- tØ vong ho£c thoát khöi lúc chiªn ð¤u cho t¤t cä nhà ch½i thanh tr× FH ðích buff....
-- tØ vong lúc tìm kiªm b¤t bình nói ngß¶i .... thiªt trí kÏ c¥n sØ døng cu°ng bÕo kÛ nång ....
-- tØ vong lúc phát hi®n b¤t bình nói ngß¶i ðã chªt .... là khai sáng mµt ngß¶i khác BOSS....


-- chân v¯n s¯ 
x890068_g_ScriptId	 =  890068

-- phó bän suy lu§n chân v¯n s¯ ....
x890068_g_FuBenScriptId  =  890063

-- mi­n d¸ch Buff....
x890068_Buff_MianYi1	 =  10472	 -- mi­n d¸ch mµt ít m£t trái hi®u quä ....
x890068_Buff_MianYi2	 =  10471	 -- mi­n d¸ch bình thß¶ng ¦n thân ....

-- kÛ nång ....
--x890068_SkillID_F	 	 =  1037
x890068_BuffID_F1	 	 =  10255
x890068_BuffID_F2	 	 =  10256
x890068_SkillID_G	 	 =  589
x890068_SkillID_H	 	 =  599
x890068_BuffID_H	 	 =  18204
x890068_SkillID_I	 	 =  635
x890068_BuffID_I1	 	 =  6781
x890068_BuffID_I2	 	 =  6781

x890068_SkillCD_FH	 =	 30000
x890068_SkillCD_G	 	 =	 45000


x890068_MyName	 	 	 =  " Tß Mã lâm "	 -- tên cüa mình ....
x890068_BrotherName  =  " Diêu bá khi "	 	 -- huynh ð® ðích tên ....


--AI  Index....
x890068_IDX_KuangBaoMode	 =  1	 -- cu°ng bÕo mô thÑc ....0 không cu°ng bÕo   1 c¥n tiªn vào cu°ng bÕo   2 ðã tiªn vào cu°ng bÕo 
x890068_IDX_CD_SkillFH	 	 =  2	 --FH kÛ nång ðích CD....
x890068_IDX_CD_SkillG	 	 	 =  3	 --G kÛ nång ðích CD....
x890068_IDX_CD_Talk	 	 	 	 =  4	 --FH kÛ nång kêu thoÕi ðích CD....

x890068_IDX_CombatFlag  	 	 =  1	 -- có ch°ng hay chßa v¾i trÕng thái chiªn ð¤u ðích d¤u hi®u ....

--**********************************
-- m¾i b¡t ð¥u hóa ....
--**********************************
function  x890068_OnInit(sceneId,  selfId)
	 -- n£ng ðßa AI....
	 x890068_ResetMyAI(  sceneId,  selfId  )
end


--**********************************
-- nh¸p tim ....
--**********************************
function  x890068_OnHeartBeat(sceneId,  selfId,  nTick)

	 -- ki¬m tr¡c có phäi hay không chªt ....
	 if  LuaFnIsCharacterLiving(sceneId,  selfId)  ~=  1  then
	 	 return
	 end

	 -- ki¬m tr¡c có hay không không có · ðây trÕng thái chiªn ð¤u ....
	 if  0  ==  MonsterAI_GetBoolParamByIndex(  sceneId,  selfId,  x890068_IDX_CombatFlag  )  then
	 	 return
	 end

	 --FH kÛ nång nh¸p tim ....
	 if  1  ==  x890068_TickSkillFH(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --G kÛ nång nh¸p tim ....
	 if  1  ==  x890068_TickSkillG(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

	 --I kÛ nång nh¸p tim ....
	 if  1  ==  x890068_TickSkillI(  sceneId,  selfId,  nTick  )  then
	 	 return
	 end

end


--**********************************
-- tiªn vào chiªn ð¤u ....
--**********************************
function  x890068_OnEnterCombat(sceneId,  selfId,  enmeyId)

	 -- thêm m¾i b¡t ð¥u buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890068_Buff_MianYi1,  0  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890068_Buff_MianYi2,  0  )

	 -- n£ng ðßa AI....
	 x890068_ResetMyAI(  sceneId,  selfId  )

	 -- thiªt trí tiªn vào trÕng thái chiªn ð¤u ....
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890068_IDX_CombatFlag,  1  )

end


--**********************************
-- r¶i ði chiªn ð¤u ....
--**********************************
function  x890068_OnLeaveCombat(sceneId,  selfId)

	 -- n£ng ðßa AI....
	 x890068_ResetMyAI(  sceneId,  selfId  )

	 -- l¥n l¸ch cänh tßþng trong t¤t cä trách .... tìm kiªm huynh ð® cûng ðem thü tiêu ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  x890068_BrotherName  ==  GetName(  sceneId,  MonsterId  )  then
	 	 	 LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 end
	 end

	 -- thü tiêu mình ....
	 LuaFnDeleteMonster(  sceneId,  selfId  )

end


--**********************************
-- giªt chªt ð¸ch nhân ....
--**********************************
function  x890068_OnKillCharacter(sceneId,  selfId,  targetId)

end


--**********************************
-- tØ vong ....
--**********************************
function  x890068_OnDie(  sceneId,  selfId,  killerId  )

	 -- n£ng ðßa AI....
	 x890068_ResetMyAI(  sceneId,  selfId  )

	 local  bFind  =  0

	 -- l¥n l¸ch cänh tßþng trong t¤t cä trách .... tìm kiªm huynh ð® .... cho kÏ thiªt trí c¥n sØ døng cu°ng bÕo kÛ nång ....
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  x890068_BrotherName  ==  GetName(  sceneId,  MonsterId  )  and  LuaFnIsCharacterLiving(sceneId,  MonsterId)  ==  1  then
	 	 	 bFind  =  1
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  MonsterId,  x890068_IDX_KuangBaoMode,  1  )
	 	 end
	 end

	 -- nªu nhß không tìm ðßþc huynh ð® là nói rõ li«n còn dß lÕi mình mµt cái ....
	 if  0  ==  bFind  then
	 	 -- khai sáng ðoan mµc nguyên ....
	 	 local  MstId  =  CallScriptFunction(  x890068_g_FuBenScriptId,  "CreateBOSS",  sceneId,  "YouDanZhi_BOSS",  -1,  -1  )
	 	 LuaFnNpcChat(sceneId,  MstId,  0,  "#{CJG_101231_244}")
	 	 -- thiªt trí ðã khiêu chiªn quá song tØ ....
	 	 CallScriptFunction(  x890068_g_FuBenScriptId,  "SetBossBattleFlag",  sceneId,  "ShuangZi",  2  )
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
	 	 str  =  format("#{_INFOUSR%s} mang ðµi ngû · Thiªu Th¤t S½n d­ dàng ðánh bÕi #G Mµ Dung Bác #W. ",  playerName);

	 	 AddGlobalCountNews(  sceneId,  str  )
	 end


CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  selfId,  killerId,2  )	 

end


--**********************************
-- n£ng ðßa AI....
--**********************************
function  x890068_ResetMyAI(  sceneId,  selfId  )

	 -- n£ng ðßa tham s± ....
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_KuangBaoMode,  0  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillFH,  x890068_SkillCD_FH  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillG,  x890068_SkillCD_G  )
	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_Talk,  0  )
	 MonsterAI_SetBoolParamByIndex(  sceneId,  selfId,  x890068_IDX_CombatFlag,  0  )

	 -- cho t¤t cä nhà ch½i thanh tr× FH ðích buff....
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanCount-1  do
	 	 local  nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(sceneId,  nHumanId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  nHumanId)  ==  1  then
	 	 	 LuaFnCancelSpecificImpact(  sceneId,  nHumanId,  x890068_BuffID_F1  )
	 	 	 LuaFnCancelSpecificImpact(  sceneId,  nHumanId,  x890068_BuffID_H  )
	 	 end
	 end

end


--**********************************
--FH kÛ nång nh¸p tim ....
--**********************************
function  x890068_TickSkillFH(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillFH  )
	 if  cd  >  nTick  then

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillFH,  cd-nTick  )
	 	 return  0

	 else

	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillFH,  x890068_SkillCD_FH-(nTick-cd)  )

	 	 -- ngçu nhiên sØ døng FH....
	 	 if  random(100)  <  50  then
	 	 	 return  x890068_UseSkillF(  sceneId,  selfId  )
	 	 else
	 	 	 return  x890068_UseSkillH(  sceneId,  selfId  )
	 	 end

	 end

end


--**********************************
--G kÛ nång nh¸p tim ....
--**********************************
function  x890068_TickSkillG(  sceneId,  selfId,  nTick  )

	 -- ð±i m¾i kÛ nång CD....
	 local  cd  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillG  )
	 if  cd  >  nTick  then
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillG,  cd-nTick  )
	 	 return  0
	 else
	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_CD_SkillG,  x890068_SkillCD_G-(nTick-cd)  )
	 	 return  x890068_UseSkillG(  sceneId,  selfId  )
	 end

end


--**********************************
--I kÛ nång nh¸p tim ....
--**********************************
function  x890068_TickSkillI(  sceneId,  selfId,  nTick  )

	 -- ðÕt ðßþc trß¾c m£t cu°ng bÕo mode....
	 local  CurMode  =  MonsterAI_GetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_KuangBaoMode  )

	 if  CurMode  ==  0  or  CurMode  ==  2  then

	 	 -- nªu nhß không c¥n cu°ng bÕo ho£c là ðã cu°ng bÕo li­u là tr· v« ....
	 	 return  0

	 elseif  CurMode  ==  1  then

	 	 -- nªu nhß c¥n cu°ng bÕo là sØ døng cu°ng bÕo kÛ nång ....
	 	 local  ret  =    x890068_UseSkillI(  sceneId,  selfId  )
	 	 if  ret  ==  1  then
	 	 	 MonsterAI_SetIntParamByIndex(  sceneId,  selfId,  x890068_IDX_KuangBaoMode,  2  )
	 	 	 return  1
	 	 else
	 	 	 return  0
	 	 end

	 end

end


--**********************************
-- sØ døng F kÛ nång ....
--**********************************
function  x890068_UseSkillF(  sceneId,  selfId  )

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

	 -- ð¯i v¾i mình sØ døng vô ích kÛ nång ....
	 --local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 --LuaFnUnitUseSkill(  sceneId,  selfId,  x890068_SkillID_F,  selfId,  x,  z,  0,  1  )

	 -- cho nhà ch½i thêm sau khi kªt thúc tr· v« ði«u chân v¯n ðích buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  PlayerId,  PlayerId,  PlayerId,  x890068_BuffID_F1,  0  )

	 return  1

end


--**********************************
-- sØ døng G kÛ nång ....
--**********************************
function  x890068_UseSkillG(  sceneId,  selfId  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890068_SkillID_G,  selfId,  x,  z,  0,  1  )
	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_218}"  )
	 return  1

end


--**********************************
-- sØ døng H kÛ nång ....
--**********************************
function  x890068_UseSkillH(  sceneId,  selfId  )

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

	 -- ð¯i v¾i mình sØ døng vô ích kÛ nång ....
	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890068_SkillID_H,  selfId,  x,  z,  0,  1  )

	 -- cho nhà ch½i thêm sau khi kªt thúc tr· v« ði«u chân v¯n ðích buff....
	 LuaFnSendSpecificImpactToUnit(  sceneId,  PlayerId,  PlayerId,  PlayerId,  x890068_BuffID_H,  0  )

	 return  1

end


--**********************************
-- sØ døng I kÛ nång ....
--**********************************
function  x890068_UseSkillI(  sceneId,  selfId  )

	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890068_BuffID_I1,  5000  )
	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x890068_BuffID_I2,  5000  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )
	 LuaFnUnitUseSkill(  sceneId,  selfId,  x890068_SkillID_I,  selfId,  x,  z,  0,  1  )

	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_230}"  )

	 return  1

end


--**********************************
-- th¥m lôi cùng pháo bông ðích buff lúc kªt thúc tr· v« ði«u v¯n tiªp l¶i ....
--**********************************
function  x890068_OnImpactFadeOut(  sceneId,  selfId,  impactId  )

	 -- tìm kiªm BOSS....
	 local  bossId  =  -1
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  x890068_MyName  ==  GetName(  sceneId,  MonsterId  )  then
	 	 	 bossId  =  MonsterId
	 	 end
	 end

	 -- không tìm ðßþc là tr· v« ....
	 if  bossId  ==  -1  then
	 	 return
	 end

	 -- nªu nhß là pháo bông ðích buff là ð¬ cho BOSS kêu thoÕi ....
	 if  impactId  ==  x890068_BuffID_H  then
	 	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_166}"..GetName(  sceneId,  selfId  ).."#{CJG_101231_168}"  )
	 	 return
	 end

	 -- nªu nhß là th¥m lôi buff.... là ð¬ cho BOSS cho phø c§n nhà ch½i thêm mµt t±n thß½ng ðích buff cûng kêu thoÕi ....
	 if  impactId  ==  x890068_BuffID_F1  then

	 	 MonsterTalk(  sceneId,  -1,  "",  "#{CJG_101231_85}"..GetName(  sceneId,  selfId  ).."#{CJG_101231_84}"  )

	 	 local  x  =  0
	 	 local  z  =  0
	 	 local  xx  =  0
	 	 local  zz  =  0
	 	 x,z  =  GetWorldPos(  sceneId,selfId  )
	 	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 for  i=0,  nHumanNum-1    do
	 	 	 local  PlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	 if  LuaFnIsObjValid(sceneId,  PlayerId)  ==  1  and  LuaFnIsCanDoScriptLogic(sceneId,  PlayerId)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  PlayerId)  ==  1  and  PlayerId  ~=  selfId  then
	 	 	 	 xx,zz  =  GetWorldPos(sceneId,PlayerId)
	 	 	 	 if  (x-xx)*(x-xx)  +  (z-zz)*(z-zz)  <  8*8  then
	 	 	 	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  bossId,  bossId,  PlayerId,  x890068_BuffID_F2,  0  )
	 	 	 	 end
	 	 	 end
	 	 end

	 	 return

	 end

end
