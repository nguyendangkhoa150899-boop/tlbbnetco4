-- trói ð¸nh hoa loÕi 30505260
-- không trói ð¸nh hoa loÕi 30505268-- cái này bö hoang r½i , chân v¯n không nh¢m vào h¡n 
-- hoa phì 30505261

-- xích sa ? hÕt   QQ-718805400
-- ÐÕi Lý ba ð¡p trong ð±i 
x002101_g_ScriptId	 =  002101
--************************************************************************
-- sñ ki®n li®t bi¬u 
--************************************************************************
function  x002101_OnDefaultEvent(  sceneId,  selfId,  targetId  )
	         BeginEvent(  sceneId  )
	 	     AddText(  sceneId,  "        chï c¥n là yêu thích hoa tß½i ngß¶i cüa , chính là ta tôn quý nh¤t ðích b¢ng hæu , ngß½i thay ta bäo t°n nhæng thÑ này Ba Tß hoa h°ng , bây gi¶ là h°i báo ngß½i lúc . ngß½i có ð¥y ðü Ba Tß hoa h°ng l¶i cüa , có th¬ ð±i nhß sau ðích v§t ph¦m . ")
	 	     AddNumText(  sceneId,  x002101_g_ScriptId,  "30 cá Ba Tß hoa h°ng ð±i tß·ng thß·ng ",6,1  )
	 	     -- [07/10] bo doi trung tran thu (pet dep chi phat qua event)
	 	     -- [07/10] bo doi trung tran thu (pet dep chi phat qua event)
	 	     -- [07/10] bo doi trung tran thu (pet dep chi phat qua event)
	 	     AddNumText(  sceneId,  x002101_g_ScriptId,  " liên quan t¾i loÕi hoa ",11,15  )	 	   

	         EndEvent(  sceneId  )
	         DispatchEventList(  sceneId,  selfId,  targetId  )
        
