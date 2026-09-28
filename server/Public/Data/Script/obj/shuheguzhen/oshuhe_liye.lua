x001218_g_ScriptId	= 001218

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x001218_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "#cFF0000Mµt con ðß¶ng d¯c xu¯ng  chính là ðªn Phßþng Hoàng C± Thành, Không có ngß¶i biªt ði nhß thª nào theo hß¾ng xu¯ng d¯c , Nhßng vçn nhß cû ch¤t chÑa ðÕi lßþng bäo tàng, Là binh gia vùng giao tranh. Ð°ng th¶i cûng h¤p dçn ph¥n l¾n ÐÕo Mµ T£c, Trong ðó t× Bàn S½n ÐÕo Nhân su¤t lînh ðªn S¶ Kim Giáo Úy lÕi minh møc trß½ng ðäm. Ta có th¬ ðßa ngß½i ði vào. Nhßng sñ sinh tØ cüa ngß½i ta không phø trách.#W[ Ngoài c¤p 80 hãy tiªn vào ]")
		AddNumText(sceneId, x001218_g_ScriptId,"Tiªn vào Phßþng Hoàng C± Thành", 6, 101)
		--AddNumText(sceneId, x001218_g_ScriptId,"Ta biªt r°i, ta có mµt s¯ thÑ thay ð±i · ðây.", 5, 102)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001218_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev>=80 then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 441, 161, 161 )
		end
	elseif GetNumText() == 102  then
		local reply = CostMoney(sceneId,selfId,5000000)
		if reply == -1 then
			x001218_MsgBox( sceneId, selfId, targetId, "    #YTi¬u tØ, ð¬ qua ðây ngß½i c¥n phäi có ðü ti«n m¾i ðßþc nhé!" )
			return	
		end
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 584, 258, 310 )
	end
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x001218_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
