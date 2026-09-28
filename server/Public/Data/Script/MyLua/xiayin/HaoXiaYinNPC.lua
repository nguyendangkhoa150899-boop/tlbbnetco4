-- 880009 ºÀÏÀÓ¡¶Ò»»NPC

-- ³àÉ°Ö®Ð« 718805400ÖÆ×÷  Çë×ðÖØÔ­´´£¬½ûÖ¹µÁ°æ

--½Å±¾ºÅ
x880009_g_ScriptId = 880009

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
--x880009_g_eventList={889070}

x880009_g_EquipList={	
-- ÖØÂ¥
{n=4100,id=10159001},{n=4100,id=10159011},{n=4100,id=10159021},{n=4100,id=10159031},
}

x880009_g_StoneList={
{n=1,id=38001100,num=1,str="Hào Hi®p ChÑng Minh"},
}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x880009_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "    #W Vung kiªm n±i gió, hi®p c¯t ngút tr¶i, ð°ng sinh cµng tØ xong pha CØu Châu." )
		AddText( sceneId, "    #WTß½ng truy«n  #cff99ffTiêu Phong#W mßþn Linh Thß¾c Cung #cff99ffHß Trúc#W bí pháp vô thßþng, và Thiên Nam #cff99ffÐoàn Th¸ #Wtài lñc, ðªn #G Thiên Hoàng C± Cänh m· ra #GVô Nhai Cänh, #W nªu vào ðó tÖ thí v¾i ð¯i thü së ðßþc danh hi®u phi phàm" )
		AddText( sceneId, "#Yp/s: Dùng Hào Hi®p Huân Chß½ng ð¬ nâng c¤p Hi®p Ân" )
		AddText( sceneId, "#Yp/s: Dùng Hào Hi®p T£ng Thß·ng ð¬ nâng skill Hi®p Ân" )
		--AddText( sceneId, "#b#cff99ff#ef12345#Y ChÑc nång chßa m·, vui lòng quay lÕi sau " )		
	     if GetLevel( sceneId, selfId ) >= 95 then
		AddNumText( sceneId, x880009_g_ScriptId, "#cFF0000Ð±i Hào Hi®p ¤n", 6, 4100 )
	       AddNumText( sceneId, x880009_g_scriptId, "#cFF0000Ði¬m chiªn Công ð±i#G[Hào Hi®p Huân Chß½ng] -#cFF0000Kích hoÕt Hào Hi®p ¤n", 6, 103 )
	        AddNumText( sceneId, x880009_g_scriptId, "#cFF0000Ði¬m Chiªn Công ð±i#G[Hào Hi®p T£ng Thß·ng] #cFF0000Kích hoÕt Hào Hi®p ¤n", 6, 104 )
	       AddNumText( sceneId, x880009_g_scriptId, "#cFF0000Ðúc LÕi Hào Hi®p ¤n", 6, 105 )
             else
		AddText(sceneId, "#r    #cFF0000 Các hÕ c¤p b§c #H không ðü  95 c¤p #cFF0000, không th¬ kích hoÕt Hào Hi®p ¤n, xin häy hãy nâng c¤p trß¾c!")
             end
		--AddNumText( sceneId, x880009_g_ScriptId, "Àë¿ª¡­¡­", 0, 0 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x880009_OnDefaultEvent( sceneId, selfId,targetId )
	x880009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x880009_OnEventRequest( sceneId, selfId, targetId, eventId )

	local nNumText = GetNumText()
	if nNumText == 0  then
		-- ¹Ø±Õ´°¿Ú
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end


	if nNumText == 11  then
           BeginEvent( sceneId ) 
           AddText( sceneId, "#{HXYSJ_141031_92}" )
           EndEvent( sceneId )
           DispatchEventList( sceneId, selfId, targetId )
	end


    if nNumText == 103  then
    local ZhanGong = GetMissionData(sceneId, selfId,XIAYIN_ZHANGONG)
      if ZhanGong < 100 then
       BeginEvent( sceneId ) 
       AddText( sceneId, "    #W Chiªn công giá tr¸ không ðü  #G100#W, không th¬ Ð±i #G[ Hào Hi®p Huân Chß½ng ]" )
       EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
      return
      end
      if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1  then
       BeginEvent( sceneId ) 
       AddText( sceneId, "    Tay Näi không ðü  khoäng tr¯ng 1 cái" )
       EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
      return
      end
    SetMissionData(sceneId, selfId, XIAYIN_ZHANGONG, ZhanGong-100)
       for i = 1,100 do
           TryRecieveItem( sceneId, selfId, 38001087, 1)  --ºÀÏÀÑ«ÕÂ
       end
       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
       BeginEvent( sceneId ) 
       AddText( sceneId, "    #W chúc m×ng các hÕ, tiêu phí 100 ði¬m Chiªn công Ð±i ðªn #G100#W cái #G[ Hào Hi®p Huân Chß½ng ]" )
       EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
        return
    end



    if nNumText == 104  then
    local ZhanGong = GetMissionData(sceneId, selfId,XIAYIN_ZHANGONG)
      if ZhanGong < 200 then
       BeginEvent( sceneId ) 
       AddText( sceneId, "    #W Chiªn công giá tr¸ không ðü  #G200#W, không th¬ ð±i #G[ Hào Hi®p T£ng Thß·ng ]" )
       EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
      return
      end
      if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1  then
       BeginEvent( sceneId ) 
       AddText( sceneId, "    Tay näi không ðü  khoäng tr¯ng 1 cái" )
       EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
      return
      end
    SetMissionData(sceneId, selfId, XIAYIN_ZHANGONG, ZhanGong-200)
           TryRecieveItem( sceneId, selfId, 38001089, 1)  --ºÀÏÀÁîÉÍ
       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
       BeginEvent( sceneId ) 
       AddText( sceneId, "    #W chúc m×ng các hÕ, tiêu phí 200 ði¬m Chiªn công ð±i l¤y #G1#W cái #G[ Hào Hi®p T£ng Thß·ng ]" )
       EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
        return
    end


    if nNumText == 105  then
     local Type = GetMissionData( sceneId, selfId, XIAYIN_TYPE )
     local DengJi = GetMissionData( sceneId, selfId, XIAYIN_DJ )

       if Type < 1 or Type > 4 or DengJi < 1 or DengJi > 8 then
	  BeginEvent( sceneId ) 
	  strText = "        #Y Các hÕ chßa kích hoÕt #G Hào Hi®p ¤n #Y, không th¬ ðúc lÕi, xin hãy #G Ð±i Hi®p ¤n #Y trß¾c tiên!"
	  AddText( sceneId, strText )
	  EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
       return
       else
            local LQScount = GetMissionData(sceneId, selfId,XIAYIN_DJ)*10
	BeginEvent(sceneId)
		AddText( sceneId, "#{HXYSJ_141031_156}" )
                if Type == 1 then
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi BÕch Hi®p ¤n #GC¥n#R "..LQScount.."[Long Tuy«n Thüy]", 6, 202 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Chu Tß¾c Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 203 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Huy«n Vû Hi®p ¤n #GC¥n#R"..LQScount.." [Long Tuy«n Thüy]", 6 ,204 )
                elseif Type == 2 then
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Thanh Long Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 201 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Chu Tß¾c Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 203 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Huy«n Vû Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6 ,204 )
                elseif Type == 3 then
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Thanh Long Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 201 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi BÕch Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 202 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Huy«n Vû Hi®p ¤n#GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6 ,204 )
                elseif Type == 4 then
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Thanh Long Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 201 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi BÕch Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 202 )
	        AddNumText( sceneId, x880009_g_scriptId, "Ðúc LÕi Chu Tß¾c Hi®p ¤n #GC¥n#R "..LQScount.." [Long Tuy«n Thüy]", 6, 203 )
                end
		AddNumText( sceneId, x880009_g_ScriptId, "R¶i khöi", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
        return
    end
end


    if nNumText == 201  then
       local mount1 = GetMissionData(sceneId, selfId,XIAYIN_DJ)*10
       local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 38001093)
       if c0 >= mount1 then
	  BeginEvent( sceneId ) 
	    LuaFnDelAvailableItem(sceneId,selfId,38001093,mount1)--É¾³ý
            SetMissionData(sceneId, selfId, XIAYIN_TYPE, 1)
            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	   EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
	  x880009_NotifyTip( sceneId, selfId, "Ðúc lÕi thuµc tính thành công, trß¾c m¡t là Thanh Long Hào Hi®p ¤n thuµc tính Ðµc")
          CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)
          CallScriptFunction( 880006, "HXY_E",sceneId, selfId)
       else
	  BeginEvent( sceneId ) 
	  strText = "    #Y Các hÕ #G[#{_ITEM38001093}]#Y không ðü #G"..mount1.."#Y cái, không th¬ Ðúc lÕi Hào Hi®p ¤n"
	  AddText( sceneId, strText )
	  EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
       end
        return
   end


    if nNumText == 202  then
       local mount2 = GetMissionData(sceneId, selfId,XIAYIN_DJ)*10
       local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 38001093)
       if c0 >= mount2 then
	  BeginEvent( sceneId ) 
	    LuaFnDelAvailableItem(sceneId,selfId,38001093,mount2)--É¾³ý
            SetMissionData(sceneId, selfId, XIAYIN_TYPE, 2)
            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	   EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
	  x880009_NotifyTip( sceneId, selfId, "Ðúc lÕi thuµc tính thành công, trß¾c m¡t là BÕch H± Hào Hi®p ¤n thuµc tính Huy«n")
          CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)
          CallScriptFunction( 880006, "HXY_E",sceneId, selfId)
       else
	  BeginEvent( sceneId ) 
	  strText = "    #Y Các hÕ #G[#{_ITEM38001093}]#Y không ðü #G"..mount2.."#Y cái, không th¬ Ðúc lÕi Hào Hi®p ¤n"
	  AddText( sceneId, strText )
	  EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
       end
        return
   end

    if nNumText == 203  then
       local mount3 = GetMissionData(sceneId, selfId,XIAYIN_DJ)*10
       local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 38001093)
       if c0 >= mount3 then
	  BeginEvent( sceneId ) 
	    LuaFnDelAvailableItem(sceneId,selfId,38001093,mount3)--É¾³ý
            SetMissionData(sceneId, selfId, XIAYIN_TYPE, 3)
            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	   EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
	  x880009_NotifyTip( sceneId, selfId, "Ðúc lÕi thuµc tính thành công, trß¾c m¡t là Chu Tß¾c Hào Hi®p ¤n thuµc tính Höa")
          CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)
          CallScriptFunction( 880006, "HXY_E",sceneId, selfId)
       else
	  BeginEvent( sceneId ) 
	  strText = "    #Y Các hÕ #G[#{_ITEM38001093}]#Y không ðü #G"..mount3.."#Y cái, không th¬ Ðúc lÕi Hào Hi®p ¤n"
	  AddText( sceneId, strText )
	  EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
       end
        return
   end


    if nNumText == 204  then
       local mount4 = GetMissionData(sceneId, selfId,XIAYIN_DJ)*10
       local c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 38001093)
       if c0 >= mount4 then
	  BeginEvent( sceneId ) 
	    LuaFnDelAvailableItem(sceneId,selfId,38001093,mount4)--É¾³ý
            SetMissionData(sceneId, selfId, XIAYIN_TYPE, 4)
            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	   EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
	  x880009_NotifyTip( sceneId, selfId, "Ðúc lÕi thuµc tính thành công, trß¾c m¡t là Huy«n Vû Hào Hi®p ¤n thuµc tính Bång")
          CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)
          CallScriptFunction( 880006, "HXY_E",sceneId, selfId)
       else
	  BeginEvent( sceneId ) 
	  strText = "    #Y Các hÕ #G[#{_ITEM38001093}]#Y không ðü #G"..mount4.."#Y cái, không th¬ Ðúc lÕi Hào Hi®p ¤n"
	  AddText( sceneId, strText )
	  EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )
       end
        return
   end

	

	if nNumText > 1000 and nNumText < 11000  then

                if GetMissionData( sceneId, selfId, XIAYIN_DJ ) >= 1 then
                   BeginEvent( sceneId ) 
                   AddText( sceneId, "    Các hÕ ðã có Hào Hi®p ¤n, không c¥n kích hoÕt lÕi" )
                   EndEvent( sceneId )
                   DispatchEventList( sceneId, selfId, targetId )
                   return
                end

		BeginEvent(sceneId)
			local nLevel = 0
			if nNumText == 4100 then
			   AddText(sceneId, "#{HXYSJ_141031_178}")
			   AddText(sceneId, "#cFF0000 C¥n có #H[Hào Hi®p ChÑng Minh]#cFF0000,m¾i có th¬ kích hoÕt ðßþc!")
				nLevel = 1
			end
	
			--local szStr = "  #YËÄÏóºÀÏÀÓ¡#WÎªÊ¥ÉÏÚ¯·âÌìÏÂµ±ÊÀºÀ½Ü¶ø´òÔìµÄÉñÃØ¾ü±¸£¬ÆäÖÐÉñÃîÖ®´¦£¬×ÔÊÇÎÞÇî¡£È¡ÃûËÄÏó£¬×ÔÊÇÎªÁË¶ÔÓ¦ÌìµØËÄÁé£º#GÇàÁú#W¡¢#G°×»¢#W¡¢#GÖìÈ¸#W¡¢#GÐþÎä#W¡£¶øÓëËÄÁéÃû»äÏà¶ÔµÄ#YºÀÏÀÓ¡#W£¬Æä#GºÀÏÀç·Ó¡ÊôÐÔ#WÖÐ°üº¬µÄ#GÊôÐÔ¹¥»÷#W¡¢#GÊôÐÔ¼õ¿¹#WÒ²´óÎª²»Í¬£¬·Ö±ðÎª£º#G¶¾#W£¬#GÐþ#W£¬#G»ð#W£¬#G±ù#W¡£#r    Èô¸óÏÂ»³ÓÐ#G100Õ½¹¦#W£¬×Ô¿ÉÔÚÎÒÕâÀï»»È¡Ò»Ã¶#YºÀÏÀÓ¡#W¡£ÖÁÓÚ¸óÏÂËùÐèÄÄÖÖ´óÓ¡£¬»¹ÒªÄãÈÏÕæË¼ââÒ»·¬ÁË¡£"
			local szStr = ""

			AddText(sceneId, szStr)
			
			for i, item in x880009_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x880009_g_ScriptId, 0)
		
	end

	for i, findId in x880009_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x880009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x880009_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end
