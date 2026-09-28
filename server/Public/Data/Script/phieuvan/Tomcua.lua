--SÑ giä may m¡n
--Author: hong2gvn
--date:04/08/2010

x888906_g_scriptId = 888906

function x888906_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#H[ #ccc33ccTrang chü #G: NetCo4.com #H]")
	    AddText(sceneId,"#H[ #ccc33ccFanpage   #G: FB.com/tanthanlong#H]")
	    AddText(sceneId,"  #GChào M×ng Các HÕ Ðªn #YCasino NetCo4!?")
	    AddText(sceneId,"  #GTrông ngß½i thª kia là lÕi mu¯n ðánh bÕc r°i.   #r  Chúc Các HÕ May M¡n?")
	   -- AddNumText( sceneId, x888906_g_ScriptId, "Ta mu¯n ch½i Tài Xïu", 5, 500)
	    AddNumText( sceneId, x888906_g_ScriptId, "Ta mu¯n ch½i Tôm Cua Cá", 6, 510)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x888906_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
--******************************ChÇn Lë********************************
	if key  == 500 then
		BeginEvent(sceneId)
		AddText(sceneId,"Khi tham gia trò ch½i, ngß½i s¨ phäi ð£t cßþc 1500 Vàng, nªu th¡ng s¨ nh§n ðßþc 2000 Vàng. TÖ l® th¡ng thua là 50:50. Ngß½i mu¯n ð£t Tài hay Xïu? #W#r#H Kªt quä là #W#cFF0000Ramdom #W#Ht× máy chü không có sñ s¡p xªp Chúc BÕn May M¡n")
		AddNumText(sceneId, x888906_g_ScriptId, "Ta mu¯n ð£t Tài.", 7, 501 )
		AddNumText(sceneId, x888906_g_ScriptId, "Ta mu¯n ð£t Xïu.", 7, 502 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	if key == 501 then
		local layvang = CostMoney(sceneId,selfId,15000000)
		if layvang == -1 then
			x888906_NotifyFailBox( sceneId, selfId, targetId, "  Xin thÑ l²i, trong ngß¶i ðÕi hi®p không ðü 1500 Vàng" )
			return
		else
			local chanle = random( 1,10 )
			if chanle > 1 then
				x888906_NotifyFailBox( sceneId, selfId, targetId, "  #R Xïu#W Th§t ðáng tiªc, ÐÕi hi®p ðã thua và m¤t 1500 Vàng" )
			else	
				x888906_NotifyFailBox( sceneId, selfId, targetId, " #R Tài#W Xin chúc m×ng, ÐÕi hi®p ðã th¡ng và nh§n ðßþc 2000 Vàng" )
				AddMoney( sceneId, selfId, 20000000 )
			end
		end
	end
	if key == 502 then
		local layvang = CostMoney(sceneId,selfId,15000000)
		if layvang == -1 then
			x888906_NotifyFailBox( sceneId, selfId, targetId, "  Xin thÑ l²i, trong ngß¶i ðÕi hi®p không ðü 1500 Vàng" )
			return
		else
			local chanle = random( 1,10 )
			if chanle == 1 then
				x888906_NotifyFailBox( sceneId, selfId, targetId, " #R Xïu#W Xin chúc m×ng, ÐÕi hi®p ðã th¡ng và nh§n ðßþc 2000 Vàng" )
				AddMoney( sceneId, selfId, 20000000 )			
			else
				x888906_NotifyFailBox( sceneId, selfId, targetId, "  #R Tài#W Th§t ðáng tiªc, ÐÕi hi®p ðã thua và m¤t 1500 Vàng" )
			end
		end
	end
--****************************Tôm Cua Cá***************************************
	if key  == 510 then
		BeginEvent(sceneId)
		AddText(sceneId,"Khi tham gia trò ch½i, ngß½i s¨ phäi #Yð£t cßþc #G1000 ÐMP#W, tÖ l® th¡ng thua là 1:6, nªu th¡ng s¨ #Ynh§n dc #G6000 ÐMP#W. Ngß½i mu¯n ð£t gì nào ?#r#W#YKªt Quä Là #cFF0000Ramdom #W#Ht× máy chü không có sñ s¡p xªp Chúc BÕn May M¡n?")
		--AddText(sceneId,"")
		AddNumText(sceneId, x181003_g_scriptId, "Ta mu¯n ð£t Tôm.", 6, 1 )
		AddNumText(sceneId, x181003_g_scriptId, "Ta mu¯n ð£t Cua.", 6, 2 )
		AddNumText(sceneId, x181003_g_scriptId, "Ta mu¯n ð£t Gà.", 6, 3 )
		AddNumText(sceneId, x181003_g_scriptId, "Ta mu¯n ð£t Cá.", 6, 4 )
		AddNumText(sceneId, x181003_g_scriptId, "Ta mu¯n ð£t Hß½u.", 6, 5 )
		AddNumText(sceneId, x181003_g_scriptId, "Ta mu¯n ð£t H° Lô.", 6, 6 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	if key == 1 or key == 2 or key == 3 or key == 4 or key == 5 or key == 6 then
		local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		local layvang = SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint-1000 )	
		--local layvang = CostMoney(sceneId,selfId,10000000)
		if menpaiPoint < 1000 then
		--if layvang == -1 then
			x888906_NotifyFailBox( sceneId, selfId, targetId, "  Xin thÑ l²i, trong ngß¶i ðÕi hi®p không ðü 1000 DMP" )
			return
		else
			local tomcuaca = random(6)
			if key == tomcuaca then
				local playername = GetName(sceneId, selfId)
				local strText = format("#cFF0000 "..playername.."#H V×a Th¡ng 6000 ði¬m môn phái tÕi #W#YCasino NetCo4! #W#G Game Tôm Cua Cá", playername)  
                BroadMsgByChatPipe(sceneId, selfId, strText, 4)				
				x888906_NotifyFailBox( sceneId, selfId, targetId, " #GXin chúc m×ng, ÐÕi hi®p ðã th¡ng và nh§n ðßþc 6000 DMP #31" )
					local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
					SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint+6000 )		
			else
				x888906_NotifyFailBox( sceneId, selfId, targetId, " Th§t ðáng tiªc, ÐÕi hi®p ðã thua và m¤t 1000 ÐMP" )
			end
		end
	end
end
--**********************************
function x888906_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
function x888906_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end