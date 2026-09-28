--Éñ±ø¿ªÃÉ¡¢ÓýÁé Ð«×ÓQQ718805400ÖÆ×÷
x900033_g_ScriptId = 900033
x900033_g_ShenBing = {10300413,10300414,10300415,10300416,10300417,10300418,10300419,10300420,10300421,10301426,10301427,10301428,10301429,10301430,10301431,10301432,10301433,10301434,10301435,10301436,10301437,10301438,10301439,10301440,10301441,10301442,10301443,10302430,10302431,10302432,10302433,10302434,10302435,10302436,10302437,10302438,10302439,10302440,10302441,10302442,10302443,10302444,10302445,10302446,10302447,10303422,10303423,10303424,10303425,10303426,10303427,10303428,10303429,10303430,10303431,10303432,10303433,10303434,10303435,10303436,10303437,10303438,10303439,10304417,10304418,10304419,10304420,10304421,10304422,10304423,10304424,10304425,10305426,10305427,10305428,10305429,10305430,10305431,10305432,10305433,10305434,10305435,10305436,10305437,10305438,10305439,10305440,10305441,10305442,10305443,10306033,10306034,10306035,10306036,10306037,10306038,10306039,10306040,10306041,10307033,10307034,10307035,10307036,10307037,10307038,10307039,10307040,10307041}
x900033_g_TaiGu = {10300423,10300424,10300425,10300426,10300427,10300428,10300429,10300430,10300431,10301444,10301445,10301446,10301447,10301448,10301449,10301450,10301451,10301452,10301453,10301454,10301455,10301456,10301457,10301458,10301459,10301460,10301461,10302449,10302450,10302451,10302452,10302453,10302454,10302455,10302456,10302457,10302458,10302459,10302460,10302461,10302462,10302463,10302464,10302465,10302466,10303440,10303441,10303442,10303443,10303444,10303445,10303446,10303447,10303448,10303449,10303450,10303451,10303452,10303453,10303454,10303455,10303456,10303457,10304427,10304428,10304429,10304430,10304431,10304432,10304433,10304434,10304435,10305445,10305446,10305447,10305448,10305449,10305450,10305451,10305452,10305453,10305454,10305455,10305456,10305457,10305458,10305459,10305460,10305461,10305462,10306043,10306044,10306045,10306046,10306047,10306048,10306049,10306050,10306051,10307043,10307044,10307045,10307046,10307047,10307048,10307049,10307050,10307051}
x900033_g_SkillLevCost ={[1]={5,10,16,23,32,43,57,74,95},[2]={4,8,13,19,27,37,50,67,88},[3]={3,6,10,15,22,31,43,59,79}}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x900033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	    AddText( sceneId,"#{JXSQ_170804_01}" )	
	    --AddText( sceneId,"#ef12345#Y Th¥n Khí Thßþng C± chßa m·" )
		AddNumText( sceneId, x900033_g_scriptId, "#YÐi Chª TÕo Th¥n Khí Häi Vñc trß¾c", 9,10) 			
		
	     if GetLevel( sceneId, selfId ) >= 102 then		
		AddNumText( sceneId, x900033_g_ScriptId, "#cFF0000Thßþng C± Th¥n Khí Chª TÕo", 6, 1 )
		AddNumText( sceneId, x900033_g_ScriptId, "#cFF0000Thßþng C± Th¥n Khí Døc Linh", 6, 2 )
		AddNumText( sceneId, x900033_g_ScriptId, "#cFF0000Thßþng C± Th¥n Khí Ðúc H°n", 6, 4 )
		AddNumText( sceneId, x900033_g_ScriptId, "#cFF0000Thái C± Th¥n Khí Tiªn C¤p", 6, 5 )
		AddNumText( sceneId, x900033_g_ScriptId, "#cFF0000T¦y Thái C± Th¥n Khí", 6, 6 )
		--AddNumText( sceneId, x900033_g_ScriptId, "#YThay Ð±i NgoÕi Hình Thái C± Th¥n Khí", 6, 7 )
		AddNumText( sceneId, x900033_g_ScriptId, "#GHþp Thành H°n Ng÷c", 6, 3 )
		             else
		AddText(sceneId, "#r    #cFF0000 Các hÕ c¤p b§c #H không ðü  102 c¤p #cFF0000, không th¬ dùng chÑc nång Th¥n Khí, xin häy hãy nâng c¤p trß¾c!")
             end
		--AddNumText( sceneId, x900033_g_ScriptId, "#G²âÊÔ²¿·Ö£ºÎïÆ·", 6, 8 )
		--AddNumText( sceneId, x900033_g_ScriptId, "#G²âÊÔ²¿·Ö£ºµØÍ¼", 6, 9 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x900033_OnEventRequest( sceneId, selfId, targetId, eventId)
			if  GetNumText()  ==  10  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 580,195,216)	
		end

	if	GetNumText() == 1	then  --¿ªÃÉ
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20171117 )
	end

	if      GetNumText() == 2       then    --ÓýÁé
	        BeginUICommand(sceneId)
	         UICommand_AddInt(sceneId,targetId);
	         EndUICommand(sceneId )
	        DispatchUICommand(sceneId,selfId, 7020062)
        end

	if	GetNumText() == 3	then  --ºÏ³É»êÓñ
	        BeginEvent(sceneId)
	          AddText( sceneId,"    Hþp thành H°n Ng÷c các hÕ c¥n ð¬ vào ô ð¥u tiên cüa tay näi#r    #GHþp Thành Quy T¡c#r#G      2 M®nh H°n Ng÷c hþp thành 1 cái Ð¸a H°n Ng÷c#r      2 Ð¸a H°n Ng÷c hþp thành 1 cái Thiên H°n Ng÷c" )
		  AddNumText( sceneId, x900033_g_ScriptId, "Hþp thành Ð¸a H°n Ng÷c ", 6, 31 )
		  AddNumText( sceneId, x900033_g_ScriptId, "Hþp Thành Thiên H°n Ng÷c", 6, 32 )
	        EndEvent(sceneId)
	        DispatchEventList(sceneId,selfId,targetId)
	end

	if	GetNumText() == 31	then  --ºÏ³É»êÓñ
	        if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 3 then
	           x900033_NotifyTips( sceneId, selfId, "c¥n ch×a tr¯ng ít nh¤t 3 ô ðÕo cø " )	
	           return
	        end
                local HunyuId = LuaFnGetItemTableIndexByIndex(sceneId,selfId,0)
                if HunyuId ~= 38002041 then
	           x900033_NotifyTips( sceneId, selfId, "Xin ðem [M®nh H°n Ng÷c] ð£t vào ô ð¥u tiên cüa tay näi" )	
	           return
	        end
                if LuaFnGetAvailableItemCount(sceneId, selfId, 38002041) < 2 then  --Ãü»êÓñ±àºÅ
                   x900033_NotifyTips( sceneId, selfId, "C¥n [M®nh H°n Ng÷c] ít nh¤t 2 cái" )	
                   return
                end
                if  LuaFnDelAvailableItem(sceneId,selfId,38002041,2) ~= 1 then
                    x900033_NotifyTips( sceneId, selfId, "[M®nh H°n Ng÷c] tiêu hao th¤t bÕi" )
                    return
                end
                TryRecieveItem( sceneId, selfId, 38002043, 1 )
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --ÌØÐ§
                x900033_NotifyTips( sceneId, selfId, "Chúc m×ng các hÕ ðã hþp thành 1 cái [Ð¸a H°n Ng÷c]" )
        end

	if	GetNumText() == 32	then  --ºÏ³É»êÓñ
	        if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 3 then
	           x900033_NotifyTips( sceneId, selfId, "c¥n ch×a tr¯ng ít nh¤t 3 ô ðÕo cø " )	
	           return
	        end
                local HunyuId = LuaFnGetItemTableIndexByIndex(sceneId,selfId,0)
                if HunyuId ~= 38002043 then
	           x900033_NotifyTips( sceneId, selfId, " Xin ðem [Ð¸a H°n Ng÷c] ð£t vào ô ð¥u tiên cüa tay näi" )	
	           return
	        end
                if LuaFnGetAvailableItemCount(sceneId, selfId, 38002043) < 2 then  --Ãü»êÓñ±àºÅ
                   x900033_NotifyTips( sceneId, selfId, "C¥n [Ð¸a H°n Ng÷c] ít nh¤t 2 cái" )	
                   return
                end
                if  LuaFnDelAvailableItem(sceneId,selfId,38002043,2) ~= 1 then
                    x900033_NotifyTips( sceneId, selfId, "[Ð¸a H°n Ng÷c] tiêu hao th¤t bÕi" )
                    return
                end
                TryRecieveItem( sceneId, selfId, 38002045, 1 )
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --ÌØÐ§
                x900033_NotifyTips( sceneId, selfId, "Chúc m×ng các hÕ ðã hþp thành 1 cái [Thiên H°n Ng÷c]" )
        end


	if	GetNumText() == 4	then  --ÉÏ¹ÅÉñÆ÷Öý»ê
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 89247100 )
	end

	if	GetNumText() == 5	then  --½ø½×Ì«¹Å
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20171118 )
	end

	if	GetNumText() == 6	then  --ÖØÏ´
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
                UICommand_AddInt( sceneId, 13)
                UICommand_AddInt( sceneId, 800000)---ÐèÒªµÄÇ®
		UICommand_AddInt( sceneId, 10300423) --×°±¸¿ªÊ¼
		UICommand_AddInt( sceneId, 10307051)  --×°±¸½áÊø
		UICommand_AddInt( sceneId, 30505813)  --ÎïÆ·id
		UICommand_AddString(sceneId,"#cFF0000Tr÷ng T¦y Thái C± Th¥n Khí");
		UICommand_AddString(sceneId,"    #YCh² ta chuyên v« tr÷ng t¦y Thái C± Th¥n Khí");
		UICommand_AddString(sceneId,"#YThái C± Th¤n Khí:");
		UICommand_AddString(sceneId,"#YMa huyªt thÕch:");
		UICommand_AddString(sceneId,"WuhunMagicUp");
                UICommand_AddInt( sceneId, 895111)
                UICommand_AddInt( sceneId, 20)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  21090722)
		return
	end


	if	GetNumText() == 7	then  --Ì«¹Å»ÃÐÎ
	        BeginEvent(sceneId)
	           AddText( sceneId,"   chÑc nång này chßa ra, xin hãy quay lÕi sau" )
	        EndEvent(sceneId)
	        DispatchEventList(sceneId,selfId,targetId)
	end



