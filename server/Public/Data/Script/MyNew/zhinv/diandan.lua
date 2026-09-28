-- tác giä   By  UK  QQ  2269169441  

x890547_g_ScriptId  =  890547
x890547_g_missmosterdata  =  MD_MISS_MOSTER_DATA
x890547_g_missmosterobjandscene  =  MD_MISS_MOSTER_OBJ
function  x890547_OnDefaultEvent(  sceneId,  selfId,targetId  )

end

function  x890547_CallIan(  sceneId,  selfId)
local  myIance2  =  GetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene)
if  myIance2  >  0  then
x890547_Tips(  sceneId,  selfId," Hài TØ ðang tri®u h°i , không th¬ g÷i ra næa "  )
return
end
local  createinfanmodelid  =  x890547_GetInfantID(  sceneId,  selfId)
if  createinfanmodelid  <  1  then
x890547_Tips(  sceneId,  selfId," Các hÕ không có Hài TØ, không th¬ tiªn hành thao tác "  )
return
end
local  SXCLHR  =  GetMissionData(sceneId,selfId,MD_INFANTSXCLHR)
local  SXCLHR2  =format("%05d",SXCLHR)
local  IFLV  =  tonumber(strsub(SXCLHR2,2,4))
if    IFLV  ==  nil  or  IFLV  <  91  then
	 x890547_Tips  (sceneId,  selfId," Hài TØ ðÕt t¾i c¤p 91, m¾i có th¬ thao tác ")
	 return
end
local  PlayerX,PlayerZ  =  GetWorldPos(sceneId,selfId)
local  MstId  =  LuaFnCreateMonster(sceneId,  createinfanmodelid,  PlayerX,PlayerX+2,  32,  -1,  890547)
local  myname  =  GetName(sceneId,selfId)
local  myname2  =  "Hoàng TØ"
if  createinfanmodelid  >=  64500  then
myname2  =  "Công Chúa"
end
SetCharacterName(sceneId,  MstId,  "#ccc33cc"..myname2.." cüa "..myname)
LuaFnSetNpcIntParameter(  sceneId,MstId,0,selfId)
LuaFnSetNpcIntParameter(  sceneId,MstId,1,0)
SetCharacterTimer(  sceneId,  MstId,  1000)
SetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene,MstId*1000+sceneId+1)
x890547_Tips(  sceneId,  selfId," Cho g÷i Hài TØ thành công "  )
end

function  x890547_DelIan(  sceneId,  selfId)
local  myIance2  =  GetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene)
if  myIance2  <=  0  then
x890547_Tips(  sceneId,  selfId," Không g÷i ra Hài TØ , không th¬ tiªn hành thao tác "  )
return
end

local  createinfanmodelid  =  x890547_GetInfantID(  sceneId,  selfId)
if  createinfanmodelid  <  1  then
x890547_Tips(  sceneId,  selfId," Các hÕ không có Hài TØ, không th¬ tiªn hành thao tác "  )
return
end

local  objceasence  =  mod(myIance2,1000)-1
if  objceasence  ~=  sceneId    then
x890547_Tips(  sceneId,  selfId," các hÕ có cho g÷i quá Hài TØ ði ra"  )
return
end

myIance2  =  floor(myIance2/1000)
if  LuaFnIsObjValid(sceneId,  myIance2)  ~=  1  or  LuaFnIsCharacterLiving(sceneId,  myIance2)  ~=  1    then
x890547_Tips(  sceneId,  selfId," các hÕ ðích Hài TØ không có cho g÷i ra t¾i "  )
return
end

local  targetId  =  LuaFnGetNpcIntParameter(  sceneId,myIance2,0)
if  targetId  ~=  selfId    then
x890547_Tips(  sceneId,  selfId," các hÕ ðích Hài TØ không có cho g÷i ra t¾i "  )
return
end
SetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene,0)
SetCharacterDieTime(sceneId,  myIance2,  3)
x890547_Tips(  sceneId,  selfId," Thu H°i thành công Hài TØ "  )
end

function  x890547_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
local  targetId  =  LuaFnGetNpcIntParameter(  sceneId,objId,0)
if  LuaFnIsObjValid(sceneId,  targetId)  ~=  1  or  LuaFnIsCanDoScriptLogic(sceneId,  targetId)  ~=  1  or  LuaFnIsCharacterLiving(sceneId,  targetId)  ~=  1    then
SetCharacterDieTime(sceneId,  objId,  3)
return
end
if  IsInDist(  sceneId,  targetId  ,  objId,  2  )  ==  1  then
return
end
if  IsInDist(  sceneId,  targetId  ,  objId,  25  )  ~=  1  then
local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  objId,2680)
if  nRet  ~=  1  then
LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  2680,  0)
end
local  PlayerX,PlayerZ  =  GetWorldPos(sceneId,targetId)
SetPos(sceneId,  objId,  PlayerX,  PlayerZ+2)
AddPrimaryEnemy(sceneId,objId,targetId)
return
end

