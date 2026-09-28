-- vân san san 
-- Trang B¸ Trân Thú NPC      hÕt tØ luy®n chª   QQ718805400 , xin/m¶i tôn tr÷ng nguyên sang , chuy¬n tái xin/m¶i c¤t giæ chuyªn này 
-- chân v¯n s¯ 
x001088_g_scriptId  =  001088

x001088_g_shoptableindex=1

-- có sñ ki®n ID li®t bi¬u 
x001088_g_eventList={}

x001088_g_EquipList={
--85 trân thú bµ/vö . nhát gan 
{n=8510,id=39985111},{n=8510,id=39985112},{n=8510,id=39985113},{n=8510,id=39985114},{n=8510,id=39985115},
--85 trân thú bµ/vö . dûng mãnh 
{n=8520,id=39985211},{n=8520,id=39985212},{n=8520,id=39985213},{n=8520,id=39985214},{n=8520,id=39985215},
--85 trân thú bµ/vö . trung thành 
{n=8530,id=39985311},{n=8530,id=39985312},{n=8530,id=39985313},{n=8530,id=39985314},{n=8530,id=39985315},
--95 trân thú bµ/vö . nhát gan 
{n=9510,id=39995111},{n=9510,id=39995112},{n=9510,id=39995113},{n=9510,id=39995114},{n=9510,id=39995115},
--95 trân thú bµ/vö . dûng mãnh 
{n=9520,id=39995211},{n=9520,id=39995212},{n=9520,id=39995213},{n=9520,id=39995214},{n=9520,id=39995215},
--95 trân thú bµ/vö . trung thành 
{n=9530,id=39995311},{n=9530,id=39995312},{n=9530,id=39995313},{n=9530,id=39995314},{n=9530,id=39995315},
}

x001088_g_StoneList={
{n=1,id=20301009,num=30,str="Thánh Thú Lân "},
{n=2,id=20301009,num=100,str="Thánh Thú Lân "},
}

