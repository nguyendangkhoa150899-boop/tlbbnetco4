--BOSS´ºÍíµã²¥½Å±¾

--½Å±¾ºÅ
x050044_g_ScriptId = 050044

--´ºÍíÖ÷¿Ø½Å±¾½Å±¾ºÅ....
x050044_g_MainScriptId = 050030

--ÆÕÍ¨µã²¥È¯½ÚÄ¿±í....
x050044_g_ChapterTblA = {

	[1] = { id=2,  name="Ca khúc: Hß¾ng thiên tá ngû tråm nåm"				},
	[2] = { id=3,  name="Ca khúc: Bäo v® tam hoàn"						},
	[3] = { id=5,  name="Ca khúc: Khöe mÕnh ca"								},
	[4] = { id=6,  name="Ca khúc: Chim cánh cøc vß¾ng chuy®n xßa"					},
	[5] = { id=8,  name="Ca khúc: Song chß½ng côn"								},
	[6] = { id=10, name="Ca khúc: Nh¤t kiªn chung tình"							}

}

--¸ß¼¶µã²¥È¯½ÚÄ¿±í....
x050044_g_ChapterTblB = {

	[1] = { id=2,  name="Ca khúc: Hß¾ng thiên tá ngû tråm nåm"				},
	[2] = { id=3,  name="Ca khúc:Bäo v® tam hoàn"						},
	[3] = { id=5,  name="Ca khúc: Khöe mÕnh ca"								},
	[4] = { id=6,  name="Ca khúc: Chim cánh cøc vß¾ng chuy®n xßa"					},
	[5] = { id=7,  name="Ca khúc: Cái bøng vû"								},
	[5] = { id=8,  name="Ca khúc: Song chß½ng côn"								},
	[6] = { id=10, name="Ca khúc: Nh¤t kiªn chung tình"							}
	[8] = { id=11, name="Ca khúc: Chúng ta là cñc ph¦m bäo v§t ngß¶i n¯i"	}

}

--ÆÕÍ¨µã²¥È¯ID....
x050044_g_TicketIdA = 30900046

--¸ß¼¶µã²¥È¯ID....
x050044_g_TicketIdB = 30900047


--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x050044_OnDefaultEvent( sceneId, selfId,targetId )

	local NumText = GetNumText()

	if NumText == 0	then

		--ÏÔÊ¾ÆÕÍ¨µã²¥È¯½ÚÄ¿ÁÐ±í....
		BeginEvent(sceneId)
			AddText(sceneId,"#{CWDB_20080225_02}")
			local ChapterCount = getn( x050044_g_ChapterTblA )
			for i=1, ChapterCount do
				AddNumText( sceneId, x050044_g_ScriptId, x050044_g_ChapterTblA[i].name, 6, i+100 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 1	then

		--ÏÔÊ¾¸ß¼¶µã²¥È¯½ÚÄ¿ÁÐ±í....
		BeginEvent(sceneId)
			AddText(sceneId,"#{CWDB_20080225_03}")
			local ChapterCount = getn( x050044_g_ChapterTblB )
			for i=1, ChapterCount do
				AddNumText( sceneId, x050044_g_ScriptId, x050044_g_ChapterTblB[i].name, 6, i+200 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

	if NumText > 200 then

		--Ê¹ÓÃ¸ß¼¶µã²¥È¯µã²¥½ÚÄ¿....
		x050044_DianBo( sceneId, selfId, targetId, 2, NumText - 200 )

	elseif NumText > 100 then

		--Ê¹ÓÃÆÕÍ¨µã²¥È¯µã²¥½ÚÄ¿....
		x050044_DianBo( sceneId, selfId, targetId, 1, NumText - 100 )

	end

end


--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x050044_OnEnumerate( sceneId, selfId, targetId )

--		AddNumText( sceneId, x050044_g_ScriptId, "ÆÕÍ¨µã²¥È¯µã²¥", 6, 0 )
--		AddNumText( sceneId, x050044_g_ScriptId, "¸ß¼¶µã²¥È¯µã²¥", 6, 1 )

end


--**********************************
--µã²¥Ö¸¶¨½ÚÄ¿....
--**********************************
function x050044_DianBo( sceneId, selfId, targetId, type, idx )

	--¼ì²âµ±Ç°ÊÇ·ñÔÚ²¥·Å½ÚÄ¿....
	if 1 == CallScriptFunction( x050044_g_MainScriptId, "IsChapterPlaying", sceneId ) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{CWDB_20080225_04}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	local ChapterData = nil
	if type == 1 then
		ChapterData = x050044_g_ChapterTblA[idx]
	elseif type == 2 then
		ChapterData = x050044_g_ChapterTblB[idx]
	end
	if not ChapterData then
		return
	end

	local needItemId = -1
	if type == 1 then
		needItemId = x050044_g_TicketIdA
	elseif type == 2 then
		needItemId = x050044_g_TicketIdB
	end

	local needItemName = "#{_ITEM"..needItemId.."}"
	local msgNoItem = "Ngß½i không có mang theo "..needItemName..". nên không th¬ ch÷n tiªt møc!"

	--¼ì²âÊÇ·ñÓÐµã²¥µÀ¾ß....
	if LuaFnGetAvailableItemCount(sceneId, selfId, needItemId) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--É¾³ýÇ°»ñÈ¡µÀ¾ßµÄTransfer....
	local itemPos = GetItemBagPos( sceneId, selfId, needItemId, 1 )
	if itemPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	local needItemTransfer = GetBagItemTransfer(sceneId,selfId,itemPos)

	--É¾³ýµã²¥µÀ¾ß....
	if 1 ~= LuaFnDelAvailableItem( sceneId, selfId, needItemId, 1 ) then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--µã²¥....
	CallScriptFunction( x050044_g_MainScriptId, "PlayChapter", sceneId, ChapterData.id )

	--¹«¸æ....
	local PlayerName = GetName(sceneId, selfId)
	local str
	if type == 1 then
		str = format( "#{_INFOUSR%s}#P sØ døng #{_INFOMSG%s}#P có th¬ chï ði¬m tân xuân BOSS liên hoan hµi tuy®t ðÕi bµ phân tiªt møc nga, ph¤n khích không th¬ bö qua!!", PlayerName, needItemTransfer )
	elseif type == 2 then
		str = format( "#{_INFOUSR%s}#P sØ døng #{_INFOMSG%s}#P tân xuân BOSS liên quan hµi tiªt møc tùy ý ði¬m, ph¤n khích không th¬ bö qua!!", PlayerName, needItemTransfer )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	--¹Ø±Õ¶Ô»°¿ò....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end
