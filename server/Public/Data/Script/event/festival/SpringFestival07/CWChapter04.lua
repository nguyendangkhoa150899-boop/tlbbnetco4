--BOSS´ºÍí 04ºÅ½ÚÄ¿

--¹ã¸æ·½±ãÃæ


--½Å±¾ºÅ
x050034_g_scriptId = 050034

--´ºÍíÖ÷¿Ø½Å±¾½Å±¾ºÅ....
x050034_g_MainScriptId = 050030

--±¾½ÚÄ¿µÄ½ÚÄ¿ºÅ....
x050034_g_ChapterId = 4

--¶¯×÷²¥·Å±í....
x050034_g_ActionTbl = {

	[17] = { [100]=460,[200]=1 },

}

--**********************************
--¿ªÊ¼±¾½ÚÄ¿....
--**********************************
function x050034_OnStartThisChapter( sceneId )

	--ËïÃÀÃÀº°»°....
	local msg = "#P[Xuân vãn ngß¶i chü trì - Tôn Mî Mî].#Y phía dß¾i sáp bá quäng cáo! Tài trþ: H° Ph°n"
	MonsterTalk(sceneId, -1, "LÕc Dß½ng", msg )

	--´´½¨¶ÎÓþ..Ä½ÈÝ¸´..ÍõÓïæÌ....
	local MstId = -1
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "DuanYu", 163, 111, 1 )
	SetPatrolId(sceneId, MstId, 16)
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "MuRongFu", 160, 112, 1 )
	SetPatrolId(sceneId, MstId, 17)
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "WangYuYan", 164, 111, 1 )
	SetPatrolId(sceneId, MstId, 18)

end

--**********************************
--¹ÖÎïÑ²Âßµ½Ä³µãÊ±»Øµ÷±¾½Ó¿Ú....
--**********************************
function x050034_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--Èç¹û¶¯×÷±íÖÐÅäÖÃÁË¶¯×÷Ôò²¥·Å¶¯×÷....
	x050034_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--ÊÇ·ñ×ßµ½ÁË×îºóÒ»¸öÑ²Âßµã....
	if patrolPointIndex ~= 3 then
		return
	end

	--É¾³ý¶ÎÓþ..Ä½ÈÝ¸´..ÍõÓïæÌ....
	if 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuanYu", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "DuanYu", objId )
	elseif 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "MuRongFu", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "MuRongFu", objId )
	elseif 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "WangYuYan", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "WangYuYan", objId )
		--±¾½ÚÄ¿½áÊø....
		x050034_OnEndThisChapter( sceneId )
	end

end

--**********************************
--½áÊø±¾½ÚÄ¿....
--**********************************
function x050034_OnEndThisChapter( sceneId )

	CallScriptFunction( x050034_g_MainScriptId, "OnChapterEnd", sceneId, x050034_g_ChapterId )

end

--**********************************
--²¥·Å¶¯×÷±íÖÐÄ³¸ö¶¯×÷....
--**********************************
function x050034_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050034_g_ActionTbl[patrolPathIndex]
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
