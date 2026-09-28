-- chân v¯n ID
x380000_g_scriptId  =  380000

--**********************************
--  sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x380000_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	 BeginEvent(sceneId)
	 	 AddText(sceneId,  "#YHoan nghênh ði t¾i Thiên long bát bµ n½i này có ngß½i thích th¶i trang nhuµm s¡c chÑc nång , m¾i cÞi ngña , m¾i bäo bäo , m¾i th¥n khí , phäng quan ngoÕn pháp , hy v÷ng ngài thích ! ")	 	 
	 	 AddNumText(sceneId,  x300053_g_scriptId,"#e6f00c7#c00ffff tùy thân chÑc nång#R? tùy thân thß¶ng dùng chÑc nång ?",  12,  100)
	 	 --AddNumText(sceneId,  x300053_g_scriptId,"#e6f00c7#c00ffff xªp vào sß môn#R? gia nh§p Mµ Dung s½n trang ?",  12,    2000)
	 	 AddNumText(sceneId,  x300053_g_scriptId,"#e6f00c7#c00ffff bäo thÕch chÑc nång#R? ðánh l² vây quanh hþp thành ?",  12,    300)
	 	 AddNumText(sceneId,  x300053_g_scriptId,"#e6f00c7#c00ffff trang b¸ chÑc nång#R? cß¶ng hóa giám ð¸nh thång c¤p ?",  12,    500)
	 	 AddNumText(sceneId,  x300053_g_scriptId,"#e6f00c7#c00ffff trân thú chÑc nång#R? kÛ nång còn ð°ng nhæng khác ?",  12,    600)
	 	 AddNumText(sceneId,  x300053_g_scriptId,"#e6f00c7#c00ffff truy«n t¯ng chÑc nång#R? siêu cß¶ng tùy thân chÑc nång ?",  9,  400)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,-1)
end
--**********************************
-- nhà ch½i màn änh trung gian ð« kÏ 
--**********************************
function  x380000_Tips(  sceneId,  selfId,  str  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  str  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x380000_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end
--**********************************
--  
--**********************************
function  x380000_IsSkillLikeScript(  sceneId,  selfId)
	 return  0
end


--- này hàm s¯ bi¬u t× a a sØa ð±i ----

--CallScriptFunction(  (380000),  "SHANG_BAOS",sceneId,  selfId,arg...)    -- th¯ng nh¤t ði«u døng cách thÑc 


--CallScriptFunction(  (380000),  "NotStrTip",sceneId,  selfId," nghê h°ng ")    -- màn änh ð« kÏ th¯ng nh¤t ði«u døng 
function  x380000_NotStrTip(  sceneId,  selfId,  Msg  )
	 if  Msg  ==nil  then  
	 return
	 end
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--CallScriptFunction(  (380000),  "BroadMsgTip",sceneId,  selfId,targetId,0," nh§n l¤y "," thành công ")	 
function  x380000_BroadMsgTip(  sceneId,  selfId,targetId,  Str,Str1,Str2  )    -- h® th¯ng ð« kÏ tin tÑc           tham s±   bao g°m v¸     làm cái gì ðÕt ðßþc     nhß thª nào       
	 if  Str  ==nil  or  Str  ==""  or  not  Str  or  Str  ==-1  then  
	 return
	 end
local  transfer  =  GetBagItemTransfer(sceneId,selfId,Str)	 
str  =  format(" chúc m×ng nhà ch½i ".."#{_INFOUSR%s}#c66ccff · %s#Y%s#B ch² "..(Str1).."#{_INFOMSG%s}#G"..Str2,  GetName(sceneId,selfId),GetSceneName(sceneId),GetName(sceneId,targetId),transfer  )
BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
end
-- bäo thÕch l¤y ðßþc 
--CallScriptFunction(  (380000),  "SHANG_BAOS",sceneId,  selfId,pos,zbg)  -- ch² cû ðßa     -- m¾i v¸ trí       -- cái này c¥n ði«u ki®n ðích chính là     bao g°m ch² tr¯ng c¥n 1 ðªn 3 cá 
function  x380000_SHANG_BAOS(sceneId,  selfId,pos,pos1)
local  equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  pos  )
if  equipMaxGemCount  <1  then
return
end	 
local  biaoshi  =  {}
local  gemEmbededIdx  =  -1
local  jisu  =  0
if  equipMaxGemCount  >  0  then
for  i  =  0,equipMaxGemCount-1  do
gemEmbededIdx  =  GetGemEmbededType(  sceneId,  selfId,  pos,  i  )
if  gemEmbededIdx  >  0  then
jisu  =  jisu  +  1
biaoshi[jisu]  =  gemEmbededIdx
end
end	 
end
--
if  biaoshi  ==  nil  or  getn(biaoshi)  <=  0  then
return
end
local  ret  =  0
local  equipMaxGemCount  =  0
while  equipMaxGemCount  <  getn(biaoshi)  do
if  equipMaxGemCount  >=  getn(biaoshi)  then
break
end	 
if  equipMaxGemCount  <  3  then	 
ret  =  AddBagItemSlot(  sceneId,  selfId,  pos1  )
end
if    equipMaxGemCount  ==  3  then	 
ret  =  AddBagItemSlotFour(  sceneId,  selfId,  pos1  )
end	 
equipMaxGemCount  =  GetBagGemCount(  sceneId,  selfId,  pos1  )
end
for  i  =  1,getn(biaoshi)  do
local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  biaoshi[i],  1  )
if  bagpos01  ~=  -1  then
GemEnchasing(  sceneId,  selfId,  bagpos01,pos1  )
end
end	 
end	 

