-- trân thú sáo trang and trân thú hþp th¬ 
-- hÕt tØ   QQ-718805400 luy®n chª 
x889138_g_scriptId  =  889138

function  x889138_OnImpactFadeOut(  sceneId,  selfId,  impactId  )

        if  GetLevel(sceneId,  selfId)  <  45  then
              x889138_Tips(sceneId,  selfId,  "45 c¤p tr· lên m¾i có th¬ sØ døng thú h°n phø th¬ chÑc nång ")
              return
        end

        if  impactId  ==  1399  then
              local  hetipetid  =  GetMissionData(sceneId,selfId,HETI_PETID_ITEM)
              if  hetipetid  >  0  then
                    x889138_PetEquip(  sceneId,  selfId,  103,  hetipetid  )
              else
                    x889138_Tips(sceneId,  selfId,  " xin ði¬m kích trân thú gi¾i m£t ðích “ phø th¬ ” cái nút tiªn hành trân thú phø th¬ ")
              end
        else
              x889138_Tips(sceneId,  selfId,  " s¯ li®u sai l¥m , xin liên lÕc GM")
        end
end


function  x889138_PetEquip(  sceneId,  selfId,  index,  mypetguid,  shuju1,shuju2  )
-- hþp th¬ 
    local  HetiPet  =  GetMissionData(sceneId,  selfId,  HETI_PETID)
    local  HetiBuff  =  GetMissionData(sceneId,  selfId,  HETI_BUFF)
-- sáo trang 
    local  aa=  floor(  mod(  GetMissionData(  sceneId,  selfId,  EQUIP_PET_HEAD  ),100000)/10)
    local  bb=  floor(  mod(  GetMissionData(  sceneId,  selfId,  EQUIP_PET_HAND  ),100000)/10)
    local  cc=  floor(  mod(  GetMissionData(  sceneId,  selfId,  EQUIP_PET_LORI  ),100000)/10)
    local  dd=  floor(  mod(  GetMissionData(  sceneId,  selfId,  EQUIP_PET_RING  ),100000)/10)
    local  ee=  floor(  mod(  GetMissionData(  sceneId,  selfId,  EQUIP_PET_HUFU  ),100000)/10)
    if  aa  ==  bb  ==  cc  ==  dd  ==  ee  then
	 SetMissionData(sceneId,  selfId,  EQUIP_PETTAO,  aa);
    else
	 SetMissionData(sceneId,  selfId,  EQUIP_PETTAO,  0);
    end

