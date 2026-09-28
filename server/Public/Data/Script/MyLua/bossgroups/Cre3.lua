-- Code by Sun0411
--**********************************
x100119_g_scriptId  =  100119

x100119_g_AllBoss  =  {420} -- ID map


x100119_g_BossSysMsgByGroupID={}
x100119_g_BossSysMsgByGroupID[1]={Msg="#cFF0000 Thúc Hà C± Tr¤n Test 2",isSended=0}
x100119_g_AllBoss[420]=
{	 
	 {  ID=44000,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=34,    PosY=37,   BaseAI=21,  ExtAIScript=202,  ScriptID=100119  },
	 {  ID=44000,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=29,    PosY=147,  BaseAI=21,  ExtAIScript=202,  ScriptID=100119  },
	 {  ID=44000,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=33,    PosY=257,  BaseAI=21,  ExtAIScript=202,  ScriptID=100119  },
	 {  ID=44000,  GroupId=1,  Title="Thúc Hà C± Tr¤n",  PosX=282,   PosY=120,  BaseAI=21,  ExtAIScript=202,  ScriptID=100119  },
}

function  x100119_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- Gi¶
	 local  nMinute  =  GetMinute()-- Phút 
	 
	 if  sceneId==420  then	 --01:20  04:20  07:20  10:20  13:20  16:20  19:20  22:20  
	 	 if  (nHour==00  and  nMinute==00)  or  (nHour==04  and  nMinute==00)  or  (nHour==08  and  nMinute==00)  or  (nHour==12  and  nMinute==00)  or  (nHour==16  and  nMinute==00)  or  (nHour==00  and  nMinute==23)  then
	 	 	 x100119_CreateMonster(  sceneId  )	
	 	 end
	 end
end

--**********************************
function  x100119_CreateMonster(  sceneId  )
	 for  i,data  in  x100119_g_AllBoss[sceneId]  do
	 	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 	 for  i=0,  nMonsterNum-1  do
	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 	 if  MosDataID  ==  data.ID  then
	 	 	 	 LuaFnDeleteMonster(sceneId,  MonsterId)
	 	 	 end	 	 
	 	 end
	 end

	 for  i,data  in  x100119_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100119_SysMsg(  sceneId,  data.GroupId  )
	 	 
	 	 
	 	 
	 end
	 
	 AddGlobalCountNews(  sceneId,  x100119_g_BossSysMsgByGroupID[1].Msg  )

end

--**********************************
function  x100119_SysMsg(  sceneId,  groupId  )
	 if  x100119_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100119_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100119_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100119_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end

--**********************************
function  x100119_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end

--**********************************
function  x100119_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
function  x100119_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end