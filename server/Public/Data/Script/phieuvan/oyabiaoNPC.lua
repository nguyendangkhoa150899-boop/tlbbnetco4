-- tác giä : hß äo 
x402306_g_scriptId  =  402306
x402306_g_sceneID  =  {[559]  =  580,[557]  =  574,[558]  =  575,[556]  =  573,[563]  =  569}
OYABIAO_MISSMONSERID  =  0
OYABIAO_MISSMONSERPOS  =  1
OYABIAO_MISSRENWUTIME  =  2
OYABIAO_MISSRENWUTIMESISNOW  =  3
OYABIAO_MISSJUEBIAOKILLPLAYERS  =  4
MF_YANBIAO_CHONGDIAN  =  80
MF_YANBIAO_BEIJUENO  =  81
x402306_g_MissMonsterID  =  OYABIAO_MISSMONSERID
x402306_g_MissMonsterPos  =  OYABIAO_MISSMONSERPOS
x402306_g_MissRenWuTime  =  OYABIAO_MISSRENWUTIME
x402306_g_MissJueBioKillPlayers  =  OYABIAO_MISSJUEBIAOKILLPLAYERS
x402306_g_MissBOOL  =  MF_YANBIAO_CHONGDIAN
x402306_g_MissBeiJueNo  =  MF_YANBIAO_BEIJUENO
x402306_g_MonSterLifeTime  =  1200000
x402306_g_MosterBUFF0  =  9993
x402306_g_MosterBUFF  =  9994
x402306_g_PArID  =  {3,1,2}
x402306_g_Biaozhepos  =  {}
x402306_g_Biaozhepos[557]={[0]={39,43}}
x402306_g_Biaozhepos[558]={[0]={39,212}}
x402306_g_Biaozhepos[556]={[0]={154,207}}
x402306_g_Biaozhepos[563]={[0]={47,223},[1]={98,36},[2]={219,205}}
x402306_g_moster  =  {[1]={ID  =  43549,pox  =  101,poz  =  126,baseAi  =  3,scriptAi  =  -1,scriptID  =  -1  },[2]={ID  =  43550,pox  =  101,poz  =  126,baseAi  =  3,scriptAi  =  -1,scriptID  =  -1  },[3]={ID  =  43551,pox  =  101,poz  =  126,baseAi  =  3,scriptAi  =  -1,scriptID  =  -1  }}
x402306_g_MissListBiao  =  {OYABIAO_MISSMONSERID,OYABIAO_MISSMONSERPOS,OYABIAO_MISSRENWUTIME}
x402306_g_itemlist  =  {38001019,38001020,38001021}
function  x402306_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(  sceneId  )
	         AddText(  sceneId,  "  Mµ Dung nh¤t mÕch ðã cùng C×u lê liên thü , ý mu¯n phá giäi thßþng c± tam ðÕi d¸ thú phong ¤n , l§t ð± Trung Nguyên võ lâm ! hÕo kiªp buông xu¯ng , tÕi hÕ tñ ðß½ng xu¤t thü hóa giäi , sao nÕi lÕi b¸ cái này vô nhai thiên thê cänh khiên bán phân thân không hÕ ……#r        thiªu hi®p ð«u là võ lâm ð°ng ðÕo , không biªt nhßng nguy®n giúp Tiêu m² mµt cánh tay lñc ? thiªu hi®p chï c¥n ðem cái này tái có thích linh v§t ðích xe ngña áp v§n t¾i lâm häi khê c¯c , tñ s¨ có ngß¶i ngñ kÏ tr¤n thú , l¤y giúp ta Trung Nguyên võ lâm "  )
                AddText(  sceneId,  "  phong thú thành công ! #r        #G ti¬u ð« kÏ : c§n m²i ngày 8 lúc t¾i 23 lúc nhßng áp v§n tiêu xa . m²i ngày 20 lúc t¾i 22 lúc b¡t ð¥u áp v§n ðích tiêu xa , trä lÕi tiêu xa lúc nªu hoàn häo không t±n hao gì , là nhßng ðÕt ðßþc g¤p ðôi ðích thích linh d¸ch tß·ng thß·ng . "  )
	 AddNumText(  sceneId,  x402306_g_scriptId,  " phiêu ðßþc ngày hoang ",  6,  88  )
	 AddNumText(  sceneId,  x402306_g_scriptId,  " liên quan t¾i phiêu ðßþc ngày hoang ",  6,  89  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
function  x402306_GetMonster(sceneId)
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 local  MonsterId,selfId,MonsterobjID
	 if  nMonsterNum  >  0  then
	 for  i=0,  nMonsterNum-1  do
	 MonsterId  =  GetMonsterObjID(sceneId,i)
	 MonsterobjID  =  GetMonsterDataID(sceneId,MonsterId)
	 if  MonsterobjID  >=  43549  and  MonsterobjID  <=  43551  then
	 selfId,key1,key2,  key3,  key4,  key5,  key6  =  x402306_GetHuman(sceneId,MonsterId)
	 x402306_DoingMiss(sceneId,selfId,key1,key2,  key3,  key4,  key5,  key6)
	 end
	 end
	 end
end
function  x402306_DoingMiss(sceneId,selfId,ObjID,PArID,  ObjKey,  ObjScene,  ObjPox,  ObjPoz)
    if  selfId  ==  -1  then
	 if  ObjID  >=  0  and  LuaFnIsObjValid(sceneId,  ObjID)  ==  1  and  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjID,  x402306_g_MosterBUFF)  ==  0  then
        LuaFnSendSpecificImpactToUnit(sceneId,  ObjID,  ObjID,  ObjID,  x402306_g_MosterBUFF,  0)
        end
	 else
	 if  ObjID  >=  0  and  LuaFnIsObjValid(sceneId,  ObjID)  ==  1  and  sceneId  ==  ObjScene  and  ((x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402306_g_MissRenWuTime)))  >  0  then

        local  selfposx,selfposz  =  GetWorldPos(sceneId,selfId)
        selfposx,selfposz  =  floor(selfposx),floor(selfposz)
        local  posx,posz  =  GetWorldPos(sceneId,ObjID)
        posx,posz  =  floor(posx),floor(posz)
        if  (selfposx  -  posx)  *  (selfposx  -  posx)  +  (selfposz  -  posz)  *  (selfposz  -  posz)  >  9  then
        if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjID,  x402306_g_MosterBUFF)  ==  0  then
        LuaFnSendSpecificImpactToUnit(sceneId,  ObjID,  ObjID,  ObjID,  x402306_g_MosterBUFF,  0)
        end
        else
	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjID,  x402306_g_MosterBUFF)  ==  1  then
        LuaFnCancelSpecificImpact(sceneId,ObjID,x402306_g_MosterBUFF)
	 end
        end
	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjID,  x402306_g_MosterBUFF)  ==  0  then
	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjID,  ObjID,  ObjID,  x402306_g_MosterBUFF0,  0)
	 end
	 local  senyutiem  =  (x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402306_g_MissRenWuTime))
	 SetMissionData(sceneId,  selfId,x402306_g_MissMonsterPos,sceneId*1000000+posx*1000+posz)
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  x402306_g_PArID[PArID+1]  )
        UICommand_AddInt(  sceneId,  ObjKey  )
        UICommand_AddInt(  sceneId,  x402306_g_sceneID[ObjScene]  )
        UICommand_AddInt(  sceneId,  posx  )
        UICommand_AddInt(  sceneId,  posz  )
        UICommand_AddInt(  sceneId,  senyutiem  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  ObjKey  )
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,    "890901")
        end	 
	 end
  
