--通用心法NPC
--此脚本可以根据角色判断门派，自动打开对应门派的心法UI界面
--赤砂の蝎 制作 QQ718805400

x000166_g_scriptId = 000166

--**********************************
--事件交互入口
--**********************************
function x000166_OnDefaultEvent( sceneId, selfId,targetId )
	x000166_g_MenPai = GetMenPai(sceneId, selfId)
        local xiezi=GetHumanMaxVigor(sceneId,selfId) 
	if x000166_g_MenPai == 9 and xiezi < 25000 then
			BeginEvent(sceneId)
			AddText(sceneId,"你找我有什么事？")
			AddNumText(sceneId, x000166_g_scriptId, "关于心法的介绍",11,10)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x000166_g_scriptId, "学习技能",12,0)
		        AddNumText(sceneId, x000166_g_scriptId, "关于心法的介绍",11,10)
			AddNumText(sceneId, x000166_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x000166_OnEventRequest( sceneId, selfId, targetId, eventId )
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

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, x000166_g_MenPai );
end