---²âÊÔ²¿·Ö


	if	GetNumText() == 8	then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);
		UICommand_AddInt(sceneId,070051);
		UICommand_AddInt(sceneId,9997);
		UICommand_AddString(sceneId,"L¤y v§t ph¦m");
		UICommand_AddString(sceneId,"ðua vào v§t ph¦m");
		UICommand_AddString(sceneId,"XieziQuickly");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 718805400 )
	end

	if	GetNumText() == 9	then
		--BeginUICommand(sceneId)
		--UICommand_AddInt(sceneId,selfId);
		--UICommand_AddInt(sceneId,070051);
		--UICommand_AddInt(sceneId,9998);
		--UICommand_AddString(sceneId,"Ãë·ÉµØÍ¼");
		--UICommand_AddString(sceneId,"µØÍ¼ºÅX×ø±êZ×ø±ê·Ö±ð3Î»£º");
		--UICommand_AddString(sceneId,"XieziQuickly");
		--EndUICommand(sceneId)
		--DispatchUICommand(sceneId,selfId, 718805400 )
	end


end

--**********************************
--ÊÂ¼þÈë¿Ú
--**********************************
function  x900033_ShangGuTopo(sceneId,selfId,eventId,PosId,arg1,arg2,arg3)

	 if  PosId  ==  nil  or  PosId  <  0  or  PosId  >  29  then
	       return
	 end  
	 if  LuaFnGetPropertyBagSpace(  sceneId,  selfId  )  <1  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ðÕo cø lan ít nh¤t dñ lßu 1 cá không gian "  )	 
	       return
	 end

	 local  _,  myname  =  LuaFnGetItemCreator(sceneId,  selfId,PosId);
	 if  myname  ==nil  then
	       myname  =""
	 end
                local  xieziQL  =  strfind(myname,"#S")

