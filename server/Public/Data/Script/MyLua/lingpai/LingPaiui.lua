-- chân v¯n s¯ 
x880001_g_ScriptId  =  880001
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x880001_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 
	 --SetLevel(  sceneId,  selfId,  119)	 
	 --TryRecieveItem(  sceneId,  selfId,  10158001,  1)
	 --TryRecieveItem(  sceneId,  selfId,  38001018,  1)
	 --TryRecieveItem(  sceneId,  selfId,  38001020,  1)
	 
	 
	 
	 
        local    PlayerName=GetName(sceneId,selfId)	 
	 local    PlayerSex=GetSex(sceneId,selfId)
	 if  PlayerSex  ==  0  then
	 	 PlayerSex  =  " Cô Nß½ng "
	 else
	 	 PlayerSex  =  " Thiªu Hi®p "
	 end
	 BeginEvent(sceneId)
		AddText( sceneId, "#cFF0000Th¥n binh tuy®t thiên hÕ. Linh thÕch huy«n c± kim." )
		AddText( sceneId, "Tuy nói tái hi®n #cff99ffHiên Viên th¥n kiªm #W oai lñc dî nhiên không th¬, nhßng ðÕi hi®p nªu có chút tâm truy tìm #cff99ffBá Vß½ng L®nh Bài,#W ta tñ nhiên l¤y binh tuy®t chi toàn lñc, tß½ng trþ các hÕ, ðã an üi bình sinh." )
		AddText(sceneId,"#RLßu ý: mu¯n dùng chÑc nång tÕi NPC vui lòng gia nh§p Bang phái và phäi có thành Bang m¾i dùng ðßþc ")
	     if GetLevel( sceneId, selfId ) >= 95 then
		AddNumText(sceneId,x880001_g_ScriptId," Nh§n L®nh Bài ",6,0)
	 	 AddNumText(sceneId,x880001_g_ScriptId," Tång c¤p L®nh Bài ",6,1)
	 	 AddNumText(sceneId,x880001_g_ScriptId," Khäm Bäo Châu ",6,2)
	 	 AddNumText(sceneId,x880001_g_ScriptId," Cß¶ng hóa Bäo Châu ",6,3)
	 	 AddNumText(sceneId,x880001_g_ScriptId," Tháo gÞ Bäo Châu ",6,4)
	 	 --ddNumText(sceneId,x880001_g_ScriptId," Phân giäi Bäo Châu ",6,5)
		              else
		AddText(sceneId, "#r    #cFF0000 Các hÕ c¤p b§c #H không ðü  95 c¤p #cFF0000, không th¬ kích hoÕt L®nh Bài, xin häy hãy nâng c¤p trß¾c và phäi vào bang!")
             end
	 	 --AddNumText(sceneId,x880001_g_ScriptId," kÛ nång thiªt ð±i ",6,6)
	 	 --AddNumText(  sceneId,  x880001_g_scriptId,  "  #B kích hoÕt hào hi®p ¤n ",  6,  102)
	 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x880001_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 local  NumText  =  GetNumText();
	 if  NumText  ==  7  then    -- hüy bö 
	 	 BeginUICommand(sceneId)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  1000)
	 elseif  NumText  ==  888  then    -- l®nh bài lên c¤p 	 	 

	 
	 elseif  NumText  ==  889  then
	 	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  19830424  )
	 elseif  NumText  ==  0  then    -- l®nh bài lên c¤p 	 	 
	 	 if  CityGetAttr(sceneId,  selfId,  GUILD_CONTRIB_POINT)  <100  then
	 	 	 x880001_NotifyTips(  sceneId,  selfId,  " Công hiªn bang phái c¥n ðÕt 100 m¾i có th¬ nh§n Vß½ng L®nh "  )  
	 	 	 return
	 	 end	 
	 CityChangeAttr(  sceneId,  selfId,  GUILD_CONTRIB_POINT,  -100  )
      TryRecieveItem(  sceneId,  selfId,  10158001,  1)	 
	 x880001_NotifyTips(  sceneId,  selfId,  " Nh§n Vß½ng L®nh thành công "  )  	 
	 elseif  NumText  ==  1  then    -- l®nh bài lên c¤p 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,  201405041)
	 elseif  NumText  ==  2  then    -- l®nh bài vây quanh 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    201405042)
	 elseif  NumText  ==  3  then    -- bäo châu cß¶ng hóa 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    201405043)	 
	 elseif  NumText  ==  4  then    -- bäo châu tháo xu¯ng 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    201405045)	 	 	 	 
	 elseif  NumText  ==  5  then    -- bäo châu ðánh nát 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    201405044)	 	 	 
	 elseif  NumText  ==  6  then    -- thiªt ð±i 
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  targetId  )
	 	 EndUICommand(  sceneId  )
	 	 DispatchUICommand(  sceneId,  selfId,    201405054)	 	 	 



	 elseif  GetNumText()  ==  102  then
	 	 BeginEvent(  sceneId  )
	 	         AddText(  sceneId,  "#cff99ff kích hoÕt hào hi®p ¤n c¥n hào hi®p huy chß½ng 50 t¶ , sau khi hoàn thành nhßng ðang giä bµ b¸ lan ch² ði¬m kích hào hi®p thång c¤p , m²i thång 1 c¤p c¥n 50 t¶ hào hi®p huy chß½ng , mãn c¤p sau nhßng kích hoÕt kh¯ng chª giäm mi­n , giäm mi­n c¤p b§c tång lên c¥n 20 t¶ hào hi®p huy chß½ng "  )
	 	         AddText(  sceneId,  "#cff99ff ð£c bi®t chú ý : hi®p ¤n mµt khi thång c¤p , không th¬ l¥n næa kích hoÕt , nªu không hªt thäy s¯ li®u ð«u ðßa trä lÕi nhß cû t¾i c¤p mµt hi®p ¤n "  )
	 	 	 AddNumText(  sceneId,  x880001_g_scriptId,  " B¡t ð¥u kích hoÕt ",  6,  1021)
	 	 	 AddNumText(  sceneId,  x880001_g_scriptId,  " Ta c¥n suy nghî ",  9,  7)
	 	 EndEvent(  sceneId  )
	 	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 elseif  GetNumText()  ==  1021  then  
	 	 if    LuaFnGetAvailableItemCount(sceneId,  selfId,  30505078)>=50  then
                      LuaFnDelAvailableItem(sceneId,selfId,30505078,50)-- thü tiêu v§t ph¦m 
	 	       SetMissionData(  sceneId,  selfId,  370  ,  1  )
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  31761,  0)	 -- cho BUFF
	 	           BeginEvent(  sceneId  )  
	 	 	 	 	 strText  =  " ð±i thành công "
	 	 	 	 	 AddText(  sceneId,  strText  )	 	 	 	 	 
	 	 	 	 EndEvent(  sceneId  )
                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	       else
	 	               BeginEvent(  sceneId  )  
	 	 	 	 	 strText  =  " tài li®u ho£c nguyên bäo chßa ðü "
	 	 	 	 	 AddText(  sceneId,  strText  )	 	 	 	 	 
	 	 	 	 EndEvent(  sceneId  )
                              	 DispatchEventList(  sceneId,  selfId,  targetId  )
	 	 	 	 
	 	 	 end  
	 	 	 	 	 
	 	 
	 	 
	 	 
        end
