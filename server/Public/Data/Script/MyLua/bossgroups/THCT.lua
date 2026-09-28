-- Code by Sun0411
--**********************************
x100115_g_scriptId  =  100115

x100115_g_AllBoss  =  {420} -- ID map


x100115_g_BossSysMsgByGroupID={}
x100115_g_BossSysMsgByGroupID[1]={Msg="#GThúc Hà C± Tr¤n #Wb²ng dßng xu¤t hi®n 1 ðám #YThäo kh¤u #Wm÷i ngß¶i mau chóng tiêu di®t chúng",isSended=0}
x100115_g_AllBoss[420]=
{	 
	 {  ID=15442,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=168,    PosY=215,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15439,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=168,    PosY=195,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15436,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=168,    PosY=175,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15442,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=144,    PosY=137,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15439,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=144,    PosY=152,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15436,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=144,    PosY=125,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15439,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=188,    PosY=137,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },
	 {  ID=15442,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=188,    PosY=152,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },	 
	 {  ID=15442,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=188,    PosY=125,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },		 
	 {  ID=15439,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=168,    PosY=119,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },		
	 {  ID=15436,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=188,    PosY=155,   BaseAI=21,  ExtAIScript=255,  ScriptID=100115  },			 
}

function  x100115_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- Gi¶
	 local  nMinute  =  GetMinute()-- Phút 
	 
	 if  sceneId==420  then	 --
	 	 if  (nHour==10 and nMinute==30) or (nHour==12 and nMinute==30) or (nHour==14 and nMinute==30) or (nHour==16 and nMinute==30) or (nHour==18 and nMinute==30) or (nHour==20 and nMinute==30) or (nHour==22 and nMinute==30) then
	 	 	 x100115_CreateMonster(  sceneId  )	
	 	 end
	 end
end

--**********************************
function  x100115_CreateMonster(  sceneId  )
	 for  i,data  in  x100115_g_AllBoss[sceneId]  do
	 	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 	 for  i=0,  nMonsterNum-1  do
	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 	 if  MosDataID  ==  data.ID  then
	 	 	 	 LuaFnDeleteMonster(sceneId,  MonsterId)
	 	 	 end	 	 
	 	 end
	 end

	 for  i,data  in  x100115_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100115_SysMsg(  sceneId,  data.GroupId  )
	 	 
	 	 
	 	 
	 end
	 
	 AddGlobalCountNews(  sceneId,  x100115_g_BossSysMsgByGroupID[1].Msg  )

end

--**********************************
function  x100115_SysMsg(  sceneId,  groupId  )
	 if  x100115_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100115_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100115_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100115_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end

--**********************************
function  x100115_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end

--**********************************
function  x100115_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
function  x100115_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end