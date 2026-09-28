--  dçn tß·ng NPC

x890058_g_scriptId  =  890058
x890058_g_BossID  =  {}
x890058_g_BossID[70]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890058_g_BossID[80]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890058_g_BossID[90]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890058_g_BossID[100]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890058_g_BossID[110]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890058_g_BossID[120]  =  {16303,16304,16305,16306,16307,16308,16309,16310,16311,16312,16313,16314,16315,16316,16317,16318,16319,16320,16321,16322,16323,16324,16325,16326,16327}
x890058_g_MissBoss  =  {8,9,10,11,12}
--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x890058_OnDefaultEvent(  sceneId,  selfId,  targetId  )
              local  mosetername  =  GetName(  sceneId,  targetId  )
	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  " hß không äo cänh không phäi là t¯t nhß v§y xông ðích , m²i chiªn th¡ng phó bän bên trong m²i mµt BOSS , cûng có th¬ ðÕt ðßþc cao c¤p th¥n bí v§t ph¦m , phäi chú ý nguy hi¬m nga !"  )
	 	 AddNumText(  sceneId,  x890058_g_scriptId,  " khiêu chiªn   "..mosetername.."",  6,  200)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x890058_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
    local  mosetername  =  GetName(  sceneId,  targetId  )
    local      PlayerX,  PlayerZ  =  GetWorldPos(  sceneId,  targetId  )
    local      mosterid  =  targetId
                if  GetNumText()  ==  200  then
	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  "#{PMF_20080521_07}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	     end
	     if  PlayerX  ~=  PlayerZ  and  PlayerZ  ~=  48  then
                              	                 BeginEvent(  sceneId  )  
	                 	                       AddText(  sceneId,  "#G xin/m¶i ch÷n trß¾c chiªn t÷a ðµ ði¬m #48,48# ðích BOSS"  )
                            	                       EndEvent(  sceneId  )
                              	                 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return  
	 	 end
	 	 if    GetUnitReputationID(sceneId,targetId,targetId)  ~=  8  then
                              	                 BeginEvent(  sceneId  )  
	                 	                       AddText(  sceneId,  "#G ngài ðích ðµi ngû ðã b¡t ð¥u chiªn ð¤u , xin không c¥n tái di­n cà trách ! "  )
                            	                       EndEvent(  sceneId  )
                              	                 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return  
	 	 end

	 CallScriptFunction(  x890058_g_scriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
                LuaFnSendSpecificImpactToUnit(sceneId,  targetId,  targetId,  targetId,  152,  0)              
                SetUnitReputationID(sceneId,  targetId,  targetId,  28)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

	   end
end

--**********************************
-- ð« kÏ t¤t cä phó bän bên trong nhà ch½i ....
--**********************************
function  x890058_TipAllHuman(  sceneId,  Str  )

	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 for  i=0,  nHumanNum-1    do
	 	 local  PlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 if  LuaFnIsObjValid(  sceneId,  PlayerId  )  ==  1  and  LuaFnIsCanDoScriptLogic(  sceneId,  PlayerId  )  ==  1  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,  Str)
	 	 	 EndEvent(sceneId)
	 	 	 DispatchMissionTips(sceneId,  PlayerId)
	 	 end
	 end
end

