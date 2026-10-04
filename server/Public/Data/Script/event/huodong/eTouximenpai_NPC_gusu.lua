-- phó bän nhi®m vø 
-- møc tràng 
--

--************************************************************************
--MisDescBegin
-- chân v¯n s¯ 
x808042_g_ScriptId	 =  808042
-- phó bän tên 
x808042_g_CopySceneName	 =  " Mµ Dung s½n trang "
-- nhi®m vø s¯ 
x808042_g_MissionId	 	 	 =  1250
-- thßþng mµt cái nhi®m vø ðích ID
x808042_g_MissionIdPre	 =  0
-- møc tiêu NPC
x808042_g_Name	 	 	 	 	 =  " ðánh lén môn phái "
-- có phäi là hay không tinh anh nhi®m vø 
x808042_g_IfMissionElite=  1
-- nhi®m vø c¤p b§c 
x808042_g_MissionLevel	 =  10000
-- nhi®m vø xªp loÕi 
x808042_g_MissionKind	 	 =  1
-- nhi®m vø vån v¯n miêu tä 
x808042_g_MissionName	 	 	 =  " ðánh lén môn phái "
-- nhi®m vø miêu tä 
x808042_g_MissionInfo	 	 	 =  "    "
-- nhi®m vø møc tiêu 
x808042_g_MissionTarget	 	 =  "    giªt chªt t¤t cä quái v§t là ðßþc hoàn thành nhi®m vø . "
-- không hoàn thành nhi®m vø npc ð¯i thoÕi 
x808042_g_ContinueInfo	 	 =  "    "
-- hoàn thành nhi®m vø npc nói chuy®n thoÕi 
x808042_g_MissionComplete	 =  "    "

--******** phía dß¾i m¤y hÕng là ðµng tînh bi¬u hi®n ðích nµi dung , dùng cho · nhi®m vø li®t bi¬u trung ðµng tînh bi¬u hi®n nhi®m vø tình hu¯ng ******
-- tu¥n hoàn nhi®m vø s¯ li®u tác dçn , bên trong t°n ðã làm hoàn ðªm   MD_SHUILAO_HUAN
-- nhi®m vø có hay không ðã hoàn thành 
--********************************** tr· lên là ðµng tînh ****************************
-- vai trò Mission thay ð±i lßþng nói rõ 
x808042_g_Param_IsMissionOkFail	 =  0	 	 	 	 	 	 --0 s¯ : nhi®m vø trß¾c m£t có hay không hoàn thành (0 không hoàn thành ;1 hoàn thành )
x808042_g_Param_killmonstercount	 =  1	 	 	 	 	 --1 s¯ : giªt chªt nhi®m vø ti¬u quái ðích s¯ lßþng 
x808042_g_Param_killbosscount	 =  2	 	 	 	 	 	 	 --2 s¯ : giªt chªt nhi®m vø boss trách ðích s¯ lßþng 
x808042_g_Param_sceneid	 	 =  3	 	 	 	 	 	 	 	 	 --3 s¯ : trß¾c m£t phó bän nhi®m vø cänh tßþng s¯ 
x808042_g_Param_teamid	 	 =  4	 	 	 	 	 	 	 	 	 --4 s¯ : nh§n phó bän nhi®m vø th¶i ði¬m ðích ðµi ngû s¯ 
x808042_g_Param_time	 	 	 =  5	 	 	 	 	 	 	 	 	 --5 s¯ : hoàn thành phó bän sØ døng th¶i gian ( ð½n v¸ : giây )
	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 --6 s¯ : cø th¬ phó bän sñ ki®n chân v¯n chiªm døng 
	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 --7 s¯ : cø th¬ phó bän sñ ki®n chân v¯n chiªm døng 
--MisDescEnd
--************************************************************************

x808042_g_CopySceneType	 	 	 =  FUBEN_GUSU1	 -- phó bän loÕi hình , ð¸nh nghîa · ScriptGlobal.lua bên trong 
x808042_g_LimitMembers	 	 	 =  1	 	 -- có th¬ vào phó bän ðích nhö nh¤t ðµi ngû nhân s¯ 
x808042_g_TickTime	 	 	 	 	 =  5	 	 -- tr· v« ði«u chân v¯n ðích lúc chuông / ð°ng h° th¶i gian ( ð½n v¸ : giây / l¥n )
x808042_g_LimitTotalHoldTime=  360	 -- phó bän có th¬ s¯ng sót ðích th¶i gian ( ð½n v¸ : s¯ l¥n ), nªu nhß lúc này ðang lúc ðªn , là nhi®m vø s¨ th¤t bÕi 
x808042_g_LimitTimeSuccess	 =  500	 -- phó bän th¶i gian hÕn chª ( ð½n v¸ : s¯ l¥n ) , nªu nhß lúc này ðang lúc ðªn , nhi®m vø hoàn thành 
x808042_g_CloseTick	 	 	 	 	 =  6	 	 -- phó bän t¡t trß¾c cûng tính gi¶ ( ð½n v¸ : s¯ l¥n )
x808042_g_NoUserTime	 	 	 	 =  300	 -- phó bän trung không có ai sau có th¬ tiªp tøc bäo t°n ðích th¶i gian ( ð½n v¸ : giây )
x808042_g_Fuben_X	 	 	 	 	 	 =  28	 -- tiªn vào phó bän ðích v¸ trí X
x808042_g_Fuben_Z	 	 	 	 	 	 =  144	 -- tiªn vào phó bän ðích v¸ trí Z
x808042_g_Back_X	 	 	 	 	 	 =  29	 -- nguyên cänh tßþng v¸ trí X
x808042_g_Back_Z	 	 	 	 	 	 =  137	 -- nguyên cänh tßþng v¸ trí Z
x808042_g_Totalkillmonstercount	 =  30	 -- c¥n giªt chªt monster s¯ lßþng 
x808042_g_Totalkillbosscount	 =  1	 -- c¥n giªt chªt Boss s¯ lßþng 

-- phó bän s¯ li®u tác dçn so sánh 
x808042_g_keySD	 	 	 	 	 =  {}
x808042_g_keySD["typ"]	 =  0	 	 -- thiªt trí phó bän loÕi hình 
x808042_g_keySD["spt"]	 =  1	 	 -- thiªt trí phó bän cänh tßþng sñ ki®n chân v¯n s¯ 
x808042_g_keySD["tim"]	 =  2	 	 -- thiªt trí ð¸nh lúc khí ði«u døng s¯ l¥n 
x808042_g_keySD["scn"]	 =  3	 	 -- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ ,  m¾i b¡t ð¥u hóa 
x808042_g_keySD["cls"]	 =  4	 	 -- thiªt trí phó bän t¡t d¤u hi®u ,  0 m· ra , 1 t¡t 
x808042_g_keySD["dwn"]	 =  5	 	 -- thiªt trí r¶i ði cûng tính gi¶ s¯ l¥n 
x808042_g_keySD["tem"]	 =  6	 	 -- bäo t°n ðµi ngû s¯ 
x808042_g_keySD["x"]	 =  7	 	 	 -- nhân v§t · nh§p kh¦u cänh tßþng trung ðích x v¸ trí 
x808042_g_keySD["z"]	 =  8	 	 	 -- nhân v§t · nh§p kh¦u cänh tßþng trung ðích z v¸ trí 
x808042_g_keySD["killedmonsternum"]	 =  9	 	 -- giªt chªtLâu Laðích s¯ lßþng 
x808042_g_keySD["killedbossnum"]	 =  10	 	 -- giªt chªt Boss ðích s¯ lßþng 
x808042_g_keySD["mp"]	 =  11	 	 -- ghi chép trß¾c m£t phó bän ðích   môn phái 

