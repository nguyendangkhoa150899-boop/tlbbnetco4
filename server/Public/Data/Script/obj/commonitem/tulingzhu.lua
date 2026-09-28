-- chú ý : 

-- v§t ph¦m kÛ nång ðích suy lu§n chï có th¬ sØ døng trø cµt kÛ nång và chân v¯n là thñc hi®n 

-- chân v¯n :

-- tr· xu¯ng là chân v¯n dÕng l® :


--tulingzhu.lua
------------------------------------------------------------------------------------------
-- mµt loÕi v§t ph¦m ðích cam ch¸u chân v¯n 
-- ð¤t linh châu 

-- ð¤t linh châu có 3 loÕi thao tác : 
--1. trñc tiªp sØ døng lúc m· ra ð¤t linh châu sØ døng gi¾i m£t 
--2. sØ døng gi¾i trên m£t ði¬m kích “ ð¸nh v¸ ” tiªn hành ð¸nh v¸ 
--3. sØ døng gi¾i trên m£t ði¬m kích “ truy«n t¯ng ” tiªn hành truy«n t¯ng 
-- sØ døng ð¤t linh châu lúc b¡n ra ðích gi¾i m£t là · khách hàng bßng trñc tiªp cÑng r¡n biên con ngña thñc hi®n , trên thñc tª cûng không  có “ sØ døng v§t ph¦m ” , vì v§y s¨ không ði«u døng ðªn v¯n chân v¯n bên trong . 
-- v¯n chân v¯n vì ð¤t linh châu ðích sØ døng suy lu§n , bình thß¶ng sØ døng ð¤t linh châu ðích suy lu§n vì “ truy«n t¯ng ” . 
-- ð¤t linh châu ðích ð¸nh v¸ là thông qua khách hàng bßng trñc tiªp call v¯n chân v¯n ðích x330001_SetPosition hàm s¯ thñc hi®n , cûng không thuµc v« ð¤t linh châu ðích sØ døng suy lu§n . 

-- chân v¯n s¯ 
x330001_g_ScriptId	 =  330001

-- v§t ph¦m ID
x330001_g_ItemId  =  30008007
x330001_g_ItemId01  =  30505216

-- hi®u quä ID
x330001_g_Impact	 	 =  -1	 -- truy«n t¯ng lúc mu¯n sØ døng ð£c hi®u ðích biên s¯ 


x330001_g_UseTim	 	 =  10	 	 	 	 -- sØ døng s¯ l¥n 
x330001_g_Yinpiao	 	 =  40002000	 -- ngân phiªu 

-- bình thß¶ng cänh tßþng hÕn chª , nhæng thÑ này cänh tßþng bên trong không cách nào truy«n t¯ng 
x330001_g_UselessScn=
{
	 151,	 --  ngøc giam 
	 125,	 --  ngøc giam 
	 540,	 --  ngøc giam 
	 184,	 --  ngøc giam 
	 410,	 --  ngøc giam 
	 544,	 --  ngøc giam 
	 545,	 --  ngøc giam 
	 546,	 --  ngøc giam 
	 547,	 --  ngøc giam 
	 548,	 --  ngøc giam 
	 181,	 --  ngøc giam 
	 433,	 --  ngøc giam 
	 593,	 --  ngøc giam 
	 564,	 --  ngøc giam 
	 581,	 --  ngøc giam 
	 582,	 --  ngøc giam 
	 583,	 --  ngøc giam 
	 584,	 --  ngøc giam 
	 585,	 --  ngøc giam 
	 571,	 --  ngøc giam 
	 128,	 --  ngøc giam 
	 43,	 --  ngøc giam 
	 580,
	 561,
	 562,
	 599	 	 --  ngøc giam 
}

