--**********************************
-- t¥m xa ði«u døng 
--**********************************
function  x070052_YuanCheng(sceneId,selfId,MyId  )

	 if	 MyId  ==  1	 then
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(  sceneId,1)    -- g¤p ðôi kinh nghi®m có hay không m· ra , 1 khai , 0 quan 
	 	 UICommand_AddInt(  sceneId,20171029)    -- g¤p ðôi kinh nghi®m b¡t ð¥u nåm tháng ngày 
	 	 UICommand_AddInt(  sceneId,20171115)    -- g¤p ðôi kinh nghi®m kªt thúc nåm tháng ngày 
	 	 UICommand_AddInt(  sceneId,1)    -- g¤p ðôi công lñc có hay không m· ra , 1 khai , 0 quan 
	 	 UICommand_AddInt(  sceneId,20171029)    -- g¤p ðôi công lñc b¡t ð¥u nåm tháng ngày 
	 	 UICommand_AddInt(  sceneId,20171122)    -- g¤p ðôi công lñc kªt thúc nåm tháng ngày 
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,201710231  )
	 end

	 if	 MyId  ==  2	 then
	 ---x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau x")   Nap the tich luy
	               local  g_Pointt  =  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)
	                local  g_Pointtb  =  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_YILINGQI)	 
	                 BeginUICommand(  sceneId  )
					UICommand_AddInt(  sceneId,g_Pointt)
					UICommand_AddInt(  sceneId,  g_Pointtb)
	                EndUICommand(  sceneId  )
	                 DispatchUICommand(  sceneId,  selfId,  8909334  )
	 end

	 if	 MyId  ==  3	 then
	 --x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau A")  --- phan thuong tang cap
	                local  UUUU  =  GetMissionData(  sceneId,  selfId,  SHENG_JIJIANGLI)
	               BeginUICommand(  sceneId  )
						UICommand_AddInt(  sceneId,  UUUU)
	                EndUICommand(  sceneId  )
	                 DispatchUICommand(  sceneId,  selfId,  8909333  )
	 end

	 if	 MyId  ==  4  or  MyId  ==  6  then
	 	 x070052_Tips(sceneId,selfId," này hoÕt ðµng chßa m· ra , tçn xin/m¶i mong ðþi ")
	 	 return
	 end


	 if	 MyId  ==  4444  then
	 x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau")
                               BeginUICommand(  sceneId  )
                              local  FanquanCheck  =  GetMissionData(sceneId,selfId,MF_ActiveNewUserCard)
                             local  fanquanNUM  =  floor(GetMissionData(sceneId,selfId,CHONG_ZHI_ZENGD)/400)
                               if  FanquanCheck  <  10^9  then
                                     SetMissionData(sceneId,selfId,MF_ActiveNewUserCard,10^9+fanquanNUM)
                                end
	 	 UICommand_AddInt(  sceneId,1)  -- hoÕt ðµng loÕi hình 1 hào tình l²i lÕc   2 hào tình vÕn trßþng   3 hào tình cái thª   4 t¡t hoÕt ðµng 
	 	 UICommand_AddInt(  sceneId,fanquanNUM)  -- phän khoán tr¸ giá 
	 	 UICommand_AddInt(  sceneId,20)  -- còn th×a lÕi khai tß·ng ngày ðªm 

                                local  allfirstplayer  =  GetPaiming(sceneId,1)
                                for  i  =  1,10  do
                                        if  allfirstplayer[i]  ==  nil  then
                                              allfirstplayer[i]  =  {Guid  =  "",mynowLevel  =  "",mymenpai="",mysex=""}  --tonumber
                                        end	 
	                         UICommand_AddString(  sceneId,  allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel.."0,"..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	                 end
	                 EndUICommand(  sceneId  )
	                 DispatchUICommand(  sceneId,  selfId,201710234  )
                end	 

	 if	 MyId  ==  5  then
	 x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau  ")
	 	-- BeginUICommand(sceneId)
              --                  local  FanquanCheck  =  GetMissionData(sceneId,selfId,MF_ActiveNewUserCard)
              --                 local  fanquanNUM  =  floor(GetMissionData(sceneId,selfId,CHONG_ZHI_ZENGD)/400)
               --                 if  FanquanCheck  <  10^9  then  
               --                       SetMissionData(sceneId,selfId,MF_ActiveNewUserCard,10^9+fanquanNUM)
               --                       FanquanCheck  =  fanquanNUM
                 --               else
                  --                    FanquanCheck  =  mod(FanquanCheck,10^9)
                 --               end
	 	-- UICommand_AddInt(  sceneId,FanquanCheck)
	 	-- EndUICommand(sceneId)
	 	-- DispatchUICommand(sceneId,selfId,  201710235  )
	 end

	 if	 MyId  ==  666666	 then
	 	 BeginUICommand(sceneId)
                                local  allfirstplayer  =  GetPaiming(sceneId,4)
                                if  allfirstplayer[1]  ==  nil  then
                                      allfirstplayer[1]  =  {ID  =  "",Guid  =  "",mynowLevel  =  "",mymenpai="",mysex=""}  --tonumber
                                end	 
                                UICommand_AddString(sceneId,  allfirstplayer[1].ID..","..allfirstplayer[1].Guid..","..allfirstplayer[1].mymenpai..","..allfirstplayer[1].mynowLevel  )
	 	 local  shuzu  =  {}
                                for  i  =  0,12  do
                                        shuzu[i]  =  x070052_TaidouSearch(sceneId,selfId,i)
                                        if  i  ~=  9  then
                                              UICommand_AddString(sceneId,  shuzu[i].Guild..","..shuzu[i].Guildnam..","..shuzu[i].Guildmenpai..","..shuzu[i].Guildlve  )
                                        end
                                end
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  201710236  )  
	 end

	 if	 MyId  ==  7	 then
                                x070052_DaRenCheck(sceneId,selfId)
                                local  daren1  =  mod(GetMissionData(sceneId,selfId,MF_GetNewUserCard2),10)
                                local  daren2  =  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/10),10)
                                local  daren3  =  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/100),10)
                                local  daren4  =  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/1000),10)
                                local  daren5  =  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/10000),10)
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(  sceneId,daren1)
	 	 UICommand_AddInt(  sceneId,daren2)
	 	 UICommand_AddInt(  sceneId,daren3)
	 	 UICommand_AddInt(  sceneId,daren4)
	 	 UICommand_AddInt(  sceneId,daren5)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  201710237)
	 end