end
  --  RL_SetRs    
--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x880001_NotifyTips(  sceneId,  selfId,  Tip  )
	 if  Tip  ==  nil  or  Tip  ==""  then    return  end
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

x880001_g_Bg  =  {200,300,400,500}

x880001_g_Bz  =  {}    -- bäo châu 
x880001_g_Bz[38001000]={"a"  ,1}  -- máu 
x880001_g_Bz[38001001]={"b"    ,1}  -- lñc 
x880001_g_Bz[38001002]={"c"    ,1}  -- linh 
x880001_g_Bz[38001003]={"d"    ,1}  -- th¬ 
x880001_g_Bz[38001004]={"e"    ,1}  -- ð¸nh 
x880001_g_Bz[38001005]={"f"    ,1}  -- thân 


x880001_g_Bz[38001006]={"g"    ,2}  -- bång 
x880001_g_Bz[38001007]={"h"  ,2}    -- lØa 
x880001_g_Bz[38001008]={"i"    ,2}  -- huy«n 
x880001_g_Bz[38001009]={"j"    ,2}  -- ðµc 
x880001_g_Bz[38001010]={"k"  ,3}    -- bång k
x880001_g_Bz[38001011]={"l"  ,3}    -- lØa k
x880001_g_Bz[38001012]={"m"  ,3}    -- huy«n k
x880001_g_Bz[38001013]={"n"  ,3}    -- ðµc k
x880001_g_Bz[38001014]={"o"  ,4}    -- nµi công 
x880001_g_Bz[38001015]={"p"  ,4}    -- ngoÕi công 
x880001_g_Bz[38001016]={"q"  ,4}    -- bên trong phòng 
x880001_g_Bz[38001017]={"r"  ,4}    -- bên ngoài phòng 
x880001_g_Bz[38001018]={"s",4}  -- m®nh trung 
x880001_g_Bz[38001019]={"t"  ,4}  -- né tránh     







