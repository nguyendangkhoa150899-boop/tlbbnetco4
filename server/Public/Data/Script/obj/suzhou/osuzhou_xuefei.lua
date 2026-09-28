--ËÕÖÝNPC		¸ß¼¶×°±¸ÐÞÀí
--Ñ¦·Æ
--½Å±¾ºÅ

x001056_g_ScriptId = 001056

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x001056_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
        local NPCName = GetName(sceneId,targetId)
           if NPCName == " Âu Dã Vu " then
		AddText(sceneId,"#{SQSJ_0708_08}")
		AddNumText(sceneId,x001056_g_ScriptId,"Th¥n Khí Luy®n H°n",6,2)
		AddNumText(sceneId, x001056_g_ScriptId,"Liên quan t¾i Th¥n khí luy®n h°n",11,22);
           elseif NPCName == " Võ Ð°ng " then
AddText(sceneId,"    Nªu nhß ngß½i Võ H°n không bi¬u hi®n thuµc tính, có th¬ tìm ta chæa tr¸ mµt chút. Xin ðem câ`n chæa tr¸ Võ H°n ð£t · trong bao, chú ý Võ H°n không mu¯n khäm nÕm bäo thÕch!")
AddNumText(sceneId,x001056_g_ScriptId,"Võ H°n không hi®n thuµc tính chæa tr¸",6,3)
           else
AddText(sceneId,"#{SQXL_20071011}")
AddNumText(sceneId,x001056_g_ScriptId,"Ta mu¯n sØa chæa trang b¸",6,1)
AddNumText(sceneId, x001056_g_ScriptId,"Trang b¸ sØa chæa gi¾i thi®u",11,12);
AddNumText(sceneId, x001056_g_ScriptId,"#GSØa Th¥n Khí mi­n phí",6,15);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
           end
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001056_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 15 then
			local EquipType= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		if  EquipType ~= 0 then
				BeginEvent(sceneId)						
			AddText(sceneId,"#cFF0000Ð£t Th¥n khí c¥n sØa vào ô ð¥u tiên #Wnghe chßa, nói hoài sÇn cây búa th¢ng ð¥u ch÷c kª bên gõ 1 phát bây gi¶")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
		
		
		price = GetHighRepairPrice(sceneId, selfId, 0)
		ret = DoHighRepair( sceneId, selfId, 0, price)
			 x001056_NotifyFailBox( sceneId, selfId, targetId, "#c33ffcc Chúc m×ng b¢ng hæu ðã sØa th¥n khí thành công, hoan hô... hoan hô!  #YHu®®®®®®®®®®®®®®®®  #125" )
	 return
	end
	if GetNumText() == 1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )
	end

	if GetNumText() == 2 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,0);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 19831114 )
	end

	if GetNumText() == 3 then
           for i= 0,29 do
              if LuaFnGetItemTableIndexByIndex(sceneId,selfId,i) == 10156003 then   --10156200
                 if LuaFnEraseItem( sceneId, selfId, i ) == 1 then
                    TryRecieveItem( sceneId, selfId, 10156200, 1 )
                 end
              elseif LuaFnGetItemTableIndexByIndex(sceneId,selfId,i) == 10156004 then   --10156200
                 if LuaFnEraseItem( sceneId, selfId, i ) == 1 then
                    TryRecieveItem( sceneId, selfId, 10156100, 1 )
                 end
              end
          end
        end


	if GetNumText() == 12 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_043}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText() == 22 then
		BeginEvent(sceneId)
		   AddText(sceneId,"#{SQSJ_0708_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end
function x001056_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end