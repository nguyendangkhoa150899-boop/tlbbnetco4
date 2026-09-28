x890096_g_ScriptId = 890096

function x890096_GetGiftsForUI( sceneId, selfId, index,idbox,iop  )

        if sceneId == 77  then
	    x890096_Tips( sceneId, selfId,"µØ¸®½ûÖ¹Ê¹ÓÃ´Ë¹¦ÄÜ")
		return
	end

	if index == nil or index <0 then
		return
	end
	
if index == 10 then  --É¨µ´
g_FuBens[1] = {"Túc C¥u"		,90		,30501354		,1		,1			,MD_CUJU_PRE_TIME				,0							,10					,1							,500000}
g_FuBens[2] = {"Trân lung KÏ cuµc"	,90		,30501354		,1		,3			,MD_LAST_QIJU_DAY				,0							,10					,2							,500000}
g_FuBens[3] = {"Thüy Lao"		,90		,30501354		,1		,-1			,MD_SHUILAO_HUAN				,MD_SHUILAO_DAYCOUNT		,10					,3							,500000}
g_FuBens[4] = {"Lâu Lan t¥m bäo"	,90		,30501354		,1		,1			,MD_SEEK_TREASURE				,0							,10					,4							,500000}
g_FuBens[5] = {"Phiªu Mi¬u Phong"		,90		,30501354		,1		,3			,MD_PIAOMIAOFENG_LASTTIME		,0							,10					,5							,500000}
g_FuBens[6] = {"Thiªu Th¤t s½n"		,90		,30501354		,1		,3			,MD_SHUANGXIANGPAO_LASTTIME		,0							,10					,6							,500000}
g_FuBens[7] = {"Tô Châu ba hoàn"		,90		,30501354		,1		,10			,MD_XINSANHUAN_1_DAYTIME		,0							,10					,7							,500000}
g_FuBens[8] = {"Lâu Lan Tam hoàn"		,90		,30501354		,1		,10			,MD_ROUNDMISSION1_TIMES			,0							,10					,8							,500000}
g_FuBens[9] = {"TÑ tuy®t trang"		,90		,30501354		,1		,3			,MD_SPRING07DENGMI_DAYTIME		,0							,10					,9							,500000}
g_FuBens[10] = {"Yªn TØ ‘"	,90		,30501354		,1		,3			,MD_YANZIWU_TIMES				,MD_PRE_YANZIWU_TIME		,10					,10							,500000}
g_FuBens[11] = {"Binh thánh kÏ tr§n"	,90		,30501354		,1		,3			,MD_YURENJIE_LASTTIME			,0							,10					,11							,500000}
	
		
	BeginUICommand( sceneId )
	    for i=1 , 11 do
                UICommand_AddInt( sceneId, mod(GetMissionData(sceneId,selfId,g_FuBens[i][6]),100) )
	    end
	    UICommand_AddInt( sceneId,GetMissionData( sceneId, selfId, FUBEN_SDDS))--É¨µ´µãÊý

	    EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,2015101902 )	
     return	
end		
	
	
if index == 20 then  --µÈ¼¶
BeginUICommand( sceneId )	
local allfirstplayer = GetPaiming(sceneId,4)
for i = 1,10 do
if allfirstplayer[i] == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].Guid == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].mynowLevel == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end	
if allfirstplayer[i].mymenpai == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai=""}
end
if allfirstplayer[i].mysex == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai="không",mysex="không"}
end	
	UICommand_AddString( sceneId, allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	end
	UICommand_AddString( sceneId, " Cån cÑ theo bäng xªp hÕng tñ ðµng 3 ngß¶i ðÑng v¸ trí ð¥u tiên có th¬ lính thß·ng tß½ng Ñng v¾i các ph¥n quà ")
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20160711 )--2015101901
	return	
	end	
	
if index == 21 then  --³äÖµ
BeginUICommand( sceneId )	
local allfirstplayer = GetPaiming(sceneId,1)
for i = 1,10 do
if allfirstplayer[i] == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].Guid == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].mynowLevel == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end	
if allfirstplayer[i].mymenpai == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai=""}
end	
if allfirstplayer[i].mysex == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai="không",mysex="không"}
end	
	UICommand_AddString( sceneId, allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	end
	UICommand_AddString( sceneId, "Cån cÑ theo bäng xªp hÕng tñ ðµng 3 ngß¶i ðÑng v¸ trí ð¥u tiên có th¬ lính thß·ng tß½ng Ñng v¾i các ph¥n quà")
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20160712 )
	return	
end		
if index == 22 then  --À®°È
BeginUICommand( sceneId )	
local allfirstplayer = GetPaiming(sceneId,5)
for i = 1,10 do
if allfirstplayer[i] == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].Guid == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].mynowLevel == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end	
if allfirstplayer[i].mymenpai == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai=""}
end	
if allfirstplayer[i].mysex == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai="không",mysex="không"}
end	
	UICommand_AddString( sceneId, allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	end
	UICommand_AddString( sceneId, "Cån cÑ theo bäng xªp hÕng tñ ðµng 3 ngß¶i ðÑng v¸ trí ð¥u tiên có th¬ lính thß·ng tß½ng Ñng v¾i các ph¥n quà")
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20160713 )
	return	
end	
if index == 23 then  --ËÍ»¨
BeginUICommand( sceneId )	
local allfirstplayer = GetPaiming(sceneId,2)
for i = 1,10 do
if allfirstplayer[i] == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].Guid == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].mynowLevel == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end	
if allfirstplayer[i].mymenpai == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai=""}
end	
if allfirstplayer[i].mysex == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai="không",mysex="không"}
end	
	UICommand_AddString( sceneId, allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	end
	UICommand_AddString( sceneId, "Cån cÑ theo bäng xªp hÕng tñ ðµng 3 ngß¶i ðÑng v¸ trí ð¥u tiên có th¬ lính thß·ng tß½ng Ñng v¾i các ph¥n quà")
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20160714 )
	return	
end	
if index == 24 then  --ÊÕ»¨
BeginUICommand( sceneId )	
local allfirstplayer = GetPaiming(sceneId,6)
for i = 1,10 do
if allfirstplayer[i] == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].Guid == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].mynowLevel == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end	
if allfirstplayer[i].mymenpai == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai=""}
end	
if allfirstplayer[i].mysex == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai="không",mysex="không"}
end	
	UICommand_AddString( sceneId, allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	end
	UICommand_AddString( sceneId, "Cån cÑ theo bäng xªp hÕng tñ ðµng 3 ngß¶i ðÑng v¸ trí ð¥u tiên có th¬ lính thß·ng tß½ng Ñng v¾i các ph¥n quà")
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20160715 )
	return	
end	
if index == 25 then  --É±ÈË
BeginUICommand( sceneId )	
local allfirstplayer = GetPaiming(sceneId,3)
for i = 1,10 do
if allfirstplayer[i] == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].Guid == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end
if allfirstplayer[i].mynowLevel == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = ""}
end	
if allfirstplayer[i].mymenpai == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai=""}
end	
if allfirstplayer[i].mysex == nil then
allfirstplayer[i] = {Guid = "Tr¯ng",mynowLevel = "",mymenpai="không",mysex="không"}
end	
	UICommand_AddString( sceneId, allfirstplayer[i].Guid..","..allfirstplayer[i].mynowLevel..","..allfirstplayer[i].mymenpai..","..allfirstplayer[i].mysex..",")
	end
	UICommand_AddString( sceneId, "Cån cÑ theo bäng xªp hÕng tñ ðµng 3 ngß¶i ðÑng v¸ trí ð¥u tiên có th¬ lính thß·ng tß½ng Ñng v¾i các ph¥n quà")
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20160716 )
	return	
