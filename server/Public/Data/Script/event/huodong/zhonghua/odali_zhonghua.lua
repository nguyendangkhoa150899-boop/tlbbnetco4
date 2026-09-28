--2014.7.15  ‘∆»∏±‡÷∆ 
--—∞ŒÔ»ŒŒÒ
--A L˝“™ƒ„∏¯À˚’“µΩ5 c·i Ho‡n H‰o Huy´n Ty
--MisDescBegin
--Ω≈±æ∫≈
x002091_g_ScriptId = 002091
rwbz=0
x002091_g_Position_X=306
x002091_g_Position_Z=157
x002091_g_SceneID=2
x002091_g_AccomplishNPC_Name="A L˝"

--»ŒŒÒ∫≈
x002091_g_MissionId = 1450

--ƒø±ÍNPC
x002091_g_Name	="A L˝"

--»ŒŒÒµ¿æﬂ±‡∫≈
x002091_g_ItemId = 40001114

--»ŒŒÒµ¿æﬂ–Ë«Û ˝¡ø
x002091_g_ItemNeedNum = 5
--µ√µΩµƒŒÔ∆∑√˚
x002091_g_ItemName = "#YHo‡n H‰o Huy´n Ty"
--»ŒŒÒπÈ¿‡
x002091_g_MissionKind = 5

--»ŒŒÒµ»º∂
x002091_g_MissionLevel = 10000

-- «∑Ò «æ´”¢»ŒŒÒ
x002091_g_IfMissionElite = 0

--œ¬√Êº∏œÓ «∂ØÃ¨œ‘ æµƒƒ⁄»›£¨”√”⁄‘⁄»ŒŒÒ¡–±Ì÷–∂ØÃ¨œ‘ æ»ŒŒÒ«Èøˆ**********************

--“‘…œ «∂ØÃ¨**************************************************************

--»ŒŒÒ–Ë“™µ√µΩµƒŒÔ∆∑
x002091_g_DemandItem={{id=40001114,num=5}}	
x002091_g_IsMissionOkFail = 1		--±‰¡øµƒµ⁄0Œª

--»ŒŒÒ√˚
x002091_g_MissionName="Ho‡n H‰o Huy´n Ty"
x002091_g_MissionInfo_1="  #R"
x002091_g_MissionInfo_2="#{event_dali_0050}"
x002091_g_MissionTarget="#{event_dali_0051}"
x002091_g_MissionTarget="#{event_dali_0052}"
x002091_g_MissionContinue="NgﬂΩi l§y c 5 c·i #YHo‡n H‰o Huy´n Ty#W sao?"
x002091_g_MissionComplete=" Kh· l°m , ngﬂΩi r§t cÛ kh‰ nÂng , ta s® k™t n’p v‡o hµi FA"
x002091_g_MoneyBonus=100000
x002091_g_jbjl_1=30505260
x002091_g_jbjl_2=30505261
x002091_g_SignPost = {x = 306, z = 157, tip = "A L˝"}
x002091_g_RadioItemBonus={{id=30505260 ,num=2},{id=30505261,num=5},{id=20310175,num=1},{id=38000187,num=1},{id=38000188,num=1},{id=20310113,num=1}}

--MisDescEnd
--**********************************
--»ŒŒÒ»Îø⁄∫Ø ˝
--**********************************
function x002091_OnDefaultEvent( sceneId, selfId, targetId )
  if IsHaveMission(sceneId,selfId,x002117_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002106_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002107_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002108_g_MissionId) > 0 or IsHaveMission(sceneId,selfId,x002109_g_MissionId) > 0  then
       rwbz=1	 
	BeginEvent(sceneId)
				AddText(sceneId,"    #YNgﬂΩi „ nhßn nhiÆm v¯ , vui lÚng ho‡n th‡nh trﬂæc „")
			EndEvent( )
			DispatchEventList( sceneId, selfId, targetId )
			DispatchMissionTips(sceneId,selfId)
			elseif IsMissionHaveDone(sceneId,selfId,x002091_g_MissionId) < 0 then
		return
    --»Áπ˚“—Ω”¥À»ŒŒÒ
	elseif IsHaveMission(sceneId,selfId,x002091_g_MissionId) > 0 then
			--∑¢ÀÕ»ŒŒÒ–Ë«Ûµƒ–≈œ¢
			BeginEvent(sceneId)
			AddText(sceneId,x002091_g_MissionName)
			AddText(sceneId,x002091_g_MissionContinue)
			for i, item in x002091_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x002091_g_MoneyBonus )
			EndEvent( )
			bDone = x002091_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x002091_g_ScriptId,x002091_g_MissionId,bDone)
		--¬˙◊„»ŒŒÒΩ” ’Ãıº˛
	elseif x002091_CheckAccept(sceneId,selfId) > 0 then
			--∑¢ÀÕ»ŒŒÒΩ” ‹ ±œ‘ æµƒ–≈œ¢
				local  PlayerName=GetName(sceneId,selfId)	
	            local  PlayerSex=GetSex(sceneId,selfId)
	            if PlayerSex == 0 then
		            PlayerSex = "π√ƒÔ"
	            else
		            PlayerSex = "…Ÿœ¿"
	            end
			BeginEvent(sceneId)
				AddText(sceneId,x002091_g_MissionName)
				AddText(sceneId,x002091_g_MissionInfo_1..PlayerName..PlayerSex..x002091_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,"#GL¿m sao ¨ ki™m #R5 c·i #YHo‡n H‰o Huy´n Ty")
				AddText(sceneId,"    #YHo‡n H‰o Huy´n Ty#G l‡ ch™ t·c m€ nghÆ ta ang thi™u 5 c·i Vui lÚng tÏm cho ta")
				AddText(sceneId,"    #YHo‡n H‰o Huy´n Ty#G CÛ th¨ ™n Ki™m C·c (53,222) ¨ thu thßp #Y Ki™m ¸ 5 c·i s® ho‡n th‡nh nhiÆm v¯ v‡ tr˜ng thﬂ∑ng")
				AddText(sceneId,x002091_g_MissionTarget)
				for i, item in x002091_g_RadioItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x002091_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x002091_g_ScriptId,x002091_g_MissionId)
			
		end