-- cß¶ng hóa l¤y ðßþc 
--CallScriptFunction(  (380000),  "QHpd_Hf",sceneId,  selfId,0,arg1,arg2)  ---- tiêu chí phù     thì ra là       bây gi¶   key  0  là tra ( tr· v« c¤p b§c )  1 là thi hành ( thành công tr· v« 1 th¤t bÕi tr· v« 0)
function  x390103_QHpd_Hf(sceneId,  selfId,key,arg1,arg2)    -- tiêu chí phù     thì ra là       bây gi¶   v¸ trí   0  là tra   1 là thi hành 
local  key=0
local  sun  =0  	 
if  key  ==  0  then  
sun  =  GetBagItemParam(  sceneId,  selfId,  arg1,  3,  1)
return  sun
end

if  key  ==  1  then  
if  GetBagItemParam(  sceneId,  selfId,  arg1,  3,  1)  <1  then
return
end
---------
for  i=1  ,  GetBagItemParam(  sceneId,  selfId,  arg1,  3,  1)    do  
ret,arg0  =  	 LuaFnEquipEnhance(  sceneId,  selfId,  arg2,  1  )
SetBagItemParam(  sceneId,  selfId,  arg2,  3,  1,arg0)
end	 
return  1
end
end

-- tr· v« hªt thäy phø thêm tin tÑc nhß ðiêu vån ch¶ hªt thäy m¾i tß nguyên 
--CallScriptFunction(  (380000),  "FJxx_Fh",sceneId,  selfId,arg0,arg1)
function  x390103_FJxx_Fh(sceneId,  selfId,arg0,arg1)
local  _,  name  =  LuaFnGetItemCreator(sceneId,  selfId,arg0)	 
if  	 name  ==  nil  or  name==""  then
return
end  
LuaFnSetItemCreator(  sceneId,  selfId,arg1,name  )
LuaFnRefreshItemInfo(  sceneId,  selfId,arg1)	 
end

---- a a tu chánh buff--- chiªm døng quá nhi«u phäi tình hu¯ng     -- ð£c viªt   phß½ng thÑc b± toàn   bäo ðang üng hµ t¤t cä m¾i chÑc nång   thä bäo ðäm buff không vßþt qua   25 cá 
--CallScriptFunction(  (380000),  "HH_cjBUFF",sceneId,  selfId,arg0)    --  cån cÑ trên ngß¶i t¤t cä bµi ðái tiªn hành ki¬m tra   thä nh¾ thuµc tính t±ng cµng 
function  x390103_HH_cjBUFF(sceneId,  selfId)
	 
	 
	 
	 
end