-- bình thß¶ng cänh tßþng hÕn chª , nhæng thÑ này cänh tßþng bên trong không cách nào ð¸nh v¸ 
x330001_g_SetPosLimitScn=
{
	 125,	 --  Hoa S½n 
	 540,	 --  Hoa S½n 
	 184,	     --  sân ð¤u 
	 410,	     --  sân ð¤u 
	 544,	     --  sân ð¤u 
	 545,	     --  sân ð¤u 
	 546,	     --  sân ð¤u 	 
	 547,    --  sân ð¤u 
	 548,    --  sân ð¤u 
	 414,    --  sân ð¤u 
	 181,    --  sân ð¤u 
	 433,    --  sân ð¤u 
	 593,    --  sân ð¤u 
	 564,    --  sân ð¤u 
	 581,    --  thông thiên tháp 1
	 582,    --  thông thiên tháp 2
	 583,    --  thông thiên tháp 3
	 584,    --  thông thiên tháp 4
	 585,    --  thông thiên tháp 5
	 517,    --  sân ð¤u 
	 128,    --  sân ð¤u 
	 43,    --  sân ð¤u 
	 580,
	 561,
	 562,
	 599,	 	 --  ngøc giam 
                317,  --  tranh bá cuµc so tài 
                180,  -- phßþng hoàng chiªn trß¶ng 
                191,  -- phßþng hoàng c± thành 
				708,
				710,
}

-- c¤m chï truy«n t¯ng ðªn mµt ít cänh tßþng ðích c¤p b§c hÕn chª ....
x330001_g_LimitTransScene  =
{
	 {423,90},	 -- höa di®m s½n 
	 {581,90},	 -- höa di®m s½n 
	 {582,90},	 -- höa di®m s½n 
	 {583,90},	 -- höa di®m s½n 
	 {584,90},	 -- höa di®m s½n 
	 {585,90},	 -- höa di®m s½n 
	 {519,90},	 -- ng÷n lØa c¯c 
	 {424,90},	 -- cao xß½ng 
	 {520,90},	 -- cao xß½ng mê cung 
	 {425,90},	 -- trong tháp mµc 
	 {427,90},	 -- tháp ca ra mã ki«n 
	 {186,75},	 -- lâu lan 
	 {517,150},	 -- lâu lan 
	 {128,150},	 -- lâu lan 
	 {43,150},	 -- lâu lan 
	 {431,90},              -- ðÕi uy¬n 
	 {432,90}                -- m° hôi máu lînh 
}



x330001_g_StrCannotUse  =  " ngài xØ vu không cách nào sØ døng truy«n t¯ng ðích dß¾i tình hu¯ng , không cách nào sØ døng truy«n t¯ng ðÕo cø . "

x330001_g_Impact_NotTransportList  =  {  5929  }  --  c¤m chï truy«n t¯ng ðích Impact
x330001_g_TalkInfo_NotTransportList  =  {  "#{GodFire_Info_062}"  }  --  c¤m chï truy«n t¯ng ðích Impact ð« kÏ tin tÑc 

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************
function  x330001_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ 
end


--**********************************
-- cái này v§t ph¦m ðích sØ døng quá trình là hay không tß½ng tñ v¾i kÛ nång : 
-- h® th¯ng s¨ · thi hành lúc b¡t ð¥u ki¬m tr¡c cái này hàm s¯ ðích tr· v« tr¸ giá , nªu nhß tr· v« th¤t bÕi là coi thß¶ng phía sau tß½ng tñ kÛ nång ðích thi hành . 
-- tr· v« 1 : kÛ nång tß½ng tñ v§t ph¦m , có th¬ tiªp tøc tß½ng tñ kÛ nång ðích thi hành ; tr· v« 0 : coi thß¶ng phía sau thao tác . 
--**********************************
function  x330001_IsSkillLikeScript(  sceneId,  selfId  )
	 return  1	   -- cái này chân v¯n c¥n ðµng tác üng hµ 
end


