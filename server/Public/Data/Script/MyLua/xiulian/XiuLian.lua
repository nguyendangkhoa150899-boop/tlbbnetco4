-- chân v¯n s¯ 
--by  hÕt tØ   718805400  luy®n chª 

x390101_g_scriptId  =  390101

x390101_g_EXPA  =  {90,180,360,540,720,1080,1188,1296,1404,1665,1944,2245,2754,3303,4104,4968,6124,7366,8941,10629,12690,15165,18081,21469,28503,42444,57249,72922,120465,133659,147798,162909,179019,196173,214389,233712,254169,275787,298611,322897,348705,376078,405063,435717,468081,502200,538132,575919,615618,657265,700920,746626,794434,844389,896539,950940,1007635,1066671,1128105,1191973,1258335,1327234,1398717,1472841,1549647,1629180,1711498,1796643,1884672,1974424,2065905,2159113,2254054,2350719,2449111,2549232,2651085,2754657,2859966,2966998,3075759,3186247,3298468,3412413,3528085,3645486,3764619,3885471,4008060,4132372,4258413,4386181,4515682,4646907,4779859,4914540,5050953,5189085,5328954,5470546,5613867,5758915,5905696,6054201,6204433,6356394,6510087,6665499,6822648,6981520,7142121,7304449,7468510,7634295,7801807,7971048,8142021,8314713,8489142,8662413,9160581,9664345,10173803,10689049,11210184,11737309,12270528,12809947,13355675,13907824,14466507,15031840,15603945,16182942,16768957,17362119,17962559,18570411,19185815,19808911,20439845,21078765,21725825,22381180,23044991,23717423,24398645,25088831,25788158,26496810,27214973,27942842,28680613,29428491,30186685,30955409,31734884,32525338,33327004,34140123,34964941,35801712,36650700,37512172,38386408,39273691,40174317,41088589,42016819,42959330,43916453,44888531,45875918,46878977,47898086,48933631,49986015,51055651,52142967,53248405,54372421,55515489,56678097,57860749,59063969,60288298,61534297,62802546,64093646,65408221,66746916,68110402,69499374,70914553,72356687,73826555,75324964,76852754,78410796,80000000,81621309,83275706,84964214,86687899,88447872,90245292,92081366,93957354,95874573,97834397,99838262,101887669,103984189,106129465,108325218,110573252,112875454,115233808,117650393,120127393,122667101,125271930,127944417,130687233,133503190,136395255,139366554,142420389,145560247,148789816,152112996,155533916,159056953,162686749,166428230,170286634,174267526,178376834,182620873,187006381,191540549,196231068,201086167,206114663,211326012,216730375,222338676,228162681,234215078,240509571,240509571}

x390101_g_My_MD  =  {MD_ZENG_FA1,MD_ZENG_FA2,MD_ZENG_FA3,MD_ZENG_FA4}
x390101_g_Qing_Yi  =  MD_ZENG_JING_YI
x390101_g_Qing_Yi_DATA  =  MD_ZENG_DATA_JING_YI
x390101_g_XuiWei  =  MD_ZENG_XIUWEI

--**********************************
-- sñ ki®n ðóng h² nh§p kh¦u 
--**********************************