function  x880001_RL_SetRs(  sceneId,  selfId,  idx,arg1,arg2  )
	 if  not  arg1  or  arg1  ==  -1  then      return  end
local  eqidx  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  arg1)
local  itmidx  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  arg2)
if  idx  ==1  then    -- l®nh bài lên c¤p   
	 if  eqidx  ==  10158005  then
	 	 x880001_NotifyTips(  sceneId,  selfId,  " Vß½ng L®nh ðã ðÕt t¾i c¤p ðµ t¯i ða, không th¬ tiªn hành tång c¤p "  )  
	 	 return
	 end
	 if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 5 then 
      x880001_NotifyTips( sceneId, selfId, "B¢ng hæu không ðü  ch² tr¯ng, c¥n chßa ô ðÕo cu và tay näi ít nh¤t 5 ô")
   return
end
local  bg  =  CityGetAttr(sceneId,  selfId,  GUILD_CONTRIB_POINT);    -- l¤y ðßþc nhà ch½i giúp c¯ng 
if  bg  <  x880001_g_Bg[(mod(eqidx,10))]  then  
x880001_NotifyTips(  sceneId,  selfId," C¯ng hiªn th¤p h½n "..(x880001_g_Bg[(mod(eqidx,10))]).." không th¬ tiªn c¤p "  )	 
return
end	 
CityChangeAttr(  sceneId,  selfId,  GUILD_CONTRIB_POINT,  -1*(x880001_g_Bg[(mod(eqidx,10))])  )
local  pos  =  TryRecieveItem(  sceneId,  selfId,  eqidx+1,  1)
local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)	 	 
LuaFnEraseItem(  sceneId,  selfId,  arg1)	 
x880001_NotifyTips(  sceneId,  selfId,  " Thång c¤p thành công "  )	 
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,18,  0)
local  str  =  format(  "#ccc33cc Chúc m×ng ".."#{_INFOUSR%s}#c66ccff ðã hao t¯n %d c¯ng hiªn bang thång c¤p Vß½ng L®nh thành #{_INFOMSG%s3}#H",  GetName(sceneId,selfId),tonumber(x880001_g_Bg[(mod(eqidx,10))]),transfer  )
BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
end


if  idx  ==2  then      -- vây quanh bäo châu 
local  _,Lingpai  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)  
if  Lingpai  ==  nil  then  Lingpai  =  ""  end  
local  _,Lingpai  =  strfind(Lingpai,"LP")
local  bq  =0
if  Lingpai  ~=nil  then
bq  =  1  
else
bq  =  0  
end	 

local  strLP  =""
if  bq  ==  0  then    --- vây quanh vì   4*2  =  8  phát tri¬n   3  =  6  b¸ ðµng   2      vì 16 cá 
strLP  =  "LP"..strrep(  "0",  16  )
else
_,  strLP  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)  
end



