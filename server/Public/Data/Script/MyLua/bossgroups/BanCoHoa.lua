-- Code by Sun0411
--**********************************
x100119_g_scriptId  =  100119

x100119_g_AllBoss  =  {5} -- ID map


x100119_g_BossSysMsgByGroupID={}
x100119_g_BossSysMsgByGroupID[1]={Msg="#GBOSS Bàn C± #Wxinh xinh ðáng yêu tÕi #GKính H° #Wt× #Y20:00 #Wðªn #Y21:30 #Whàng ngày #1#r#GBOSS Bàn C± Höa #Wxu¤t hi®n tÕi #Y[203.257]",isSended=0}
x100119_g_AllBoss[5]=
{	 
	 {  ID=48153,  GroupId=1,  Title="Bàn C± Höa",  PosX=203,    PosY=257,   BaseAI=21,  ExtAIScript=259,  ScriptID=100119  },
}

function  x100119_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- Gi¶
	 local  nMinute  =  GetMinute()-- Phút 
	 
	 if  sceneId==5  then	 --08:20  08:20  08:40  09:00
	 	 if  (nHour==20 and nMinute==15) or (nHour==20 and nMinute==40) or (nHour==21 and nMinute==05) or (nHour==21 and nMinute==29) then 
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