-- nh§n l¤y nhi®m vø th¤p nh¤t c¤p b§c 
x808042_g_minLevel	 	 	 =  20
-- c¥n ph¯i trí ti¬u quái v§t 
x808042_g_typMonster	 	 =  749	 -- thüy quÖ thám tØ 
-- môn phái id
x808042_g_MenPaiID	 	 =  MP_GUSU

x808042_g_NianNum  =  5
x808042_g_NianPos  =  {
	 	 	 	 	 	 	 	 	 	 	 {x=98    ,y=146  },
	 	 	 	 	 	 	 	 	 	 	 {x=84    ,y=145  },
	 	 	 	 	 	 	 	 	 	 	 {x=99    ,y=75    },
	 	 	 	 	 	 	 	 	 	 	 {x=86    ,y=58    },
	 	 	 	 	 	 	 	 	 	 	 {x=106  ,y=58    },
	 	 	 	 	 	 	 	 	 	 }
--x808042_g_NianShou  =  {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211}
--**********************************
-- nhi®m vø nh§p kh¦u hàm s¯ 
--**********************************
function  x808042_OnDefaultEvent(  sceneId,  selfId,  targetId  )

	 x808042_OnAccept(  sceneId,  selfId,  targetId  )


end

--**********************************
-- nhóm gi½ sñ ki®n 
--**********************************
function  x808042_OnEnumerate(  sceneId,  selfId,  targetId  )

	 --local	 MenPaiID	 =	 GetMenPai(sceneId,  selfId)
	 --if(MenPaiID  ~=  x808042_g_MenPaiID)  then
	 --	 x808042_NotifyTip(  sceneId,  selfId,  " ta t¾i là tìm Mµ Dung s½n trang phi«n toái , ngß½i không phäi là Mµ Dung s½n trang ðích ð® tØ , xin/m¶i mau ði ra . "  )
	 --	 return
	 --end

	 local	 lev	 =  GetLevel(  sceneId,  selfId  )
	 if  lev  <  x808042_g_minLevel  then
	     x808042_NotifyTip(  sceneId,  selfId,  " c¤p b§c cüa ngß½i quá th¤p , cån bän không ðü ta xem ðích , còn là 20 c¤p sau t¾i tìm ta næa ði . "  )
	 	 return
	 end

	 if  LuaFnHasTeam(  sceneId,  selfId  )  ==  0  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " chính là mµt ngß¶i li«n mu¯n t¾i khiêu chiªn ta , ta cån bän khinh thß¶ng cùng ngß½i ðµng thü . "  )
	 	 return
	 end
	 --PrintNum(3)

	 if  GetTeamSize(  sceneId,  selfId  )  <  x808042_g_LimitMembers  then
	     x808042_NotifyTip(  sceneId,  selfId,  " mu¯n khiêu chiªn ta ít nh¤t cûng phäi ði lên ba ði , li«n chút ngß¶i này ? cûng quá xem thß¶ng ta . "  )
	     return
	 end
	 --PrintNum(4)

	 if  LuaFnIsTeamLeader(  sceneId,  selfId  )  ==  0  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " mu¯n khiêu chiªn ta ? g÷i các ngß½i ðích ðµi trß·ng ðªn ðây ði . "  )
	 	 return
	 end
	 --PrintNum(5)

	 --  l¤y ðßþc nhà ch½i phø c§n ðµi hæu s¯ lßþng ( bao g°m mình )
	 local  nearteammembercount  =  GetNearTeamCount(  sceneId,  selfId  )
	 if  nearteammembercount  ~=  LuaFnGetTeamSize(  sceneId,  selfId  )  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " ngài trong ðµi ngû có ðµi viên không có · ðây phø c§n , xin/m¶i t§p h÷p sau tìm thêm ta ðßa ngß½i tiªn vào hoÕt ðµng . "  )
	 	 return
	 end
	 
	 local  namenum  =  0;
	 local  notifyString  =  " ngài trong ðµi ngû có thành viên (";
	 for  i=0,  nearteammembercount-1    do
	 	 local  nPlayerId  =  GetNearTeamMember(sceneId,selfId,  i)
	 	 local	 lev	 =  GetLevel(  sceneId,  nPlayerId  )
	 	 local	 nam	 =  GetName(  sceneId,  nPlayerId  )
	 	 
	 	 if(lev<x808042_g_minLevel)  then
	 	 	 notifyString  =  notifyString..nam.."  ";
	 	 	 namenum  =  1;
	 	 end
	 end
	 notifyString  =  notifyString..") c¤p b§c chßa ðü . ";	 
	 if(namenum>0)  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  notifyString  )
	 	 return
	 end

	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  " nªu các ngß½i không sþ chªt , ta cûng không có c¥n thiªt lßu cái gì tình cäm , chúng ti¬u nhân , t¾i ðây cho b÷n h¡n ði¬m lþi hÕi nªm thØ mµt chút . "  )
	 	 AddNumText(  sceneId,  x808042_g_ScriptId,  " chÆng l¨ ta há sþ ngß½i sao ……"  ,10  ,0)
    EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )

end