function  x390101_OpenQUANjmWindow(sceneId,  selfId,strun)
                x390101_ReGongLi(sceneId,selfId)  -- công lñc khôi phøc 
	 if  strun  ==  1  then
	 local  gongli=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )
	 local  liliang=GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
	 local  lingqi=GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
	 local  tili=GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
	 local  dingli=GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
	 local  shenfa=GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
	 BeginUICommand(  sceneId  )
	         UICommand_AddInt(  sceneId,  gongli  )
	 	 UICommand_AddInt(  sceneId,  liliang  )
	 	 UICommand_AddInt(  sceneId,  lingqi  )
	 	 UICommand_AddInt(  sceneId,  tili  )
	 	 UICommand_AddInt(  sceneId,  dingli  )
	 	 UICommand_AddInt(  sceneId,  shenfa  )
	 	 UICommand_AddString(sceneId,"wuhu")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,80111204)
	 return
	 end
	 if  strun  ==  2  then
	 	 BeginUICommand(  sceneId  )
	 	 UICommand_AddString(sceneId,"wuhu")
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,20111202)	 
        return
	 end
	 if  strun  ==  3  then  
	     CallScriptFunction((889903),  "OpenZhenYuan",sceneId,  selfId,"o")
	 	 return
	 end
	 if  strun  ==  4  then  
	 CallScriptFunction((713575),  "On_sD",sceneId,  selfId,30)	 
	 end
	 if  strun  ==  5  then  
	 CallScriptFunction((713575),  "On_sD",sceneId,  selfId,40)	 
	 end	 
	 if  strun  ==  6  then  
	 CallScriptFunction((713575),  "On_sD",sceneId,  selfId,50)	 
	 end
end	 



function  x390101_OnDefaultEvent(  sceneId,  selfId,  targetId)
                x390101_ReGongLi(sceneId,selfId)  -- công lñc khôi phøc 
	 BeginEvent(sceneId)          
	 AddText(sceneId,  "#{XL_090707_01}")
	 --AddText(sceneId,  " b÷n ngß½i c¤p nh¤t ð¸nh phäi ðÕt t¾i 70 c¤p m¾i có th¬ tiªn hành Tu Luy®n nga ")
	 	 AddNumText(sceneId,  x390101_g_scriptId,"#cffcc00 Tu Luy®n ",  6,  1)
	 	 AddNumText(sceneId,  x390101_g_scriptId,"#cffcc00 Ðµt Phá Cänh Gi¾i Tu Luy®n ",  6,  2)
	 	 AddNumText(sceneId,  x390101_g_scriptId,"#cffcc00 Nh§n L¤y Danh Hi®u Thuµc Tính",  6,  3)
	 	 AddNumText(sceneId,  x390101_g_scriptId,"#cffcc00 liên quan t¾i Tu Luy®n ",  11,  4)	
	 	 --AddNumText(sceneId,  x390101_g_scriptId,"#G Ð±i Công Lñc Ðan",  6,  5000) 
		 AddNumText(sceneId,  x390101_g_scriptId,"#G TÕm ngßng ð±i công lñc ðan",  6,  6000) 
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**********************************
function  x390101_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	 local  index  =	 GetMenPai(sceneId,  selfId)
	 if  index  ==  9  then
                              x390101_NotifyTip(  sceneId,  selfId,  " ÐÆng c¤p các hÕ còn th¤p, trß¾c m¡t hãy gia nh§p môn phái ði "  )
                              x390101_AddBuff(sceneId,  selfId)
	 	 return

	 end
	 local  key=GetNumText()
	 if key == 5000 then
		local exp = GetExp( sceneId, selfId )
		BeginEvent(sceneId)
		AddText(sceneId, "#G Thí chü mu¯n ð±i ði¬m EXP l¤y Công Lñc Ðan àh? S¯ ði¬m EXP hi®n tÕi cüa thí chü là #Y"..exp.." #G.Thí chü có mu¯n ð±i EXP chång?#r#RTÖ l® ð±i: 200 Tri®u EXP = 1 viên Công Lñc Ðan.")
		AddNumText( sceneId, x390101_g_ScriptId, "Ð°ng ý ð±i 200 Tri®u EXP l¤y CLÐ",6,5001)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
		if key == 5001 then
					local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
			if( FreeSpace < 2 ) then
			BeginEvent( sceneId )
			AddText( sceneId, "Hãy s¡p xªp lÕi 2 ô tr¯ng trong ô ÐÕo Cø." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
				return
			end
			if  GetLevel(sceneId,  selfId)  <  109  then
			x990010_NotifyTip(  sceneId,selfId,"T× c¤p 109 tr· lên m¾i có th¬ ð±i ")
			return
			end
			if GetExp( sceneId, selfId ) < 200000000 then
				x990010_NotifyFailBox( sceneId, selfId, targetId, "#GNgß½i không ðü 100 Tri®u EXP")
				return
			else
				AddExp(sceneId,selfId,-200000000)
				
				BeginAddItem(sceneId)
				AddItem(sceneId,39999901,1)
				EndAddItem(sceneId,selfId)
				AddItemListToHuman(sceneId,selfId)	
				local	 nam	 =  LuaFnGetName(  sceneId,  selfId  )
				BroadMsgByChatPipe(  sceneId,  selfId,  "#cFF0000 Tu luy®n H® Th¯ng: #GTäo Ð¸a Th¥n Tång:#Y``O mi Phò Phò`` #WThí chü #cFF0000 ["..nam.."] #Wth§t ch¸u khó c¥n mçn cày công ð±i #G200 tri®u EXP #Wl¤y #YCông Lñc Ðan#W,xin chúc m×ng, thi®n tÕi! thi®n tai!",  4  )
				x990010_NotifyFailBox( sceneId, selfId, targetId, "Giao d¸ch thành công, nh§n ðßþc công lñc ðan")
			end
		end
		 local  key=GetNumText()
	 if  key==2  or  key==3  or  key==6000  then
                              x390101_NotifyTip(  sceneId,  selfId,  " TÕm th¶i chßa m·, xin hãy quay lÕi sau! "  )
                return
	 end

	 if  key==4  then
	 BeginEvent(sceneId)          
	       AddText(sceneId,  "#{XL_090707_46}")
	       AddText(sceneId,  "#{XL_090707_48}")
	       AddText(sceneId,  "#{XL_090707_52}")	 
	       AddText(sceneId,  "#{XL_090707_53}")	 
	       AddText(sceneId,  "#{XL_090707_54}")	 
	       AddText(sceneId,  "#{XL_090707_55}")
	       AddText(sceneId,  "#{XL_090707_56}")	 	 	 	 
	       EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
                return
	 end


	 if  key==1  then
	 local  a=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )
	 local  b=GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
	 local  c=GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
	 local  d=GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
	 local  e=GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
	 local  f=GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
	 local  MenPai  =	 GetMenPai(sceneId,  selfId)
	 local  q  =  0
	                                 if  MenPai  ~=  9  then
	                                 q  =  1
	                                 end
	             
	 	     	 BeginUICommand(sceneId)
	   	   	 UICommand_AddInt(sceneId,targetId);
	   	   	 UICommand_AddInt(sceneId,1);
	   	   	 UICommand_AddInt(sceneId,b);
	   	   	 UICommand_AddInt(sceneId,c);
	   	   	 UICommand_AddInt(sceneId,d);
	   	   	 UICommand_AddInt(sceneId,e);
	   	   	 UICommand_AddInt(sceneId,f);
	   	   	 UICommand_AddInt(sceneId,q);
	   	   	 UICommand_AddInt(sceneId,0);
	 	                 UICommand_AddString(sceneId,"longwen");
	 	 	 EndUICommand(sceneId)
	   	   DispatchUICommand(sceneId,selfId,  90000000)
                                return
                                end	 	 
