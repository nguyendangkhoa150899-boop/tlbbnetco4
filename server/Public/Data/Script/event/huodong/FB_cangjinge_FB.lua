--  807005
--  tÕm th¶i viªt chân v¯n , t°n tÕi bug , chï làm ðan ky giäi trí , nªu dùng cho buôn bán , tñ gánh l¤y h§u quä --by  khói song 

--************************************************************************
x807005_g_ScriptId  =  807005

--************************************************************************

--x807005_g_Item  =  39910005

x807005_g_CopySceneName  =  "Tàng kinh các"

x807005_g_CopySceneType  =  FUBEN_PORTECT_PET  	 -- phó bän loÕi hình , ð¸nh nghîa · ScriptGlobal.lua bên trong 

x807005_g_CloseTime  =  30*60      ----- phó bän t°n tÕi th¶i gian 
x807005_g_XiaoGuaiCount  =  13      ----- ti¬u quái cà trách s¯ lßþng 
x807005_g_XiaoGuaiTime  =  60      ----- m²i ba ti¬u quái ðích cách nhau th¶i gian   
x807005_g_CopySceneMap  =  "cangjingge.nav"
x807005_g_Exit  =  "cangjingge.ini"
x807005_g_LimitMembers  =  1	 	 	 	 -- có th¬ vào phó bän ðích nhö nh¤t ðµi ngû nhân s¯ 
x807005_g_TickTime  =  1	 	 	 	 	 	 -- tr· v« ði«u chân v¯n ðích lúc chuông / ð°ng h° th¶i gian ( ð½n v¸ : giây / l¥n )
x807005_g_LimitTotalHoldTime  =  360    -- phó bän có th¬ s¯ng sót ðích th¶i gian ( ð½n v¸ : s¯ l¥n ), nªu nhß lúc này ðang lúc ðªn , là nhi®m vø s¨ th¤t bÕi 
x807005_g_LimitTimeSuccess  =  500	 -- phó bän th¶i gian hÕn chª ( ð½n v¸ : s¯ l¥n ) , nªu nhß lúc này ðang lúc ðªn , nhi®m vø hoàn thành 
x807005_g_CloseTick  =  3	 	 	 	 	 	 -- phó bän t¡t trß¾c cûng tính gi¶ ( ð½n v¸ : s¯ l¥n )
x807005_g_NoUserTime  =  10	 	 	 	 -- phó bän trung không có ai sau có th¬ tiªp tøc bäo t°n ðích th¶i gian ( ð½n v¸ : giây )
x807005_g_DeadTrans  =  0	 	 	 	 	 	 -- tØ vong d¶i ði mô thÑc , 0 : tØ vong sau còn có th¬ tiªp tøc · phó bän , 1 : tØ vong sau b¸ cßÞng chª d¶i ra phó bän 
x807005_g_Fuben_X  =  64	 	 	 	 	 	 -- tiªn vào phó bän ðích v¸ trí X
x807005_g_Fuben_Z  =  103	 	 	 	 	 	 -- tiªn vào phó bän ðích v¸ trí Z
x807005_g_Back_X  =  264	 	 	 	 	 	 	 -- nguyên cänh tßþng v¸ trí X
x807005_g_Back_Z  =  278	 	 	 	 	 	 	 -- nguyên cänh tßþng v¸ trí Z
x807005_g_Back_SceneId  =  18	 	 	 -- nguyên cänh tßþng Id

--  cänh tßþng Id
x807005_g_PetSceneId  =  18

x807005_g_SetpTime  =  1

x807005_g_SetpWaiteTime_1  =  15
x807005_g_SetpWaiteTime_2  =  25
x807005_g_SetpWaiteTime_3  =  35  
x807005_g_SetpWaiteTime_4  =  45
x807005_g_SetpWaiteTime_5  =  55
x807005_g_SetpWaiteTime_6  =  65
x807005_g_SetpWaiteTime_7  =  75
x807005_g_SetpWaiteTime_8  =  85  

------ vì quan quân   bên trái 
x807005_g_MonsterInfo_1  =  {id=13583,x=23,z=47,ai=9,ai_f=0,p=0  }

---    vì quan quân   bên phäi 
x807005_g_MonsterInfo_2  =  {id=13583,x=103,z=48,ai=9,ai_f=0,  p=1  }
	 	 	 	 	 	       
  ---- ðÕo sách ác tång bên trái 
x807005_g_MonsterInfo_3  =  {id=13574,x=23,z=47,ai=9  ,ai_f=0,  p=0  }
	 	 	 	 	 	       
  ---- ðÕo sách ác tång bên phäi 
x807005_g_MonsterInfo_4  =  {id=13574,x=103,z=48,ai=9  ,ai_f=0,  p=1  }
	 	 	 	 	 	       
  ----BOSS
