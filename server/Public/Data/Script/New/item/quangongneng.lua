--洛阳NPC

--**********************************
--事件交互入口
--**********************************
function x210531_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	--	AddText( sceneId, "#c0066ff神器炼魂平台" )
		--AddText( sceneId, "#G（#cFF0000神器炼魂#G）" )
		--AddText( sceneId, "#G（#cFF0000神器重炼#G）" )
		--AddText( sceneId, "三段#G（#cFF0000LV5-LV6#G）#cFF0000100%↑" )
		--AddText( sceneId, "#cff99ff提示（#G请拆下已镶嵌的宝石#cff99ff）" )
		AddNumText( sceneId, x210531_g_ScriptId, "神器重铸", 5, 100 )
		AddNumText( sceneId, x210531_g_ScriptId, "重楼重铸", 5, 200 )
		AddNumText( sceneId, x210531_g_ScriptId, "神器升级", 5, 300 )
		AddNumText( sceneId, x210531_g_ScriptId, "四代神器", 5, 400 )
		AddNumText( sceneId, x210531_g_ScriptId, "四代重铸", 5, 500 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x210531_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
        UICommand_AddInt( sceneId, 1)
    	UICommand_AddInt( sceneId, 800000)---需要的钱
		UICommand_AddInt( sceneId, 10300006) --装备开始
		UICommand_AddInt( sceneId, 10305108)  --装备结束
		UICommand_AddInt( sceneId, 30505817)  --物品id
		UICommand_AddString(sceneId,"神器重洗");
		UICommand_AddString(sceneId,"#G需要5个神兵符#r#B加86或者96或者102神器一把即可重洗#r#Y 我们的网站是:http://hztl.fcloo.cn 游戏#YQQ群:921219");
		UICommand_AddString(sceneId,"#Y放入要重洗的神器:");
		UICommand_AddString(sceneId,"#B请放入神兵符:");
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20090721)
	elseif GetNumText() == 200 then
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
        UICommand_AddInt( sceneId, 2)
    	UICommand_AddInt( sceneId, 400000)---需要的钱
		UICommand_AddInt( sceneId, 10422016) --装备开始
		UICommand_AddInt( sceneId, 10423024)  --装备结束
		UICommand_AddInt( sceneId, 30505817)  --物品id
		UICommand_AddString(sceneId,"重楼重洗");
		UICommand_AddString(sceneId,"#G需要20个神兵符#r#B重楼一件即可重洗#r#P愿各位玩家开心游戏,欢迎玩家交提BUG拿赠点");
		UICommand_AddString(sceneId,"#Y放入要重洗的重楼:");
		UICommand_AddString(sceneId,"#B神兵符:");
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20090721)
	elseif GetNumText() == 300 then
	   	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
        UICommand_AddInt( sceneId, 4)
    	UICommand_AddInt( sceneId, 500000)---需要的钱
		UICommand_AddInt( sceneId, 10300004) --装备开始
		UICommand_AddInt( sceneId, 10305108)  --装备结束
		UICommand_AddInt( sceneId, 30505817)  --物品id
		UICommand_AddString(sceneId,"神器升级");
		UICommand_AddString(sceneId,"#G需要10个神兵符#r#P只支持82或92级神器升级#r#cFF0000从来没有完美的游戏,一旦出了问题,我都能想法修复它,可感情出了问题我却无计可施");
		UICommand_AddString(sceneId,"#Y放入要升级的神器:");
		UICommand_AddString(sceneId,"#B神兵符:");
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20090721)
		
		elseif GetNumText() == 400 then
	   	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
        UICommand_AddInt( sceneId, 7)
    	UICommand_AddInt( sceneId, 500000)---需要的钱
		UICommand_AddInt( sceneId, 10300008) --装备开始
		UICommand_AddInt( sceneId, 10305108)  --装备结束
		UICommand_AddInt( sceneId, 30505817)  --物品id
		UICommand_AddString(sceneId,"102进阶");
		UICommand_AddString(sceneId,"#G需要100个神兵符#r#P+102神器快升级4代神器#r#cFF0000从来没有完美的游戏,一旦出了问题,我都能想法修复它,可感情出了问题我却无计可施");
		UICommand_AddString(sceneId,"#Y放入要升级的神器:");
		UICommand_AddString(sceneId,"#B神兵符:");
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20090721)
		elseif GetNumText() == 500 then
	   	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
        UICommand_AddInt( sceneId, 8)
    	UICommand_AddInt( sceneId, 500000)---需要的钱
		UICommand_AddInt( sceneId, 10305266) --装备开始
		UICommand_AddInt( sceneId, 10305277)  --装备结束
		UICommand_AddInt( sceneId, 30505817)  --物品id
		UICommand_AddString(sceneId,"四代神器重洗");
		UICommand_AddString(sceneId,"#G需要四代神器+10个神兵可进行重洗属性#r#cFF0000从来没有完美的游戏,一旦出了问题,我都能想法修复它,可感情出了问题我却无计可施");
		UICommand_AddString(sceneId,"#Y放入要升级的神器:");
		UICommand_AddString(sceneId,"#B神兵符:");
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20090721)
	end
end