end	 
function  x390101_AskXiuLianLevelUp1(  sceneId,  selfId,  targetId,mijiId  )

                if  mijiId  <  20  or  mijiId  >  34  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " Tu Luy®n bí t¸ch sai l¥m xin liên lÕc GM"..mijiId  )
                return
                end

                if  mijiId  >=  21  and  mijiId  <=  26  then
                      if  GetLevel(sceneId,  selfId)  <  80  then
	             BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,targetId);
	             EndUICommand(sceneId)
	             DispatchUICommand(sceneId,selfId,  90000001)
                            x390101_NotifyTip(  sceneId,  selfId,  " c¤p b§c nh¤t ð¸nh phäi ðÕt t¾i 80 tr· lên m¾i có th¬ Tu Luy®n ? vô nhai di thß ?"  )
                            return
                        end
                end

                if  mijiId  >=  31  and  mijiId  <=  34  then
                      if  GetLevel(sceneId,  selfId)  <  90  then
	             BeginUICommand(sceneId)
	             UICommand_AddInt(sceneId,targetId);
	             EndUICommand(sceneId)
	             DispatchUICommand(sceneId,selfId,  90000001)
                            x390101_NotifyTip(  sceneId,  selfId,  " c¤p b§c nh¤t ð¸nh phäi ðÕt t¾i 90 tr· lên m¾i có th¬ Tu Luy®n ? hÕo ngây th½ träi qua ?"  )
                            return
                        end
                end


                local  Tapey  =  -2
                local  sesi  =  0
                if  mijiId  ==  21  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_FANJIANGDAOHAI  )
                sesi  =  XIULIAN_FANJIANGDAOHAI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 cûng häi l§t giang cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  22  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_DISHUICHUANSHI  )
                sesi  =  XIULIAN_DISHUICHUANSHI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 tích thüy xuyên thÕch cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  23  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_TONGQIANGTIEBI  )
                sesi  =  XIULIAN_TONGQIANGTIEBI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 tß¶ng ð°ng vách s¡t cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  24  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_QIDINGSHANHE  )
                sesi  =  XIULIAN_QIDINGSHANHE
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 khí ð¸nh núi sông cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  25  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_BAIBUYISHI  )
                sesi  =  XIULIAN_BAIBUYISHI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 tråm không ð°ng nh¤t th¤t cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  26  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_GAOFEIYUANJI  )
                sesi  =  XIULIAN_GAOFEIYUANJI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 bay cao xa t§p cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  31  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_SHOUSHAOYANG  )
                sesi  =  XIULIAN_SHOUSHAOYANG
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 Thü thiªu dß½ng cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  32  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_ZUTAIYIN  )
                sesi  =  XIULIAN_ZUTAIYIN
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 chân thái âm cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  33  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_RENMAI  )
                sesi  =  XIULIAN_RENMAI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 nhâm mÕch cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  34  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_DUMAI  )
                sesi  =  XIULIAN_DUMAI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 ð¯c mÕch cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                end

                if  Tapey  ==  -2  or  sesi  ==  0  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " không biªt sai l¥m xin liên lÕc GM"  )
                return
                end
                if  Tapey  >=  150  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
	 	 x390101_AddBuff(sceneId,  selfId)
                x390101_NotifyTip(  sceneId,  selfId,  " Các hÕ Tu Luy®n c¤p b§c ðã ðÕt t¾i cao nh¤t không th¬ tiªp tøc Tu Luy®n "  )
                return
                end
	 local  nXiulianNeedPower  =  100;
	 if  (Tapey  >=  0  and  Tapey  <  30)    then
	 nXiulianNeedPower  =  33
	 elseif(Tapey  >=  30  and  Tapey  <  60  )    then
	 nXiulianNeedPower  =  50
	 elseif(Tapey  >=  60  and  Tapey  <=  150)    then
	 nXiulianNeedPower  =  100
	 end      
	 local  needMoney  =  Tapey*10000
	 local  addexpvar  =  Tapey*100
	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
                local  nSelfExp  =  GetExp(sceneId,selfId)
                if  GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )  <  nXiulianNeedPower  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " Công Lñc ðan cüa các hÕ không ðü ["..nXiulianNeedPower.."] , xin m¶i ki¬m tra lÕi "  )
                  return
                  end
                if  nMoneySelf  <  needMoney  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                  x390101_NotifyTip(  sceneId,  selfId,  " Ti«n Vàng cüa các hÕ không ðü #{_EXCHG"..needMoney.."} , xin m¶i ki¬m tra lÕi "  )
                  return
                  end
                  if  nSelfExp  <  (x390101_g_EXPA[Tapey+1])  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                  x390101_NotifyTip(  sceneId,  selfId,  " Kinh Nghi®m cüa các hÕ không ðü ["..x390101_g_EXPA[Tapey+1].."] , xin m¶i ki¬m tra lÕi "  )
                    return
                    end
	 	 LuaFnCostMoneyWithPriority(  sceneId,  selfId,    needMoney  );
                                if  addexpvar  >  0  then
                                AddExp(sceneId,selfId,-(x390101_g_EXPA[Tapey+1]))
                                end
	 	 SetMissionData(sceneId,  selfId,  XIULIAN_GONGLI,  GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )-nXiulianNeedPower);
	 	 SetMissionData(sceneId,  selfId,  sesi,  GetMissionData(  sceneId,  selfId,  sesi  )+1);
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)	 -- thành công lúc nhân v§t hi®u quä 
                                x390101_NotifyTip(  sceneId,  selfId,  " chúc m×ng ngß½i , Tu Luy®n thành công , ðem "..string..""  )	 
                                x390101_AddBuff(sceneId,  selfId)

	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,GetMissionData(  sceneId,  selfId,  sesi  ));
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000002)
end
function  x390101_AskXiuLianLevelUp(  sceneId,  selfId,  targetId,mijiId  )
                local  liliang=GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
	   	 local  lingqi=GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
	   	 local  tili=GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
	   	 local  dingli=GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
	   	 local  shenfa=GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
                                local  addexpvar  =  0
	 --  ki¬m tr¡c nhà ch½i có hay không phù hþp m¾i v×a buông tha cho nhi®m vø 
	     local  TransportNPCName=GetName(sceneId,targetId);
	              -- if  TransportNPCName    ~=  " Täo Ð¸A Th¥n Tång "  and  TransportNPCName    ~=  " Tu Luy®n "    and  TransportNPCName    ~=  " th§t Tu Luy®n ( không phäi là trÕng thái )"    and  TransportNPCName    ~=  "·"  then
	           --BeginUICommand(sceneId)
	            --   UICommand_AddInt(sceneId,targetId);
	            --   EndUICommand(sceneId)
	            -- DispatchUICommand(sceneId,selfId,  90000001)
                --  x390101_NotifyTip(  sceneId,  selfId,  " xin không c¥n loÕn ð±i khách hàng bßng , ngß½i s¯ trß½ng møc ðã b¸ ghi chép "  )
                --  x390101_AddBuff(sceneId,  selfId)
               -- return
               -- end
	                 	 	 
        if  GetLevel(sceneId,  selfId)  <  70  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " c¤p b§c nh¤t ð¸nh phäi ðÕt t¾i 70 c¤p b§c tr· lên m¾i có th¬ Tu Luy®n ? ngû hành bäo ði¬n ?"  )
                x390101_AddBuff(sceneId,  selfId)
                return
                end
                if  mijiId  <  9  or  mijiId  >  13  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " Tu Luy®n bí t¸ch sai l¥m xin liên lÕc GM"  )
                x390101_AddBuff(sceneId,  selfId)
                return
        end
                local  Tapey  =  -2
                local  sesi  =  0
                if  mijiId  ==  9  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
                sesi  =  XIULIAN_LILIANG
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 lñc rút ra s½n h« cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  10  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
                sesi  =  XIULIAN_LINGQI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 khí xâu trß¶ng h°ng cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  11  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
                sesi  =  XIULIAN_TILI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 kim cß½ng b¤t bÕi cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  12  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
                sesi  =  XIULIAN_DINGLI
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 häi nÕp bách xuyên cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                elseif    mijiId  ==  13  then
                Tapey  =  GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
                sesi  =  XIULIAN_SHENFA
                mijileve  =  Tapey  +  1
                string  =  "[#cfff263 t§t phong hóa änh cu¯n ] t× "..Tapey.." c¤p tång lên t¾i "..mijileve.." c¤p "
                end

                if  Tapey  ==  -2  or  sesi  ==  0  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " không biªt sai l¥m xin liên lÕc GM"  )
                x390101_AddBuff(sceneId,  selfId)
                return
                end

                if  Tapey  >=  150  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " Các hÕ Tu Luy®n c¤p b§c ðã ðÕt t¾i cao nh¤t không th¬ tiªp tøc Tu Luy®n "  )
                x390101_AddBuff(sceneId,  selfId)
                return
                end
        	 	 	 -- tính toán c¥n công lñc 
	 local  nXiulianNeedPower  =  100;
	 if  (Tapey  >=  0  and  Tapey  <  30)    then
	 nXiulianNeedPower  =  33
	 elseif(Tapey  >=  30  and  Tapey  <  60  )    then
	 nXiulianNeedPower  =  50
	 elseif(Tapey  >=  60  and  Tapey  <=  150)    then
	 nXiulianNeedPower  =  100
	 end      
	 local  needMoney  =  Tapey*100000
	 local  addexpvar  =  Tapey*100
	 local  nMoneyJZ  =  GetMoneyJZ(sceneId,selfId)
	 local  nMoneyJB  =  GetMoney(sceneId,selfId)
	 local  nMoneySelf  =  nMoneyJZ  +  nMoneyJB
                local  nSelfExp  =  GetExp(sceneId,selfId)
                if  GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )  <  nXiulianNeedPower  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " Công lñc ðan cüa các hÕ không ðü ["..nXiulianNeedPower.."] , xin m¶i ki¬m tra lÕi "  )
                x390101_AddBuff(sceneId,  selfId)
                  return
                  end
                if  nMoneySelf  <  needMoney  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                x390101_NotifyTip(  sceneId,  selfId,  " Ti«n Vàng cüa các hÕ không ðü #{_EXCHG"..needMoney.."} , xin m¶i ki¬m tra lÕi "  )
                x390101_AddBuff(sceneId,  selfId)
                  return
                  end
                  if  nSelfExp  <  (x390101_g_EXPA[Tapey+1])  then
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,targetId);
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000001)
                  x390101_NotifyTip(  sceneId,  selfId,  " Kinh nghi®m cüa các hÕ không ðü ["..x390101_g_EXPA[Tapey+1].."] , xin m¶i ki¬m tra lÕi "  )
                x390101_AddBuff(sceneId,  selfId)
                    return
                    end
	 	 LuaFnCostMoneyWithPriority(  sceneId,  selfId,    needMoney  );
                AddExp(sceneId,selfId,-(x390101_g_EXPA[Tapey+1]))
	 	 SetMissionData(sceneId,  selfId,  XIULIAN_GONGLI,  GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )-nXiulianNeedPower);
	 	 SetMissionData(sceneId,  selfId,  sesi,  GetMissionData(  sceneId,  selfId,  sesi  )+1);
	 	 LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  152,  0)	 -- thành công lúc nhân v§t hi®u quä 
                x390101_NotifyTip(  sceneId,  selfId,  " Chúc m×ng các hÕ, Tu Luy®n thành công , ðem "..string..""  )	 
                x390101_AddBuff(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 UICommand_AddInt(sceneId,GetMissionData(  sceneId,  selfId,  sesi  ));
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  90000002)
end