--**********************************
-- ki¬m tr¡c tiªp nh§n ði«u ki®n 
--**********************************
function  x808042_CheckAccept(  sceneId,  selfId  )
	 --local	 MenPaiID	 =	 GetMenPai(sceneId,  selfId)
	 --if(MenPaiID  ~=  x808042_g_MenPaiID)  then
	 --	 x808042_NotifyTip(  sceneId,  selfId,  " ta t¾i là tìm Mµ Dung s½n trang phi«n toái , ngß½i không phäi là Mµ Dung s½n trang ðích ð® tØ , xin/m¶i mau ði ra . "  )
	 --	 return  0;
	 --end

	 local	 lev	 =  GetLevel(  sceneId,  selfId  )
	 if  lev  <  x808042_g_minLevel  then
	     x808042_NotifyTip(  sceneId,  selfId,  " c¤p b§c cüa ngß½i quá th¤p , cån bän không ðü ta xem ðích , còn là 20 c¤p sau t¾i tìm ta næa ði . "  )
	 	 return  0
	 end

	 if  LuaFnHasTeam(  sceneId,  selfId  )  ==  0  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " chính là mµt ngß¶i li«n mu¯n t¾i khiêu chiªn ta , ta cån bän khinh thß¶ng cùng ngß½i ðµng thü . "  )
	 	 return  0
	 end
	 --PrintNum(3)

	 if  GetTeamSize(  sceneId,  selfId  )  <  x808042_g_LimitMembers  then
	     x808042_NotifyTip(  sceneId,  selfId,  " mu¯n khiêu chiªn ta ít nh¤t cûng phäi ði lên ba ði , li«n chút ngß¶i này ? cûng quá xem thß¶ng ta . "  )
	     return  0
	 end
	 --PrintNum(4)

	 if  LuaFnIsTeamLeader(  sceneId,  selfId  )  ==  0  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " mu¯n khiêu chiªn ta ? g÷i các ngß½i ðích ðµi trß·ng ðªn ðây ði . "  )
	 	 return  0
	 end
	 --PrintNum(5)

	 --  l¤y ðßþc nhà ch½i phø c§n ðµi hæu s¯ lßþng ( bao g°m mình )
	 local  nearteammembercount  =  GetNearTeamCount(  sceneId,  selfId  )
	 if  nearteammembercount  ~=  LuaFnGetTeamSize(  sceneId,  selfId  )  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " ngài trong ðµi ngû có ðµi viên không có · ðây phø c§n , xin/m¶i t§p h÷p sau tìm thêm ta ðßa ngß½i tiªn vào hoÕt ðµng . "  )
	 	 return  0
	 end
	 
	 local  namenum  =  0;
	 local  notifyString  =  " ngài trong ðµi ngû có thành viên (";
	 for  i=0,  nearteammembercount-1    do
	 	 local  nPlayerId  =  GetNearTeamMember(sceneId,selfId,  i)
	 	 local	 lev	 =  GetLevel(  sceneId,  nPlayerId  )
	 	 local	 nam	 =  GetName(  sceneId,  nPlayerId  )
	 	 
	 	 if(lev<x808042_g_minLevel)  then
	 	 	 notifyString  =  notifyString..nam.."  ";
	 	 	 namenum  =  1;
	 	 end
	 end
	 notifyString  =  notifyString..") c¤p b§c chßa ðü . ";	 
	 if(namenum>0)  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  notifyString  )
	 	 return  0
	 end
	 return  1
end

--**********************************
-- tiªp nh§n 
--**********************************
function  x808042_OnAccept(  sceneId,  selfId,  targetId  )
	 if  x808042_CheckAccept(  sceneId,  selfId  )  ==  0  then
	 	 return
	 end
	 local  teamid  =  GetTeamId(  sceneId,  selfId  )

	 -- nªu nhß có nhi®m vø , trñc tiªp truy«n vào phó bän 
	 if  IsHaveMission(  sceneId,  selfId,  x808042_g_MissionId  )  >  0  then

	 	 local  misIndex  =  GetMissionIndexByID(  sceneId,  selfId,  x808042_g_MissionId  )
	 	 local  copysceneid  =  GetMissionParam(  sceneId,  selfId,  misIndex,  x808042_g_Param_sceneid  )
	 	 local  saveteamid  =  GetMissionParam(  sceneId,  selfId,  misIndex,  x808042_g_Param_teamid  )
	 	 -- träi qua phó bän 
	 	 if  copysceneid  >=  0  and  teamid  ==  saveteamid  then
	 	 	 -- ðem mình truy«n t¯ng ðªn phó bän cänh tßþng 
	 	 	 if  IsCanEnterCopyScene(  copysceneid,  GetHumanGUID(  sceneId,  selfId  )  )  ==  1  then
	 	 	 	 NewWorld(  sceneId,  selfId,  copysceneid,  x808042_g_Fuben_X,  x808042_g_Fuben_Z  )
	 	 	 else
	 	 	 	 x808042_NotifyTip(  sceneId,  selfId,  " nhi®m vø th¤t bÕi , xin/m¶i buông tha cho l¥n næa nh§n l¤y "  )
	 	 	 	 SetMissionByIndex(  sceneId,  selfId,  misIndex,  x808042_g_Param_IsMissionOkFail,  2  )
	 	 	 	 DelMission(sceneId,  selfId,  x808042_g_MissionId);
	 	 	 end
	 	 	 return
	 	 end
	 end

	 -- gia nh§p nhi®m vø ðªn nhà ch½i li®t bi¬u 
	 -- l¤y ðßþc nhà ch½i phø c§n ðµi hæu s¯ lßþng ( bao g°m mình )
	 local  numMem	 =  GetNearTeamCount(  sceneId,  selfId  )
	 local  member
	 local  i
	 local  misIndex
	 for  i=0,  numMem-1  do
	 	 member  =  GetNearTeamMember(  sceneId,  selfId,  i  );
	 	 if  IsMissionFull(sceneId,  member)  ==  1  then
	 	 	 BeginEvent(sceneId)
	 	 	 	 AddText(sceneId,  " trong ðµi ngû có ngß¶i nhi®m vø ðã ð¥y ! ");
	 	 	 EndEvent()
	 	 	 DispatchMissionTips(sceneId,  selfId);
	 	 	 return
	 	 end
	 end
	 for	 i=0,  numMem-1  do
	 	 member  =  GetNearTeamMember(  sceneId,  selfId,  i  )

	 	 if  IsHaveMission(  sceneId,  member,  x808042_g_MissionId  )  >  0  then
	 	 	 -- bôi bö trß¾c 
	 	 	 DelMission(  sceneId,  member,  x808042_g_MissionId);
	 	 end

	 	 -- cho m²i cá ðµi ngû thành viên gia nh§p nhi®m vø 
	 	 if  0  ==    AddMission(  sceneId,  member,  x808042_g_MissionId,  x808042_g_ScriptId,  1,  0,  0  )  then
	 	 	 return
	 	 end

	 	 misIndex  =  GetMissionIndexByID(  sceneId,  member,  x808042_g_MissionId  )
	 	 -- ðem nhi®m vø thÑ 0 s¯ s¯ li®u thiªt trí vì 0, bày tö nhi®m vø chßa hoàn thành 
	 	 SetMissionByIndex(  sceneId,  member,  misIndex,  x808042_g_Param_IsMissionOkFail,  0  )
	 	 -- ðem nhi®m vø thÑ 2 s¯ s¯ li®u thiªt trí vì -1,  dùng cho bäo t°n phó bän ðích cänh tßþng s¯ 
	 	 SetMissionByIndex(  sceneId,  member,  misIndex,  x808042_g_Param_sceneid,  -1  )
	 	 -- ðem nhi®m vø thÑ 3 s¯ s¯ li®u ðµi ngû s¯ 
	 	 SetMissionByIndex(  sceneId,  member,  misIndex,  x808042_g_Param_teamid,  teamid  )
	 end
	 x808042_MakeCopyScene(  sceneId,  selfId,  numMem  )
	 LuaFnDeleteMonster(  sceneId,  targetId)
end

