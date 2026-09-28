--Ø¤°ïNPC
--ÕÅÈ«Ïé
--ÆÕÍ¨

x010008_g_scriptId = 010008

x010008_g_xuanWuDaoId=400918 --[tx42913]

--ÃÅÅÉÐÅÏ¢(ÃÅÅÉÃû³Æ£¬SceneID£¬PosX£¬PosY£¬ÃÅÅÉID)
x010008_g_mpInfo		= {}
x010008_g_mpInfo[0]	= { "Tinh Túc", 16,  96, 152, MP_XINGSU }
x010008_g_mpInfo[1]	= { "Tiêu Dao", 14,  67, 145, MP_XIAOYAO }
x010008_g_mpInfo[2]	= { "Thiªu Lâm",  9,  95, 137, MP_SHAOLIN }
x010008_g_mpInfo[3]	= { "Thiên S½n", 17,  95, 120, MP_TIANSHAN }
x010008_g_mpInfo[4]	= { "Thiên Long", 13,  96, 120, MP_DALI }
x010008_g_mpInfo[5]	= { "Nga My", 15,  89, 144, MP_EMEI }
x010008_g_mpInfo[6]	= { "Võ Ðang", 12, 103, 140, MP_WUDANG }
x010008_g_mpInfo[7]	= { "Minh Giáo", 11,  98, 167, MP_MINGJIAO }
x010008_g_mpInfo[8]	= { "Cái Bang", 10,  91, 116, MP_GAIBANG }
x010008_g_mpInfo[9]	= { "Mµ Dung", 435,  27, 136, MP_MODUNG }
--x010008_g_mpInfo[10]= { "Ðß¶ng Môn", 495,  125, 65, MP_TANGMEN }


--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x010008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPXL_090113_06}")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x010008_g_scriptId,"LÕc Dß½ng",9,0)
			AddNumText(sceneId,x010008_g_scriptId,"Tô Châu",9,1)
			AddNumText( sceneId, x010008_g_scriptId, "LÕc Dß½ng - CØu Châu thß½ng hµi", 9, 3 )
			AddNumText( sceneId, x010008_g_scriptId, "Tô Châu - Thiªt Tß¶ng Ph¯", 9, 4 )
		end
		
		--add by WTT
		if	GetLevel( sceneId, selfId)>=20  then	
			AddNumText( sceneId, x010008_g_scriptId, "Thúc hà C± Tr¤n", 9, 6 )
		end
		
		if	GetLevel( sceneId, selfId)>=75  then	
			AddNumText( sceneId, x010008_g_scriptId, "#{MPCSLL_80925_01}", 9, 5 )
		end
		AddNumText(sceneId,x010008_g_scriptId,"ÐÕi Lý",9,2)
		
		--[tx42913]
		CallScriptFunction( x010008_g_xuanWuDaoId, "OnEnumerate",sceneId, selfId, targetId )
		--[/tx42913]		
		
		AddNumText(sceneId,x010008_g_scriptId,"Ðªn ta ðªn nhæng môn phái khác",9,11)

		-- ÎÒÔõÑù²ÅÄÜÈ¥¶Ø»ÍºÍáÔÉ½
		AddNumText( sceneId, x010008_g_scriptId, "Ðªn Ðôn Hoàng và Tung S½n?", 11, 2000 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x010008_OnEventRequest( sceneId, selfId, targetId, eventId )

------------------------------------------------------------------------------------------
--[tx42913]
	if eventId == x010008_g_xuanWuDaoId then --È¥ÐþÎäµº
		CallScriptFunction( x010008_g_xuanWuDaoId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
--[/tx42913]
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
  
    if  GetNumText() == 11 then
        
		BeginEvent(sceneId)
		    
		    for i=0, 9 do
				AddNumText( sceneId, x010008_g_scriptId, "Môn phái - "..x010008_g_mpInfo[i][1], 9, i+12 )
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
		CallScriptFunction( (400900), "TransferFuncFromNpc", sceneId, selfId, x010008_g_mpInfo[i][2], x010008_g_mpInfo[i][3], x010008_g_mpInfo[i][4] )
		return
	end
------------------------------------------------------------------------------------------ 

	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,136,182, 10)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,112,161, 10)
	elseif	GetNumText()==3	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,230,132, 10)
	elseif	GetNumText()==4	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,234,130, 10)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2, 254,122, 10)
	elseif  GetNumText()==5	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 186,288,136,75)
	end
	
	--add by WTT
	if GetNumText()== 6 then					--ÊøºÓ¹ÅÕò		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x010008_g_scriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Thúc Hà C± Tr¤n là n½i PK s¨ không b¸ sát khí. Xin chú ý an toàn. Các hÕ có xác nh§n tiªn vào không?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

end

--add by WTT
function x010008_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
