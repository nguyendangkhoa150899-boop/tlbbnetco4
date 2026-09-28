-- chân v¯n s¯ 
x100130_g_scriptId  =  100130

x100130_g_AllBoss  =  {496}
--##18 là cänh tßþng ID , tham khäo SceneInfo.ini

--## n½i này là h® th¯ng thông báo , cån cÑ phân t± ID ban b¯ thông báo , cùng t± BOSS chï ban b¯ mµt l¥n 
x100130_g_BossSysMsgByGroupID={}
x100130_g_BossSysMsgByGroupID[1]={Msg="#cFF0000Vân diêu thß¾c lînh : #cff99ff tÑ ðÕi th¥n thú phü xu¯ng th¥n vñc , thñc lñc phi phàm ! có ngß¶i có th¬ ði chiêm ngßÞng hay không ?#r#Y t÷a ðµ [91,193][120,218][229,127][206,92]",isSended=0}
x100130_g_AllBoss[508]=
{	 
	 {  ID=14687,  GroupId=1,  Title="",  PosX=91,    PosY=193,  BaseAI=21,  ExtAIScript=255,  ScriptID=100130  },
	 {  ID=14688,  GroupId=1,  Title="",  PosX=120,    PosY=218,  BaseAI=21,  ExtAIScript=255,  ScriptID=100130  },
	 {  ID=14689,  GroupId=1,  Title="",  PosX=229,    PosY=127,  BaseAI=21,  ExtAIScript=255,  ScriptID=100130  },
	 {  ID=14690,  GroupId=1,  Title="",  PosX=206,    PosY=92,  BaseAI=21,  ExtAIScript=255,  ScriptID=100130  },
}

--## cänh tßþng bän ð° mu¯n thêm mµt NPC , t¾i xúc phát chân v¯n , nhß yannan_monster.ini , scripttimer là chân v¯n tr· v« ði«u th¶i gian , 60000 vì 60 giây ði«u døng mµt l¥n chân v¯n 
--  [monster142]
--  guid=9913082
--  type=0
--  pos_x=0
--  pos_z=0
--  dir=27
--  script_id=100130
--  respawn_time=1800000
--  base_ai=3
--  scripttimer=60000	 	 
--  group_id=-1
--  team_id=-1
--  patrol_id=-1
--  shop0=-1
--  shop1=-1
--  shop2=-1
--  shop3=-1
--  ReputationID=-1
--**********************************
-- cà trách suy lu§n 
--**********************************
function  x100130_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- gi¶ 
	 local  nMinute  =  GetMinute()-- phút 
	 
	 if  sceneId==508  then	 --## huy«n häi 01:20  04:20  07:20  10:20  13:20  16:20  19:20  22:20  
	 	 if  (nHour==02  and  nMinute==15)  or  (nHour==05  and  nMinute==15)  or  (nHour==08  and  nMinute==15)  or  (nHour==11  and  nMinute==15)  or  (nHour==14  and  nMinute==15)  or  (nHour==17  and  nMinute==15)  or  (nHour==20  and  nMinute==15)or  (nHour==23  and  nMinute==15)  then  --##21 gi¶ rßÞi cùng 12 gi¶ rßÞi cà nhÕn nam ðích trách 
	 	 	 x100130_CreateMonster(  sceneId  )	 -- cà trách 
	 	 end
	 end
	 --AddGlobalCountNews(  sceneId,  nMinute  )
	 -- hüy bö lúc chuông / ð°ng h° 
	 --SetCharacterTimer(  sceneId,  objId,  0  )
end

--**********************************
-- cà BOSS
--**********************************
function  x100130_CreateMonster(  sceneId  )
	 --## n£ng ðßa thông báo tiêu chí 
	 --for  j,msgData  in  x100130_g_BossSysMsgByGroupID  do  
	 --	 msgData.isSended=0
	 --end
	 -- cà trách trß¾c nªu nhß trách t°n tÕi thoÕi toàn bµ thanh không , næa cà 
	 for  i,data  in  x100130_g_AllBoss[sceneId]  do
	 	 local  nMonsterNum  =  GetMonsterCount(sceneId)
	 	 for  i=0,  nMonsterNum-1  do
	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 local  MosDataID  =  GetMonsterDataID(  sceneId,  MonsterId  )
	 	 	 if  MosDataID  ==  data.ID  then
	 	 	 	 -- thanh quái 
	 	 	 	 LuaFnDeleteMonster(sceneId,  MonsterId)
	 	 	 end	 	 
	 	 end
	 end
	 -- cà trách 
	 for  i,data  in  x100130_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100130_SysMsg(  sceneId,  data.GroupId  )
	 	 
	 	 
	 	 
	 end
	 
	 AddGlobalCountNews(  sceneId,  x100130_g_BossSysMsgByGroupID[1].Msg  )

end

--**********************************
-- h® th¯ng thông báo 
--**********************************
function  x100130_SysMsg(  sceneId,  groupId  )
	 if  x100130_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100130_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100130_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100130_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x100130_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end


--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x100130_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- t¡t ð¯i thoÕi khuông 
--**********************************
function  x100130_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end