local  m,n,b  ,d1,d2,d3  =x880001_LPXQ(sceneId,selfId,strLP)
  if  m  <1  then  return  end  
	 	   local  skilx,skilz  =  strfind(n,"00")  
	 	   if  skilx  ==  nil  or  skilz  ==  nil  then
	 	   x880001_NotifyTips(  sceneId,  selfId,  " Không th¬ khäm Bäo Châu "  )
	           return
	           end  
	 	 
	   local  skilx,skilz  =  strfind(n,x880001_g_Bz[itmidx][1])  
	   if  skilx  ~=  nil  or  skilz  ~=  nil  then
	 	 x880001_NotifyTips(  sceneId,  selfId,  " Ðã khäm loÕi bäo thÕch này, không th¬ khäm lÕi ")      -- vây quanh   2  3  4    chia ra   kích hoÕt phát tri¬n   ðích 1  2  3
	   return
	   end
    
    local  ss,xx,z1,z2,z3,z4=  strfind(n,"(%w%w)(%w%w)(%w%w)(%w%w)")    

if  ss  ~=nil  and  xx  ~=nil  then  
	 if  z1  =="00"      then  
	     if  (itmidx  <38001000  or  itmidx  >38001005)	   then
	 	 x880001_NotifyTips(  sceneId,  selfId,  " L² 1 chï có th¬ khäm Chu Tß¾c ")  
	 	 return
	     end
	 elseif  z2  =="00"      then  
	     if  (itmidx  <38001006  or  itmidx  >38001009)	   then
	 	 x880001_NotifyTips(  sceneId,  selfId,  "  L² 2 chï có th¬ khäm Thanh Long ")  
	 	 return
	     end
	 elseif  z3  =="00"      then  
	     if  (itmidx  <38001010  or  itmidx  >38001013)	   then
	 	 x880001_NotifyTips(  sceneId,  selfId,  " L² 3 chï có th¬ khäm Huy«n Vû ")  
	 	 return
	 end
	 elseif  z4  =="00"      then  
	     if  (itmidx  <38001014  or  itmidx  >38001019)	   then
	 	 x880001_NotifyTips(  sceneId,  selfId,  " L² 4 chï có th¬ khäm BÕch H± ")  
	 	 return
	 end	 
	 

	 end
	 
	 


end
	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  100000  then
x880001_NotifyTips(  sceneId,  selfId,    "#G Vàng không ðü! "  )
return
end

	 local  tihuanhstr  =  gsub(n,"00",x880001_g_Bz[itmidx][1].."1",1)  
        if  tihuanhstr  ~=  nil    then
              local  friendName  =gsub(strLP,"LP"..n,"LP"..tihuanhstr,1);

	 	 if  tonumber(d1)  >0  then  
	 	 friendName  =gsub(friendName,"(LP"..strrep("%w",8)..")%d%d("..strrep("%w",6)..")","%1"..("a1").."%2")
	 	 end
	 	 if  	 tonumber(d2)  >0  then
	 	 friendName  =gsub(friendName,"(LP"..strrep("%w",10)..")%d%d("..strrep("%w",4)..")","%1"..("d1").."%2")
	 	 end
	 	 if  	 tonumber(d3)  >0  then
	 	 friendName  =gsub(friendName,"(LP"..strrep("%w",12)..")%d%d("..strrep("%w",2)..")","%1"..("s1").."%2")	 
	 	 
	 	 
	 	 friendName  =gsub(friendName,"(LP"..strrep("%w",14)..")%d%d("..strrep("%w",0)..")","%1"..("u1").."%2")	 
	 	 end
	 	 LuaFnCostMoneyWithPriority(  sceneId,  selfId,  100000  );
	 	 LuaFnSetItemCreator(  sceneId,  selfId,  arg1,  friendName  )
	 	 LuaFnRefreshItemInfo(  sceneId,  selfId,  arg1  )
	 	 LuaFnEraseItem(  sceneId,  selfId,  arg2)
	 	 
	 	 x880001_NotifyTips(  sceneId,  selfId,  " Khäm thành công "  )
	 end  