x807005_g_MonsterInfo_5  =  {id=13592,x=64,z=32  ,ai=9  ,ai_f=234,  p=0  }
	 	 	 	 	 	       
  



------------ Thiªu Lâm vû tång ðích ID---------------
x807005_g_MonsterAI  =  {  {id=13565,ai=226},  
	 	 	 	 	 	 {id=13566,ai=226},
	 	 	 	 	 	 {id=13567,ai=226},
	 	 	 	 	 	 {id=13568,ai=226},
	 	 	 	 	 	 {id=13569,ai=226},
	 	 	 	 	 	 {id=13570,ai=226},
	 	 	 	 	 	 {id=13571,ai=226},
	 	 	 	 	 	 {id=13572,ai=226},
	 	 	 	 	 	 {id=13573,ai=226},
}
x807005_g_MonsterInfo_Count_1  =  10
x807005_g_MonsterInfo_Count_2  =  7
x807005_g_MonsterInfo_Count_3  =  8
x807005_g_MonsterInfo_Count_4  =  5
x807005_g_MonsterInfo_Count_5  =  5
x807005_g_MonsterInfo_Count_6  =  8
x807005_g_MonsterInfo_Count_7  =  20
--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ 
--**********************************
function  x807005_OnDefaultEvent(  sceneId,  selfId,  targetId  )
  
	 
	 if  GetNumText()==1010  then
	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId," B¥n tång g¥n ðây thông qua di­n toán cùng dò xét giang h° tin tÑc , hi¬u rõ ðã có mµt ðám ác tång nhi«u l¥n xâm nh§p Thiªu Lâm mu¯n ðoÕt l¤y Thiªu Lâm võ h÷c ði¬n t¸ch . mà Thiªu Lâm dÕo ch½i vû tång nhi«u · #G nhÕn nam #W tø h÷p , sau ðó tr· v« chùa trþ giúp . m²i ngày #G10 : 45?16 : 30?21 : 30 cùng 23 : 00#W chính là chúng ta tø h÷p ðích th¶i gian . ");
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 --  0
	 if  LuaFnHasTeam(sceneId,selfId)  <  1    then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#BTàng kinh các ");
	 	 	 AddText(sceneId,"tiªn vào phó bän c¥n mµt chi ðµi ngû . ");
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 --  2 , ki¬m tr¡c ðµi ngû có phäi hay không ðü nhân s¯ 
	 if  GetTeamSize(sceneId,selfId)  <  1    then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#BTàng kinh các ");
	 	 	 AddText(sceneId,"tiªn vào phó bän c¥n mµt chi ðµi ngû . ");
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 --  3 , ki¬m tr¡c nhà ch½i có phäi hay không ðµi trß·ng 
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId        then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#BTàng kinh các ");
	 	 	 AddText(sceneId,"tiªn vào phó bän c¥n mµt chi ðµi ngû . ");
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 --  4 , ki¬m tr¡c có phäi là ngß¶i hay không cûng ðªn n½i li­u 
	 if  GetTeamSize(sceneId,selfId)  ~=  GetNearTeamCount(sceneId,selfId)    then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#BTàng kinh các ");
	 	 	 AddText(sceneId,"tiªn vào phó bän c¥n mµt chi ðµi ngû . ");
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	 --  1 , nhà ch½i c¤p b§c 
	 local  nPlayerNum  =  GetNearTeamCount(sceneId,selfId)
	 local  strName  =  {}
	 strName[1]  =  ""
	 strName[2]  =  ""
	 strName[3]  =  ""
	 strName[4]  =  ""
	 strName[5]  =  ""
	 strName[6]  =  ""
	 local  ret  =  1
  	 
	 for  i=0,  nPlayerNum-1    do
	 	 local  nPlayerId  =  GetNearTeamMember(sceneId,selfId,  i)
	 	 if  GetLevel(sceneId,  nPlayerId)  <  40    then
	 	 	 ret  =  0
	 	 	 strName[i+1]  =  GetName(sceneId,  nPlayerId)
	 	 end
	 end
	 
	 local  nCount  =  0
	 if  ret  ==  0    then
	 	 local  szAllName  =  ""
	 	 for  i=1,  6    do
	 	 	 if  strName[i]  ~=  ""    then
	 	 	 	 if  nCount  ==  0    then
	 	 	 	 	 szAllName  =  strName[i]
	 	 	 	 else
	 	 	 	 	 szAllName  =  szAllName  ..  "?"  ..  strName[i]
	 	 	 	 end
	 	 	 	 nCount  =  nCount+1
	 	 	 end
	 	 end
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,"#BTàng kinh các ");
	 	 	 AddText(sceneId,"trong ðµi ngû có thành viên ("  ..  szAllName  ..  ") c¤p b§c th¤p h½n 40 c¤p , không th¬ tham gia tàng kinh các . ");
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 
	   
	 	 x807005_MakeCopyScene(sceneId,  selfId,  targetId)
	 	 LuaFnDeleteMonster(sceneId,  targetId)
	   