end
function  x402306_GetHuman(sceneId,Monster)
	 local  nHumanCount  =  LuaFnGetCopyScene_HumanCount(sceneId)
	 local  misspos,nHumanId,key1,key2,  key3,  key4,  key5,  key6    =  -1,-1,-1
	 if  nHumanCount  >  0  then
	 for  i=0,  nHumanCount-1  do
	 nHumanId  =  LuaFnGetCopyScene_HumanObjId(sceneId,  i)
	 key1,  key2,  key3,  key4,  key5,  key6  =  x402306_GetDataNum(sceneId,  nHumanId)
        if  key1  ==  Monster  then
	 misspos  =  nHumanId
	 break
	 end
	 end
	 end
return  	 misspos,key1,key2,  key3,  key4,  key5,  key6
end	 
function  x402306_GetDataNum(sceneId,  selfId)
local  mymissdatanum  =  GetMissionData(sceneId,  selfId,x402306_g_MissMonsterID)
local  nObjID  =  floor(mymissdatanum/100000)-1
local  ret  =  floor(mod(mymissdatanum,100000)/10)-1
local  keyid  =  mod(mymissdatanum,10)
local  yabiaoData  =  GetMissionData(sceneId,  selfId,x402306_g_MissMonsterPos)
local  monstercearsceneId  =  floor(yabiaoData/1000000)
local  monstercearposx  =  floor(mod(yabiaoData,1000000)/1000)
local  monstercearposz  =  mod(yabiaoData,1000)
return  nObjID,ret,keyid,monstercearsceneId,monstercearposx,monstercearposz;
end
function  x402306_OnTimer(sceneId)
x402306_GetMonster(sceneId)
end
function  x402306_OnEventRequest(  sceneId,  selfId,  targetId)
if  GetNumText()  ==  88  then
--if  1  then
--x402306_NotifyTip(  sceneId,  selfId,  "TÕm không m· ra "  )
--return
--end
local  nQuarter  =  mod(GetQuarterTime(),100);
if  nQuarter  <  32  or  nQuarter  >  92  then
x402306_NotifyTip(  sceneId,  selfId,  "#H không có · ðây v§n phiêu hoÕt ðµng th¶i gian bên trong , không cách nào tiªn hành v§n phiêu ! "  )
return
end
local  senyutiem  =  floor((x402306_g_MonSterLifeTime)/1000)  -  (LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402306_g_MissRenWuTime))
if  0  ==  isko  and  senyutiem  >  0  then
x402306_NotifyTip(  sceneId,  selfId,  " ngài còn có nhi®m vø chßa hoàn thành , không th¬ næa nh§n l¤y "  )
return
end
local  dotimes  =  CallScriptFunction(  402307,  "GetDayDoTimes",  sceneId,  selfId  )
if  3  <  dotimes  then
x402306_NotifyTip(  sceneId,  selfId,  "        thiªu hi®p hôm nay ðã ði qua 3 chuyªn phiêu li­u , còn là h½i làm nghï ng½i , ngày mai tr· lÕi th×a nh§n áp v§n tiêu xa ði ! "  )
return
end
BeginUICommand(  sceneId  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  selfId  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  569  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  100  )
UICommand_AddInt(  sceneId,  100  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  1  )
EndUICommand(  sceneId  )
DispatchUICommand(  sceneId,  selfId,    "20140926")
elseif  GetNumText()  ==  89  then
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  "#Y liên quan t¾i phiêu ðßþc ngày hoang #W#r  #r        #G c¤p b§c ðÕt t¾i 85 c¤p #W ðích nhà ch½i , m²i ngày nhßng · #G phßþng minh tr¤n #{_INFOAIM101,127,580, tiêu ng÷n núi }#R tiêu ng÷n núi #W ch² áp v§n b¤t ð°ng c¤p b§c ðích tiêu xa , áp v§n ðích #G tiêu xa càng quý tr÷ng #W , trä lÕi tiêu xa lúc ðÕt ðßþc ðích #G tß·ng thß·ng lÕi càng phong phú #W . #r  #r#cfabf8f áp phiêu th¶i gian #W#r        c§n #G m²i ngày 8 lúc t¾i 23 lúc #W trong lúc #G nhßng nh§n l¤y tiêu xa #W tiªn hành #G áp v§n #W , nhæng th¶i gian khác ð«u không pháp tiªn hành nh§n l¤y . #r        #G m²i ngày 20 lúc t¾i 22 lúc #W s· #G nh§n l¤y #W ðªn ðích #G tiêu xa #W , · #G trä lÕi lúc #W nªu vì #R ð°ng xanh tiêu xa #W?#R bÕc tr¡ng tiêu xa #W ho£c #R hoàng kim tiêu xa #W , là nhßng ðÕt ðßþc #G g¤p ðôi #W ðích #Y thích linh d¸ch #W tß·ng thß·ng . #r  #r#cfabf8f nh§n l¤y tiêu xa #W#r        #G m²i ngày #W nhi«u nh¤t nhßng nh§n l¤y #G3 lßþng #W tiêu xa . nh§n l¤y tiêu xa lúc , t±ng cµng có #R ð°ng xanh tiêu xa #W?#R bÕc tr¡ng tiêu xa #W cùng #R hoàng kim tiêu xa #W có th¬ cung c¤p lña ch÷n . #r        #G nh§n l¤y #R ð°ng xanh tiêu xa #W : c¥n #G trä 10#-02#W ðích ti«n thª chân . nªu trä lÕi lúc tiêu xa #G vì #R ð°ng xanh tiêu xa #W , là ti«n thª chân #G toàn ngÕch hoàn trä #W , ð°ng th¶i nhßng ðÕt ðßþc #G5 cá #Y thích linh d¸ch #W . nªu trä lÕi lúc tiêu xa #G vì #R tàn phá tiêu xa #W , là #G không cách nào ðÕt ðßþc ti«n thª chân #W , nhßng vçn nhßng #G ðÕt ðßþc 3 cá #Y thích linh d¸ch #W . #r        #G nh§n l¤y #R bÕc tr¡ng tiêu xa #W : c¥n #G trä 200 nguyên bäo #W lÕi v×a ðÕt ðßþc #G nh§n l¤y tß cách #W , nh§n l¤y lúc còn c¥n #G trä 20#-02#W ðích ti«n thª chân . nªu trä lÕi lúc tiêu xa #G vì #R bÕc tr¡ng tiêu xa #W , là ti«n thª chân #G toàn ngÕch hoàn trä #W , ð°ng th¶i nhßng ðÕt ðßþc #G10 cá #Y thích linh d¸ch #W . nªu tiêu xa #G b¸ phá hüy #W sau næa giao phó , là #G không cách nào ðÕt ðßþc ti«n thª chân #W , nhßng vçn nhßng #G ðÕt ðßþc 7 cá #Y thích linh d¸ch #W . #r        #G nh§n l¤y #R hoàng kim tiêu xa #W : c¥n #G trä 500 nguyên bäo #W lÕi v×a ðÕt ðßþc #G nh§n l¤y tß cách #W , nh§n l¤y lúc còn c¥n #G trä 50#-02#W ðích ti«n thª chân . nªu trä lÕi lúc tiêu xa #G vì #R hoàng kim tiêu xa #W , là ti«n thª chân #G toàn ngÕch hoàn trä #W , ð°ng th¶i nhßng ðÕt ðßþc #G20 cá #Y thích linh d¸ch #W . nªu trä lÕi lúc tiêu xa #G vì #R tàn phá tiêu xa #W , là #G không cách nào ðÕt ðßþc ti«n thª chân #W , nhßng vçn nhßng #G ðÕt ðßþc 15 cá #Y thích linh d¸ch #W . #r  #r#cfabf8f áp v§n tiêu xa #W#r        thành công nh§n l¤y tiêu xa lúc , s¨ #G ngçu nhiên #W ðÕt ðßþc mµt cái #G áp phiêu lµ tuyªn #W , ð°ng th¶i #G tiêu xa #W ðem #G tñ ðµng #W duyên nên lµ tuyªn #G ði t¾i #W , cho ðªn t¾i chuyªn này ði¬m cu¯i . #r        áp phiêu trong quá trình , nªu #G áp phiêu ngß¶i khoäng cách tiêu xa quá xa #W , là #G tiêu xa #W s¨ #G d×ng lÕi #W ði t¾i , cho ðªn #G áp phiêu ngß¶i #W tr· v« #G tiêu xa phø c§n #W . #r        #G tiêu xa #W ðªn #R tiêu xa d¸ch trÕm #W lúc , áp phiêu ngß¶i nhßng thông qua #R tiêu xa d¸ch trÕm #G truy«n t¯ng #W t¾i cuµc kª tiªp cänh #G tiªp tøc áp phiêu #W . #r        m²i l¥n áp phiêu c¥n · #G20 phút #W bên trong hoàn thành , nªu không ðem coi là #G áp phiêu th¤t bÕi #W , #G không cách nào ðÕt ðßþc ti«n thª chân cùng b¤t kÏ tß·ng thß·ng #W . #r  #r#cfabf8f ngân phiªu #W#r        vô lu§n loÕi nào phiêu ngân , m²i vai trò #G m²i ngày #W c§n có th¬ sØ døng #G3 l¥n #W phiêu ngân . "  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
end
function  x402306_OpenJueBiao(  sceneId,  selfId)
local  key1,  key2,  key3,  key4,  key5,  key6  =  x402306_GetDataNum(sceneId,  selfId)
local  senyutiem  =  ((x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402306_g_MissRenWuTime)))
if  senyutiem  <=  0  then
if    GetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo)  ==  1  then
for  i  =  1,3  do
if  GetMissionData(sceneId,  selfId,x402306_g_MissListBiao[i])  >  0  then
SetMissionData(sceneId,  selfId,x402306_g_MissListBiao[i],0)
end
end
SetMissionFlag(sceneId,  selfId,  x402306_g_MissBOOL,  0)
SetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo,0)
BeginUICommand(  sceneId  )
UICommand_AddInt(  sceneId,  2  )
EndUICommand(  sceneId  )
DispatchUICommand(  sceneId,  selfId,    "890901")
LuaFnSendSystemMail(  sceneId,  GetName(sceneId,selfId),  " ngài ðích [ phiêu ðßþc ngày hoang ] nhi®m vø th¤t bÕi , tiêu xa ðã biªn m¤t . "  )
return
end
return
end
if  GetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo)  ==  1  then
	 BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  x402306_g_PArID[key2+1]  )
        UICommand_AddInt(  sceneId,  4  )
        UICommand_AddInt(  sceneId,  x402306_g_sceneID[sceneId]  )
        UICommand_AddInt(  sceneId,  posx  )
        UICommand_AddInt(  sceneId,  posz  )
        UICommand_AddInt(  sceneId,  senyutiem  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  4  )
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,    "890901")
return
end
end
function  x402306_CreateMonster(  sceneId,  selfId)
local  nObjID
local  key1,  key2,  key3,  key4,  key5,  key6  =  x402306_GetDataNum(sceneId,  selfId)
local  senyutiem  =  ((x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402306_g_MissRenWuTime)))
if  senyutiem  <=  0  then
if    GetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo)  ==  1  then
for  i  =  1,3  do
if  GetMissionData(sceneId,  selfId,x402306_g_MissListBiao[i])  >  0  then
SetMissionData(sceneId,  selfId,x402306_g_MissListBiao[i],0)
end
end
SetMissionFlag(sceneId,  selfId,  x402306_g_MissBOOL,  0)
SetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo,0)
return
end
return
end

