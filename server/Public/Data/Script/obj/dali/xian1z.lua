-- sinh linh 
-- hÕt tØ 
--QQ718805400
x391060_g_ScriptId	 =  391060
function  x391060_OnDefaultEvent(  sceneId,  actId  )
end
function  x391060_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

function  x391060_MsgBox18(sceneId,  selfId,y,o,p,l,k)
	 SetMissionData(  sceneId,  selfId,  400  ,y)
	 SetMissionData(  sceneId,  selfId,  401  ,o)
	 SetMissionData(  sceneId,  selfId,  402  ,p)
	 SetMissionData(  sceneId,  selfId,  403  ,l)
	 SetMissionData(  sceneId,  selfId,  404  ,k)
end

function  x391060_MsgBox33(  sceneId,  selfId  )
local  Aaaa,Aaaa1,Bbbb,Bbbb1,WQnum,TDnum  =0,0,0,0,0,0
for  sd=100,118  do
	 if  sd  ~=  116  then
	 	 Aaaa1  =  x391060_level(sceneId,  selfId,  sd)
	 	 if  Aaaa1  >  0  then
	 	 	 local  sldjbsx1={1,2,3,4,5,6,7,8,9}
	 	 	 Aaaa  =  Aaaa  +  sldjbsx1[Aaaa1]
                                                WQnum  =  WQnum  +  1
	 	 end
	 	 Bbbb1  =  x391060_level2(sceneId,  selfId,  sd)
	 	 if  Bbbb1  >  0  then
	 	 	 local  sldjbsx2={11,12,13,14,15,16,17,18,19}
	 	 	 Bbbb  =  Bbbb  +  sldjbsx2[Bbbb1]
                                                TDnum  =  TDnum  +  1
                                end
	 end
end
	 if  (Aaaa+Bbbb)  >=0  and  (Aaaa+Bbbb)  <=  999  then
	                 SetMissionData(  sceneId,  selfId,  XIEZI_SL,  TDnum*10^5+WQnum*10^3+Aaaa+Bbbb)
                                --x391060_NotifyTip(  sceneId,  selfId,  " ki¬m tr¡c thành công , ngài trên ngß¶i có       thiên ðÕo trang b¸ "..TDnum.." món       vß½ng quy«n trang b¸ "..WQnum.." món       ghi chép tiªp l¶i "..GetMissionData(sceneId,selfId,XIEZI_SL)..""  )
                                x391060_XIEZI(  sceneId,  selfId  )
	 end
end
	 

function  x391060_level(sceneId,  selfId,  arg1)
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1);
	 local  myname2  =  "0"
	 if(myname  ~=  nil)  then
	 	 local  sree1  =  strfind(  myname,"w#p")
	 	 if  sree1  ==  nil  then
	 	 	 sree1  =  0
	 	 end
	 	 	 if  sree1  >=  1  then
	 	 	 myname2  =  strsub(  myname,  sree1+3,sree1+3  )
	 	 	 end
	 	 end
	 return  tonumber(myname2)
end

function  x391060_level2(sceneId,  selfId,  arg1)
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1);
	 local  myname2  =  "0"
	 if(myname  ~=  nil)  then
	 	 local  sree1  =  strfind(  myname,"t#p")
	 	 if  sree1  ==  nil  then
	 	 	 sree1  =  0
	 	 end
	 	 	 if  sree1  >=  1  then
	 	 	 myname2  =  strsub(  myname,  sree1+3,sree1+3  )
	 	 	 end
	 	 end
	 return  tonumber(myname2)
end

