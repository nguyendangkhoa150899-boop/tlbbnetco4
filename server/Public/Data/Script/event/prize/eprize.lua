-- dçn CD-KEY? tu¥n tra ði¬m ðªm ? mua nguyên bäo 

x888899_g_scriptId  =  PRIZE_SCRIPT_ID

x888899_g_prizeGems  =  {
50101001,
50101002,
50102001,
50102002,
50102003,
50102004,
50103001,
50104002,
50111001,
50111002,
50112001,
50112002,
50112003,
50112004,
50113001,
50113002,
50113003,
50113004,
50113005,
50114001
};



--**********************************
--  ki¬m tra   CDKey
--**********************************
function  x888899_AskCDKey(  sceneId,  selfId  )
	 GetCharPrize(  sceneId,  selfId,  1,  980,0,0  )	 	 	 	 	 -- dçn CD-KEY  (980 là CD-KEY · Billing ðích v§t ph¦m loÕi hình )
end

--**********************************
--  ki¬m tra   tài phú tÕp 
--**********************************
function  x888899_AskNewUserCard(  sceneId,  selfId,  card,  op)
	 NewUserCard(  sceneId,  selfId,  card,  op)	 	 	 	 	 	 	 	 	 -- dçn tài phú tÕp / th¬ døc cÕnh ðoán tÕp   (card là tÕp s¯ tñ phù chu²i )
end

--**********************************
--  mua   nguyên bäo 
--**********************************
function  x888899_AskYuanBao(  sceneId,  selfId,  nYuanBao,  nPoint  )
	 GetCharPrize(sceneId,selfId,3,999,nYuanBao,nPoint);	 -- mua nYuanBao cá cµng nPoint ði¬m ðích nguyên bäo 
end

--**********************************
--  tu¥n tra   ði¬m ðªm 
--**********************************
function  x888899_AskPoint(  sceneId,  selfId  )
	 GetCharPrize(sceneId,selfId,2,0,0,0);	 	 	 	 	 	 	 	 -- tu¥n tra nhân v§t ði¬m ðªm 
end

--**********************************
--  rút ra tß·ng 
--**********************************
function  x888899_AskPrize(  sceneId,  selfId  )
	 GetCharPrize(sceneId,selfId,6,0,0,0);	 	 	 	 	 	 	 	 -- trß¾c tu¥n tra nhân v§t ph¥n thß·ng 
end