end



if  idx  ==3  then  -- cß¶ng hóa 
local  _,Lingpai1  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)  
if  Lingpai1  ==  nil  then  Lingpai1  =  ""  end  
local  _,Lingpai  =  strfind(Lingpai1,"LP")
local  bq  =0
if  Lingpai  ~=nil  then
bq  =  1  
else
bq  =  0  
end	 

local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  100000  then
x880001_NotifyTips(  sceneId,  selfId,    "#G Vàng không ðü ! "  )
return
end
	 
if  bq  ==0  then  return  end    -- không biªt sai l¥m   
	 	 
if  bq  ==  1  then	 
local  a,b,c,d  =  x880001_LPQXX(sceneId,selfId,Lingpai1)	 
local  sun
if  arg2  ==  0  then  
if  a  >8  then  
x880001_NotifyTips(  sceneId,  selfId,  " Ðü "  )	 
return
end

if    LuaFnGetAvailableItemCount(sceneId,  selfId,  38001021)  <  1*a      then
x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*a).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )	 
return
end	 

if  LuaFnDelAvailableItem(sceneId,  selfId,  38001021,  1*a)  ==  0  then
x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*a).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )
return
end

sun  =  a  +1
friendName  =gsub(Lingpai1,"(LP"..strrep("%w",1)..")%d("..strrep("%w",14)..")","%1"..(sun).."%2")	 
elseif  arg2  ==  1  then  
if    b  >8    then  
x880001_NotifyTips(  sceneId,  selfId,  " Ðü "  )	 
return
end
if    LuaFnGetAvailableItemCount(sceneId,  selfId,  38001021)  <  1*b      then
x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*b).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )	 
return
end	 
if  LuaFnDelAvailableItem(sceneId,  selfId,  38001021,  1*b)  ==  0  then
  x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*b).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )
  return
end
sun  =  b  +1	 
friendName  =gsub(Lingpai1,"(LP"..strrep("%w",3)..")%d("..strrep("%w",12)..")","%1"..(sun).."%2")	 	 
elseif  arg2  ==  2  then
if  c  >8  then  
x880001_NotifyTips(  sceneId,  selfId,  " Ðü "  )	 
return
end
if    LuaFnGetAvailableItemCount(sceneId,  selfId,  38001021)  <  1*c      then
x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*c).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )	 
return
end	 
  if  LuaFnDelAvailableItem(sceneId,  selfId,  38001021,  1*c)  ==  0  then
  x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*c).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )
return
end
sun  =  c  +1	 
friendName  =gsub(Lingpai1,"(LP"..strrep("%w",5)..")%d("..strrep("%w",10)..")","%1"..(sun).."%2")	 	 
elseif  arg2  ==  3  then
if  d  >  8  then  
x880001_NotifyTips(  sceneId,  selfId,  " ð¥y "  )	 
return
end
if    LuaFnGetAvailableItemCount(sceneId,  selfId,  38001021)  <  1*d      then
x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*d).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )	 
return
end	   
if  LuaFnDelAvailableItem(sceneId,  selfId,  38001021,  1*d)  ==  0  then
x880001_NotifyTips(  sceneId,  selfId,  " Nhà ngß½i phäi có "..(1*d).." Phï Thúy Tâm Tinh ta m¾i có th¬ giúp ngày thång c¤p "  )
return
end
sun  =  d  +1	 
friendName  =gsub(Lingpai1,"(LP"..strrep("%w",7)..")%d("..strrep("%w",8)..")","%1"..(sun).."%2")	 	 
end	 
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  100000  );
LuaFnSetItemCreator(  sceneId,  selfId,  arg1,  friendName  )
LuaFnRefreshItemInfo(  sceneId,  selfId,  arg1  )
x880001_NotifyTips(  sceneId,  selfId,  " cß¶ng hóa thành công "  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,18,  0)
end	 
	 
	 
end