if  GetMissionFlag(sceneId,  selfId,  x402306_g_MissBOOL)  ==  0  then
if    key1  >=  0  and  LuaFnIsObjValid(sceneId,  key1)  ~=  1  and  GetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo)  ==  0  then
x402306_CreateMonsteragian(  sceneId,  selfId)
end
return
end
if  key4  ~=  sceneId  then
return
end
if  x402306_g_Biaozhepos[sceneId]  ==  nil  then
return
end

if  sceneId  ==  563  then
if  key2  ==  nil  or  x402306_g_Biaozhepos[sceneId][key2]  ==  nil  then
return
end
end
if  key3  ==  nil  or  x402306_g_moster[key3]  ==  nil  then
return
end

if  sceneId  ==  563  then
nObjID  =  LuaFnCreateMonster(sceneId,x402306_g_moster[key3].ID,  x402306_g_Biaozhepos[563][key2][1],    x402306_g_Biaozhepos[563][key2][2],    x402306_g_moster[key3].baseAi,  x402306_g_moster[key3].scriptAi,  x402306_g_moster[key3].scriptID  )
else
nObjID  =  LuaFnCreateMonster(sceneId,x402306_g_moster[key3].ID,  x402306_g_Biaozhepos[sceneId][0][1],    x402306_g_Biaozhepos[sceneId][0][2],    x402306_g_moster[key3].baseAi,  x402306_g_moster[key3].scriptAi,  x402306_g_moster[key3].scriptID  )
end
SetMissionFlag(sceneId,  selfId,  x402306_g_MissBOOL,0)
if  nObjID  and  nObjID  ~=  -1  then
SetCharacterTitle(sceneId,  nObjID,GetName(sceneId,  selfId)  )
SetCharacterDieTime(sceneId,  nObjID,  senyutiem*1000);
if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  nObjID,  x402306_g_MosterBUFF)  ==  0  then
LuaFnSendSpecificImpactToUnit(sceneId,  nObjID,  nObjID,  nObjID,  x402306_g_MosterBUFF0,  0)
end
local  posx,posz  =  GetWorldPos(sceneId,nObjID)
posx,posz  =  floor(posx),floor(posz)
SetMissionData(sceneId,  selfId,x402306_g_MissMonsterPos,sceneId*1000000+posx*1000+posz)
SetMissionData(sceneId,  selfId,x402306_g_MissMonsterID,(nObjID+1)*100000+(key2+1)*10+key3)
if  sceneId  ==  563  then
SetPatrolId(sceneId,  nObjID,key2)
else
SetPatrolId(sceneId,  nObjID,0)
end
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  x402306_g_PArID[key2+1]  )
        UICommand_AddInt(  sceneId,  key3  )
        UICommand_AddInt(  sceneId,  x402306_g_sceneID[sceneId]  )
        UICommand_AddInt(  sceneId,  posx  )
        UICommand_AddInt(  sceneId,  posz  )
        UICommand_AddInt(  sceneId,  senyutiem  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  key3  )
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,    "890901")
end
end
function  x402306_CreateMonsteragian(  sceneId,  selfId)
local  nObjID
local  key1,  key2,  key3,  key4,  key5,  key6  =  x402306_GetDataNum(sceneId,  selfId)
local  senyutiem  =  ((x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402306_g_MissRenWuTime)))
if  key4  ~=  sceneId  then
return
end
if  x402306_g_Biaozhepos[sceneId]  ==  nil  then
return
end