end

--**********************************
-- màn änh ð« kÏ 
--**********************************
function  x070052_Tips(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId)
end

--**********************************
-- thái ð¤u ðÑng hàng thÑ 
--**********************************
function  x070052_TaidouSearch(sceneId,selfId,cmp)	 
	 local  savetxt  =  openfile("./Config/MingRenTang/"..cmp..".txt",  "r")	   
	 local  Taidou  =  {}
	 if  savetxt  and  nil  ~=  savetxt  then
	 	 for  i=1,  1    do
	 	 	 local  line1=read(savetxt,  "*l")    --ID
	 	 	 if  line1==nil  then
                                                                line1  =  ""
	 	 	 end
	 	 	 local  line2=read(savetxt,  "*l")    -- tên 
	 	 	 if  line2==nil  then
                                                                line2  =  ""
	 	 	 end
	 	 	 local  line3=read(savetxt,  "*l")    -- môn phái 
	 	 	 if  line3==nil  then
                                                                line3  =  ""
	 	 	 end
	 	 	 local  line4=read(savetxt,  "*l")    -- c¤p b§c 
	 	 	 if  line4==nil  then
                                                                line4  =  ""
	 	 	 end
	 	 	 local  line5=read(savetxt,  "*l")    -- gi¾i tính 
	 	 	 if  line5==nil  then
                                                                line5  =  ""
	 	 	 end
	 	 	 local  line6=read(savetxt,  "*l")    -- bang hµi 
	 	 	 if  line2==nil  then
                                                                line6  =  "  "
	 	 	 end
	 	 	 Taidou  =  {Guild  =  line1,Guildnam  =  line2,Guildmenpai  =  line3,Guildlve  =  line4}  ------- gia nh§p vào ðªm t± lý 
	 	 end
	 	 closefile(savetxt)
	 else
	 	 x070052_Tips(sceneId,selfId," bän vån không t°n tÕi ho£c m· ra th¤t bÕi ")
	 	 return
	 end
	 return  Taidou
end

