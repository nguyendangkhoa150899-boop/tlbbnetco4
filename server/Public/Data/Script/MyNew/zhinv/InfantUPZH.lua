--writer  by  UK  QQ  2269169441  
--20150410  18:13
-- theo du?i hoàn m? ph?m ch?t 

x890545_g_scriptId  =  890545
x890545_g_item1  =  {[31001470]  =  1,[31001471]  =  2,[31001472]  =  3,[31001473]  =  4,[31001474]  =  5}  -- tho --*· sách --*· l? · nh?c --*· b?n 
x890545_g_NAME  =  {[31001470]  =  "#GTh½  ",[31001471]  =  "#GSách ",[31001472]  =  "#GL­  ",[31001473]  =  "#GNhÕc ",[31001474]  =  "#GXÕ "}  
x890545_g_item2  =  31001469
--**********************************
-- s? ki?n dóng h? nh?p kh?u 
--**********************************
function  x890545_OnDefaultEvent(  sceneId,  selfId,  bagIndex  )
--  không c?n cái này ti?p l?i , nhung mu?n c?t gi? vô ích hàm s? 
end

--**********************************
-- cái này v?t ph?m dích s? d?ng quá trình là hay không tuong t? v?i k? nang : 
-- h? th?ng s? ? thi hành lúc b?t d?u ki?m tr?c cái này hàm s? dích tr? v? tr? giá , n?u nhu tr? v? th?t b?i là coi thu?ng phía sau tuong t? k? nang dích thi hành . 
-- tr? v? 1 : k? nang tuong t? v?t ph?m , có th? ti?p t?c tuong t? k? nang dích thi hành ; tr? v? 0 : coi thu?ng phía sau thao tác . 
--**********************************
function  x890545_IsSkillLikeScript(  sceneId,  selfId)
	 return  1;  -- cái này chân v?n c?n d?ng tác ?ng h? 
end

--**********************************
-- tr?c ti?p h?y b? hi?u qu? : 
-- h? th?ng s? tr?c ti?p di?u d?ng cái này ti?p l?i , cung can c? cái này hàm s? dích tr? v? tr? giá xác d?nh sau này luu trình có hay không thi hành . 
-- tr? v? 1 : dã h?y b? d?i ?ng hi?u qu? , không h? n?a thi hành sau này thao tác ; tr? v? 0 : không có ki?m tr?c d?n tuong quan hi?u qu? , ti?p t?c thi hành . 
--**********************************
function  x890545_CancelImpacts(  sceneId,  selfId  )
	 return  0;  -- không c?n cái này ti?p l?i , nhung mu?n c?t gi? vô ích hàm s? , hon n?a th?y chung tr? v? 0 . 
end

