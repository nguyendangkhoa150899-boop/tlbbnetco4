-- chân v¯n s¯ 
x892003_g_scriptId  =  892003

--**********************************
--  
--**********************************

function  x892003_LevelUp(sceneId,  selfId,  lwIndex,lw2Index,cailiao)
	 if  lwIndex  ==  lw2Index  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " xin mi­n phi pháp ån gian "  )	 

          return
	 end	 
	 local  lw  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  lwIndex  )
	 local  lw2  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  lw2Index  )
	 local  icailiao  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  cailiao  )
	 
	 if  lw==10157009  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " các hÕ ðích long vån ðã ðÕt t¾i cao c¤p nh¤t "  )
	 	 return
	 end

	 if  x892003_LWCheck(  sceneId,  selfId,  lw  )==0  or  x892003_LWCheck(  sceneId,  selfId,  lw2  )==0  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " trang b¸ bö vào không phäi long vån , xin ki¬m tra l?i "  )
	 	 return
	 end
	 
	 if  lw~=lw2  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " các hÕ bö vào 2 cái long vån c¤p ðµ không gi¯ng nhau "  )
	 	 return
	 end
	 local  needCailiao=0
	 if  lw>=10157001  and  lw<=10157003  then
	 	 needCailiao=38000184
	 elseif  lw>=10157004  and  lw<=10157006  then
	 	 needCailiao=38000185
	 elseif  lw>=10157007  and  lw<=10157009  then
	 	 needCailiao=38000186
	 end
	 if  icailiao~=needCailiao  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " nguyên li®u bö vào không phäi cüa long vån, xin ki¬m tra lÕi "  )
	 	 return
	 end
	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  icailiao)<1  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  ""..GetItemName(  sceneId,  icailiao  ).." ít h½n so v¾i 1 cái ")
	 return
	 end

	 local  ret1  =  GetGemEmbededCount(  sceneId,  selfId,  lw2Index  )
                if  ret1  ~=  0  then
                      x892003_NotifyTip(  sceneId,  selfId,  " long vån khäm bäo thÕch và long vån chßa khäm không th¬ hþp thành Nguyên Li®u "  )	 
                      return
                end

	 local  pos  =  TryRecieveItem(  sceneId,  selfId,  lw+1,  1  )
	 if  pos==-1  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " túi deo không ðü không gian "  )
	 	 return
	 end
	 
	 CallScriptFunction(  895111,  "SHANG_BAOS",sceneId,  selfId,lwIndex,pos)
	 CallScriptFunction(  895111,  "GetXIN_xi",sceneId,  selfId,lwIndex,pos)
	 
	         local  lwLevel  =  lw-10156999
	 -- bày ra tÕm th¶i không biªt cáii này có nhæng thÑ kia thuµc tính     trß¾c m· ra     l¾n lên   máu   thuµc tính   hÕ tuyªn         wlps000  
	 	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  pos);
            if  myname  ==  nil  then
	 	 myname  =  ""
	     end
                    local  sreet  =  strfind(  myname,"lwps")
                    if  sreet  ==  nil  then
	 	 name11=myname.."lwps"..lwLevel.."00101"
                    else
	 	 name11=myname
                    end
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  pos,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  pos  )
	 LuaFnEraseItem(  sceneId,  selfId,  lwIndex  )
	 LuaFnEraseItem(  sceneId,  selfId,  lw2Index  )
	 DelItem(sceneId,selfId,icailiao,1)
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)
	 x892003_NotifyTip(  sceneId,  selfId,  " chúc m×ng , long vån hþp thành thành công "  )
	 local  lwLevel=lw-10156999
	 local  nam  =  LuaFnGetName(  sceneId,  selfId  )
	 if  lwLevel>=5  then
	 	 BroadMsgByChatPipe(  sceneId,  selfId,  "#cff66cc[ Long Vån H® Th¯ng ]:#B Chúc m×ng ngß¶i ch½i   #cff0000"..nam.."  #B ðã hþp thành công #Y Long Vån #cFF0000C¤p #cff0000"..tonumber(lwLevel).." #Bthuµc tính long vån b¡t ð¥u gia tång ðáng k¬, giang h° phäi kinh n¬! khâm phøc, khâm phøc! . ",  4  )
	 end
end