--**********************************
-- quan h® tr¸ giá ðÕt ngß¶i 
--**********************************
function  x070052_DaRenCheck(sceneId,selfId)
      if  mod(GetMissionData(sceneId,selfId,MF_GetNewUserCard2),10)  <  1  then  --jiehun
            if  LuaFnIsMarried(sceneId,selfId)  >  0  then
                  SetMissionData(sceneId,selfId,MF_GetNewUserCard2,GetMissionData(sceneId,selfId,MF_GetNewUserCard2)+1)
            end
      end

      if  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/10),10)  <  1  then  --jiebai
            if  LuaFnIsSweared(sceneId,selfId)  >  0  then
                  SetMissionData(sceneId,selfId,MF_GetNewUserCard2,GetMissionData(sceneId,selfId,MF_GetNewUserCard2)+10)
            end
      end

      if  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/100),10)  <  1  then  --baishi
            if  LuaFnHaveMaster(sceneId,selfId)  >  0  then
                  SetMissionData(sceneId,selfId,MF_GetNewUserCard2,GetMissionData(sceneId,selfId,MF_GetNewUserCard2)+100)
            end
      end

      if  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/1000),10)  <  1  then  --shoutu
      local  log  =  0  
      for  i=0,  7  do
                      if  LuaFnGetPrenticeGUID(sceneId,selfId,i)  ~=  -1  then
	       log  =  1
                      end
            end
            if  log  >  0  then
                  SetMissionData(sceneId,selfId,MF_GetNewUserCard2,GetMissionData(sceneId,selfId,MF_GetNewUserCard2)+1000)
            end
      end

      if  mod(floor(GetMissionData(sceneId,selfId,MF_GetNewUserCard2)/10000),10)  <  1  then  --rubang
      local  Guildbang  =  LuaFnGetGuildName(sceneId,  selfId)    -- bang phái 
            if  Guildbang  ~=  nil  and  Guildbang  ~=  ""  then  
                  SetMissionData(sceneId,selfId,MF_GetNewUserCard2,GetMissionData(sceneId,selfId,MF_GetNewUserCard2)+10000)
            end
      end
end

--**********************************
-- tr÷ng lâu hiªn anh hào dçn tß·ng 
--**********************************
function  x070052_FanQuanGift(sceneId,selfId,type)

      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  2  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  2  then
            x070052_Tips(sceneId,selfId," xin/m¶i bäo ðÕo cø lan cùng tài li®u lan có 2 cá ch² tr¯ng ")
            return	 
      end

      if  type  <  1  or  type  >  3  then
            return
      end

      if  type  ==  1  then
            local  myid  =  LuaFnObjId2Guid(sceneId,selfId)
            local  allfirstplayer  =  GetPaiming(sceneId,1)
            if  allfirstplayer[1]  ~=  nil  then
                  if  tonumber(allfirstplayer[1].ID)  ==  tonumber(myid)  then
                        x070052_Tips(  sceneId,  selfId,  " khäo nghi®m thành công , ngài thöa mãn hào tình l²i lÕc tß·ng "  )
                  else
                        x070052_Tips(  sceneId,  selfId,  " khäo nghi®m thành công , ngài cûng không  có ðÕt t¾i hào tình l²i lÕc tß·ng tß cách "  )
                  end
            else
                  x070052_Tips(  sceneId,  selfId,  " tÕm th¶i không có ai thßþng bäng "  )
            end
        end

      if  type  ==  2  then
            local  myid  =  LuaFnObjId2Guid(sceneId,selfId)
            local  allfirstplayer  =  GetPaiming(sceneId,1)
            local  mypaiming  =  0
            for  i  =  1,3  do
                  if  allfirstplayer[i]  ~=  nil  then
                        if  tonumber(allfirstplayer[i].ID)  ==  tonumber(myid)  then
                              mypaiming  =  i
                        end
                  end
            end
            if  mypaiming  >  0  then
                  x070052_Tips(  sceneId,  selfId,  " khäo nghi®m thành công , ngài ðích hào tình l²i vÕn trßþng ðÑng hàng vì thÑ "..mypaiming.." tên "  )
            else
                  x070052_Tips(  sceneId,  selfId,  " ngài b¤t mãn chân hào tình l²i vÕn trßþng tß·ng tß cách "  )
            end
      end

      if  type  ==  3  then
            local  myid  =  LuaFnObjId2Guid(sceneId,selfId)
            local  allfirstplayer  =  GetPaiming(sceneId,1)
            local  mypaiming  =  0
            for  i  =  1,10  do
                  if  allfirstplayer[i]  ~=  nil  then
                        if  tonumber(allfirstplayer[i].ID)  ==  tonumber(myid)  then
                              mypaiming  =  i
                        end
                  end
            end
            if  mypaiming  >  3  then
                  x070052_Tips(  sceneId,  selfId,  " khäo nghi®m thành công , ngài ðích hào tình cái thª ðÑng hàng vì thÑ "..mypaiming.." tên "  )
            elseif  mypaiming  >  0  and  mypaiming  <=  3  then
                  x070052_Tips(  sceneId,  selfId,  " ngài ch² · t± có th¬ trñc tiªp nh§n l¤y cao c¤p h½n ðích tß·ng thß·ng "  )
            elseif  mypaiming  <=  0  then
                  x070052_Tips(  sceneId,  selfId,  " ngài cûng không  có thßþng bäng "  )
            end
      end
