-- tác giä : hß äo 
x402307_g_scriptId  =  402307
x402307_g_MainScriptId  =  402306
x402307_g_MonSterLifeTime  =  1200000
x402307_g_MissMonsterID  =  OYABIAO_MISSMONSERID
x402307_g_MissMonsterPos  =  OYABIAO_MISSMONSERPOS
x402307_g_MissRenWuTime  =  OYABIAO_MISSRENWUTIME
x402307_g_MissRenWuTimesisnow  =  OYABIAO_MISSRENWUTIMESISNOW
x402307_g_MissBOOL  =  MF_YANBIAO_CHONGDIAN
x402307_g_MissBeiJueNo  =  MF_YANBIAO_BEIJUENO
x402307_g_moster  =  {[1]={ID  =  43549,pox  =  101,poz  =  126,baseAi  =  3,scriptAi  =  -1,scriptID  =  -1  },[2]={ID  =  43550,pox  =  101,poz  =  126,baseAi  =  3,scriptAi  =  -1,scriptID  =  -1  },[3]={ID  =  43551,pox  =  101,poz  =  126,baseAi  =  3,scriptAi  =  -1,scriptID  =  -1  }}
x402311_g_Needmoney  =  {100000,200000,500000}
function  x402307_AskGuard(  sceneId,  selfId,targetId,keyid)
--if  1  then
--x402307_NotifyTip(  sceneId,  selfId,  " tÕm không m· ra "  )
--return
--end
if  x402307_g_moster[keyid]  ==  nil  then
return
end
local  mybiao  =  {x402307_g_MissMonsterID,x402307_g_MissMonsterPos,x402307_g_MissRenWuTime}
local  missluvar,isko  =  0,1
for  i  =  1,3  do
missluvar  =  GetMissionData(sceneId,  selfId,mybiao[i])
if  missluvar  ~=  0  then
isko  =  0
break
end
end
if  x402311_g_Needmoney[keyid]  ==  nil  then
x402307_NotifyTip(  sceneId,  selfId,  " kim ti«n s¯ li®u sai l¥m ! ! "  )
return
end
local  nQuarter  =  mod(GetQuarterTime(),100);
if  nQuarter  <  32  or  nQuarter  >  92  then
x402307_NotifyTip(  sceneId,  selfId,  "#H không có · ðây v§n phiêu hoÕt ðµng th¶i gian bên trong , không cách nào tiªn hành v§n phiêu ! "  )
return
end
local  senyutiem  =  floor((x402307_g_MonSterLifeTime)/1000)  -  (LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402307_g_MissRenWuTime))
if  0  ==  isko  and  senyutiem  >  0  then
x402307_NotifyTip(  sceneId,  selfId,  " ngài còn có nhi®m vø chßa hoàn thành , không th¬ næa nh§n l¤y "  )
return
end
local  dotimes  =  x402307_GetDayDoTimes(  sceneId,  selfId  )
if  3  <  dotimes  then
x402307_NotifyTip(  sceneId,  selfId,  "        thiªu hi®p hôm nay ðã ði qua 3 chuyªn phiêu li­u , còn là h½i làm nghï ng½i , ngày mai tr· lÕi th×a nh§n áp v§n tiêu xa ði ! "  )
return
end
local  mymoney  =  GetMoney(sceneId,  selfId)
if  x402311_g_Needmoney[keyid]  >  mymoney  then
x402307_NotifyTip(  sceneId,  selfId,  " kim ti«n chßa ðü #{_MONEY"..x402311_g_Needmoney[keyid].."}"  )
return
end
CostMoney(sceneId,  selfId,x402311_g_Needmoney[keyid])
local  nObjID  =  LuaFnCreateMonster(sceneId,x402307_g_moster[keyid].ID,  x402307_g_moster[keyid].pox,    x402307_g_moster[keyid].poz,    x402307_g_moster[keyid].baseAi,  x402307_g_moster[keyid].scriptAi,  x402307_g_moster[keyid].scriptID  )
if  nObjID  and  nObjID  ~=  -1  then
SetCharacterTitle(sceneId,  nObjID,GetName(sceneId,  selfId)  )
SetCharacterDieTime(sceneId,  nObjID,  x402307_g_MonSterLifeTime);
local  ret  =  random(0,2)
SetPatrolId(sceneId,  nObjID,ret)
local  posx,posz  =  GetWorldPos(sceneId,nObjID)

posx,posz  =  floor(posx),floor(posz)
SetMissionData(sceneId,  selfId,x402307_g_MissMonsterPos,sceneId*1000000+posx*1000+posz)
SetMissionData(sceneId,  selfId,x402307_g_MissMonsterID,(nObjID+1)*100000+(ret+1)*10+keyid)
SetMissionData(sceneId,  selfId,x402307_g_MissRenWuTime,LuaFnGetCurrentTime())
SetMissionFlag(sceneId,  selfId,  x402307_g_MissBOOL,  0)
SetMissionFlag(sceneId,  selfId,  x402307_g_MissBeiJueNo,0)
x402307_OnPlayerEnter(  sceneId,  selfId  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)
x402307_NotifyTip(  sceneId,  selfId,  " chúc m×ng ngài thành công nh§n l¤y phiêu ðßþc ngày hoang nhi®m vø "  )
BeginUICommand(  sceneId  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  sceneId  )
UICommand_AddInt(  sceneId,  posx  )
UICommand_AddInt(  sceneId,  posz  )
UICommand_AddInt(  sceneId,  5000000  )
UICommand_AddInt(  sceneId,  1  )
UICommand_AddInt(  sceneId,  1  )
EndUICommand(  sceneId  )
DispatchUICommand(  sceneId,  selfId,    "890901")
end


end
function  x402307_GetDayDoTimes(  sceneId,  selfId  )
	 local  lastTime  =  GetMissionData(  sceneId,  selfId,  x402307_g_MissRenWuTimesisnow  )
	 local  lastDayTime  =  floor(  lastTime  /  100  )
	 local  lastDayCount  =  mod(  lastTime,  100  )
	 local  CurDayTime  =  GetDayTime()

	 if  CurDayTime  >  lastDayTime  then
	 	 lastDayTime  =  CurDayTime
	 	 lastDayCount  =  0
	 end
return  	 lastDayCount,lastDayTime
end
function  x402307_OnPlayerEnter(  sceneId,  selfId  )
        local  dotimes,lastDayTime  =  x402307_GetDayDoTimes(  sceneId,  selfId  )
	 dotimes  =  dotimes  +  1
	 local  lastTime  =  lastDayTime  *  100  +  dotimes
	 SetMissionData(  sceneId,  selfId,  x402307_g_MissRenWuTimesisnow,  lastTime  )
end

function  x402307_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end