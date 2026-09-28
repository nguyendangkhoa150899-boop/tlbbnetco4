--ÂåÑôNPC
--³é½±
--ÆÕÍ¨
x001154_g_strGongGaoInfo = {
  "#{_INFOUSR%s} #HTräi qua bao khó khån cu¯i cùng cûng luy®n thành công #{_INFOMSG%s} th§t ðáng ngßÞng mµ", 
  "#{_INFOUSR%s} #HTräi qua bao khó khån cu¯i cùng cûng luy®n thành công #{_INFOMSG%s}", 
  "#{_INFOUSR%s} #HTräi qua bao khó khån cu¯i cùng cûng luy®n thành công #{_INFOMSG%s} th§t ðáng ngßÞng mµ", 
  "#{_INFOUSR%s} #HTräi qua bao khó khån cu¯i cùng cûng luy®n thành công #{_INFOMSG%s} ", 
}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x001154_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#W— giæa hoang mÕc, th¤y ngß¶i ðó ðang chª luy®n mµt loÕi Ám khí th¥n kÏ#Y Bång Phách Th¥n Châm#W. Do tÕi hÕ kh¦n c¥u, næ hi®p ðó ðã truy«n thø cách thÑc chª luy®n cho tÕi hÕ." )
		AddText( sceneId, "#WChï c¥n có #G1 #YMai Hoa Tiêu#W và #G20 #YHàn bång tinh thiªt#W r½i trong #GThäo PhÕt Yªn TØ có th¬ ðúc tÕo ðßþc Bång Phách Th¥n Châm" )
		AddText( sceneId, "#WChï c¥n có #G1 #YBång phách th¥n châm#W và #G50 #YHàn bång tinh thiªt#W r½i trong #GThäo PhÕt Yªn TØ#W có th¬ ðúc tÕo nên #GÐoÕn H°n Phiêu" )
		AddText( sceneId, "#cff0000Chú ý: Tháo gÞ ng÷c trß¾c khi ðúc Bång phách th¥n châm sau khi ðúc t¤t cä s¨ m¤t hªt!" )
		AddNumText( sceneId, x001154_g_ScriptId, "#GÐúc tÕo Ám Khí", 6, 102 )
		AddNumText( sceneId, x001154_g_ScriptId, "R¶i khöi", 8, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001154_OnEventRequest( sceneId, selfId, targetId, eventId)
			

	if GetNumText() == 102 then		
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		UICommand_AddInt( sceneId, selfId )
		DispatchUICommand(sceneId,selfId, 070825)		


	elseif GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
end
--**********************************
-- ¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x001154_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x001154_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )	
end

function x001154_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001154_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x001154_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x001154_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x001154_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x001154_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