--***********************************
-- thßþng c± th¥n khí khai ngu d¯t 
--***********************************
          if  eventId  ==  1  then
	 local  myEquipId  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  PosId  )
                local  ShangGuCK  =  0

                for  i  =  1,getn(x900033_g_ShenBing)  do
                        if  x900033_g_ShenBing[i]  ==  myEquipId  then
	 	 ShangGuCK  =  1
                        end
                end

                if  ShangGuCK  ~=  1  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i bö vào ðích vû khí không phäi là 102 thßþng c± th¥n khí "  )	 
	       return
	 end

                if  xieziQL  ~=  nil  then	           	           	 
	       x900033_NotifyTips(  sceneId,  selfId,  " nên th¥n khí ðã khai ngu d¯t qua "  )	 
	       return
	 end

	 local  HumanMoney  =  LuaFnGetMoney(  sceneId,  selfId  )
    	 local  HumanMoneyJZ  =  GetMoneyJZ(  sceneId,  selfId  );
	 
	 if  HumanMoney  +  HumanMoneyJZ  <  1000000  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n chßa ðü #{_EXCHG1000000}"  )
	 	 return
	 end

	 local  nDelJZ,  nDelMoney  =  LuaFnCostMoneyWithPriority(sceneId,  selfId,  1000000);
                if  nDelJZ  ==  -1  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

                local  kmqm  =  "#S01000000"..myname
                LuaFnSetItemCreator(  sceneId,  selfId,  PosId,  kmqm  )
                LuaFnRefreshItemInfo(  sceneId,  selfId,  PosId  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	 x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , #{_ITEM"..myEquipId.."} khai ngu d¯t thành công ! trß¾c m£t ðích khí linh tr¸ giá là 1 c¤p "  )	 
              return
          end


--***********************************
-- thßþng c± th¥n khí døc linh 
--***********************************
          if  eventId  ==  2  then

                local  FuXiCost  =  {2,10,20,26,33,41,50,60,71,83,96,110,125,141,158,176,196,218,242}
	 local  myEquipId  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  PosId  )
                local  ShangGuCK  =  0

                for  i  =  1,getn(x900033_g_ShenBing)  do
                        if  x900033_g_ShenBing[i]  ==  myEquipId  then
	 	 ShangGuCK  =  1
                        end
                end

                if  ShangGuCK  ~=  1  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i bö vào ðích vû khí không phäi là 102 thßþng c± th¥n khí "  )	 
	       return
	 end

                if  xieziQL  ==  nil  then	           	           	 
	       x900033_NotifyTips(  sceneId,  selfId,  " nên th¥n khí chßa khai ngu d¯t quá "  )	 
	       return
	 end

                local  myQLZ  =  tonumber(strsub(myname,xieziQL+2,xieziQL+3))
                if  myQLZ  >=  20  then
	       x900033_NotifyTips(  sceneId,  selfId,  " trß¾c m£t th¥n khí ðích khí linh ðµ ðã ð¥y c¤p , có th¬ lên c¤p thái c± th¥n khí ~"  )	 
	       return
	 end

                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38002049)  <  FuXiCost[myQLZ]  then    -- phøc hi ng÷c biên s¯ 
                      x900033_NotifyTips(  sceneId,  selfId,  " c¥n [ phøc hi ng÷c ]"..FuXiCost[myQLZ].." cá "  )	 
                      return
                end

	 local  HumanMoney  =  LuaFnGetMoney(  sceneId,  selfId  )
    	 local  HumanMoneyJZ  =  GetMoneyJZ(  sceneId,  selfId  );
	 
	 if  HumanMoney  +  HumanMoneyJZ  <  50000  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n chßa ðü #{_EXCHG50000}"  )
	 	 return
	 end

	 local  nDelJZ,  nDelMoney  =  LuaFnCostMoneyWithPriority(sceneId,  selfId,  50000);
                if  nDelJZ  ==  -1  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

                if    LuaFnDelAvailableItem(sceneId,selfId,38002049,FuXiCost[myQLZ])  ~=  1  then
                        x900033_NotifyTips(  sceneId,  selfId,  "[ phøc hi ng÷c ] kh¤u tr× th¤t bÕi "  )
                        return
                end

                myQLZ  =  myQLZ  +  1
                local  NEWname  =  ""
                if  myQLZ  <  10  then
                      NEWname  =  gsub(myname,"(#S%w)%w","%1"..myQLZ)
                else
                      NEWname  =  gsub(myname,"(#S)%w%w","%1"..myQLZ)
                end
	 LuaFnSetItemCreator(  sceneId,  selfId,  PosId,  NEWname  )
	 LuaFnRefreshItemInfo(  sceneId,  selfId,  PosId  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	 x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , #{_ITEM"..myEquipId.."} døc linh thành công ! trß¾c m£t ðích khí linh tr¸ giá là "..myQLZ.." c¤p "  )	 
              return
          end


--***********************************
-- thßþng c± th¥n khí rót vào h°n v¸ 
--***********************************
          if  eventId  ==  3  then

                local  HunWei  =  {" M®nh "," Ð¸a "," Thiên "}
                local  ShuXing  =  {" Bång "," Höa "," Huy«n "," Ðµc "}
	 local  myEquipId  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  PosId  )
                local  ShangGuCK  =  0

                for  i  =  1,getn(x900033_g_ShenBing)  do
                        if  x900033_g_ShenBing[i]  ==  myEquipId  then
	 	 ShangGuCK  =  1
                        end
                end

                for  i  =  1,getn(x900033_g_TaiGu)  do
                        if  x900033_g_TaiGu[i]  ==  myEquipId  then
	 	 ShangGuCK  =  1
                        end
                end

                if  ShangGuCK  ~=  1  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i bö vào ðích vû khí không phäi là 102 thßþng c± th¥n khí ho£c thái c± th¥n khí "  )	 
	       return
	 end

                if  arg1  <  1  or  arg1  >  3  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i lña ch÷n h°n v¸ b¤t chánh xác , xin/m¶i n£ng t¡m lña ch÷n "  )	 
	       return
	 end

                if  arg2  <  1  or  arg2  >  4  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i lña ch÷n rót vào ðích h°n v¸ thuµc tính b¤t chánh xác , xin/m¶i n£ng t¡m lña ch÷n "  )	 
	       return
	 end

	 local  myQLD  =  tonumber(strsub(myname,xieziQL+2,xieziQL+9))  
                local  name11  =  ""
	 if  arg1  ==  1  then
	               name11  =  gsub(myname,"(#S%w%w)%w","%1"..arg2)  
	 elseif  arg1  ==  2  then
	               name11  =  gsub(myname,"(#S%w%w%w%w)%w","%1"..arg2)  
	 elseif  arg1  ==  3  then
	               name11  =  gsub(myname,"(#S%w%w%w%w%w%w)%w","%1"..arg2)  
	 else
	       x900033_NotifyTips(  sceneId,  selfId,  " không biªt sai l¥m , xin liên lÕc GM"  )	 
	       return
	 end

	 LuaFnSetItemCreator(  sceneId,  selfId,  PosId,  name11  )
	 LuaFnRefreshItemInfo(  sceneId,  selfId,  PosId  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 

	 x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , "..HunWei[arg1].." h°n v¸ rót vào thuµc tính thành công ! trß¾c m£t ðích thuµc tính vì : "..ShuXing[arg2]..""  )	 
              return
          end


--***********************************
-- thßþng c± th¥n khí h°n v¸ thång c¤p 
--***********************************
          if  eventId  ==  4  then

                local  HunWei  =  {" M®nh "," Ð¸a "," Thiên "}
                local  ShuXing  =  {" Bång "," Höa "," Huy«n "," Ðµc "}
	 local  myEquipId  =  LuaFnGetItemTableIndexByIndex(  sceneId,  selfId,  PosId  )
                local  ShangGuCK  =  0

                for  i  =  1,getn(x900033_g_ShenBing)  do
                        if  x900033_g_ShenBing[i]  ==  myEquipId  then
	 	 ShangGuCK  =  1
                        end
                end

                for  i  =  1,getn(x900033_g_TaiGu)  do
                        if  x900033_g_TaiGu[i]  ==  myEquipId  then
	 	 ShangGuCK  =  1
                        end
                end

                if  ShangGuCK  ~=  1  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i bö vào ðích vû khí không phäi là 102 thßþng c± th¥n khí ho£c thái c± th¥n khí "  )	 
	       return
	 end

                if  arg1  <  1  or  arg1  >  3  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i lña ch÷n h°n v¸ b¤t chánh xác , xin/m¶i n£ng t¡m lña ch÷n "  )	 
	       return
	 end

                local  CostCailiao  =  38002045
                local  hunSX,hunLev  =  0,0
                local  name11  =  ""
	 if  arg1  ==  1  then
                      CostCailiao  =  38002041
                      hunSX  =  tonumber(strsub(myname,xieziQL+4,xieziQL+4))      -- m®nh h°n v¸ thuµc tính 
                      hunLev  =  tonumber(strsub(myname,xieziQL+5,xieziQL+5))      -- m®nh h°n v¸ c¤p b§c -1
                      if  hunSX  <  1  or  hunSX  >  4  then
	             x900033_NotifyTips(  sceneId,  selfId,  " ngài ðích m®nh h°n v¸ chßa rót vào thuµc tính , rót vào thuµc tính sau m¾i có th¬ thång c¤p "  )	 
	             return
	       end
                      if  hunLev  >=  9  then
	             x900033_NotifyTips(  sceneId,  selfId,  " ngài m®nh h°n v¸ ðã tång lên t¾i mãn c¤p , không cách nào tiªp tøc tång lên "  )	 
	             return
	       end
                      hunLev  =  hunLev  +  1
                      name11  =  gsub(myname,"(#S%w%w%w)%w","%1"..hunLev)  

	 elseif  arg1  ==  2  then
                      CostCailiao  =  38002043
                      hunSX  =  tonumber(strsub(myname,xieziQL+6,xieziQL+6))      -- ð¸a h°n v¸ thuµc tính 
                      hunLev  =  tonumber(strsub(myname,xieziQL+7,xieziQL+7))      -- ð¸a h°n v¸ c¤p b§c -1
                      if  hunSX  <  1  or  hunSX  >  4  then
	             x900033_NotifyTips(  sceneId,  selfId,  " ngài ðích ð¸a h°n v¸ chßa rót vào thuµc tính , rót vào thuµc tính sau m¾i có th¬ thång c¤p "  )	 
	             return
	       end
                      if  hunLev  >=  9  then
	             x900033_NotifyTips(  sceneId,  selfId,  " ngài ð¸a h°n v¸ ðã tång lên t¾i mãn c¤p , không cách nào tiªp tøc tång lên "  )	 
	             return
	       end
                      hunLev  =  hunLev  +  1
                      name11  =  gsub(myname,"(#S%w%w%w%w%w)%w","%1"..hunLev)  

	 elseif  arg1  ==  3  then
                      CostCailiao  =  38002045
                      hunSX  =  tonumber(strsub(myname,xieziQL+8,xieziQL+8))      -- Thiên h°n v¸ thuµc tính 
                      hunLev  =  tonumber(strsub(myname,xieziQL+9,xieziQL+9))      -- Thiên h°n v¸ c¤p b§c -1
                      if  hunSX  <  1  or  hunSX  >  4  then
	             x900033_NotifyTips(  sceneId,  selfId,  " ngài ðích Thiên h°n v¸ chßa rót vào thuµc tính , rót vào thuµc tính sau m¾i có th¬ thång c¤p "  )	 
	             return
	       end
                      if  hunLev  >=  9  then
	             x900033_NotifyTips(  sceneId,  selfId,  " ngài Thiên h°n v¸ ðã tång lên t¾i mãn c¤p , không cách nào tiªp tøc tång lên "  )	 
	             return
	       end
                      hunLev  =  hunLev  +  1
	       name11  =  gsub(myname,"(#S%w%w%w%w%w%w%w)%w","%1"..hunLev)  
                else
	       x900033_NotifyTips(  sceneId,  selfId,  " không biªt sai l¥m , xin/m¶i l¥n næa lña ch÷n mµt cái mu¯n thång c¤p ðích h°n v¸ "  )	 
	       return
	 end

                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  CostCailiao)  <  x900033_g_SkillLevCost[arg1][hunLev]  then
                      x900033_NotifyTips(  sceneId,  selfId,  " c¥n [#{_ITEM"..CostCailiao.."}]"..x900033_g_SkillLevCost[arg1][hunLev].." cá "  )	 
                      return
                end

                if    LuaFnDelAvailableItem(sceneId,selfId,CostCailiao,x900033_g_SkillLevCost[arg1][hunLev])  ~=  1  then
                        x900033_NotifyTips(  sceneId,  selfId,  "[#{_ITEM"..CostCailiao.."}] kh¤u tr× th¤t bÕi "  )
                        return
                end

                hunLev  =  hunLev  +  1
	 LuaFnSetItemCreator(  sceneId,  selfId,  PosId,  name11  )
	 LuaFnRefreshItemInfo(  sceneId,  selfId,  PosId  )
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	 x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , "..HunWei[arg1].." h°n v¸ thång c¤p thuµc tính thành công ! trß¾c m£t ðích thuµc tính vì : "..ShuXing[hunSX].."·"..hunLev.." c¤p "  )	 
              return
          end


