--NPC ÐÕi Lý
--Mµ Dung Tuy«n - Tiªp dçn Mµ Dung Gia
--Script by Sói Ðz
--ID = 960025

x960025_g_ScriptId	= 960025

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960025_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"#{GUSU_MENPAI_55}")
		local MP = GetMenPai(sceneId,selfId)
		if MP == 10 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0 then
			AddText(sceneId,"Ta th¤y các hÕ cûng khôi ngô tu¤n tú, chi b¢ng hãy theo ta v« bái kiªn chß·ng môn gia nh§p Mµ Dung Gia.")
			AddText(sceneId,"Các hÕ ðã t×ng nghe nói ðµc chiêu Ð¦u Chuy¬n Tinh Di cüa bän phái chßa. Còn do dñ gì næa mà không theo ta?")
			--AddNumText(sceneId,x960025_g_ScriptId,"Ðªn Mµ Dung S½n Trang",9,0)
		elseif MP == 10 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddText(sceneId,"Võ công cüa các hÕ tiªn bµ nhanh nhß v§y, hÆn là r¤t ðßþc sß phø quan tâm ðây mà. Bän phái th§t tñ hào khi có mµt nhân tài xu¤t chúng võ ngh®!")
		elseif MP ~= 9 then
			AddText(sceneId,"Hài...#rLâu r°i không g£p các hÕ. Võ công cüa các hÕ tiªn bµ nhanh nhß v§y, giá mà tu luy®n · Mµ Dung có phäi gi¶ này ðã xu¤t chúng r°i không?. Tiªc th§t, tiªc th§t...")
		end
		AddNumText(sceneId,x960025_g_ScriptId,"Tiªn cØ gia nh§p môn phái",9,1)
		AddNumText(sceneId,x960025_g_ScriptId,"#{GUSU_MENPAI_50}",8,2)
		AddNumText(sceneId,x960025_g_ScriptId,"#{GUSU_MENPAI_51}",8,3)
		AddNumText(sceneId,x960025_g_ScriptId,"#{GUSU_MENPAI_52}",8,4)
		AddNumText(sceneId,x960025_g_ScriptId,"#{GUSU_MENPAI_53}",8,5)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960025_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	if key == 0 then
		if IsHaveMission(sceneId,selfId,4021)>0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Trên ngß¶i các hÕ có ngân phiªu, không th¬ truy«n t¯ng ðßþc!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel(sceneId,selfId)<10 then
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ c¥n tu luy®n sau khi ðÕt t¾i c¤p 10 r°i ðªn tìm ta!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900),"TransferFunc",sceneId,selfId,435,91,116)
		end
	elseif key == 1 then
		if GetMenPai(sceneId,selfId) == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ hãy dçn ngß¶i chï ð¸nh ðªn Mµ Dung S½n Trang ch² ngß¶i bái sß môn phái - Mµ Dung Ki®t#H[48,144]#W, ch÷n chÑc nång #GGia nh§p môn phái#W là có th¬ gia nh§p môn phái r°i. S¨ có ph¥n thß·ng h¤p dçn ðó!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Chï có ð® tØ bän phái m¾i có th¬ tiªn cØ gia nh§p môn phái này.")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif key == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{GUSU_MENPAI_46}")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{GUSU_MENPAI_47}")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{GUSU_MENPAI_48}")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{GUSU_MENPAI_49}")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end