end	

	if index == 11 then  --Ê×´Î
	local g_Pointt = GetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU)
	local g_Pointtb = GetMissionData( sceneId, selfId, CHONG_ZHI_YILINGQI)	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId,g_Pointt)
		UICommand_AddInt( sceneId, g_Pointtb)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 8909334 )						--Ê×´Î³äÖµ	
		return
	end


	if index == 12 then  --³é½±ÌáÊ¾
	   BeginUICommand(sceneId)
	      UICommand_AddInt(sceneId, x890096_g_ScriptId);
	      UICommand_AddInt(sceneId, 36);
	      UICommand_AddString(sceneId, "GetGiftsForUI");
	      UICommand_AddString(sceneId, "#W m²i l¥n #G m· ra #W nh§n thß·ng gi¾i, c¥n #G kh¤u tr× 2000 nguyên bäo #W, m²i l¥n #G nh§n thß·ng tiêu hao 1000 nguyên bäo #W, m²i l¥n #G thay thª nh§n thß·ng gi¾i tiêu t¯n 2000 nguyên bäo #W. Ngß½i xác nh§n mu¯n ðánh m· sao?");
	      EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId, 24)
	   return
	end


	if index == 13 then  --Æí¸£
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, 0)
		UICommand_AddInt( sceneId, 3)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 890509 )	
	return
	end
	
	if index == 14 then  --VIP
	if (sceneId >= 580 and sceneId <= 585) or (sceneId >= 496 and sceneId <= 503) or (sceneId >= 573 and sceneId <= 575) or (sceneId >= 561 and sceneId <= 563)  then
	x890096_Tips( sceneId, selfId,"Xin chú ý: khi ngài · trên tr¶i Hoang C± hoàn cänh ð°, khä nång dçn ðªn bµ ph§n VIP công nång, chÑc nång, hàm ðßþc änh hß·ng"  )
        end
	local PlayerName=GetName(sceneId,selfId)
	local UUUU = GetMissionData( sceneId, selfId,CHONG_ZHI_CHONGSHU)
        if UUUU < 1 then
	   x890096_Tips( sceneId, selfId,"Ngài không phäi VIP hµi viên, không th¬ sØ døng này công nång, chÑc nång, hàm. Sung tr¸ : xÑng ðáng tr· thành VIP, có th¬ hß·ng râ´t nhiê`u ßu ðãi!"  )
		return
	end
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, UUUU)
	UICommand_AddString(sceneId,tostring("  #WCäm ½n #G"..PlayerName.."#Wðã üng hµ #GTh¥n Long Bát Bµ#r  #e6600FF#g2fff7C¤p VIP hi®n tÕi cüa các hÕ la"..UUUU.." c¤p    #e#g#W    #Y#uclick chuµt vào bi¬u tßþng có th¬ ki¬m tra các ð£c quy«n VIp các hÕ ðßþc hß·ng"))
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,20131231)
	return
	end
	
       if index == 15 then
          if idbox <1 or idbox >2 then
             return
          end
          if idbox == 1 then
	     CallScriptFunction( 000045, "MyCallScript", sceneId, selfId,1 )
          elseif idbox == 2 then
	     CallScriptFunction( 000045, "MyCallScript", sceneId, selfId,2 )
          return
          end
       end


	if index == 16 then  --Éý¼¶
	local UUUU = GetMissionData( sceneId, selfId, SHENG_JIJIANGLI)
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, UUUU)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 8909333 )	
		return
	end

	if index == 17 then  --Àí²Æ	
		CallScriptFunction( 920032, "GetGiftsForLevel", sceneId, selfId,1 )
		return
	end

	if index == 18 then  --ËÎÁÉ»ý·Ö°å
                CallScriptFunction( 300113, "XieziPaiming", sceneId, selfId)			
		return
	end
	
	if index == 19 then  --¾Û±¦ÅèUI²âÊÔ
                CallScriptFunction( 002102,"XieziDongtai",sceneId,selfId,111)
		return
	end

	if index == 35 then  --¹¤×Ê½ø¶È
                CallScriptFunction( 181000,"UK_Call_YuanBao",sceneId, selfId)
		return
	end

	if index == 36 then  --³é½±
           local zd = YuanBao(sceneId,selfId,targetId,3,0)
	   if zd < 2000 then
              x890096_Tips( sceneId, selfId,"Không dduur 2000 nguyên bäo" )	
             return
           end	
           local strun =  YuanBao(sceneId,selfId,targetId,2,2000)
	   if strun ~= 0 then
	      x890096_Tips( sceneId, selfId,"Th¤t bÕi vui lòng liên h® GM" )	
	    return
	   end
	BeginUICommand( sceneId )
	   UICommand_AddInt( sceneId, 0)
	   EndUICommand( sceneId )
	--DispatchUICommand( sceneId, selfId, 2012816 )  --Ô­°æµÄ£¬Ð«×ÓÆÁ±Î£¬ÓÐbug
	DispatchUICommand( sceneId, selfId, 2012817 )
	x890096_Tips( sceneId, selfId,"Thành công m· ra gi¾i m£t nh§n thß·ng , các hÕ b¸ tr× 2000 KNB" )	
	return
	end

	if index == 37 then  --¹¤×Ê½ø¶È
                CallScriptFunction( 002102,"ChaKanGongZiJinDu",sceneId, selfId)
		return
	end

	if index == 38 then  --Ò×ÈÝ¸ó
	   BeginUICommand( sceneId )
	   UICommand_AddInt( sceneId, selfId )
	   EndUICommand( sceneId )
	   DispatchUICommand( sceneId, selfId, 8893837)
	return
	end

        if index == 39 then
           for i=13000 ,31399 do 
               LuaFnCancelSpecificImpact(sceneId,selfId,i)
	   end
        end

	if index == 41 then  --É¨µ´
	   if GetMissionData( sceneId, selfId, FUBEN_SDDS) <100 then
		  x890096_Tips( sceneId, selfId,"Ði¬m càn quét không ðü 100" )
		return	
		end
	end

	if index == 42 then  --¾Û±¦ÅèUI×£¸£
                CallScriptFunction( 002102,"XieziDongtai",sceneId,selfId,222)
		return
	end

	if index == 43 then  --¾Û±¦ÅèUIÁìÈ¡
                CallScriptFunction( 002102,"XieziDongtai",sceneId,selfId,333)
		return
	end

if index == 40 then	 --ÅÅÃû½±Àø
if idbox <1 or idbox >6 then
   return
end

if LuaFnGetName( sceneId, selfId ) == "Tr¯ng" then
   x890096_Tips( sceneId, selfId,"Ð×ng l×a ta~"  )
  return