end

--**********************************
-- hào tình hµp quà ð±i 
--**********************************
function  x070052_FanQuanBox(sceneId,selfId,index)

    local  box  =  {30008109,30008110,30008111}
    local  fanquanCost  =  {2000,8000,20000}
    local  FanquanCheck  =  GetMissionData(sceneId,selfId,MF_ActiveNewUserCard)

      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  2  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  2  then
            x070052_Tips(sceneId,selfId," xin/m¶i bäo ðäm ðÕo cø lan cùng tài li®u lan có 2 cá ch² tr¯ng ")
            return	 
      end

      if  index  <  1  or  index  >  3  then
            return
      end

  if  FanquanCheck  >=  10^9  then
      if  mod(FanquanCheck,10^9)  >=  fanquanCost[index]  then
            SetMissionData(sceneId,selfId,MF_ActiveNewUserCard,FanquanCheck-fanquanCost[index])
            TryRecieveItem(sceneId,selfId,box[index],1)
            x070052_Tips(  sceneId,  selfId,  " chúc m×ng ngài , thành công ð±i #{_ITEM"..box[index].."}"  )
            x070052_YuanCheng(sceneId,selfId,5  )
      else
            x070052_Tips(  sceneId,  selfId,  " ngài ðích hào tình tr¸ giá không ðü ð¬ ð±i , m²i sung tr¸ giá 1 nguyên có th¬ gia tång 10 hào tình tr¸ giá "  )
            return
      end
  end
end


--**********************************
-- kÏ lân ng÷c phù ð±i 
--**********************************
function  x070052_QiLinGift(sceneId,selfId,index)

local  QLbox  =  {30009601,30009602,30009603,30009951,30009952,30009953,30009851,30009852,30009853}
local  QLnum  =  {20,20,20,15,15,15,10,10,10}

      if  index  <  1  or  index  >  9  then
            return
      end

      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  200  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  200  then
            x070052_Tips(sceneId,selfId," xin/m¶i bäo ðÕo cø lan cùng tài li®u lan có 2 cá ch² tr¯ng ")
            return	 
      end

      if  LuaFnGetAvailableItemCount(sceneId,selfId,30008112)  <  QLnum[index]  then
            x070052_Tips(sceneId,selfId," ngß½i [ kÏ lân ng÷c phù ] chßa ðü "..QLnum[index].." cá "  )	 
            return
      end

      if  LuaFnDelAvailableItem(sceneId,selfId,30008112,QLnum[index])  ~=  1  then
            x070052_Tips(sceneId,selfId," v§t ph¦m kh¤u tr× th¤t bÕi ")
            return
      end

      local  pos  =  TryRecieveItem(sceneId,selfId,QLbox[index],1)
      local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)	 	 
      local  str  =  ""
	   str  =  format(  "#ccc33cc chúc m×ng nhà ch½i ".."#{_INFOUSR%s}#ccc33cc t¯n hao #Y"..QLnum[index].." cá #B#{_ITEM30008112}#ccc33cc thành công ð±i #{_INFOMSG%s}",  GetName(sceneId,selfId),transfer)
      BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
      LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 

end


