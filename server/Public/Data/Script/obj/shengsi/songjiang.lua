--  dçn tß·ng NPC

x892016_g_scriptId  =  892016

x892016_g_MonsterId  =  13550        ---npc quái v§t ID
x892016_g_CreateId  =  13456          ---- khai sáng quái v§t ID
x892016_g_posX  =  41                        ---- khai sáng quái v§t t÷a ðµ x
x892016_g_posY  =  42                        ---- khai sáng quái v§t t÷a ðµ y
x892016_g_AIScript  =  256              ---- khai sáng quái v§t kÛ nång ð¯i Ñng vån ki®n ID
x892016_g_Title  =  " thiên khôi tinh "              ---- khai sáng quái v§t danh hi®u 


--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x892016_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(sceneId)
	 	 AddText(  sceneId,  " sinh tØ lôi ðài không phäi là t¯t nhß v§y xông ðích , m²i chiªn th¡ng phó bän bên trong m²i mµt BOSS , cûng có th¬ ðÕt ðßþc cao c¤p th¥n bí v§t ph¦m , phäi chú ý nguy hi¬m nga !"  )
	 	 AddNumText(  sceneId,  x892016_g_scriptId,  "#c00ff00 quyªt chiªn   t¯ng khß½ng ? ",  6,  200)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x892016_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 if  GetNumText()  ==  210  then
	 	 BeginEvent(  sceneId  )
      	 	 local  n  =  GetMonsterCount(sceneId)
	 	 if  n>170  then
      	 	 strText  =  " trß¾c m£t quái v§t s¯ lßþng vì :"..n.." cá , khi trách ít h½n so v¾i 170 cá nhßng tr· lÕi thü ðµng cà m¾i , ! "
    	 	 AddText(  sceneId,  strText  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
      	 	 else  
	 	 BeginEvent(  sceneId  )
	 	 LuaFnCreateMonster(531,  39339,  30,  30,  17,  0,  402030)
                                AddText(  sceneId,  " cà m¾i thành công ! v¯n quan nhà ch½i cùng quái v§t t±ng s¯ lßþng vì :"..n.." cá ! "  )
                      	 AddText(  sceneId,  strText  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 end
    
                elseif  GetNumText()  ==  200  then
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
	 	 if  MosDataID  ==  x892016_g_CreateId  then
                              	                 BeginEvent(  sceneId  )  
	                 	                       AddText(  sceneId,  "#G ngài ðích ðµi ngû ðã b¡t ð¥u chiªn ð¤u , xin không c¥n tái di­n cà trách ! "  )
                            	                       EndEvent(  sceneId  )
                              	                 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 return  
	 	 end
	 end
	 CallScriptFunction(  x892016_g_scriptId,  "TipAllHuman",  sceneId,  " chiªn ð¤u b¡t ð¥u "  )
	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 local  Monsters  =  x892016_g_MonsterId
	 for  i=0,  nMonsterNum-1  do
	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 if  Monsters  ==  GetMonsterDataID(  sceneId,  MonsterId  )  then
	 	 	 --LuaFnDeleteMonster(  sceneId,  MonsterId  )
	 	 	 LuaFnSendSpecificImpactToUnit(sceneId,  MonsterId,  MonsterId,  MonsterId,  152,  0)
	 	 	 SetCharacterDieTime(  sceneId,  MonsterId,  1000  )
	 	 end
	 end

	 local  posX  =  x892016_g_posX
	 local  posY  =  x892016_g_posY
	 local  AIScript  =  x892016_g_AIScript
	 local  Title  =  x892016_g_Title

	 local  MstId  =  LuaFnCreateMonster(sceneId,  x892016_g_CreateId,  posX,  posY,  27,  AIScript,  892009);
	 SetMonsterFightWithNpcFlag(  sceneId,  MstId,  0  )
	 SetUnitReputationID(sceneId,  selfId,  MstId,  29)
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
function  x892016_TipAllHuman(  sceneId,  Str  )

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