--**********************************
-- buông tha cho 
--**********************************
function  x808042_OnAbandon(  sceneId,  selfId  )

	 -- không · tÕi ch² cänh ðích không làm này thao tác 
	 if  LuaFnIsObjValid(  sceneId,  selfId  )  ~=  1  then
	 	 return
	 end

	 -- xØ vu không cách nào thi hành suy lu§n ðích trÕng thái 
	 if  LuaFnIsCanDoScriptLogic(  sceneId,  selfId  )  ~=  1  then
	 	 return
	 end

	 -- không phäi là · phó bän trung trñc tiªp thü tiêu nhi®m vø 
	 local  misIndex  =  GetMissionIndexByID(  sceneId,  selfId,  x808042_g_MissionId  )
	 local  copysceneid  =  GetMissionParam(  sceneId,  selfId,  misIndex,  x808042_g_Param_sceneid  )

	 if(copysceneid  ~=  sceneId)  then
	 	 DelMission(  sceneId,  selfId,  x808042_g_MissionId  )
	 	 return
	 end

	 local  leaderguid  =  LuaFnGetCopySceneData_TeamLeader(  sceneId  )
	 local  leaderObjId  =  LuaFnGuid2ObjId(  sceneId,  leaderguid  )

	 -- không tìm ðßþc nên nhà ch½i 
	 if  leaderObjId  ==  -1  then
	 	 DelMission(  sceneId,  selfId,  x808042_g_MissionId  )
	 	 return
	 end

	 -- lúc này nh¤t ð¸nh · phó bän trung , có th¬ ðÕt ðßþc nh§p kh¦u cänh tßþng s¯ 
	 local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["scn"]  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 
	 if(selfId  ==  leaderObjId)  then
	 	 -- ðµi trß·ng buông tha cho , toàn bµ truy«n ra phó bän 
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"],  1  )
	 	 local  membercount  =  LuaFnGetCopyScene_HumanCount(  sceneId  )
	 	 local  mems  =  {}
	 	 local  i
	 	 for	 i=0,  membercount-1  do
	 	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(  sceneId,  i  )
	 	 end
	 	 -- ðem trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i truy«n t¯ng tr· v« thì ra là tiªn vào th¶i ði¬m ðích cänh tßþng 
	 	 for	 i=0,  membercount-1  do
	 	 	 if  LuaFnIsObjValid(  sceneId,  mems[i]  )  ==  1  then
	 	 	 	 DelMission(  sceneId,  mems[i],  x808042_g_MissionId  )
	 	 	 	 x  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"]  )
	 	 	 	 z  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"]  )
	 	 	 	 NewWorld(  sceneId,  mems[i],  oldsceneId,  x,  z  )
	 	 	 end
	 	 end
	 else
	 -- mình không phäi là ðµi trß·ng chÆng qua là mình buông tha cho , chï ðem mình truy«n ra phó bän 
	 	 DelMission(  sceneId,  selfId,  x808042_g_MissionId  )
	 	 x  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"]  )
	 	 z  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"]  )
	 	 NewWorld(  sceneId,  selfId,  oldsceneId,  x,  z  )
	 end
end

--**********************************
-- khai sáng phó bän 
--**********************************
function  x808042_MakeCopyScene(  sceneId,  selfId,  nearmembercount  )

	 local  mems  =  {}
	 local  mylevel  =  0
	 local  i

