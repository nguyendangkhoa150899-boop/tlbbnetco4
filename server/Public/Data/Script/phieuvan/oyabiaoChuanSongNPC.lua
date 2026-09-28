-- tác giä : hß äo 
x402311_g_scriptId  =  402311
x402311_g_MissMonsterID  =  OYABIAO_MISSMONSERID
x402311_g_MissMonsterPos  =  OYABIAO_MISSMONSERPOS
x402311_g_YanBiaoChuanSongNPC  =  {}
x402311_g_YanBiaoChuanSongNPC[559]={[0]={43546,402311," v§n phiêu dành riêng truy«n t¯ng "," truy«n t¯ng - quên xuyên bi¬n hoa ",557,39,43},[1]={43543,402311," v§n phiêu dành riêng truy«n t¯ng "," truy«n t¯ng - mÕc nam thanh nguyên ",556,154,207},[2]={43540,402311," v§n phiêu dành riêng truy«n t¯ng "," truy«n t¯ng - ngày kÏ nam hoài ",558,39,212}}
x402311_g_YanBiaoChuanSongNPC[557]={[0]={43547,402311," v§n phiêu dành riêng truy«n t¯ng "," truy«n t¯ng - lâm häi khê c¯c ",563,47,223}}
x402311_g_YanBiaoChuanSongNPC[558]={[0]={43544,402311," v§n phiêu dành riêng truy«n t¯ng "," truy«n t¯ng - lâm häi khê c¯c ",563,219,205}}
x402311_g_YanBiaoChuanSongNPC[556]={[0]={43541,402311," v§n phiêu dành riêng truy«n t¯ng "," truy«n t¯ng - lâm häi khê c¯c ",563,98,36}}
x402311_g_MissBOOL  =  MF_YANBIAO_CHONGDIAN
x402311_g_MissRenWuTime  =  OYABIAO_MISSRENWUTIME
x402311_g_MissListBiao  =  {OYABIAO_MISSMONSERID,OYABIAO_MISSMONSERPOS,OYABIAO_MISSRENWUTIME}
x402311_g_yabiaoxianli={
[1]={item  =  38000571,  num  =  5,  huainum  =  1,  money=100000},                  -- bình thß¶ng ð°ng xanh 
[2]={item  =  38000571,  num  =  10,  huainum  =  1,  money=200000},	 	 	 -- bình thß¶ng bÕc tr¡ng 
[3]={item  =  38000571,  num  =  20,  huainum  =  1,  money=500000},	 	 	 -- bình thß¶ng hoàng kim 
[4]={item  =  38000571,  num  =  3,  huainum  =  1,  money=0},                    -- b¸ cß¾p ð°ng xanh 
[5]={item  =  38000571,  num  =  7,  huainum  =  1,  money=0},	 	 	 -- b¸ cß¾p bÕc tr¡ng 
[6]={item  =  38000571,  num  =  15,  huainum  =  1,  money=0},	 	 	 -- b¸ cß¾p hoàng kim 
[7]={item  =  38000571,  num  =  10,  huainum  =  1,  money=100000},                    -- bình thß¶ng ð°ng xanh g¤p ðôi 
[8]={item  =  38000571,  num  =  20,  huainum  =  1,  money=200000},	 	 	 -- bình thß¶ng bÕc tr¡ng g¤p ðôi 
[9]={item  =  38000571,  num  =  40,  huainum  =  1,  money=500000},	 	 	 -- bình thß¶ng hoàng kim g¤p ðôi 
[10]={item  =  38000571,  num  =  3,  huainum  =  1,  money=0},                    -- b¸ cß¾p ð°ng xanh g¤p ðôi 
[11]={item  =  38000571,  num  =  7,  huainum  =  1,  money=0},	 	 	 -- b¸ cß¾p bÕc tr¡ng g¤p ðôi 
[12]={item  =  38000571,  num  =  15,  huainum  =  1,  money=0},	 	 	 -- b¸ cß¾p hoàng kim g¤p ðôi 
}
x402311_g_MissBeiJueNo  =  MF_YANBIAO_BEIJUENO
x402311_g_MonsterName  =  {" lý t°n nghîa "," lý quan minh "," vß½ng tØ tân "}
function  x402311_OnDefaultEvent(  sceneId,  selfId,targetId  )
if  x402311_g_YanBiaoChuanSongNPC[sceneId]  ~=  nil  then
local  a1,a2,a3,a4,a5,a6  =  CallScriptFunction(  402306,  "GetDataNum",  sceneId,  selfId  )
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  "        tÕi hÕ b¸ tiêu ng÷n núi ðÕi hi®p s· bày , cung kính b°i tiªp thiªu hi®p ðã lâu , ð¸a gi¾i ðøng vào nhau ch² ð«u vì yêu ma ch² tø t§p , vì phòng tiêu ng÷n núi ðÕi hi®p phó thác thiªu hi®p ðích th¥n v§t b¸ yêu ma s· ðoÕt , tÕi hÕ s¨ hµ t¯ng thiªu hi®p cùng tiêu xa an ±n r¶i ði n½i này ! "  )
	 if  sceneId  ==  559  then
	 if  x402311_g_YanBiaoChuanSongNPC[sceneId]  ~=  nil  and  x402311_g_YanBiaoChuanSongNPC[sceneId][a2]  ~=  nil  then
	 AddNumText(  sceneId,  x402311_g_scriptId,  x402311_g_YanBiaoChuanSongNPC[sceneId][a2][4],  6,  89  )
	 end
	 else
	 if  x402311_g_YanBiaoChuanSongNPC[sceneId]  ~=  nil  and  x402311_g_YanBiaoChuanSongNPC[sceneId][0]  ~=  nil  then
	 AddNumText(  sceneId,  x402311_g_scriptId,  x402311_g_YanBiaoChuanSongNPC[sceneId][0][4],  6,  89  )
	 end
	 end
	 AddNumText(  sceneId,  x402311_g_scriptId,  " liên quan t¾i phiêu ðßþc ngày hoang ",  6,  88  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
elseif  sceneId  ==  563  then
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  "                thßþng c± tam ðÕi d¸ thú phong ¤n ðã hi®n dãn ra , nªu không phäi có th¬ sØ døng thích linh v§t kéo dài tr¤n áp , sþ r¢ng võ lâm hÕo kiªp không lâu li«n ðem ðªn ! #r        Tiêu ðÕi hi®p an bài tÕi hÕ n½i này , chính là tiªp Ñng t¾i trß¾c áp v§n thích linh v§t ðích các v¸ thiªu hi®p , nªu thiªu hi®p ðã xem tái có thích linh v§t ðích xe ngña áp v§n ðªn ðây ch² , kính xin mau s¾m giao phó v¾i tÕi hÕ , ðã mi­n ð° sanh biªn c¯ . "  )
	 AddNumText(  sceneId,  x402311_g_scriptId,  " giao phó tiêu xa ",  6,  89  )
	 AddNumText(  sceneId,  x402311_g_scriptId,  " liên quan t¾i phiêu ðßþc ngày hoang ",  6,  88  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end	 
end

function  x402311_YiaoFuBiao(  sceneId,  selfId,  targetId)
local  a1,a2,a3,a4,a5,a6  =  CallScriptFunction(  402306,  "GetDataNum",  sceneId,  selfId  )
local  boolbeijueno  =  GetMissionFlag(sceneId,  selfId,  x402311_g_MissBeiJueNo)
local  xianlitape  =  a3
if  a3  <  1  or  a3  >  3  then
return
end
if  x402311_g_MonsterName[a2+1]  ==  nil  then
return
end
if  x402311_g_MonsterName[a2+1]  ~=  GetName(sceneId,targetId)  then
x402311_NotifyTip(  sceneId,  selfId,  " m¶i ðßþc ["..x402311_g_MonsterName[a2+1].."] ch² nh§n l¤y tß·ng thß·ng ! ! "  )
return
end
local  nQuarter  =  mod(GetQuarterTime(),100);
if  nQuarter  >=  80  and  nQuarter  <=  88  then
xianlitape  =  xianlitape  +  6
end
if  boolbeijueno  ==  1  then
xianlitape  =  xianlitape  +  3
end
local  dedaowubinnum  =  x402311_g_yabiaoxianli[xianlitape].num
if  boolbeijueno  ==  1  then
dedaowubinnum  =  x402311_g_yabiaoxianli[xianlitape].huainum
end
if  x402311_g_yabiaoxianli[xianlitape]  ==  nil  then
x402311_NotifyTip(  sceneId,  selfId,  " tß·ng thß·ng s¯ li®u sai l¥m ! ! ! "  )
return
end

BeginAddItem(sceneId)
AddItem(  sceneId,  x402311_g_yabiaoxianli[xianlitape].item,  dedaowubinnum)	 

ret  =  EndAddItem(sceneId,selfId)
if  ret  >  0  then
AddItemListToHuman(sceneId,selfId)
else
return
end

if  x402311_g_yabiaoxianli[xianlitape].money  >  0  then
AddMoneyJZ(sceneId,  selfId,x402311_g_yabiaoxianli[xianlitape].money)
end	 
for  i  =  1,3  do
SetMissionData(sceneId,  selfId,x402311_g_MissListBiao[i],0)
end
SetMissionFlag(sceneId,  selfId,  x402311_g_MissBOOL,  0)
SetMissionFlag(sceneId,  selfId,  x402311_g_MissBeiJueNo,0)
SetCharacterDieTime(sceneId,  a1,  1000);
LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
local  mydedaomoney  =  floor(x402311_g_yabiaoxianli[xianlitape].money/10000)
local  strsid  = format( " #ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s} ðã áp giäi tiêu xa thành công nh§n l¤y  #G[#{_ITEM"..x402311_g_yabiaoxianli[xianlitape].item.."}] "..dedaowubinnum.." cái" , GetName(sceneId,selfId) )
BroadMsgByChatPipe( sceneId, selfId, strsid, 4 )
if  mydedaomoney  >  0  then
strsid  =  strsid..""..mydedaomoney.."J . "
end
x402311_NotifyTip(  sceneId,  selfId,strsid)
        BeginUICommand(  sceneId  )
        UICommand_AddInt(  sceneId,  2  )
        EndUICommand(  sceneId  )
        DispatchUICommand(  sceneId,  selfId,    "890901")
end
function  x402311_OnEventRequest(  sceneId,  selfId,  targetId)
if  GetNumText()  ==  88  then
	 BeginEvent(  sceneId  )
	 AddText(  sceneId,  "#Y liên quan t¾i phiêu ðßþc ngày hoang #W#r  #r        #G c¤p b§c ðÕt t¾i 85 c¤p #W ðích nhà ch½i , m²i ngày nhßng · #G phßþng minh tr¤n #{_INFOAIM101,127,580, tiêu ng÷n núi }#R tiêu ng÷n núi #W ch² áp v§n b¤t ð°ng c¤p b§c ðích tiêu xa , áp v§n ðích #G tiêu xa càng quý tr÷ng #W , trä lÕi tiêu xa lúc ðÕt ðßþc ðích #G tß·ng thß·ng lÕi càng phong phú #W . #r  #r#cfabf8f áp phiêu th¶i gian #W#r        c§n #G m²i ngày 8 lúc t¾i 23 lúc #W trong lúc #G nhßng nh§n l¤y tiêu xa #W tiªn hành #G áp v§n #W , nhæng th¶i gian khác ð«u không pháp tiªn hành nh§n l¤y . #r        #G m²i ngày 20 lúc t¾i 22 lúc #W s· #G nh§n l¤y #W ðªn ðích #G tiêu xa #W , · #G trä lÕi lúc #W nªu vì #R ð°ng xanh tiêu xa #W?#R bÕc tr¡ng tiêu xa #W ho£c #R hoàng kim tiêu xa #W , là nhßng ðÕt ðßþc #G g¤p ðôi #W ðích #Y thích linh d¸ch #W tß·ng thß·ng . #r  #r#cfabf8f nh§n l¤y tiêu xa #W#r        #G m²i ngày #W nhi«u nh¤t nhßng nh§n l¤y #G3 lßþng #W tiêu xa . nh§n l¤y tiêu xa lúc , t±ng cµng có #R ð°ng xanh tiêu xa #W?#R bÕc tr¡ng tiêu xa #W cùng #R hoàng kim tiêu xa #W có th¬ cung c¤p lña ch÷n . #r        #G nh§n l¤y #R ð°ng xanh tiêu xa #W : c¥n #G trä 10#-02#W ðích ti«n thª chân . nªu trä lÕi lúc tiêu xa #G vì #R ð°ng xanh tiêu xa #W , là ti«n thª chân #G toàn ngÕch hoàn trä #W , ð°ng th¶i nhßng ðÕt ðßþc #G5 cá #Y thích linh d¸ch #W . nªu trä lÕi lúc tiêu xa #G vì #R tàn phá tiêu xa #W , là #G không cách nào ðÕt ðßþc ti«n thª chân #W , nhßng vçn nhßng #G ðÕt ðßþc 3 cá #Y thích linh d¸ch #W . #r        #G nh§n l¤y #R bÕc tr¡ng tiêu xa #W : c¥n #G trä 200 nguyên bäo #W lÕi v×a ðÕt ðßþc #G nh§n l¤y tß cách #W , nh§n l¤y lúc còn c¥n #G trä 20#-02#W ðích ti«n thª chân . nªu trä lÕi lúc tiêu xa #G vì #R bÕc tr¡ng tiêu xa #W , là ti«n thª chân #G toàn ngÕch hoàn trä #W , ð°ng th¶i nhßng ðÕt ðßþc #G10 cá #Y thích linh d¸ch #W . nªu tiêu xa #G b¸ phá hüy #W sau næa giao phó , là #G không cách nào ðÕt ðßþc ti«n thª chân #W , nhßng vçn nhßng #G ðÕt ðßþc 7 cá #Y thích linh d¸ch #W . #r        #G nh§n l¤y #R hoàng kim tiêu xa #W : c¥n #G trä 500 nguyên bäo #W lÕi v×a ðÕt ðßþc #G nh§n l¤y tß cách #W , nh§n l¤y lúc còn c¥n #G trä 50#-02#W ðích ti«n thª chân . nªu trä lÕi lúc tiêu xa #G vì #R hoàng kim tiêu xa #W , là ti«n thª chân #G toàn ngÕch hoàn trä #W , ð°ng th¶i nhßng ðÕt ðßþc #G20 cá #Y thích linh d¸ch #W . nªu trä lÕi lúc tiêu xa #G vì #R tàn phá tiêu xa #W , là #G không cách nào ðÕt ðßþc ti«n thª chân #W , nhßng vçn nhßng #G ðÕt ðßþc 15 cá #Y thích linh d¸ch #W . #r  #r#cfabf8f áp v§n tiêu xa #W#r        thành công nh§n l¤y tiêu xa lúc , s¨ #G ngçu nhiên #W ðÕt ðßþc mµt cái #G áp phiêu lµ tuyªn #W , ð°ng th¶i #G tiêu xa #W ðem #G tñ ðµng #W duyên nên lµ tuyªn #G ði t¾i #W , cho ðªn t¾i chuyªn này ði¬m cu¯i . #r        áp phiêu trong quá trình , nªu #G áp phiêu ngß¶i khoäng cách tiêu xa quá xa #W , là #G tiêu xa #W s¨ #G d×ng lÕi #W ði t¾i , cho ðªn #G áp phiêu ngß¶i #W tr· v« #G tiêu xa phø c§n #W . #r        #G tiêu xa #W ðªn #R tiêu xa d¸ch trÕm #W lúc , áp phiêu ngß¶i nhßng thông qua #R tiêu xa d¸ch trÕm #G truy«n t¯ng #W t¾i cuµc kª tiªp cänh #G tiªp tøc áp phiêu #W . #r        m²i l¥n áp phiêu c¥n · #G20 phút #W bên trong hoàn thành , nªu không ðem coi là #G áp phiêu th¤t bÕi #W , #G không cách nào ðÕt ðßþc ti«n thª chân cùng b¤t kÏ tß·ng thß·ng #W . #r  #r#cfabf8f ngân phiªu #W#r        vô lu§n loÕi nào phiêu ngân , m²i vai trò #G m²i ngày #W c§n có th¬ sØ døng #G3 l¥n #W phiêu ngân . "  )
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
return	 
end
if  x402311_g_YanBiaoChuanSongNPC[sceneId]  ==  nil  and  sceneId  ~=  563  then
x402311_NotifyTip(  sceneId,  selfId,  "#H ngài thßþng không có · ðây v§n phiêu trung , không cách nào sØ døng tiêu xa d¸ch trÕm truy«n t¯ng ! "  )
return
end
local  boolbeijueno  =  GetMissionFlag(sceneId,  selfId,  x402311_g_MissBeiJueNo)
local  senyutiem  =  ((x402306_g_MonSterLifeTime/1000)-(LuaFnGetCurrentTime()-GetMissionData(sceneId,  selfId,x402311_g_MissRenWuTime)))
if  boolbeijueno  ==  1  and  sceneId  ==  563  and  senyutiem  >  0  then
x402311_YiaoFuBiao(  sceneId,  selfId,  targetId)
return
end
local  a1,a2,a3,a4,a5,a6  =  CallScriptFunction(  402306,  "GetDataNum",  sceneId,  selfId  )
local  tisi  =  "#H ngài thßþng không có · ðây v§n phiêu trung , không cách nào sØ døng tiêu xa d¸ch trÕm truy«n t¯ng ! "
if  sceneId  ==  563  then
tisi  =  "#H trß¾c m£t thßþng vô · v§n phiêu trung , không cách nào nh§n l¤y v§n phiêu tß·ng thß·ng ! "
end
if  a1  <=  0    then
x402311_NotifyTip(  sceneId,  selfId,  tisi)
return
end
tisi  =  " ngài không th¬ dùng chÑc nång này ! ! "
if  sceneId  ==  563  then
tisi  =  " ngài vçn không th¬ giao phó tiêu xa ! ! "
end
if  a4  ~=  sceneId  then
x402311_NotifyTip(  sceneId,  selfId,tisi)
return
end
if  LuaFnIsObjValid(sceneId,  a1)  ~=  1    then
x402311_NotifyTip(  sceneId,  selfId,  "#H ngài cûng không  có tiêu xa · b±n tràng cänh ! "  )
return
end
local  posx,posz  =  GetWorldPos(sceneId,a1)
local  posx2,posz2  =  GetWorldPos(sceneId,targetId)
local  Deves  =  (posx2  -  posx)  *  (posx2  -  posx)  +  (posz2  -  posz)  *  (posz2  -  posz)
tisi  =  "#H ngài ðích tiêu xa chßa ði t¾i d¸ch trÕm , không cách nào sØ døng tiêu xa d¸ch trÕm truy«n t¯ng ! "
if  sceneId  ==  563  then
tisi  =  " ngài ðích tiêu xa không có · ðây phø c§n , tÕm không th¬ giao phó tiêu xa ! ! "
end
if  Deves  >  5  then
x402311_NotifyTip(  sceneId,  selfId,  tisi  )
return
end
if  sceneId  ==  563  then
x402311_YiaoFuBiao(  sceneId,  selfId,  targetId)
return
end

SetCharacterDieTime(sceneId,  a1,  1000);
SetMissionFlag(sceneId,  selfId,  x402311_g_MissBOOL,  1)
if  sceneId  ==  559  then
SetMissionData(sceneId,  selfId,x402311_g_MissMonsterPos,x402311_g_YanBiaoChuanSongNPC[sceneId][a2][5]*1000000+x402311_g_YanBiaoChuanSongNPC[sceneId][a2][6]*1000+x402311_g_YanBiaoChuanSongNPC[sceneId][a2][7])
CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  x402311_g_YanBiaoChuanSongNPC[sceneId][a2][5],  x402311_g_YanBiaoChuanSongNPC[sceneId][a2][6],  x402311_g_YanBiaoChuanSongNPC[sceneId][a2][7],  10  )
else
SetMissionData(sceneId,  selfId,x402311_g_MissMonsterPos,x402311_g_YanBiaoChuanSongNPC[sceneId][0][5]*1000000+x402311_g_YanBiaoChuanSongNPC[sceneId][0][6]*1000+x402311_g_YanBiaoChuanSongNPC[sceneId][0][7])
CallScriptFunction(  (400900),  "TransferFunc",  sceneId,  selfId,  x402311_g_YanBiaoChuanSongNPC[sceneId][0][5],  x402311_g_YanBiaoChuanSongNPC[sceneId][0][6],  x402311_g_YanBiaoChuanSongNPC[sceneId][0][7],  10  )
end
end
function  x402311_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end