--**********************************
--  ki¬m tra   CDKey  ðích tr· v« tr· v« ði«u hàm s¯ 
--  ntype  xin/m¶i tham khäo   enum  PRIZE_TYPE_ENUM
--**********************************
function  x888899_PrizeRet(  sceneId,  selfId,  ntype,  nserial,  num  )
--	 khác , n½i này không có   targetId , không biªt viªt   -1  có th¬ hay không có v¤n ð« 
	 local  targetId  =  -1

	 --CD-KEY
	 if(  1  ==  ntype  )  then
	 	 SetMissionFlag(  sceneId,  selfId,  MF_GetAwardFlag,  1  )
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i ðã thành công kích hoÕt ngß½i dçn tß·ng ði«u ki®n , ngß½i có th¬ ðªn ta ch² này t¾i nh§n l¤y tß·ng thß·ng v§t ph¦m . "  )
	 -- tài phú tÕp 
	 elseif(  3  ==  ntype  )  then  -- bö hoang ( hÕt tØ chú )
	 	 --SetMissionFlag(  sceneId,  selfId,  MF_ActiveNewUserCard,  1  )
	 	 --x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        chúc m×ng ! ngß½i ðã thành công kh·i ðµng tài phú tÕp , t¾i nh¤t ð¸nh c¤p b§c sau có th¬ ðªn l¾n lý cûng säng khoái vô cùng (157,164) ch² nh§n l¤y tß·ng thß·ng . "  )
	 -- nguyên bäo 
	 elseif(  4  ==  ntype  )  then
	 	 YuanBao(sceneId,selfId,-1,1,nserial*num)
	 -- v§t ph¦m 
	 elseif(  5  ==  ntype  )  then
	 	 LuaFnBeginAddItem(  sceneId  )
	 	 	 LuaFnAddItem(  sceneId,  nserial,  num)
	 	 local  ret  =  LuaFnEndAddItem(  sceneId,  selfId  )
	 	 if  1  ==  ret  then
	 	 	 AddItemListToHuman(sceneId,selfId)
	 	 	 -- th¥n ð¸ch mµt ngß¶i ch½i chï có th¬ tham gia mµt l¥n hoÕt ðµng 
	 	 	 if(  nserial  ==  30309052  )  then
	 	 	 	 SetMissionFlag(  sceneId,  selfId,  MF_ActiveWenZhouCard,  1  )
	 	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  "@*;SrvMsg;DBD: chúc m×ng các hÕ thành công nh§n l¤y hoÕt ðµng tß·ng thß·ng , xin/m¶i tra thu ",  0);
	 	 	 end
	 	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  " v§t ph¦m ð±i l¤y thành công ! cäm tÕ các hÕ ð¯i v¾i « Thiên long bát bµ » ðích üng hµ ! "  )
	 	 end
	 -- th¬ døc cÕnh ðoán tÕp 
	 elseif(  6  ==  ntype  )  then
	 	 local  prizeItem  =  x888899_GetSportsPrize()
	 	 if  prizeItem  then
	 	 	 LuaFnBeginAddItem(  sceneId  )
	 	 	 	 LuaFnAddItem(  sceneId,  prizeItem,  1)
	 	 	 local  ret  =  LuaFnEndAddItem(  sceneId,  selfId  )
	 	 	 if  1  ==  ret  then
	 	 	 	 AddItemListToHuman(sceneId,selfId)
	 	 	 	 SetMissionFlag(  sceneId,  selfId,  MF_ActiveSportsCard,  1  )
	 	 	 	 --x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        chúc m×ng các hÕ thành công nh§n l¤y hoÕt ðµng tß·ng thß·ng , xin/m¶i tra thu . "  )
	 	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  "@*;SrvMsg;DBD: chúc m×ng các hÕ thành công nh§n l¤y hoÕt ðµng tß·ng thß·ng , xin/m¶i tra thu ",  0);
	 	 	 end
	 	 end
	 -- lß¾i tø hoÕt ðµng tÕp 
	 elseif(  7  ==  ntype  )  then
	 	 LuaFnBeginAddItem(  sceneId  )
	 	 LuaFnAddItem(  sceneId,  30505108,  1  )
	 	 local  ret  =  LuaFnEndAddItem(  sceneId,  selfId  )
	 	 if  1  ==  ret  then
	 	 	 AddItemListToHuman(  sceneId,  selfId  )
	 	 	 SetMissionFlag(  sceneId,  selfId,  MF_ActiveJuCard,  1  )
	 	 	 BroadMsgByChatPipe(sceneId,  selfId,  "@*;SrvMsg;DBD: chúc m×ng các hÕ thành công nh§n l¤y hoÕt ðµng tß·ng thß·ng , xin/m¶i tra thu ",  0);
	 	 end
	 	 
	 elseif(  8  ==  ntype  )  then	 
	 	 SetMissionFlag(  sceneId,  selfId,  MF_ActiveNewUserCard666,  1  )
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        chúc m×ng ! ngß½i ðã thành công kh·i ðµng siêu c¤p lñc mÕnh tÕp , t¾i nh¤t ð¸nh c¤p b§c sau có th¬ ðªn l¾n lý cûng säng khoái vô cùng (157,164) ch² nh§n l¤y tß·ng thß·ng . "  )
	 end

	 return
end