function  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);
	 local  myname1=nil
	 local  myname2=nil
	 local  myname3=nil
	 if(myname  ~=  nil)  then
	 	 local  changdu1  =  strlen(myname)
	 	 local  sree1  =  strfind(  myname,"lwps")
	 	 if  sree1  ~=  nil  then
	 	 sree2  =  sree1  +  5  	 
	 	 sree3  =  sree1  +  6  	 	 
	 	 sree4  =  sree1  +  8  	 
                myname1  =  strsub(  myname,sree2,sree2)
	 	 myname2  =  strsub(  myname,sree3,sree3+1)
	 	 myname3  =  strsub(  myname,sree4,sree4+1)
	 	 else
	 	 myname1=nil
	         myname2=nil
	         myname3=nil
	 	 end	 
	 end	 
	 return  myname1,myname2,myname3
end	 



function  x892003_GetL_DElw(sceneId,  selfId,  lwIndex)  --lwps910101
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);
	 
	 
	 
	 
        local  sree1,aa,nei,lve,nei1,lve1  =nil,nil,0,0,0,0
	 local  sx,b,h,x,d,b1,h1,x1,d1=0,0,0,0,0,0,0,0,0
	 
	 
	 
	 
	 if(myname  ~=  nil)  then
	 	 local  sree1,aa,xx,nei,lve,nei1,lve1  =  strfind(  myname,"lwps%w(%w)(%w)(%w)(%w)(%w)")
	 	 if  sree1  ~=  nil  and  aa~=nil  then
	 	 	 sx  =tonumber(xx)
	 	     if  nei  =="1"  then  
	 	 	 b  =tonumber(lve)
	 	     end
	 	     if  nei  =="2"  then  
	 	 	 h  =tonumber(lve)
	 	     end	 	 
	 	     if  nei  =="3"  then  
	 	 	 x  =tonumber(lve)
	 	     end	 	 
	 	     if  nei  =="4"  then  
	 	 	 d  =tonumber(lve)
	 	     end	 	 
	 	   if  nei1  =="1"  then  
	 	 	 b1  =tonumber(lve1)
	 	     end
	 	     if  nei1  =="2"  then  
	 	 	 h1  =tonumber(lve1)
	 	     end	 	 
	 	     if  nei1  =="3"  then  
	 	 	 x1  =tonumber(lve1)
	 	     end	 	 
	 	     if  nei1  =="4"  then  
	 	 	 d1  =tonumber(lve1)
	 	     end
	 	 else
	 	 	 return  0,0,0,0,0,0,0,0,0
	 	 end	 
	 	 else
	 	 	 return  0,0,0,0,0,0,0,0,0
	 end	 
	 return  sx,b,h,x,d,b1,h1,x1,d1
end	 




function  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);
	 local  myname0=nil
	 local  myname00=nil
	 local  myname1=nil
	 local  myname11=nil
	 local  myname2=nil
	 local  myname22=nil
	 if(myname  ~=  nil)  then
	 	 local  changdu1  =  strlen(myname)
	 	 local  sree1  =  strfind(  myname,"lwps")
	 	 if  sree1  ~=  nil  then
	 	 sree2  =  sree1  +  5  	 
	 	 sree3  =  sree1  +  6  	 	 
	 	 sree4  =  sree1  +  8  	 
	 	 myname0    =  strsub(  myname,1,sree2-1)
	 	 myname00  =  strsub(  myname,sree3,changdu1)
	 	 
                myname1  =  strsub(  myname,1,sree3-1)
	 	 myname11  =  strsub(  myname,sree4,changdu1)
	 	 
	 	 
	 	 
	 	 
	 	 myname2  =  strsub(  myname,1,sree4-1)
	 	 myname22  =  strsub(  myname,sree4+2,changdu1)
	 	 end	 
	 end	 
	 return  myname0,myname00,  myname1,myname11,myname2,myname22
end	 

