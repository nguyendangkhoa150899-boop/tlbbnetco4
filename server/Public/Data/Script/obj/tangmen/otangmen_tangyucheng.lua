--¶ëáÒNPC
--ÑîËÄÄï
--ÆÕÍ¨

--½Å±¾ºÅ
x017509_g_ScriptId = 017509

x017509_g_xuanWuDaoId=400918--[tx42913]

--ÃÅÅÉÐÅÏ¢(ÃÅÅÉÃû³Æ£¬SceneID£¬PosX£¬PosY£¬ÃÅÅÉID)
x017509_g_mpInfo		= {}
x017509_g_mpInfo[0]	= { "Tinh Túc", 16,  96, 152, MP_XINGSU }
x017509_g_mpInfo[1]	= { "Tiêu Dao", 14,  67, 145, MP_XIAOYAO }
x017509_g_mpInfo[2]	= { "Thiªu Lâm",  9,  95, 137, MP_SHAOLIN }
x017509_g_mpInfo[3]	= { "Thiên S½n", 17,  95, 120, MP_TIANSHAN }
x017509_g_mpInfo[4]	= { "Thiên Long", 13,  96, 120, MP_DALI }
x017509_g_mpInfo[5]	= { "Nga My", 15,  89, 144, MP_EMEI }
x017509_g_mpInfo[6]	= { "Võ Ðang", 12, 103, 140, MP_WUDANG }
x017509_g_mpInfo[7]	= { "Minh Giáo", 11,  98, 167, MP_MINGJIAO }
x017509_g_mpInfo[8]	= { "Cái Bang", 10,  91, 116, MP_GAIBANG }
x017509_g_mpInfo[9]	= { "Mµ Dung", 435,  27, 136, MP_MODUNG }
x017509_g_mpInfo[10]= { "Ðß¶ng Môn", 495,  125, 65, MP_TANGMEN }

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x017509_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPXL_090113_03}")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x017509_g_ScriptId,"LÕc Dß½ng",9,0)
			AddNumText(sceneId,x017509_g_ScriptId,"Tô Châu",9,1)
			AddNumText( sceneId, x017509_g_ScriptId, "LÕc Dß½ng - CØu Châu thß½ng hµi", 9, 3 )
			AddNumText( sceneId, x017509_g_ScriptId, "Tô Châu - Thiªt Tßþng Ph¯", 9, 4 )
		end
		
		--add by WTT
		if	GetLevel( sceneId, selfId)>=20  then	
			AddNumText( sceneId, x017509_g_ScriptId, "Thúc Hà C± Tr¤n", 9, 6 )
		end

		if	GetLevel( sceneId, selfId)>=75  then	
			AddNumText( sceneId, x017509_g_ScriptId, "#{MPCSLL_80925_01}", 9, 5 )
		end

		AddNumText(sceneId,x017509_g_ScriptId,"ÐÕi Lý",9,2)
		
		--[tx42913]
		   CallScriptFunction( x017509_g_xuanWuDaoId, "OnEnumerate",sceneId, selfId, targetId )
		--[/tx42913]		
		
		AddNumText(sceneId,x017509_g_ScriptId,"Dçn ta t¾i các môn phái khác",9,11)

		-- ÎÒÔõÑù²ÅÄÜÈ¥¶Ø»ÍºÍáÔÉ½
		AddNumText( sceneId, x017509_g_ScriptId, "Ðªn Ðôn Hoàng và Tung S½n?", 11, 2000 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x017509_OnEventRequest( sceneId, selfId, targetId, eventId )

--[tx42913]
	if eventId == x017509_g_xuanWuDaoId then --È¥ÐþÎäµº
		CallScriptFunction( x017509_g_xuanWuDaoId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
--[/tx42913]
------------------------------------------------------------------------------------------
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
  
    if  GetNumText() == 11 then
        
		BeginEvent(sceneId)
		    
		    for i=0, 10 do
				AddNumText( sceneId, x017509_g_ScriptId, "Môn phái - "..x017509_g_mpInfo[i][1], 9, i+12 )
			end			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
		return 
    end
    
    num = GetNumText()

 	if num > 11 then
 		-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ113ºÅBUFF
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1   then
			BeginEvent( sceneId )
				AddText( sceneId, "  Ðang làm Tào v§n ho£c thß½ng nhân thì không th¬ di chuy¬n · ch² tÕi hÕ ðßþc." ) 
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			return
 		end
 	
 	    i = num - 12
		CallScriptFunction( (400900), "TransferFuncFromNpc", sceneId, selfId, x017509_g_mpInfo[i][2], x017509_g_mpInfo[i][3], x017509_g_mpInfo[i][4] )
		return
	end
------------------------------------------------------------------------------------------ 

	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,239,322, 10)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,201,258, 10)
	elseif	GetNumText()==3	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,327,271, 10)
	elseif	GetNumText()==4	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,331,226, 10)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,375,222, 10)
	elseif  GetNumText()==5	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 186,288,136,75)
	end
	
	--add by WTT
	if GetNumText()== 6 then					--ÊøºÓ¹ÅÕò		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x017509_g_ScriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Thúc Hà C± Tr¤n là n½i PK s¨ không b¸ sát khí. Xin chú ý an toàn. Các hÕ có xác nh§n tiªn vào không?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

end

--add by WTT
function x017509_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
