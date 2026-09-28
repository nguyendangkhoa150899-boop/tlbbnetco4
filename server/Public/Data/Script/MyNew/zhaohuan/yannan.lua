-- chân v¯n s¯ 
x100121_g_scriptId  =  100121

x100121_g_AllBoss  =  {18}
--##18 là cänh tßþng ID , tham khäo SceneInfo.ini

--## n½i này là h® th¯ng thông báo , cån cÑ phân t± ID ban b¯ thông báo , cùng t± BOSS chï ban b¯ mµt l¥n 
x100121_g_BossSysMsgByGroupID={}
x100121_g_BossSysMsgByGroupID[1]={Msg="#cFF0000 NhÕn Nam loan tin: #W T× ðâu #cff99ff xu¤t hi®n ba con ác thú Cu°ng BÕo Long gây hÕi bá tánh, xin chß v¸ anh hùng trong thiên hÕ ði tr× hÕi!#r#Y t÷a ðµ ác thø xu¤t hiên [155,159][127,198][227,161]",isSended=0}
x100121_g_AllBoss[18]=
{	 
	 {  ID=3829,  GroupId=1,  Title="BOSS",  PosX=155,    PosY=159,  BaseAI=21,  ExtAIScript=209,  ScriptID=100121  },
	 {  ID=3829,  GroupId=1,  Title="BOSS",  PosX=127,    PosY=198,  BaseAI=21,  ExtAIScript=209,  ScriptID=100121  },
	 {  ID=3829,  GroupId=1,  Title="BOSS",  PosX=227,    PosY=161,  BaseAI=21,  ExtAIScript=209,  ScriptID=100121  },

}