--**********************************
--  rút ra tß·ng sau khi thành công cho ngß¶i ch½i ð« kÏ tin tÑc 
--**********************************
function  x888899_PrizeRetEnd(  sceneId,  selfId,  retId  )
	 if  retId  and  retId  ==  15  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        chúc m×ng các hÕ thành công nh§n l¤y hoÕt ðµng tß·ng thß·ng , xin/m¶i tra thu . "  )
	 elseif(  retId  ==  12  )  then
	     x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        chúc m×ng các hÕ thành công nh§n l¤y hoÕt ðµng tß·ng thß·ng , xin/m¶i tra thu . "  )
	 end
end

--**********************************
--  tay m¾i tÕp ho£c th¬ døc rút ra tß·ng tÕp ki¬m tra 
--**********************************
function  x888899_OpenCard(sceneId,selfId,card)
	 if  nil  ==  card  then  return  end
	 --PrintStr(card)
	 local  targetId  =  -1
	 local  firstbyte  =  strbyte(card)
	 --'k'  th¬ døc tÕp 
	 if  107  ==  firstbyte  then
	 	 if  GetMissionFlag(  sceneId,  selfId,  MF_ActiveSportsCard  )  ==  1  then
	 	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i ðã nh§n l¤y quá hoÕt ðµng tß·ng thß·ng , không th¬ tái di­n nh§n l¤y . "  )
	 	 	 return
	 	 end
	 --'t'  tay m¾i tÕp 
	 elseif  116  ==  firstbyte  or  115  ==  firstbyte  then
	 	 if  GetMissionFlag(  sceneId,  selfId,  MF_ActiveNewUserCard  )  ==  1  then
	 	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i ðã kích s¯ng quá tài phú tÕp , không cách nào l¥n næa kích hoÕt nh§n l¤y ði«u ki®n . "  )
	 	 	 return
	 	 end
	 elseif  99  ==  firstbyte  then
	 	 if  GetMissionFlag(  sceneId,  selfId,  MF_ActiveNewUserCard666  )  ==  1  then
	 	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i ðã kh·i ðµng quá siêu c¤p lñc mÕnh tÕp , không cách nào l¥n næa kh·i ðµng nh§n l¤y ði«u ki®n . "  )
	 	 	 return
	 	 end
	 end
	 
	 x888899_AskNewUserCard(  sceneId,  selfId,  card,  0)
end