end

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x807005_OnEnumerate(  sceneId,  selfId,  targetId  )
  
                AddText(sceneId,"B¥n tång g¥n ðây thông qua di­n toán cùng dò xét giang h° tin tÑc , hi¬u rõ ðã có mµt ðám ác tång nhi«u l¥n xâm nh§p Thiªu Lâm mu¯n ðoÕt l¤y Thiªu Lâm võ h÷c ði¬n t¸ch . mà Thiªu Lâm dÕo ch½i vû tång nhi«u · #G nhÕn nam #W tø h÷p , sau ðó tr· v« chùa trþ giúp . m²i ngày #G10 : 45?16 : 30?21 : 30 cùng 23 : 00#W chính là chúng ta tø h÷p ðích th¶i gian . ");
	 AddNumText(  sceneId,  x807005_g_ScriptId,  "Tàng kinh các ",10  ,-1    )
	 AddNumText(  sceneId,  x807005_g_ScriptId,  " liên quan t¾i tàng kinh các ",11  ,1010    )

end

--**********************************
-- ki¬m tr¡c tiªp nh§n ði«u ki®n 
--**********************************
function  x807005_CheckAccept(  sceneId,  selfId  )
	 
end

--**********************************
-- höi thåm nhà ch½i có hay không mu¯n ði vào phó bän 
--**********************************
function  x807005_AskEnterCopyScene(  sceneId,  selfId  )
	 
end

--**********************************
-- tiªp nh§n 
--**********************************
function  x807005_OnAccept(  sceneId,  selfId,  targetId  )
	 
end

--**********************************
-- nhà ch½i ð°ng ý tiªn vào phó bän 
--**********************************
function  x807005_AcceptEnterCopyScene(  sceneId,  selfId  )
	 
end

--**********************************
-- khai sáng phó bän 
--**********************************
function  x807005_MakeCopyScene(  sceneId,  selfId,  targetId  )
	 
	 --  sØ døng ðµi viên ðích c¤p b§c t¾i tính ra quái v§t ðích c¤p b§c 
	 local  param0  =  4;
	 local  param1  =  3;

	 -- cu¯i cùng kªt quä 
	 local  mylevel  =  0;

	 -- tÕm th¶i thay ð±i lßþng 
	 local  memId;
	 local  tempMemlevel  =  0;
	 local  level0  =  0;
	 local  level1  =  0;
	 local  i;
	 
	 local  nearmembercount  =  GetNearTeamCount(sceneId,selfId)
	 for	 i  =  0,  nearmembercount  -  1  do
	 	 memId  =  GetNearTeamMember(sceneId,  selfId,  i);
	 	 tempMemlevel  =  GetLevel(sceneId,  memId);
	 	 level0  =  level0  +  (tempMemlevel  ^  param0);
	 	 level1  =  level1  +  (tempMemlevel  ^  param1);
	 end
	 
	 if  level1  ==  0  then
	 	 mylevel  =  0
	 else
	 	 mylevel  =  level0/level1;
	 end
	 
	 if  nearmembercount  ==  -1    then    -- không có ðµi ngû 
	 	 mylevel  =  GetLevel(sceneId,  selfId)
	 end
	 
	 leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	 LuaFnSetSceneLoad_Map(sceneId,  "cangjingge.nav");  -- bän ð° là nh¤t ð¸nh phäi ch÷n l¤y , h½n næa nh¤t ð¸nh phäi · Config/SceneInfo.ini trong ph¯i trí häo 
	 LuaFnSetCopySceneData_TeamLeader(sceneId,  leaderguid);
	 LuaFnSetCopySceneData_NoUserCloseTime(sceneId,  x807005_g_NoUserTime*1000);
	 LuaFnSetCopySceneData_Timer(sceneId,  x807005_g_TickTime*1000);
	 LuaFnSetCopySceneData_Param(sceneId,  0,  x807005_g_CopySceneType);-- thiªt trí phó bän s¯ li®u , n½i này ðem 0 s¯ tác dçn ðích s¯ li®u thiªt trí vì 999 , dùng cho bày tö phó bän s¯ 999( con s¯ tñ ð¸nh nghîa )
	 LuaFnSetCopySceneData_Param(sceneId,  1,  x807005_g_ScriptId);-- ðem 1 s¯ s¯ li®u thiªt trí vì phó bän cänh tßþng sñ ki®n chân v¯n s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  2,  0);	 	 -- thiªt trí ð¸nh lúc khí ði«u døng s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  3,  -1);	 -- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ ,  m¾i b¡t ð¥u hóa 
	 LuaFnSetCopySceneData_Param(sceneId,  4,  0);	 	 -- thiªt trí phó bän t¡t d¤u hi®u ,  0 m· ra , 1 t¡t 
	 LuaFnSetCopySceneData_Param(sceneId,  5,  0);	 	 -- thiªt trí r¶i ði cûng tính gi¶ s¯ l¥n 
	 LuaFnSetCopySceneData_Param(sceneId,  6,  GetTeamId(sceneId,selfId));  -- bäo t°n ðµi ngû s¯ 
	 LuaFnSetCopySceneData_Param(sceneId,  7,  0)  ;	 -- giªt chªt Boss ðích s¯ lßþng 
	 
	 --  k¸ch tình dùng ðªn ðích thay ð±i lßþng thanh không 
	 for  i=8,  31  do
	 	 LuaFnSetCopySceneData_Param(sceneId,  i,  0)
	 end
	 
	 local  PlayerMaxLevel  =  GetHumanMaxLevelLimit()
	 local  iniLevel;
	 if  mylevel  <  10  then
	 	 iniLevel  =  1;
	 elseif  mylevel  <  PlayerMaxLevel  then
	 	 iniLevel  =  floor(mylevel/10);
	 else
	 	 iniLevel  =  floor(PlayerMaxLevel/10);
	 end
	 
	 --  sØ døng thÑ 8 v¸ , ghi chép quái v§t thñc tª c¤p b§c 
	 LuaFnSetCopySceneData_Param(sceneId,8,  mylevel)    --- thñc tª c¤p b§c 
	 LuaFnSetCopySceneData_Param(sceneId,9,  iniLevel)  --- l¤y chïnh c¤p b§c 
	 
	 LuaFnSetCopySceneData_Param(sceneId,10,  GetMonsterDataID(sceneId,  targetId))

	 local  x,z  =  GetWorldPos(sceneId,selfId)
	 LuaFnSetCopySceneData_Param(sceneId,16,  x)
	 LuaFnSetCopySceneData_Param(sceneId,17,  z)
	 
	 

	 local  bRetSceneID  =  LuaFnCreateCopyScene(sceneId)

	 BeginEvent(sceneId)
	 	 if  bRetSceneID>0  then
	 	 	 AddText(sceneId," phó bän khai sáng thành công ! ")
	 	 else
	 	 	 AddText(sceneId," phó bän s¯ lßþng ðã ðÕt thßþng hÕn , xin h§u thØ lÕi ! ")
	 	 end
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,selfId)
	 