end
	        --local nWeek = GetTodayWeek()
	if idbox  ==1 then  --µÈ¼¶
           if GetLevel( sceneId, selfId ) < 80 then
              x890096_Tips( sceneId, selfId,"C¤p b§c chßa ðü 80"  )
              return
           end
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			¡£
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME);
	local nQuarter = mod(GetQuarterTime(),100);	
	local allfirstplayer = GetPaiming(sceneId,4)
	local name = GetName(sceneId,selfId)
	if nWeekCur ~=  nQuarter >0  then

	if allfirstplayer[1].Guid == LuaFnGetName( sceneId, selfId ) and iop ==1  then  --1Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7536) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  6,118,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,6,118)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7536, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	elseif allfirstplayer[2].Guid == LuaFnGetName( sceneId, selfId ) and iop ==2 then 	 --2Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7537) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  6,119,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,6,119)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7537, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	elseif allfirstplayer[3].Guid == LuaFnGetName( sceneId, selfId ) and iop ==3 then 		--3Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7538) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  6,120,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,6,120)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7538, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	else
	x890096_Tips( sceneId, selfId,"Xin m¶i lña ch÷n tên mình r°i b¤m nh§n thß·ng"  )	--ÕâÀïÍêÉÆ½±Àø
        return
	end
	SetMissionData(sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME, nWeekCur );	
	end	
	end	
	
	
	
	if idbox  ==2 then  --³äÖµ
           if GetMissionData( sceneId, selfId, CHONG_ZHI_ZENGD) < 2000000 then
              x890096_Tips( sceneId, selfId,"ði¬m tích lûy không ðü"  )
              return
           end
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			¡£
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME);
	local nQuarter = mod(GetQuarterTime(),100);	
	local allfirstplayer = GetPaiming(sceneId,1)
	if nWeekCur ~= nQuarter >0  then

	if allfirstplayer[1].Guid == LuaFnGetName( sceneId, selfId ) and iop == 1 then  --1Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7521) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  1,101,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,1,101)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7521, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )	

	elseif allfirstplayer[2].Guid == LuaFnGetName( sceneId, selfId ) and iop ==2 then 	 --2Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7522) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  1,102,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,1,102)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7522, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )	

	elseif allfirstplayer[3].Guid == LuaFnGetName( sceneId, selfId ) and iop ==3  then 		--3Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7523) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  1,103,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,1,103)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7523, 0)	--¸øBUFF
        x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	else
	x890096_Tips( sceneId, selfId,"Xin m¶i lña ch÷n tên mình r°i b¤m nh§n thß·ng"  )	--ÕâÀïÍêÉÆ½±Àø
        return
	end
	SetMissionData(sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME, nWeekCur );
	end	
	end	

 	
	if idbox  ==3 then  --À®°È
           if GetMissionData( sceneId, selfId, QUANQULABA) < 10 then
              x890096_Tips( sceneId, selfId,"ði¬m tích lûy không ðü "  )
              return
           end
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			¡£
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME);
	local nQuarter = mod(GetQuarterTime(),100);	
	local allfirstplayer = GetPaiming(sceneId,5)
	if nWeekCur ~=  nQuarter >0  then

	if allfirstplayer[1].Guid == LuaFnGetName( sceneId, selfId ) and iop ==1 then  --1Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7533) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  2,113,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,2,113)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7533, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )
	
	elseif allfirstplayer[2].Guid == LuaFnGetName( sceneId, selfId ) and iop ==2 then 	 --2Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7534) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  2,114,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,2,114)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7534, 0)	--¸øBUFF
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )
	
	elseif allfirstplayer[3].Guid == LuaFnGetName( sceneId, selfId ) and iop ==3  then 		--3Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7535) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  2,115,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,2,115)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7535, 0)	--¸øBUFF
        x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	else
	x890096_Tips( sceneId, selfId,"Xin m¶i lña ch÷n tên mình r°i b¤m nh§n thß·ng"  )	--ÕâÀïÍêÉÆ½±Àø
        return
	end
	SetMissionData(sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME, nWeekCur );	
	end	
	end
	
	
	if idbox  ==4 then  --ËÍ»¨
           if GetMissionData( sceneId, selfId, QUANQUSONGHUA) < 10 then
              x890096_Tips( sceneId, selfId,"ði¬m tích lûy không ðü"  )
              return
           end
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			¡£
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI4_DAYTIME);
	local nQuarter = mod(GetQuarterTime(),100);	
	local allfirstplayer = GetPaiming(sceneId,2)
	if nWeekCur ~=  nQuarter >0  then

	if allfirstplayer[1].Guid == LuaFnGetName( sceneId, selfId ) and iop ==1 then  --1Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7524) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  3,104,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,3,104)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7524, 0)	--¸øBUFF	
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )	

	elseif allfirstplayer[2].Guid == LuaFnGetName( sceneId, selfId ) and iop ==2 then 	 --2Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7525) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  3,105,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,3,105)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7525, 0)	--¸øBUFF	
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )	
	
	elseif allfirstplayer[3].Guid == LuaFnGetName( sceneId, selfId ) and iop ==3  then 		--3Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7526) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  3,106,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,3,106)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7526, 0)	--¸øBUFF	
        x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	else
	x890096_Tips( sceneId, selfId,"Xin m¶i lña ch÷n tên mình r°i b¤m nh§n thß·ng"  )	--ÕâÀïÍêÉÆ½±Àø
	   return
	end
	SetMissionData(sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI4_DAYTIME, nWeekCur );	
	end	
	end		
	
	
	
	if idbox  ==5 then  --ÊÕ»¨
           if GetMissionData( sceneId, selfId, QUANQUSHOUHUA) < 10 then
              x890096_Tips( sceneId, selfId,"ði¬m tích lûy không ðü"  )
              return
           end
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			¡£
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI5_DAYTIME);
	local nQuarter = mod(GetQuarterTime(),100);	
	local allfirstplayer = GetPaiming(sceneId,6)
	if nWeekCur ~=  nQuarter >0  then

	if allfirstplayer[1].Guid == LuaFnGetName( sceneId, selfId ) and iop ==1 then  --1Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7527) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  4,107,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,4,107)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7527, 0)	--¸øBUFF			
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )
	
	elseif allfirstplayer[2].Guid == LuaFnGetName( sceneId, selfId ) and iop ==2 then 	 --2Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7528) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  4,108,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,4,108)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7528, 0)	--¸øBUFF			
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )
	
	elseif allfirstplayer[3].Guid == LuaFnGetName( sceneId, selfId ) and iop ==3  then 		--3Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7529) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  4,109,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,4,109)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7529, 0)	--¸øBUFF		
        x890096_Tips( sceneId, selfId,"nh§n thành công"  )

	else
	x890096_Tips( sceneId, selfId,"Xin m¶i lña ch÷n tên mình r°i b¤m nh§n thß·ng"  )	--ÕâÀïÍêÉÆ½±Àø
        return
	end
	SetMissionData(sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI5_DAYTIME, nWeekCur );	
	end	
	end		
	

	if idbox  ==6 then  --É±ÈË
           if GetMissionData( sceneId, selfId, QUANQUSHAREN) < 10 then
              x890096_Tips( sceneId, selfId,"ði¬m tích lûy không ðü"  )
              return
           end
	local nWeekCur = GetWeekTime();		--µ±Ç°Ê±¼ä			¡£
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI6_DAYTIME);
	local nQuarter = mod(GetQuarterTime(),100);	
	local allfirstplayer = GetPaiming(sceneId,3)
	if nWeekCur ~=  nQuarter >0  then

	if allfirstplayer[1].Guid == LuaFnGetName( sceneId, selfId ) and iop ==1 then  --1Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7530) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  5,110,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,5,110)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7530, 0)	--¸øBUFF				
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )
	
	elseif allfirstplayer[2].Guid == LuaFnGetName( sceneId, selfId ) and iop ==2 then 	 --2Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7531) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  5,111,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,5,111)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7531, 0)	--¸øBUFF			
	x890096_Tips( sceneId, selfId,"nh§n thành công"  )
		
	elseif allfirstplayer[3].Guid == LuaFnGetName( sceneId, selfId ) and iop ==3  then 		--3Ãû
           if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId,7532) == 1 then
              x890096_Tips( sceneId, selfId,"ðã nh§n thß·ng không th¬ nh§n lÕi"  )
              return
           end
        LuaFnAwardTitle( sceneId, selfId,  5,112,24)  --°ÑÔ­À´µÄ³ÆºÅÌæ»»
	SetCurTitle(sceneId,selfId,5,112)         --¸ø³ÆºÅ	
	LuaFnDispatchAllTitle(sceneId, selfId)  --Ë¢ÐÂ¿Í»§¶Ë³ÆºÅ
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 7532, 0)	--¸øBUFF
        x890096_Tips( sceneId, selfId,"nh§n thành công"  )
	
	else
	x890096_Tips( sceneId, selfId,"Xin m¶i lña ch÷n tên mình r°i b¤m nh§n thß·ng"  )	--ÕâÀïÍêÉÆ½±Àø
        return
	end
	SetMissionData(sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI6_DAYTIME, nWeekCur );
	end	
	end		
	
	
	end	