--**********************************
--  mua   nguyên bäo   ðích tr· v« tr· v« ði«u hàm s¯ 
--  ntype  xin/m¶i tham khäo   enum  PRIZE_TYPE_ENUM
--  1  ðÕi bi¬u   OPT_YUANBAO_ADD  gia tång nguyên bäo 
--**********************************
function  x888899_BuyRet(  sceneId,  selfId,  ntype,  nYuanBao,  nLeftPoint  )
--	 khác , n½i này không có   targetId , không biªt viªt   -1  có th¬ hay không có v¤n ð« 
	 local  targetId  =  -1

	 if(  2  ==  ntype  )  then
	 	 if  nYuanBao  ==  0  then
	 	 	 return
	 	 end
                                if  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_ZENGD)  <=  0  then
                                      TryRecieveItem(  sceneId,selfId,30009099,  1)-- phát thü sung tß·ng thß·ng 
                                end
	 YuanBao(sceneId,selfId,targetId,1,nYuanBao)
	 SetMissionData(  sceneId,  selfId,  CHONG_ZHI_ZENGD,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_ZENGD)+nYuanBao/2)	 
        local  g_Pointt  =  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)	 
        local  g_Poina  =  GetMissionData(  sceneId,  selfId,  CHONG_ZHI_ZENGD)	 
      if  g_Poina  >=500000    and  g_Pointt<1  then
        SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)+1)                          --- viªt phân tích   10/1
	 end
	     if  g_Poina  >=1000000    and  g_Pointt<2  then	 
        	 	 SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)+1)    --100/2
	   end	 	 
	 if	   g_Poina  >=3000000    and  g_Pointt<3  then	 
        	 	 SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)+1)	 --500/3
	 end	 	 
	 if	   g_Poina  >=5000000    and  g_Pointt<4  then	 
        SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)+1)	 --1000/4
	 end
	 if	   g_Poina  >=10000000    and  g_Pointt<5  then	 
              SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)+1)	   --1500/5
	 end	 
	 if	   g_Poina  >=20000000  and  g_Pointt<6  then	             -- chú ý   cái này là hÕn lúc ðích   
              SetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU,GetMissionData(  sceneId,  selfId,  CHONG_ZHI_CHONGSHU)+1)    --  2000/6	 
	 end	 
	 	 BuyYuanBaoCount(sceneId,selfId,targetId,1,nYuanBao)
	 	 x888899_NotifyLeftPoint(sceneId,selfId,nLeftPoint)
	 	 
	 	 -- cho khách hàng bßng ð« kÏ tin tÑc 
	 	 local  strText  =  ""
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " các hÕ thành công ð±i "..tostring(nYuanBao).." ði¬m nguyên bäo . "
	 	 	 AddText(sceneId,strText)
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 
	 	 LuaFnMsg2Player(  sceneId,  selfId,strText,MSG2PLAYER_PARA)
                          -- th¤p h½n 10 nguyên không h½n ti vi 
                          if  nYuanBao  >=  10  then
                                BroadMsgByChatPipe(  sceneId,  selfId,  "#e0000ff#H Chúc m×ng ngß¶i ch½i #cFF0000 "..LuaFnGetName(  sceneId,  selfId  ).." #e0000ff#Hðã chuy¬n "..nYuanBao.." BÕc thành công, ð±i  ðßþc "..(nYuanBao*1).." Kim Nguyên Bäo, ðªn n±i sáng chói cä mµt vùng tr¶i! Th§t ðúng là ðÕi phú gia có khác ! ",  4  )	 	 
                          end
	 	 x888899_LogForDuiHuanYuanBao(sceneId, selfId,nYuanBao,nYuanBao)
	        local mylevel = floor( GetMissionData(sceneId, selfId, CHONG_ZHI_ZENGD))
	        x888899_SetDengji(sceneId,selfId,mylevel,1)
	 
	 
	 	               local  allfirstplayer  =  GetPaiming(sceneId,1)
	                 	   local  nMonsterNum  =  GetMonsterCount(sceneId)
	                   for  i=0,  nMonsterNum-1  do
	 	 	 	 local  MonsterId  =  GetMonsterObjID(sceneId,i)
	 	 	 	 local  MosDataID  =  GetMonsterDataID(sceneId,  MonsterId  )
	 	 	 	 if  MosDataID  ==  43545  then
	 	 	 	   SetCharacterName(sceneId,MonsterId,"#G"..allfirstplayer[1].Guid)
	 	                 end
	                 end	 	 
	 	 	 
                                -- hÕt tØ gia nh§p phän khoán bµ ph§n 
                                local  FanquanCheck  =  GetMissionData(sceneId,selfId,MF_ActiveNewUserCard)
                                local  fanquanNUM  =  floor(GetMissionData(sceneId,selfId,CHONG_ZHI_ZENGD))
                                if  FanquanCheck  <  10^9  then
                                      SetMissionData(sceneId,selfId,MF_ActiveNewUserCard,10^9+fanquanNUM)
                                else
                                      SetMissionData(sceneId,selfId,MF_ActiveNewUserCard,FanquanCheck+nYuanBao*10)

                                end
	 	 
------------------
	 end
	 return	 
end