end

--**********************************
-- phó bän sñ ki®n 
--**********************************
function  x807005_OnCopySceneReady(  sceneId,  destsceneId  )
	 
	 -- tiªn vào phó bän ðích quy t¡c 
	 --  1 , nªu nhß cái này vån ki®n không có h÷p thành ðµi , li«n truy«n t¯ng cái này nhà ch½i mình tiªn vào phó bän 
	 --  2,  nªu nhß nhà ch½i có ðµi ngû , nhßng là nhà ch½i không phäi là ðµi trß·ng , li«n truy«n t¯ng mình tiªn vào phó bän 
	 --  3 , nªu nhß nhà ch½i có ðµi ngû , h½n næa cái này nhà ch½i là ðµi trß·ng , li«n truy«n t¯ng mình và phø c§n ðµi hæu cùng nhau ði vào 

	 LuaFnSetCopySceneData_Param(destsceneId,  3,  sceneId)  -- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ 
	 leaderguid    =  LuaFnGetCopySceneData_TeamLeader(destsceneId)
	 leaderObjId  =  LuaFnGuid2ObjId(sceneId,leaderguid)
	 
	 if  LuaFnIsCanDoScriptLogic(  sceneId,  leaderObjId  )  ~=  1  then	 	 	 --  xØ vu không cách nào thi hành suy lu§n ðích trÕng thái 
	 	 return
	 end
	 
	 --  ki¬m tr¡c nhà ch½i có phäi hay không có ðµi ngû 
	 if  LuaFnHasTeam(  sceneId,  leaderObjId  )  ==  0    then      --  không có ðµi ngû 
	 	 x807005_GotoScene(sceneId,  leaderObjId,  destsceneId)
	 else
	 	 if  IsCaptain(sceneId,  leaderObjId)  ==  0    then
	 	 	 x807005_GotoScene(sceneId,  leaderObjId,  destsceneId)
	 	 else
	 	 	 local	 nearteammembercount  =  GetNearTeamCount(  sceneId,  leaderObjId)  
	 	 	 local  mems  =  {}
	 	 	 for	 i=0,nearteammembercount-1  do
	 	 	 	 mems[i]  =  GetNearTeamMember(sceneId,  leaderObjId,  i)
	 	 	 	 x807005_GotoScene(sceneId,  mems[i],  destsceneId)
	 	 	 end
	 	 end
	 end