end	



function x890096_GetGiftsForLevelUp( sceneId, selfId, nIndex )
g_ServerNew_LevelUp_Gifts = {
[1] = {10157002,38000184,38001103,30402058},
[2] = {10157003,39999901,30308059,30505079},
[3] = {10157004,38001091,38001099,38001098},
[4] = {10157005,38001106,38000185,38000185},
[5] = {10157006,30900048,38001089,38001106},                          ---------------Õâ¸öÊÇÉý¼¶ºÃÀñ
[6] = {39910004,38412001,39901003,38000186},
[7] = {39910005,38000186,30311029,38000531},
[8] = {39910006,38406001,38000401,38000398},
[9] = {39910001,30501171,30501171,38000192},
[10] = {10157001,38000184,38000184,30008012 },
[11] = {10157001,38000184,38000184,30008012 },
[12] = {10157001,38000184,38000184,30008012 },
[13] = {10157001,38000184,38000184,30008012 },
[14] = {10157001,38000184,38000184,30008012 },
[15] = {10157001,38000184,38000184,30008012 },
[16] = {10157001,38000184,38000184,30008012 },}

local CheckLev ={10,20,30,35,40,45,50,55,60,65,70,75,80,85,90,100}
local UUUU = GetMissionData( sceneId, selfId, SHENG_JIJIANGLI)	
local huiyuanbiaoz = GetMissionData( sceneId, selfId,CHONG_ZHI_CHONGSHU)
local	lev	= GetLevel( sceneId, selfId )  --µÈ¼¶
local	nam	= LuaFnGetName( sceneId, selfId )--Íæ¼ÒÃû×Ö

if nIndex >= 1 and  nIndex <= 16 then
         if nIndex > 1 then
	    if UUUU < nIndex-1 then 
	       x890096_Tips( sceneId, selfId,"trß¾c tiên nh§n thß·ng"..CheckLev[nIndex-1].." c¤p thß·ng" )
            return
	    end
	 end
	 if lev < CheckLev[nIndex] then
	    x890096_Tips( sceneId, selfId,"chßa ðü c¤p ðµ "..CheckLev[nIndex].." không th¬ nh§n" )
	 return
	 end
	 if LuaFnGetPropertyBagSpace(sceneId,selfId) < 4 or LuaFnGetMaterialBagSpace(sceneId,selfId) < 4 then
	    x890096_Tips( sceneId, selfId,"tay näi không ðü ch² Tr¯ng" )
	 return	
         end
	 if nIndex <= UUUU then
	    x890096_Tips( sceneId, selfId,"Ðã nh§n không th¬ nh§n lÕi " )
	 return
	 else
	    SetMissionData( sceneId, selfId, SHENG_JIJIANGLI,nIndex) --Õâ¸öÎªÍ¨Öª 
            for i = 1 ,getn(g_ServerNew_LevelUp_Gifts[nIndex]) do 
	         TryRecieveItem( sceneId, selfId,g_ServerNew_LevelUp_Gifts[nIndex][i], 1)--·¢½±ÀøÎïÆ·  
	    end
	    x890096_Tips( sceneId, selfId,"nh§n thß·ng thành công" )
	    BroadMsgByChatPipe(sceneId, selfId, "Chúc m×ng "..nam.."nh§n thß·ng c¤p "..CheckLev[nIndex].."thành công", 4)
	    x890096_GetGiftsForUI( sceneId, selfId, 16 )
            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0) --ÌØÐ§
	 end
end



if nIndex == 20 then
	if huiyuanbiaoz <1 then
	x890096_Tips( sceneId, selfId,"các hÕ không phäi là hµi viên" )	
		return
	end
x890096_OneKey4Slot( sceneId, selfId)
x890096_Tips( sceneId, selfId,"Không b¤m liên løc nªu không s¨ b¸ h® th¯ng khóa acc" )	
x890096_Tips( sceneId, selfId,"T¤t cä trang b¸ ðøc 4 l² thành công" )
end	


if nIndex == 21 then
   if huiyuanbiaoz <1 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
		return
	end
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGLA )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
if nLastDay == nToday and nCount >= 1 then
x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 1 l¥n" )	
	return
end	
    if LuaFnGetPropertyBagSpace( sceneId, selfId ) <2 then
	x890096_Tips( sceneId, selfId,"Tai näi không ðü ô Tr¯ng" )
	return	
    end
    for i = 1,huiyuanbiaoz do
        TryRecieveItem( sceneId, selfId, 30505107, 1)
    end
	local nData = 0
	if nLastDay ~= nToday then
		nData = SetHighWord( nData, nToday )
		nData = SetLowWord( nData, 1 )
	else
		nData = SetHighWord( nData, nToday )
		nData = SetLowWord( nData, nCount + 1 )
	end
	SetMissionData( sceneId, selfId, HUIYUANSONGLA, nData )
	x890096_Tips( sceneId, selfId,"¹§Ï²ÄúÁìÈ¡³É¹¦£¬ÄúÊÇVIP"..huiyuanbiaoz.."¼¶»áÔ±£¬Ã¿ÈÕ¿ÉÁìÈ¡"..huiyuanbiaoz.."¸öÃâ·Ñ[Ð¡À®°È]£¬ÌáÉýVIPµÈ¼¶¿ÉÁìÈ¡¸ü¶à~" )
end	

	

if nIndex == 22 then  --Áì¹¦Á¦µ¤
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
        local myhuiyuanbiaoz = huiyuanbiaoz - 1
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGDAN )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
   if nLastDay == nToday and nCount >= 1 then
        x890096_Tips( sceneId, selfId,"Ã¿ÌìÖ»¿ÉÁìÈ¡Ò»´ÎÃâ·Ñ¹¦Á¦µ¤" )	
      return
   end	
   if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	x890096_Tips( sceneId, selfId,"tay näi không ðü ô Tr¯ng" )
      return	
    end
    for i = 1,myhuiyuanbiaoz do
        TryRecieveItem( sceneId, selfId, 39999901, 1)
    end
		local nData = 0
		if nLastDay ~= nToday then
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, 1 )
		else
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, nCount + 1 )
		end
		SetMissionData( sceneId, selfId, HUIYUANSONGDAN, nData )
	x890096_Tips( sceneId, selfId,"Chúc m×ng ngài lînh thành công, ngài là VIP"..huiyuanbiaoz.."C¤p hµi viên, m²i ngày có th¬ lînh"..huiyuanbiaoz.."Cái mi­n phí [ kèn ð°ng nhö ], nâng lên VIP ðÆng c¤p có th¬ lînh càng nhi«u ~" )
	end	