--  	 PrintStr("sdlf")

	 local  member,  mylevel,  numerator,  denominator  =  0,  0,  0,  0

	 for	 i  =  0,  nearmembercount  -  1  do
	 	 member  =  GetNearTeamMember(  sceneId,  selfId,  i  )
	 	 numerator  =  numerator  +  GetLevel(  sceneId,  member  )  ^  4
	 	 denominator  =  denominator  +  GetLevel(  sceneId,  member  )  ^  3
	 	 mems[i]  =  member
	 end

	 if  denominator  <=  0  then
	 	 mylevel  =  0
	 else
	 	 mylevel  =  numerator  /  denominator
	 end

	 local  PlayerMaxLevel  =  GetHumanMaxLevelLimit()
	 local  iniLevel
	 if  mylevel  <  10  then
	 	 iniLevel  =  10
	 elseif  mylevel  <  PlayerMaxLevel  then
	 	 iniLevel  =  floor(  mylevel/10  )  *  10
	 else
	 	 iniLevel = floor( PlayerMaxLevel/10 ) * 10   -- [NetCo4 02/10] cu: iniLevel = PlayerMaxLevel (119) -> nap <map>_monster_119.ini khong co -> pho ban khong tao duoc
	 end

	 local  leaderguid  =  LuaFnObjId2Guid(  sceneId,  selfId  )
	 -- bän ð° là nh¤t ð¸nh phäi ch÷n l¤y , h½n næa nh¤t ð¸nh phäi · Config/SceneInfo.ini trong ph¯i trí häo 
	 LuaFnSetSceneLoad_Map(  sceneId,  "gusu_1.nav"  )
	 LuaFnSetCopySceneData_TeamLeader(  sceneId,  leaderguid  )
	 LuaFnSetCopySceneData_NoUserCloseTime(  sceneId,  x808042_g_NoUserTime  *  1000  )
	 LuaFnSetCopySceneData_Timer(  sceneId,  x808042_g_TickTime  *  1000  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["typ"],  x808042_g_CopySceneType  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["spt"],  x808042_g_ScriptId  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["tim"],  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["scn"],  -1  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"],  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["dwn"],  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["tem"],  GetTeamId(  sceneId,  selfId  )  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["killedmonsternum"],  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["killedbossnum"],  0  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["mp"],  MP_GUSU  )

	 local  x,z  =  GetWorldPos(  sceneId,  selfId  )

--	 PrintStr("    "..x..z.."  ")

	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"],  x808042_g_Back_X  )
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"],  x808042_g_Back_Z  )

	 LuaFnSetSceneLoad_Monster(  sceneId,  "gusu_1_monster_"  ..  iniLevel  ..  ".ini"  )

	 LuaFnSetCopySceneData_Param(sceneId,  CopyScene_LevelGap,  mylevel  -  iniLevel)  -- c¤p b§c kém , CopyScene_LevelGap  ·   scene.lua  trung phú tr¸ giá 
    LuaFnSetCopySceneData_Param(sceneId,  13,  mylevel)
    
	 local  bRetSceneID  =  LuaFnCreateCopyScene(  sceneId  )	 	 	 	 	 	 -- m¾i b¡t ð¥u hóa sau khi hoàn thành ði«u døng khai sáng phó bän hàm s¯ 
	 if  bRetSceneID  >  0  then
	 	 x808042_NotifyTip(  sceneId,  selfId,  " phó bän khai sáng thành công ! "  )
	 else
	 	 x808042_NotifyTip(  sceneId,  selfId,  " phó bän s¯ lßþng ðã ðÕt thßþng hÕn , xin h§u thØ lÕi ! "  )

	 	 -- thü tiêu nhà ch½i nhi®m vø li®t bi¬u trung ð¯i Ñng nhi®m vø 
	 	 for	 i=0,  nearmembercount-1  do
	 	 	 DelMission(  sceneId,  mems[i],  x808042_g_MissionId  )
	 	 end
	 end

end

--**********************************
-- tiªp tøc 
--**********************************
function  x808042_OnContinue(  sceneId,  selfId,  targetId  )

end

--**********************************
-- ki¬m tr¡c có ðßþc hay không ð« giao 
--**********************************
function  x808042_CheckSubmit(  sceneId,  selfId,  selectRadioId  )


end

--**********************************
-- ð« giao 
--**********************************
function  x808042_OnSubmit(  sceneId,  selfId,  targetId,  selectRadioId  )

end

--**********************************
-- giªt chªt quái v§t ho£c nhà ch½i 
--**********************************
function  x808042_OnKillObject(  sceneId,  selfId,  objdataId,  objId  )

	 -- có phäi là hay không phó bän 
	 local  sceneType  =  LuaFnGetSceneType(  sceneId  )
	 if  sceneType  ~=  1  then
	 	 return
	 end

	 -- có phäi là hay không c¥n thiªt ðích phó bän 
	 local  fubentype  =  LuaFnGetCopySceneData_Param(  sceneId,  0  )
	 if  fubentype  ~=  x808042_g_CopySceneType  then
	 	 return
	 end

	 -- phó bän t¡t d¤u hi®u 
	 local  leaveFlag  =  LuaFnGetCopySceneData_Param(  sceneId,  4  )
	 -- nªu nhß phó bän ðã b¸ ðßa thành t¡t trÕng thái , là giªt trách không có hi®u quä 
	 if  leaveFlag  ==  1  then
	 	 return
	 end

	 -- l¤y ðßþc trß¾c m£t cänh tßþng d£m nhân s¯ 
	 local  num  =  LuaFnGetCopyScene_HumanCount(  sceneId  )

	 -- l¤y ðßþc giªt chªt quái v§t ðích GroupID, dùng cho phán ðoán có phäi là hay không c¥n thiªt giªt chªt ðích Boss
	 local  GroupID  =  GetMonsterGroupID(  sceneId,  objId  )

	 local  killedmonsternumber  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["killedmonsternum"]  )	 	 	 -- giªt chªt monster ðích s¯ lßþng 
	 local  killedbossnumber  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["killedbossnum"]  )	 	 	 -- giªt chªt boss ðích s¯ lßþng 

	 local  MonsterName  =  GetName(sceneId,  objId)
	 local	 isBoss

	 if(MonsterName  ==  "Lâu La")then
	 	 killedmonsternumber  =  killedmonsternumber  +  1
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["killedmonsternum"],  killedmonsternumber  )	 	 	 	 	 -- thiªt trí giªt chªt monster ðích s¯ lßþng 
	 	 isBoss  =  0
	 	 if  killedmonsternumber  ==    x808042_g_Totalkillmonstercount  then
	 	 	 local	 Selflev	 =  GetLevel(  sceneId,  selfId  )
	 	 	 local  PlayerMaxLevel  =  GetHumanMaxLevelLimit()
	 	 	 local  monsterLevel=0
	 	 	 if  Selflev  <  10  then
	 	 	 	 monsterLevel  =  0
	 	 	 elseif  Selflev  <  110  then
	 	 	 	 monsterLevel  =  floor(  Selflev/10  )  +  3670  -  1
	 	 	 elseif  Selflev  <  PlayerMaxLevel  then
	 	 	 	 monsterLevel  =  floor(  Selflev/10  )  +  33670  -  11
	 	 	 else
	 	 	 	 monsterLevel  =  floor( Selflev/10 ) + 33670 - 11   -- [NetCo4 03/10] cu: = 9 (quai so 9 = Doan Chinh Minh NPC)
	 	 	 end
	 	 	 local  tmpMonsterId  =  LuaFnCreateMonster(  sceneId,  monsterLevel,  68,  102,  14,  138,  -1  )
	 	 	 local  tmpsMessage  =  format(" ghê t·m , m¡t th¤y chúng ta s¨ phäi ðánh lén thành công , nªu nhß v§y , cûng ð×ng trách ta không khách khí . ")
	 	 	 MonsterTalk(sceneId,  tmpMonsterId,  x808042_g_CopySceneName,  tmpsMessage)
	 	 	 local  szName  =  GetName(sceneId,  tmpMonsterId)
	 	 	 if  szName  ==  "Ác Bá" or szName  ==  "Ác bá"      then
	 	 	 	 SetCharacterTitle(sceneId,  tmpMonsterId,  "“ sách s½n có ðß¶ng ”")
	 	 	 end
	 	 end
	 elseif  (  MonsterName  ==  "Ác Bá" or MonsterName  ==  "Ác bá"  )  then
	 	 killedbossnumber  =  killedbossnumber  +  1
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["killedbossnum"],  killedbossnumber  )	 	 	 	 	 -- thiªt trí giªt chªt boss ðích s¯ lßþng 
	 	 CallScriptFunction( 950001, "TB_GhiId", sceneId, objdataId, selfId )   -- [NetCo4 04/10] tui boss Ac Ba (tan cong mon phai): 3670-3679 / 33670-33679, roimap chi ghi khi ID co trong danh sach
	 	 isBoss  =  1
	 end


	 -------------------------------------------------------------------------------
	 local  membercount  =  LuaFnGetCopyScene_HumanCount(sceneId);
	 local  memId
	 local  teamLeaderName;
	 local  firstMemName;
	 local  firstMemId;
	 
	 teamLeaderName  =  ""
	 for	 i  =  0,  membercount  -  1  do
	 	 memId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i);
	 	 if  LuaFnIsObjValid(  sceneId,  memId  )  ==  1  and  LuaFnIsCanDoScriptLogic(  sceneId,  memId  )  ==  1  then	 
	 	 	 local  teamLeaderFlag  =  LuaFnIsTeamLeader(sceneId,  memId);
	 	 	 if  teamLeaderFlag  and  teamLeaderFlag  ==  1  then
	 	 	 	 teamLeaderName  =  LuaFnGetName(sceneId,  memId);
	 	 	 	 break;
	 	 	 end
	 	 end
	 end

	 if  isBoss==1  and  teamLeaderName  ~=  ""  then

	 local  message;
	 local  randMessage  =  random(3);

	 if  randMessage  ==  1  then
	 	 message  =  format("#B#{_INFOUSR%s}#{TouXi_00}#G#{MP_GUSU}#{TouXi_01}",  teamLeaderName  );
	 elseif  randMessage  ==  2  then
	 	 message  =  format("#G#{MP_GUSU}#{TouXi_02}#{_INFOUSR%s}#{TouXi_03}#B#{_INFOUSR%s}#{TouXi_04}",  teamLeaderName,  teamLeaderName  );
	 else
	 	 message  =  format("#{TouXi_05}#G#{MP_GUSU}#{TouXi_06}#{_INFOUSR%s}#{TouXi_07}",  teamLeaderName  );
	 end

	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);

	 end
	 -------------------------------------------------------------------------------


	 local  i
	 local  misIndex
	 local  humanObjId
	 local	 mppoint

	 if  (killedmonsternumber  <  x808042_g_Totalkillmonstercount  )  or  (killedbossnumber  <  x808042_g_Totalkillbosscount  )then
	 	 local  strText  =  format(  " ðã giªt chªtLâu La:   %d/%d  ðã giªt chªtÁc Bá:   %d/%d"  ,  killedmonsternumber,  x808042_g_Totalkillmonstercount,  killedbossnumber,  x808042_g_Totalkillbosscount  )
	 	 for  i=0,  num-1  do
	 	 	 humanObjId  =  LuaFnGetCopyScene_HumanObjId(  sceneId,  i  )	 	 	 	 -- l¤y ðßþc trß¾c m£t cänh tßþng trong ngß¶i objId
	 	 	 if  LuaFnIsObjValid(  sceneId,  humanObjId  )  ==  1  and  LuaFnIsCanDoScriptLogic(  sceneId,  humanObjId  )  ==  1  then	 	 	 	 	 	 -- không · tÕi ch² cänh ðích không làm này thao tác 
	 	 	 	 x808042_NotifyTip(  sceneId,  humanObjId,  strText  )

	 	 	 	 local	 MenPaiID	 =	 GetMenPai(sceneId,  humanObjId)
	 	 	 	 if(MenPaiID  ==  x808042_g_MenPaiID)  then
	 	 	 	 	 if  isBoss  ==  0  then
	 	 	 	 	 	 mppoint  =  GetHumanMenpaiPoint(sceneId,  humanObjId)
	 	 	 	 	 	 mppoint  =  mppoint+1
	 	 	 	 	 	 SetHumanMenpaiPoint(sceneId,  humanObjId,  mppoint)
	 	 	 	 	 else
	 	 	 	 	 	 mppoint  =  GetHumanMenpaiPoint(sceneId,  humanObjId)
	 	 	 	 	 	 mppoint  =  mppoint+5
	 	 	 	 	 	 SetHumanMenpaiPoint(sceneId,  humanObjId,  mppoint)
	 	 	 	 	 end
	 	 	 	 end
	 	 	 	 misIndex  =  GetMissionIndexByID(  sceneId,  humanObjId,  x808042_g_MissionId  )	 	 	 	 	 -- l¤y ðßþc nhi®m vø s¯ li®u tác dçn tr¸ giá 
	 	 	 	 SetMissionByIndex(  sceneId,  humanObjId,  misIndex,  x808042_g_Param_killmonstercount,  killedmonsternumber  )	 -- thiªt trí nhi®m vø s¯ li®u 
	 	 	 	 SetMissionByIndex(  sceneId,  humanObjId,  misIndex,  x808042_g_Param_killbosscount,  killedbossnumber  )	 -- thiªt trí nhi®m vø s¯ li®u 
	 	 	 end
	 	 end
	 else

	 	 -- thiªt trí nhi®m vø hoàn thành d¤u hi®u 
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"],  1  )

	                 -- l¤y ðßþc trß¾c m£t cänh tßþng d£m nhân s¯ 
	                 local  RenNum  =  LuaFnGetCopyScene_HumanCount(  sceneId  )
	                 for  i=0,  RenNum-1  do
	                         local  EveryBodyID  =  LuaFnGetCopyScene_HumanObjId(  sceneId,  i  )	     -- l¤y ðßþc trß¾c m£t cänh tßþng trong ngß¶i objId
                                        CallScriptFunction(  890536,"JianCe",sceneId,EveryBodyID)
                                        if  floor(mod(GetMissionData(sceneId,EveryBodyID,HUOYUEFB_1),100)/10)    <  2  then
                                              SetMissionData(sceneId,EveryBodyID,HUOYUEZHI,GetMissionData(sceneId,EveryBodyID,HUOYUEZHI)+18)  -- hoÕt dßþc tr¸ giá +18
                                              SetMissionData(sceneId,EveryBodyID,HUOYUEFB_1,GetMissionData(sceneId,EveryBodyID,HUOYUEFB_1)+10)
                                        end
                                end

	 	 -- l¤y ðßþc ðã thi hành ðích ð¸nh lúc s¯ l¥n 
	 	 local  TickCount  =  LuaFnGetCopySceneData_Param(  sceneId,  2  )
	 	 local  strText  =  format(  " ðã giªt chªtLâu La:   %d/%d  ðã giªt chªtÁc Bá:   %d/%d",  x808042_g_Totalkillmonstercount,  x808042_g_Totalkillmonstercount,  x808042_g_Totalkillbosscount,  x808042_g_Totalkillbosscount)
	 	 local  strText2  =  format(  " nhi®m vø hoàn thành , ðem · %d giây sau truy«n t¯ng ðªn nh§p kh¦u v¸ trí ",  x808042_g_CloseTick  *  x808042_g_TickTime  )

	 	 for  i=0,  num-1  do
	 	 	 humanObjId  =  LuaFnGetCopyScene_HumanObjId(  sceneId,  i  )	 	 	 	 	 	 	 	 	 -- l¤y ðßþc trß¾c m£t cänh tßþng trong ngß¶i objId

	 	 	 if  LuaFnIsObjValid(  sceneId,  humanObjId  )  ==  1  and  LuaFnIsCanDoScriptLogic(  sceneId,  humanObjId  )  ==  1  then	 	 	 	 	 	 	 	 	 	 -- không · tÕi ch² cänh ðích không làm này thao tác 
	 	 	 	 misIndex  =  GetMissionIndexByID(  sceneId,  humanObjId,  x808042_g_MissionId)	 	 	 	 	 -- l¤y ðßþc nhi®m vø s¯ li®u tác dçn tr¸ giá 

	 	 	 	 SetMissionByIndex(  sceneId,  humanObjId,  misIndex,  x808042_g_Param_killmonstercount,  killedmonsternumber  )	 -- thiªt trí nhi®m vø s¯ li®u 
	 	 	 	 SetMissionByIndex(  sceneId,  humanObjId,  misIndex,  x808042_g_Param_killbosscount,  killedbossnumber  )	 -- thiªt trí nhi®m vø s¯ li®u 

	 	 	 	 -- ðem nhi®m vø thÑ 1 s¯ s¯ li®u thiªt trí vì 1, bày tö hoàn thành nhi®m vø 
	 	 	 	 SetMissionByIndex(  sceneId,  humanObjId,  misIndex,  x808042_g_Param_IsMissionOkFail,  1  )	 	 	 	 	 -- thiªt trí nhi®m vø s¯ li®u 
	 	 	 	 -- hoàn thành phó bän sØ døng th¶i gian 
	 	 	 	 SetMissionByIndex(  sceneId,  humanObjId,  misIndex,  x808042_g_Param_time,  TickCount  *  x808042_g_TickTime  )	 -- thiªt trí nhi®m vø s¯ li®u 

	 	 	 	 x808042_NotifyTip(  sceneId,  humanObjId,  strText  )
	 	 	 	 x808042_NotifyTip(  sceneId,  humanObjId,  strText2  )

	 	 	 	 local	 MenPaiID	 =	 GetMenPai(sceneId,  humanObjId)
	 	 	 	 if(MenPaiID  ==  x808042_g_MenPaiID)  then
	 	 	 	 	 if  isBoss  ==  0  then
	 	 	 	 	 	 mppoint  =  GetHumanMenpaiPoint(sceneId,  humanObjId)
	 	 	 	 	 	 mppoint  =  mppoint+1
	 	 	 	 	 	 SetHumanMenpaiPoint(sceneId,  humanObjId,  mppoint)
	 	 	 	 	 else
	 	 	 	 	 	 mppoint  =  GetHumanMenpaiPoint(sceneId,  humanObjId)
	 	 	 	 	 	 mppoint  =  mppoint+5
	 	 	 	 	 	 SetHumanMenpaiPoint(sceneId,  humanObjId,  mppoint)
	 	 	 	 	 end
	 	 	 	 end
	 	 	 end
	 	 end
	 end
