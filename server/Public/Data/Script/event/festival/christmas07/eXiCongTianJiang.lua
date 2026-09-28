--2007Ê¥µ®Ôªµ©»î¶¯....
--ÐÂÊÖ³é½±_Ï²´ÓÌì½µ»î¶¯....

--´ðÌâÈÎÎñ ¶Ò»»½±È¯½Å±¾....


--½Å±¾ºÅ
x050022_g_ScriptId = 050022

--»î¶¯Ê±¼ä
x050022_g_StartDayTime = 2008080610		--»î¶¯¿ªÊ¼Ê±¼ä 2007-12-24
x050022_g_EndDayTime =2008081309			--»î¶¯½áÊøÊ±¼ä 2008-1-7

--´ðÌâ½Å±¾½Å±¾ºÅ
x050022_g_QuizScriptId = 050021

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x050022_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	local NumText = GetNumText()

	if NumText == 801 then

		--ÏÔÊ¾ÐÂÊÖ´ðÌâ½çÃæ....
		x050022_ShowQuiz( sceneId, selfId, targetId )

	elseif NumText == 802 then

		BeginEvent( sceneId )
			AddText( sceneId, "  Các hÕ xác ð¸nh bây gi¶ sØ døng thß·ng khoán tiªn hành trao ð±i sao? " )
			AddNumText(sceneId,x050022_g_ScriptId,"Xác nh§n",8,803)
			AddNumText(sceneId,x050022_g_ScriptId,"Hüy bö",8,804)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif NumText == 811 then

		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_02}" )

	elseif NumText == 812 then

		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_02}" )

	elseif NumText == 803 then

		--¶Ò»»½±È¯....
		local ret = x050022_GiveGift( sceneId, selfId, targetId )
		if ret == 1 then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		end

	elseif NumText == 804 then

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

	end

end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x050022_OnEnumerate( sceneId, selfId, targetId )

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	if LuaFnGetName( sceneId, targetId ) == "Tri®u Thiên Sß" then
		AddNumText(sceneId,x050022_g_ScriptId,"HÖ Tùng Thiên Giáng",6,801)
		AddNumText(sceneId,x050022_g_ScriptId,"V« HÖ Tùng Thiên Giáng",11,811)
	elseif LuaFnGetName( sceneId, targetId ) == "Cung Thái Vân" then
		AddNumText(sceneId,x050022_g_ScriptId,"Nh§n ph¥n thß¶ng hoÕt ðµng HÖ Tùng Thiên Giáng",6,802)
		AddNumText(sceneId,x050022_g_ScriptId,"V« hoÕt ðµng HÖ Tùng Thiên Giáng",8,812)
	end

end

--**********************************
--ÏÔÊ¾Ï²´ÓÌì½µ´ðÌâ½çÃæ
--**********************************
function x050022_ShowQuiz( sceneId, selfId, targetId )

	--¼ì²âÊÇ·ñ¿ÉÒÔ´ðÌâ....
	local ret, msg = x050022_CheckCanDoQuiz( sceneId, selfId )
	if 0 == ret then
		x050022_MsgBox( sceneId, selfId, targetId, msg )
		return
	end

	--´ò¿ªÏ²´ÓÌì½µ´ðÌâ½çÃæ....
	CallScriptFunction( x050022_g_QuizScriptId, "ShowQuizUI",sceneId, selfId, targetId )

end

--**********************************
--¼ì²âÍæ¼Òµ±Ç°ÊÇ·ñ¿ÉÒÔ×ö´ðÌâ
--**********************************
function x050022_CheckCanDoQuiz( sceneId, selfId )

	if 1 ~= x050022_CheckRightTime() then
		return 0, "  Bây gi¶ không phäi th¶i gian hoÕt ðµng"
	end

	local CurLevel = GetLevel( sceneId, selfId )
	local LastLevel = GetMissionData( sceneId, selfId, MD_XICONGTIANJIANG_LASTLV )

	if CurLevel < 2 then
		return 0, "#{XSCJ_20071205_03}"
	end

	if CurLevel > 25 then
		return 0, "#{XSCJ_20071205_04}"
	end

	if LastLevel >= CurLevel then
		return 0, "#{XSCJ_20071205_05}" 
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		return 0, "#{XSCJ_20071205_06}"
	end

	return 1

end