--**********************************
-- môn phái thái ð¤u nh§n l¤y 
--**********************************
-- môn phái thái ð¤u 
function  x070052_TaiDouGift(sceneId,selfId)

      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  2  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  2  then
            x070052_Tips(sceneId,selfId," xin/m¶i bäo ðÕo cø lan cùng tài li®u lan có 2 cá ch² tr¯ng ")
            return	 
      end

    local  myMp  =  GetMenPai(sceneId,selfId)
    local  myid  =  LuaFnObjId2Guid(sceneId,selfId)
    local  lingquCK  =  mod(GetMissionData(sceneId,selfId,MF_GetNewUserCard1),10)
    if  myMp  >=  0  and  myMp  <=  12  and  myMp  ~=  9  then
          local  TaiDouCK  =  x070052_TaidouSearch(sceneId,selfId,myMp)
          if  tonumber(TaiDouCK.Guild)  ==  tonumber(myid)  then
                if  lingquCK  ==  0  then
                      SetMissionData(sceneId,selfId,MF_GetNewUserCard1,GetMissionData(sceneId,selfId,MF_GetNewUserCard1)+1)
                      x070052_Tips(sceneId,selfId," ki¬m tr¡c ðªn , ngß½i là "..myMp.." s¯ môn phái thái ð¤u ")
                else
                      x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá thái ð¤u ph¥n thß·ng ")
                end
          else
                x070052_Tips(sceneId,selfId," li«n ngß½i cái này c¤p b§c , ngß½i còn mu¯n khi thái ð¤u , ném lôi lâu mµt ! ")
          end
    else
          x070052_Tips(sceneId,selfId," n¢m cái rãnh , ngß½i là thª nào biªn thành "..myMp.." s¯ môn phái ? ngß¶i cüa ta sinh xem cûng b¸ ngß½i v£n v©o ")
    end
end

-- toàn khu thÑ nh¤t 
function  x070052_FirstGift(sceneId,selfId)

      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  2  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  2  then
            x070052_Tips(sceneId,selfId," xin/m¶i bäo ðÕo cø lan cùng tài li®u lan có 2 cá ch² tr¯ng ")
            return	 
      end

    local  allfirstplayer  =  GetPaiming(sceneId,4)
    local  myid  =  LuaFnObjId2Guid(sceneId,selfId)
    local  lingquCK  =  floor(mod(GetMissionData(sceneId,selfId,MF_GetNewUserCard1),100)/10)
          if  tonumber(allfirstplayer[1].ID)  ==  tonumber(myid)  then
                if  lingquCK  ==  0  then
                      SetMissionData(sceneId,selfId,MF_GetNewUserCard1,GetMissionData(sceneId,selfId,MF_GetNewUserCard1)+10)
                      x070052_Tips(sceneId,selfId," ki¬m tr¡c ðªn , ngß½i là thÑ nh¤t , ngß½i ngßu bÑc ")
                else
                      x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá chí tôn ph¥n thß·ng ")
                end
          else
                x070052_Tips(sceneId,selfId," li«n ngß½i cái này c¤p b§c , ngß½i còn mu¯n khi chí tôn , ném lôi lâu mµt ! ")
          end
end

--**********************************
-- ðÕt ngß¶i tß·ng thß·ng nh§n l¤y 
--**********************************
function  x070052_DaRenGift(sceneId,selfId,index)

