-- Thiên công khai v§t nh§n lînh ph¦n thß·ng
-- ´´½¨ÈË[ QUFEI 2007-09-21 15:07 UPDATE BugID 24677 ]

x210244_g_ScriptId = 210244

x210244_g_Update = {

    ["id01"] = 60,
    ["id02"] = 70,
    ["id03"] = 80,

}

--ÌáÊ¾ÐÅÏ¢
x210244_g_msg = {

    ["jl60"]	= "Lînh ph¥n thß·ng c¤p 60",
    ["jl70"]	= "Lînh ph¥n thß·ng c¤p 70",
    ["jl80"]	= "Lînh ph¥n thß·ng c¤p 80",

}

--½±Àø±ê¼Ç
x210244_g_flag = {

    [60]	= MF_TianGongJiangli60,
    [70]	= MF_TianGongJiangli70,
    [80]	= MF_TianGongJiangli80,

}

--²ÄÁÏ½±Àø
-- 60 ÃÞ²¼ËéÆ¬
-- 70 ¾«ÌúËéÆ¬
-- 80 ÃØÒøËéÆ¬
x210244_g_CaiLiaoJiangLi = {

    [60]	= 20501000,
    [70]	= 20500000,
    [80]	= 20502000,

}

x210244_g_PlayerLevel = 0

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x210244_OnEnumerate( sceneId, selfId, targetId )	
		
--	BeginEvent(sceneId)					¾¯¸æ£ºÕâ¸öº¯ÊýÖÐ²»Òª³öÏÖBeginEventÌ×¼þ »áÇå¿ÕÖ®Ç°µÄAddNumTextÐÅÏ¢ 
	
		if GetLevel( sceneId, selfId ) >= 60 then
			AddNumText( sceneId, x210244_g_ScriptId, "#{TGKW_20070918_003}", 6, 105 )
			AddNumText( sceneId, x210244_g_ScriptId, "#{TGKW_20070918_004}", 11, 106 )
		end	
			
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)
		
end

function x210244_OnDefaultEvent( sceneId, selfId, targetId )
	
	local	key	= GetNumText()
	x210244_g_PlayerLevel = GetNumText()
			
	if key == 105 then
		BeginEvent(sceneId)
		
		AddText(sceneId,"#{TGKW_20070918_001}")				
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl60"], 6, x210244_g_Update["id01"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl70"], 6, x210244_g_Update["id02"] )	
		AddNumText( sceneId, x210244_g_ScriptId, x210244_g_msg["jl80"], 6, x210244_g_Update["id03"] )	
		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	elseif key == 106 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{TGKW_20070918_002}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		return
	elseif key == x210244_g_Update["id01"] or key == x210244_g_Update["id02"] or key == x210244_g_Update["id03"] then
		x210244_OnTianGongKaiWu( sceneId, selfId, targetId )
		return
	end	
	
end

function x210244_OnTianGongKaiWu( sceneId, selfId, targetId )
		
	local mylevel = GetLevel( sceneId, selfId )
		
	if mylevel < x210244_g_PlayerLevel then
		local strText = format("C¤p ðµ cüa ngß½i không ðü, khi ðÕt ðªn c¤p %d hãy ðªn tìm ta.", x210244_g_PlayerLevel )
		x210244_TalkMsg( sceneId, selfId, targetId, strText )	
		return
	end
		
	local index =	GetMissionFlag( sceneId, selfId, x210244_g_flag[x210244_g_PlayerLevel] )
		
	if index == 1 then
		x210244_TalkMsg( sceneId, selfId, targetId, "Ngß½i ðã nh§n ph¥n thß·ng này r°i, không th¬ tiªp tøc lînh næa." )	
		return
	end
	
	BeginAddItem( sceneId )
	AddItem( sceneId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], 4 )
	ret = EndAddItem( sceneId, selfId )
			
	if ret <= 0 then
		x210244_TalkMsg( sceneId, selfId, targetId, "Không gian nay näi cüa ngß½i không ðü, hãy s¡p xªp lÕi r°i ðªn tìm ta." )	
		return
	end
	
	-- ½±Àø²ÄÁÏ	
	local bagpos01 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], QUALITY_MUST_BE_CHANGE )	-- ·Å²»ÏÂ¾ÍÃ»ÓÐÁË
	local bagpos02 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], QUALITY_MUST_BE_CHANGE )	-- ·Å²»ÏÂ¾ÍÃ»ÓÐÁË
	local bagpos03 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], QUALITY_MUST_BE_CHANGE )	-- ·Å²»ÏÂ¾ÍÃ»ÓÐÁË
	local bagpos04 = TryRecieveItem( sceneId, selfId, x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel], QUALITY_MUST_BE_CHANGE )	-- ·Å²»ÏÂ¾ÍÃ»ÓÐÁË
	
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		
	-- Ç¿ÖÆ°ó¶¨										
	local	bindidx01	=	LuaFnItemBind( sceneId, selfId, bagpos01 )
	local	bindidx02	=	LuaFnItemBind( sceneId, selfId, bagpos02 )
	local	bindidx03	=	LuaFnItemBind( sceneId, selfId, bagpos03 )
	local	bindidx04	=	LuaFnItemBind( sceneId, selfId, bagpos04 )
	
	if bindidx01 ~= 1 or bindidx02 ~= 1 or bindidx03 ~= 1 or bindidx04 ~= 1 then
		local bindmsg = "Khóa ð¸nh th¤t bÕi"													
		BeginEvent( sceneId )
			AddText( sceneId, bindmsg )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
		
	SetMissionFlag( sceneId, selfId, x210244_g_flag[x210244_g_PlayerLevel], 1 )
	
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
	local retmsg = format("%s nh§n lînh thành công", GetItemName(sceneId,x210244_g_CaiLiaoJiangLi[x210244_g_PlayerLevel]) )
	x210244_TalkMsg( sceneId, selfId, targetId, retmsg )	
	
	-- ·¢ËÍÏµÍ³¹«¸æ										
	local playername = GetName(sceneId, selfId)
	local strText = format("#{_INFOUSR%s}#I#{TGKW_20070918_005}#Y%d#{TGKW_20070918_006}#{_INFOMSG%s}#G4 cái", playername, x210244_g_PlayerLevel, itemInfo)										
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)

end

--**********************************
--ÏûÏ¢ÌáÊ¾
--**********************************
function x210244_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--¶Ô»°ÌáÊ¾
--**********************************
function x210244_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