if  sceneId  ==  563  then
if  key2  ==  nil  or  x402306_g_Biaozhepos[sceneId][key2]  ==  nil  then
return
end
end
if  key3  ==  nil  or  x402306_g_moster[key3]  ==  nil  then
return
end

nObjID  =  LuaFnCreateMonster(sceneId,x402306_g_moster[key3].ID,    key5,    key6,    x402306_g_moster[key3].baseAi,  x402306_g_moster[key3].scriptAi,  x402306_g_moster[key3].scriptID  )

if  nObjID  and  nObjID  ~=  -1  then
SetCharacterTitle(sceneId,  nObjID,GetName(sceneId,  selfId)  )
SetCharacterDieTime(sceneId,  nObjID,  senyutiem*1000);
if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  nObjID,  x402306_g_MosterBUFF)  ==  0  then
LuaFnSendSpecificImpactToUnit(sceneId,  nObjID,  nObjID,  nObjID,  x402306_g_MosterBUFF0,  0)
end
local  posx,posz  =  GetWorldPos(sceneId,nObjID)
posx,posz  =  floor(posx),floor(posz)
SetMissionData(sceneId,  selfId,x402306_g_MissMonsterPos,sceneId*1000000+posx*1000+posz)
SetMissionData(sceneId,  selfId,x402306_g_MissMonsterID,(nObjID+1)*100000+(key2+1)*10+key3)
if  sceneId  ==  563  then
SetPatrolId(sceneId,  nObjID,key2)
else
SetPatrolId(sceneId,  nObjID,0)
end
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  x402306_g_PArID[key2+1]  )
        UICommand_AddInt(  sceneId,  key3  )
        UICommand_AddInt(  sceneId,  x402306_g_sceneID[sceneId]  )
        UICommand_AddInt(  sceneId,  posx  )
        UICommand_AddInt(  sceneId,  posz  )
        UICommand_AddInt(  sceneId,  senyutiem  )
        UICommand_AddInt(  sceneId,  1  )
        UICommand_AddInt(  sceneId,  key3  )
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,    "890901")
end