--**********************************
-- trñc tiªp hüy bö hi®u quä : 
-- h® th¯ng s¨ trñc tiªp ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ðã hüy bö ð¯i Ñng hi®u quä , không h« næa thi hành sau này thao tác ; tr· v« 0 : không có ki¬m tr¡c ðªn tß½ng quan hi®u quä , tiªp tøc thi hành . 
--**********************************
function  x330001_CancelImpacts(  sceneId,  selfId  )
	 return  0	   -- không c¥n cái này tiªp l¶i , nhßng mu¯n c¤t giæ vô ích hàm s¯ , h½n næa thüy chung tr· v« 0 . 
end


--**********************************
-- ði«u ki®n ki¬m tr¡c nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång ki¬m tr¡c ðích th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : ði«u ki®n ki¬m tr¡c thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : ði«u ki®n ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
--**********************************
function  x330001_OnConditionCheck(  sceneId,  selfId  )

	 --
	 -- bình thß¶ng sØ døng ð¤t linh châu ðích suy lu§n vì truy«n t¯ng , n½i này chï c¥n tiªn hành truy«n t¯ng trß¾c ðích ki¬m tr¡c là ðßþc r°i . 
	 --

	 -- trong túi ðeo lßng ðích v¸ trí 
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 if  bagId  <  0  then
	 	 return  0
	 end

	 -- giáo nghi®m sØ døng v§t ph¦m 
	 if(  1  ~=  LuaFnVerifyUsedItem(  sceneId,  selfId  )  )  then
	 	 return  0
	 end
	 
	 -- ki¬m tr¡c v§t ph¦m là hay không thêm khóa 
	 if  LuaFnLockCheck(  sceneId,  selfId,  bagId,  0  )  <  0  then
	 	 x330001_MsgBox(  sceneId,  selfId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 return  0
	 end

	 --  xØ vu h÷p thành ðµi ði theo trÕng thái hÕ , không th¬ truy«n t¯ng 
	 if  IsTeamFollow(sceneId,  selfId)  ==  1    then
	 	 x330001_MsgBox(  sceneId,  selfId,  x330001_g_StrCannotUse  )
	 	 return  0
	 end

	 --  ki¬m tr¡c nhà ch½i có phäi hay không xØ vu bày sÕp trÕng thái , 
	 if  LuaFnIsStalling(sceneId,  selfId)  ==  1    then
	 	 x330001_MsgBox(  sceneId,  selfId,  x330001_g_StrCannotUse  )
	 	 return  0
	 end

	 -- phán ðoán trß¾c m£t trÕng thái có hay không có th¬ sØ døng ( tào v§n )
	 if  IsHaveMission(  sceneId,  selfId,  4021  )  >  0  then
	 	 x330001_MsgBox(  sceneId,  selfId,  x330001_g_StrCannotUse  )
	 	 return  0
	 end

	 -- ki¬m tr¡c nhà ch½i trên ngß¶i có phäi hay không có “ ngân phiªu ” v§t này , có thì không th¬ sØ døng n½i này chÑc nång 
	 if  GetItemCount(sceneId,  selfId,  x330001_g_Yinpiao)  >=  1    then
	 	 x330001_MsgBox(sceneId,  selfId,  x330001_g_StrCannotUse  )
	 	 return  0
	 end
	 
	 -- ki¬m tr¡c Impact trÕng thái trú lßu hi®u quä 
	 for  i,  ImpactId  in  x330001_g_Impact_NotTransportList  do
	 	 if  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  selfId,  ImpactId)  ~=  0  then
	 	 	 BeginEvent(sceneId)	 	 	 
	 	 	 	 AddText(sceneId,  x330001_g_TalkInfo_NotTransportList[i]);
	 	 	 EndEvent(sceneId)
	 	 	 DispatchMissionTips(sceneId,selfId)
	 	 	 return  0
	 	 end
	 end
	 
	 -- ph¯i trí chï ð¸nh cänh tßþng không th¬ hß¾ng ð¸nh v¸ ði¬m truy«n t¯ng 
	 for  _,  tmp  in  x330001_g_UselessScn  do
	 	 if  tmp  ==  sceneId  then
	 	 	 x330001_MsgBox(  sceneId,  selfId,  " này cänh tßþng bên trong không cách nào sØ døng ! "  )
	 	 	 return  0
	 	 end
	 end
	 
	 -- ki¬m tr¡c møc tiêu cänh tßþng có phäi là hay không 90 c¤p l¤y bên trong không th¬ truy«n t¯ng ðích cänh tßþng 	 --add  by  xindefeng
	 -- l¤y ðßþc ghi chép · v§t ph¦m trên ngß¶i s¯ li®u kªt c¤u 
	 local	 otim	 	 	 -- còn th×a lÕi sØ døng s¯ l¥n 
	 local	 osid	 	 	 -- cänh tßþng biên s¯ 
	 local	 opx,  opy	 -- trí nh¾ t÷a ðµ 
	 otim	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  3,  0  )
	 osid	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  4,  1  )
	 opx	 	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  6,  1  )
	 opy	 	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  8,  1  )

	 if  opx  >  0  and  opy  >  0  then	 -- ðã ð¸nh quá v¸ 	 	 

	 	 for  _,  tmp  in  x330001_g_LimitTransScene  do
	 	 	 if  (  (tmp[1]  ==  osid)  and  (GetLevel(sceneId,  selfId)  <  tmp[2])  )  then
	 	 	 	 local  szMsg  =  format(" này cänh tßþng c¥n %d c¤p tr· lên lÕi v×a vào bên trong ",  tmp[2]  )
	 	 	 	 x330001_MsgBox(  sceneId,  selfId,  szMsg)
	 	 	 	 return  0
	 	 	 end
	 	 end

	 end
	 
	 return  1

