--QuÖ C¯c NPC
--QuÖ C¯c 
--Bình thß¶ng 

x760313_g_scriptId = 760313

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760313_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"Vân Mµng S½n R×ng cây Dày ð£c ,Ð¸a thª Hi¬m yªu ,Nhi«u có S½n phï Cß¶ng ðÕo Ch£n ðß¶ng Ðánh cß¾p ,Ngã QuÖ C¯c Tuy có Tr§n pháp Bäo hµ ,Ðãn Giá Løc lâm Ð° b§y bÕ Nhi«u l¥n Lai PhÕm ,Cûng là ¿u phi«n B¤t kham .Không biªt Các hÕ là Phü Nguy®n Trþ Ta ch¶ Giúp mµt tay ,Tß½ng Tham Ngã S½n môn Chi B÷n ðÕo chích Mµt lß¾i b¡t hªt ?")
		AddNumText(sceneId,x760313_g_scriptId,"Kích th¯i S½n phï",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760313_OnEventRequest(sceneId, selfId, targetId, eventId)
	if	GetNumText()==0	then
		if	GetLevel(sceneId, selfId)<90 then	
			BeginEvent(sceneId)
			local strText ="Nªu mu¯n Kích th¯i S½n phï ,Nhu Ð¡c Cø b¸ Nh¤t ð¸nh Bän lînh ,Thiªu hi®p Ngß½i Chßa ÐÕt t¾i #G90C¤p #W,Vçn là trß¾c KhÑ N½i khác Rèn luy®n Mµt phen LÕi ðªn Ba ."
			AddText(sceneId, strText)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 200,100,165)
		end
	end
end
