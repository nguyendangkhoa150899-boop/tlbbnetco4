-- chân v¯n s¯ 
x100124_g_scriptId  =  100124

x100124_g_AllBoss  =  {508}
--##18 là cänh tßþng ID , tham khäo SceneInfo.ini

--## n½i này là h® th¯ng thông báo , cån cÑ phân t± ID ban b¯ thông báo , cùng t± BOSS chï ban b¯ mµt l¥n 
x100124_g_BossSysMsgByGroupID={}
x100124_g_BossSysMsgByGroupID[1]={Msg="#cFF0000T¥n Hoàng Th¥n Vñc:#cff99ffLøc hþp ð°ng tØ phøng m®nh hÕ phàm ðào ðßþc løc hþp lñc ! ðÕi tôm s¶/ch¾ ði !#r#Y t÷a ðµ [100,74][250,164][216,246][135,268][68,154][180,46]",isSended=0}
x100124_g_AllBoss[508]=
{	 
	 {  ID=42100,  GroupId=1,  Title="Løc hþp ð°ng tØ ",  PosX=100,    PosY=74,  BaseAI=21,  ExtAIScript=255,  ScriptID=100124  },
	 {  ID=42101,  GroupId=1,  Title="Løc hþp ð°ng tØ ",  PosX=250,    PosY=164,  BaseAI=21,  ExtAIScript=255,  ScriptID=100124  },
	 {  ID=42102,  GroupId=1,  Title="Løc hþp ð°ng tØ ",  PosX=216,    PosY=246,  BaseAI=21,  ExtAIScript=255,  ScriptID=100124  },
	 {  ID=42103,  GroupId=1,  Title="Løc hþp ð°ng tØ ",  PosX=135,    PosY=268,  BaseAI=21,  ExtAIScript=255,  ScriptID=100124  },
	 {  ID=42104,  GroupId=1,  Title="Løc hþp ð°ng tØ ",  PosX=68,    PosY=154,  BaseAI=21,  ExtAIScript=255,  ScriptID=100124  },
	 {  ID=42105,  GroupId=1,  Title="Løc hþp ð°ng tØ ",  PosX=180,    PosY=46,  BaseAI=21,  ExtAIScript=255,  ScriptID=100124  },
}

--## cänh tßþng bän ð° mu¯n thêm mµt NPC , t¾i xúc phát chân v¯n , nhß yannan_monster.ini , scripttimer là chân v¯n tr· v« ði«u th¶i gian , 60000 vì 60 giây ði«u døng mµt l¥n chân v¯n 
--  [monster142]
--  guid=9913082
--  type=0
--  pos_x=0
--  pos_z=0
--  dir=27
--  script_id=100124
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
function  x100124_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- gi¶ 
	 local  nMinute  =  GetMinute()-- phút 
	 
	 if  sceneId==508  then	 --## huy«n häi 01:20  04:20  07:20  10:20  13:20  16:20  19:20  22:20  
	 	 if  (nHour==02  and  nMinute==45)  or  (nHour==06  and  nMinute==45)  or  (nHour==10  and  nMinute==45)  or  (nHour==14  and  nMinute==45)  or  (nHour==18  and  nMinute==45)  or  (nHour==22  and  nMinute==45)    then  --##21 gi¶ rßÞi cùng 12 gi¶ rßÞi cà nhÕn nam ðích trách 
	 	 	 x100124_CreateMonster(  sceneId  )	 -- cà trách 
	 	 end
	 end
	 --AddGlobalCountNews(  sceneId,  nMinute  )
	 -- hüy bö lúc chuông / ð°ng h° 
	 --SetCharacterTimer(  sceneId,  objId,  0  )
end

--**********************************
-- cà BOSS
--**********************************
function  x100124_CreateMonster(  sceneId  )
	 --## n£ng ðßa thông báo tiêu chí 
	 --for  j,msgData  in  x100124_g_BossSysMsgByGroupID  do  
	 --	 msgData.isSended=0
	 --end
	 -- cà trách trß¾c nªu nhß trách t°n tÕi thoÕi toàn bµ thanh không , næa cà 
	 for  i,data  in  x100124_g_AllBoss[sceneId]  do
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
	 for  i,data  in  x100124_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100124_SysMsg(  sceneId,  data.GroupId  )
	 	 
	 	 
	 	 
	 end
	 
	 AddGlobalCountNews(  sceneId,  x100124_g_BossSysMsgByGroupID[1].Msg  )

end

--**********************************
-- h® th¯ng thông báo 
--**********************************
function  x100124_SysMsg(  sceneId,  groupId  )
	 if  x100124_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100124_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100124_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100124_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x100124_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end


--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x100124_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- t¡t ð¯i thoÕi khuông 
--**********************************
function  x100124_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end
