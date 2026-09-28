
x402314_g_scriptId = 402314
--½Å±¾ºÅ--Ğ«×Ó×îĞÂ¸Ä½ø£¬Ôö¼ÓÈ«³¡¾°¼ì²â£¬Ôö¼Ó00×ø±ê¸½½ü¼ì²â£¬QQ-718805400
--**********************************
-- OnTime
--**********************************
function x402314_JianCeSceneTimer(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x402314_DoAutoGetExpLogic( sceneId, nHumanId )
	end

end

--**********************************
-- ¹Ò»ú¼Ó¾­ÑéÂß¼­
--**********************************
function x402314_DoAutoGetExpLogic( sceneId, selfId )

        local mynam = GetName(sceneId, selfId )
	local level = GetLevel( sceneId, selfId )

	if level>=120 then
	   BeginEvent(sceneId)
	        AddText(sceneId,"cha chä cha chä, ngß½i dám sØ dûng thë ğÆng c¤p sao! Hô biªn")
	   EndEvent( sceneId )
	   DispatchEventList(sceneId,selfId) 
	end

   --**************
        --Ğ«×ÓÔ­´´ĞŞ¸Ä£¬²»Ö»ÊÇ¼ì²â0×ø±ê£¬¶øÊÇ0×ø±ê¸½½üÒ²»áÊÜµ½¼ì²â¡£±È½ÏÍêÃÀ¡£×ªÔØÇë×¢Ã÷³ö´¦£¬ÕâÊÇ¶Ô×÷Õß×îÆğÂëµÄ×ğÖØ£¡
	treasureX = 0
	treasureZ = 0

	--È¡µÃÍæ¼Òµ±Ç°×ø±ê£¬Ğ«×Ó
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	
	--È¡µÃ¼ì²â×ø±êÓëÍæ¼Ò¾àÀë£¬Ğ«×Ó--ÔİÊ±²»ÒªÊ¹ÓÃ´Ë·½·¨
	--Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))

	--if Distance <= 5 then
	if PlayerX ==0 or PlayerZ==0 or PlayerX ==1 or PlayerZ==1 then 

		local strText = format("#cFF0000Í¨¸æ£º#BÍæ¼Ò#G"..mynam.."#BÒòÊ¹ÓÃ·Ç·¨¹¤¾ß¿¨¶«Î÷ÒÑ±»ÏµÍ³ÓÀ¾Ã·â½ÇÉ«£¬Çë´ó¼Ò½¡¿µÓÎÏ·£¬²»Òª¶¯ÍáÄÔ½î£¬Ò»¾­·¢ÏÖ£¬ÓÀ¾Ã·âºÅ¡¢·âip¡£")
                BroadMsgByChatPipe(sceneId, selfId, strText, 4);
		NewWorld(sceneId,selfId,77,17,56)--µØ¸®Õâ¸ö×ø±ê½øÈ¥³ö²»À´
	        --SetLevel( sceneId, selfId, 0)--¼õÎª0¼¶

		BeginEvent(sceneId)		
		AddText(sceneId,"    ÄúÓÉÓÚ¿¨#G0×ø±êÒÑ#W±»ÏµÍ³¼ì²âµ½£¬ÒÑ¾­¶ÔÄú½øĞĞ·âºÅ´¦Àí£¬´ËÕËºÅÍË³öºó½«²»¿ÉÔÙµÇÂ¼¡£ÇëÎğÊ¹ÓÃÍâ¹Ò£¬ÎÄÃ÷ÓÎÏ·£¬´´Ôì½¡¿µµÄÓÎÏ·»·¾³¡£")	
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )   
	end


   --**************
	local nam = LuaFnGetName( sceneId, selfId)
	res = strfind(nam, "#") 
	ret = strfind(nam, "")        
	--res_H = strfind(nam, "H42510078H")

	if res ~=nil or ret ~= nil then 
		--if res_H ~=nil then	
		   --return
		--else
		        --local strText = format("#cFF0000Í¨¸æ£º#BÍæ¼Ò#G"..mynam.."#BÒòÊ¹ÓÃ·Ç·¨¹¤¾ß¿¨¶«Î÷ÒÑ±»ÏµÍ³ÓÀ¾Ã·â½ÇÉ«£¬Çë´ó¼Ò½¡¿µÓÎÏ·£¬²»Òª¶¯ÍáÄÔ½î£¬Ò»¾­·¢ÏÖ£¬ÓÀ¾Ã·âºÅ¡¢·âip¡£")
				local strText = format("#cFF0000 Do các hÕ ğ£t tên có kı tñ ô vuông ho£c sØ døng d¸ch sai t÷a ğµ nên b¸ r½i ğ¸a ngøc A TÏ #G"..mynam.."#B xin hãy thoát ra sØa l²i k©t map nhé #3")
                        BroadMsgByChatPipe(sceneId, selfId, strText, 4);
                        NewWorld(sceneId,selfId,77,17,56)--µØ¸®Õâ¸ö×ø±ê½øÈ¥³ö²»À´
	                --SetLevel( sceneId, selfId, 0)--¼õÎª0¼¶	

			BeginEvent(sceneId)		
			--AddText(sceneId,"    ÄúÓÉÓÚÊ¹ÓÃÍâ¹Ò¿¨#G²ÊÃû#WÒÑ±»ÏµÍ³¼ì²âµ½£¬ÒÑ¾­¶ÔÄú½øĞĞ·âºÅ´¦Àí£¬´ËÕËºÅÍË³öºó½«²»¿ÉÔÙµÇÂ¼¡£ÇëÎğÊ¹ÓÃÍâ¹Ò£¬ÎÄÃ÷ÓÎÏ·£¬´´Ôì½¡¿µµÄÓÎÏ·»·¾³¡£")
		AddText(sceneId,"    Các hÕ vui lòng không sØ døng kı tñ ô vuông vào tên nhân v§t, nªu không s¨ b¸ r½i vào ğ¸a phü!")			
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, -1 )          	
		--end
	end
end

--**********************************
--ÏûÏ¢ÌáÊ¾
--**********************************
function x402314_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¼¼ÄÜ¼ì²â
--**********************************
function x402314_SkillCheck(sceneId,selfId)

     --¼ì²âÊÇ·ñÓĞ¸½Ìå¼¼ÄÜ
     if HaveSkill(sceneId,selfId,238) < 1 then
        AddSkill(sceneId,selfId,238)
     end

     --¼ì²âÊÇ²»ÊÇÄ½Èİ
     if GetMenPai(sceneId,selfId) == 10 then
        for i = 906,916 do
              if HaveSkill( sceneId, selfId, i ) < 1 then
                 AddSkill(sceneId, selfId, i)
              end
        end
     end
end