end

function  x807005_GotoScene(sceneId,  ObjId,  destsceneId)
	 NewWorld(  sceneId,  ObjId,  destsceneId,  x807005_g_Fuben_X,  x807005_g_Fuben_Z)  ;
end


--**********************************
-- có nhà ch½i tiªn vào phó bän sñ ki®n 
--**********************************
function  x807005_OnPlayerEnter(  sceneId,  selfId  )
	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%10",  -1,  "0",  sceneId,  x807005_g_Fuben_X,  x807005_g_Fuben_Z  )
	 SetUnitCampID(sceneId,  selfId,  selfId,  100)
	 x807005_TipAllHuman(  sceneId,  "Thiªt sách ác tång ðem v¾i 15 giây sau b¡t ð¥u tiªn công , chú ý · 20 phút ðßa b÷n h÷ toàn bµ ðánh lui ! "  )
	 ---AddGlobalCountNews  (  sceneId,  " thiªt sách ác tång ðem v¾i 15 giây sau b¡t ð¥u tiªn công , chú ý · 20 phút ðßa b÷n h÷ toàn bµ ðánh lui ! "  )	 
end

--**********************************
-- có nhà ch½i · phó bän trung tØ vong sñ ki®n 
--**********************************
function  x807005_OnHumanDie(  sceneId,  selfId,  killerId  )
	 
end

--**********************************
-- buông tha cho 
--**********************************
function  x807005_OnAbandon(  sceneId,  selfId  )
	 
end

--**********************************
--  tr· v« thành , chï có thành ph¯ nhi®m vø phó bän có th¬ ði«u døng này tiªp l¶i 
--**********************************
function  x807005_BackToCity(  sceneId,  selfId  )
	 
end

--**********************************
-- tiªp tøc 
--**********************************
function  x807005_OnContinue(  sceneId,  selfId,  targetId  )
	 
end	 

--**********************************
-- ki¬m tr¡c có ðßþc hay không ð« giao 
--**********************************
function  x807005_CheckSubmit(  sceneId,  selfId,  selectRadioId  )
	 
end

--**********************************
-- ð« giao 
--**********************************
function  x807005_OnSubmit(  sceneId,  selfId,  targetId,  selectRadioId  )
	 
end

  
--**********************************
-- ð« kÏ t¤t cä phó bän bên trong nhà ch½i 
--**********************************
function  x807005_TipAllHuman(  sceneId,  Str  )
	 --  ðÕt ðßþc cänh tßþng trong ð¥u t¤t cä m÷i ngß¶i 
	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 
	 --  không có ai ðích cänh tßþng , cái gì ð«u không làm 
	 if  nHumanNum  <  1  then
	 	 return
	 end
	 
	 for  i=0,  nHumanNum-1    do
	 	 local  PlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  Str)
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,  PlayerId)
	 end
end

--**********************************
-- giªt chªt quái v§t ho£c nhà ch½i 
--**********************************
function  x807005_OnKillObject(  sceneId,  selfId,  objdataId,  objId  )
	 
end

--**********************************
-- tiªn vào khu vñc sñ ki®n 
--**********************************
function  x807005_OnEnterZone(  sceneId,  selfId,  zoneId  )
	 
end

--**********************************
-- ðÕo cø sØa ð±i 
--**********************************
function  x807005_OnItemChanged(  sceneId,  selfId,  itemdataId  )
	 
