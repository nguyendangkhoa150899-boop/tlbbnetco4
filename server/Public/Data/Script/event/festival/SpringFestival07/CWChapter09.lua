--BOSS´ºÍí 09ºÅ½ÚÄ¿

--¹ã¸æ³èÁ¸


--½Å±¾ºÅ
x050039_g_scriptId = 050039

--´ºÍíÖ÷¿Ø½Å±¾½Å±¾ºÅ....
x050039_g_MainScriptId = 050030

--±¾½ÚÄ¿µÄ½ÚÄ¿ºÅ....
x050039_g_ChapterId = 9

--¶¯×÷²¥·Å±í....
x050039_g_ActionTbl = {

	[30] = { [100]=451,[200]=550 },

}

--**********************************
--¿ªÊ¼±¾½ÚÄ¿....
--**********************************
function x050039_OnStartThisChapter( sceneId )

	--ËïÃÀÃÀº°»°....
	local msg = "#P[Xuân vãn ngß¶i chü trì - Tôn Mî Mî].#Y phía dß¾i sáp bá quäng cáo! Tài trþ: Vân T¥n"
	MonsterTalk(sceneId, -1, "LÕc Dß½ng", msg )

	--´´½¨»¤µºÉñÊÞ....
	local MstId = -1
	MstId = CallScriptFunction( x050039_g_MainScriptId, "CreateBossActor", sceneId, "HuDaoShenShou", 160, 109, 1 )
	SetPatrolId(sceneId, MstId, 30)

end

--**********************************
--¹ÖÎïÑ²Âßµ½Ä³µãÊ±»Øµ÷±¾½Ó¿Ú....
--**********************************
function x050039_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--Èç¹û¶¯×÷±íÖÐÅäÖÃÁË¶¯×÷Ôò²¥·Å¶¯×÷....
	x050039_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--ÊÇ·ñ×ßµ½ÁË×îºóÒ»¸öÑ²Âßµã....
	if patrolPointIndex ~= 4 then
		return
	end

	--É¾³ý»¤µºÉñÊÞ....
	if 1 == CallScriptFunction( x050039_g_MainScriptId, "IsSpecificBossActor", sceneId, "HuDaoShenShou", objId ) then
		CallScriptFunction( x050039_g_MainScriptId, "DeleteBossActor", sceneId, "HuDaoShenShou", objId )
		--±¾½ÚÄ¿½áÊø....
		x050039_OnEndThisChapter( sceneId )
	end

end

--**********************************
--½áÊø±¾½ÚÄ¿....
--**********************************
function x050039_OnEndThisChapter( sceneId )

	CallScriptFunction( x050039_g_MainScriptId, "OnChapterEnd", sceneId, x050039_g_ChapterId )

end

--**********************************
--²¥·Å¶¯×÷±íÖÐÄ³¸ö¶¯×÷....
--**********************************
function x050039_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050039_g_ActionTbl[patrolPathIndex]
	if pathActData then

		local idx = patrolPointIndex * 100
		if -1 == paopaoIndex then
			idx = idx + 99
		else
			idx = idx + paopaoIndex
		end

		local actId = pathActData[ idx ]
		if actId and actId > 0 then
			MonsterDoAction( sceneId, objId, actId, -1 )
		end

	end

end