--**********************************
-- ð¯i thoÕi cØa s± tin tÑc ð« kÏ 
--**********************************
function  x390101_MsgBox(  sceneId,  selfId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  -1  )
end


--**********************************
-- b¡t m¡t ð« kÏ 
--**********************************
function  x390101_NotifyTip(  sceneId,  selfId,  Msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Msg  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end
--**********************************
-- t¡t ð¯i thoÕi khuông 
--**********************************
function  x390101_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end
--**********************************
-- cà m¾i s¯ li®u 
--**********************************
function  x390101_ReturnAttr(sceneId,  selfId)
                x390101_ReGongLi(sceneId,selfId)  -- công lñc khôi phøc 
	 local  gongli=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )
	 local  liliang=GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
	 local  lingqi=GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
	 local  tili=GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
	 local  dingli=GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
	 local  shenfa=GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
	 x390101_AddBuff(sceneId,  selfId)
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  liliang  )
	 	 UICommand_AddInt(  sceneId,  lingqi  )
	 	 UICommand_AddInt(  sceneId,  tili  )
	 	 UICommand_AddInt(  sceneId,  dingli  )
	 	 UICommand_AddInt(  sceneId,  shenfa  )
	 	 UICommand_AddString(sceneId,"player")
local  MyQingYi  =  GetMissionData(sceneId,  selfId,  x390101_g_Qing_Yi)
local  QingYiDATA  =  GetMissionData(sceneId,  selfId,  x390101_g_Qing_Yi_DATA)
local  QingYiValue  =  mod(QingYiDATA,10000)
local  myMissData  =  floor(QingYiDATA/10000)
local  NowXuiWei  =  GetMissionData(sceneId,  selfId,  x390101_g_XuiWei)	 
	 	 local  skillvalue  =  {}
	 	 for  i  =  1,4  do
	 	 skillvalue[i]  =  GetMissionData(sceneId,  selfId,  x390101_g_My_MD[i])
	 	 end
	 	 local  data1  =  format("%d|%d|%d|%d|%d|%d|%d",MyQingYi,QingYiValue,skillvalue[1],skillvalue[2],skillvalue[3],skillvalue[4],NowXuiWei)
	 	 UICommand_AddString(sceneId,data1)
	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    20000001)