local  DarenGift  =  {}
            DarenGift[1]  =  {20310110,10125019,30308059,38000187}--{38000497,30309831,10125019,30308059}
            DarenGift[2]  =  {38000531,38001107,38001099,31000100}--{38000531,38001107,38001099,31000100}
            DarenGift[3]  =  {38000396,38000399,38000396,38000399}--{38000398,38000401,10156100,10156200}
            DarenGift[4]  =  {39910002,30505907,30503185,38001103}--{39910004,30505907,30503185,38001103}   
            DarenGift[5]  =  {38001020,39910007,30505205,38001089}--{38001020,39910007,30505205,38001089}


      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  5  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  5  then
            x070052_Tips(sceneId,selfId," xin/m¶i bäo ðÕo cø lan cùng tài li®u lan có 5 cá ch² tr¯ng ")
            return	 
      end
      local  DaRenCK  =  GetMissionData(sceneId,selfId,MF_GetNewUserCard2)

      if  index  ==  1  then
	 x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau")
          if  mod(DaRenCK,10)  ==  0  then
               x070052_Tips(sceneId,selfId," ngß½i cá ðµc thân chó , còn mu¯n nh§n l¤y kªt hôn tß·ng thß·ng sao ? ")
                return
          elseif  mod(DaRenCK,10)  ==  1  then
               SetMissionData(sceneId,selfId,MF_GetNewUserCard2,DaRenCK+1)
                for  i  =  1,getn(DarenGift[index])  do
                        TryRecieveItem(sceneId,selfId,DarenGift[index][i],1)
               end
                x070052_Tips(sceneId,selfId," thành công nh§n l¤y kªt hôn tß·ng thß·ng ! ")
                return
          elseif  mod(DaRenCK,10)  ==  2  then
                x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá nên ph¥n thß·ng , còn t¾i làm gì ? ")
                return
          end
    end

    if  index  ==  2  then
	 x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau")
          --if  mod(floor(DaRenCK/10),10)  ==  0  then
                --x070052_Tips(sceneId,selfId," ngß½i hay là trß¾c ði tìm ngß¶i kªt bái mµt cái , tr· lÕi dçn tß·ng ði ! ")
                --return
          --elseif  mod(floor(DaRenCK/10),10)  ==  1  then
                --SetMissionData(sceneId,selfId,MF_GetNewUserCard2,DaRenCK+10)
                --for  i  =  1,4  do
                        --TryRecieveItem(sceneId,selfId,DarenGift[index][i],1)
                --end
                --x070052_Tips(sceneId,selfId," thành công nh§n l¤y kªt bái tß·ng thß·ng ! ")
                --return
          --elseif  mod(floor(DaRenCK/10),10)  ==  2  then
                --x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá nên ph¥n thß·ng , còn t¾i làm gì ? ")
                --return
          --end
    end

    if  index  ==  3  then
	 x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau")
          --if  mod(floor(DaRenCK/100),10)  ==  0  then
                --x070052_Tips(sceneId,selfId," ngß½i v§y thì có cái gì sß phø , mu¯n l×a gÕt lão phu sao ? ! ")
                --return
          --elseif  mod(floor(DaRenCK/100),10)  ==  1  then
                --SetMissionData(sceneId,selfId,MF_GetNewUserCard2,DaRenCK+100)
                --for  i  =  1,4  do
                        --TryRecieveItem(sceneId,selfId,DarenGift[index][i],1)
                --end
                --x070052_Tips(sceneId,selfId," thành công nh§n l¤y bái sß tß·ng thß·ng ! ")
                --return
          --elseif  mod(floor(DaRenCK/100),10)  ==  2  then
                --x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá nên ph¥n thß·ng , còn t¾i làm gì ? ")
                --return
          --end
    end

    if  index  ==  4  then
	 --x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau")
          --if  mod(floor(DaRenCK/1000),10)  ==  0  then
                --x070052_Tips(sceneId,selfId," ngß½i v§y thì có cái gì ð° ð® , cu°n cuµn cút ! ")
                --return
          --elseif  mod(floor(DaRenCK/1000),10)  ==  1  then
                --SetMissionData(sceneId,selfId,MF_GetNewUserCard2,DaRenCK+1000)
                --for  i  =  1,4  do
                       --TryRecieveItem(sceneId,selfId,DarenGift[index][i],1)
                --end
                --x070052_Tips(sceneId,selfId," thành công nh§n l¤y thu ð° ð® tß·ng thß·ng ! ")
                --return
          --elseif  mod(floor(DaRenCK/1000),10)  ==  2  then
                --x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá nên ph¥n thß·ng , còn t¾i làm gì ? ")
                --return
          --end
    end

    if  index  ==  5  then
	 x070052_Tips(sceneId,selfId,"ChÑc nång này s¨ m· ra sau")
          --if  mod(floor(DaRenCK/10000),10)  ==  0  then
                --x070052_Tips(sceneId,selfId," nhanh ði gia nh§p cá bang phái tr· lÕi ði , tao nåm ! ")
               --return
          --elseif  mod(floor(DaRenCK/10000),10)  ==  1  then
                --SetMissionData(sceneId,selfId,MF_GetNewUserCard2,DaRenCK+10000)
                --for  i  =  1,4  do
                        --TryRecieveItem(sceneId,selfId,DarenGift[index][i],1)
                --end
                --x070052_Tips(sceneId,selfId," thành công nh§n l¤y vào giúp tß·ng thß·ng ! ")
                --return
          --elseif  mod(floor(DaRenCK/10000),10)  ==  2  then
                --x070052_Tips(sceneId,selfId," ngß½i ðã nh§n l¤y quá nên ph¥n thß·ng , còn t¾i làm gì ? ")
                --return
          --end
    end

end