--## cänh tßþng bän ð° mu¯n thêm mµt NPC , t¾i xúc phát chân v¯n , nhß yannan_monster.ini , scripttimer là chân v¯n tr· v« ði«u th¶i gian , 60000 vì 60 giây ði«u døng mµt l¥n chân v¯n 
--  [monster142]
--  guid=9913082
--  type=0
--  pos_x=0
--  pos_z=0
--  dir=27
--  script_id=100121
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
function  x100121_OnCharacterTimer(  sceneId,  objId,  dataId,  uTime  )
	 local  nHour	   =  GetHour()-- gi¶ 
	 local  nMinute  =  GetMinute()-- phút 
	 
	 if  sceneId==18  then	 --## huy«n häi 01:20  04:20  07:20  10:20  13:20  16:20  19:20  22:20  
	 	 if  (nHour==02  and  nMinute==00)  or  (nHour==06  and  nMinute==00)  or  (nHour==10  and  nMinute==00)  or  (nHour==14  and  nMinute==00)  or  (nHour==18  and  nMinute==00)  or  (nHour==22  and  nMinute==00)    then  --##21 gi¶ rßÞi cùng 12 gi¶ rßÞi cà nhÕn nam ðích trách 
	 	 	 x100121_CreateMonster(  sceneId  )	 -- cà trách 
	 	 end
	 end
	 --AddGlobalCountNews(  sceneId,  nMinute  )
	 -- hüy bö lúc chuông / ð°ng h° 
	 --SetCharacterTimer(  sceneId,  objId,  0  )

                if  nHour==19  and  nMinute==55  then
                      local  strText  =  format("@*;SrvMsg;SCA:Thông thiên tháp ðích ðÕi môn sau 5 phút m· ra , xin m÷i ngß¶i chu¦n b¸ sÇn sàng ! ",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end

                if  nHour==20  and  nMinute==01  then
                      local  strText  =  format("@*;SrvMsg;SCA:Thông thiên tháp ðích ðÕi môn ðã ch§m rãi m· ra , các t¥ng Boss nghiêm tr§n mà ðþi , giang h° nghîa sî xin mau s¾m ði trß¾c ðem tiêu di®t ! ",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end

                if  nHour==21  and  nMinute==59  then
                      local  strText  =  format("@*;SrvMsg;SCA: thông thiên tháp ðích ðÕi môn ðem · 1 phút sau t¡t , nhæng anh hùng s¾m làm chu¦n b¸ , chúng ta ngày mai tiªp tøc cà tháp ! ",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end

                if  nMinute==15  then
                      local  strText  =  format("@*;SrvMsg;SCA: Chào m×ng các bÕn ðªn v¾i NetCo4! phiên bän hi®n ðang chÕy trên n«n ð° h÷a 3D song hành cùng bän 2D truy«n th¯ng. Server là n½i quy tø nhi«u tính nång ðµc ðáo, m¾i lÕ cùng ð° h÷a ð©p m¡t. Chúc các bÕn có nhæng phút giây vui vë cùng server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end
                if  nMinute==19  then
                      local  strText  =  format("@*;SrvMsg;SCA: Server hi®n ðang khuyªn mãi nÕp thë Zing 50% và khuyªn mãi chuy¬n khoän lên ðªn 100% giá tr¸, ði¬m Khuyªn Mãi nÕp thë ðßþc tích lûy dùng ð¬ ð±i quà trong server thay cho l¶i cäm tÕ cüa Admin gØi ðªn các bÕn ðã üng hµ server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end	 
                if  nMinute==25  then
                      local  strText  =  format("@*;SrvMsg;SCA: Chào m×ng các bÕn ðªn v¾i H°i ºc Thiên Long! phiên bän hi®n ðang chÕy trên n«n ð° h÷a 3D song hành cùng bän 2D truy«n th¯ng. Server là n½i quy tø nhi«u tính nång ðµc ðáo, m¾i lÕ cùng ð° h÷a ð©p m¡t. Chúc các bÕn có nhæng phút giây vui vë cùng server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end
                if  nMinute==29  then
                      local  strText  =  format("@*;SrvMsg;SCA: Server hi®n ðang khuyªn mãi nÕp thë Zing 50% và khuyªn mãi chuy¬n khoän lên ðªn 100% giá tr¸, ði¬m Khuyªn Mãi nÕp thë ðßþc tích lûy dùng ð¬ ð±i quà trong server thay cho l¶i cäm tÕ cüa Admin gØi ðªn các bÕn ðã üng hµ server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end	 
                if  nMinute==35  then
                      local  strText  =  format("@*;SrvMsg;SCA: Chào m×ng các bÕn ðªn v¾i NetCo4! phiên bän hi®n ðang chÕy trên n«n ð° h÷a 3D song hành cùng bän 2D truy«n th¯ng. Server là n½i quy tø nhi«u tính nång ðµc ðáo, m¾i lÕ cùng ð° h÷a ð©p m¡t. Chúc các bÕn có nhæng phút giây vui vë cùng server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end
                if  nMinute==39  then
                      local  strText  =  format("@*;SrvMsg;SCA: Server hi®n ðang khuyªn mãi nÕp thë Zing 50% và khuyªn mãi chuy¬n khoän lên ðªn 100% giá tr¸, ði¬m Khuyªn Mãi nÕp thë ðßþc tích lûy dùng ð¬ ð±i quà trong server thay cho l¶i cäm tÕ cüa Admin gØi ðªn các bÕn ðã üng hµ server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end	 
                if  nMinute==45  then
                      local  strText  =  format("@*;SrvMsg;SCA: Chào m×ng các bÕn ðªn v¾i H°i ºc Thiên Long! phiên bän hi®n ðang chÕy trên n«n ð° h÷a 3D song hành cùng bän 2D truy«n th¯ng. Server là n½i quy tø nhi«u tính nång ðµc ðáo, m¾i lÕ cùng ð° h÷a ð©p m¡t. Chúc các bÕn có nhæng phút giây vui vë cùng server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end
                if  nMinute==49  then
                      local  strText  =  format("@*;SrvMsg;SCA: Server hi®n ðang khuyªn mãi nÕp thë Zing 50% và khuyªn mãi chuy¬n khoän lên ðªn 100% giá tr¸, ði¬m Khuyªn Mãi nÕp thë ðßþc tích lûy dùng ð¬ ð±i quà trong server thay cho l¶i cäm tÕ cüa Admin gØi ðªn các bÕn ðã üng hµ server!",  " thông báo ")
                      BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 end	 
	            --if  nMinute==46  then
                      --local  strText  =  format("@*;SrvMsg;SCA: Chào m×ng các bÕn ðªn v¾i NetCo4! phiên bän hi®n tÕi s¨ ðßþc c§p nh§t, sØa l²i và nâng c¤p trong th¶i gian t¾i, hi®n ðang ra m¡t Vòng Quay May M¡n, tñ theo ðµi và các chÑc nång m¾i khác. Chúc các bÕn hæu ch½i game vui vë!",  " thông báo ")
                      --BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 --end
                --if  nMinute==15  then
                      --local  strText  =  format("@*;SrvMsg;SCA:  Vào lúc 20h t¾i 21h ðêm nay( tÑc M°ng 1 Tªt) s¨ t± chÑc Sñ Ki®n Thä Pet tÕi DÕ Tây H°(205,157) và Ðánh Boss có c½ hµi nh§n Phiªu Lì Xì KNB, ng÷c th¬ lñc 6 cùng YQ45 Thanh Tâm Ph± Thi®n Chú, các b¢ng hæu nh¾ tham gia sñ ki®n!",  " thông báo ")
                     -- BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 --end 
                --if  nMinute==31  then
                      --local  strText  =  format("@*;SrvMsg;SCA:  Vào lúc 20h t¾i 21h ðêm nay( tÑc M°ng 1 Tªt) s¨ t± chÑc Sñ Ki®n Thä Pet tÕi DÕ Tây H°(205,157) và Ðánh Boss có c½ hµi nh§n Phiªu Lì Xì KNB, ng÷c th¬ lñc 6 cùng YQ45 Thanh Tâm Ph± Thi®n Chú, các b¢ng hæu nh¾ tham gia sñ ki®n!",  " thông báo ")
                      --BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 --end 
                --if  nMinute==47  then
                      --local  strText  =  format("@*;SrvMsg;SCA:  Vào lúc 20h t¾i 21h ðêm nay( tÑc M°ng 1 Tªt) s¨ t± chÑc Sñ Ki®n Thä Pet tÕi DÕ Tây H°(205,157) và Ðánh Boss có c½ hµi nh§n Phiªu Lì Xì KNB, ng÷c th¬ lñc 6 cùng YQ45 Thanh Tâm Ph± Thi®n Chú, các b¢ng hæu nh¾ tham gia sñ ki®n!",  " thông báo ")
                      --BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 --end
                --if  nMinute==54  then
                      --local  strText  =  format("@*;SrvMsg;SCA:  Vào lúc 20h t¾i 21h ðêm nay( tÑc M°ng 1 Tªt) s¨ t± chÑc Sñ Ki®n Thä Pet tÕi DÕ Tây H°(205,157) và Ðánh Boss có c½ hµi nh§n Phiªu Lì Xì KNB, ng÷c th¬ lñc 6 cùng YQ45 Thanh Tâm Ph± Thi®n Chú, các b¢ng hæu nh¾ tham gia sñ ki®n!",  " thông báo ")
                      --BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 --end  	 
                x100121_XieziTip(sceneId,  selfId)
end

--**********************************
-- cà BOSS
--**********************************
function  x100121_CreateMonster(  sceneId  )
	 --## n£ng ðßa thông báo tiêu chí 
	 --for  j,msgData  in  x100121_g_BossSysMsgByGroupID  do  
	 --	 msgData.isSended=0
	 --end
	 -- cà trách trß¾c nªu nhß trách t°n tÕi thoÕi toàn bµ thanh không , næa cà 
	 for  i,data  in  x100121_g_AllBoss[sceneId]  do
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
	 for  i,data  in  x100121_g_AllBoss[sceneId]  do
	 	 local  MstId  =  LuaFnCreateMonster(sceneId,  data.ID,  data.PosX,  data.PosY,  data.BaseAI,  data.ExtAIScript,  data.ScriptID  )
	 	 SetCharacterTitle(sceneId,  MstId,  data.Title)
	 	 --x100121_SysMsg(  sceneId,  data.GroupId  )
	 	 
	 	 
	 	 
	 end
	 
	 AddGlobalCountNews(  sceneId,  x100121_g_BossSysMsgByGroupID[1].Msg  )

end

--**********************************
-- h® th¯ng thông báo 
--**********************************
function  x100121_SysMsg(  sceneId,  groupId  )
	 if  x100121_g_BossSysMsgByGroupID[groupId].isSended==0  then
	 	 --BroadMsgByChatPipe(  sceneId,  0,  x100121_g_BossSysMsgByGroupID[groupId].Msg,  4  )
	 	 AddGlobalCountNews(  sceneId,  x100121_g_BossSysMsgByGroupID[groupId].Msg  )
	 	 x100121_g_BossSysMsgByGroupID[groupId].isSended=1
	 end
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x100121_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end


--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x100121_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- t¡t ð¯i thoÕi khuông 
--**********************************
function  x100121_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end

--**********************************
--NetCo4
--**********************************
function  x100121_XieziTip(sceneId,  selfId)
	 local  nHour  =  GetHour()-- gi¶ 
	 local  nMinute  =  GetMinute()-- phút 

                if  mod(nHour,3)  ==  0  and  GetMinute()  ==  17  then
	 	 local  strText  =  format("#cFF0000NetCo4: #H ðÕt t¾i 30 c¤p tr· lên ngß¶i ch½i , m²i ngày có th¬ · #G ÐÕi Lý #H loÕi hoa ðÕi sß #G a trong #{_INFOAIM185,65,2, a trong }#H ch² nh§n l¤y hoa loÕi , tr°ng tr÷t ra hoa tß½i xinh ð©p , t§p t« s¯ lßþng nh¤t ð¸nh ðích #G Ba Tß hoa h°ng #H , còn có th¬ ð±i phong phú tß·ng thß·ng nga ~")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  1  and  GetMinute()  ==  17  then
	 	 local  strText  =  format("#cFF0000NetCo4: #H ðÕt t¾i 40 c¤p tr· lên ngß¶i ch½i , m²i ngày có th¬ · #B Tô Châu #G lß½ng ðÕo sî #{_INFOAIM281,276,1, lß½ng ðÕo sî }#H ch² nh§n l¤y #G“Nhi®m vø ¿¾c nguy®n”#HðÕo cø nhi®m vø , thông qua ðánh chªt phó bän BOSS thu t§p #G nguy®n linh tuy«n #H ði trß¾c thái h° hÑa nguy®n , nhßng ðÕt ðßþc phong phú tß·ng thß·ng nga ~")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  2  and  GetMinute()  ==  17  then
	 	 local  strText  =  format("#cFF0000NetCo4: #H ðÕt t¾i 35 c¤p tr· lên ngß¶i ch½i , có th¬ · #B ÐÕi Lý #G chúc giàu sang #{_INFOAIM149,121,2, chúc giàu sang }#H ch² nh§n l¤y #G ti«n lß½ng nhi®m vø #H , m²i tu¥n hoàn thành ti«n lß½ng nhi®m vø , nhßng ðÕt ðßþc phong phú tß·ng thß·ng nga , còn có c½ hµi ðÕt ðßþc thành ph¦m tr÷ng lâu , m²i tu¥n chï có th¬ làm mµt l¥n , tay s¡p có , tay ch§m vô ~")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  0  and  GetMinute()  ==  37  then
	 	 local  strText  =  format("#cFF0000NetCo4: #H giang h° hi¬m ác , ra cØa dña vào b¢ng hæu , nªu nhß ngß½i · ðây trong trò ch½i có chí ð°ng ðÕo hþp ðích b¢ng hæu , có th¬ dçn h¡n ði #B LÕc Dß½ng #G tr¥n phu chi #{_INFOAIM240,203,0, chúc giàu sang }#H ch² kªt nghîa kim lan a , kªt bái sau có th¬ kích hoÕt #G kim lan tr§n pháp #H kÛ nång , m²i ngày còn có th¬ mi­n phí nh§n l¤y tình nghîa tr¸ giá , dùng ð¬ thång c¤p tr§n pháp ~")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  1  and  GetMinute()  ==  37  then
	 	 local  strText  =  format("#cFF0000NetCo4: #H ðÕt t¾i 45 c¤p tr· lên ngß¶i ch½i , có th¬ m· ra #B nguyên bäo th¸ trß¶ng giao d¸ch #H , ðang · hình cái ð¥u ¤n nút phía dß¾i . thß¶ng xuyên chú ý giao d¸ch thß¶ng xuyên , nói không ch×ng có th¬ giây ðªn häo hóa nga . khác v¯n dùng/u¯ng ðã m· thông nguyên bäo kim t® lçn nhau ð±i chÑc nång , ðang · ð±i nguyên bäo ðích UI gi¾i m£t nga ~")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

  	 elseif  mod(nHour,3)  ==  2  and  GetMinute()  ==  37  then
	 	 local  strText  =  format("#cFF0000NetCo4: #HÐ¬ nâng c¤p tâm pháp vui lòng v« NPC các môn phái, ð¬ tu luy®n Vû Ý vui lòng ðên Vân Phù ho£c Mai Nha Ðäo")
                                BroadMsgByChatPipe(sceneId,  selfId,  strText,  4);

                end
end
