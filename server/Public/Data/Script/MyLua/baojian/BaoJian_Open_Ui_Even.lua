
x910103_g_scriptId = 910103


--**********************************
--by UK QQ 2269169441
--**********************************
function x910103_UK_Open_Ui( sceneId, selfId)
	local misssusu = {MD_BIAOJIAN_SUXING1,MD_BIAOJIAN_SUXING2,MD_BIAOJIAN_SUXING3,MD_BIAOJIAN_SUXING4,MD_BIAOJIAN_SUXING5,MD_BIAOJIAN_NUM}
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,0)
		for i = 1,getn(misssusu) do
		UICommand_AddInt(sceneId,GetMissionData(sceneId, selfId, misssusu[i]))
		end
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2015123199)
end