end

--**********************************
--¡–æŸ ¬º˛
--**********************************
function x002091_OnEnumerate( sceneId, selfId, targetId )
 
    --»Áπ˚“—Ω”¥À»ŒŒÒ
	if IsHaveMission(sceneId,selfId,x002091_g_MissionId) > 0 then
		AddNumText(sceneId,x002091_g_ScriptId,x002091_g_MissionName,2,-1);
	--¬˙◊„»ŒŒÒΩ” ’Ãıº˛
	elseif x002091_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x002091_g_ScriptId,x002091_g_MissionName,1,-1);
	end

end

--**********************************
--ºÏ≤‚Ω” ‹Ãıº˛
--**********************************
function x002091_CheckAccept( sceneId, selfId )
	--–Ë“™20º∂≤≈ƒ‹Ω”
	if GetLevel( sceneId, selfId ) >= 20 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ω” ‹
--**********************************
function x002091_OnAccept( sceneId, selfId )

	--º”»Î»ŒŒÒµΩÕÊº“¡–±Ì
	AddMission( sceneId,selfId, x002091_g_MissionId, x002091_g_ScriptId, 1, 0, 1 )
	Msg2Player(  sceneId, selfId,"#YTi™p nh’n nhiÆm v¯ :Ho‡n H‰o Huy´n Ty",MSG2PLAYER_PARA )
	--AddItemListToHuman(sceneId, selfId)	
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, sceneId, x002091_g_SignPost.x, x002091_g_SignPost.z, x002091_g_SignPost.tip )

end

--**********************************
--∑≈∆˙
--**********************************
function x002091_OnAbandon( sceneId, selfId )
	--…æ≥˝ÕÊº“»ŒŒÒ¡–±Ì÷–∂‘”¶µƒ»ŒŒÒ
    DelMission( sceneId, selfId, x002091_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x002091_g_SignPost.tip )
end

--**********************************
--ºÃ–¯
--**********************************
function x002091_OnContinue( sceneId, selfId, targetId )
	--Ã·Ωª»ŒŒÒ ±µƒÀµ√˜–≈œ¢
    BeginEvent(sceneId)
		AddText(sceneId,x002091_g_MissionName)
		AddText(sceneId,x002091_g_MissionComplete)
		AddMoneyBonus( sceneId, x002091_g_MoneyBonus )
		for i, item in x002091_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x002091_g_ScriptId,x002091_g_MissionId)
end

--**********************************
--ºÏ≤‚ «∑Òø…“‘Ã·Ωª
--**********************************
function x002091_CheckSubmit( sceneId, selfId )

	for i, item in x002091_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--Ã·Ωª