end

function  x390101_AddBuff(sceneId,  selfId)
                  CallScriptFunction(  892002,  "AHa_ReMyBuff",  sceneId,  selfId);
end
function  x390101_ReturnAttr1(sceneId,  selfId)
	 local  index  =  GetMenPai(sceneId,  selfId)
	 if  index  ==  9  then
	 BroadMsgByChatPipe(sceneId,  selfId,  "@*;SrvMsg;DBD: còn không có gia nh§p môn phái c¤m chï m· ra Tu Luy®n gi¾i m£t ",  0);
	 return
                end
                x390101_ReGongLi(sceneId,selfId)  -- công lñc khôi phøc 
	 local  gongli=GetMissionData(  sceneId,  selfId,  XIULIAN_GONGLI  )
	 local  liliang=GetMissionData(  sceneId,  selfId,  XIULIAN_LILIANG  )
	 local  lingqi=GetMissionData(  sceneId,  selfId,  XIULIAN_LINGQI  )
	 local  tili=GetMissionData(  sceneId,  selfId,  XIULIAN_TILI  )
	 local  dingli=GetMissionData(  sceneId,  selfId,  XIULIAN_DINGLI  )
	 local  shenfa=GetMissionData(  sceneId,  selfId,  XIULIAN_SHENFA  )
	 BeginUICommand(  sceneId  )
	 	 UICommand_AddInt(  sceneId,  1  )
	 	 UICommand_AddInt(  sceneId,  liliang  )
	 	 UICommand_AddInt(  sceneId,  lingqi  )
	 	 UICommand_AddInt(  sceneId,  tili  )
	 	 UICommand_AddInt(  sceneId,  dingli  )
	 	 UICommand_AddInt(  sceneId,  shenfa  )
	 	 UICommand_AddInt(  sceneId,  shenfa  )
	 	 UICommand_AddString(sceneId,"wuhu");
	 	 EndUICommand(  sceneId  )
	 DispatchUICommand(  sceneId,  selfId,    80111204)
	 return
end

function  x390101_XiuLianScore(sceneId,selfId)  -- ghi chép Tu Luy®n bình phân 
-- Tu Luy®n bình phân tiªp l¶i     XIEZI_XIULIAN_SCORE=491  -- Tu Luy®n bình phân 
-- tÕm th¶i không làm Tu Luy®n bình phân ðích ghi chép 
-- t× tÕm th¶i tính toán sinh ra 
end

function  x390101_ReGongLi(sceneId,selfId)  -- công lñc khôi phøc 
        if  GetMissionData(sceneId,selfId,MF_GetNewUserCard3)  ~=  GetDayTime()  then
              SetMissionData(sceneId,selfId,MF_GetNewUserCard3,GetDayTime())
              SetMissionData(sceneId,selfId,XIULIAN_GONGLI,200);  -- công lñc khôi phøc 200
        end
end
function x1390101_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end