end

--**********************************
--  màn änh trung gian tin tÑc ð« kÏ 
--**********************************
function  x900033_NotifyTips(  sceneId,  selfId,  Tip  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  Tip  )
	 EndEvent(  sceneId  )
	 DispatchMissionTips(  sceneId,  selfId  )
end






--**********************************
-- hÕt tØ luy®n chª   vû ý t±ng kh¯ng chân v¯n 
--**********************************
function  x900033_XIEZI_WUYI(sceneId,selfId,xieziId,sxpot,skillId)
                CallScriptFunction(2015,"JianCe",sceneId,selfId)  -- m²i l¥n m· ra cà m¾i vû ý giªt trách ðªm 
                local  SXnam  =  {" máu thßþng hÕn "," bång công "," höa công "," huy«n công "," ðµc công "," m®nh trung "," né tránh "," xuyên thÑ công kích "," xuyên thÑ giäm mi­n "}
                local  TianFuBookNam  =  {" ð¤u chi sách "," tøc chi sách "," hành chi sách "," phßþc chi sách "," tuy®t chi sách "}
                local  TianFuSkillNam  =  {"Vû Ý.Xuyên thª ","Vû Ý.thiên quân ","Vû Ý.kim thang ","Vû Ý.b¤t bÕi ","Vû Ý.không v« ","Vû Ý.b¤t khu¤t ","Vû Ý.máu giªt ","Vû Ý.ðoÕt m®nh ","Vû Ý.xâm lßþc ","Vû Ý.thü tâm ","Vû Ý.v¸ nhiên ","Vû Ý.thông minh : sáng süa ","Vû Ý.chìm phong ","Vû Ý.song sinh ","Vû Ý.b¯i thüy "}
                local  TianFuSkill_ID  =  {931,932,933,934,935,936,937,938,939,940,941,942,943,944,945}

