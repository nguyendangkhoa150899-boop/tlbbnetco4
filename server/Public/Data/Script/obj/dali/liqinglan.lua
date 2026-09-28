x014036_g_scriptId  =  014036

x014036_g_asdda  =  {"Thiªu Lâm","Minh giáo","Cái Bang","Võ Ðß½ng","Nga Mi","Tinh túc","Thiên Long","Thiên S½n","Tiêu dao","không phái","Mµ Dung","Ðß¶ng môn","QuÖ c¯c"}
x014036_g_Sexty  =  {"næ","nam","không"}
x014036_g_BaiMing  =  {"mµt","hai","ba","b¯n","nåm","sáu","bäy","tám","chín","mß¶i"}

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x014036_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(sceneId)
	 AddText(  sceneId, "Thân ái nhà ch½i , nªu nhß ngß½i ð¯i v¾i v¯n trò ch½i có ý kiªn t¯t h½n cùng ð« ngh¸ , hoan nghênh thêm   hÕt tØ   phän quÛ . cám ½n ngài ßu ái , vß½ng giä lØa cháy , d°n lñc v¾i làm t¯t nh¤t phäng quan !" )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end


function  x014036_OnEventRequest(  sceneId,  selfId,  targetId  )

end

--**********************************
--------- thång c¤p ði«u døng -------------
--**********************************
function  x014036_SJ(  sceneId,  selfId  )  
	 local  lve  =  GetLevel(sceneId,  selfId)      -- c¤p b§c 
	 local  cmp  =  GetMenPai(sceneId,selfId)
	 local  allguild,key  =x014036_chazhaoTxt(sceneId,selfId,cmp)
	 if  key  >  0    then
	 	 if  allguild[key].Guildlve  ==  lve  then
	 	 	 return
	 	 end
	 	 allguild[key].Guildlve  =lve
	 	 -----------------------
	 	 for  i  =  1,  getn(allguild)  do
	 	 	 for  j  =  1,  i  do
	 	 	 	 if  allguild[i].Guildlve  >  allguild[j].Guildlve    then
	 	 	 	 	 local  temp  =  allguild[i]
	 	 	 	 	 allguild[i]  =  allguild[j]
	 	 	 	 	 allguild[j]  =  temp
	 	 	 	 end
	 	 	 end
	 	 end
	 	 
	 	 local  mystring  = ""
	 	 local  xuhuannumber  =  getn(allguild)
	 	 if  xuhuannumber  >10  then
	 	 	 xuhuannumber=10
	 	 end
	 	 for  i  =  1,xuhuannumber  do
	 	 	 if  i  ~=  xuhuannumber  then
	 	 	 	 mystring  =  mystring..allguild[i].Guild.."\n"..allguild[i].Guildnam.."\n"..allguild[i].Guildmenpai.."\n"..allguild[i].Guildlve.."\n"..allguild[i].Guildsex.."\n"..allguild[i].Guildbang.."\n"
	 	 	 else
	 	 	 	 mystring  =  mystring..allguild[i].Guild.."\n"..allguild[i].Guildnam.."\n"..allguild[i].Guildmenpai.."\n"..allguild[i].Guildlve.."\n"..allguild[i].Guildsex.."\n"..allguild[i].Guildbang
	 	 	 end
	 	 end
	 	 
	 	 
	 	 local  Coldfile  =  openfile("./Config/MingRenTang/"..cmp..".txt", "w")
	 	 if  Coldfile  and  nil  ~=  Coldfile  then
	 	 	 if  mystring  ~=  nil  and    mystring  ~= "" then
	 	 	 	 write(Coldfile,  mystring)
	 	 	 	 closefile(Coldfile)
	 	 	 end
	 	 end
	 end	 
end

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 2
--**********************************
function  x014036_MingRenTangCheck(  sceneId,  selfId,  cmp  )

	 local  ret  =  x014036_SetText(sceneId,selfId,cmp  )
	 if  ret  >0  then
	 	 x014036_MsgBox(  sceneId,  selfId,  targetId, "thân thïnh thành công , trß¾c m¡t thân thïnh ðªn ðÑng hàng vì"..ret.."tên" )
	 elseif  ret  ==  -1  then
	 	 x014036_MsgBox(  sceneId,  selfId,  targetId, "ngài trß¾c m¡t ðích ðÑng hàng không có thay ð±i , nh¡c lÕi l¾p mß¶i hÕ thñc lñc tr· lÕi thân thïnh ði" )
	 elseif  ret  ==  -2  then
	 	 x014036_MsgBox(  sceneId,  selfId,  targetId, "ngài thñc lñc trß¾c m¡t còn tß½ng ð¯i kém , nh¡c lÕi l¾p mß¶i hÕ thñc lñc tr· lÕi thân thïnh ði" )
	 elseif  ret  ==  -3  then
	 	 x014036_MsgBox(  sceneId,  selfId,  targetId, "viªt vào vån ki®n sai l¥m , xin liên lÕc GM" )
	 elseif  ret  ==  -4  then
	 	 x014036_MsgBox(  sceneId,  selfId,  targetId, "m· ra vån ki®n sai l¥m , xin liên lÕc GM" )
	 elseif  ret  ==  -5  then
	 	 x014036_MsgBox(  sceneId,  selfId,  targetId, "ðÑng hàng thÑ ð±i m¾i th¤t bÕi , không biªt sai l¥m" )
	 end
	 return  ret