if nIndex == 23 then  --Áì¾«ÆÇ
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
        local myhuiyuanbiaoz = huiyuanbiaoz - 1
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGPO )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
   if nLastDay == nToday and nCount >= 1 then
        x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 1 l¥n" )	
      return
   end	
   if LuaFnGetPropertyBagSpace( sceneId, selfId ) <2 then
	x890096_Tips( sceneId, selfId,"tay näi không ðü ô Tr¯ng" )
      return	
    end
    for i = 1,myhuiyuanbiaoz do
        TryRecieveItem( sceneId, selfId, 38000397, 1)
    end
		local nData = 0
		if nLastDay ~= nToday then
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, 1 )
		else
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, nCount + 1 )
		end
		SetMissionData( sceneId, selfId, HUIYUANSONGPO, nData )
	x890096_Tips( sceneId, selfId,"¹§Ï²ÄúÁìÈ¡³É¹¦£¬ÄúÊÇVIP"..huiyuanbiaoz.."¼¶»áÔ±£¬Ã¿ÈÕ¿ÉÁìÈ¡"..myhuiyuanbiaoz.."¸öÃâ·Ñ[ÕæÔª¾«ÆÇ]£¬ÌáÉýVIPµÈ¼¶¿ÉÁìÈ¡¸ü¶à~" )
end


if nIndex == 24 then  --Áì·üôËÓñ
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
        local myhuiyuanbiaoz = huiyuanbiaoz - 1
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGQUAN )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
   if nLastDay == nToday and nCount >= 1 then
        x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 1 l¥n" )	
      return
   end	
   if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	x890096_Tips( sceneId, selfId,"tay näi không ðü ô Tr¯ng" )
      return	
    end
    for i = 1,tonumber(myhuiyuanbiaoz*2) do
        TryRecieveItem( sceneId, selfId, 38002049, 1)
    end
		local nData = 0
		if nLastDay ~= nToday then
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, 1 )
		else
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, nCount + 1 )
		end
		SetMissionData( sceneId, selfId, HUIYUANSONGQUAN, nData )
	x890096_Tips( sceneId, selfId,"Chúc m×ng ngài lînh thành công, ngài là VIP"..huiyuanbiaoz.."C¤p hµi viên, m²i ngày có th¬ lînh"..myhuiyuanbiaoz.."Cái mi­n phí [ công lñc ðan ], nâng lên VIP ðÆng c¤p có th¬ lînh càng nhi«u ~" )
	end


if nIndex == 25 then  --ÁìÃü»êÓñ
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
        local myhuiyuanbiaoz = huiyuanbiaoz - 1
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGQIAN )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
   if nLastDay == nToday and nCount >= 1 then
        x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 1 l¥n" )	
      return
   end	
   if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	x890096_Tips( sceneId, selfId,"tay näi không ðü ô Tr¯ng" )
      return	
    end
    for i = 1,myhuiyuanbiaoz do
        TryRecieveItem( sceneId, selfId, 38002041, 1)
    end
		local nData = 0
		if nLastDay ~= nToday then
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, 1 )
		else
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, nCount + 1 )
		end
		SetMissionData( sceneId, selfId, HUIYUANSONGQIAN, nData )
	x890096_Tips( sceneId, selfId,"Chúc m×ng ngài lînh thành công, ngài là VIP"..huiyuanbiaoz.."C¤p hµi viên, m²i ngày có th¬ lînh"..myhuiyuanbiaoz.."Cái mi­n phí [ chân nguyên tinh phách ], nâng lên VIP ðÆng c¤p có th¬ lînh càng nhi«u ~" )
	end



if nIndex == 26 then  --ÁìÄýÏ¢Íè
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
        local myhuiyuanbiaoz = huiyuanbiaoz - 1
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGCHONG )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
   if nLastDay == nToday and nCount >= 1 then
        x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 1 l¥n" )	
      return
   end	
   if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	x890096_Tips( sceneId, selfId,"tay näi không ðü ô Tr¯ng" )
      return	
    end
    for i = 1,myhuiyuanbiaoz do
        TryRecieveItem( sceneId, selfId, 38002068, 1)
    end
		local nData = 0
		if nLastDay ~= nToday then
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, 1 )
		else
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, nCount + 1 )
		end
		SetMissionData( sceneId, selfId, HUIYUANSONGCHONG, nData )
	x890096_Tips( sceneId, selfId,"Chúc m×ng ngài lînh thành công, ngài là VIP"..huiyuanbiaoz.."C¤p hµi viên, m²i ngày có th¬ lînh"..tonumber(myhuiyuanbiaoz*2).."Cái mi­n phí [ Phøc Hi ng÷c ], nâng lên VIP ðÆng c¤p có th¬ lînh càng nhi«u ~" )
	end



if nIndex == 27 then  --Áì½ð²ÏË¿
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
        local myhuiyuanbiaoz = huiyuanbiaoz - 1
	local nDayCount = GetMissionData( sceneId, selfId,HUIYUANSONGMA )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
   if nLastDay == nToday and nCount >= 1 then
        x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 1 l¥n" )	
      return
   end	
   if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
	x890096_Tips( sceneId, selfId,"tay näi không ðü ô Tr¯ng" )
      return	
    end
    for i = 1,tonumber(myhuiyuanbiaoz*20) do
        TryRecieveItem( sceneId, selfId, 20310168, 1)
    end
		local nData = 0
		if nLastDay ~= nToday then
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, 1 )
		else
			nData = SetHighWord( nData, nToday )
			nData = SetLowWord( nData, nCount + 1 )
		end
		SetMissionData( sceneId, selfId, HUIYUANSONGMA, nData )
	x890096_Tips( sceneId, selfId,"Chúc m×ng ngài lînh thành công, ngài là VIP"..huiyuanbiaoz.."C¤p hµi viên, m²i ngày có th¬ lînh"..myhuiyuanbiaoz.."Cái mi­n phí [ m®nh H°n Ng÷c ], nâng lên VIP ðÆng c¤p có th¬ lînh càng nhi«u ~" )
	end


---------------30Æí¸£--------
if nIndex == 30 then
	local nDayCount = GetMissionData( sceneId, selfId, QIFUci_SUDATA )
	local nLastDay = GetHighWord( nDayCount )
	local nCount = GetLowWord( nDayCount )
	local nToday = GetDayTime()	
if lev < 50 then
   x890096_Tips( sceneId, selfId,"ðÆng c¤p không ðü" )	
   return
end		
if GetFullExp( sceneId, selfId ) == GetExp( sceneId, selfId ) then
   x890096_Tips( sceneId, selfId,"EXP ðã ðÕt t¯i ða" )	
   return	
end	
if nLastDay == nToday and nCount >= 3 then
   x890096_Tips( sceneId, selfId,"M²i ngày chï có th¬ dùng 3 l¥n" )	
   return
end	
local targetId = -1
local zd = YuanBao(sceneId,selfId,targetId,3,0)
local num = 1000
if zd < num then
x890096_Tips( sceneId, selfId,"KNB không ðü" )	
return
end	
 local strun =  YuanBao(sceneId,selfId,targetId,2,tonumber ( num))	
if strun ~= 0 then
	x890096_Tips( sceneId, selfId,"kh¤u tr× th¤t bÕi" )
	return
end	
	for i=1 ,lev do  
		LuaFnAddExp( sceneId, selfId, (lev-49)*1000)
	end