--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x880009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x880009_g_eventList do
		if missionScriptId == findId then
			x880009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x880009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x880009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x880009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x880009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--´¦ÀíÌá½»ºóµÄÏÔÊ¾Çé¿ö
	--ÎªÁË°²È«£¬ÕâÀïÒª×ÐÏ¸£¬²»ÄÜ³ö´í
	local nItemIndex = -1
	
	for i, item in x880009_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ¿´Íê¼ÒÊÇ²»ÊÇ¹»²ÄÁÏÌá½»
	local nLevel = 0
	if x880009_g_EquipList[nItemIndex].n == 4100 then
		nLevel = 1
	end

	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x880009_g_StoneList[nLevel].id) >= x880009_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
                   AddText( sceneId, "         #cFF0000Các hÕ không có [Hào Hi®p ChÑng Minh], không th¬ Ðúc l¤y Hào Hi®p ¤n ðßþc!" )
		EndEvent(sceneId)
                DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	-- ¼ì²éÊÇ²»ÊÇÓÐ×ã¹»µÄÊ¯Í·¿ÉÒÔ¿Û³ý
	if LuaFnGetAvailableItemCount(sceneId, selfId, x880009_g_StoneList[nLevel].id) < x880009_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "Các hÕ không ðü v§t ph¦m ð¬ Ðúc, xin m¶i xem lÕi v§t ph¦m khóa hay không khóa"
			AddText(sceneId,strText);
		EndEvent(sceneId)
                DispatchEventList( sceneId, selfId, targetId )
		return
		
	end

	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x880009_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- É¾³ýÏà¹ØµÄÊ¯Í·
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x880009_g_StoneList[nLevel].id, x880009_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "kh¤u tr× th¤t bÕi"
			AddText(sceneId,strText);
		EndEvent(sceneId)
                DispatchEventList( sceneId, selfId, targetId )
		return
	else

		local XiaYinType = (x880009_g_EquipList[nItemIndex].id - 10158991)/10
                   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		   SetMissionData( sceneId, selfId, XIAYIN_DJ , 1 )
		   SetMissionData( sceneId, selfId, XIAYIN_TYPE , XiaYinType )
                   CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)
                   CallScriptFunction( 880006, "HXY_E",sceneId, selfId)
				
		return
	end

	for i, findId in x880009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x880009_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x880009_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end