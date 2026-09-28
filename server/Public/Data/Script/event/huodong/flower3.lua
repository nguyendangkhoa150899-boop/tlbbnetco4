--Ð«×ÓÖÖ»¨½Å±¾  ³àÉ°¤ÎÐ« QQ-718805400
--»¨Ãç£¨Î´³ÉÊì£©
--Çë×ðÖØÔ­´´£¬×ªÔØÇë×¢Ã÷³ö´¦£¬Ð»Ð»~

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x335703_OnDefaultEvent( sceneId, selfId,targetId )

	local xiezi = GetMonsterDataID(sceneId, targetId)
	local bb = 5
        if xiezi == 90 then
           bb = 3
        elseif xiezi == 91 then
           bb = 2
        elseif xiezi == 92 then
           bb = 1
 	end
    
	    BeginEvent( sceneId )
		  AddText( sceneId, "    #W Ta là mµt cây con mau l¾n, có c¥n thi bón phân #G"..bb.." l¥n næa #W , ta li«n l¾n lên nhanh ~#r        ta chï có th¬ s¯ng sót 30 phút, xin hãy bón phân nha 3" )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )

end
