x402315_g_scriptId = 402315
--脚本号--蝎子最新改进，增加全场景检测，增加00坐标附近检测，QQ-718805400
--**********************************
-- OnTime
--**********************************
function x402315_JianCeSceneTimer(sceneId)
	local nQuarter = mod(GetQuarterTime(),100);
        if nQuarter >= 80 and nQuarter =< 88 then
           return
        end
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x402315_DoAutoGetExpLogic( sceneId, nHumanId )
	end

end

--**********************************
-- 挂机加经验逻辑
--**********************************
function x402315_DoAutoGetExpLogic( sceneId, selfId )
         x402315_MsgBox( sceneId, selfId, "现在不是通天塔开放时间" )	
         CallScriptFunction((400900),"TransferFunc",sceneId,selfId,498,random(215,230),random(40,55)) 
end

--**********************************
--消息提示
--**********************************
function x402315_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end