function  x888899_SetDengji(sceneId,selfId,mylevel,key)
if  mylevel  <=  0  then
return
end
local  asdda  =  {"Thiªu Lâm","Minh Giáo","Cái Bang","Võ Ðß½ng","Nga Mi","Tinh Túc","Thiên Long","Thiên S½n","Tiêu Dao","Không phái","Mµ Dung","Ðß¶ng Môn","QuÖ C¯c"}
local  xiezi  =  {"Næ","Nam"}
local  allfirstplayer  =  GetPaiming(sceneId,key)
local  myid  =  LuaFnObjId2Guid(sceneId,selfId)
local  myguid  =  GetName(sceneId,selfId)
local  menp  =  GetMenPai(sceneId,  selfId)
local  sex  =  GetSex(sceneId,selfId)
local  numberid  =  0
if  getn(allfirstplayer)  >  0  then
for  i  =  1,getn(allfirstplayer)  do
if  tonumber(allfirstplayer[i].ID)  ==  tonumber(myid)  and  numberid  ==  0  then
numberid  =  i
allfirstplayer[i]  =  {ID  =  myid,Guid  =myguid,mynowLevel  =  mylevel,mymenpai=asdda[menp+1],mysex=xiezi[sex+1]}
break
end
end
end

if  numberid  ==  0  then
allfirstplayer[getn(allfirstplayer)+1]  =  {ID  =  myid,Guid  =myguid,mynowLevel  =  mylevel,mymenpai=asdda[menp+1],mysex=xiezi[sex+1]}
end
allfirstplayer  =  Getpaimincc(sceneId,allfirstplayer)
local  mystring  =  ""
local  xuhuannumber  =  getn(allfirstplayer)
numberid  =  0
if  getn(allfirstplayer)  >  0  then
if  xuhuannumber  >  10  then
xuhuannumber  =  10
end
for  i  =  1,xuhuannumber  do
if  i  ~=  xuhuannumber  then
mystring  =  mystring..  allfirstplayer[i].ID  .."\n"..  allfirstplayer[i].Guid  .."\n"..  allfirstplayer[i].mynowLevel.."\n"..  allfirstplayer[i].mymenpai.."\n"..  allfirstplayer[i].mysex.."\n"
else
mystring  =  mystring..  allfirstplayer[i].ID  .."\n"..  allfirstplayer[i].Guid  .."\n"..  allfirstplayer[i].mynowLevel.."\n"..  allfirstplayer[i].mymenpai.."\n"..  allfirstplayer[i].mysex
end
end
end
SetPaiming(sceneId,key,mystring)
end

	 
--**********************************
--  tu¥n tra ði¬m ðªm   ðích tr· v« tr· v« ði«u hàm s¯ 
--**********************************
function  x888899_PointRet(  sceneId,  selfId,  nLeftPoint  )
	 x888899_NotifyLeftPoint(sceneId,selfId,nLeftPoint)
end

--**********************************
--  ki¬m tra ph¥n thß·ng   b¡t ð¥u ðích tr· v« ði«u hàm s¯ 
--**********************************
function  x888899_CheckRetBegin(sceneId,selfId)
	 LuaFnBeginAddItem(  sceneId  )
end
--**********************************
--  ki¬m tra ph¥n thß·ng   tång thêm ki¬m tra v§t ph¦m ðích tr· v« ði«u hàm s¯ 
--**********************************
function  x888899_CheckAddItem(sceneId,selfId,itemid,num)
	 LuaFnAddItem(  sceneId,  itemid,  num)
end

--**********************************
--  ki¬m tra ph¥n thß·ng   kªt thúc ðích tr· v« ði«u hàm s¯ 
--**********************************
function  x888899_CheckRetEnd(sceneId,selfId)
	 local  ret  =  LuaFnEndAddItem(  sceneId,  selfId  )
	 if  1  ==  ret  then
	 	 -- ki¬m tra thành công , b¡t ð¥u rút ra tß·ng 
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        ki¬m tra thành công , xin ch¶ mµt chút …… ðang nh§n l¤y ph¥n thß·ng . "  )
	 	 GetCharPrize(sceneId,selfId,4,0,0,0);	 	 -- tu¥n tra nhân v§t bây gi¶ có ðßþc ðích ph¥n thß·ng 
	 else
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        th§t xin l²i , các hÕ không có ð¥y ðü v§t ph¦m lan không gian , xin/m¶i sØa sang lÕi sau tr· lÕi nh§n l¤y . "  )
	 end