-- trân thú tháo giä bµ 
      if  index  ==  5  then

	 	 if  shuju1  ==  1  then
	 	 	 local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )
	 	 	 if  FreeSpace  <  1  then
	 	 	 	 x889138_Tips(sceneId,  selfId,  " xin/m¶i · lßng túi dñ lßu mµt ch² tr¯ng ")
	 	 	 	 return
	 	 	 end
	 	 	 local  equipid=GetMissionData(  sceneId,  selfId,  EQUIP_PET_HEAD  )	 
	 	 	 if  equipid  >=  39975111  and  equipid  <=39995365  then
	 	 	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_HEAD,  0);
	 	 	 	 TryRecieveItem(sceneId,  selfId,  equipid,  1)
                                                                x889138_PetEquipBuff(sceneId,  selfId)
	 	 	 end

	 	 elseif  shuju1  ==  2  then
	 	 	 local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )
	 	 	 if  FreeSpace  <  1  then
	 	 	 	 x889138_Tips(sceneId,  selfId,  " xin/m¶i · lßng túi dñ lßu mµt ch² tr¯ng ")
	 	 	 	 return
	 	 	 end
	 	 	 local  equipid=GetMissionData(  sceneId,  selfId,  EQUIP_PET_HAND  )
	 	 	 if  equipid  >=  39975111  and  equipid  <=39995365  then
	 	 	 	 TryRecieveItem(sceneId,  selfId,  equipid,  1)
	 	 	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_HAND,  0);
                                                                x889138_PetEquipBuff(sceneId,  selfId)
	 	 	 end

	 	 elseif  shuju1  ==  3  then
	 	 	 local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )
	 	 	 if  FreeSpace  <  1  then
	 	 	 	 x889138_Tips(sceneId,  selfId,  " xin/m¶i · lßng túi dñ lßu mµt ch² tr¯ng ")
	 	 	 	 return
	 	 	 end
	 	 	 local  equipid=GetMissionData(  sceneId,  selfId,  EQUIP_PET_LORI  )
	 	 	 if  equipid  >=  39975111  and  equipid  <=39995365  then
	 	 	 	 TryRecieveItem(sceneId,  selfId,  equipid,  1)
	 	 	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_LORI,  0);
                                                                x889138_PetEquipBuff(sceneId,  selfId)
	 	 	 end

	 	 elseif  shuju1  ==  4  then
	 	 	 local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )
	 	 	 if  FreeSpace  <  1  then
	 	 	 	 x889138_Tips(sceneId,  selfId,  " xin/m¶i · lßng túi dñ lßu mµt ch² tr¯ng ")
	 	 	 	 return
	 	 	 end
	 	 	 local  equipid=GetMissionData(  sceneId,  selfId,  EQUIP_PET_RING  )
	 	 	 if  equipid  >=  39975111  and  equipid  <=39995365  then
	 	 	 	 TryRecieveItem(sceneId,  selfId,  equipid,  1)
	 	 	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_RING,  0);
                                                                x889138_PetEquipBuff(sceneId,  selfId)
	 	 	 end
	 	 elseif  shuju1  ==  5  then
	 	 	 local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )
	 	 	 if  FreeSpace  <  1  then
	 	 	 	 x889138_Tips(sceneId,  selfId,  " xin/m¶i · lßng túi dñ lßu mµt ch² tr¯ng ")
	 	 	 	 return
	 	 	 end
	 	 	 local  equipid=GetMissionData(  sceneId,  selfId,  EQUIP_PET_HUFU  )
	 	 	 if  equipid  >=  39975111  and  equipid  <=39995365  then
	 	 	 	 TryRecieveItem(sceneId,  selfId,  equipid,  1)
	 	 	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_HUFU,  0);
                                                                x889138_PetEquipBuff(sceneId,  selfId)
	 	 	 end
                                end
        end


-- mµt ki®n tháo trang 
      if  index  ==  100  then
	 	 local  FreeSpace  =  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )
	 	 if  FreeSpace  <  5  then
	 	 	 x889138_Tips(sceneId,  selfId,  " xin/m¶i · lßng túi dñ lßu 5 cá ch² tr¯ng ")
	 	 	 return
	 	 end
	 	 for  i  =  461,  465  do
	 	 	 if    GetMissionData(sceneId,  selfId,  i  )  >  0    then
	 	 	 	 TryRecieveItem(sceneId,  selfId,  GetMissionData(sceneId,  selfId,  i  ),  1)
	 	 	 end
	 	 end
	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_HEAD,  0)
	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_HAND,  0)
	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_LORI,  0)
	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_RING,  0)
	 	 SetMissionData(sceneId,  selfId,  EQUIP_PET_HUFU,  0)
	 	 SetMissionData(sceneId,  selfId,  EQUIP_PETTAO,  0)
	 end

-- cà m¾i buff
if  index  ==  -5  then
                x889138_PetEquipBuff(sceneId,  selfId)  
end



-- trân thú phø th¬ · dçn d¡t 
      if  index  ==  101  then
            if  HetiPet  ~=  0  then
                  x889138_Tips(  sceneId,  selfId,  " ngß½i trß¾c m£t ðã có trân thú phø th¬ , xin/m¶i trß¾c vào ðßþc chia lìa "  )
                  return
            end
            local  pgH  ,  pgL  =  LuaFnGetCurrentPetGUID(sceneId,  selfId)
            if  mypetguid  ==  pgL  then
                  x889138_Tips(  sceneId,  selfId,  " không th¬ sØ døng ðang xu¤t chiªn ðích trân thú tiªn hành phø th¬ "  )
                  return
            end
            if  GetLevel(sceneId,  selfId)  <  45  then
                  x889138_Tips(  sceneId,  selfId,  "45 c¤p tr· lên m¾i có th¬ sØ døng thú h°n phø th¬ chÑc nång "  )
                  return
            end

            SetMissionData(sceneId,selfId,HETI_PETID_ITEM,mypetguid)
            BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,238)
	 UICommand_AddString(sceneId,"ski13")
	 EndUICommand(sceneId)
            DispatchUICommand(sceneId,selfId,2014092002)
end