if  idx  ==  4  then    -- tháo xu¯ng 
local  _,Lingpai1  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)  
if  Lingpai1  ==  nil  then  Lingpai1  =  ""  end  
local  _,Lingpai  =  strfind(Lingpai1,"LP")
local  bq  =0
if  Lingpai  ~=nil  then
bq  =  1  
else
bq  =  0  
end	 


local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  100000  then
x880001_NotifyTips(  sceneId,  selfId,    "#G Vàng không ðü ! "  )
return
end





	 
if  bq  ==0  then  return  end    -- không biªt sai l¥m   	 
if  bq  ==  1  then	 
local  a,b,c,d  =  x880001_LPQXX(sceneId,selfId,Lingpai1)

local  sun
if  arg2  ==  0  then  
if  a  <1    then
return
end	   


BeginAddItem(sceneId)
AddItem(  sceneId,38001021,  a*2  )  
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId)  


friendName  =gsub(Lingpai1,"(LP"..strrep("%w",0)..")%w%d("..strrep("%w",14)..")","%1"..("00").."%2")	 
elseif  arg2  ==  1  then  
if    b  <1    then
	 return
end	   
BeginAddItem(sceneId)
AddItem(  sceneId,38001021,  b*2  )  
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId)  
friendName  =gsub(Lingpai1,"(LP"..strrep("%w",2)..")%w%d("..strrep("%w",12)..")","%1"..("00").."%2")
elseif  arg2  ==  2  then
if  c  <1  then  	 
return
end
BeginAddItem(sceneId)
AddItem(  sceneId,38001021,  c*2  )  
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId)  

friendName  =gsub(Lingpai1,"(LP"..strrep("%w",4)..")%w%d("..strrep("%w",10)..")","%1"..("00").."%2")	 
elseif  arg2  ==  3  then
if  d  <  1  then  	 
return
end  
BeginAddItem(sceneId)
AddItem(  sceneId,38001021,  d*2  )  
EndAddItem(sceneId,selfId)
AddItemListToHuman(sceneId,selfId)  
friendName  =gsub(Lingpai1,"(LP"..strrep("%w",6)..")%w%d("..strrep("%w",8)..")","%1"..("00").."%2")	 
end	 
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  100000  );
LuaFnSetItemCreator(  sceneId,  selfId,  arg1,  friendName  )
LuaFnRefreshItemInfo(  sceneId,  selfId,  arg1  )
x880001_NotifyTips(  sceneId,  selfId,  " Tháo gÞ thành công "  )
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,18,  0)
end	 

end	 










	 
if  idx  ==  6  then      -- ðánh nát 
	 if  eqidx  <1  then  
	 	 return
	 end
	 
local  transfer1  =  GetBagItemTransfer(sceneId,selfId,arg1)	 
LuaFnEraseItem(  sceneId,  selfId,  arg1)	 
local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
local  nMoneyJB  =  GetMoney(sceneId,selfId)
local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
if  nMoneySelf  <  100000  then
x880001_NotifyTips(  sceneId,  selfId,    "#G Vàng không ðü ! "  )
return
end
TryRecieveItem(  sceneId,  selfId,38001021,  1)
local  pos  =  TryRecieveItem(  sceneId,  selfId,38001021,  1)
local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)	 	 
LuaFnEraseItem(  sceneId,  selfId,  arg1)	 
LuaFnCostMoneyWithPriority(  sceneId,  selfId,  100000  );
x880001_NotifyTips(  sceneId,  selfId,  " Phân giäi thành công "  )	 
LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,18,  0)
local  str  =  format(  "#ccc33cc Chúc m×ng ".."#{_INFOUSR%s}#c66ccff ðã ðem #{_INFOMSG%s1} phân giäi thành #{_INFOMSG%s2}#H",  GetName(sceneId,selfId),transfer1,transfer  )
BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
end






end  