end

--**********************************
--  thë ki¬m tra ph¥n thß·ng   kªt thúc ðích tr· v« ði«u hàm s¯ 
--**********************************
function  x888899_CardCheckRetEnd(sceneId,selfId)
	 local  ret  =  LuaFnEndAddItem(  sceneId,  selfId  )
	 if  1  ==  ret  then
	 	 -- ki¬m tra thành công , b¡t ð¥u khai tÕp 
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        ki¬m tra thành công , xin ch¶ mµt chút …… ðang nh§n l¤y ph¥n thß·ng . "  )
	 	 x888899_AskNewUserCard(  sceneId,  selfId,  "MagicString",  1);
	 else
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        th§t xin l²i , các hÕ không có ð¥y ðü v§t ph¦m lan không gian , xin/m¶i sØa sang lÕi sau tr· lÕi nh§n l¤y . "  )
	 end
end
--**********************************
--  thë ki¬m tra ph¥n thß·ng   kªt thúc ðích tr· v« ði«u hàm s¯ , nhìn tr¶i khiªn cho l­ túi thä ra làm ð£c thù ngày chí   By  Vega  20090121
--**********************************
function  x888899_CardCheckRetEndTSLB(sceneId,selfId)
	 local  ret  =  LuaFnEndAddItem(  sceneId,  selfId  )
	 if  1  ==  ret  then
	 	 -- ki¬m tra thành công , b¡t ð¥u khai tÕp 
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        ki¬m tra thành công , xin ch¶ mµt chút …… ðang nh§n l¤y ph¥n thß·ng . "  )
	 	 x888899_AskNewUserCard(  sceneId,  selfId,  "MagicString",  1);

	 	 local  guid  =  LuaFnObjId2Guid(sceneId,  selfId);
	 	 
	 	 if  guid  ~=  nil  then
	 	 	 --local  LogInfo  =  format("0X%08X,",  guid);
	 	 	 ScriptGlobal_AuditGeneralLog(LUAAUDIT_TSLBOUT,  guid);
	 	 end
	 else
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  -1,  "        th§t xin l²i , các hÕ không có ð¥y ðü v§t ph¦m lan không gian , xin/m¶i sØa sang lÕi sau tr· lÕi nh§n l¤y . "  )
	 end
end

function  x888899_LogForDuiHuanYuanBao(sceneId,  selfId,YuanBao,rmb)
	 local  nowYear  =  GetTodayYear();
	 local  nowMonth  =  GetTodayMonth();
	 nowMonth=nowMonth+1;
	 local  nowDate  =  GetTodayDate();
	 local  nHour	   =  GetHour()
	 local  nMinute  =  GetMinute()
	 local  nName  =  LuaFnGetName(  sceneId,  selfId  )
	 local  nGuid  =  LuaFnGetGUID(  sceneId,  selfId)
	 local  handle  =  openfile("./Log1/ChongZhiLog.txt",  "a+")
	 
	 if  nil  ~=  handle  then
	 	 write(handle,  " th¶i gian ["..nowYear.."-"..nowMonth.."-"..nowDate.."  "..nHour..":"..nMinute.."] , vai trò tên ["..nName.."] , vai trò ID["..nGuid.."] , ð±i ["..YuanBao.."]".." nguyên bäo ".."      giá tr¸ "..rmb.." nguyên RMB")
	 	 write(handle,tostring("\n"))
	 	 closefile(handle)
	 end
end

