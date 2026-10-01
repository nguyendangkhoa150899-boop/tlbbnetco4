--雪山狼

--**********************************
--事件交互入口
--**********************************
function x325003_OnDefaultEvent( sceneId, selfId,targetId )
 
end

function x325003_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 950001, "OnDie", sceneId, selfId, killerId )   -- [NetCo4 02/10] Tuyet Lang Ho chi roi Phuc Hi Ngoc 30% (NetCo4/roimap.lua [179]); bang roi MonsterDropBoxs da bo
 
end