-- phø th¬ chia lìa 
if  index  ==  102  then
            if  HetiPet  ==  nil  or  HetiPet  ==  0  then
                  x889138_Tips(  sceneId,  selfId,  " ngß½i trß¾c m£t không có trân thú tiªn hành phø th¬ , chia lìa cá JB a "  )
                  return
            end
            if  HetiPet  ~=  mypetguid  then
                  x889138_Tips(  sceneId,  selfId,  " ngß½i trß¾c m£t lña ch÷n trân thú không phäi là trß¾c phø th¬ ðích trân thú , xin/m¶i l¥n næa lña ch÷n "  )
                  return
            end
            LuaFnCancelSpecificImpact(sceneId,selfId,HetiBuff)
            SetMissionData(sceneId,  selfId,  HETI_PETID,  0  )
            x889138_Tips(  sceneId,  selfId,  " chúc m×ng , phø th¬ chia lìa thành công "  )
end

-- trân thú phø th¬ 
if  index  ==  103  then
            if  HetiBuff  <  1401  or  HetiBuff  >  1436  then
                  HetiBuff  =  1400
            end
            -- có th¬ dùng v¾i ki¬m tr¡c trên ngß¶i trân thú có trß¾c m£t trân thú ðích myguid
            SetMissionData(sceneId,  selfId,  HETI_PETID,  mypetguid  )
            LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,HetiBuff,0)
            x889138_Tips(  sceneId,  selfId,  " chúc m×ng , phø th¬ thành công   "  )
            SetMissionData(sceneId,selfId,HETI_PETID_ITEM,0)
            BeginUICommand(  sceneId  )
            EndUICommand(  sceneId  )
            DispatchUICommand(  sceneId,  selfId,  201710301  )
end



-- phø th¬ dung h°n 
if  index  ==  999  then
      if  mypetguid  <  0  or  mypetguid  >  4  then
            x889138_Tips(  sceneId,  selfId,  "Error"  )
            return
      end
          CallScriptFunction(  889822,  "OnImpactFadeOut",  sceneId,selfId,1392+mypetguid*9  )
end


end


--*************************************************
-- màn änh trung gian ð¯i thoÕi ð« kÏ 
--*************************************************
function  x889138_Tips(  sceneId,  selfId,msg  )
BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg)
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end


--*************************************************
-- trân thú buff cà m¾i 
--*************************************************

