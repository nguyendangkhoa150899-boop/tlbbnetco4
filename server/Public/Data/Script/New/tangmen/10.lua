--商店
--门派商店
--逍遥 奇门遁甲

--脚本号
x760009_g_ScriptId = 760009

--商店号
x760009_g_shoptableindex=86

--商店名称
x760009_g_ShopName = "Mua s bi阯 n誴 thu ph痠 ph呓ng"

--**********************************
--任务入口函数
--**********************************
function x760009_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	DispatchShopItem( sceneId, selfId,targetId, x760009_g_shoptableindex )
end

--**********************************
--列举事件
--**********************************
function x760009_OnEnumerate( sceneId, selfId, targetId )
	--判断是否是本派弟子
	if GetMenPai(sceneId,selfId) == MP_TANGMEN then
		AddNumText(sceneId,x760009_g_ScriptId,x760009_g_ShopName,7,-1)
    end
	return
end

--**********************************
--检测接受条件
--**********************************
function x760009_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x760009_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x760009_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x760009_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x760009_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x760009_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x760009_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--进入区域事件
--**********************************
function x760009_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x760009_OnItemChanged( sceneId, selfId, itemdataId )
end