end


--**********************************
-- tiêu hao ki¬m tr¡c cùng xØ lý nh§p kh¦u : 
-- h® th¯ng s¨ · kÛ nång tiêu hao th¶i gian ði¬m ði«u døng cái này tiªp l¶i , cûng cån cÑ cái này hàm s¯ ðích tr· v« tr¸ giá xác ð¸nh sau này lßu trình có hay không thi hành . 
-- tr· v« 1 : tiêu hao xØ lý thông qua , có th¬ tiªp tøc thi hành ; tr· v« 0 : tiêu hao ki¬m tr¡c th¤t bÕi , c¡t ðÑt sau này thi hành . 
-- chú ý : cái này không riêng phø trách tiêu hao ki¬m tr¡c cûng ch¸u trách tiêu hao thi hành . 
--**********************************
function  x330001_OnDeplete(  sceneId,  selfId  )

	 -- sØ døng ðµn th± châu tiªn hành truy«n t¯ng trß¾c s¨ ði«u døng v¯n hàm s¯ t¾i tiêu hao v§t ph¦m ....

	 --
	 -- · ch² này còn phäi l¥n næa ki¬m tr¡c mµt cái ....
	 --
	 local  ret
	 ret  =  x330001_OnConditionCheck(  sceneId,  selfId  )
	 if  0  ==  ret  then
	 	 return  0
	 end

	 -- trong túi ðeo lßng ðích v¸ trí 
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )

	 -- l¤y ðßþc ghi chép · v§t ph¦m trên ngß¶i s¯ li®u kªt c¤u 
	 local	 otim	 	 	 -- còn th×a lÕi sØ døng s¯ l¥n 
	 local	 osid	 	 	 -- cänh tßþng biên s¯ 
	 local	 opx,  opy	 -- trí nh¾ t÷a ðµ 
	 otim	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  3,  0  )
	 osid	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  4,  1  )
	 opx	 	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  6,  1  )
	 opy	 	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  8,  1  )

	 -- ðã ð¸nh quá v¸ ....
	 if  opx  >  0  and  opy  >  0  then

	 	 -- b¤t ð°ng cänh tßþng truy«n t¯ng .... nªu nhß møc tiêu cänh tßþng không th¬ dùng .... là tiêu hao th¤t bÕi ....
	 	 if  sceneId  ~=  osid  then
	 	 	 if  IsCanNewWorld(  sceneId,  selfId,  osid,  opx,  opy  )  ~=  1  then
	 	 	 	 x330001_MsgBox(  sceneId,  selfId,  " không th¬ truy«n t¯ng ðªn møc tiêu cänh tßþng . "  )
	 	 	 	 return  0
	 	 	 end
	 	 end

	 	 -- có th¬ truy«n t¯ng .... là tiêu hao v§t ph¦m ....
	 	 -- nhßng là · ch² này không trñc tiªp tiêu hao .... b·i vì · x330001_OnActivateOnce() trung còn c¥n phöng v¤n v§t ph¦m trên ngß¶i ð¸nh v¸ tin tÑc ....
	 	 -- vì v§y n½i này ðích tiêu hao na ðªn x330001_OnActivateOnce() trung ....

	 	 return  1

	 else

	 	 -- còn không có ð¸nh v¸ .... là tiêu hao th¤t bÕi ....
	 	 x330001_MsgBox(  sceneId,  selfId,  " xin/m¶i lña ch÷n ð¸a ði¬m thích hþp ð¸nh v¸ sau sØ døng næa truy«n t¯ng chÑc nång . "  )
	 	 return  0

	 end

	 return  1