local  se = 	(lev-49)*1000*lev
	BroadMsgByChatPipe(sceneId, selfId, "#BChúc m×ng "..nam.." hao t¯n"..num.." nguyên bäo thành công c¥u phúc thu ðßþc "..tostring(se).." ði¬m kinh nghi®m", 4)
	--¸üÐÂ´ÎÊý
	local nData = 0
	if nLastDay ~= nToday then
		nData = SetHighWord( nData, nToday )
		nData = SetLowWord( nData, 1 )
	else
		nData = SetHighWord( nData, nToday )
		nData = SetLowWord( nData, nCount + 1 )
	end
	SetMissionData( sceneId, selfId, QIFUci_SUDATA, nData )
end


if nIndex == 31 then  --ËæÉíÐÄ·¨
   if huiyuanbiaoz <1 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
   DispatchXinfaLevelInfo( sceneId, selfId, selfId, GetMenPai(sceneId, selfId) );
 return
end

if nIndex == 32 then  --ËæÉí×°±¸´òÔì
   if huiyuanbiaoz <1 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
      return
   end
   suiji=random(7)
   if suiji==1 then
      yanse = tostring("#effffb8#c9f0800")
   elseif suiji==2 then
      yanse = tostring("#e6f00c7#c00ffff")
   elseif suiji==3 then
      yanse = tostring("#e6f00c7")
   elseif suiji==4 then
      yanse = tostring("#eaf0c14#Y")
   elseif suiji==5 then
      yanse = tostring("#e006699#gFF00FF")
   elseif suiji==6 then
      yanse = tostring("#G")
   elseif suiji==7 then
      yanse = tostring("#H")
   end
   BeginUICommand(sceneId)
        UICommand_AddString(sceneId,"#YCHÑc nång trang b¸")
	UICommand_AddInt( sceneId, 8)
        UICommand_AddString(sceneId,""..yanse.."Giám ð¸nh")
	UICommand_AddInt( sceneId, 322)
        UICommand_AddString(sceneId,""..yanse.."Giám ð¸nh Trùng Lâu")
	UICommand_AddInt( sceneId, 326)
        UICommand_AddString(sceneId,""..yanse.."Trang b¸ cß¶ng hóa")
	UICommand_AddInt( sceneId, 323)
        UICommand_AddString(sceneId,""..yanse.."Cß¶ng hóa quy¬n trøc")
	UICommand_AddInt( sceneId, 327)
        UICommand_AddString(sceneId,""..yanse.."Di d¶i cß¶ng hóa")
	UICommand_AddInt( sceneId, 321)
        UICommand_AddString(sceneId,""..yanse.."Kh¡c Minh")
	UICommand_AddInt( sceneId, 324)
        UICommand_AddString(sceneId,""..yanse.."Tr× Minh")
	UICommand_AddInt( sceneId, 325)
        UICommand_AddString(sceneId,""..yanse.."SØa chæa trang b¸")
	UICommand_AddInt( sceneId, 328)
     EndUICommand( sceneId )
     DispatchUICommand( sceneId, selfId,20131232)
   return
 end

if nIndex == 33 then  --ËæÉí±¦Ê¯µê
   if huiyuanbiaoz <2 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
   suiji=random(7)
   if suiji==1 then
      yanse = tostring("#effffb8#c9f0800")
   elseif suiji==2 then
      yanse = tostring("#e6f00c7#c00ffff")
   elseif suiji==3 then
      yanse = tostring("#e6f00c7")
   elseif suiji==4 then
      yanse = tostring("#eaf0c14#Y")
   elseif suiji==5 then
      yanse = tostring("#e006699#gFF00FF")
   elseif suiji==6 then
      yanse = tostring("#G")
   elseif suiji==7 then
      yanse = tostring("#H")
   end
   BeginUICommand(sceneId)
        UICommand_AddString(sceneId,"#YBäo thÕch gia công")
	UICommand_AddInt( sceneId, 8)
        UICommand_AddString(sceneId,""..yanse.."±¦Ê¯ºÏ³É")
	UICommand_AddInt( sceneId, 331)
        UICommand_AddString(sceneId,""..yanse.."±¦Ê¯µñ×Á")
	UICommand_AddInt( sceneId, 332)
        UICommand_AddString(sceneId,""..yanse.."±¦Ê¯ÈÛÁ¶")
	UICommand_AddInt( sceneId, 333)
        UICommand_AddString(sceneId,""..yanse.."±¦Ê¯×Á¿Ì")
	UICommand_AddInt( sceneId, 334)
        UICommand_AddString(sceneId,""..yanse.."±¦Ê¯ÏâÇ¶")
	UICommand_AddInt( sceneId, 335)
        UICommand_AddString(sceneId,""..yanse.."¼«ÏÞÏâÇ¶")
	UICommand_AddInt( sceneId, 336)
        UICommand_AddString(sceneId,""..yanse.."±¦Ê¯Õª³ý")
	UICommand_AddInt( sceneId, 337)
        UICommand_AddString(sceneId,""..yanse.."¼«ÏÞÕª³ý")
	UICommand_AddInt( sceneId, 338)
     EndUICommand( sceneId )
     DispatchUICommand( sceneId, selfId,20131232)
 return
end

if nIndex == 34 then  --ËæÉíÉñÆ÷´òÔì
   if huiyuanbiaoz <3 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
      return
   end
   suiji=random(7)
   if suiji==1 then
      yanse = tostring("#effffb8#c9f0800")
   elseif suiji==2 then
      yanse = tostring("#e6f00c7#c00ffff")
   elseif suiji==3 then
      yanse = tostring("#e6f00c7")
   elseif suiji==4 then
      yanse = tostring("#eaf0c14#Y")
   elseif suiji==5 then
      yanse = tostring("#e006699#gFF00FF")
   elseif suiji==6 then
      yanse = tostring("#G")
   elseif suiji==7 then
      yanse = tostring("#H")
   end
   BeginUICommand(sceneId)
        UICommand_AddString(sceneId,"#YËæÉíÉñÆ÷´òÔì")
	UICommand_AddInt( sceneId, 8)
        UICommand_AddString(sceneId,""..yanse.."ÉñÆ÷Á¶»ê")
	UICommand_AddInt( sceneId, 341)
        UICommand_AddString(sceneId,""..yanse.."ÉñÆ÷Í¨Áé")
	UICommand_AddInt( sceneId, 342)
        UICommand_AddString(sceneId,""..yanse.."ÉñÆ÷ÆõºÏ")
	UICommand_AddInt( sceneId, 343)
        UICommand_AddString(sceneId,""..yanse.."ÉÏ¹ÅÉñÆ÷½ø½×")
	UICommand_AddInt( sceneId, 344)
        UICommand_AddString(sceneId,""..yanse.."ÉÏ¹ÅÉñÆ÷ÖØÏ´")
	UICommand_AddInt( sceneId, 345)
        UICommand_AddString(sceneId,""..yanse.."ÍõÈ¨ÉýÁé")
	UICommand_AddInt( sceneId, 346)
        UICommand_AddString(sceneId,""..yanse.."ÌìµÀÉýÁé")
	UICommand_AddInt( sceneId, 347)
        UICommand_AddString(sceneId,""..yanse.."ÉýÁé½ø½×")
	UICommand_AddInt( sceneId, 348)
     EndUICommand( sceneId )
     DispatchUICommand( sceneId, selfId,20131232)
 return
end

if nIndex == 35 then  --ËæÉíÒøÐÐ²Ö¿â
   if huiyuanbiaoz <4 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end

   if sceneId ~= 0 and sceneId ~= 1 and sceneId ~= 2 and sceneId ~= 420 and sceneId ~= 186 then
	x890096_Tips( sceneId, selfId,"ËæÉí²Ö¿âÖ»ÄÜÔÚ-ÂåÑô¡¢ËÕÖÝ¡¢´óÀí¡¢Â¥À¼¡¢ÊøºÓ-³¡¾°Ê¹ÓÃ" )	
	   return
	end

   BankBegin(sceneId, selfId,selfId)
 return