--**********************************
--  
--**********************************
function  x892003_StudyProperty(sceneId,  selfId,type,  lwIndex,cskl)	 	 -- h÷c t§p thuµc tính gi¾i m£t 
	 local  lw  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  lwIndex  )
	 if  lw  ~=  10157009  then
	 x892003_NotifyTip(  sceneId,  selfId,  " không phäi là cao c¤p long vån không üng hµ "  )	 
	 return
	 end
	 
	 

	 
	 if  type  ==  0  then
	 	 local  xue  =  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 	 if  xue  ~=  nil  and  tonumber(xue)    >0  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " các hÕ ðã h÷c t§p thuµc tính, không th¬ h÷c lÕi"  )	 
	 	 	 return
	 	 end
	 	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310181)<10  then
	 	 	 x892003_NotifyTip(  sceneId,  selfId,  " Nguyên Li®u chßa ðü : chuª Chuª Long ThÕch Nguyên chßa ðü 10  cái "  )
	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,20000)
	 if  reply  ==  -1  then
	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 return
	 end
	 DelItem(sceneId,selfId,20310181,10)
	 	 
	 	 
	 	 
	 	 
	 	 
	 	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);	 
	 	 if  myname  ==  nil  then  
	 	 myname  =  ""  	 
	 	 end
	 	 local  aa,bb  =  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)	 	 
	 	 local  name11  =  ""  
	 	 if  aa  ~=  nil  and  bb  ~=  nil  then
	 	 name11=aa.."1"..bb
	 	 else
	 	 name11=myname.."lwps910101"
	 	 end
	 	 x892003_NotifyTip(  sceneId,  selfId,  " h÷c t§p thành công "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end	 
	 
	 	 if  type  ==  1  then
	 	 local  _,_,xue  =  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 	 if  xue  ~=  nil  and    tonumber(xue)    >2  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " các hÕ ðã h÷c t§p thuµc tính, không th¬ h÷c lÕi"  )	 
	 	 	 return
	 	 end
	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310182)<10  then
	 	 	 x892003_NotifyTip(  sceneId,  selfId,  " Nguyên Li®u chßa ðü : chuª Chuª Long ThÕch BÕo chßa ðü 10  cái "  )
	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,20000)
	 if  reply  ==  -1  then
	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 return
	 end
	 DelItem(sceneId,selfId,20310182,10)
	 
	 	 
	 	 
	 	 
	 	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);	 
	 	 if  myname  ==  nil  then  
	 	 myname  =  ""  	 
	 	 end
	 	 local  _,_,_,_,aa,bb  =  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)	 	 
	 	 local  name11  =  ""  
	 	 
	 	   if  cskl  ==  1  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."11"..bb
	 	     else
	 	     name11=myname.."lwps800111"
	 	     end
	 	 elseif  cskl  ==  2  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."21"..bb
	 	     else
	 	     name11=myname.."lwps800121"
	 	     end
	 	 elseif  cskl  ==  3  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."31"..bb
	 	     else
	 	     name11=myname.."lwps800131"
	 	     end	 	 
	 	 elseif  cskl  ==  4  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."41"..bb
	 	     else
	 	     name11=myname.."lwps800141"
	 	     end	 	 
	 	 end
	 	 x892003_NotifyTip(  sceneId,  selfId,  " h÷c t§p thành công "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end	 



	 	 if  type  ==  2  then
	 	 local  _,xue  =  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 	 if  xue  ~=  nil  and    tonumber(xue)    >2  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " các hÕ ðã h÷c t§p thuµc tính, không th¬ h÷c lÕi"  )	 
	 	 	 return
	 	 end
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310183)<10  then
	 	 	 x892003_NotifyTip(  sceneId,  selfId,  " Nguyên Li®u chßa ðü : chuª Chuª Long ThÕch Thß½ng chßa ðü 10  cái "  )
	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,20000)
	 if  reply  ==  -1  then
	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 return
	 end
	 DelItem(sceneId,selfId,20310183,10)
	 	 
	 	 
	 	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);	 
	 	 if  myname  ==  nil  then  
	 	 myname  =  ""  	 
	 	 end
	 	 local  _,_,aa,bb  =  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)	 	 
	 	 local  name11  =  ""  
	 	 
	 	   if  cskl  ==  1  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."11"..bb
	 	     else
	 	     name11=myname.."lwps801101"
	 	     end
	 	 elseif  cskl  ==  2  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."21"..bb
	 	     else
	 	     name11=myname.."lwps802101"
	 	     end
	 	 elseif  cskl  ==  3  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."31"..bb
	 	     else
	 	     name11=myname.."lwps803101"
	 	     end	 	 
	 	 elseif  cskl  ==  4  then
	 	     if  aa  ~=  nil  and  bb  ~=  nil  then
	 	     name11=aa.."41"..bb
	 	     else
	 	     name11=myname.."lwps804101"
	 	     end	 	 
	 	 end
	 	 x892003_NotifyTip(  sceneId,  selfId,  " h÷c t§p thành công "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end	 	 
end

function  x892003_UpdateProperty(sceneId,  selfId,  lwIndex,type)                -- thång c¤p thuµc tính dùng     
	 local  lw  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  lwIndex  )
	 if  lw  ~=  10157009  then
	 x892003_NotifyTip(  sceneId,  selfId,  " không phäi là cao c¤p long vån không üng hµ "  )	 
	 return
	 end
	 if  type  ==  1  then    -- máu 

	 local  xie  =  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 if  xie  ==  nil    or    tonumber(  xie)  <1  then
        x892003_NotifyTip(  sceneId,  selfId,  " ðã h÷c ðích m¾i üng hµ thång c¤p thuµc tính "  )
	 return
	 end
	 if    tonumber(  xie)  >8  then
        x892003_NotifyTip(  sceneId,  selfId,  " c¤p b§c ðã t¾i cñc hÕn "  )
	 return
	 end	 
	 
	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310181)<tonumber(  xie)*10  then
	 	 	 x892003_NotifyTip(  sceneId,  selfId,  " Nguyên Li®u chßa ðü : t×   "..xie.."  c¤p tång lên t¾i   "..(tonumber(xie)+1).."  c¤p c¥n Nguyên Li®u chuª Chuª Long ThÕch Nguyên :  "..(tonumber(  xie)*10).."  cái "  )
	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,20000)
	 if  reply  ==  -1  then
	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 return
	 end
	 DelItem(sceneId,selfId,20310181,tonumber(  xie)*10)
	       local  aa,bb  =  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)	 
	       name11  =  aa..(tonumber(  xie)+1)..bb
	 	 x892003_NotifyTip(  sceneId,  selfId,  " long vån thång c¤p phát tri¬n thuµc tính thành công "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end
	 
	 
	 
	 
	 
	 if  type  ==  2  then
	 	 
	 	 
	 	 
	 local  _,xie  =  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 if  xie  ==  nil  then
        x892003_NotifyTip(  sceneId,  selfId,  " ðã h÷c ðích m¾i üng hµ thång c¤p thuµc tính "  )
	 return
	 end
	 if  tonumber(  xie)  <2    then
        x892003_NotifyTip(  sceneId,  selfId,  " ðã h÷c ðích m¾i üng hµ thång c¤p thuµc tính "  )
	 return
	 end
        str  =  floor(  tonumber(xie)/10)
	 strun  =  mod(  tonumber(xie),10)
	 if  strun  ==9  then
        x892003_NotifyTip(  sceneId,  selfId,  " phát tri¬n c¤p b§c ðã ð¥y "  )	 	 
	 	 return
	 end	 
	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310183)<tonumber(  strun)*10  then
	 	 	 x892003_NotifyTip(  sceneId,  selfId,  " Nguyên Li®u chßa ðü : t×   "..tostring(strun).."  c¤p tång lên t¾i   "..tostring(strun+1).."  c¤p c¥n Nguyên Li®u chuª Chuª Long ThÕch Thß½ng :  "..(tonumber(  strun)*10).."  cái "  )
	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,20000)
	 if  reply  ==  -1  then
	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 return
	 end
	 DelItem(sceneId,selfId,20310183,tonumber(  strun)*10)
	 
	 
	       local  _,_,aa,bb  =  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)	 
	       name11  =  aa..tostring(str)..(strun  +1)..bb
	 	 x892003_NotifyTip(  sceneId,  selfId,  " thång c¤p thành công "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end	 
	 
	 if  type  ==  3  then
	 
	 local  _,_,xie  =  x892003_GetLv(sceneId,  selfId,  lwIndex)
	 if  xie  ==  nil  then
        x892003_NotifyTip(  sceneId,  selfId,  " ðã h÷c ðích m¾i üng hµ thång c¤p thuµc tính "  )
	 return
	 end
	 if  tonumber(  xie)  <2    then
        x892003_NotifyTip(  sceneId,  selfId,  " ðã h÷c ðích m¾i üng hµ thång c¤p thuµc tính "  )
	 return
	 end
        str  =  floor(  tonumber(xie)/10)
	 strun  =  mod(  tonumber(xie),10)
	 if  strun  ==9  then
        x892003_NotifyTip(  sceneId,  selfId,  " phát tri¬n c¤p b§c ðã ð¥y "  )	 	 
	 	 return
	 end	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310182)<tonumber(  strun)*10  then
	 	 	 x892003_NotifyTip(  sceneId,  selfId,  " Nguyên Li®u chßa ðü : t×   "..tostring(strun).."  c¤p tång lên t¾i   "..tostring(strun+1).."  c¤p c¥n Nguyên Li®u chuª Chuª Long ThÕch BÕo :  "..(tonumber(  strun)*10).."  cái "  )
	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,20000)
	 if  reply  ==  -1  then
	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 return
	 end
	 DelItem(sceneId,selfId,20310182,tonumber(  strun)*10)
	 
	 
	       local  _,_,_,_,aa,bb  =  x892003_GetLvfenk(sceneId,  selfId,  lwIndex)	 
	       name11  =  aa..tostring(str)..(strun  +1)..bb
	 	 x892003_NotifyTip(  sceneId,  selfId,  " thång c¤p thành công "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  name11  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end	 
	 
	 
end

function  x892003_ResetProperty(sceneId,  selfId,idx,  lwIndex)      -- ngçu nhiên t¡m thuµc tính   OK
	 local  lw  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  lwIndex  )

	 
	 if  idx    ==  1    then  -- th§t thuµc tính 
	 if  lw  ~=  10157009  then
	 x892003_NotifyTip(  sceneId,  selfId,  " không phäi là cao c¤p long vån không üng hµ "  )	 
	 return
	 end	 
	 	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310182)<10    or  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310183)<10  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " Không ðü chuª Chuª Long ThÕch Thß½ng 10 cái ho£c là Không ðü chuª Chuª Long ThÕch BÕo 10 cái "  )
	 	 return
	 end

	 
	 local  a,b,c  =  x892003_GetLv(sceneId,  selfId,  lwIndex)	 
	 if  a==nil  or  b==nil  or  c==nil  or  tonumber(a)<1  or    tonumber(b)<2  or  tonumber(c)<2  then
	 x892003_NotifyTip(  sceneId,  selfId,  " chï có ðã h÷c 3 loÕi phát tri¬n thuµc tính ðích long vån m¾i üng hµ ngçu nhiên t¡m thuµc tính "  )	 
	 	 return
	 end	 
	 
	 local  reply  =  CostMoney(sceneId,selfId,10000)
	 if  reply  ==  -1  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 	 return
	 end
	 DelItem(sceneId,selfId,20310182,10)
        DelItem(sceneId,selfId,20310183,10)
	 
	 
	 local  str  =  ""  
	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,  lwIndex);	 
        local  a,b,str1,stru1,str2,stru2,str3=strfind(myname,"(lwps%w%w)(%w)(%w)(%w)(%w)")  --lwps804101
	 if  a  ==nil  or  b  ==nil  then
	 x892003_NotifyTip(  sceneId,  selfId,  " không biªt sai l¥m "  )	 
          return	 
	 end	 
	 
          local    sc  =  random(1,4)
          local    sb  =  random(1,4)
	 str  =  str1..sc..str2..sb..str3
	 if  str  ~=nil  then
	 x892003_NotifyTip(  sceneId,  selfId,  " Chúc m×ng , long vån ðã thay ð±i thuµc tính thành công! "  )
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  lwIndex,  str  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  lwIndex  )
	 end
	 end	 
	 
	 
	 
	 
	 if  idx    ==  2    then  -- th§t thuµc tính 
	 	 
	 if  lw  >  10157009  or  lw  <  10157001  then
	 x892003_NotifyTip(  sceneId,  selfId,  " không phäi là long vån không üng hµ "  )	 
	 return
	 end	 
	 	 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20310180)<10  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " Không ðü T¸nh Vân Thüy 10 cái "  )
	 	 return
	 end
	 local  reply  =  CostMoney(sceneId,selfId,500000)
	 if  reply  ==  -1  then
	 	 x892003_NotifyTip(  sceneId,  selfId,  " vàng không ðü "  )
	 	 return
	 end
	 DelItem(sceneId,selfId,20310180,10)

          local  pos  =  TryRecieveItem(  sceneId,  selfId,  lw,  1  )
	 CallScriptFunction(  895111,  "SHANG_BAOS",sceneId,  selfId,lwIndex,pos)
                x892003_GetXIN_xi(sceneId,  selfId,lwIndex,pos)
	 LuaFnEraseItem(  sceneId,  selfId,  lwIndex  )
	 x892003_NotifyTip(  sceneId,  selfId,  " Chúc m×ng , long vån ðã t¦y lÕi dòng thuµc tính thành công! "  )
	 end	 	 
end

--**********************************
-- long vån ki¬m tra 
--**********************************
function  x892003_LWCheck(  sceneId,  selfId,  index  )	 
	 local  flag=0
	 if  index>=10157001  and  index<=10157010  then
	 	 flag=1
	 end
	 return  flag
end

--**********************************
-- long vån phát tri¬n thuµc tính ki¬m tra 
--**********************************
function  x892003_GetXIN_xi(sceneId,  selfId,equipitm,pos)
	 
    local  _,xinxi  =  LuaFnGetItemCreator(sceneId,  selfId,equipitm)  	 
    if  xinxi  ==nil  then  
          xinxi  =  ""
    end
    LuaFnSetItemCreator(  sceneId,  selfId,  pos,xinxi  )
    LuaFnRefreshItemInfo(  sceneId,  selfId,  pos  )	 
end

--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x892003_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x892003_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end