--**********************************
--¼ì²âµ±Ç°ÊÇ·ñÊÇ»î¶¯Ê±¼ä
--**********************************
function x050022_CheckRightTime()
local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local nHour	 = GetHour()
  local curDayTime = nYear*1000000+(nMonth+1)*10000+nDay*100+nHour

	if curDayTime >= x050022_g_StartDayTime and curDayTime <= x050022_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x050022_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--Íæ¼Ò´ð¶ÔËùÓÐÌâÄ¿Ê±»Øµ÷´Ëº¯Êý
--**********************************
function x050022_OnPlayerFinishQuiz( sceneId, selfId )

	--¼ÇÂ¼±¾¼¶ÒÑ¾­×ö¹ý´ðÌâÈÎÎñÁË....
	local Level = GetLevel( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_XICONGTIANJIANG_LASTLV, Level )

	--¸ø½±È¯....
	TryRecieveItem( sceneId, selfId, 30505147, QUALITY_MUST_BE_CHANGE )

	--ÐÑÄ¿ÌáÊ¾
	BeginEvent( sceneId )
		AddText( sceneId, "#{XSCJ_20071205_10}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	--ÌØÐ§....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)

end

--**********************************
--Íæ¼ÒÉý¼¶Ê±»Øµ÷´Ëº¯Êý
--**********************************
function x050022_OnPlayerLevelUp( sceneId, selfId )

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel > 25 then
		return
	end

	LuaFnSendSystemMail(sceneId, GetName(sceneId, selfId), "#{XSCJ_20071205_01}")

end

--**********************************
--¶Ò»»½±È¯
--**********************************
function x050022_GiveGift( sceneId, selfId, targetId )

	if 1 ~= x050022_CheckRightTime() then
		return 0
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel > 25 then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_12}" )
		return 0
	end

	--¼ì²â±³°üÊÇ·ñÓÐµØ·½....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_13}" )
		return 0
	end

	--¿Û½±È¯....
	if 0 == DelItem(sceneId, selfId, 30505147, 1) then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_14}" )
		return 0
	end

	--¸ø½±Æ·....
	local GiftTbl = {

		--ÐèÒªÇ¿ÖÆ°ó¶¨µÄÎïÆ·....
		{ itemId=30505146, odds=200 },
		{ itemId=30505171, odds=200 },
		{ itemId=30505170, odds=200 },

		--ÐèÒª¹«¸æµÄÎïÆ·....
		{ itemId=10141096, odds=50 },
		{ itemId=10141097, odds=50 },
		{ itemId=10141098, odds=40 },
		{ itemId=10141099, odds=40 },
		{ itemId=30501128, odds=110 },
		{ itemId=30501129, odds=110 },

	}
	
	local index = 0
	local randValue = random(1000);
	randValue = randValue - 1;

	for i, item in GiftTbl do
		if item.odds >= randValue then
			index = i
			break;
		end
		randValue = randValue - item.odds;
	end

	if index == 0 then
		return 0
	end

	if index < 4 then

		local BagIndex = TryRecieveItem( sceneId, selfId, GiftTbl[index].itemId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			BeginEvent( sceneId )
				AddText( sceneId, "HÖ Tùng Thiên Giáng! ChÑc m×ng các hÕ ðÕt ðßþc #{_ITEM"..GiftTbl[index].itemId.."} ph¥n thß·ng, hy v÷ng các hÕ tiªp tøc n² lñc" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			LuaFnItemBind( sceneId, selfId, BagIndex)
		end

	else

		local BagIndex = TryRecieveItem( sceneId, selfId, GiftTbl[index].itemId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then

			BeginEvent( sceneId )
				AddText( sceneId, "HÖ Tùng Thiên Giáng! ChÑc m×ng các hÕ ðÕt ðßþc #{_ITEM"..GiftTbl[index].itemId.."} ph¥n thß·ng, hy v÷ng các hÕ tiªp tøc n² lñc" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )

			local strTrans = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local strName = GetName(sceneId, selfId)
			local strMsg = format("#PÐáng kinh ngÕc, m· thß·ng l¾n r°i! HÖ Tùng Thiên Giáng, chúc m×ng #{_INFOUSR%s} ðÕt ðßþc #{_INFOMSG%s} mµt cái, hy v÷ng #{_INFOUSR%s} tiªp tøc n² lñc", strName, strTrans, strName)

			MonsterTalk(sceneId, targetId, "´óÀí", strMsg)

		end

	end

	--ÌØÐ§....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)

	return 1

end