--**********************************
function x002091_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x002091_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x002091_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		local DelRet = 1
		for i, item in x002091_g_DemandItem do
		
			if LuaFnDelAvailableItem( sceneId, selfId, item.id, item.num ) < 1 then
				DelRet = 0
			end
		end
		if DelRet == 0  then 
			Msg2Player(  sceneId, selfId,"#YKh§u tr◊ nhiÆm v¯ th§t b’i",MSG2PLAYER_PARA )
			BeginEvent(sceneId)
				strText = "Kh§u tr◊ NV th§t b’i"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		
		if ret > 0 then
			AddMoney(sceneId,selfId,x002091_g_MoneyBonus );
			local playerLevel = GetLevel(sceneId, selfId)
			if playerLevel>=20 and playerLevel<30 then
			LuaFnAddExp(sceneId, selfId,20000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 20000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,50000 )     --∂ÓÕ‚Ω«ÆΩ±¿¯5Ω
			elseif
			playerLevel>=30 and playerLevel<40 then
			LuaFnAddExp(sceneId, selfId,60000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 60000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,60000 )
			elseif
			playerLevel>=30 and playerLevel<40 then
			LuaFnAddExp(sceneId, selfId,100000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 100000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,70000 )
			elseif
			playerLevel>=40 and playerLevel<50 then
			LuaFnAddExp(sceneId, selfId,120000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 120000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,80000 )
			elseif
			playerLevel>=50 and playerLevel<60 then
			LuaFnAddExp(sceneId, selfId,140000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 140000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,90000 )
			elseif
			playerLevel>=60 and playerLevel<70 then
			LuaFnAddExp(sceneId, selfId,150000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 150000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,80000 )
			elseif
			playerLevel>=70 and playerLevel<80 then
			LuaFnAddExp(sceneId, selfId,160000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 160000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,90000 )
			elseif
			playerLevel>=80 and playerLevel<90 then
			LuaFnAddExp(sceneId, selfId,170000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 170000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,100000 )
			elseif
			playerLevel>=90 and playerLevel<100 then
			LuaFnAddExp(sceneId, selfId,200000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 200000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,120000 )
			elseif
			playerLevel>=100 and playerLevel<120 then
			LuaFnAddExp(sceneId, selfId,240000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 240000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,140000 )
			elseif
			playerLevel>=120  then
			LuaFnAddExp(sceneId, selfId,300000) --ª˘±ææ≠—ÈΩ±¿¯12ÕÚ
			AddExp( sceneId, selfId, 300000)    --∂ÓÕ‚æ≠—ÈΩ±¿¯12ÕÚ
		    AddMoney(sceneId,selfId,180000 )
			end
			AddItem( sceneId,x002091_g_jbjl_1, 1 )
			AddItem( sceneId,x002091_g_jbjl_2, 5 )
			ret = DelMission( sceneId, selfId, x002091_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x002091_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#YHo‡n H‰o Huy´n Ty#G NhiÆm v¯ ho‡n th‡nh",MSG2PLAYER_PARA )
			end
		else
			--»ŒŒÒΩ±¿¯√ª”–º”≥…π¶
			BeginEvent(sceneId)
				strText = "Tay n‰i •y ko cÛ c·ch n‡o ho‡n th‡nh nhiÆm v¯"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--…±À¿π÷ŒÔªÚÕÊº“
--**********************************
function x002091_OnKillObject( sceneId, selfId, objdataId,objId )
-- »Áπ˚ÕÊº“…±À¿“ª∏ˆ–˛Àø◊ﬂÀΩ»À£¨ø…“‘ªÒµ√“ª∏ˆµ¿æﬂ°∞Ho‡n H‰o Huy´n Ty°±
	local monsterName = GetMonsterNamebyDataId(objdataId)
	BeginEvent(sceneId)
	   strText = "…±À¿“ª∏ˆ"..monsterName
	   AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	if monsterName == "–˛Àø◊ﬂÀΩ»À"   then
		--»°µ√’‚∏ˆπ÷ŒÔÀ¿∫Û”µ”–∑÷≈‰»®µƒ»À ˝
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--»°µ√”µ”–∑÷≈‰»®µƒ»ÀµƒobjId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ø¥’‚∏ˆ»À «≤ª «”–’‚∏ˆ»ŒŒÒ
			if IsHaveMission(sceneId, humanObjId, x002091_g_MissionId) > 0 then
				-- œ»≈–∂œ «≤ª «“—æ≠¬˙◊„¡ÀÕÍ≥…±Í÷æ
				local nMisIndex = GetMissionIndexByID(sceneId,humanObjId,x002091_g_MissionId)
				
				-- ºÏ≤‚ÕÊº“…Ì…œ «≤ª «”–’‚∏ˆŒÔ∆∑¡À£¨”–¡ÀæÕ≤ª‘ŸµÙ¡À
				if GetMissionParam(sceneId, humanObjId, nMisIndex, 0) == 0  and
						GetItemCount(sceneId, humanObjId, 40001114) < 5 then
					AddMonsterDropItem(sceneId,objId,humanObjId, 40001114)
				end
			end
		end
	end
end


--**********************************
--Ω¯»Î«¯”Ú ¬º˛
--**********************************
function x002091_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µ¿æﬂ∏ƒ±‰
--**********************************
function x002091_OnItemChanged( sceneId, selfId, itemdataId )
	
	local SL= GetItemCount( sceneId, selfId, x002091_g_ItemId )
            BeginEvent(sceneId)
		strText = "–„ ki™m c  "..SL.."  c·i"..x002091_g_ItemName
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	if itemdataId == 40001114 and  SL>=5  then
            BeginEvent(sceneId)
		strText = "TÏm ki™m "..x002091_g_ItemName.." NhiÆm v¯ ho‡n th‡nh "..x002091_g_ItemName.."  "
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId) 
		local misIndex = GetMissionIndexByID(sceneId,selfId,x002091_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	end
end