end


--------------------

function  x014036_Coel(  sceneId,  selfId,cmp)
	 	 BeginUICommand(sceneId)
	 	 UICommand_AddInt(sceneId,cmp);
	 	 local  shuzu    =  x014036_readTxt(sceneId,selfId,cmp)
	 	 for  i  =  1,10  do
	 	 	 if  shuzu[i]  ==nil  then  
	 	 	 	 shuzu[i]  =  {Guild=0,Guildnam="không",Guildmenpai=9,Guildlve=0,Guildsex=2,Guildbang="không"}
	 	 	 end
                                                if  shuzu[i].Guildbang  ==  nil  or  shuzu[i].Guildbang  == "không bang phái" or  shuzu[i].Guildbang  == "" then
                                                      shuzu[i].Guildbang  = ""
                                                end
	 	 	 local  mp  =  x014036_g_asdda[  shuzu[i].Guildmenpai+1]
	 	 	 local  xb  =  x014036_g_Sexty[  shuzu[i].Guildsex+1]
	 	         UICommand_AddString(sceneId,shuzu[i].Guild..","..shuzu[i].Guildnam..","..mp..","..shuzu[i].Guildlve..","..xb..","..shuzu[i].Guildbang..","..x014036_g_BaiMing[i]  );
	 	 end
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  20110101  )  
end
----------------------


function  x014036_chazhaoTxt(sceneId,selfId,cmp)
	 local  palyerGUID  =  LuaFnObjId2Guid(sceneId,  selfId  )
	 local  shuzu    =  x014036_readTxt(sceneId,selfId,cmp)
	 if  shuzu[1]  ==  nil  then
	 	 return  shuzu  ,  -1
	 end
	 local  key  =  0
	 for  i=1  ,getn(shuzu)    do
	 	 if  shuzu[i].Guild  ==  palyerGUID  then
	 	 	 key  =  i
	 	 	 return  shuzu,key
	 	 end
	 end
	 
	 return  shuzu  ,  0
end