end

if nIndex == 36 then  --ËæÉíÕäÊÞ´òÔì
   if huiyuanbiaoz <5 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
   suiji=random(7)
   if suiji==1 then
      yanse = tostring("#effffb8#c9f0800")
   elseif suiji==2 then
      yanse = tostring("#e6f00c7#c00ffff")
   elseif suiji==3 then
      yanse = tostring("#e6f00c7")
   elseif suiji==4 then
      yanse = tostring("#eaf0c14#Y")
   elseif suiji==5 then
      yanse = tostring("#e006699#gFF00FF")
   elseif suiji==6 then
      yanse = tostring("#G")
   elseif suiji==7 then
      yanse = tostring("#H")
   end
   BeginUICommand(sceneId)
        UICommand_AddString(sceneId,"#YËæÉíÕäÊÞ´òÔì")
	UICommand_AddInt( sceneId, 8)
        UICommand_AddString(sceneId,""..yanse.."ÕäÊÞÎïÆ·ÉÌµê")
	UICommand_AddInt( sceneId, 361)
        UICommand_AddString(sceneId,""..yanse.."²éÑ¯ÕäÊÞ³É³¤")
	UICommand_AddInt( sceneId, 362)
        UICommand_AddString(sceneId,""..yanse.."ÕäÊÞ»¹Í¯")
	UICommand_AddInt( sceneId, 363)
        UICommand_AddString(sceneId,""..yanse.."µ¥ÈË·±Ö³ÕäÊÞ")
	UICommand_AddInt( sceneId, 364)
        UICommand_AddString(sceneId,""..yanse.."ÕäÊÞ¼¼ÄÜÑ§Ï°")
	UICommand_AddInt( sceneId, 365)
        UICommand_AddString(sceneId,""..yanse.."ÕäÊÞ¼¼ÄÜÉý¼¶")
	UICommand_AddInt( sceneId, 366)
        UICommand_AddString(sceneId,""..yanse.."ÌáÉýÕäÊÞÎòÐÔ")
	UICommand_AddInt( sceneId, 367)
        UICommand_AddString(sceneId,""..yanse.."¸Ä±äÕäÊÞÐÔ¸ñ")
	UICommand_AddInt( sceneId, 368)
     EndUICommand( sceneId )
     DispatchUICommand( sceneId, selfId,20131232)
 return
end

if nIndex == 37 then  --ËæÉíÃÀÈÝ
   if huiyuanbiaoz <6 then
	x890096_Tips( sceneId, selfId,"C¤p Vip không ðü" )	
	   return
	end
   suiji=random(7)
   if suiji==1 then
      yanse = tostring("#effffb8#c9f0800")
   elseif suiji==2 then
      yanse = tostring("#e6f00c7#c00ffff")
   elseif suiji==3 then
      yanse = tostring("#e6f00c7")
   elseif suiji==4 then
      yanse = tostring("#eaf0c14#Y")
   elseif suiji==5 then
      yanse = tostring("#e006699#gFF00FF")
   elseif suiji==6 then
      yanse = tostring("#G")
   elseif suiji==7 then
      yanse = tostring("#H")
   end
   BeginUICommand(sceneId)
        UICommand_AddString(sceneId,"#YËæÉí»¯×±ÃÀÈÝ")
	UICommand_AddInt( sceneId, 8)
        UICommand_AddString(sceneId,""..yanse.."ÐÞ¸Ä·¢ÐÍ")
	UICommand_AddInt( sceneId, 371)
        UICommand_AddString(sceneId,""..yanse.."ÐÞ¸Ä·¢É«")
	UICommand_AddInt( sceneId, 372)
        UICommand_AddString(sceneId,""..yanse.."ÐÞÕûÈÝÃ²")
	UICommand_AddInt( sceneId, 373)
        UICommand_AddString(sceneId,""..yanse.."ÐÞ¸ÄÍ·Ïñ")
	UICommand_AddInt( sceneId, 374)
        UICommand_AddString(sceneId,""..yanse.."Ê±×°È¾É«")
	UICommand_AddInt( sceneId, 375)
        UICommand_AddString(sceneId,""..yanse.."Ê±×°²Ã¼ô")
	UICommand_AddInt( sceneId, 376)
        UICommand_AddString(sceneId,""..yanse.."Ê±×°µã×º")
	UICommand_AddInt( sceneId, 377)
        UICommand_AddString(sceneId,""..yanse.."ÅäÊÎÕª³ý")
	UICommand_AddInt( sceneId, 378)
     EndUICommand( sceneId )
     DispatchUICommand( sceneId, selfId,20131232)
 return