end
function  x402306_KillPlayer(  sceneId,  objId,  killerId  )
        if  objId  ==  -1  or  objId  ==  nil  or    killerId  ==  -1  or  killerId  ==  nil  then
	 return
	 end
	 local	 nam_mob	 =  GetName(  sceneId,  objId  )
	 local  objType  =  GetCharacterType(  sceneId,  killerId  )
	 if  objType  ~=  1  and  objType  ~=  3  then
	 return
	 end
	 local  objType2  =  GetCharacterType(  sceneId,  objId  )
	 if  objType2  ~=  1  then
	 return
	 end
	 local  senyutiem  =  ((x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  objId,x402306_g_MissRenWuTime)))
	 if  senyutiem  <=  0  then
	 for  i  =  1,3  do
	 if  GetMissionData(sceneId,  selfId,x402306_g_MissListBiao[i])  >  0  then
	 SetMissionData(sceneId,  selfId,x402306_g_MissListBiao[i],0)
	 end
	 end
	 SetMissionFlag(sceneId,  selfId,  x402306_g_MissBOOL,  0)
	 SetMissionFlag(sceneId,  selfId,  x402306_g_MissBeiJueNo,0)
	 return
	 end
	 if  objType  ==  3  then
	 killerId  =  GetPetCreator(  sceneId,  killerId  )
	 end
	 local	 killer_mob	 =  GetName(  sceneId,  killerId  )
	 if  GetMissionFlag(sceneId,  objId,  x402306_g_MissBeiJueNo)  ==  1  then
	 return
	 end
	 local  key1,  key2,  key3,  key4,  key5,  key6  =  x402306_GetDataNum(sceneId,  objId)
        if  	 key1  <  0  then
	 return
	 end
	 if  LuaFnIsObjValid(sceneId,  key1)  ~=  1  then
	 return
	 end
	 local  lastDayCount  =  x402306_GetDayDoTimes(  sceneId,  killerId  )
	 if  lastDayCount  >=  3  then
	 SetMissionFlag(sceneId,  objId,  x402306_g_MissBeiJueNo,1)
	 SetCharacterDieTime(sceneId,  key1,  1);
	 x402306_NotifyTip(  sceneId,  objId,  " ngài ðích tiêu xa ðã b¸ ["..killer_mob.."] s· cß¾p "  )
	 x402306_NotifyTip(  sceneId,  killerId,  " ngài thành công cß¾p l¤y ðßþc ["..nam_mob.."] ðích tiêu xa , nhßng hôm nay ðã cß¾p tiêu xa vßþt qua ba l¥n , cho nên vô b¤t kÏ tß·ng thß·ng . "  )
                x402306_OpenJueBiao(  sceneId,  objId)
	 return
	 end
	 if  x402306_g_itemlist[key3]  ==  nil  then
	 return
	 end
	 SetMissionFlag(sceneId,  objId,  x402306_g_MissBeiJueNo,1)
	 SetMissionData(sceneId,  killerId,x402306_g_MissJueBioKillPlayers,GetDayTime()*100+lastDayCount+1)
	 local  x,z  =  GetWorldPos(sceneId,  objId)
	 local  nBoxId  =  DropBoxEnterScene(x,z,sceneId  )
	 if  nBoxId  >  -1    then
	 AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,x402306_g_itemlist[key3])
	 end
	 SetCharacterDieTime(sceneId,  key1,  1);
	 x402306_NotifyTip(  sceneId,  objId,  " ngài ðích tiêu xa ðã b¸ ["..killer_mob.."] s· cß¾p "  )
	 x402306_NotifyTip(  sceneId,  killerId,  " ngài thành công cß¾p l¤y ðßþc ["..nam_mob.."] ðích tiêu xa "  )
                x402306_OpenJueBiao(  sceneId,  objId)

end
function  x402306_GetDayDoTimes(  sceneId,  selfId  )
	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  x402306_g_MissJueBioKillPlayers  )
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 local  CurDayTime  =  GetDayTime()

	 if  CurDayTime  >  lastDayTime  then
	 	 lastDayTime  =  CurDayTime
	 	 lastDayCount  =  0
	 end
	 
return  	 lastDayCount
end
function  x402306_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end