end


--**********************************
-- chï biªt thi hành mµt l¥n nh§p kh¦u : 
-- tø khí cùng thu¤n phát kÛ nång s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i ( tø khí kªt thúc h½n næa các loÕi ði«u ki®n cûng thöa mãn th¶i ði¬m ) , mà dçn d¡t 
-- kÛ nång cûng s¨ · tiêu hao hªt thành sau ði«u døng cái này tiªp l¶i ( kÛ nång ðích ngay t× ð¥u , tiêu hao thành công thi hành sau ) . 
-- tr· v« 1 : xØ lý thành công ; tr· v« 0 : xØ lý th¤t bÕi . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x330001_OnActivateOnce(  sceneId,  selfId  )

	 --
	 -- bình thß¶ng sØ døng ð¤t linh châu ðích suy lu§n vì truy«n t¯ng , n½i này chï c¥n tiªn hành truy«n t¯ng là ðßþc r°i . 
	 --

	 -- trong túi ðeo lßng ðích v¸ trí 
	 local	 bagId	 	 	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )


	 -- l¤y ðßþc ghi chép · v§t ph¦m trên ngß¶i ð¸nh v¸ s¯ li®u ....
	 local	 otim	 	 	 -- còn th×a lÕi sØ døng s¯ l¥n ....
	 local	 osid	 	 	 -- cänh tßþng biên s¯ 
	 local	 opx,  opy	 -- trí nh¾ t÷a ðµ 
	 otim	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  3,  0  )
	 osid	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  4,  1  )
	 opx	 	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  6,  1  )
	 opy	 	 =  GetBagItemParam(  sceneId,  selfId,  bagId,  8,  1  )

	 -- l¤y ðßþc ð¸nh v¸ s¯ li®u sau li«n có th¬ tiêu hao v§t ph¦m li­u ....

	 -- giäm b¾t có th¬ sØ døng s¯ l¥n 
	 otim  =  otim  -  1
	 SetBagItemParam(  sceneId,  selfId,  bagId,  3,  0,  otim  )
	 -- ghi chép th¯ng kê tin tÑc 
	 LuaFnAuditGPS(  sceneId,  selfId,  0  )
	 -- cà m¾i Client bßng ðích túi ðeo lßng v§t ph¦m tin tÑc 
	 LuaFnRefreshItemInfo(  sceneId,  selfId,  bagId  )

	 -- nªu nhß có th¬ sØ døng s¯ l¥n dùng xong là thü tiêu v§t ph¦m .... thü tiêu th¤t bÕi là b¤t truy«n ðßa ....
	 local  ret
	 if  otim  <=  0  then
	 	 ret  =  EraseItem(  sceneId,  selfId,  bagId  )
	 	 if  1  ~=  ret  then
	 	 	 return
	 	 end
	 end

	 -- nªu nhß ph¯i trí sØ døng ð£c hi®u là thêm ðªn nhà ch½i trên ngß¶i ....
	 if(  -1  ~=  x330001_g_Impact  )  then
	 	 LuaFnSendSpecificImpactToUnit(  sceneId,  selfId,  selfId,  selfId,  x330001_g_Impact,  0  )
	 end

	 -- nªu ðã ghi chép quá ð¸nh v¸ tin tÑc là truy«n t¯ng ....
	 if  opx  >  0  and  opy  >  0  then

	 	 if  sceneId  ==  osid  then
	 	 	 -- cùng cänh tßþng truy«n t¯ng 
	 	 	 SetPos(  sceneId,  selfId,  opx,  opy  )
	 	 else
	 	 	 -- b¤t ð°ng cänh tßþng truy«n t¯ng 
	 	 	 NewWorld(  sceneId,  selfId,  osid,  opx,  opy  )
	 	 end

	 end

	 return  1

