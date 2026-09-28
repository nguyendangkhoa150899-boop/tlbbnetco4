--2007Ê¥µ®Ôªµ©»î¶¯....
--ÐÂÊÖ³é½±_Ï²´ÓÌì½µ»î¶¯....

--´ðÌâ½Å±¾....


--½Å±¾ºÅ
x050021_g_ScriptId = 050021

--Ï²´ÓÌì½µÈÎÎñ½Å±¾ºÅ
x050021_g_EventScriptId = 050022

--ÌâÄ¿ÊýÁ¿....
x050021_g_NumQuestion	= 5

--ÌâÄ¿ÔÚÌâ¿âÖÐµÄ·ÖÀà....
x050021_g_QuestionType = 8

--UICOMMAND
x050021_g_UICommand = 20071224

x050021_g_UIStart			= 1	--¿ªÊ¼´ðÌâ½çÃæ....
x050021_g_UIQuestion	= 2	--ÏÔÊ¾ÌâÄ¿½çÃæ....
x050021_g_UIWrong			= 3	--´ð´í½çÃæ....
x050021_g_UIEnd				= 4	--´ðÍêËùÓÐÌâÄ¿½çÃæ....


--**********************************
--¸ø¿Í»§¶ËÏÔÊ¾´ðÌâ½çÃæ
--**********************************
function x050021_ShowQuizUI( sceneId, selfId, targetId )

	--°²È«¼ì²â....
	local ret = CallScriptFunction( x050021_g_EventScriptId, "CheckCanDoQuiz", sceneId, selfId )
	if 1 ~= ret then
		return
	end

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x050021_g_UIStart)
		UICommand_AddString(sceneId,"#gFF0FA0HÖ Tòng Thiên Giáng")
		UICommand_AddString(sceneId,"#{XSCJ_20071205_07}")
		UICommand_AddInt(sceneId,targetId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x050021_g_UICommand)

end

--**********************************
--ÌáÎÊ
--**********************************
function x050021_AskQuestion( sceneId, selfId, Question_Sequence)

	--°²È«¼ì²â....
	local ret = CallScriptFunction( x050021_g_EventScriptId, "CheckCanDoQuiz", sceneId, selfId )
	if 1 ~= ret then
		return
	end

	--´òÍêÁËËùÓÐÌâ¾ÍÏÔÊ¾´ðÍêµÄ½çÃæ....
	if Question_Sequence > x050021_g_NumQuestion then
		CallScriptFunction( x050021_g_EventScriptId, "OnPlayerFinishQuiz", sceneId, selfId )
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x050021_g_UIEnd)
			UICommand_AddString(sceneId,"#{XSCJ_20071205_08}")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x050021_g_UICommand)
		return
	end

	--Ëæ»ú³öÒ»¸öÌâºÅ....
	local wenti = GetRandomQuestionsIndex( x050021_g_QuestionType )

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5,sztype=GetQuestionsRecord(wenti)
	if con=="" then
		Msg2Player( sceneId,selfId,"Không tìm ðßþc v¤n ð«",MSG2PLAYER_PARA)
	end

	local key_position = {}
	--°ÑËûÃÇÎ»ÖÃËæ»úµô
	local rand = random(3)
	if rand == 1 then
		key_position[0] = 1
		key_position[1] = 2
		key_position[2] = 0
	elseif rand == 2 then
		key_position[0] = 2
		key_position[1] = 0
		key_position[2] = 1
	else
		key_position[0] = 0
		key_position[1] = 1
		key_position[2] = 2
	end
	key_position[3] = -1
	key_position[4] = -1
	key_position[5] = -1

	local asktime = LuaFnGetCurrentTime();
	SetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME,asktime)

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x050021_g_UIQuestion)
		UICommand_AddInt(sceneId,Question_Sequence)
		UICommand_AddInt(sceneId,wenti)		
		UICommand_AddString(sceneId,con)
		UICommand_AddString(sceneId,opt0)
		UICommand_AddString(sceneId,opt1)
		UICommand_AddString(sceneId,opt2)
		UICommand_AddString(sceneId,opt3)
		UICommand_AddString(sceneId,opt4)
		UICommand_AddString(sceneId,opt5)
		UICommand_AddInt(sceneId,key_position[0])
		UICommand_AddInt(sceneId,key_position[1])
		UICommand_AddInt(sceneId,key_position[2])
		UICommand_AddInt(sceneId,key_position[3])
		UICommand_AddInt(sceneId,key_position[4])
		UICommand_AddInt(sceneId,key_position[5])
		UICommand_AddInt(sceneId,-1 )
		UICommand_AddString(sceneId,sztype)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x050021_g_UICommand)

end

--**********************************
--»Ø´ð
--**********************************
function x050021_AnswerQuestion( sceneId, selfId, Question, Answer1, Question_Sequence)

	--°²È«¼ì²â....
	local ret = CallScriptFunction( x050021_g_EventScriptId, "CheckCanDoQuiz", sceneId, selfId )
	if 1 ~= ret then
		return
	end

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5=GetQuestionsRecord(Question)

	local Answer_List={}
	Answer_List[0] = key0;
	Answer_List[1] = key1;
	Answer_List[2] = key2;
	Answer_List[3] = key3;
	Answer_List[4] = key4;
	Answer_List[5] = key5;

	if con=="" then
		Msg2Player( sceneId,selfId,"Không tìm ðßþc v¤n ð«",MSG2PLAYER_PARA)
	end

	local asktime = GetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME)
	if Answer_List[Answer1-1] == 1 and LuaFnGetCurrentTime() - asktime < 305 then

		--¸æËßËû´ð¶ÔÁË....
		x050021_AskQuestion( sceneId, selfId, Question_Sequence + 1)

	else

		--¸æËßËû´ð´íÁË....
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSCJ_20071205_11}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )

		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x050021_g_UIWrong)
			UICommand_AddString(sceneId,"#{XSCJ_20071205_09}")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x050021_g_UICommand)

	end

end

--**********************************
--´ðÌâ³¬Ê±
--**********************************
function x050021_OnOverTime( sceneId, selfId )

	--°²È«¼ì²â....
	local ret = CallScriptFunction( x050021_g_EventScriptId, "CheckCanDoQuiz", sceneId, selfId )
	if 1 ~= ret then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "#{XSCJ_20071210_02}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x050021_g_UIWrong)
			UICommand_AddString(sceneId,"#{XSCJ_20071210_01}")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x050021_g_UICommand)

end