end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n 
--**********************************
function  x807005_OnCopySceneTimer(  sceneId,  nowTime  )
	 
	 	 
	 -- phó bän lúc chuông / ð°ng h° h÷c l¤y cùng thiªt trí 
	 -- l¤y ðßþc ðã thi hành ðích ð¸nh lúc s¯ l¥n 
	 local  TickCount  =  LuaFnGetCopySceneData_Param(  sceneId,  2  )
	 TickCount  =  TickCount  +  1
	 -- thiªt trí m¾i ð¸nh lúc khí ði«u døng s¯ l¥n 
	 LuaFnSetCopySceneData_Param(  sceneId,  2,  TickCount  )
	 -- phó bän t¡t d¤u hi®u 
	 local  leaveFlag  =  LuaFnGetCopySceneData_Param(  sceneId,  4  )
        local  nLastTime  =  x807005_g_CloseTime
	 
	 --  tính gi¶ khí chü yªu mu¯n dña theo th¶i gian t¾i an bài cà trách 
	 local  nPreTime  =  LuaFnGetCopySceneData_Param(sceneId,  11)
	 local  nCurTime  =  LuaFnGetCurrentTime()
	 
	 	 
	 local  shijianTime  =  LuaFnGetCopySceneData_Param(sceneId,13)    --- ghi chép 
	   
	 local  nPreTime_1  =  LuaFnGetCopySceneData_Param(sceneId,  14)      
	 
	 local  NndTime  =  LuaFnGetCopySceneData_Param(sceneId,  21)      ------- kªt thúc th¶i gian d¤u hi®u 
	 local  nBeginTimeFlag  =  LuaFnGetCopySceneData_Param(sceneId,  22)    ---- lúc b¡t ð¥u ðang lúc d¤u hi®u 

	 if  TickCount  ==  1    then
	 	 local  nMonterLevel  =  LuaFnGetCopySceneData_Param(sceneId,  8)
	 	 local  nMonterIniID  =  LuaFnGetCopySceneData_Param(sceneId,  9)
	 	 local  nMonterID    =  LuaFnGetCopySceneData_Param(sceneId,  10)	 	 
	 	 local  nAi  =  0
	 	 for  i=1,  5    do
	 	 	 if  x807005_g_MonsterAI[i].id  ==  nMonterID    then
	 	 	 	 nAi  =  x807005_g_MonsterAI[i].ai
	 	 	 end
	 	 end
	 	 
	 	 local  nRetrievalMonterID  =  0
	 	 if  nMonterIniID  >=  11  then
	 	       nRetrievalMonterID  =  nMonterID  +  8	 
	 	 else
	 	       nRetrievalMonterID  =  nMonterID  +  nMonterIniID  -  3	 	 
	 	 end	 	 
	 	 local  nNpcId  =  LuaFnCreateMonster(sceneId,  nRetrievalMonterID,64,  105,  9  ,  226  ,  -1  )
	 	 SetUnitCampID(sceneId,  nNpcId,  nNpcId,  100)
	 	 SetCharacterTitle(sceneId,  nNpcId,  "Thiªu Lâm cao tång ")
	 	 SetMonsterFightWithNpcFlag(sceneId,  nNpcId,  1)
	 	 local  nStep  =  LuaFnGetCopySceneData_Param(sceneId,  12)	 	   	 	 	   
	 	 LuaFnSetCopySceneData_Param(sceneId,  15,  nNpcId)
	 end
	 
	 
  
	 if    TickCount  ==  10      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u l¥n ð¥u tiên công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem b¡t ð¥u l¥n sau tiªn công ! "  )
	 	 x807005_CreateNpcBOSS(sceneId,0    )	 
	 	 x807005_CreateXiaoBOSS(sceneId,0  )
	 end
	 	 
	 if    TickCount  ==  x807005_g_XiaoGuaiTime*2        then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên phäi thßþng giác b¡t ð¥u l¥n thÑ hai công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem b¡t ð¥u l¥n sau tiªn công ! "  )
	 	 x807005_CreateNpcBOSS(sceneId,1    )  
	 	 x807005_CreateXiaoBOSS(sceneId,1  )
	 	   
	 end
  
	 if    TickCount  ==    x807005_g_XiaoGuaiTime*3          then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u l¥n thÑ ba công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem b¡t ð¥u l¥n sau tiªn công ! "  )
	 	 x807005_CreateNpcBOSS(sceneId  ,0  )  
	 	 x807005_CreateXiaoBOSS(sceneId,0  )
	 	   
	 end
	 	   

	 if    TickCount  ==    x807005_g_XiaoGuaiTime*4            then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên phäi thßþng giác b¡t ð¥u l¥n thÑ tß công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem b¡t ð¥u l¥n sau tiªn công ! "  )
	 	 x807005_CreateNpcBOSS(sceneId  ,1  )  
	 	 x807005_CreateXiaoBOSS(sceneId,1  )
	 	   
	 end
	   
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*5              then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u l¥n thÑ nåm công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem b¡t ð¥u l¥n sau tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,0  )
	 	 x807005_CreateXiaoBOSS(sceneId,0  )
	 	   
	 end
	 	   

	 if  TickCount  ==    x807005_g_XiaoGuaiTime*6    then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên phäi thßþng giác b¡t ð¥u l¥n thÑ sáu công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem b¡t ð¥u l¥n sau tiªn công ! "  )
	 	 x807005_CreateXiaoBOSS(sceneId,1  )  
	 	 x807005_CreateNpcBOSS(sceneId  ,1  )
	 	     
	 end
	   
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*7      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u l¥n thÑ bäy công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem tiªn hành sau mµt l¥n tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,0  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,0)
	 	   
	 end
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*8      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên phäi thßþng giác b¡t ð¥u l¥n thÑ tám công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem tiªn hành sau mµt l¥n tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,1  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,1)
	 	   
	 end
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*9      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u l¥n thÑ chín công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem tiªn hành sau mµt l¥n tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,0  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,0)
	 	   
	 end
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*10      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên phäi thßþng giác b¡t ð¥u l¥n thÑ mß¶i công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem tiªn hành sau mµt l¥n tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,1  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,1)
	 	   
	 end
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*11      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u thÑ mß¶i mµt l¥n công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem tiªn hành sau mµt l¥n tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,0  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,0)
	 	   
	 end
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*12    then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên phäi thßþng giác b¡t ð¥u l¥n thÑ mß¶i hai công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau thiªt sách ác tång ðem tiªn hành sau mµt l¥n tiªn công ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,1  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,1)
	 	   
	 end
	 if  TickCount  ==    x807005_g_XiaoGuaiTime*13      then
	 	 x807005_TipAllHuman(  sceneId,  " thiªt sách ác tång ð¬ cho bên trái thßþng giác b¡t ð¥u l¥n thÑ mß¶i ba công kích ! "  )
	 	 x807005_TipAllHuman(  sceneId,    "30 giây sau ð¥u møc che m£t ác tång s¡p xu¤t hi®n hi®n ! "  )	 	   
	         x807005_CreateNpcBOSS(sceneId  ,0  )
	 	 x807005_CreateXiaoBOSS(sceneId  ,0)
	 end
	 
	 if  TickCount  ==    (x807005_g_XiaoGuaiTime*13  +  30)      then	 	   
	 	 local  Npc  =  x807005_g_MonsterInfo_5  	 	   
	 	 local  nNpcId  =  x807005_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.z,	 Npc.ai,  Npc.ai_f,  807005  )
	 	 SetUnitCampID(sceneId,  nNpcId,  nNpcId,  101)
	 	 SetMonsterFightWithNpcFlag(sceneId,  nNpcId,  1)
	 	 SetCharacterTitle(sceneId,  nNpcId,  "Di®u thü không")
	 	 x807005_TipAllHuman(  sceneId,  " ð¥u møc che m£t ác tång xu¤t hi®n ! ! "  )
	 	 LuaFnSetCopySceneData_Param(sceneId,  13,  nNpcId)
	 end
	 
	 local  bOk  =  0	 
	 local  nNpcId  =  LuaFnGetCopySceneData_Param(sceneId,  15)
	 local  nMonsterCount  =  GetMonsterCount(sceneId)
	 for  i=0,  nMonsterCount-1      do
	 	         local  nMontserid  =  GetMonsterObjID(sceneId,  i)
	 	 	 if  nNpcId  ==  nMontserid        then	 	 	 	   
	 	 	 	 bOk  =  1
	 	 	 end
	 	 	 
	 end
	 
	 if  bOk  ==  0    then
	 	 x807005_TipAllHuman(sceneId,  " bäo v® tång tØ vong , khiêu chiªn th¤t bÕi ")	 	 
	 	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 for  i=0,  nHumanNum-1    do
	 	 	 local  nPlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	   x807005_KickOut(  sceneId,  nPlayerId  )
	 	 end	 	 
	 end	 
	 
	 if  TickCount  >=  nLastTime  -  20      then
	 	 local  nNpcId  =  LuaFnGetCopySceneData_Param(sceneId,  15)
	 	 local  bOk  =  0
	 	 local  nMonsterCount  =  GetMonsterCount(sceneId)
	 	 for  i=0,  nMonsterCount-1      do
	 	 	 local  nMontserid  =  GetMonsterObjID(sceneId,  i)
	 	 	 if  nNpcId  ==  nMontserid      then
	 	 	 	 --  hoàn thành 
	 	 	 	 bOk  =  1
	 	 	 end
	 	 end
	 	 
	 	 if  bOk  ==  1    and    NndTime  ==0    then
	 	 	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 	 if  nHumanNum  <  1  then
	 	 	 	 return
	 	 	 end
	 	 	 x807005_TipAllHuman(sceneId,  "khiêu chiªn thành công ! ")	 
	 	 	 LuaFnSetCopySceneData_Param(sceneId,  21,  1)  	 	 
	 	 	 local  nLeaderId  =  0	 	 	 
	 	 	 for  i=0,  nHumanNum-1    do
	 	 	 	 local  nPlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	 	 if  GetTeamLeader(sceneId,  nPlayerId)  ==  nPlayerId    then
	 	 	 	 	 nLeaderId  =  nPlayerId
	 	 	 	 end
	 	 	 end
	 	 	 if  nLeaderId  ==  0    then
	 	 	 	 return
	 	 	 end
	 	 	 
	 	 	 local  szLeaderName  =  GetName(sceneId,  nLeaderId)
	 	 	 local  str  =  format("#GTàng kinh các #P , #{_INFOUSR%s}#P giang h° häo hán th¤t bÕi li­u ác tång l¤y trµm Thiªu Lâm tuy®t kÖ ðích âm mßu , ðem ác tång trµm ðÕo ðích bí kíp hoàn bích thuµc v« tri®u . th§t là võ lâm hào ki®t ðích ði¬n phÕm a ! ! ",szLeaderName)
	 	 	 BroadMsgByChatPipe(sceneId,  nLeaderId,  str,  4)
	 	 end
	 end
	 
	 if  TickCount  ==  nLastTime  -  15    then
	 	 x807005_TipAllHuman(sceneId,  " Phó bän ðóng lÕi sau  15 giây ")
	 	   
	 end

	 if  TickCount  ==  nLastTime  -  10    then
	 	 x807005_TipAllHuman(sceneId,  " Phó bän ðóng lÕi sau  10 giây ")
	 	   
	 end
	 
	 --  th¶i gian kªt thúc , 
	 if  TickCount  ==  nLastTime  -  5    then
	 	 x807005_TipAllHuman(sceneId,  " Phó bän ðóng lÕi sau  5 giây ")
	 	   
	 end
	 
	 --  th¶i gian kªt thúc , 
	 if  TickCount  ==  nLastTime    then
	 	 local  nHumanNum  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 	 for  i=0,  nHumanNum-1    do
	 	 	 local  nPlayerId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 	 	   x807005_KickOut(  sceneId,  nPlayerId  )
	 	 end
	 end
	 