end

--**********************************
-- tiªn vào khu vñc sñ ki®n 
--**********************************
function  x808042_OnEnterZone(  sceneId,  selfId,  zoneId  )
end

--**********************************
-- ðÕo cø sØa ð±i 
--**********************************
function  x808042_OnItemChanged(  sceneId,  selfId,  itemdataId  )
end

--**********************************
-- phó bän sñ ki®n 
--**********************************
function  x808042_OnCopySceneReady(  sceneId,  destsceneId  )

	 -- thiªt trí phó bän nh§p kh¦u cänh tßþng s¯ 
	 LuaFnSetCopySceneData_Param(  destsceneId,  x808042_g_keySD["scn"],  sceneId  )
	 local  leaderguid  =  LuaFnGetCopySceneData_TeamLeader(  destsceneId  )
	 local  leaderObjId  =  LuaFnGuid2ObjId(  sceneId,  leaderguid  )

	 -- không tìm ðßþc nên nhà ch½i 
	 if  leaderObjId  ==  -1  then
	 	 return
	 end

	 -- xØ vu không cách nào thi hành suy lu§n ðích trÕng thái 
	 if  LuaFnIsCanDoScriptLogic(  sceneId,  leaderObjId  )  ~=  1  then
	 	 return
	 end

	 -- l¤y ðßþc nhà ch½i phø c§n ðµi hæu s¯ lßþng ( bao g°m mình )
	 local  numMem	 =  GetNearTeamCount(  sceneId,  leaderObjId  )
	 local  member
	 local  misIndex

	 misIndex  =  GetMissionIndexByID(  sceneId,  leaderObjId,  x808042_g_MissionId  )
	 SetMissionByIndex(  sceneId,  leaderObjId,  misIndex,  x808042_g_Param_sceneid,  destsceneId  )
	 NewWorld(  sceneId,  leaderObjId,  destsceneId,  x808042_g_Fuben_X,  x808042_g_Fuben_Z  )
	 
	 -- hoÕt ðµng th¯ng kê 
	 LuaFnAuditQuest(sceneId,  leaderObjId,  x808042_g_MissionName.."-"..x808042_g_CopySceneName)

	 for	 i=0,  numMem-1  do
	 	 member  =  GetNearTeamMember(  sceneId,  leaderObjId,  i  )

	 	 if  LuaFnIsCanDoScriptLogic(  sceneId,  member  )  ==  1  then	 	 	 --  xØ vu có th¬ thi hành suy lu§n ðích trÕng thái 
	 	 	 if  IsHaveMission(  sceneId,  member,  x808042_g_MissionId  )  >  0  then
	 	 	 	 misIndex  =  GetMissionIndexByID(  sceneId,  member,  x808042_g_MissionId  )

	 	 	 	 -- ðem nhi®m vø thÑ 2 s¯ s¯ li®u thiªt trí vì phó bän ðích cänh tßþng s¯ 
	 	 	 	 SetMissionByIndex(  sceneId,  member,  misIndex,  x808042_g_Param_sceneid,  destsceneId  )

	 	 	 	 NewWorld(  sceneId,  member,  destsceneId,  x808042_g_Fuben_X,  x808042_g_Fuben_Z  )
	 	 	 	 
	 	 	 	 -- hoÕt ðµng th¯ng kê 
	 	 	 	 LuaFnAuditQuest(sceneId,  member,  x808042_g_MissionName.."-"..x808042_g_CopySceneName)
	 	 	 else
	 	 	 	 x808042_NotifyTip(  sceneId,  member,  " ngß½i trß¾c m£t không nh§n này nhi®m vø "  )
	 	 	 end
	 	 end
	 end