function  x889138_PetEquipBuff(sceneId,  selfId)    -- hàm s¯ nh§p kh¦u 

              local  liliangbuff,lingqibuff,tilibuff,dinglibuff,shenfabuff  =  13000,13700,14400,15600,16300              -- lñc lßþng ? linh khí ? th¬ lñc ? ð¸nh lñc ? thân pháp 
              local  shuxingtable1,shuxingtable2,shuxingtable3,shuxingtable4  =  17000,18050,19100,20150                      -- thuµc tính công kích : bång ? lØa ? huy«n ? ðµc 
              local  shuxingtablecc1,shuxingtablecc2,shuxingtablecc3,shuxingtablecc4  =  21200,22200,23200,24200      -- thuµc tính ch¯ng cñ : bång ? lØa ? huy«n ? ðµc 
              local  shuxingtablecc5,shuxingtablecc6,shuxingtablecc7,shuxingtablecc8  =  25200,25900,26600,27300      -- thuµc tính giäm kháng : bång ? lØa ? huy«n ? ðµc 
              local  shuxingwaigong,shuxingneigong,shuxingwaifang,shuxingneifang,mingzhongbuff,shuxingshanbi,shuxinghuixin,shuxinghuifang  =  28000,28400,28800,29200,29600,31000,30000,30100
              local  xueshangxbuff,xxxxassx  =  30200,31400      -- máu thßþng hÕn , ph¥n tråm so máu thßþng hÕn 

	 local  pgH  ,  pgL  =  LuaFnGetCurrentPetGUID(sceneId,  selfId)
	 local  ObjId  =  0
	 if  pgH  ~=  nil  or  pgL  ~=  nil  then
	                 ObjId  =  LuaFnGetPetObjIdByGUID(  sceneId,  selfId,  pgH,  pgL  )
	 end

	 --  c¤p b§c ki¬m tr¡c 
	 if  ObjId  ==  0  then
	 	 return
	 end

                local  petLevel  =  LuaFnGetPetLevelByGUID(sceneId,selfId,pgH,  pgL)

                -- ð¥u 
	 local  a  =  GetMissionData(sceneId,  selfId,  EQUIP_PET_HEAD  )
                local  headStar  =  floor(mod(a,100)/10)
                local  headType  =  floor(mod(a,1000)/100)
                local  headLev  =  floor(mod(a,100000)/1000)
                local  headSX  =  floor(mod(a,100000)/10)

                local  headJCFY,headWF,headNF,headWG,headNG,headMZ,headSB,headHX,headLQ,headLL,headTL  =  0,0,0,0,0,0,0,0,0,0,0
                if  headLev  ==  75  or  headLev  ==  85  or  headLev  ==  95  then
                      headJCFY  =  (headLev  -  25)/10
                      if  headType  ==  1  then
                            if  headLev  >=  75  then
                                  headNG  =  (headLev  -  65)/10*headStar
                                  headHX  =  (headLev  -  65)/10*headStar
                            end
                            if  headLev  >=  85  then  
                                  headMZ  =  floor(((headLev  -  75)/10*headStar)/3)
                            end
                            if  headLev  >=  95  then
                                  headLQ  =  floor((headStar*petLevel)/20)+headStar+1
                            else
                                  headLQ  =  floor((headStar*petLevel)/20)+1
                            end
                      elseif  headType  ==  2  then
                            if  headLev  >=  75  then
                                  headWG  =  (headLev  -  65)/10*headStar
                                  headHX  =  (headLev  -  65)/10*headStar
                            end
                            if  headLev  >=  85  then  
                                  headMZ  =  floor(((headLev  -  75)/10*headStar)/3)
                            end
                            if  headLev  >=  95  then
                                  headLL  =  floor((headStar*petLevel)/20)+headStar+1
                            else
                                  headLL  =  floor((headStar*petLevel)/20)+1
                            end
                      elseif  headType  ==  3  then
                            if  headLev  >=  75  then
                                  headWF  =  (headLev  -  65)/10*headStar
                                  headNF  =  (headLev  -  65)/10*headStar
                            end
                            if  headLev  >=  85  then  
                                  headSB  =  floor(((headLev  -  75)/10*headStar)/3)
                            end
                            if  headLev  >=  95  then
                                  headTL  =  floor((headStar*petLevel)/20)+headStar+1
                            else
                                  headTL  =  floor((headStar*petLevel)/20)+1
                            end
                      end
                end


                -- móng 
	 local  b  =  GetMissionData(sceneId,  selfId,  EQUIP_PET_HAND  )
                local  handStar  =  floor(mod(b,100)/10)
                local  handType  =  floor(mod(b,1000)/100)
                local  handLev  =  floor(mod(b,100000)/1000)
                local  handSX  =  floor(mod(b,100000)/10)

                local  handJCGJ,handWF,handNF,handWG,handNG,handMZ,handSB,handHX,handLQ,handLL,handTL  =  0,0,0,0,0,0,0,0,0,0,0
                if  handLev  ==  75  or  handLev  ==  85  or  handLev  ==  95  then
                      handJCGJ  =  (handLev  -  25)/10
                      if  handType  ==  1  then
                            if  handLev  >=  75  then
                                  handNG  =  (handLev  -  65)/10*handStar
                                  handHX  =  (handLev  -  65)/10*handStar
                            end
                            if  handLev  >=  85  then  
                                  handMZ  =  floor(((handLev  -  75)/10*handStar)/3)
                            end
                            if  handLev  >=  95  then
                                  handLQ  =  floor((handStar*petLevel)/20)+handStar+1
                            else
                                  handLQ  =  floor((handStar*petLevel)/20)+1
                            end
                      elseif  handType  ==  2  then
                            if  handLev  >=  75  then
                                  handWG  =  (handLev  -  65)/10*handStar
                                  handHX  =  (handLev  -  65)/10*handStar
                            end
                            if  handLev  >=  85  then  
                                  handMZ  =  floor(((handLev  -  75)/10*handStar)/3)
                            end
                            if  handLev  >=  95  then
                                  handLL  =  floor((handStar*petLevel)/20)+handStar+1
                            else
                                  handLL  =  floor((handStar*petLevel)/20)+1
                            end
                      elseif  handType  ==  3  then
                            if  handLev  >=  75  then
                                  handWF  =  (handLev  -  65)/10*handStar
                                  handNF  =  (handLev  -  65)/10*handStar
                            end
                            if  handLev  >=  85  then  
                                  handSB  =  floor(((handLev  -  75)/10*handStar)/3)
                            end
                            if  handLev  >=  95  then
                                  handTL  =  floor((handStar*petLevel)/20)+handStar+1
                            else
                                  handTL  =  floor((handStar*petLevel)/20)+1
                            end
                      end
                end


                -- giáp 
	 local  c  =  GetMissionData(sceneId,  selfId,  EQUIP_PET_LORI  )
                local  loriStar  =  floor(mod(c,100)/10)
                local  loriType  =  floor(mod(c,1000)/100)
                local  loriLev  =  floor(mod(c,100000)/1000)
                local  loriSX  =  floor(mod(c,100000)/10)

                local  loriJCFY,loriWF,loriNF,loriWG,loriNG,loriMZ,loriSB,loriHX,loriLQ,loriLL,loriTL  =  0,0,0,0,0,0,0,0,0,0,0
                if  loriLev  ==  75  or  loriLev  ==  85  or  loriLev  ==  95  then
                      loriJCFY  =  (loriLev  -  25)/10
                      if  loriType  ==  1  then
                            if  loriLev  >=  75  then
                                  loriNG  =  (loriLev  -  65)/10*loriStar
                                  loriHX  =  (loriLev  -  65)/10*loriStar
                            end
                            if  loriLev  >=  85  then  
                                  loriMZ  =  floor(((loriLev  -  75)/10*loriStar)/3)
                            end
                            if  loriLev  >=  95  then
                                  loriLQ  =  floor((loriStar*petLevel)/20)+loriStar+1
                            else
                                  loriLQ  =  floor((loriStar*petLevel)/20)+1
                            end
                      elseif  loriType  ==  2  then
                            if  loriLev  >=  75  then
                                  loriWG  =  (loriLev  -  65)/10*loriStar
                                  loriHX  =  (loriLev  -  65)/10*loriStar
                            end
                            if  loriLev  >=  85  then  
                                  loriMZ  =  floor(((loriLev  -  75)/10*loriStar)/3)
                            end
                            if  loriLev  >=  95  then
                                  loriLL  =  floor((loriStar*petLevel)/20)+loriStar+1
                            else
                                  loriLL  =  floor((loriStar*petLevel)/20)+1
                            end
                      elseif  loriType  ==  3  then
                            if  loriLev  >=  75  then
                                  loriWF  =  (loriLev  -  65)/10*loriStar
                                  loriNF  =  (loriLev  -  65)/10*loriStar
                            end
                            if  loriLev  >=  85  then  
                                  loriSB  =  floor(((loriLev  -  75)/10*loriStar)/3)
                            end
                            if  loriLev  >=  95  then
                                  loriTL  =  floor((loriStar*petLevel)/20)+loriStar+1
                            else
                                  loriTL  =  floor((loriStar*petLevel)/20)+1
                            end
                      end
                end


                -- hoàn 
	 local  d  =  GetMissionData(sceneId,  selfId,  EQUIP_PET_RING  )
                local  ringStar  =  floor(mod(d,100)/10)
                local  ringType  =  floor(mod(d,1000)/100)
                local  ringLev  =  floor(mod(d,100000)/1000)
                local  ringSX  =  floor(mod(d,100000)/10)

                local  ringJCSB,ringLQ,ringLL,ringTL  =  0,0,0,0
                if  ringLev  ==  75  or  ringLev  ==  85  or  ringLev  ==  95  then
                      ringJCSB  =  (ringLev  -  25)/10
                      if  ringType  ==  1  then
                            ringLQ  =  floor((ringStar*petLevel)/20)+ringStar+1  -- linh khí khª hþp 
                      elseif  ringType  ==  2  then
                            ringLL  =  floor((ringStar*petLevel)/20)+ringStar+1  -- lñc lßþng khª hþp 
                      elseif  ringType  ==  3  then
                            ringTL  =  floor((ringStar*petLevel)/20)+ringStar+1  -- th¬ lñc khª hþp 
                      end
                end


                -- sÑc 
	 local  e  =  GetMissionData(sceneId,  selfId,  EQUIP_PET_HUFU  )
                local  hufuStar  =  floor(mod(e,100)/10)
                local  hufuType  =  floor(mod(e,1000)/100)
                local  hufuLev  =  floor(mod(e,100000)/1000)
                local  hufuSX  =  floor(mod(e,100000)/10)

                local  hufuJCGJ,hufuWF,hufuNF,hufuWG,hufuNG,hufuMZ,hufuSB,hufuHX,hufuLQ,hufuLL,hufuTL  =  0,0,0,0,0,0,0,0,0,0,0
                if  hufuLev  ==  75  or  hufuLev  ==  85  or  hufuLev  ==  95  then
                      hufuJCGJ  =  (hufuLev  -  25)/10
                      if  hufuType  ==  1  then
                            if  hufuLev  >=  75  then
                                  hufuNG  =  (hufuLev  -  65)/10*hufuStar
                                  hufuHX  =  (hufuLev  -  65)/10*hufuStar
                            end
                            if  hufuLev  >=  85  then  
                                  hufuMZ  =  floor(((hufuLev  -  75)/10*hufuStar)/3)
                            end
                            if  hufuLev  >=  95  then
                                  hufuLQ  =  floor((hufuStar*petLevel)/20)+hufuStar+1
                            else
                                  hufuLQ  =  floor((hufuStar*petLevel)/20)+1
                            end
                      elseif  hufuType  ==  2  then
                            if  hufuLev  >=  75  then
                                  hufuWG  =  (hufuLev  -  65)/10*hufuStar
                                  hufuHX  =  (hufuLev  -  65)/10*hufuStar
                            end
                            if  hufuLev  >=  85  then  
                                  hufuMZ  =  floor(((hufuLev  -  75)/10*hufuStar)/3)
                            end
                            if  hufuLev  >=  95  then
                                  hufuLL  =  floor((hufuStar*petLevel)/20)+hufuStar+1
                            else
                                  hufuLL  =  floor((hufuStar*petLevel)/20)+1
                            end
                      elseif  hufuType  ==  3  then
                            if  hufuLev  >=  75  then
                                  hufuWF  =  (hufuLev  -  65)/10*hufuStar
                                  hufuNF  =  (hufuLev  -  65)/10*hufuStar
                            end
                            if  hufuLev  >=  85  then  
                                  hufuSB  =  floor(((hufuLev  -  75)/10*hufuStar)/3)
                            end
                            if  hufuLev  >=  95  then
                                  hufuTL  =  floor((hufuStar*petLevel)/20)+hufuStar+1
                            else
                                  hufuTL  =  floor((hufuStar*petLevel)/20)+1
                            end
                      end
                end

                -- sáo trang thuµc tính 
                local  tt  =  GetMissionData(sceneId,  selfId,  EQUIP_PETTAO  )
                local  TaoLev  =  floor(tt/100)
                local  TaoType  =  mod(tt,10)
                local  TaoStar  =  floor(mod(tt,100)/10)
                if  TaoLev  ==  75  or  TaoLev  ==  85  or  TaoLev  ==  95  then  
                -- n½i này là sáo trang thuµc tính , trß¾c tr¯ng không , lßu ðþi khäo nghi®m 
                -- n½i này là sáo trang thuµc tính , trß¾c tr¯ng không , lßu ðþi khäo nghi®m 
                -- n½i này là sáo trang thuµc tính , trß¾c tr¯ng không , lßu ðþi khäo nghi®m 
                -- n½i này là sáo trang thuµc tính , trß¾c tr¯ng không , lßu ðþi khäo nghi®m 
                -- n½i này là sáo trang thuµc tính , trß¾c tr¯ng không , lßu ðþi khäo nghi®m 
                end


                shuxingwaigong  =  shuxingwaigong+handJCGJ+hufuJCGJ+headWG+handWG+loriWG+hufuWG            -- ngoÕi công 
	 shuxingneigong  =  shuxingneigong+handJCGJ+hufuJCGJ+headNG+handNG+loriNG+hufuWG          -- nµi công 
                shuxingwaifang  =  shuxingwaifang+headJCFY+loriJCFY+headWF+handWF+loriWF+hufuWF      -- bên ngoài phòng 
	 shuxingneifang  =  shuxingneifang+headJCFY+loriJCFY+headNF+handNF+loriNF+hufuNF      -- bên trong phòng 
	 mingzhongbuff  =  mingzhongbuff+headMZ+handMZ+loriMZ+hufuMZ      -- m®nh trung 
	 shuxingshanbi  =  shuxingshanbi+ringJCSB+headSB+handSB+loriSB+hufuSB      -- né tránh 
                shuxinghuixin  =  shuxinghuixin+headHX+handHX+loriHX+hufuHX      -- hµi tâm 
	 liliangbuff  =  liliangbuff+headLL+handLL+loriLL+ringLL+hufuLL      -- lñc lßþng 
	 lingqibuff  =  lingqibuff+headLQ+handLQ+loriLQ+ringLQ+hufuLQ          -- linh khí 
	 tilibuff  =  tilibuff+headTL+handTL+loriTL+ringTL+hufuTL                -- th¬ lñc 


	 -- lñc lßþng 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,liliangbuff)
	 if  nRet  ~=  1  then
                      if  liliangbuff  >  13699  then
                            liliangbuff  =  13699
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,  liliangbuff,  0)
	 end

	 -- linh khí 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,lingqibuff)
	 if  nRet  ~=  1  then
                      if  lingqibuff  >  14399  then
                            lingqibuff  =  14399
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,lingqibuff,  0)
	 end

	 -- th¬ lñc 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,tilibuff)
	 if  nRet  ~=  1  then
                      if  tilibuff  >  15599  then
                            tilibuff  =  15599
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,tilibuff,  0)
	 end	 

	 -- m®nh trung 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,mingzhongbuff)
	 if  nRet  ~=  1  then
                      if  mingzhongbuff  >  29999  then
                            mingzhongbuff  =  29999
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,mingzhongbuff,  0)
	 end	 
	 
	 -- né tránh 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,shuxingshanbi)
	 if  nRet  ~=  1  then
                      if  shuxingshanbi  >  31399  then
                            shuxingshanbi  =  31399
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,shuxingshanbi,  0)
	 end

	 -- bên ngoài công 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,shuxingwaigong)
	 if  nRet  ~=  1  then
                      if  shuxingwaigong  >  28399  then
                            shuxingwaigong  =  28399
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,shuxingwaigong,  0)
	 end	 

	 -- bên trong công 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,shuxingneigong)
	 if  nRet  ~=  1  then
                      if  shuxingneigong  >  28799  then
                            shuxingneigong  =  28799
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,shuxingneigong,  0)
	 end

	 -- bên ngoài phòng 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,shuxingwaifang)
	 if  nRet  ~=  1  then
                      if  shuxingwaifang  >  29199  then
                            shuxingwaifang  =  29199
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,shuxingwaifang,  0)
	 end
	 
	 -- bên trong phòng 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,shuxingneifang)
	 if  nRet  ~=  1  then
                      if  shuxingneifang  >  29599  then
                            shuxingneifang  =  29599
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,shuxingneifang,  0)
	 end	 	 

	 -- hµi tâm 
	 local  nRet  =  LuaFnHaveImpactOfSpecificDataIndex(sceneId,  ObjId,shuxinghuixin)
	 if  nRet  ~=  1  then
                      if  shuxinghuixin  >  30099  then
                            shuxinghuixin  =  30099
                      end
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  ObjId,  ObjId,  ObjId,shuxinghuixin,  0)
	 end

                --if  headType  ==  3  or  handType  ==  3  or  loriType  ==  3  or  ringType  ==  3  or  hufuType  ==  3  then
                --      RestoreHp(  sceneId,  ObjId  )
	 --end