-- tr· xu¯ng là b¡t ð¥u nµi dung 
--***********************************
-- vû ý luy®n khí     thêm ði¬m 
--***********************************
          if  xieziId  ==  1  then
                local  QianLingNum  =  floor(GetMissionData(sceneId,selfId,WUYI_1)/10000)
                if  QianLingNum  <=  0  then
	               x900033_NotifyTips(  sceneId,  selfId,  " ngß½i không có dß th×a vû ý l£n/lën linh , không th¬ tiªn hành hóa khí thao tác ~"  )	 
	               return
	         end
                SetMissionData(sceneId,selfId,WUYI_1,GetMissionData(sceneId,selfId,WUYI_1)-10000)
                local  SuiJiPoint  =  random(1,9)
                if  SuiJiPoint  ==  1  then
                      SetMissionData(sceneId,selfId,WUYI_1,GetMissionData(sceneId,selfId,WUYI_1)+1)
                elseif  SuiJiPoint  ==  2  then
                      SetMissionData(sceneId,selfId,WUYI_2,GetMissionData(sceneId,selfId,WUYI_2)+10000)
                elseif  SuiJiPoint  ==  3  then
                      SetMissionData(sceneId,selfId,WUYI_2,GetMissionData(sceneId,selfId,WUYI_2)+1)
                elseif  SuiJiPoint  ==  4  then
                      SetMissionData(sceneId,selfId,WUYI_3,GetMissionData(sceneId,selfId,WUYI_3)+10000)
                elseif  SuiJiPoint  ==  5  then
                      SetMissionData(sceneId,selfId,WUYI_3,GetMissionData(sceneId,selfId,WUYI_3)+1)
                elseif  SuiJiPoint  ==  6  then
                      SetMissionData(sceneId,selfId,WUYI_4,GetMissionData(sceneId,selfId,WUYI_4)+10000)
                elseif  SuiJiPoint  ==  7  then
                      SetMissionData(sceneId,selfId,WUYI_4,GetMissionData(sceneId,selfId,WUYI_4)+1)
                elseif  SuiJiPoint  ==  8  then
                      SetMissionData(sceneId,selfId,WUYI_5,GetMissionData(sceneId,selfId,WUYI_5)+10000)
                elseif  SuiJiPoint  ==  9  then
                      SetMissionData(sceneId,selfId,WUYI_5,GetMissionData(sceneId,selfId,WUYI_5)+1)
                end

                CallScriptFunction(892002,"AHa_ReMyBuff",sceneId,selfId)
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	         x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , thêm ði¬m thành công , vû ý ?"..SXnam[SuiJiPoint].."? ði¬m ðªm +1"  )
                x900033_WUYI_Refresh1(sceneId,selfId,SuiJiPoint)  	 
              return
          end