if  IsInDist(  sceneId,  targetId  ,  objId,  18  )  ~=  1  then
local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  objId,2681)
if  nRet  ~=  1  then
LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  2681,  0)
AddPrimaryEnemy(sceneId,objId,targetId)
end
AddPrimaryEnemy(sceneId,objId,targetId)
return
end

if  IsInDist(  sceneId,  targetId  ,  objId,  12  )  ~=  1  then
local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  objId,2682)
if  nRet  ~=  1  then
LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  2682,  0)
AddPrimaryEnemy(sceneId,objId,targetId)
return
end
AddPrimaryEnemy(sceneId,objId,targetId)
return
end	 

if  IsInDist(  sceneId,  targetId  ,  objId,  10  )  ~=  1  then
local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  objId,2683)
if  nRet  ~=  1  then
LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  2683,  0)
AddPrimaryEnemy(sceneId,objId,targetId)
return
end
AddPrimaryEnemy(sceneId,objId,targetId)
return
end

if  IsInDist(  sceneId,  targetId  ,  objId,  6  )  ~=  1  then
local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  objId,2684)
if  nRet  ~=  1  then
LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  2684,  0)
AddPrimaryEnemy(sceneId,objId,targetId)
return
end
AddPrimaryEnemy(sceneId,objId,targetId)
return
end

if  IsInDist(  sceneId,  targetId  ,  objId,  4  )  ~=  1  then
local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  objId,2685)
if  nRet  ~=  1  then
LuaFnSendSpecificImpactToUnit(sceneId,  objId,  objId,  objId,  2685,  0)
AddPrimaryEnemy(sceneId,objId,targetId)
return
end
AddPrimaryEnemy(sceneId,objId,targetId)
return
end	 

AddPrimaryEnemy(sceneId,objId,targetId)
end

function  x890547_GetInfantID(  sceneId,  selfId)
local  myIance  =  GetMissionData(sceneId,  selfId,x890547_g_missmosterdata)
local  SXCLHR  =  GetMissionData(sceneId,selfId,MD_INFANTSXCLHR)
local  infantsex  =  floor(SXCLHR/10000)
if  infantsex  <=  0  then
return  -1
end
local  infanmodelid  =  -1
if  myIance  >  0  then
if  myIance  >  63  then
myIance  =  63
end
if  infantsex  ==  1  then

infanmodelid  =  64000+myIance + GetMissionData(sceneId,selfId,MD_thoitrangcon)
x890547_Tips(  sceneId,  selfId,GetMissionData(sceneId,selfId,MD_thoitrangcon) )
else
infanmodelid  =  64500+myIance + GetMissionData(sceneId,selfId,MD_thoitrangcon)
x890547_Tips(  sceneId,  selfId,GetMissionData(sceneId,selfId,MD_thoitrangcon) )
end
else
if  infantsex  ==  1  then
infanmodelid  =  64000
else
infanmodelid  =  64500
end
end
return  infanmodelid
end

function  x890547_CreateIance(  sceneId,  selfId)
local  mydata  =  GetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene)
if  mydata  <  1  then
return
end
local  createinfanmodelid  =  x890547_GetInfantID(  sceneId,  selfId)
if  createinfanmodelid  <  1  then
return
end
local  objceasence  =  mod(mydata,1000)-1
local  myIance2  =  floor(mydata/1000)
local  PlayerX,PlayerZ  =  GetWorldPos(sceneId,selfId)
PlayerZ  =  PlayerZ  +  2
if  LuaFnIsObjValid(sceneId,  myIance2)  ==  1  and  LuaFnIsCharacterLiving(sceneId,  myIance2)  ==  1  and  objceasence  ==  sceneId  then
PlayerX,PlayerZ  =  GetWorldPos(sceneId,myIance2)
SetCharacterDieTime(sceneId,  myIance2,  1)
end
local  MstId  =  LuaFnCreateMonster(sceneId,  createinfanmodelid,  PlayerX,PlayerZ,32,-1,890547)
local  myname  =  GetName(sceneId,selfId)
local  myname2  =  "Hoàng tØ "
if  createinfanmodelid  >=  64500  then
myname2  =  "Công chúa "
end
SetCharacterName(sceneId,  MstId,  "#ccc33cc"..myname2.."cüa "..myname)
LuaFnSetNpcIntParameter(  sceneId,MstId,0,selfId)
LuaFnSetNpcIntParameter(  sceneId,MstId,1,0)
SetCharacterTimer(  sceneId,  MstId,  1000)
SetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene,MstId*1000+sceneId+1)
end
function  x890547_CreateIanplayerDie(  sceneId,  selfId)
local  myIance  =  GetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene)
if  myIance  ~=  0  then
SetMissionData(sceneId,  selfId,x890547_g_missmosterobjandscene,0)
end
end

function  x890547_OnEventRequest(  sceneId,  selfId,  targetId,  eventId)
end
function  x890547_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end