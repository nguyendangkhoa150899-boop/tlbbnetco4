-- Code by Sun0411
--**********************************
x100118_g_scriptId  =  100118

x100118_g_AllBoss  =  {5} -- ID map


x100118_g_BossSysMsgByGroupID={}
x100118_g_BossSysMsgByGroupID[1]={Msg="#GBOSS Bàn C± #Wxinh xinh ðáng yêu tÕi #GKính H° #Wt× #Y20:00 #Wðªn #Y21:30 #Whàng ngày #1#r#GBOSS Bàn C± Thüy #Wxu¤t hi®n tÕi #Y[97.250]",isSended=0}
x100118_g_AllBoss[5]=
{	 
	 {  ID=48152,  GroupId=1,  Title="Bàn C± Thüy",  PosX=97,    PosY=250,   BaseAI=21,  ExtAIScript=259,  ScriptID=100118  },
}

function  x100118_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- Gi¶
	 local  nMinute  =  GetMinute()-- Phút 
	 
	 if  sceneId==5  then	 --08:20  08:20  08:40  09:00
	 	 if  (nHour==20 and nMinute==10) or (nHour==20 and nMinute==35) or (nHour==21 and nMinute==00) or (nHour==21 and nMinute==25) then 
	 	 	 x100118_CreateMonster(  sceneId  )	
	 	 end
	 end
end

--**********************************
function  x100118_CreateMonster(  sceneId  )
	 for  i,data  in  x100118_g_AllBoss[sceneId]  do
	 	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 	 for  i=0,  nMonsterNum-1  do
	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 	 if  MosDataID  ==  data.ID  then
	 	 	 	 LuaFnDeleteMonster(sceneId,  MonsterId)
	 	 	 end	 	 
	 	 end
	 end

	 for  i,data  in  x100118_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100118_SysMsg(  sceneId,  data.GroupId  )
	 	 
	 	 
	 	 
	 end
	 
	 AddGlobalCountNews(  sceneId,  x100118_g_BossSysMsgByGroupID[1].Msg  )

end

--**********************************
function  x100118_SysMsg(  sceneId,  groupId  )
	 if  x100118_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100118_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100118_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100118_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end

--**********************************
function  x100118_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end

--**********************************
function  x100118_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
function  x100118_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end