end


--**********************************
-- dçn d¡t nh¸p tim xØ lý nh§p kh¦u : 
-- dçn d¡t kÛ nång s¨ · m²i l¥n nh¸p tim kªt thúc lúc ði«u døng cái này tiªp l¶i . 
-- tr· v« : 1 tiªp tøc l¥n sau nh¸p tim ;0 : c¡t ðÑt dçn d¡t . 
-- chú : n½i này là kÛ nång có hi®u lñc mµt l¥n nh§p kh¦u 
--**********************************
function  x330001_OnActivateEachTick(  sceneId,  selfId  )
	 return  1	   -- không phäi là dçn d¡t tính chân v¯n ,  chï c¤t giæ vô ích hàm s¯ . 
end


--**********************************
-- tin tÑc ð« kÏ 
--**********************************
function  x330001_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end


--**********************************
--  nhà ch½i sØ døng v§t ph¦m   ð¸nh v¸ 
--**********************************
function  x330001_SetPosition(  sceneId,  selfId,  nItemIndex  )

	 --
	 -- ð¸nh v¸ trß¾c ðích ki¬m tr¡c 
	 --
	 
	 -- ð¸nh v¸ là khách hàng bßng trñc tiªp call cái này hàm s¯ thñc hi®n .... cho nên không có träi qua sØ døng v§t ph¦m ðích ki¬m tr¡c ....
	 -- vì v§y n½i này mu¯n tiªn hành c¤p b§c hÕn chª ch¶ ki¬m tr¡c ....
	 if  GetLevel(sceneId,  selfId)<10    then
	 	 x330001_MsgBox(  sceneId,  selfId,  " c¤p b§c không ðü "  )
	 	 return
	 end

	 -- ki¬m tr¡c v§t ph¦m là hay không thêm khóa 
	 if  LuaFnLockCheck(  sceneId,  selfId,  nItemIndex,  0  )  <  0  then
	 	 x330001_MsgBox(  sceneId,  selfId,  " v§t này ph¦m ðã b¸ phong töa ! "  )
	 	 return  0
	 end

	 -- ki¬m tr¡c có phäi hay không ð¤t linh châu 
	 if  GetItemTableIndexByIndex(sceneId,  selfId,  nItemIndex)  ~=  x330001_g_ItemId  
	 	   and  GetItemTableIndexByIndex(sceneId,  selfId,  nItemIndex)  ~=  x330001_g_ItemId01    then
	 	 x330001_MsgBox(  sceneId,  selfId,  " bên trong túi ðeo lßng bµ sai l¥m "  )
	 	 return
	 end

	 -- phó bän ho£c bang hµi thành ph¯ bên trong không cách nào ð¸nh v¸ 
	 if  LuaFnGetSceneType(  sceneId  )  ==  1  or  LuaFnGetSceneType(  sceneId  )  ==  4  then
	 	 x330001_MsgBox(  sceneId,  selfId,  " phó bän ho£c bang hµi thành ph¯ bên trong không cách nào ð¸nh v¸ ! "  )
	 	 return
	 end

	 -- ph¯i trí chï ð¸nh cänh tßþng không th¬ ð¸nh v¸ 
	 for  _,  tmp  in  x330001_g_SetPosLimitScn  do
	 	 if  tmp  ==  sceneId  then
	 	 	 x330001_MsgBox(  sceneId,  selfId,  " này cänh tßþng bên trong không cách nào sØ døng ! "  )
	 	 	 return
	 	 end
	 end

	 --
	 -- b¡t ð¥u ð¸nh v¸ 
	 --

	 -- l¤y ðßþc ghi chép · v§t ph¦m trên ngß¶i s¯ li®u kªt c¤u 
	 local	 otim	 	 	 -- còn th×a lÕi sØ døng s¯ l¥n 
	 local	 osid	 	 	 -- cänh tßþng biên s¯ 
	 local	 opx,  opy	 -- trí nh¾ t÷a ðµ 
	 otim	 =  GetBagItemParam(  sceneId,  selfId,  nItemIndex,  3,  0  )
	 osid	 =  GetBagItemParam(  sceneId,  selfId,  nItemIndex,  4,  1  )
	 opx	 	 =  GetBagItemParam(  sceneId,  selfId,  nItemIndex,  6,  1  )
	 opy	 	 =  GetBagItemParam(  sceneId,  selfId,  nItemIndex,  8,  1  )

	 -- nªu nhß còn chßa t×ng ð¸nh v¸ quá là n£ng ðßa v§t ph¦m tin tÑc ....
	 if  otim  ==  0  and  osid  ==  0  and  opx  ==  0  and  opy  ==  0  then
	 	 otim  =  x330001_g_UseTim
	 end

	 -- l¤y ðßþc nhà ch½i ðích trß¾c m£t t÷a ðµ cùng cänh tßþng ID....
	 osid	 	 	 =  sceneId
	 opx,  opy	 =  LuaFnGetUnitPosition(  sceneId,  selfId  )
	 opx	 =  floor(  opx  )
	 opy	 =  floor(  opy  )

	 -- ðem tin tÑc thiªt trí ðªn v§t ph¦m trung ( ð¸nh v¸ )....
	 SetBagItemParam(  sceneId,  selfId,  nItemIndex,  0,  1,  10  )	 	 	 	 	 	 	 	 --Key , v¸ này tiêu chí thao tác t§p h÷p , cûng là Client tu chánh Tooltips ðích y cß 
	 SetBagItemParam(  sceneId,  selfId,  nItemIndex,  2,  0,  x330001_g_UseTim  )	 -- l¾n nh¤t sØ døng s¯ l¥n 
	 SetBagItemParam(  sceneId,  selfId,  nItemIndex,  3,  0,  otim  )	 	 	 	 	 	 	 -- còn th×a lÕi sØ døng s¯ l¥n 
	 SetBagItemParam(  sceneId,  selfId,  nItemIndex,  4,  1,  osid  )	 	 	 	 	 	 	 -- cänh tßþng biên s¯ 
	 SetBagItemParam(  sceneId,  selfId,  nItemIndex,  6,  1,  opx  )	 	 	 	 	 	 	 	 --X t÷a ðµ 
	 SetBagItemParam(  sceneId,  selfId,  nItemIndex,  8,  1,  opy  )	 	 	 	 	 	 	 	 --Y t÷a ðµ 
	 
	 -- ghi chép th¯ng kê tin tÑc 
	 LuaFnAuditGPS(  sceneId,  selfId,  1  )

	 -- cà m¾i Client bßng ðích túi ðeo lßng v§t ph¦m tin tÑc 
	 LuaFnRefreshItemInfo(  sceneId,  selfId,  nItemIndex  )

	 x330001_MsgBox(  sceneId,  selfId,  " ngß½i ð¤t linh châu ð¸nh v¸ thành công . "  )

end