--**********************************
--  ki¬m tra   CDKey  ðích b¸ l²i tr· v« tr· v« ði«u hàm s¯ 
--**********************************
function  x888899_PrizeRetErr(  sceneId,  selfId,  retId  )
--enum	 UserPrizeResult
--{
--	 UPR_SUCCESS,	 	 	 	 	 	 	 // rút ra tß·ng tin tÑc thành công 
--	 UPR_ASKPOINT_SUCCESS,	 	 	 // tu¥n tra ði¬m m¤y thành công 
--	 UPR_ASKBUY_SUCCESS,	 	 	 	 // mua thành công 
--
--	 UPR_ERR_NO_PRIZE,	 	 	 	 	 // không có trung tß·ng 
--	 UPR_ERR_PRE_REQUEST,	 	 	 // ðang xØ lý l¥n trß¾c ðích thïnh c¥u tin tÑc 
--	 UPR_ERR_PRIZE_BUSY,	 	 	 	 // ch¶ ðþi xØ lý dçn tß·ng tin tÑc quá nhi«u 
--	 UPR_ERR_TIME_OUT,	 	 	 	 	 // xØ lý dçn tß·ng tin tÑc cñc kÏ lúc 
--	 UPR_ERR_EXPIRE_PRIZE,	 	 	 // ph¥n thß·ng quá hÕn 
--	 UPR_ERR_CANT_NOW,	 	 	 	 	 // bây gi¶ không th¬ xØ lý rút ra tß·ng thïnh c¥u 
--	 UPR_ERR_NOENOUGH_POINT,	 	 // ði¬m ðªm chßa ðü 
--	 UPR_ERR_GOODSCODE_ERR,	 	 // v§t ph¦m ðÕi mã sai l¥m 
--	 UPR_ERR_ALREADYGET_PRIZE,	 // ðã dçn tß·ng 
--	 UPR_NEWUSERCARD_SUCCESS,	 // tài phú tÕp thành công 
--	 UPR_ERR_WRONGCARDNUMBER,	 // tÕp s¯ sai l¥m 
--	 UPR_ERR_OTHERUSERUSE,	 	 // nhæng ngß¶i khác ðã sØ døng 
--	 };
	 local  targetId  =  -1

	 if  retId  ==  3  then	 	 	 	 	 	 	 	 --  không có   CD-Key
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i CDK không có kích hoÕt , xin/m¶i các hÕ ðång løc http://tl.gameone.com/ tra xét . "  )
	 elseif  retId  ==  4  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ðang xØ lý trung , xin h§u . "  )
	 elseif  retId  ==  5  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        h® th¯ng b§n rµn , xin h§u n£ng h½n thØ . "  )
	 elseif  retId  ==  6  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        xØ lý cñc kÏ lúc , xin h§u thØ lÕi . "  )
	 elseif  retId  ==  9  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        BÕc cüa các hÕ không ðü ð¬ ð±i "  )
	 elseif  retId  ==  11  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i s¯ trß½ng møc ðã nh§n l¤y quá tß·ng thß·ng , không cách nào l¥n næa kh·i ðµng nh§n l¤y ði«u ki®n . "  )    -- s¯ trß½ng møc     to    trß½ng møc 
	 elseif  retId  ==  13  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        th§t xin l²i , ngß½i thua vào ðích tÕp tñ li®t s¯ vì không có hi®u quä tñ li®t s¯ , xin xác nh§n sau l¥n næa ðßa vào . "  )
	 elseif  retId  ==  14  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        ngß½i tÕp tñ li®t s¯ ðã b¸ sØ døng quá , xin xác nh§n . "  )
	 elseif  retId  ==  16  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        v¯n phøc vø khí không khai thông rút ra tß·ng chÑc nång , xin xác nh§n . "  )
	 elseif  retId  ==  17  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        này døng hµ ðã quá 10 c¤p , không th¬ sØ døng næa tài phú tÕp . "  )
	 elseif  retId  ==  20  then
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        th§t xin l²i , các hÕ trß¾c m£t không có nhßng nh§n l¤y ðích tß·ng thß·ng . "  )
	 else
	 	 x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  "        xØ lý hß , xin h§u thØ lÕi , nhß không cách nào thành công thao tác xin liên lÕc khách phøc nhân viên tiªn hành xØ lý . "  )
	 end