end
--**************************************************************************
-- sñ ki®n li®t bi¬u ch÷n trúng hÕng nh¤t 
--**************************************************************************
function  x002101_OnEventRequest(  sceneId,  selfId,  targetId,  eventId  )
	     local	 key	 =  GetNumText()
	     -- [07/10] chan doi trung tran thu (60/70/80 hoa hong) TRUOC khi tru hoa
	     if key == 2 or key == 3 or key == 4 or key == 201 or key == 301 or key == 401 or key == 402 or key == 403 then
	 	 BeginEvent( sceneId )
	 	 AddText( sceneId, "        \208\177i tr\226n th\250 \240\228n \240\227 ng\223ng. Tr\226n th\250 \240\169p ch\239 ph\225t qua s\241 ki\174n." )
	 	 EndEvent( sceneId )
	 	 DispatchEventList( sceneId, selfId, targetId )
	 	 return
	     end

	     if  key  ==  1  then
	                 BeginEvent(sceneId)
	 	 AddNumText(  sceneId,  x001154_g_ScriptId,  " ð±i thiên cß½ng cß¶ng hóa lµ ",  6,  101  )
	           EndEvent(sceneId)
	           DispatchEventList(sceneId,selfId,targetId)

	     elseif  key  ==  101  then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30505262)  >=30  then
	 	       BeginEvent(  sceneId  )  
	 	       LuaFnDelAvailableItem(sceneId,selfId,30505262,30)-- thü tiêu Ba Tß hoa h°ng 
	 	       local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  30900045,  1)-- cho ð° 
	 	       local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
        	                       local  strText  =  format("#G#{_INFOUSR%s}#W dùng 30 ðóa [#{_ITEM30505262}] t× #c00ffff ÐÕi Lý [182,70]#cff99ff ba ð¡p trong #W ch² ð±i mµt #G[#{_ITEM"..szItemTransfer.."}] ! ",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      x002101_CloseMe(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )  
	 	       strText  =  "        ngß½i Ba Tß hoa h°ng s¯ lßþng không ðü a ! "
	 	       AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	                 end



	     elseif  key  ==  2  then
	                 BeginEvent(sceneId)
	 	 AddNumText(  sceneId,  x001154_g_ScriptId,  " ð±i trân thú ðän : Hoa tiên tØ ",  6,  201  )
	           EndEvent(sceneId)
	           DispatchEventList(sceneId,selfId,targetId)

	     elseif  key  ==  201  then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30505262)  >=60  then
	 	       BeginEvent(  sceneId  )  
	 	       LuaFnDelAvailableItem(sceneId,selfId,30505262,60)-- thü tiêu Ba Tß hoa h°ng 
	 	       local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  30309766,  1)-- cho ð° 
	 	       local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
        	                       local  strText  =  format("#G#{_INFOUSR%s}#W dùng 60 ðóa [#{_ITEM30505262}] t× #c00ffff ÐÕi Lý [182,70]#cff99ff ba ð¡p trong #W ch² ð±i mµt #G[#{_ITEM"..szItemTransfer.."}] ! ",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      x002101_CloseMe(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )  
	 	       strText  =  "        ngß½i Ba Tß hoa h°ng s¯ lßþng không ðü a ! "
	 	       AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	                 end



	     elseif  key  ==  3  then
	                 BeginEvent(sceneId)
	 	 AddNumText(  sceneId,  x001154_g_ScriptId,  " ð±i trân thú ðän : khôi l²i lang ",  6,  301  )
	           EndEvent(sceneId)
	           DispatchEventList(sceneId,selfId,targetId)

	     elseif  key  ==  301  then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30505262)  >=70  then
	 	       BeginEvent(  sceneId  )  
	 	       LuaFnDelAvailableItem(sceneId,selfId,30505262,70)-- thü tiêu Ba Tß hoa h°ng 
	 	       local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  30309775,  1)-- cho ð° 
	 	       local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
        	                       local  strText  =  format("#G#{_INFOUSR%s}#W dùng 70 ðóa [#{_ITEM30505262}] t× #c00ffff ÐÕi Lý [182,70]#cff99ff ba ð¡p trong #W ch² ð±i mµt #G[#{_ITEM"..szItemTransfer.."}] ! ",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      x002101_CloseMe(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )  
	 	       strText  =  "        ngß½i Ba Tß hoa h°ng s¯ lßþng không ðü a ! "
	 	       AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	                 end



	     elseif  key  ==  4  then
	                 BeginEvent(sceneId)
	 	 AddNumText(  sceneId,  x001154_g_ScriptId,  " ð±i trân thú ðän : th¥n xí nga ",  6,  401  )
	 	 AddNumText(  sceneId,  x001154_g_ScriptId,  " ð±i trân thú ðän : ði®p yêu hoa ",  6,  402  )
	 	 AddNumText(  sceneId,  x001154_g_ScriptId,  " ð±i trân thú ðän : nåm màu th¥n bò ",  6,  403  )
	           EndEvent(sceneId)
	           DispatchEventList(sceneId,selfId,targetId)

	     elseif  key  ==  401  then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30505262)  >=80  then
	 	       BeginEvent(  sceneId  )  
	 	       LuaFnDelAvailableItem(sceneId,selfId,30505262,80)-- thü tiêu Ba Tß hoa h°ng 
	 	       local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  30309781,  1)-- cho ð° 
	 	       local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
        	                       local  strText  =  format("#G#{_INFOUSR%s}#W dùng 80 ðóa [#{_ITEM30505262}] t× #c00ffff ÐÕi Lý [182,70]#cff99ff ba ð¡p trong #W ch² ð±i mµt #G[#{_ITEM"..szItemTransfer.."}] ! ",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      x002101_CloseMe(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )  
	 	       strText  =  "        ngß½i Ba Tß hoa h°ng s¯ lßþng không ðü a ! "
	 	       AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	                 end

	     elseif  key  ==  402  then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30505262)  >=80  then
	 	       BeginEvent(  sceneId  )  
	 	       LuaFnDelAvailableItem(sceneId,selfId,30505262,80)-- thü tiêu Ba Tß hoa h°ng 
	 	       local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  30309774,  1)-- cho ð° 
	 	       local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
        	                       local  strText  =  format("#G#{_INFOUSR%s}#W dùng 80 ðóa [#{_ITEM30505262}] t× #c00ffff ÐÕi Lý [182,70]#cff99ff ba ð¡p trong #W ch² ð±i mµt #G[#{_ITEM"..szItemTransfer.."}] ! ",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      x002101_CloseMe(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )  
	 	       strText  =  "        ngß½i Ba Tß hoa h°ng s¯ lßþng không ðü a ! "
	 	       AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	                 end

	     elseif  key  ==  403  then
                                if  LuaFnGetAvailableItemCount(sceneId,  selfId,  30505262)  >=80  then
	 	       BeginEvent(  sceneId  )  
	 	       LuaFnDelAvailableItem(sceneId,selfId,30505262,80)-- thü tiêu Ba Tß hoa h°ng 
	 	       local  bagpos01  =  TryRecieveItem(  sceneId,  selfId,  30309776,  1)-- cho ð° 
	 	       local  szItemTransfer  =  GetBagItemTransfer(  sceneId,  selfId,  bagpos01  )
        	                       local  strText  =  format("#G#{_INFOUSR%s}#W dùng 80 ðóa [#{_ITEM30505262}] t× #c00ffff ÐÕi Lý [182,70]#cff99ff ba ð¡p trong #W ch² ð±i mµt #G[#{_ITEM"..szItemTransfer.."}] ! ",playerName  )  
	                       BroadMsgByChatPipe(sceneId,  selfId,  strText,  4)
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
                                      x002101_CloseMe(sceneId,  selfId)
                                else
	 	       BeginEvent(  sceneId  )  
	 	       strText  =  "        ngß½i Ba Tß hoa h°ng s¯ lßþng không ðü a ! "
	 	       AddText(  sceneId,  strText  )
	 	       EndEvent(  sceneId  )
	 	       DispatchEventList(  sceneId,  selfId,  targetId  )
	                 end

	 end	 
end	 

--**************************************************************************
-- ð¯i thoÕi 
--**************************************************************************
function  x002101_MsgBox(  sceneId,  selfId,  targetId,  msg  )
	 BeginEvent(  sceneId  )
	 	 AddText(  sceneId,  msg  )
	 EndEvent(  sceneId  )
	 DispatchEventList(  sceneId,  selfId,  targetId  )
end

--**********************************
-- t¡t ð¯i thoÕi khuông 
--**********************************
function  x002101_CloseMe(sceneId,  selfId)
	 BeginUICommand(sceneId)
	 EndUICommand(sceneId)
	 DispatchUICommand(sceneId,selfId,  1000)
end