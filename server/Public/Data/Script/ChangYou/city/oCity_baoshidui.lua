--Éú³¤µã ÖìÈ¸Ê¯
--°ïÕ½¸±±¾
--½Å±¾ºÅ890842
----µÈ¼¶1

--Ã¿´Î´ò¿ª±Ø¶¨»ñµÃµÄ²úÆ·
x890842_g_MainItemId = 30900053
----ÈÎÎñºÅ
--x890842_g_MissionId = 1070

--Éú³Éº¯Êý¿ªÊ¼************************************************************************
--Ã¿¸öItemBoxÖÐ×î¶à10¸öÎïÆ·
x890842_g_scriptId = 890842

function	x890842_OnCreate(sceneId,growPointType,x,y)
	
	
end
--Éú³Éº¯Êý½áÊø**********************************************************************


--´ò¿ªÇ°º¯Êý¿ªÊ¼&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x890842_OnOpen(sceneId,selfId,targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	if growPointType==858 then 
		if CallScriptFunction(890841,"GetBuff",sceneId, selfId) >5725 then
			return OR_OK
		else
			x890842_Tips( sceneId, selfId, "Ngß½i cûng không có phï thúy khoáng thÕch, thïnh ði trß¾c thu th§p!" )
			return OR_U_CANNT_DO_THIS_RIGHT_NOW
		end
	end	
	
	
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,5725) == 1 and  growPointType~=858 then
		return OR_OK
	else
		if CallScriptFunction(890841,"GetBuff",sceneId, selfId) >5725 then
			if growPointType==858 then
				return OR_OK
			else
				x890842_Tips( sceneId, selfId, "Ngß½i ðã thäi có phï thúy khoáng thÕch, thïnh ði v« trß¾c ð¥u nh§p ch§u châu báu lÕi ðªn thu th§p!" )
				return OR_U_CANNT_DO_THIS_RIGHT_NOW
			end
		end
		x890842_Tips( sceneId, selfId, "C¥n thiªt mu¯n biªn thân thþ mö m¾i có th¬ khai thác!" )
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	end
	
end
--´ò¿ªÇ°º¯Êý½áÊø&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--»ØÊÕº¯Êý¿ªÊ¼########################################################################
function	x890842_OnRecycle(sceneId,selfId,targetId)
	return 0
end
--»ØÊÕº¯Êý½áÊø########################################################################



--´ò¿ªºóº¯Êý¿ªÊ¼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x890842_OnProcOver(sceneId,selfId,targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	if growPointType==858 then 
		local itemcont = LuaFnGetAvailableItemCount(sceneId,selfId,x890842_g_MainItemId)
		if itemcont >0 then
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,5725,0)
			LuaFnDelAvailableItem(sceneId,selfId,x890842_g_MainItemId  ,itemcont)
			x890842_Tips( sceneId, selfId, "ngß½i nh§p "..itemcont.." khoáng thÕch châu báu" )
			--local oldnum = LuaFnGetLifeTimeAttrRefix_DefencePhysics( sceneId, targetId )
			--LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, targetId, oldnum+itemcont)
			--LuaFnSetWorldGlobalData(93,LuaFnGetWorldGlobalData(93)+itemcont)
			SetMissionData(sceneId,selfId,MD_GUILDBATTLE_SCORE,GetMissionData(sceneId,selfId,MD_GUILDBATTLE_SCORE)+itemcont)
			return 1
		else
			x890842_Tips( sceneId, selfId, "trên ngß¶i ngß½i không có khoáng thÕch." )
			return 1
		end
	end
	local growPointTypebuff = {
	[855] = 5726,[856] = 5727, [857] = 5728,
	}
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,growPointTypebuff[growPointType],0)
	TryRecieveItem(sceneId,selfId, x890842_g_MainItemId,1)
	return 1
end
--´ò¿ªºóº¯Êý½áÊø@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x890842_OnTickCreateFinish( sceneId, growPointType, tickCount )
	
end

function x890842_Tips( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--RUPDJZVMRU×÷Ê½ÁËÖÐÒÔÎÒ

--R¿ª´úÉÏÁËÒª·¢ÎÒÐ©Õ¹581581