end

--**********************************
-- có nhà ch½i tiªn vào phó bän sñ ki®n 
--**********************************
function  x808042_OnPlayerEnter(  sceneId,  selfId  )
	 if  IsHaveMission(  sceneId,  selfId,  x808042_g_MissionId  )  ==  0  then	 	 	 	 -- nªu nhß tiªn vào phó bän trß¾c thü tiêu nhi®m vø , là trñc tiªp truy«n t¯ng tr· v« 
	 	 x808042_NotifyTip(  sceneId,  selfId,  " ngß½i trß¾c m£t không nh§n này nhi®m vø "  )
	 	 local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["scn"]  )	 	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 
	 	 x  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"]  )
	 	 z  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"]  )
	 	 NewWorld(  sceneId,  selfId,  oldsceneId,  x,  z  )
	 	 return
	 end


	 -- thiªt trí tØ vong sau s¯ng lÕi ði¬m v¸ trí 
	 SetPlayerDefaultReliveInfo(  sceneId,  selfId,  "%10",  -1,  "0",  sceneId,  x808042_g_Fuben_X,  x808042_g_Fuben_Z  )

end

--**********************************
-- có nhà ch½i · phó bän trung tØ vong sñ ki®n 
--**********************************
function  x808042_OnHumanDie(  sceneId,  selfId,  killerId  )
--	 x  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"]  )
--	 z  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"]  )
--	 NewWorld(  sceneId,  selfId,  oldsceneId,  x,  z  )
end

--**********************************
-- phó bän cänh tßþng ð¸nh lúc khí sñ ki®n 
--**********************************
function  x808042_OnCopySceneTimer(  sceneId,  nowTime  )