function  x880001_LPXQ(sceneId,selfId,arg1)
--local  _,lpstring  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)
if  arg1  ==  nil  then  
return  0
end	 
local  long  =          strlen(arg1)
local  skilx,skilz  =  strfind(arg1,"LP")
if  skilx  ==  nil  or  skilz  ==  nil  then
return  0
end

local  skilstring1  =  strsub(arg1,skilz+1,skilz+8)    --"LP  00  00  00  00  00  "  4  6  
local  skilstring2  =  strsub(arg1,skilz+8,skilz+8)    -- cu¯i cùng 
local  skilstring3  =  strsub(arg1,skilz+2,skilz+2)  
local  skilstring4  =  strsub(arg1,skilz+4,skilz+4)  
local  skilstring5  =  strsub(arg1,skilz+6,skilz+6)  

if  skilstring1  ==  nil  then
return  0
end

if  skilstring2  ==nil  then  
skilstring2  =0  
end	 
return  1  ,  skilstring1,skilstring2,skilstring3,skilstring4,skilstring5
end


function  x880001_LPQXX(sceneId,selfId,arg1)
--local  _,lpstring  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)
if  arg1  ==  nil  then  
return  0
end	 
local  long  =          strlen(arg1)
local  skilx,skilz  =  strfind(arg1,"LP")
if  skilx  ==  nil  or  skilz  ==  nil  then
return  0
end

local  skilstring1  =  strsub(arg1,skilz+2,skilz+2)
local  skilstring2  =  strsub(arg1,skilz+4,skilz+4)
local  skilstring3  =  strsub(arg1,skilz+6,skilz+6)  
local  skilstring4  =  strsub(arg1,skilz+8,skilz+8)  
if  skilstring1  ==  nil  then
return  0
end

if  skilstring2  ==nil  then  
skilstring2  =0  
end	 
if  skilstring3  ==nil  then  
skilstring3  =0  
end	 
if  skilstring4  ==nil  then  
skilstring4  =0  
end	 
return  tonumber(  skilstring1),tonumber(skilstring2),tonumber(skilstring3),tonumber(skilstring4)
end



-- cái này viªt cho ði«u døng buff  

function  x880001_LPQBUFF(sceneId,selfId,arg1)
local  _,lpstring  =  LuaFnGetItemCreator(sceneId,  selfId,  arg1)
if  lpstring  ==  nil  then  
return  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
end	 

local  skilx,skilz  =  strfind(lpstring,"LP")
if  skilx  ==  nil  or  skilz  ==  nil  then
return  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
end






local  a  =  strsub(lpstring,skilz+1,skilz+1)
local  a1  =  strsub(lpstring,skilz+2,skilz+2)    --1
local  b  =  strsub(lpstring,skilz+3,skilz+3)
local  b1  =  strsub(lpstring,skilz+4,skilz+4)    --2
local  c  =  strsub(lpstring,skilz+5,skilz+5)
local  c1  =  strsub(lpstring,skilz+6,skilz+6)    --3
local  d  =  strsub(lpstring,skilz+7,skilz+7)
local  d1  =  strsub(lpstring,skilz+8,skilz+8)    --  4
---------------- tr· lên vì 4 cá bäo châu ðích tin tÑc 
local  e  =  strsub(lpstring,skilz+9,skilz+9)
local  f  =  strsub(lpstring,skilz+11,skilz+11)    --  4
local  g  =  strsub(lpstring,skilz+13,skilz+13)    --  4
------------------- tr· lên là phát tri¬n xúc phát tin tÑc   cam ch¸u   5 c¤p 
local  h  =  strsub(lpstring,skilz+15,skilz+15)    --  4
--------------- tr· lên là cái này   tß½ng ð¯i ð£c thù nªu nhß không phäi là 0  s¨ phäi cån cÑ môn phái cho buff  li­u 
return  tonumber(  a1),tonumber(b1),tonumber(c1),tonumber(d1),a,b,c,d,e,f,g,h
--- tr· v«     4 cá hÕt châu ðích c¤p b§c       sau ðó c¥n tr· v« hÕt châu loÕi hình     
end