--*****************************************
-- vû ý hóa khí     hüy bö mµt v¸ mµt ði¬m ðªm , thêm ðªn nhæng khác v¸ 
--*****************************************
          if  xieziId  ==  2  then
                if  sxpot  ==  nil  or  sxpot  <  0  or  sxpot  >  8  then
                      return
                end

                local  KillPoint  =  sxpot  +  1
                local  WuYiSX  =  {}
                            WuYiSX[0]  =  floor(GetMissionData(sceneId,selfId,WUYI_1)/10000)
                            WuYiSX[1]  =  mod(GetMissionData(sceneId,selfId,WUYI_1),10000)
                            WuYiSX[2]  =  floor(GetMissionData(sceneId,selfId,WUYI_2)/10000)
                            WuYiSX[3]  =  mod(GetMissionData(sceneId,selfId,WUYI_2),10000)
                            WuYiSX[4]  =  floor(GetMissionData(sceneId,selfId,WUYI_3)/10000)
                            WuYiSX[5]  =  mod(GetMissionData(sceneId,selfId,WUYI_3),10000)
                            WuYiSX[6]  =  floor(GetMissionData(sceneId,selfId,WUYI_4)/10000)
                            WuYiSX[7]  =  mod(GetMissionData(sceneId,selfId,WUYI_4),10000)
                            WuYiSX[8]  =  floor(GetMissionData(sceneId,selfId,WUYI_5)/10000)
                            WuYiSX[9]  =  mod(GetMissionData(sceneId,selfId,WUYI_5),10000)

                if  WuYiSX[KillPoint]  <=  0  then
	             x900033_NotifyTips(  sceneId,  selfId,  " trß¾c m£t thuµc tính v¸ không có chút ðªm , không cách nào t¡m ði¬m . "  )
                      return
                else
	             x900033_NotifyTips(  sceneId,  selfId,  " trß¾c m£t thuµc tính v¸ ði¬m ðªm , "..WuYiSX[KillPoint]..""  )
                end

	 local  HumanMoney  =  LuaFnGetMoney(  sceneId,  selfId  )
    	 local  HumanMoneyJZ  =  GetMoneyJZ(  sceneId,  selfId  );
	 if  HumanMoney  +  HumanMoneyJZ  <  50000  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n chßa ðü #{_EXCHG50000}"  )
	 	 return
	 end

                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  38002047)  <  1  then    -- phøc hi ng÷c biên s¯ 
                      x900033_NotifyTips(  sceneId,  selfId,  " c¥n [ tØ phü tinh tüy ]  1 cá "  )	 
                      return
                end

                if    LuaFnDelAvailableItem(sceneId,selfId,38002047,1)  ~=  1  then
                        x900033_NotifyTips(  sceneId,  selfId,  "[ tØ phü tinh tüy ] kh¤u tr× th¤t bÕi "  )
                        return
                end

	 local  nDelJZ,  nDelMoney  =  LuaFnCostMoneyWithPriority(sceneId,  selfId,  50000);
                if  nDelJZ  ==  -1  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

                local  NewPoint  =  random(1,9)
                if  NewPoint  ==  KillPoint  then
                      if  KillPoint  <=  5  then
                            NewPoint  =  KillPoint  +  1
                      else
                            NewPoint  =  KillPoint  -  1
                      end
                end

                WuYiSX[KillPoint]  =  WuYiSX[KillPoint]  -  1
                WuYiSX[NewPoint]  =  WuYiSX[NewPoint]  +  1

                SetMissionData(sceneId,selfId,WUYI_1,WuYiSX[0]*10^4+WuYiSX[1])
                SetMissionData(sceneId,selfId,WUYI_2,WuYiSX[2]*10^4+WuYiSX[3])
                SetMissionData(sceneId,selfId,WUYI_3,WuYiSX[4]*10^4+WuYiSX[5])
                SetMissionData(sceneId,selfId,WUYI_4,WuYiSX[6]*10^4+WuYiSX[7])
                SetMissionData(sceneId,selfId,WUYI_5,WuYiSX[8]*10^4+WuYiSX[9])

                CallScriptFunction(892002,"AHa_ReMyBuff",sceneId,selfId)
                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	         x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , thành công d¶i ði 1 cá ði¬m ðªm t¾i vû ý ?"..SXnam[NewPoint].."?"  )	 
                x900033_WUYI_Refresh1(sceneId,selfId,NewPoint)
              return
          end


