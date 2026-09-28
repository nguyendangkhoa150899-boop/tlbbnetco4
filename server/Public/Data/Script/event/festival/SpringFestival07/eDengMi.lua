--2007ÔªÏü½Ú»î¶¯....
--µÆÃÕ....

--´ðÌâÈÎÎñ½Å±¾....


--½Å±¾ºÅ
x050043_g_ScriptId = 050043

--»î¶¯Ê±¼ä
x050043_g_StartDayTime = 9039		--»î¶¯¿ªÊ¼Ê±¼ä 2009-02-09
x050043_g_EndDayTime   = 9048		--»î¶¯½áÊøÊ±¼ä 2008-02-18

--´ðÌâ½Å±¾½Å±¾ºÅ
x050043_g_QuizScriptId = 050042

--½±Æ·±í....
x050043_g_GiftTbl = { 30501154, 30501155, 30501156 }

--¾­Ñé±í....
x050043_g_ExpTbl = {

	[10]=380,[11]=460,[12]=548,[13]=643,[14]=745,
	[15]=856,[16]=973,[17]=1099,[18]=1232,[19]=1373,
	[20]=1521,[21]=1677,[22]=1840,[23]=2012,[24]=2190,
	[25]=2377,[26]=2570,[27]=2772,[28]=2981,[29]=3198,
	[30]=3422,[31]=3654,[32]=3894,[33]=4141,[34]=4396,
	[35]=4658,[36]=4928,[37]=5206,[38]=5491,[39]=5784,
	[40]=6084,[41]=6392,[42]=6708,[43]=7031,[44]=7362,
	[45]=7700,[46]=8046,[47]=8400,[48]=8761,[49]=9130,
	[50]=9506,[51]=9890,[52]=10282,[53]=10681,[54]=11088,
	[55]=11503,[56]=11925,[57]=12354,[58]=12792,[59]=13237,
	[60]=13689,[61]=14149,[62]=14617,[63]=15092,[64]=15575,
	[65]=16066,[66]=16564,[67]=17069,[68]=17583,[69]=18104,
	[70]=18632,[71]=19168,[72]=19712,[73]=20264,[74]=20822,
	[75]=21389,[76]=21963,[77]=22545,[78]=23134,[79]=23731,
	[80]=24336,[81]=24948,[82]=25568,[83]=26195,[84]=26830,
	[85]=27473,[86]=28123,[87]=28781,[88]=29447,[89]=30120,
	[90]=30800,[91]=31489,[92]=32184,[93]=32888,[94]=33599,
	[95]=34318,[96]=35044,[97]=35778,[98]=36519,[99]=37268,
	[100]=38025,[101]=38789,[102]=39561,[103]=40341,[104]=41128,
	[105]=41923,[106]=42725,[107]=43535,[108]=44352,[109]=45178,
	[110]=46010,[111]=46851,[112]=47699,[113]=48554,[114]=49417,
	[115]=50288,[116]=51166,[117]=52052,[118]=52946,[119]=53847,
	[120]=54756,

}


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x050043_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾

	BeginEvent( sceneId )

		local npcName = LuaFnGetName( sceneId, targetId )
		if npcName == "Phong hoa tuyªt nguy®t ðång lung" then
			AddText( sceneId, "#{YXDM_20080118_01}" )
		elseif npcName == "LÕc th¥n mçu ð½n ðång lung" then
			AddText( sceneId, "#{YXDM_20080118_02}" )
		elseif npcName == "Khúc vi®n phong hà ðång lung" then
			AddText( sceneId, "#{YXDM_20080118_03}" )
		end

		if 1 == x050043_CheckRightTime() then
			AddNumText(sceneId,x050043_g_ScriptId,"Ta mu¯n ðáp ð¯ ðèn",6,100)
		end
		AddNumText(sceneId,x050043_g_ScriptId,"V« nguyên tiêu ð¯ ðèn ",11,101)

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x050043_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText()
	if NumText == 100 then
		if 1 ~= x050043_CheckRightTime() then
			return
		end
		x050043_ShowQuiz( sceneId, selfId, targetId )
	elseif NumText == 101 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{YXDM_20080118_04}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--ÏÔÊ¾Ï²´ÓÌì½µ´ðÌâ½çÃæ
--**********************************
function x050043_ShowQuiz( sceneId, selfId, targetId )

	--¼ì²âÊÇ·ñ¿ÉÒÔ´ðÌâ....
	local ret, msg = x050043_CheckCanDoQuiz( sceneId, selfId )
	if 0 == ret then
		BeginEvent( sceneId )
			AddText( sceneId, msg )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--´ò¿ªÏ²´ÓÌì½µ´ðÌâ½çÃæ....
	CallScriptFunction( x050043_g_QuizScriptId, "ShowQuizUI",sceneId, selfId, targetId )

end

--**********************************
--¼ì²âÍæ¼Òµ±Ç°ÊÇ·ñ¿ÉÒÔ×ö´ðÌâ
--**********************************
function x050043_CheckCanDoQuiz( sceneId, selfId )

	if 1 ~= x050043_CheckRightTime() then
		return 0, "Trß¾c m¡t ðã qua th¶i gian hoÕt ðµng, cäm tÕ ngài tham dñ hoÕt ðµng ð¯ ðèn"
	end

	local lastDayTime = GetMissionData( sceneId, selfId, MD_SPRING07DENGMI_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		return 0, "#{YXDM_20080118_06}"
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel < 10 then
		return 0, "#{YXDM_20080118_07}"
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		return 0, "#{YXDM_20080118_08}"
	end

	return 1

end

--**********************************
--¼ì²âµ±Ç°ÊÇ·ñÊÇ»î¶¯Ê±¼ä
--**********************************
function x050043_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050043_g_StartDayTime and curDayTime <= x050043_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--Íæ¼Ò´ð¶ÔËùÓÐÌâÄ¿Ê±»Øµ÷´Ëº¯Êý
--**********************************
function x050043_OnPlayerFinishQuiz( sceneId, selfId )

	--°²È«¼ì²â....
	local ret, msg = x050043_CheckCanDoQuiz( sceneId, selfId )
	if 0 == ret then
		return
	end

	--¼ÇÂ¼½ñÌìÒÑ¾­×ö¹ý´ðÌâÈÎÎñÁË....
	local CurDayTime = GetDayTime()
	SetMissionData( sceneId, selfId, MD_SPRING07DENGMI_DAYTIME, CurDayTime )

	--¸ø±äÉíµÀ¾ß....
	local idx = random( getn(x050043_g_GiftTbl) )
	local ItemId = x050043_g_GiftTbl[idx]
	TryRecieveItem( sceneId, selfId, ItemId, QUALITY_MUST_BE_CHANGE )

	--¸ø¾­Ñé....
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	local CurExp = x050043_g_ExpTbl[CurLevel]
	if CurExp and CurExp > 0 then
		CurExp = CurExp * 5
		LuaFnAddExp( sceneId, selfId, CurExp)
	end
	
	--ÈÕÖ¾Í³¼Æ
	local guid = LuaFnObjId2Guid(sceneId, selfId)
	local log = format("sceneId=%d", sceneId)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_DENGMI_END, guid, log)

	return "#{_ITEM"..ItemId.."}"

end