function  x391060_MsgBox32(sceneId,  selfId,lwIndex,txpp,lwIntex)

	 local  lw  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  lwIndex  )
	 if  lw<10000010  or  lw>=10957019  then
	 	 x391060_NotifyTip(  sceneId,  selfId,  " xin/m¶i bö vào trang b¸ "  )
	 	 return
	 end

      if  txpp  ==  100  then    -- hÕt tØ khäo nghi®m vß½ng quy«n thång linh 

	 local  lw21,lw22,lw23  =  x391060_wuhunjb(sceneId,  selfId,  lwIndex)
	 local  lw20  =  tonumber(lw22)

	 if  lw20  >=  9  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " vß½ng quy«n thång linh ðã ðÕt ðÆng c¤p cao nh¤t , m¶i vào ðßþc thiên ðÕo thång linh "  )
	 	 return
	 end
	 local  EquipType	 =  LuaFnGetBagEquipType(  sceneId,  selfId,  lwIndex  )
	 	 if  EquipType  ==  16  or  EquipType  ==  17  or  EquipType  ==  8  or  EquipType  ==  18  or  EquipType  ==  9  or  EquipType  ==  10  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " ám khí th¶i trang cÞi ngña long vån vû h°n không üng hµ thång linh thao tác "  )
	 	 return
	 end
	 local  c0  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  30600084)
	 local  needMoney2=20*lw20+1
	 	 if  c0  >=needMoney2  then
	 	 	 LuaFnDelAvailableItem(sceneId,selfId,30600084,needMoney2)-- thü tiêu v§t ph¦m 
	 	 else
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " c¥n tØ vi linh phách "..needMoney2  )
	 	 	 return
	 	 end

	 local  reply  =  CostMoney(sceneId,selfId,50000)
	 if  reply  ==  -1  then
	 	   x391060_NotifyTip(  sceneId,  selfId,  " kim ti«n chßa ðü , kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);
	 if(myname  ==  nil)  then
	 	 myname=""
	 end

	 if  lw20  ==  0  then
	 	 local  dwlva1=myname.."w#p1";
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  dwlva1  )

	 else
	 	 lw20  =  lw20  +1
	 	 local  dwlva1=lw21..lw20..lw23;
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  dwlva1  )

	 end
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 x391060_NotifyTip(  sceneId,  selfId,  " chúc m×ng , trang b¸ thång linh thành công "  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
      end




      if  txpp  ==  200  then            -- hÕt tØ khäo nghi®m thiên ðÕo thång linh 

	 local  lw21,lw22,lw23  =  x391060_wuhunjb2(sceneId,  selfId,  lwIndex)
	 local  lw20  =  tonumber(lw22)

	 if  lw20  <  1  or  lw20  ==  nil  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " xin/m¶i trß¾c tång lên t¾i vß½ng quy«n 9 c¤p , næa lên c¤p là tr¶i ðÕo trang b¸ , lÕi v×a tiªn hành thiên ðÕo thång linh "  )
	 	 return
	 end

	 if  lw20  >=  9  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " thiên ðÕo thång linh ðã ðÕt ðÆng c¤p cao nh¤t , không c¥n l¥n næa thång linh "  )
	 	 return
	 end
	 local  EquipType	 =  LuaFnGetBagEquipType(  sceneId,  selfId,  lwIndex  )
	 	 if  EquipType  ==  16  or  EquipType  ==  17  or  EquipType  ==  8  or  EquipType  ==  18  or  EquipType  ==  9  or  EquipType  ==  10  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " ám khí th¶i trang cÞi ngña long vån vû h°n không üng hµ thång linh thao tác "  )
	 	 return
	 end
	 local  c0  =  LuaFnGetAvailableItemCount(sceneId,  selfId,  30600084)
	 local  needMoney2=10*lw20+100
	 	 if  c0  >=needMoney2  then
	 	 	 LuaFnDelAvailableItem(sceneId,selfId,30600084,needMoney2)-- thü tiêu v§t ph¦m 
	 	 else
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " c¥n tØ vi linh phách "..needMoney2  )
	 	 	 return
	 	 end

	 local  reply  =  CostMoney(sceneId,selfId,50000)
	 if  reply  ==  -1  then
	 	   x391060_NotifyTip(  sceneId,  selfId,  " kim ti«n chßa ðü , kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);
	 if(myname  ==  nil)  then
	 	 myname=""
	 end

	 	 lw20  =  lw20  +1
	 	 local  dwlva1=lw21..lw20..lw23;
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  dwlva1  )

	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 x391060_NotifyTip(  sceneId,  selfId,  " chúc m×ng , trang b¸ thång linh thành công "  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
          if  lw20  ==  9  then
                local  BAGindex  =  GetBagItemTransfer(  sceneId,  selfId,  lwIndex  )
                local  str  =  ""
                str  =  format(  "#H Anh hùng #{_INFOUSR%s}#H · phßþng minh tr¤n ðích #G tiêu h± (151,76)#H ch² chª tÕo ra #ccc33cc mãn c¤p thiên ðÕo trang b¸ #{_INFOMSG%s1}#H , lÕi mµt th¥n binh lþi khí kinh hi®n thª ðang lúc ! ",GetName(sceneId,selfId),BAGindex)
                BroadMsgByChatPipe(  sceneId,  selfId,str,  4  )
            end
        end



      if  txpp  ==  300  then            -- hÕt tØ khäo nghi®m thång linh lên c¤p 
	 local  lw21,lw22,lw23  =  x391060_wuhunjb(sceneId,  selfId,  lwIndex)
	 local  lw20  =  tonumber(lw22)

	 if  lw20  ~=  9  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " vß½ng quy«n thång linh ðÕt t¾i 9 c¤p ðích trang b¸ , lÕi v×a m¶i vào ðßþc thiên ðÕo thång linh "  )
	 	 return
	 end
	 local  EquipType	 =  LuaFnGetBagEquipType(  sceneId,  selfId,  lwIndex  )
	 	 if  EquipType  ==  16  or  EquipType  ==  17  or  EquipType  ==  8  or  EquipType  ==  18  or  EquipType  ==  9  or  EquipType  ==  10  then
	 	 	 x391060_NotifyTip(  sceneId,  selfId,  " ám khí th¶i trang cÞi ngña long vån vû h°n không üng hµ thång linh thao tác "  )
	 	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,500000)
	 if  reply  ==  -1  then
	 	   x391060_NotifyTip(  sceneId,  selfId,  " kim ti«n chßa ðü , kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);
	 if(myname  ==  nil)  then
	 	 myname=""
	 end

	 if  lw20  ==  9  then
                      dwlva1  =  gsub(myname,"w#p9","t#p1",1)
                      --dwlva1  =  gsub(myname,"w#p9","",1)  --------------------------- n½i này sau này có th¬ dùng v¾i lui linh 
	       LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  dwlva1  )
	       LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
                end

	 x391060_NotifyTip(  sceneId,  selfId,  " chúc m×ng , lên c¤p thiên ðÕo trang b¸ thành công "  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)
                local  BAGindex  =  GetBagItemTransfer(  sceneId,  selfId,  lwIndex  )
                local  str  =  ""
                str  =  format(  "#H Anh hùng #{_INFOUSR%s}#H · phßþng minh tr¤n ðích #G tiêu h± (151,76)#H ch² chª tÕo ra thiên ðÕo trang b¸ #{_INFOMSG%s1}#H thuµc tính l¤y ðßþc ðÕi phúc tång lên . ",GetName(sceneId,selfId),BAGindex)
                BroadMsgByChatPipe(  sceneId,  selfId,str,  4  )
      end



      if  txpp  ==  400  then            -- hÕt tØ khäo nghi®m thång linh d¶i ði 
	 if  lwIndex  ==-1  or  lwIntex  ==-1  then
	       return
	 end  
	 if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <1  then
	       x391060_NotifyTip(  sceneId,  selfId,  " bao g°m ch² tr¯ng tØ chßa ðü xin mi­n thao tác "  )	 
	       return
	 end	 

	 local  iio  =  GetItemEquipPoint(LuaFnGetItemTableIndexByIndex(sceneId,  selfId,  lwIndex))    -- nguyên trang b¸ ðích trang b¸ ði¬m 
	 local  iii  =  GetItemEquipPoint(LuaFnGetItemTableIndexByIndex(sceneId,  selfId,  lwIntex))    -- møc tiêu trang b¸ ðích trang b¸ ði¬m 

	 if  iio  ~=  iii  then
	 x391060_NotifyTip(  sceneId,  selfId,  " trang b¸ không phäi là cùng loÕi loÕi hình không cách nào d¶i ði "  )	 
	 	 return
	 end

	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);    -- nguyên 
	 local  _,  otname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIntex);    -- møc tiêu 

                -- trß¾c ki¬m tra møc tiêu trang b¸ 
                if  otname  ~=nil  then
                      local  oEquipWQ  =  strfind(otname,"w#p")    
                      local  oEquipTD  =  strfind(otname,"t#p")  
                      if  oEquipWQ  ~=  nil  or  oEquipTD  ~=  nil  then
	 	 x391060_NotifyTip(  sceneId,  selfId,  " ngß½i bö vào ðích møc tiêu trang b¸ ðã có thång linh ðµ ! "  )
	 	 return
	       end
                end

                -- b¡t ð¥u ki¬m tr¡c nguyên trang b¸ 
                if  myname  ~=nil  then
                      local  mEquipWQ  =  strfind(myname,"w#p")    
                      local  mEquipTD  =  strfind(myname,"t#p")  
                      if  mEquipWQ  ~=  nil  then
	             local  reply  =  CostMoney(sceneId,selfId,500000)
	             if  reply  ==  -1  then
	 	   x391060_NotifyTip(  sceneId,  selfId,  " kim ti«n chßa ðü , kh¤u tr× th¤t bÕi "  )
	 	   return
	             end
                            local  wSLD  =  tonumber(strsub(myname,mEquipWQ+3,mEquipWQ+3))
                            if  wSLD  <  1  or  wSLD  >  9  then
	                   x391060_NotifyTip(  sceneId,  selfId,  " vß½ng quy«n s¯ li®u có sai l¥m , xin liên lÕc GM"  )
	 	   return
	             end
                            -- ði tr× nguyên trang b¸ ðích thång linh ðµ 
                            if  lwIndex  ~=  -1  then
                                  dwlva1  =  gsub(myname,"(w#p)".."%w","",1)
	                   LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  dwlva1  )
	                   LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
                            end
                            -- gia tång møc tiêu trang b¸ ðích thång linh ðµ 
                            if  lwIntex  ~=  -1  then
                                  if  otname  ==  nil  then
                                        dwlva2  =  "w#p"..wSLD..""
                                  else
                                        dwlva2  =  ""..otname.."w#p"..wSLD..""
                                  end
	                   LuaFnSetItemCreator(  sceneId,  selfId,  lwIntex,  dwlva2  )
	                   LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIntex  )
	                   x391060_NotifyTip(  sceneId,  selfId,  " thång linh ðµ d¶i ði thành công 11111111"  )
                                  LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)

                                  local  BAGintex  =  GetBagItemTransfer(  sceneId,  selfId,  lwIntex  )
                                  local  str  =  ""
                                  str  =  format(  "#{_INFOUSR%s}#H · phßþng minh tr¤n ðích #G tiêu h± (151,76)#H ch² hoa phì 50 kim , ðem cñu trang b¸ ðích thång linh ðµ thành công d¶i ði ðªn #{_INFOMSG%s1} thßþng ! ",GetName(sceneId,selfId),BAGintex)
                                  BroadMsgByChatPipe(  sceneId,  selfId,str,  4  )
                            end

                      elseif  mEquipTD  ~=  nil  then
	             local  reply  =  CostMoney(sceneId,selfId,500000)
	             if  reply  ==  -1  then
	 	   x391060_NotifyTip(  sceneId,  selfId,  " kim ti«n chßa ðü , kh¤u tr× th¤t bÕi "  )
	 	   return
	             end
                            local  tSLD  =  tonumber(strsub(myname,mEquipTD+3,mEquipTD+3))
                            if  tSLD  <  1  or  tSLD  >  9  then
	                   x391060_NotifyTip(  sceneId,  selfId,  " thiên ðÕo s¯ li®u có sai l¥m , xin liên lÕc GM"  )
	 	   return
	             end
                            -- ði tr× nguyên trang b¸ ðích thång linh ðµ 
                            if  lwIndex  ~=  -1  then
                                  dwlva1  =  gsub(myname,"(t#p)".."%w","",1)
	                   LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  dwlva1  )
	                   LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
                            end
                            -- gia tång møc tiêu trang b¸ ðích thång linh ðµ 
                            if  lwIndex  ~=  -1  then
                                  if  otname  ==  nil  then
                                        dwlva2  =  "t#p"..tSLD..""
                                  else
                                        dwlva2  =  ""..otname.."t#p"..tSLD..""
                                  end
	                   LuaFnSetItemCreator(  sceneId,  selfId,  lwIntex,  dwlva2  )
	                   LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIntex  )
	                   x391060_NotifyTip(  sceneId,  selfId,  " thång linh ðµ d¶i ði thành công 2222222"  )
                                  LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)

                                  local  BAGintex  =  GetBagItemTransfer(  sceneId,  selfId,  lwIntex  )
                                  local  str  =  ""
                                  str  =  format(  "#{_INFOUSR%s}#H · phßþng minh tr¤n ðích #G tiêu h± (151,76)#H ch² hoa phì 50 kim , ðem cñu trang b¸ ðích thång linh ðµ thành công d¶i ði ðªn #{_INFOMSG%s1} thßþng ! ",GetName(sceneId,selfId),BAGintex)
                                  BroadMsgByChatPipe(  sceneId,  selfId,str,  4  )
                            end
                    else
	             x391060_NotifyTip(  sceneId,  selfId,  " ngß½i bö vào ðích nguyên trang b¸ không có thång linh ðµ ! "  )
	             return
	     end
            else
	     x391060_NotifyTip(  sceneId,  selfId,  " ngß½i bö vào ðích nguyên trang b¸ không có thång linh ðµ ! 22222"  )
	     return
            end
      end