--**********************************
-- di?u ki?n ki?m tr?c nh?p kh?u : 
-- h? th?ng s? ? k? nang ki?m tr?c dích th?i gian di?m di?u d?ng cái này ti?p l?i , cung can c? cái này hàm s? dích tr? v? tr? giá xác d?nh sau này luu trình có hay không thi hành . 
-- tr? v? 1 : di?u ki?n ki?m tr?c thông qua , có th? ti?p t?c thi hành ; tr? v? 0 : di?u ki?n ki?m tr?c th?t b?i , c?t d?t sau này thi hành . 
--**********************************
function  x890545_OnConditionCheck(  sceneId,  selfId  )
	 -- giáo nghi?m s? d?ng v?t ph?m 
	 if(1~=LuaFnVerifyUsedItem(sceneId,  selfId))  then
	 	 return  0
	 end
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 --  phán doán cái này v?t ph?m là không ph?i là dã d?nh v? 
	 local  Itemid1=  GetItemTableIndexByIndex(sceneId,  selfId,  bagId)
	 if  nil  ==  x890545_g_item1[Itemid1]  and  Itemid1  ~=  x890545_g_item2  then
	 	 return  0
	 end
	 
	 local  SXCLHR  =  GetMissionData(sceneId,selfId,MD_INFANTSXCLHR)
	 local  IFANTLV1	 =  floor(mod(SXCLHR,10000)/10)
	 if  IFANTLV1  ==  nil  or  IFANTLV1  <  1  then
	 	 x890631_ShowNotice(  sceneId,  selfId,  "#{FYLYD_160810_59}")  -- không có hài t? 
	 	 return  0
	 end
	 
	 local  ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5
	 if  GetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE1  )~=nil  or  GetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE2  )~=nil  then
	 	 ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5  =x890545_ZHSYDATA(  sceneId,  selfId  )
	 else
	 	 x890545_ShowNotice(  sceneId,  selfId,  "#{ZNSZ_140718_34}")
	 	 return  0
	 end
	 local  DATATb  ={ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5}
	 
	 	 if  Itemid1  ~=  x890545_g_item2  then
	 	 	 if  tonumber(DATATb[x890545_g_item1[Itemid1]])  ~=  nil  then
	 	 	 if  tonumber(DATATb[x890545_g_item1[Itemid1]])  >=  89  then
	 	 	 	 x890545_ShowNotice(  sceneId,  selfId,  " Tu dßÞng ngû ngh® loÕi này ðã ðÕt t¾i gi¾i han, vui lòng chuy¬n ngû ngh® khác cho hài tØ ")
	 	 	 return  0
	 	 	 end
	 	 	 else
	 	 	 return  0
	 	 	 end
	 	 else
	 	 	 if  tonumber(DATATb[1])>=89  and  tonumber(DATATb[2])>=89  and  tonumber(DATATb[3])>=89  and  tonumber(DATATb[4])>=89  and  tonumber(DATATb[5])>=89  then
	 	 	 	 x890545_ShowNotice(  sceneId,  selfId,  " T¤t cä tu dßÞng ngû ngh® cüa hài tØ ðã ðÕt t¾i cñc hÕn, không c¥n tu dßÞng næa ")
	 	 	 return  0
	 	 	 end
	 	 	 
	 	 end
	 
	 	 
	 return  1;  -- không c?n b?t k? di?u ki?n gì , hon n?a th?y chung tr? v? 1 . 
end

--**********************************
-- tiêu hao ki?m tr?c cùng x? lý nh?p kh?u : 
-- h? th?ng s? ? k? nang tiêu hao th?i gian di?m di?u d?ng cái này ti?p l?i , cung can c? cái này hàm s? dích tr? v? tr? giá xác d?nh sau này luu trình có hay không thi hành . 
-- tr? v? 1 : tiêu hao x? lý thông qua , có th? ti?p t?c thi hành ; tr? v? 0 : tiêu hao ki?m tr?c th?t b?i , c?t d?t sau này thi hành . 
-- chú ý : cái này không riêng ph? trách tiêu hao ki?m tr?c cung ch?u trách tiêu hao thi hành . 
--**********************************
function  x890545_OnDeplete(  sceneId,  selfId  )
	 local	 bagId	 =  LuaFnGetBagIndexOfUsedItem(  sceneId,  selfId  )
	 
	 --  phán doán cái này v?t ph?m là không ph?i là dã d?nh v? 
	 local  Itemid1  =GetItemTableIndexByIndex(sceneId,  selfId,  bagId)
	 if  nil  ==  x890545_g_item1[Itemid1]  and  Itemid1  ~=  x890545_g_item2  then
	 	 return  0
	 end
	 if(0<LuaFnDepletingUsedItem(sceneId,  selfId))  then
	 SetMissionData(  sceneId,  selfId,  RIDEIMPACT1,  Itemid1  )
	 	 return  1;
	 end

	 return  0;
end