end



    if nIndex == 321 then
         BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	   DispatchUICommand(sceneId,selfId, 20130521  )
         return
     end

    if nIndex == 322 then
         BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	   DispatchUICommand( sceneId, selfId, 1001 )
         return
     end

    if nIndex == 323 then
         BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	   DispatchUICommand(sceneId,selfId, 1002  )
         return
     end

    if nIndex == 324 then
         BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	   DispatchUICommand(sceneId,selfId, 1005  )
         return
     end

    if nIndex == 325 then
         BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	   DispatchUICommand(sceneId,selfId, 1006  )
         return
     end

    if nIndex == 326 then
         BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	   DispatchUICommand(sceneId,selfId, 112233  )
         return
     end

    if nIndex == 327 then
	 BeginUICommand( sceneId )
	   UICommand_AddInt( sceneId, selfId )
           UICommand_AddInt( sceneId, 11)
           UICommand_AddInt( sceneId, 50000)---ÐèÒªµÄÇ®
	   UICommand_AddInt( sceneId, 10000000) --×°±¸¿ªÊ¼
	   UICommand_AddInt( sceneId, 20000000)  --×°±¸½áÊø
	   UICommand_AddInt( sceneId, -1)  --ÎïÆ·id
	   UICommand_AddString(sceneId,"×°±¸Ç¿»¯¡¤¾íÖá");
	   UICommand_AddString(sceneId,"#{ZBQHJ_130508_7}");
	   UICommand_AddString(sceneId,"Çë½«×°±¸·ÅÈë´Ë¿ò");
	   UICommand_AddString(sceneId,"Çë½«Ç¿»¯¾íÖá·ÅÈë´Ë¿ò");
	   EndUICommand( sceneId )
	   DispatchUICommand( sceneId,selfId,21090722)
         return
     end

    if nIndex == 328 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  UICommand_AddInt( sceneId, -1 )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 19810313 )
         return
     end

    if nIndex == 331 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 23 )
	return
    end

    if nIndex == 332 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 112236 )
	return
    end

    if nIndex == 333 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 112237 )
	return
    end

    if nIndex == 334 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 201210120 )
	return
    end

    if nIndex == 335 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 19830424 )
	return
    end

    if nIndex == 336 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 751107 )
	return
    end

    if nIndex == 337 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 27 )
	return
    end

    if nIndex == 338 then
	BeginUICommand( sceneId )
	  UICommand_AddInt( sceneId, selfId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 25702 )
	return
    end


    if nIndex == 341 then
       BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	  UICommand_AddInt(sceneId,0);
      EndUICommand(sceneId)
      DispatchUICommand(sceneId,selfId, 19831114 )
         return
     end

    if nIndex == 342 then
	BeginUICommand( sceneId )
	   UICommand_AddInt( sceneId, selfId )
           UICommand_AddInt( sceneId, 5)
    	   UICommand_AddInt( sceneId, 50000)---ÐèÒªµÄÇ®
	   UICommand_AddInt( sceneId, 10300006) --×°±¸¿ªÊ¼
	   UICommand_AddInt( sceneId, 10307023)  --×°±¸½áÊø
	   UICommand_AddInt( sceneId, 30505816)  --ÎïÆ·id
	   UICommand_AddString(sceneId,"ÉñÆ÷Í¨Áé");
	   UICommand_AddString(sceneId,"#{SQSX_120806_10}");
	   UICommand_AddString(sceneId,"#Y·ÅÈëÒªÍ¨ÁéµÄÉñÆ÷:");
	   UICommand_AddString(sceneId,"#Y·ÅÈë¾ÛÁéÊ¯:");
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  21090722)
         return
     end

    if nIndex == 343 then
	BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,1);
	  EndUICommand(sceneId )
	  DispatchUICommand(sceneId,selfId, 201208093)
         return
     end

    if nIndex == 344 then
	BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	UICommand_AddInt(sceneId,1);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 19831114 )
         return
     end

    if nIndex == 345 then
       BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
        UICommand_AddInt( sceneId, 1)
    	UICommand_AddInt( sceneId, 800000)---ÐèÒªµÄÇ®
	UICommand_AddInt( sceneId, 10300401) --×°±¸¿ªÊ¼
	UICommand_AddInt( sceneId, 10307041)  --×°±¸½áÊø
	UICommand_AddInt( sceneId, 30505813)  --ÎïÆ·id
	UICommand_AddString(sceneId,"ÉÏ¹ÅÉñÆ÷ÖØÏ´");
	UICommand_AddString(sceneId,"    #YÈç¹ûÄã¶Ô#GÉÏ¹ÅÉñÆ÷#YµÄÊôÐÔ²»ÂúÒâ£¬¿ÉÒÔÀ´ÎÒÕâÀï½øÐÐÖØÏ´¡£Ã¿´ÎÖØÏ´ÐèÒªÏûºÄ#GÄ§ÑªÊ¯#YÒ»Ã¶¡£ÖØÏ´Ö®ºó£¬ÓÐ¼¸ÂÊµÃµ½ÊôÐÔ¸üÇ¿´óµÄÉÏ¹ÅÉñÆ÷¡£#r    #YÉÏ¹ÅÉñÆ÷ÖØÏ´Ö®ºó£¬¿ÉÄÜ»áÔì³É¸½ÌåÍâ¹Û¸Ä±ä£¬¿ÉÒÔÊ¹ÓÃ»Ã»êµ¤¶ÔÆäÖØÐÂ»Ã»ê¼´¿É¡£#r    #cFF0000×¢Òâ£º#RÎÒÕâÀïÖ»ÄÜÖØÏ´ÉÏ¹ÅÉñÆ÷£¬ÆÕÍ¨ÉñÆ÷¿ÉÍ¨¹ýÁ¶»êÖØÖÃÊôÐÔ¡£");
	UICommand_AddString(sceneId,"#Y·ÅÈëÒªÖØÏ´µÄÉñÆ÷:");
	UICommand_AddString(sceneId,"#YÇë·ÅÈëÄ§ÑªÊ¯:");
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  21090722)
      return
     end

    if nIndex == 346 then
	BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,selfId);
	EndUICommand(sceneId )
	DispatchUICommand(sceneId,selfId, 201708093)
         return
     end

    if nIndex == 347 then
	BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	DispatchUICommand(sceneId,selfId, 201708097)
        return
     end

    if nIndex == 348 then
	BeginUICommand(sceneId)
	   UICommand_AddInt(sceneId,selfId);
	   EndUICommand(sceneId )
	DispatchUICommand(sceneId,selfId, 20170526)
        return
     end

    if nIndex == 361 then
       DispatchNoNpcShopItem( sceneId, selfId, 225 )  --225ºÅÕäÊÞÔÓ»õµê
       return
    end

    if nIndex == 362 then
	BeginUICommand( sceneId )
		--UICommand_AddInt( sceneId, selfId )
		UICommand_AddInt( sceneId, 6 )				--ÕäÊÞ²éÑ¯·ÖÖ§
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 3 )	--µ÷ÓÃÕäÊÞ½çÃæ
       return
    end

    if nIndex == 363 then
	BeginUICommand( sceneId )
		--UICommand_AddInt( sceneId, selfId )
		UICommand_AddInt( sceneId, 2 )				--ÕäÊÞ»¹Í¯·ÖÖ§
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 3 )	--µ÷ÓÃÕäÊÞ½çÃæ
       return
    end

    if nIndex == 364 then
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )    --µ¥ÈË·±Ö³
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 150 )
       return
    end

    if nIndex == 365 then
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);	--µ÷ÓÃÐÂ°æÕäÊÞ¼¼ÄÜÑ§Ï°½çÃæ UI 223
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 223)
       return
    end

    if nIndex == 366 then
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 19823 )	--µ÷ÓÃÕäÊÞ¼¼ÄÜÉý¼¶½çÃæ
       return
    end

    if nIndex == 367 then
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )    --¸ù¹Çµ¤ÌåÎò
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19820425 )
       return
    end

    if nIndex == 368 then
	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, selfId);      --¸Ä±äÐÔ¸ñ
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 800108);
       return
    end

    if nIndex == 371 then
       CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, selfId )
     return
    end

    if nIndex == 372 then
       CallScriptFunction( 801011, "OnEnumerate",sceneId, selfId, selfId )
     return
    end

    if nIndex == 373 then
       CallScriptFunction( 805029, "OnEnumerate",sceneId, selfId, selfId )
     return
    end

    if nIndex == 374 then
       CallScriptFunction( 805030, "OnEnumerate",sceneId, selfId, selfId )
     return
    end

    if nIndex == 375 then
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  0910281)
     return
    end

    if nIndex == 376 then
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  2015043098)
     return
    end

    if nIndex == 377 then
	BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,selfId);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 2015050199 )	
     return
    end

    if nIndex == 378 then
	BeginUICommand(sceneId)
	UICommand_AddInt(sceneId,selfId);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 20170828 )
     return
    end
end

--*************************************************
--ÆÁÄ»ÖÐ¼ä¶Ô»°ÌáÊ¾
--*************************************************
function x890096_Tips( sceneId, selfId,msg )
BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--*************************************************
--Ò»¼ü´ò¿×
--*************************************************
function x890096_OneKey4Slot( sceneId, selfId)
    local tEquipGemTable = {0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,17,18} --8ºÅ×øÆï¡¢16ºÅÊ±×°²»¿ª¿×£¬·Â¹Ù
    local bagbegin = GetBasicBagStartPos(sceneId, selfId)
    local bagend = GetBasicBagEndPos(sceneId, selfId)
    for i = 0,10 do
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )	
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )	
				local find = 0
				for j, gem in tEquipGemTable do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )	
					local ret = AddBagItemSlot( sceneId, selfId, i )
					local ret1 = AddBagItemSlotFour( sceneId, selfId, i )  --4¿Õ²»¿ª
					equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )
				end
			end
		end
	end
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
end


function x890096_OneKeyxiuLI( sceneId, selfId)
    local bagbegin = GetBasicBagStartPos(sceneId, selfId)
    local bagend = GetBasicBagEndPos(sceneId, selfId)	
	for i=bagbegin, bagend do
		
		DoHighRepair( sceneId, selfId, i, 10)
	end
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
end