end


function  x807005_OnDie(sceneId,  objId,  killerId)
          
	               LuaFnSetCopySceneData_Param(sceneId,  2,  (x807005_g_CloseTime  -  20)  )  
	 	 	   

end


function  x807005_KickOut(  sceneId,  objId  )
        local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  3  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 
	 local  x  =  LuaFnGetCopySceneData_Param(  sceneId,  16  )  -- tiªn vào lúc ðích t÷a ðµ X
	 local  z  =  LuaFnGetCopySceneData_Param(  sceneId,  17  )  -- tiªn vào lúc ðích t÷a ðµ Z
	 
	 if  LuaFnIsObjValid(  sceneId,  objId  )  ==  1  then
	         NewWorld(  sceneId,  objId,  oldsceneId,  x,  z  )
	 end
	 
end

function  x807005_CreateNpcBOSS(sceneId,fangxiang    )
                local  Npc  =  x807005_g_MonsterInfo_1      --- bên trái 
	 	 if  fangxiang  ==1  then  
	 	 	 Npc  =  x807005_g_MonsterInfo_2      --- bên trái 
	         end
	 	 
	 	 
	 	 for  i=1,  x807005_g_XiaoGuaiCount    do
	 	                 local  nNpcId  =  x807005_CreateNpc(sceneId,  Npc.id,  Npc.x,  Npc.z,	 Npc.ai,  Npc.ai_f,  -1)
	 	 	 	 if  nNpcId  >  0  then
	 	 	 	 SetUnitCampID(sceneId,  nNpcId,  nNpcId,  101)
	 	 	 	 SetMonsterFightWithNpcFlag(sceneId,  nNpcId,  1)
	 	 	 	 SetPatrolId(sceneId,  nNpcId,  Npc.p)	 
	 	 	         end	 
	         end