--**********************************
-- ch? bi?t thi hành m?t l?n nh?p kh?u : 
-- t? khí cùng thu?n phát k? nang s? ? tiêu hao h?t thành sau di?u d?ng cái này ti?p l?i ( t? khí k?t thúc hon n?a các lo?i di?u ki?n cung th?a mãn th?i di?m ) , mà d?n d?t 
-- k? nang cung s? ? tiêu hao h?t thành sau di?u d?ng cái này ti?p l?i ( k? nang dích ngay t? d?u , tiêu hao thành công thi hành sau ) . 
-- tr? v? 1 : x? lý thành công ; tr? v? 0 : x? lý th?t b?i . 
-- chú : noi này là k? nang có hi?u l?c m?t l?n nh?p kh?u 
--**********************************
function  x890545_OnActivateOnce(  sceneId,  selfId  )
	 local  nowdata11  =GetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE1  )
	 local  nowdata22  =GetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE2  )
	 
        local  Itemid1  =  GetMissionData(  sceneId,  selfId,  RIDEIMPACT1)
        if  nil  ==  x890545_g_item1[Itemid1]  and  Itemid1  ~=  x890545_g_item2  then
	 	 return  
	 end
	 local  ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5  =x890545_ZHSYDATA(  sceneId,  selfId  )
	 local  DATATb  ={ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5}
	 if  Itemid1  ~=  x890545_g_item2  then
	 	 local  nowdata  =  tonumber(DATATb[x890545_g_item1[Itemid1]])
	 	 if  nowdata~=  nil  and  nowdata  <89  then
	 	 	 DATATb[x890545_g_item1[Itemid1]]  =format("%02d",(tonumber(DATATb[x890545_g_item1[Itemid1]])  +1))
	 	 else
	 	 	 return
	 	 end
	 else
	 	 if  tonumber(ZHSY1)<89  or  tonumber(ZHSY2)<89  or  tonumber(ZHSY3)<89  or  tonumber(ZHSY4)  <89  or  tonumber(ZHSY5)<89  then
	 	 	 for  i  =1,5  do
	 	 	 	 if  tonumber(DATATb[i])  <  89  then
	 	 	 	 	 DATATb[i]=format("%02d",(tonumber(DATATb[i])+1))
	 	 	 	 end
	 	 	 end
	 	 else
	 	 	 return
	 	 end
	 end
	 local  newdata11  =  tonumber(DATATb[1]..DATATb[2]..DATATb[3])
	 local  newdata22  =  tonumber(DATATb[4]..DATATb[5])
	 if  nowdata11  ~=  newdata11  then
	 	 SetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE1,  newdata11)
	 end
	 if  newdata22  ~=  nowdata22  then
	 	 SetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE2,  newdata22)
	 end
	 if  Itemid1  ~=  x890545_g_item2  then
	 	 x890545_ShowNotice(  sceneId,  selfId,  "#H Các hÕ gia tång thành công thuµc tính "..x890545_g_NAME[Itemid1].."lên#G 1 #Hði¬m! "  )
	 else
	 	 x890545_ShowNotice(  sceneId,  selfId,  "#GT¤t cä thuµc tính #H ngû ngh® cüa Hài TØc ðã tång lên #G 1  #H ði¬m! "  )
	 end
	 SetMissionData(  sceneId,  selfId,  RIDEIMPACT1,  0  )
	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  49,  0)
	 CallScriptFunction(  910052,  "Openinfant",  sceneId,  selfId)  --x910052_Openinfant
	 return  1;
end

--**********************************
-- d?n d?t nh?p tim x? lý nh?p kh?u : 
-- d?n d?t k? nang s? ? m?i l?n nh?p tim k?t thúc lúc di?u d?ng cái này ti?p l?i . 
-- tr? v? : 1 ti?p t?c l?n sau nh?p tim ;0 : c?t d?t d?n d?t . 
-- chú : noi này là k? nang có hi?u l?c m?t l?n nh?p kh?u 
--**********************************
function  x890545_OnActivateEachTick(  sceneId,  selfId)
	 return  1;  -- không ph?i là d?n d?t tính chân v?n ,  ch? c?t gi? vô ích hàm s? .
end

function  x890545_ShowNotice(  sceneId,  selfId,  strNotice)
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  strNotice  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )        
end

function  x890545_ZHSYDATA(  sceneId,  selfId  )
	 local  data1  =  GetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE1  )
	 local  data2  =  GetMissionData(  sceneId,  selfId,  MD_INFANTZHDATE2  )
	 if  data1  ==nil  or  data2  ==nil  then
	 	 x890545_ShowNotice(  sceneId,  selfId,  "#{ZNSZ_140718_34}")
	 	 return
	 end
	 local  datastr1  =  format("%06d",data1)
	 local  datastr2  =  format("%04d",data2)
	 local  ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5
	 ZHSY1  =  strsub(datastr1,1,2)
	 ZHSY2  =  strsub(datastr1,3,4)
	 ZHSY3  =  strsub(datastr1,5,6)
	 ZHSY4  =  strsub(datastr2,1,2)
	 ZHSY5  =  strsub(datastr2,3,4)
	 return  ZHSY1,ZHSY2,ZHSY3,ZHSY4,ZHSY5
end