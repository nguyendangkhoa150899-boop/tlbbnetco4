-- chân v¯n s¯ 
x100114_g_scriptId  =  100114

x100114_g_AllBoss  =  {2}

x100114_g_BossSysMsgByGroupID={}
x100114_g_BossSysMsgByGroupID[1]={Msg="#WXin thông báo : Bây gi¶ là #G12:00 #Wgi¶",isSended=0}
x100114_g_AllBoss[2]=
{	 
	 {  ID=0,  GroupId=1,  Title="BOSS",  PosX=0,    PosY=0,  BaseAI=21,  ExtAIScript=209,  ScriptID=100114  },

}

function  x100114_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- gi¶ 
	 local  nMinute  =  GetMinute()-- phút 
	 
	 if  sceneId==2  then	 --Time 
	 	 if  (nHour==00  and  nMinute==00) then 
	 	 	 x100114_CreateMonster(  sceneId  )
	 	 end
	 end


                if  nHour==12  and  nMinute==00  then
                      --local  strText  =  format("@*;SrvMsg;SCA: Nªu trong quá trình ch½i game d¸ch map LAG - các bÕn có th¬ tiªn hành vào møc [ H® th¯ng ] => [ Cài ð£t trò ch½i ] => [ Tích vào ô Ð±i cänh nhanh ] ho£c [ Thoát Gane Vào LÕi ]",  " Thiên Kiªm ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end

                if  nHour==14  and  nMinute==00  then
                      --local  strText  =  format("@*;SrvMsg;SCA: Nªu trong quá trình ch½i game d¸ch map LAG - các bÕn có th¬ tiªn hành vào møc [ H® th¯ng ] => [ Cài ð£t trò ch½i ] => [ Tích vào ô Ð±i cänh nhanh ] ho£c [ Thoát Gane Vào LÕi ]",  " Thiên Kiªm ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end

                if  nHour==16  and  nMinute==00  then
                      --local  strText  =  format("@*;SrvMsg;SCA: Nªu trong quá trình ch½i game d¸ch map LAG - các bÕn có th¬ tiªn hành vào møc [ H® th¯ng ] => [ Cài ð£t trò ch½i ] => [ Tích vào ô Ð±i cänh nhanh ] ho£c [ Thoát Gane Vào LÕi ]",  " Thiên Kiªm ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end

                if  nMinute==10  then
                      local  strText  =  format("@*;SrvMsg;SCA: Nªu trong quá trình ch½i game d¸ch map LAG - các bÕn có th¬ tiªn hành vào møc [ H® th¯ng - Cài ð£t trò ch½i - Tích vào ô Ð±i cänh nhanh ] ho£c [ Thoát Gane Vào LÕi ]",  " Thiên Kiªm  ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end
                if  nMinute==40  then
                      local  strText  =  format("@*;SrvMsg;SCA: Nªu trong game các hÕ g£p phäi BUG ho£c L²i vui lòng báo v« FANPAGE ð¬ k¸p th¶i sØ lí",  " Thiên Kiªm ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end  	 
                x100114_XieziTip(sceneId,  selfId)
end

--**********************************
-- cà BOSS
--**********************************
function  x100114_CreateMonster(  sceneId  )
	 for  i,data  in  x100114_g_AllBoss[sceneId]  do
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
	 for  i,data  in  x100114_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100114_SysMsg(  sceneId,  data.GroupId  ) 	 
	 end	 
	 AddGlobalCountNews(  sceneId,  x100114_g_BossSysMsgByGroupID[1].Msg  )
end
--**********************************
function  x100114_SysMsg(  sceneId,  groupId  )
	 if  x100114_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100114_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100114_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100114_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end
--**********************************
function  x100114_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end
--**********************************
function  x100114_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--**********************************
function  x100114_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end
--**********************************
function  x100114_XieziTip(sceneId,  selfId)
	 local  nHour  =  GetHour()-- gi¶ 
	 local  nMinute  =  GetMinute()-- phút 

                if  mod(nHour,22)  ==  1  and  GetMinute()  ==  16  then
	 	 --local  strText  =  format("#GBOSS Bàn C± #Wchu¦n b¸ xu¤t hi®n #r#GBOSS Bàn C± #Wxinh xinh ðáng yêu tÕi #GKính H° #Wt× #Y20:00 #Wðªn #Y21:00 #Whàng ngày #1")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  1  and  GetMinute()  ==  26  then
	 	 --local  strText  =  format("#cFF0000Thiên Long Thiên Kiªm: #H Testlua Thông báo 2")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  2  and  GetMinute()  ==  26  then
	 	 --local  strText  =  format("#cFF0000Thiên Long Thiên Kiªm: #H Testlua Thông báo 3")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  0  and  GetMinute()  ==  26  then
	 	 --local  strText  =  format("#cFF0000Thiên Long Thiên Kiªm: #H Testlua Thông báo 4")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  1  and  GetMinute()  ==  26  then
	 	 --local  strText  =  format("#cFF0000Thiên Long Thiên Kiªm: #H Testlua Thông báo 5")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  2  and  GetMinute()  ==  26  then
	 	 --local  strText  =  format("#cFF0000Thiên Long Thiên Kiªm: #H Testlua Thông báo 6")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

                 end
end