end


-- hÕt tØ gia tång nµi dung kªt thúc 

function  x391060_wuhunjb(sceneId,  selfId,  arg1)
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1);
	 local  myname1  =  "0"
	 local  myname2  =  "0"
	 local  myname3  =  "0"
	 if(myname  ~=  nil)  then
	 	 local  changdu1  =  strlen(myname)
	 	 local  sree1  =  strfind(  myname,"w#p")
	 	 if  sree1  ==  nil  then
	 	 	 sree1  =  0
	 	 end
	 	 	 if  sree1  >=  1  then
	 	 	 	 if  changdu1  ==  4  then
	 	 	 	 	 myname1  =  strsub(  myname,  1,3  )
	 	 	 	 	 myname2  =  strsub(  myname,  4,4  )
	 	 	 	 else
	 	 	 	 	 myname1  =  strsub(  myname,  1,sree1+2  )
	 	 	 	 	 myname2  =  strsub(  myname,  sree1+3,sree1+3  )
	 	 	 	 	 myname3  =  strsub(  myname,  sree1+4,changdu1  )
	 	 	 	 end
	 	 	 end
	 	 end
	 return  myname1,myname2,myname3
end

function  x391060_wuhunjb2(sceneId,  selfId,  arg1)
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1);
	 local  myname1  =  "0"
	 local  myname2  =  "0"
	 local  myname3  =  "0"
	 if(myname  ~=  nil)  then
	 	 local  changdu1  =  strlen(myname)
	 	 local  sree1  =  strfind(  myname,"t#p")
	 	 if  sree1  ==  nil  then
	 	 	 sree1  =  0
	 	 end
	 	 	 if  sree1  >=  1  then
	 	 	 	 if  changdu1  ==  4  then
	 	 	 	 	 myname1  =  strsub(  myname,  1,3  )
	 	 	 	 	 myname2  =  strsub(  myname,  4,4  )
	 	 	 	 else
	 	 	 	 	 myname1  =  strsub(  myname,  1,sree1+2  )
	 	 	 	 	 myname2  =  strsub(  myname,  sree1+3,sree1+3  )
	 	 	 	 	 myname3  =  strsub(  myname,  sree1+4,changdu1  )
	 	 	 	 end
	 	 	 end
	 	 end
	 return  myname1,myname2,myname3
