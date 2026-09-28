--  dçn tß·ng NPC

x892021_g_scriptId  =  892021

x892021_g_MonsterId  =  13561        ---npc quái v§t ID
x892021_g_CreateId  =  13537          ---- khai sáng quái v§t ID
x892021_g_posX  =  35                        ---- khai sáng quái v§t t÷a ðµ x
x892021_g_posY  =  23                        ---- khai sáng quái v§t t÷a ðµ y
x892021_g_AIScript  =  257              ---- khai sáng quái v§t kÛ nång ð¯i Ñng vån ki®n ID
x892021_g_Title  =  " ngày thß½ng tinh "              ---- khai sáng quái v§t danh hi®u 
x892021_monster_groupId  =  1

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x892021_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  " sinh tØ lôi ðài không phäi là t¯t nhß v§y xông ðích , m²i chiªn th¡ng phó bän bên trong m²i mµt BOSS , cûng có th¬ ðÕt ðßþc cao c¤p th¥n bí v§t ph¦m , phäi chú ý nguy hi¬m nga !"  )
	 	 AddNumText(  sceneId,  x892021_g_scriptId,  "#c00ff00 quyªt chiªn   vû tøng ? ",  6,  200)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x892021_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
    
                if  GetNumText()  ==  200  then
	 -- có phäi hay không ðµi trß·ng ....
	 if  GetTeamLeader(sceneId,selfId)  ~=  selfId  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(  sceneId,  "#{PMF_20080521_07}"  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end
	 local  nCount  =  GetMonsterCount(sceneId)
	 for  i=0,  nCount-1    do
	 	 local  nObjId  =  GetMonsterObjID(sceneId,  i)
	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  nObjId  )
	 	 if  MosDataID  ==  x892021_g_CreateId  then
                              	                 BeginEvent(  sceneId  )  
	                 	                       AddText(  sceneId,  "#G ngài ðích ðµi ngû ðã b¡t ð¥u chiªn ð¤u , xin không c¥n tái di­n cà trách ! "  )
                            	                       EndEvent(  sceneId  )
                              	                 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return  
	 	 end
	 end
	 CallScriptFunction(  x892021_g_scriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 local  Monsters  =  x892021_g_MonsterId
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  Monsters  ==  GetMonsterDataID(  sceneId,  MonsterId  )  then
	 	 	 --LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  MonsterId,  MonsterId,  MonsterId,  152,  0)
	 	 	 SetCharacterDieTime(  sceneId,  MonsterId,  1000  )
	 	 end
	 end

	 local  posX  =  x892021_g_posX
	 local  posY  =  x892021_g_posY
	 local  AIScript  =  x892021_g_AIScript
	 local  Title  =  x892021_g_Title

	 local  MstId  =  LuaFnCreateMonster(sceneId,  x892021_g_CreateId,  posX,  posY,  27,  AIScript,  892009);
	 SetMonsterFightWithNpcFlag(  sceneId,  MstId,  0  )
	 SetUnitReputationID(sceneId,  selfId,  MstId,  29)
	 SetMonsterGroupID(sceneId,  MstId,  x892021_monster_groupId)
	 SetNPCAIType(sceneId,  MstId,  1)
	 if  Title  ~=  ""  then
	 	 SetCharacterTitle(sceneId,  MstId,  Title)
	 end
	 LuaFnSendSpecificImpactToUnit(sceneId,  MstId,  MstId,  MstId,  152,  0)

	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)

	   end
end

--**********************************
-- ð« kÏ t¤t cä phó bän bên trong nhà ch½i ....
--**********************************
function  x892021_TipAllHuman(  sceneId,  Str  )

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