function  x890058_OnDie(  sceneId,  objId,  killerId  )

	 local  nObjType  =  GetCharacterType(sceneId,  killerId);
	 local  nHumanId  =  killerId
	 if  nObjType  then	 	 
	 	 if  nObjType  ==  1  then
	 	 	 nHumanId  =  killerId;
	 	 elseif  nObjType  ==  3  then
	 	 	 nHumanId  =  GetPetCreator(sceneId,  killerId);
	 	 end
	 end
	 --RestoreHp(  sceneId,  nHumanId  )
	 --RestoreMp(  sceneId,  nHumanId  )
	 --RestoreRage(  sceneId,  nHumanId  )
	 local	 namHuman	 =  LuaFnGetName(  sceneId,  nHumanId  )
	 local	 namMonster=  LuaFnGetName(  sceneId,  objId  )
	 local	 namScene	 =  GetSceneName(  sceneId  )
	 
	 if  killmosternum  ==  nil  then
	 killmosternum  =  3
	 else
	 killmosternum  =  killmosternum  +  1
	 end
	 if    killmosternum  ~=  nil  and  killmosternum  <=  6  then
	 CallScriptFunction(  (890057),  "SetFubenTimer",sceneId,  killmosternum,1)
	 end  
	 if  killmosternum  ==  7  then
	   
	   killmosternum  =  nil
	   LuaFnSetCopySceneData_Param(sceneId,  4,  1)
	   end  
	   
	   
	   local  misid0  =  (GetMissionData(  sceneId,  nHumanId,  ZHOUTIANCEN  ))*5
	   local  tab  =  {}
	   for  i  =  1,getn(x890058_g_MissBoss)  do
	   tab[i]  =  LuaFnGetCopySceneData_Param(sceneId,  x890058_g_MissBoss[i])
	   end
	   if  misid0  <=  25  then
	   
	   sort(tab)
	   if  (tab[5]  >  misid0  )  and  (mod((GetMonsterDataID(  sceneId,  objId)+1),5)==  0  )  then
	   
	   local  MyLevel  =  floor(GetLevel(  sceneId,  nHumanId)/10)*10
	   if  MyLevel  <  70  then
	   MyLevel  =  70
	   elseif  MyLevel  >  120  then
	   MyLevel  =  120
	   end
	   local  SUCC  =  1
	   while  x890058_g_BossID[MyLevel][SUCC]  ~=  GetMonsterDataID(  sceneId,  objId)  do
	   SUCC  =SUCC  +  1
	   if  SUCC  >=  25  then
	   break
	   end
	   end
	   
	   if  mod(SUCC,5)  ==  0  and  SUCC  >  misid0  then
	   SetMissionData(  sceneId,  nHumanId,ZHOUTIANCEN,((misid0/5)+1)  )
	   end
	   
	   end
	   end
	 local  Wuxuexinde  =  GetMissionData(  sceneId,  nHumanId,  ZHOUTIANCEN  )*5+5+GetMissionData(  sceneId,  nHumanId,  ZHOUTIANCEN  )*5*LuaFnGetCopySceneData_Param(sceneId,  30)
	 local  Wuxuenum  =  GetMissionData(  sceneId,  nHumanId,  ZHOUTIANWUXUEXINDE  )
	 SetMissionData(  sceneId,  nHumanId,ZHOUTIANWUXUEXINDE,Wuxuenum+Wuxuexinde  )
	 local  dropitem  =  0
	 local  xinyanbeisu  =  (((LuaFnGetCopySceneData_Param(sceneId,  30))*(GetMissionData(  sceneId,  nHumanId,  ZHOUTIANCEN  )+1)*360)+1000)
	 local  aa  =  1
	 if  floor(xinyanbeisu/1000)  >=50  then  
	 	 aa  =5  
	 elseif  floor(xinyanbeisu/1000)  >=20  then  
	     aa  =  4
	 elseif  floor(xinyanbeisu/1000)  >=9  then  
	     aa  =  3
	 elseif  floor(xinyanbeisu/1000)  >=3  then  
	     aa  =  2	 
	 elseif  floor(xinyanbeisu/1000)  >=1  then  
	     aa  =  1	 
	 end  
	 for  i=1,aa  do  
	 AddMonsterDropItem(  sceneId,  objId,  nHumanId,  38000529)	 
	 end	 
	       --    if  dropitem  ==  0  then
	   --        message  =  format("#Y#{_INFOUSR%s} · #P hß không äo cänh #Y cùng ["..LuaFnGetName(  sceneId,  objId  ).."] ðÕi chiªn chín ngàn chín tråm hi®p , m¡t th¤y ["..LuaFnGetName(  sceneId,  objId  ).."] không ð¸ch lÕi #W#{_INFOUSR"..namHuman.."} r½i hoäng mà chÕy ,#Y#{_INFOUSR"..namHuman.."} lînh ngµ ðßþc #R"..Wuxuexinde.."#Y ði¬m võ h÷c tâm ð¡c ",  namHuman  );
	     --      else
	     --      message  =  format("#Y#{_INFOUSR%s} · #P hß không äo cänh #Y cùng ["..LuaFnGetName(  sceneId,  objId  ).."] ðÕi chiªn chín ngàn chín tråm hi®p , m¡t th¤y ["..LuaFnGetName(  sceneId,  objId  ).."] không ð¸ch lÕi #W#{_INFOUSR"..namHuman.."} ném xu¯ng #G"..dropitem.." t¶ ##{_ITEM38000529}##Y r½i hoäng mà chÕy ,#Y#{_INFOUSR"..namHuman.."} lînh ngµ ðßþc #R"..Wuxuexinde.."#Y ði¬m võ h÷c tâm ð¡c ",  namHuman  );
	     --      end
	           
	     --      AddGlobalCountNews(  sceneId,  message  )
	 --	 CallScriptFunction(  898992,  "MonsterOnDie",  sceneId,  objId,  killerId,18  )
end	 	