function  x014036_SetText(sceneId,selfId,cmp  )------- tham s± , 
	 local  pm  =  -5
	 local  palyerGUID  =  LuaFnObjId2Guid(sceneId,selfId)  --- l¤y ðßþc ID
	 local  palyerNam  =  GetName(sceneId,selfId)  --- l¤y ðßþc tên 
	 local  Guildmenpai  =  GetMenPai(sceneId,selfId)    -- môn phái 
	 local  Guildlve  =  GetLevel(sceneId,  selfId)      -- c¤p b§c 
	 local  Guildsex  =  LuaFnGetSex(sceneId,  selfId)    -- gi¾i tính 
	 local  Guildbang  =  LuaFnGetGuildName(sceneId,  selfId)    -- bang phái 
	 if  Guildbang  ==  nil  or  Guildbang  == "" then  
	 	 Guildbang  = "không bang phái"
	 end	 
	 local  allguild,key  =x014036_chazhaoTxt(sceneId,selfId,cmp  )
	 if  key  >  0    then
	 	 allguild[key].Guildlve  =Guildlve
	 	 allguild[key].Guildnam  =  palyerNam
	 	 allguild[key].Guildmenpai  =  Guildmenpai
	 	 allguild[key].Guildbang  =  Guildbang
	 	 
	 	 -----------------------
	 	 for  i  =  1,  getn(allguild)  do
	 	 	 for  j  =  1,  i  do
	 	 	 	 if  allguild[i].Guildlve  >  allguild[j].Guildlve    then
	 	 	 	 	 local  temp  =  allguild[i]
	 	 	 	 	 allguild[i]  =  allguild[j]
	 	 	 	 	 allguild[j]  =  temp
	 	 	 	 end
	 	 	 end
	 	 end
	 	 -----------------------
	 	   
	 	 	 for  i=1,getn(allguild)  do
	 	 	 	 if  allguild[i]~=nil  and  allguild[i].Guild  ==  palyerGUID  then
	 	 	 	 	 pm  =  i  --- ðÑng hàng ð±i m¾i 
	 	 	 	 end
	 	 	 end
	 	 	 
	 	       if  pm  ==key  then  
	 	 	 return  -1  
	               end  
	 elseif  key  ==0  then
	 	 local  paimingNum  =  getn(allguild)
	 	 allguild[paimingNum+1]  =  {Guild=palyerGUID,Guildnam=palyerNam,Guildmenpai=Guildmenpai,Guildlve=Guildlve,Guildsex=Guildsex,Guildbang=Guildbang  }
	 	 ---------------------------
	 	 for  i  =  1,  getn(allguild)  do
	 	 	 for  j  =  1,  i  do
	 	 	 	 if  allguild[i].Guildlve  >  allguild[j].Guildlve    then
	 	 	 	 	 local  temp  =  allguild[i]
	 	 	 	 	 allguild[i]  =  allguild[j]
	 	 	 	 	 allguild[j]  =  temp
	 	 	 	 end
	 	 	 end
	 	 end
	 	 
	 	 for  i=1,getn(allguild)  do
	 	 	 if  allguild[i]  ~=  nil  and  allguild[i].Guild  ==  palyerGUID  then
	 	 	 	 if  i  >  10  then
	 	 	 	 	 return  -2    --- thñc lñc không ðü , vào không t¾i trß¾c mß¶i 
	 	 	 	 else
	 	 	 	 	 pm  =  i
	 	 	 	 end
	 	 	 end
	 	 end
	 	 
	 elseif  key  ==-1  then
	 	 allguild[1]  =  {Guild=palyerGUID,Guildnam=palyerNam,Guildmenpai=Guildmenpai,Guildlve=Guildlve,Guildsex=Guildsex,Guildbang=Guildbang}
	 	 pm  =  1
	 end
	 
	 ---------------------------------
	 local  mystring  = ""
	 local  xuhuannumber  =  getn(allguild)
	 if  xuhuannumber  >10  then
	 	 xuhuannumber=10
	 end
	 
	 
	 for  i  =  1,xuhuannumber  do
	 	 if  i  ~=  xuhuannumber  then
	 	 	 mystring  =  mystring..allguild[i].Guild.."\n"..allguild[i].Guildnam.."\n"..allguild[i].Guildmenpai.."\n"..allguild[i].Guildlve.."\n"..allguild[i].Guildsex.."\n"..allguild[i].Guildbang.."\n"
	 	 else
	 	 	 mystring  =  mystring..allguild[i].Guild.."\n"..allguild[i].Guildnam.."\n"..allguild[i].Guildmenpai.."\n"..allguild[i].Guildlve.."\n"..allguild[i].Guildsex.."\n"..allguild[i].Guildbang
	 	 end
	 end
	 
	   
	 local  	 Coldfile  =  openfile("./Config/MingRenTang/"..cmp..".txt", "w")
	 if  Coldfile  and  nil  ~=  Coldfile  then
	 	 if  mystring  ==  nil  or  mystring  == "" then
	 	 	 return  -3    --- viªt vào vån ki®n sai l¥m 
	 	 end
	 	 write(Coldfile,  mystring)
	 	 closefile(Coldfile)
	 else
	 	 return  -4    --- m· ra vån ki®n sai l¥m 
	 end
	 return  pm  --- tr· v« thành công 
end

function  x014036_readTxt(sceneId,selfId,cmp)	   
	 local  savetxt  =  openfile("./Config/MingRenTang/"..cmp..".txt", "r")	   
	 local  Myall  =  {}
	 if  savetxt  and  nil  ~=  savetxt  then
	 	 for  i=1,  10    do
	 	 	 local  line1=read(savetxt, "*l")    --ID
	 	 	 if  line1==nil  then
	 	 	 	 break
	 	 	 end
	 	 	 
	 	 	 local  line2=read(savetxt, "*l")    -- tên 
	 	 	 if  line2==nil  then
	 	 	 	 break
	 	 	 end
	 	 	 
	 	 	 local  line3=read(savetxt, "*l")    -- môn phái 
	 	 	 if  line2==nil  then
	 	 	 	 break
	 	 	 end
	 	 	 
	 	 	 local  line4=read(savetxt, "*l")    -- c¤p b§c 
	 	 	 if  line2==nil  then
	 	 	 	 break
	 	 	 end
	 	 	 
	 	 	 local  line5=read(savetxt, "*l")    -- gi¾i tính 
	 	 	 if  line2==nil  then
	 	 	 	 break
	 	 	 end
	 	 	 
	 	 	 local  line6=read(savetxt, "*l")    -- bang hµi 
	 	 	 if  line2==nil  then
	 	 	 	 --break
                                                                line6  = ""
	 	 	 end
	 	 	 
	 	 	 Myall[i]  =  {Guild  =  tonumber(line1),Guildnam  =  line2,Guildmenpai  =  tonumber(line3),Guildlve  =  tonumber(line4),Guildsex  =  tonumber(line5),Guildbang  =  line6}  ------- gia nh§p vào ðªm t± lý 
	 	 end
	 	 closefile(savetxt)
	 else
	 	 x014036_Tips(sceneId,selfId,"bän vån không t°n tÕi ho£c m· ra th¤t bÕi")
	 	 return
	 end
	 
	 return  Myall
end



--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x014036_MsgBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

function  x014036_Tips(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId)
end