--	 local  once  =  LuaFnGetCopySceneData_Param(  sceneId,  16  )
--
--	 if  (once  ==  0)  then
--	 	 LuaFnSetCopySceneData_Param(sceneId,  16,  1)
--	 	 local  mylevel  =  LuaFnGetCopySceneData_Param(  sceneId,  13  )
--	 	 
--	 	 local  PlayerMaxLevel  =  GetHumanMaxLevelLimit()
--	 	 local  iniLevel;
--	 	 if  mylevel  <  10  then
--	 	 	 iniLevel  =  10;
--	 	 elseif  mylevel  <  PlayerMaxLevel  then
--	 	 	 iniLevel  =  floor(mylevel/10)  *  10;
--	 	 else
--	 	 	 iniLevel  =  PlayerMaxLevel;
--	 	 end
--	   
--	 	 local  iNianShouIdx  =  iniLevel  /  10
--	 
--	 	 for  i=1,x808042_g_NianNum  do
--	 	 	 local  objId  =  LuaFnCreateMonster(  sceneId,  x808042_g_NianShou[iniLevel/10],  x808042_g_NianPos[i].x,  x808042_g_NianPos[i].y,  1,  272,  -1  )
--	 	 	 SetLevel(  sceneId,  objId,  mylevel  )
--	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  10472,  0);  --  zchw
--	 	 end    
--	 end
	 
	 -- phó bän lúc chuông / ð°ng h° h÷c l¤y cùng thiªt trí 
	 -- l¤y ðßþc ðã thi hành ðích ð¸nh lúc s¯ l¥n 
	 local  TickCount  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["tim"]  )
	 TickCount  =  TickCount  +  1
	 -- thiªt trí m¾i ð¸nh lúc khí ði«u døng s¯ l¥n 
	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["tim"],  TickCount  )

	 -- phó bän t¡t d¤u hi®u 
	 local  leaveFlag  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"]  )

	 local  membercount  =  LuaFnGetCopyScene_HumanCount(  sceneId  )
	 local  mems  =  {}
	 local  i

	 if  membercount==0  and  leaveFlag~=1  then
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"],  1  )
	 	 return
	 end

	 for	 i=0,  membercount-1  do
	 	 mems[i]  =  LuaFnGetCopyScene_HumanObjId(  sceneId,  i  )
	 end

	 -- c¥n r¶i ði 
	 if  leaveFlag  ==  1  then
	 	 -- r¶i ði cûng tính gi¶ ðang lúc ðích h÷c l¤y cùng thiªt trí 
	 	 local  leaveTickCount  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["dwn"]  )
	 	 leaveTickCount  =  leaveTickCount  +  1
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["dwn"],  leaveTickCount  )

	 	 if  leaveTickCount  ==  x808042_g_CloseTick  then	 	 	 	 	 	 	 	 	 	 -- cûng tính gi¶ ðang lúc ðªn , t¤t cä m÷i ngß¶i ði ra ngoài ði 
	 	 	 local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["scn"]  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 

	 	 	 -- ðem trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i truy«n t¯ng tr· v« thì ra là tiªn vào th¶i ði¬m ðích cänh tßþng 
	 	 	 for	 i=0,  membercount-1  do
	 	 	 	 if  LuaFnIsObjValid(  sceneId,  mems[i]  )  ==  1  then
	 	 	 	 	 DelMission(  sceneId,  mems[i],  x808042_g_MissionId  )
	 	 	 	 	 x  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"]  )
	 	 	 	 	 z  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"]  )
	 	 	 	 	 NewWorld(  sceneId,  mems[i],  oldsceneId,  x,  z  )
	 	 	 	 end
	 	 	 end

	 	 --	 LuaFnSetCopySceneData_Param(  sceneId,  7,  0  )

	 	 elseif  leaveTickCount  <  x808042_g_CloseTick  then
	 	 	 -- thông báo trß¾c m£t phó bän cänh tßþng d£m t¤t cä m÷i ngß¶i , cänh tßþng t¡t cûng tính gi¶ ðang lúc 
	 	 	 local  strText  =  format(  " ngß½i ðem · %d giây sau r¶i ði cänh tßþng !",  (x808042_g_CloseTick-leaveTickCount)  *  x808042_g_TickTime  )

	 	 	 for	 i=0,  membercount-1  do
	 	 	 	 if  LuaFnIsObjValid(  sceneId,  mems[i]  )  ==  1  then
	 	 	 	 	 x808042_NotifyTip(  sceneId,  mems[i],  strText  )
	 	 	 	 end
	 	 	 end
	 	 end
	 elseif  TickCount  ==  x808042_g_LimitTimeSuccess  then
	 	 -- n½i này thiªt trí có lúc ðang lúc hÕn chª nhi®m vø hoàn thành xØ lý 
	 	 local  misIndex
	 	 for	 i=0,  membercount-1  do
	 	 	 if  LuaFnIsObjValid(  sceneId,  mems[i]  )  ==  1  then

	 	 	 DelMission(  sceneId,  mems[i],  x808042_g_MissionId  )

	 	 	 	 x808042_NotifyTip(  sceneId,  mems[i],  " nhi®m vø ðã ðªn gi¶ , hoàn thành !"  )

	 	 	 	 -- l¤y ðßþc nhi®m vø s¯ li®u tác dçn tr¸ giá 
	 	 	 	 misIndex  =  GetMissionIndexByID(  sceneId,  mems[i],  x808042_g_MissionId  )
	 	 	 	 -- ðem nhi®m vø thÑ 1 s¯ s¯ li®u thiªt trí vì 1, bày tö hoàn thành nhi®m vø 
	 	 	 	 -- thiªt trí nhi®m vø s¯ li®u 
	 	 	 	 SetMissionByIndex(  sceneId,  mems[i],  misIndex,  x808042_g_Param_IsMissionOkFail,  1  )
	 	 	 	 -- hoàn thành phó bän sØ døng th¶i gian 
	 	 	 	 SetMissionByIndex(  sceneId,  mems[i],  misIndex,  x808042_g_Param_time,  TickCount  *  x808042_g_TickTime  )	 -- thiªt trí nhi®m vø s¯ li®u 
	 	 	 end
	 	 end

	 	 -- thiªt trí phó bän t¡t d¤u hi®u 
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"],  1  )
	 elseif  TickCount  ==  x808042_g_LimitTotalHoldTime  then	 	 	 	 	 	 -- phó bän t±ng th¶i gian hÕn chª ðªn 
	 	 -- n½i này thiªt trí phó bän nhi®m vø có lúc ðang lúc hÕn chª tình hu¯ng , lúc ¤y ðang lúc ðªn sau xØ lý ...
	 	 for	 i=0,  membercount-1  do
	 	 	 if  LuaFnIsObjValid(  sceneId,  mems[i]  )  ==  1  then
	 	 	 	 DelMission(  sceneId,  mems[i],  x808042_g_MissionId  )	 	 	 	 -- nhi®m vø th¤t bÕi , thü tiêu chi 
	 	 	 	 x808042_NotifyTip(  sceneId,  mems[i],  " nhi®m vø th¤t bÕi , cñc kÏ lúc !"  )
	 	 	 end
	 	 end

	 	 -- thiªt trí phó bän t¡t d¤u hi®u 
	 	 LuaFnSetCopySceneData_Param(  sceneId,  x808042_g_keySD["cls"],  1  )
	 else
	 	 -- ð¸nh lúc ki¬m tra ðµi ngû thành viên ðích ðµi ngû s¯ , nªu nhß không phù hþp , là ðá ra phó bän 
	 	 local  oldteamid  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["tem"]  )	 	 -- l¤y ðßþc bäo t°n ðích ðµi ngû s¯ 
	 	 local  oldsceneId  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["scn"]  )	 -- l¤y ðßþc phó bän nh§p kh¦u cänh tßþng s¯ 

	 	 for	 i=0,  membercount-1  do
	 	 	 if  LuaFnIsObjValid(  sceneId,  mems[i]  )  ==  1  and  IsHaveMission(  sceneId,  mems[i],  x808042_g_MissionId  )  >  0  then
	 	 	 	 if  oldteamid  ~=  GetTeamId(  sceneId,  mems[i]  )  then
	 	 	 	 	 DelMission(  sceneId,  mems[i],  x808042_g_MissionId  )	 	 	 -- nhi®m vø th¤t bÕi , thü tiêu chi 
	 	 	 	 	 x808042_NotifyTip(  sceneId,  mems[i],  " nhi®m vø th¤t bÕi , ngß½i không có · ðây chính xác trong ðµi ngû !"  )

	 	 	 	 	 x  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["x"]  )
	 	 	 	 	 z  =  LuaFnGetCopySceneData_Param(  sceneId,  x808042_g_keySD["z"]  )
	 	 	 	 	 NewWorld(  sceneId,  mems[i],  oldsceneId,  x,  z  )
	 	 	 	 end
	 	 	 end
	 	 end

	 end
end

--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x808042_NotifyTip(  sceneId,  selfId,  msg  )

	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )

end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x808042_MsgBox(  sceneId,  selfId,  targetId,  msg  )

	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )

end

--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x808042_NotifyTip(  sceneId,  selfId,  msg  )

	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )

end
