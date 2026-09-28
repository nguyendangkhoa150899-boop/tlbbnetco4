
x899042_g_scriptId = 899042
--**********************************
--
--**********************************
function x899042_XuHuanKill( sceneId, selfId, targetId , shopA ,shopB,param1,param2 )


    if targetId ~= nil then
	if targetId and targetId == 1001 and shopA ~= nil then
	CallScriptFunction((892002), "AddImpact",sceneId,selfId,targetId,shopA)
	return
	end
	 if targetId and targetId <= 1004 and targetId >= 1002 and shopA ~= nil then
	CallScriptFunction((339008), "OnLianDanLuHelp",sceneId,selfId,targetId,shopA)
	return
	end
	if targetId == -81 and shopA ~= nil then
	CallScriptFunction((300105), "PickUpToBag",sceneId,selfId,shopA)
	return
	end	
     if targetId == -82 and shopA ~= nil then
	CallScriptFunction((300105), "ZhenYuanUP",sceneId,selfId,shopA,0)
	return
	end	
     if targetId == -85 and shopA ~= nil and shopB ~= nil then
	CallScriptFunction((880010), "SuXingChongZhi",sceneId,selfId,shopA,shopB)
	return
	end
    if targetId == -86 then
	CallScriptFunction((880010), "JiaYindelkonglevelup",sceneId,selfId,shopA)
	return
	end
   	if targetId == -87 then
	CallScriptFunction((880010), "JiaYincclevelup",sceneId,selfId)
	return
	end
  	if targetId == -88 then
	CallScriptFunction((880010), "OpenJiaYin",sceneId,selfId,"o")
	return
	end
	if targetId == -54 then
	CallScriptFunction((339011), "OpenMyUi",sceneId,selfId)
	return
	end
	if targetId == -55 then
	CallScriptFunction((339011), "readerpoint",sceneId,selfId)
	return
	end
	if targetId == -56 then
	CallScriptFunction((339011), "AddPoint",sceneId,selfId,shopA,shopB,param1,param2)
	return
	end
	if targetId == -58 then
	CallScriptFunction((339011), "OnLianDanLuRongHe",sceneId,selfId,shopA)
	return
	end
	if targetId == -60 then
	CallScriptFunction((339011), "OnLianDanLuNingLian",sceneId,selfId,shopA)
	return
	end
	if targetId == -91 then
	CallScriptFunction((339008), "OnLianDanLuHelp",sceneId,selfId,shopA)
	return
	end
	if targetId == -92 then
	CallScriptFunction((339008), "OnLianDanLuRongHe",sceneId,selfId,shopA)
	return
	end
	if targetId == -93 then
	CallScriptFunction((339008), "OnLianDanLuNingLian",sceneId,selfId,shopA)
	return
	end
	if targetId == -94 then
	CallScriptFunction((339008), "opdata",sceneId,selfId)
	return
	end
	if targetId == -95 then
	CallScriptFunction((339008), "optardata",sceneId,selfId,shopB)
	return
	end
	end

end