end

function  x391060_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

function  x391060_XIEZI(  sceneId,  selfId  )

        -- ki¬m tr¡c kim sí linh vû 
	 local  jiance1  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  117)
                if  jiance1  ==  10155021  or  jiance1  >=  10155100  and  jiance1  <=  10155139  then
                      if  HaveSkill(  sceneId,  selfId,  277  )  <  1  then
                            AddSkill(sceneId,  selfId,  277)
							LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 7579, 0 )
	             x391060_NotifyTip(  sceneId,  selfId,  " ngài trß¾c m£t m£c ám khí vì [#{_ITEM"..jiance1.."}], ðã thành công kích hoÕt ám khí liên kích kÛ nång "  )
                      end
                      for  i  =  901,905  do
                            if  HaveSkill(  sceneId,  selfId,  i  )  <  1  then
                                  AddSkill(sceneId,  selfId,  i)
                            end
                      end
                else
                      if  HaveSkill(  sceneId,  selfId,  277  )  ==  1  then
	                 DelSkill(  sceneId,  selfId,  277  )
                            x391060_NotifyTip(  sceneId,  selfId,  " ngài ðã tháo xu¯ng kim sí linh vû , ám khí liên kích kÛ nång ðã che gi¤u "  )
                      end
                      for  i  =  901,905  do
                            if  HaveSkill(  sceneId,  selfId,  i  )  ==  1  then
                                  DelSkill(sceneId,  selfId,  i)
                            end
                      end
                end

      -- ki¬m tr¡c thái c± th¥n khí 
                local  SGSQ  =  0
                local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,100);
                if  myname  ~=  nil  then
	       local  sree1  =  strfind(myname,"#S")
	       if  sree1  ~=  nil  then
                                SGSQ  =  tonumber(strsub(myname,sree1+2,sree1+9))
                      end
                end
                SetMissionData(sceneId,selfId,SuperWeapon9_DIYSkill,mod(SGSQ,10^6))
                if  floor(SGSQ/10^6)  >=  2  then
                      if  HaveSkill(  sceneId,  selfId,  930  )  ~=  1  then
                                AddSkill(  sceneId,  selfId,  930  )
                      end
                else
                      DelSkill(  sceneId,  selfId,  930  )
                end
end