end


-----------«««««««« t§p thành BUFF  nói rõ »»»»»»------------
  
-- lñc lßþng     13000    ðªn     13699      t±ng cµng   700 cá     ( lñc lßþng l¾n nh¤t 6990)  m²i l¥n thêm 10 ði¬m 
-- linh khí     13700    ðªn     14399      t±ng cµng   700 cá     ( linh khí l¾n nh¤t 6990)  m²i l¥n thêm 10 ði¬m 
-- th¬ lñc     14400    ðªn     15599      t±ng cµng   1200 cá     ( th¬ lñc l¾n nh¤t 11990)  m²i l¥n thêm 10 ði¬m 
-- ð¸nh lñc     15600    ðªn     16299      t±ng cµng   700 cá     ( ð¸nh lñc l¾n nh¤t 6990)  m²i l¥n thêm 10 ði¬m 
-- thân pháp     16300    ðªn     16999      t±ng cµng   700 cá     ( thân pháp l¾n nh¤t 6990)  m²i l¥n thêm 10 ði¬m 
------------------------------------------------------------------
-- bång công     17000    ðªn       18049      t±ng cµng 1050 cá   ( bång công l¾n nh¤t 15735)  m²i l¥n thêm 15 ði¬m 
-- lØa công     18050    ðªn       19099      t±ng cµng 1050 cá   ( lØa công l¾n nh¤t 15735)  m²i l¥n thêm 15 ði¬m 
-- huy«n công     19100    ðªn       20149      t±ng cµng 1050 cá   ( huy«n công l¾n nh¤t 15735)  m²i l¥n thêm 15 ði¬m 
-- ðµc công     20150    ðªn       21199      t±ng cµng 1050 cá   ( ðµc công l¾n nh¤t 15735)  m²i l¥n thêm 15 ði¬m 
-------------------------------------------------------------------
-- bång kháng       21200  ðªn         22199      t±ng cµng 1000 cá   ( bång kháng l¾n nh¤t 3996)  m²i l¥n thêm 4 ði¬m 
-- lØa kháng       22200  ðªn         23199      t±ng cµng 1000 cá   ( lØa kháng l¾n nh¤t 3996)  m²i l¥n thêm 4 ði¬m 
-- huy«n kháng       23200  ðªn         24199      t±ng cµng 1000 cá   ( huy«n kháng l¾n nh¤t 3996)  m²i l¥n thêm 4 ði¬m 
-- ðµc kháng       24200  ðªn         25199      t±ng cµng 1000 cá   ( ðµc kháng l¾n nh¤t 3996)  m²i l¥n thêm 4 ði¬m 
------------------------------------------------------------------
-- bång giäm kháng       25200  ðªn         25899      t±ng cµng 700 cá   ( bång giäm kháng l¾n nh¤t 2796)  m²i l¥n thêm 4 ði¬m 
-- lØa giäm kháng       25900  ðªn         26599      t±ng cµng 700 cá   ( lØa giäm kháng l¾n nh¤t 2796)  m²i l¥n thêm 4 ði¬m 
-- huy«n giäm kháng       26600  ðªn         27299      t±ng cµng 700 cá   ( huy«n giäm kháng l¾n nh¤t 2796)  m²i l¥n thêm 4 ði¬m 
-- ðµc giäm kháng       27300  ðªn         27999      t±ng cµng 700 cá   ( ðµc giäm kháng l¾n nh¤t 2796)  m²i l¥n thêm 4 ði¬m 
-------------------------------------------------------------------
-- bên ngoài công kích       28000  ðªn         28399    t±ng cµng 400 cá     ( bên ngoài công kích l¾n nh¤t 79800)  m²i l¥n thêm 200 ði¬m 
-- bên trong công kích       28400  ðªn         28799    t±ng cµng 400 cá     ( bên trong công kích l¾n nh¤t 79800)  m²i l¥n thêm 200 ði¬m 
-- ngoÕi công phòng       28800  ðªn         29199    t±ng cµng 400 cá     ( ngoÕi công phòng l¾n nh¤t 39900)  m²i l¥n thêm 100 ði¬m 
-- nµi công phòng       29200  ðªn         29599    t±ng cµng 400 cá     ( nµi công phòng l¾n nh¤t 39900)  m²i l¥n thêm 100 ði¬m 
-- m®nh trung           29600  ðªn         29999    t±ng cµng 400 cá       ( m®nh trung l¾n nh¤t 39900)  m²i l¥n thêm 100 ði¬m 
-- hµi tâm         30000    ðªn         30099    t±ng cµng 100 cá   ( hµi tâm l¾n nh¤t 297)  m²i l¥n thêm 3 ði¬m 
-- s¨ phòng         30100    ðªn         30199    t±ng cµng 100 cá   ( s¨ phòng l¾n nh¤t 198)  m²i l¥n thêm 2 ði¬m 
-- máu thßþng hÕn     30200    ðªn         30999    t±ng cµng 800 cá   ( máu thßþng hÕn l¾n nh¤t 799000)  m²i l¥n thêm 1000 ði¬m 
-- né tránh         31000    ðªn         31399    t±ng cµng 400 cá   ( né tránh l¾n nh¤t 31920)    m²i l¥n thêm 80 ði¬m 