end

--**********************************
--  ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x888899_NotifyFailBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
--  thông báo khách hàng bßng còn th×a lÕi ði¬m ðªm 
--**********************************
function  x888899_NotifyLeftPoint(sceneId,selfId,nLeftPoint)
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  nLeftPoint)
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,  2003  )
end

--**********************************
--  th¬ døc cÕnh ðoán tÕp ngçu nhiên ðÕt ðßþc ph¥n thß·ng 
--**********************************
function  x888899_GetSportsPrize()
	 local  total  =  getn(SPORTS_CARD_PRIZE)
	 if  total  and  total  >=  1  then
	 	 local  idx  =  random(1,total)
	 	 return  SPORTS_CARD_PRIZE[idx]
	 else
	 	 return  nil
	 end
end



function  x888899_GetGiftsForCostYuanBao(  sceneId,  selfId,  nIndex)
g_ServerNew_SaveUp_Gifts={  
[1]  =  {38001111,38512001,50713004,50721101},  --5
[2]  =  {38001111,38506001,50721104,50721204},  ---150
[3]  =  {50721305,10141210,38503001,50713004},    ---500
[4]  =  {38001111,10553101,50721207,50721405},  --1000
[5]  =  {38001111,50721206,10553102,10553107},        --1500                                      --------------- cái này là l¥n ð¥u sung tr¸ giá 
[6]  =  {10553103,10553104,10553109,10553111},  --2000
}

local  GiftLev  ={" mµt "," hai "," ba "," b¯n "," nåm "," sáu "}	 
local  g_Pointt  =  GetMissionData(sceneId,selfId,CHONG_ZHI_CHONGSHU)	 
local  g_Pointtb  =  GetMissionData(sceneId,selfId,CHONG_ZHI_YILINGQI)	 
local  nam  =  LuaFnGetName(  sceneId,  selfId  )-- ngß¶i ch½i tên 

if  nIndex  >=  1  and  nIndex  <=  6  then
      if  nIndex  >  1  then
            if  g_Pointtb  <  nIndex-1  then
	   x888899_Tips(sceneId,selfId," xin/m¶i trß¾c nh§n l¤y thÑ "..GiftLev[nIndex-1].." n£ng häo l­ ")
	   return
            end
      end
      if  LuaFnGetPropertyBagSpace(sceneId,selfId)  <  4  or  LuaFnGetMaterialBagSpace(sceneId,selfId)  <  4  then
            x888899_Tips(sceneId,selfId," xin/m¶i bäo ðÕo cø lan cùng tài li®u lan có 4 cá ch² tr¯ng ")
            return	 
      end
      if  g_Pointt  <  nIndex  then
            x888899_Tips(  sceneId,  selfId," ngß½i ð±i ðích ði¬m ít h½n so v¾i hoÕt ðµng yêu c¥u "  )
            return
      else
            SetMissionData(  sceneId,  selfId,  CHONG_ZHI_YILINGQI,nIndex)  -- cái này vì thông báo   
            for  i=1,4  do  
	     TryRecieveItem(  sceneId,selfId,g_ServerNew_SaveUp_Gifts[nIndex][i],1)-- phát tß·ng thß·ng v§t ph¦m 	 
            end
            x888899_Tips(  sceneId,  selfId," chúc m×ng các hÕ , nh§n l¤y thành công "  )
            BroadMsgByChatPipe(sceneId,  selfId,  " chúc m×ng ngß¶i ch½i "..nam.." thành công nh§n l¤y ph¥n thß·ng tích lûy c¤p ðµ Vip  "..GiftLev[nIndex].." Xin chúc m×ng ",  4)
            CallScriptFunction(  (890096),  "GetGiftsForUI",  sceneId,  selfId,11  )
            LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
      end	 
end	 	 
end

function  x888899_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end	 