--*****************************************
-- vû ý kÛ nång nghiên t§p 
--*****************************************
          if  xieziId  ==  3  then

                if  sxpot  ==  nil  or  sxpot  <  0  or  sxpot  >  5  then
                      return
                end

                if  skillId  ==  nil  or  skillId  <  0  or  skillId  >  15  then
                      return
                end

                if  sxpot*5  >  mod(GetMissionData(sceneId,selfId,WUYI_LEVEL),10000)  then
	         x900033_NotifyTips(  sceneId,  selfId,  " ngß½i trß¾c m£t vû ý c¤p b§c chßa ðü l¤y h÷c t§p này kÛ nång ! "  )
                      return
                end

                if  sxpot  ~=  floor((skillId  +  2)/3)  then	 
                      return
                end

                local  TianFuSkill  =  {}
                            TianFuSkill[0]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_A)/10000)    -- b°i nguyên ði¬m ðªm 
                            TianFuSkill[1]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_A),10000)                    -- thÑ 1 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[2]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_BC)/10000)                -- thÑ 2 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[3]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),10000)                    -- thÑ 3 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[4]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_DE)/10000)                -- thÑ 4 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[5]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10000)                    -- thÑ 5 quy¬n sách kÛ nång c¤p b§c 

                if  TianFuSkill[0]  <  1  then
	       x900033_NotifyTips(  sceneId,  selfId,  " ngß½i trß¾c m£t không có b°i nguyên ði¬m ðªm , không th¬ nghiên t§p bí pháp "  )
                      return
                else
                      TianFuSkill[0]  =  TianFuSkill[0]  -  1
                end

                if  floor(TianFuSkill[sxpot]/100)  ==  0  then
                            TianFuSkill[sxpot]  =  skillId  *  100  +  1
                            AddSkill(sceneId,  selfId,TianFuSkill_ID[skillId])
                else
                    if  floor(TianFuSkill[sxpot]/100)  ~=  skillId  then
	           x900033_NotifyTips(  sceneId,  selfId,  " xin/m¶i lña ch÷n chính xác kÛ nång tiªn hành thång c¤p ! "  )
                          return
                    end
                    if  mod(TianFuSkill[sxpot],100)  >=  10  then
	           x900033_NotifyTips(  sceneId,  selfId,  " trß¾c m£t kÛ nång ðích nghiên t§p c¤p b§c ðã ðÕt cao nh¤t , không cách nào tiªp tøc thång c¤p ! "  )
                          return
                    end
                    TianFuSkill[sxpot]  =  TianFuSkill[sxpot]  +  1
                end

                SetMissionData(sceneId,selfId,WUYI_SKILL_A,TianFuSkill[0]*10^4+TianFuSkill[1])
                SetMissionData(sceneId,selfId,WUYI_SKILL_BC,TianFuSkill[2]*10^4+TianFuSkill[3])
                SetMissionData(sceneId,selfId,WUYI_SKILL_DE,TianFuSkill[4]*10^4+TianFuSkill[5])

                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	         x900033_NotifyTips(  sceneId,  selfId,  " chúc m×ng ngài , nghiên t§p thành công . ?"..TianFuSkillNam[skillId].."? kÛ nång c¤p b§c l¤y ðßþc tång lên ! "  )	 
                  x900033_WUYI_Refresh2(sceneId,selfId)  	 
              return
          end