--**********************************
-- sñ ki®n li®t bi¬u 
--**********************************
function  x001088_OnDefaultEvent(  sceneId,  selfId,targetId  )
	 BeginEvent(sceneId)
	 AddText(sceneId,"#{ZSZB_090421_09}")
	 AddNumText(sceneId,x001088_g_scriptId," Ð±i Trang B¸ Trân Thú ",6,3)
	 AddNumText(sceneId,x001088_g_scriptId," Tång C¤p Trang B¸ Trân Thú ",6,1)
	 AddNumText(sceneId,x001088_g_scriptId," Phân Giäi Trang B¸ Trân Thú ",6,2)
	 AddNumText(sceneId,x001088_g_scriptId," Gi¾i thi®u Trang B¸ Trân Thú ",11,4)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x001088_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )

	 if  GetNumText()  ==  0    then
	 	 --  t¡t cØa s± 
	 	 BeginUICommand(sceneId)
	 	 EndUICommand(sceneId)
	 	 DispatchUICommand(sceneId,selfId,  1000)
	 	 return
	 end

	 if  GetNumText()  ==  1  then
	     BeginUICommand(sceneId);
	 	 UICommand_AddInt(sceneId,  targetId);
	     EndUICommand(sceneId);
	     DispatchUICommand(sceneId,  selfId,  201709251);
	 end

	 if  GetNumText()  ==  2  then
	     BeginUICommand(sceneId);
	 	 UICommand_AddInt(sceneId,  targetId)
	 	 UICommand_AddInt(sceneId,  30)
	     EndUICommand(sceneId);
	     DispatchUICommand(sceneId,  selfId,  201709252);
	 end


	 if  GetNumText()  ==  3  then
	 	 BeginEvent(sceneId)
                                            AddText(sceneId,"#{ZSZBDH_090806_1}")
	 	             AddNumText(  sceneId,  x001088_g_ScriptId,  " Ð±i Trang B¸ Trân Thú C¤p 85 ",  6,  8500  )
	 	             AddNumText(  sceneId,  x001088_g_ScriptId,  " Ð±i Trang B¸ Trân Thú C¤p 95 ",  6,  9500  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end


	 if  GetNumText()  ==  8500  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  "        Ð±i Trang B¸ Trân Thú C¤p 85, m²i món c¥n “ Thánh Thú Lân ” 30 cái, ðÕi hi®p chu¦n b¸ xong chßa ? ")
	 	                 AddNumText(  sceneId,  x001088_g_ScriptId,  "#Y Ð±i ·#G Phi ¿ng T×ng Không #Y Trang B¸",  6,  GetNumText()+10  )
	 	                 AddNumText(  sceneId,  x001088_g_ScriptId,  "#Y Ð±i ·#G Mãnh H± Hám S½n #Y Trang B¸",  6,  GetNumText()+20  )
	 	                 AddNumText(  sceneId,  x001088_g_ScriptId,  "#Y Ð±i ·#G Cñ Hùng Hao Lµ  #Y Trang B¸",  6,  GetNumText()+30  )
	 	 	 AddNumText(  sceneId,  x001088_g_ScriptId,  " r¶i ði ……",  0,  0  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end


	 if  GetNumText()  ==  9500  then
	 	 BeginEvent(sceneId)
	 	 	 AddText(sceneId,  "        Ð±i Trang B¸ Trân Thú C¤p 95, m²i món c¥n “ Thánh Thú Lân ” 100 cái, ðÕi hi®p chu¦n b¸ xong chßa ? ")
	 	                 AddNumText(  sceneId,  x001088_g_ScriptId,  "#Y Ð±i ·#G Côn B¢ng D¸ Vû #Y Nµi Lñc ",  6,  GetNumText()+10  )
	 	                 AddNumText(  sceneId,  x001088_g_ScriptId,  "#Y Ð±i ·#G Hùng Sß Ngh¸ch Lân #Y Cß¶ng Lñc ",  6,  GetNumText()+20  )
	 	                 AddNumText(  sceneId,  x001088_g_ScriptId,  "#Y Ð±i ·#G Huy«n Quy Huyªt KÏ #Y Th¬ Lñc ",  6,  GetNumText()+30  )
	 	 	 AddNumText(  sceneId,  x001088_g_ScriptId,  " r¶i ði ……",  0,  0  )
	 	 EndEvent(sceneId)
	 	 DispatchEventList(sceneId,selfId,targetId)
	 	 return
	 end


	 if  GetNumText()  >  8500  and  GetNumText()  <  10000    then
	 	 BeginEvent(sceneId)
	 	 	 local  nLevel  =  0
	 	 	 if  GetNumText()  ==  8510  then
	 	 	 	 nLevel  =  1
	 	 	 end
	 	 	 if  GetNumText()  ==  8520  then
	 	 	 	 nLevel  =  1
	 	 	 end
	 	 	 if  GetNumText()  ==  8530  then
	 	 	 	 nLevel  =  1
	 	 	 end
	 	 	 if  GetNumText()  ==  9510  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  GetNumText()  ==  9520  then
	 	 	 	 nLevel  =  2
	 	 	 end
	 	 	 if  GetNumText()  ==  9530  then
	 	 	 	 nLevel  =  2
	 	 	 end

	 	 	 local  szStr  =  "    Mu¯n ð±i ðßþc nhæng trang b¸ này, ngß½i c¥n cho ta “"  ..  x001088_g_StoneList[nLevel].str..  "”“"..  tostring(x001088_g_StoneList[nLevel].num)  ..  "” cái, nên v§t ph¦m nhßng thông qua #G hóa giäi 75 c¤p Trang B¸ Trân Thú #W ðÕt ðßþc ,75 c¤p Trang B¸ Trân Thú · #G mß¶i hai sát tinh #W trung tuôn ra ....#r    #G chú ý nhìn trang b¸ thích hþp cái gì loÕi hình trân thú , không mu¯n ð±i sai l¥m r°i nga #W"
	 	 	 AddText(sceneId,  szStr)
	 	 	 
	 	 	 for  i,  item  in  x001088_g_EquipList  do
	 	 	 	 if  item.n  ==  GetNumText()    then
	 	 	 	 	 AddRadioItemBonus(  sceneId,  item.id,  4  )
	 	 	 	 end
	 	 	 end
                EndEvent(sceneId)
                DispatchMissionContinueInfo(sceneId,selfId,targetId,  x001088_g_ScriptId,  0)	 
	 end

	 for  i,  findId  in  x001088_g_eventList  do
	 	 if  eventId  ==  findId  then	 	 	 
	 	 	 CallScriptFunction(  eventId,  "OnDefaultEvent",sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- t¥m xa ði«u døng hß·ng Ñng 
--**********************************
function  x001088_Pet_Equip(  sceneId,  selfId,  index,  arg1,  arg2,  arg3,  arg4)
            local  petEquip  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  arg1  )
            if    not  petEquip  or  petEquip  ==  nil  then
                    return
            end

	 local  petEquipAA  =  floor(petEquip/100000)                              -- có hay không 399 m· ð¥u 
                local  petEquipBB  =  floor(mod(petEquip,100000)/1000)          -- bao nhiêu c¤p 
                local  petEquipCC  =  floor(mod(petEquip,1000)/100)                -- loÕi hình 
                local  petEquipDD  =  floor(mod(petEquip,100)/10)                    -- tinh c¤p 
                local  petEquipEE  =  mod(petEquip,10)                                          -- bµ v¸ 

	 -- trß¾c ki¬m tra có phäi hay không Trang B¸ Trân Thú 
	 if  petEquipAA  ~=  399  then
	 	 x001088_Tips(  sceneId,  selfId," chï có th¬ bö vào Trang B¸ Trân Thú ")
	 	 return
	 end
	 if  petEquipBB  ~=  75  and  petEquipBB  ~=  85  and  petEquipBB  ~=  95  then
	 	 x001088_Tips(  sceneId,  selfId," chï có th¬ bö vào Trang B¸ Trân Thú ")
	 	 return
	 end
	 if  petEquipCC  <  1  and  petEquipCC  >  3  then
	 	 x001088_Tips(  sceneId,  selfId," chï có th¬ bö vào Trang B¸ Trân Thú ")
	 	 return
	 end
	 if  petEquipDD  <  1  or  petEquipDD  >  6  then
	 	 x001088_Tips(  sceneId,  selfId," chï có th¬ bö vào Trang B¸ Trân Thú ")
	 	 return
	 end

	 if  LuaFnGetMaterialBagSpace(  sceneId,  selfId)  <  2  or  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <  2  then
	 	 x001088_Tips(  sceneId,  selfId," ô ðÕo cùng cùng ô nguyên li®u ít nh¤t c¥n ch×a 2 ô tr¯ng tr· lên ")
	 	 return
	 end


        if  index  ==  1  then

                local  CailiaoNum  =  {}
                            CailiaoNum[75]  =  {3,5,7,11,16}
                            CailiaoNum[85]  =  {16,18,20,24,28}
                            CailiaoNum[95]  =  {36,43,50,56,63}

	 if  petEquipDD  >  6  then
	 	 x001088_Tips(  sceneId,  selfId,"  Trang B¸ Trân Thú cüa các hÕ ðã ð¥y c¤p, không c¥n tiªp tøc thång tinh ")
	 	 return
	 end

	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20301009)  <  CailiaoNum[petEquipBB][petEquipDD]  then
	       x001088_Tips(  sceneId,  selfId,  " Các hÕ #{_ITEM20301009} chßa ðü "..CailiaoNum[petEquipBB][petEquipDD].." cái, không th¬ thång tinh "  )
	       return
	 end

                if  petEquipDD  ==  5  then
	       if  LuaFnGetAvailableItemCount(sceneId,  selfId,  20301010)  <  1  then
	             x001088_Tips(  sceneId,  selfId,  " Các hÕ #{_ITEM20301010} chßa ðü 1 cái , không th¬ thång tinh "  )
	             return
	       end
	 end

	 local  HumanMoney  =  LuaFnGetMoney(  sceneId,  selfId  )
    	 local  HumanMoneyJZ  =  GetMoneyJZ(  sceneId,  selfId  );
	 if  HumanMoney  +  HumanMoneyJZ  <  10000000    then
	 	 x001088_Tips(  sceneId,  selfId,  " ngß½i không ðü 1000 vàng, không th¬ thång c¤p trang b¸ trân thú "  )
	 	 return
	 end
	 local  nDelJZ,  nDelMoney  =  LuaFnCostMoneyWithPriority(sceneId,  selfId,  10000000);

                if  LuaFnDelAvailableItem(sceneId,selfId,20301009,CailiaoNum[petEquipBB][petEquipDD])  ~=  1  then
                      x895111_NotifyTips(  sceneId,  selfId,  "#{_ITEM20301009} kh¤u tr× th¤t bÕi, xin liên lÕc GM"  )
                      return
                end

                if  petEquipDD  ==  5  then
	       if  LuaFnDelAvailableItem(sceneId,selfId,20301010,1)  ~=  1  then
	             x001088_Tips(  sceneId,  selfId,  "#{_ITEM20301010} kh¤u tr× th¤t bÕi, xin liên lÕc GM"  )
	             return
	       end
	 end

                if    LuaFnEraseItem(  sceneId,  selfId,  arg1  )  ~=  1  then
                        x001088_Tips(  sceneId,  selfId,  " không biªt sai l¥m , v§t ph¦m kh¤u tr× th¤t bÕi "  )
                        return
                end

                local  pos  =  TryRecieveItem(  sceneId,  selfId,  petEquip+10,  1  )
                local  transfer  =  GetBagItemTransfer(sceneId,selfId,pos)
                x001088_Tips(  sceneId,  selfId,  " chúc m×ng các hÕ, trang b¸ trân thú thång tinh thành công . xin m¶i ki¬m tra ðÕo cø lÕi "  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u   
                if  petEquipDD  ==  5  then
	       local  str  =  format(  "#ccc33cc Chúc m×ng ngß¶i ch½i ".."#{_INFOUSR%s}#c66ccff · Tô Châu #Y Vân San San (354,268)#B ch² #B thành công lên c¤p ra mãn c¤p Trang B¸ Trân Thú #{_INFOMSG%s} , li­u không phäi a ~",  GetName(sceneId,selfId),transfer)
	     BroadMsgByChatPipe(  sceneId,  selfId,  str,  4  )
                end
          end


        if  index  ==  2  then

                local  Chaijie  =  {}
                            Chaijie[75]  =  {2,5,9,14,20,27}
                            Chaijie[85]  =  {20,30,35,42,57,69}
                            Chaijie[95]  =  {50,68,90,115,143,171}

	 local  HumanMoney  =  LuaFnGetMoney(  sceneId,  selfId  )
    	 local  HumanMoneyJZ  =  GetMoneyJZ(  sceneId,  selfId  );
	 if  HumanMoney  +  HumanMoneyJZ  <  10000000    then
	 	 x001088_Tips(  sceneId,  selfId,  " ngß½i không ðü 1000 vàng, không th¬ phân giäi"  )
	 	 return
	 end
	 local  nDelJZ,  nDelMoney  =  LuaFnCostMoneyWithPriority(sceneId,  selfId,  10000000);

                if    LuaFnEraseItem(  sceneId,  selfId,  arg1  )  ~=  1  then
                        x001088_Tips(  sceneId,  selfId,  " không biªt sai l¥m , v§t ph¦m kh¤u tr× th¤t bÕi "  )
                        return
                end

                for  i  =  1,Chaijie[petEquipBB][petEquipDD]  do
                      TryRecieveItem(  sceneId,  selfId,  20301009,  1)    -- th¥n thú lâm 
                end

                x001088_Tips(  sceneId,  selfId,  " Chúc m×ng các hÕ, phân giäi trang b¸ trân thú thành công! thu ðßþc "..Chaijie[petEquipBB][petEquipDD].." cái Thánh Thú Lân "  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u   
          end



end


--*************************************************
-- màn änh trung gian ð¯i thoÕi ð« kÏ 
--*************************************************
function  x001088_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end


--**********************************
-- tiªp nh§n này NPC ðích nhi®m vø 
--**********************************
function  x001088_OnMissionAccept(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x001088_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 ret  =  CallScriptFunction(  missionScriptId,  "CheckAccept",  sceneId,  selfId  )
	 	 	 if  ret  >  0  then
	 	 	 	 CallScriptFunction(  missionScriptId,  "OnAccept",  sceneId,  selfId  )
	 	 	 end
	 	 	 return
	 	 end
	 end
end

--**********************************
-- cñ tuy®t này NPC ðích nhi®m vø 
--**********************************
function  x001088_OnMissionRefuse(  sceneId,  selfId,  targetId,  missionScriptId  )
	 -- cñ tuy®t sau , mu¯n tr· v« NPC chuy®n cüa món li®t bi¬u 
	 for  i,  findId  in  x001088_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x001088_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 x001088_UpdateEventList(  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- tiªp tøc ( ðã nh§n nhi®m vø )
--**********************************
function  x001088_OnMissionContinue(  sceneId,  selfId,  targetId,  missionScriptId  )
	 for  i,  findId  in  x001088_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnContinue",  sceneId,  selfId,  targetId  )
	 	 	 return
	 	 end
	 end
end

--**********************************
-- ð« giao ðã làm xong ðích nhi®m vø 
--**********************************
function  x001088_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )

	 -- xØ lý ð« giao sau ðích bi¬u hi®n tình hu¯ng 
	 -- vì an toàn , n½i này phäi c¦n th§n , không th¬ ra l²i 
	 local  nItemIndex  =  -1
	 
	 for  i,  item  in  x001088_g_EquipList  do
	 	 if  item.id  ==  selectRadioId    then
	 	 	 nItemIndex  =  i
	 	 end
	 end
	 
	 if  nItemIndex  ==  -1    then
	 	 return
	 end
	 
	 --  nhìn xong nhà có phäi hay không ðü tài li®u ð« giao 
	 local  nLevel  =  0
	 if  x001088_g_EquipList[nItemIndex].n  ==  8510  then
	 	 nLevel  =  1
	 end
	 if  x001088_g_EquipList[nItemIndex].n  ==  8520  then
	 	 nLevel  =  1
	 end
	 if  x001088_g_EquipList[nItemIndex].n  ==  8530  then
	 	 nLevel  =  1
	 end
	 if  x001088_g_EquipList[nItemIndex].n  ==  9510  then
	 	 nLevel  =  2
	 end
	 if  x001088_g_EquipList[nItemIndex].n  ==  9520  then
	 	 nLevel  =  2
	 end
	 if  x001088_g_EquipList[nItemIndex].n  ==  9530  then
	 	 nLevel  =  2
	 end

	 local  bStoneOk  =  0
	 if  GetItemCount(sceneId,  selfId,  x001088_g_StoneList[nLevel].id)  >=  x001088_g_StoneList[nLevel].num    then
	 	 bStoneOk  =  1
	 end
	 
	 if    bStoneOk  ==  0  then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Các hÕ không có ðü Thánh Thú Lân, không th¬ ð±i l¤y trang b¸ . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 
	 --  ki¬m tra có phäi hay không có ð¥y ðü ðá có th¬ kh¤u tr× 
	 if  LuaFnGetAvailableItemCount(sceneId,  selfId,  x001088_g_StoneList[nLevel].id)  <  x001088_g_StoneList[nLevel].num      then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Các hÕ không có ðü Thánh Thú Lân chßa th¬ ð±i ðßþc, xin m¶i ki¬m tra Thánh Thú Lân có ho£c ðang khóa  . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 	 
	 end
	 
	 --  ki¬m tra túi ðeo lßng không gian 
	 BeginAddItem(sceneId)
	 	 AddItem(sceneId,  selectRadioId,  1)
	 local  bBagOk  =  EndAddItem(sceneId,  selfId)
	 
	 if  bBagOk  <  1  then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Túi ðeo cüa ngß½i không ðü không gian. "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 end
	 local  nItemBagIndexStone  =  GetBagPosByItemSn(sceneId,  selfId,  x001088_g_StoneList[nLevel].id)
	 local  szTransferStone  =  GetBagItemTransfer(sceneId,selfId,  nItemBagIndexStone)
	 
	 --  thü tiêu tß½ng quan ðá 
	 local  bDelOk  =  LuaFnDelAvailableItem(sceneId,selfId,  x001088_g_StoneList[nLevel].id,  x001088_g_StoneList[nLevel].num)
	 
	 if  bDelOk  <  1    then
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " kh¤u tr× Thánh Thú Lân th¤t bÕi . "
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 return
	 else
	 	 -- cho hoàn nhà ð° , hoàn thành 
	 	 --  AddItemListToHuman(sceneId,selfId)
	 	 --
	 	 local  nBagIndex  =  TryRecieveItem(  sceneId,  selfId,  x001088_g_EquipList[nItemIndex].id,  1  );
	 	 
	 	 BeginEvent(sceneId)
	 	 	 strText  =  " Chúc m×ng các hÕ, thành công ð±i ðßþc [#{_ITEM"..x001088_g_EquipList[nItemIndex].id.."}]"
	 	 	 AddText(sceneId,strText);
	 	 EndEvent(sceneId)
	 	 DispatchMissionTips(sceneId,selfId)
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	 	 
	 	 local  message;	 
	 	 local  randMessage  =  random(3);
	 	 local  sItemName  =  GetItemName(sceneId,  x001088_g_EquipList[nItemIndex].id)
	 	 
	 	 local  szTransferEquip  =  GetBagItemTransfer(sceneId,selfId,  nBagIndex)
	 	 
	 	 if  randMessage  ==  1  then
	 	       	 message  =  format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#I mµt mñc cung kính ðßa ðªn #G Tô Châu #R Vân San San (354,268)#I cß¶i to haha: “ r¤t t¯t, cái này #{_INFOMSG%s}#{WLS_11}",  LuaFnGetName(sceneId,  selfId),  x001088_g_StoneList[nLevel].num,  szTransferStone,  szTransferEquip);
	 	 elseif  randMessage  ==  2  then
	 	 	 message  =  format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}	 #I ðßa ðªn #G Tô Châu #R Vân San San (354,268)#I ch¡p tay : “ làm phi«n làm phi«n , #{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}",  LuaFnGetName(sceneId,  selfId),  x001088_g_StoneList[nLevel].num,  szTransferStone,  szTransferStone,  szTransferEquip);
	 	 else
	 	 	 message  =  format("#W#G Tô Châu #R Vân San San (354,268)#I ðang bßng #Y%d#cffffcc phiªn #W#{_INFOMSG%s}#cffffcc t× trung ðích khen : “#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}",  x001088_g_StoneList[nLevel].num,  szTransferStone,  LuaFnGetName(sceneId,  selfId),  szTransferEquip);
	 	 end
	 	 
	 	 BroadMsgByChatPipe(sceneId,  selfId,  message,  4);  
	 	 return
	 end

	 for  i,  findId  in  x001088_g_eventList  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
	 for  i,  findId  in  g_eventListTest  do
	 	 if  missionScriptId  ==  findId  then
	 	 	 CallScriptFunction(  missionScriptId,  "OnSubmit",  sceneId,  selfId,  targetId,  selectRadioId  )
	 	 	 return
	 	 end
	 end
end
