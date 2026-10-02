--楼兰NPC 金久灵
--Created by 左春伟

--脚本号
x001168_g_ScriptId = 001168
x001168_g_eventList={808039} -- seek_treasure寻宝
x001168_g_moster_album_id = 30505192;
x001168_g_exchange_num = 20;
x001168_g_clothing_id = 
{
		10124113,           --少林新时装 0
		10124114,           --明教新时装 1
		10124115,           --丐帮新时装 2
		10124117,           --武当新时装 3
		10124116,           --峨嵋新时装 4
		10124118,           --星宿新时装 5
		10124121,           --天龙新时装 6
		10124119,           --天山新时装 7
		10124120,           --逍遥新时装 8
}
--**********************************
--事件列表
--**********************************
function x001168_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLXB_8815_06}")
		for i, eventId in x001168_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		if GetMenPai(sceneId,selfId) < 9 then
		AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_01}", 6, 100);  --兑换
		end
		AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_02}", 11, 101); --兑换帮助
		if GetMenPai(sceneId,selfId) > 9 then
		--AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_01}", 6, 102);  --兑换  -- [NetCo4 02/10] an muc 102: doi 20 sach lay 10124199 (vat pham khong ton tai -> mat sach)
		end
		--[tx45411]AddNumText(sceneId, x001168_g_ScriptId, "#{NSRQ_081110_2}", 11, 999); --zchw
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001168_OnDefaultEvent( sceneId, selfId,targetId )
	x001168_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001168_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end
function x001168_OnEventRequest( sceneId, selfId, targetId, eventId )
	--[tx45411]if GetNumText() == 999 then
	--	x001168_ShowMsg(sceneId, selfId, targetId, "#{NSRQ_081110_3}")
	--[/tx45411]end
	for i, findId in x001168_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001168_g_ScriptId )
			return
		end
	end
	if GetNumText()  == 102 then  -- [NetCo4 02/10] muc 102 da an; neu van bi goi thi khong tru gi
		x001168_ShowMsg(sceneId, selfId, targetId, "Ch\209c n\229ng n\224y \240\227 t\213m \240\243ng, c\225c h\213 kh\244ng b\184 tr\215 v\167t ph\166m.")
		return
	end
	if 0 == 1 then                   --提升 冰 等级  -- [NetCo4 02/10] code cu muc 102 (vat pham 10124199 khong ton tai), tat
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 30505192)
            if c0 >=20 then
					local szTransferalbum = GetBagItemTransfer(sceneId,selfId, nItemBagIndexalbum)
					LuaFnDelAvailableItem(sceneId,selfId,30505192,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10124199, 1)--给予物品
				    local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )					
		            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
                    x001168_NotifyFailTips(sceneId, selfId, "Ch鷆 m譶g b課 h䅟 th鄋h c鬾g")
					local PlayerName = GetName(sceneId,selfId)
					local szTransferEquip = GetBagItemTransfer(sceneId,selfId, bagpos01)
					local str = format("#{_INFOUSR%s}#{GWXCSZGG_1}#{_INFOMSG%s}#{GWXCSZGG_2}#{_INFOMSG%s}#{GWXCSZGG_3}",PlayerName,szTransferalbum,szTransferEquip)
				BroadMsgByChatPipe( sceneId, selfId, str, 4 )
             else
			 BeginEvent( sceneId ) 
					strText = "#GVui L騨g Ki猰 tra l読 qo醝 v t呓ng s醕h"
					AddText( sceneId, strText )
			EndEvent( sceneId )
             DispatchEventList( sceneId, selfId, targetId )
	       end
		   
	end
	if GetNumText() == 100 then
		local num = LuaFnGetAvailableItemCount(sceneId, selfId, x001168_g_moster_album_id);
		if num == 0 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_03}")
			return
		elseif num < 20 then  -- [NetCo4 02/10] can 20 cuon (x001168_g_exchange_num); truoc < 19 -> co 19 cuon bam khong co gi xay ra
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_04}")
			return
		end
		if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{SJQM_8815_06}")
			return 		
		end
		--加入门派了吗？
		local menpaiId = GetMenPai(sceneId, selfId);
		if menpaiId < 0 or menpaiId > 10 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_06}")
			return
		end
		local nItemBagIndexalbum = GetBagPosByItemSn(sceneId, selfId, x001168_g_moster_album_id)
		local szTransferalbum = GetBagItemTransfer(sceneId,selfId, nItemBagIndexalbum)
		-- ok 得到与玩家门派相对应的高级时装
		if LuaFnDelAvailableItem(sceneId, selfId, x001168_g_moster_album_id, x001168_g_exchange_num) == 1 then
			local clothingId = x001168_g_clothing_id[menpaiId+1];
			local ret = TryRecieveItem( sceneId, selfId, clothingId, QUALITY_MUST_BE_CHANGE);
			if ret > -1 then
				-- 绑定
				if LuaFnItemBind(sceneId, selfId, ret) ~= 1 then
					x001168_ShowMsg(sceneId, selfId, targetId, "斜i th b読")
					return
				end
				-- 提示
				BeginEvent(sceneId)
					AddText(sceneId, "斜i th秈 trang cao c m鬾 ph醝 th鄋h c鬾g")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				Msg2Player(sceneId, selfId, "斜i th秈 trang cao c m鬾 ph醝 th鄋h c鬾g", 8)
				--兑换成功，播放特效
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
				
				--播放公告
				local PlayerName = GetName(sceneId,selfId)
				local szTransferEquip = GetBagItemTransfer(sceneId,selfId, ret)
				local str = format("#{_INFOUSR%s}#{GWXCSZGG_1}#{_INFOMSG%s}#{GWXCSZGG_2}#{_INFOMSG%s}#{GWXCSZGG_3}",PlayerName,szTransferalbum,szTransferEquip)
				BroadMsgByChatPipe( sceneId, selfId, str, 4 )
				-- 日志
				AuditExchangeMenpaiSuit(sceneId, selfId, menpaiId, clothingId);
			end
		end
	elseif GetNumText() == 101 then
		x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_05}")
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001168_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001168_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			x001168_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001168_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001168_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
--**********************************
--显示消息
--**********************************
function x001168_ShowMsg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)	
end
