--武当NPC
--俞远山
--普通

x017043_g_scriptId = 017043

--**********************************
--事件交互入口
--**********************************
function x017043_OnDefaultEvent( sceneId, selfId,targetId )
	x017043_g_MenPai = GetMenPai(sceneId, selfId)
	if x017043_g_MenPai == 10 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x017043_g_scriptId, "学习技能",12,0)
			AddNumText(sceneId, x017043_g_scriptId, "关于心法的介绍",11,10)
			--AddNumText(sceneId, x017043_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"你找我有什么事？")
			AddNumText(sceneId, x017043_g_scriptId, "关于心法的介绍",11,10)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x017043_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 10 );
end