end

function    x807005_CreateXiaoBOSS(sceneId,fangxiang  )
	       if  fangxiang  ==0  then
	 	   local  nMonsterIda  =  LuaFnCreateMonster(sceneId,  13579,  23  ,  47,  9,  -1,  -1)
	 	   SetUnitCampID(sceneId,  nMonsterIda,  nMonsterIda,  101)
	 	   SetMonsterFightWithNpcFlag(sceneId,  nMonsterIda,  1)
	 	   SetPatrolId(sceneId,  nMonsterIda,  0  )
	       else
	 	     local  nMonsterIdb  =  LuaFnCreateMonster(sceneId,  13579,  103  ,  48,  9,  -1,  -1)
	 	     SetUnitCampID(sceneId,  nMonsterIdb,  nMonsterIdb,  101)
	 	     SetMonsterFightWithNpcFlag(sceneId,  nMonsterIdb,  1)
	 	     SetPatrolId(sceneId,  nMonsterIdb,  1  )
	       end	   

end

--**********************************
--  thông døng khai sáng quái v§t hàm s¯ 
--**********************************
function  x807005_CreateNpc(sceneId,  NpcId,  x,  y,  Ai,  AiFile,  Script)
	 local  PlayerLevel  =  LuaFnGetCopySceneData_Param(sceneId,  8)
	 local  ModifyLevel  =  LuaFnGetCopySceneData_Param(sceneId,  9)
	 local  nNpcId  =  0	 
	 if  ModifyLevel  >=  11  then
	       nNpcId  =  NpcId  +  8  
	 else
	       nNpcId  =  NpcId  +  ModifyLevel-3
	 end	 
	 
	 local  nMonsterId  =  LuaFnCreateMonster(sceneId,  nNpcId,  x,  y,  Ai,  AiFile,  Script)
	 SetLevel(sceneId,  nMonsterId,  PlayerLevel)
	 return  nMonsterId
end