--*****************************************
-- vû ý kÛ nång quên lãng 
--*****************************************
          if  xieziId  ==  4  then

                if  sxpot  ==  nil  or  sxpot  <  0  or  sxpot  >  5  then
                      return
                end

                if  skillId  ==  nil  or  skillId  <  0  or  skillId  >  15  then
                      return
                end

                if  sxpot  ~=  floor((skillId  +  2)/3)  then	 
                      return
                end

                local  TianFuSkill  =  {}
                            TianFuSkill[0]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_A)/10000)    -- b°i nguyên ði¬m ðªm 
                            TianFuSkill[1]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_A),10000)                    -- thÑ 1 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[2]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_BC)/10000)                -- thÑ 2 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[3]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_BC),10000)                    -- thÑ 3 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[4]  =  floor(GetMissionData(sceneId,selfId,WUYI_SKILL_DE)/10000)                -- thÑ 4 quy¬n sách kÛ nång c¤p b§c 
                            TianFuSkill[5]  =  mod(GetMissionData(sceneId,selfId,WUYI_SKILL_DE),10000)                    -- thÑ 5 quy¬n sách kÛ nång c¤p b§c 

                if  floor(TianFuSkill[sxpot]/100)  ==  0  then
	           x900033_NotifyTips(  sceneId,  selfId,  " ngài chßa nghiên t§p ?"..TianFuBookNam[sxpot].."? trung ðích bí truy«n , không c¥n tiªn hành quên lãng . "  )
                          return
                end

                if  mod(TianFuSkill[sxpot],100)  <=  0  then
	           x900033_NotifyTips(  sceneId,  selfId,  " ki¬m tr¡c ðªn ngß½i lña ch÷n thiên phú kÛ nång không t°n tÕi nghiên t§p c¤p b§c , có th¬ là s¯ li®u sai l¥m , t¯c liên lÕc GM"  )
                          return
                end

                if  floor(TianFuSkill[sxpot]/100)  ~=  skillId  then
	           x900033_NotifyTips(  sceneId,  selfId,  "Error ! ! ! "  )
                          return
                end

	 local  HumanMoney  =  LuaFnGetMoney(  sceneId,  selfId  )
    	 local  HumanMoneyJZ  =  GetMoneyJZ(  sceneId,  selfId  );
	 if  HumanMoney  +  HumanMoneyJZ  <  100000  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n chßa ðü #{_EXCHG100000}"  )
	 	 return
	 end

	 local  nDelJZ,  nDelMoney  =  LuaFnCostMoneyWithPriority(sceneId,  selfId,  100000);
                if  nDelJZ  ==  -1  then
	 	 x900033_NotifyTips(  sceneId,  selfId,  " kim ti«n kh¤u tr× th¤t bÕi "  )
	 	 return
	 end

                TianFuSkill[0]  =  TianFuSkill[0]  +  mod(TianFuSkill[sxpot],100)    -- thiên phú ði¬m ðªm tr· v« 
                TianFuSkill[sxpot]  =  0      -- kÛ nång thuµc v« s¯ không 
                DelSkill(  sceneId,selfId,TianFuSkill_ID[skillId]  )

                SetMissionData(sceneId,selfId,WUYI_SKILL_A,TianFuSkill[0]*10^4+TianFuSkill[1])
                SetMissionData(sceneId,selfId,WUYI_SKILL_BC,TianFuSkill[2]*10^4+TianFuSkill[3])
                SetMissionData(sceneId,selfId,WUYI_SKILL_DE,TianFuSkill[4]*10^4+TianFuSkill[5])

                LuaFnSendSpecificImpactToUnit(sceneId,  selfId,  selfId,  selfId,  148,  0)  -- ð£c hi®u 
	         x900033_NotifyTips(  sceneId,  selfId,  " thành công tr÷ng t¦y ?"..TianFuBookNam[sxpot].."? ðích b°i nguyên ði¬m ðªm . "  )	 
                  x900033_WUYI_Refresh2(sceneId,selfId)  	 
              return
          end


end

--*****************************************
-- l¥n næa m· ra vû ý gi¾i m£t 1
--*****************************************
function  x900033_WUYI_Refresh1(sceneId,selfId,Index)  --Index ðÕi bi¬u cho mµt v¸ kia thêm thuµc tính 
	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,1)
	       UICommand_AddInt(sceneId,Index)
	       EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  201711091  )
end

--*****************************************
-- l¥n næa m· ra vû ý gi¾i m£t 2
--*****************************************
function  x900033_WUYI_Refresh2(sceneId,selfId)  
	 BeginUICommand(sceneId)
	       UICommand_AddInt(sceneId,2);
	       EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  201711091  )
end



