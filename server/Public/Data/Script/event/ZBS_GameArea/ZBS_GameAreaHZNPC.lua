--¸öÈË»ìÕ½½Å±¾ by ¾ı·îÌì qq:137094888
--½Å±¾ºÅ
x600056_g_scriptId = 600056
x600056_g_mainscriptId = 600056
x600056_g_OutScene, x600056_g_Outx, x600056_g_Outz = 549,100,100
---x600056_g_hudongtime = {65,66} ------ÕâÀï¶¨Òå»î¶¯·¶Î§--------------------------------------------¶¨Òå»î¶¯Ê±¼äµÄ£¡£¡£¡£¡
x600056_g_hudongtime ={ {4,30},{21,30}} ------1ÕâÀï¶¨Òå»î¶¯¿ªÊ¼½áÊø·¶Î§-------------------ÈçÊÇ 7µã£¬¾ÍĞ´  {7£¬0} ²»ÒªĞ´ {07£¬00}-------------------------¶¨Òå»î¶¯Ê±¼äµÄ£¡£¡£¡£¡
x600056_g_bHuodongbiaozhi = 0  ----ÕâÀï¶¨ÒåÊÇ·ñÊÇĞÂ»î¶¯±êÖ¾
x600056_g_jifeng = {}				-- Ã¿¸öÍæ¼Ò»ı·Ö
x600056_g_HumanID = {}				-- Ã¿¸öÍæ¼ÒID
x600056_g_ActivityId = 9  ----------Ã»ÄñÓÃ£¬ÎÒÊÔ¹ı£¬²»ÄÜÓÃ»î¶¯ID
x600056_g_bEndTime = 0
x600056_g_PreTime = 0

--**********************************
--
--**********************************
function x600056_UpdateEventList( sceneId, selfId,targetId )   
        local GetHuDongTime = x600056_GetTimer(sceneId) ------µÃµ½»î¶¯Ê±¼ä
        local	nam	= LuaFnGetName( sceneId, selfId )	   		
      	BeginEvent(sceneId)		
		    AddText( sceneId, "    #P Thiên hÕ ğ® nh¤t xªp hÕng thi ğ¤u s¨ ·, m²i ngày #G"..x600056_g_hudongtime[1][1].."lúc"..x600056_g_hudongtime[1][2].."Phân #P M· ra, m²i l¥n tiªp tøc 1 Gi¶, th¡ng lşi ngß¶i ch½i có th¬ ğÕt ğßşc ğÕi lßşng Nguyên bäo a!!  " ) 
	    	AddText( sceneId, "    #W Báo danh th¶i gian vì m²i ngày"..x600056_g_hudongtime[1][1].."lúc "..x600056_g_hudongtime[1][2].."phân" )        		           
        if GetHuDongTime ==1 then
        AddNumText(sceneId,600056,"#G#b Tiªn v« chiªn ğ¤u ğ¸a ğ°",9,1) 
        else
        AddNumText(sceneId,600056,"Tiªn v« chiªn ğ¤u ğ¸a ğ°",9,1) 
        end
        AddNumText(sceneId,600056,"Nh§n l¤y chiªn ğ¤u ban thß·ng",5,2)	
        AddNumText(sceneId,600056,"HoÕt ğµng nói rõ",8,3)		
        
        if nam=="GM" then
	      AddNumText(sceneId,600056,"#cFF0000 Nhanh b¡t ğ¥u hoÕt ğµng thông cáo",6,4)		
	      AddNumText(sceneId,600056,"#cFF0000 HoÕt ğµng ğang tiªn hành thông cáo",6,5)	
	      end

	      EndEvent(sceneId)
      	DispatchEventList(sceneId,selfId,targetId)
end


function x600056_OnDefaultEvent( sceneId, selfId,targetId)
   if sceneId ==549 then
   local sceneId = 549 	  
 	 local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
   local GetHuDongTime,strart,endtime,nowtime = x600056_GetTimer(sceneId) ------µÃµ½»î¶¯Ê±¼ä  
local a = "ĞÕÃû:"..GetName(sceneId,selfId).."  Àë½áÊø»¹ÓĞ:#G"..nowtime.."#W ·ÖÖÓ"     
local b = "²ÎÕ½ÈËÊı:#G"..nHumanCount.."#WÈË#r#cFF0000ÎÂÜ°ÌáÊ¾:ÖĞÍ¾ÍË³ö½«Çå¿Õ¸öÈËÕ½¼¨#r" 
local c = "            #YÕ½¼¨ÅÅĞĞ#r"
 
local myjifen = GetMissionData( sceneId, selfId, MD_HUNZHAN_JIFEN)
local mylianzhan = GetMissionData( sceneId, selfId, MD_HUNZHAN_LIANZHAN)
local mykillnum = GetMissionData( sceneId, selfId, MD_HUNZHAN_MYKILL)
local paiming = GetMissionData( sceneId, selfId, MD_HUNZHAN_PAIMING)

local d = "¸öÈË»ı·Ö:#G"..myjifen.."·Ö    #W¸öÈËÅÅÃû#G£º"..paiming
local e = "¸öÈËÁ¬Õ¶:#G"..mylianzhan.."ÈË"
local f = "×ÜÉ±ÈËÊı:#G"..mykillnum.."ÈË#r"
BeginEvent(sceneId)
AddText( sceneId, a )
AddText( sceneId, b )
AddText( sceneId, c )
AddText( sceneId, d )
AddText( sceneId, e ) 
AddText( sceneId, f ) 

x600056_paiming( 549 )
  
for i= 1  ,nHumanCount do

           if x600056_g_jifeng[1] <	1 then
           straa = "#bÄ¿Ç°Õ½¶·ÕıÔÚ¼¤ÁÒ½øĞĞ£¬´ó¼Ò¶¼Ã»ÓĞÅÅÃû£¡ "   
           AddText( sceneId, straa ) 
           SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,0)     
           break
           end
           
           if x600056_g_jifeng[i] <	1 then
           	 SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,0)     
           	break
           end
           
           
           	           	           	           	              
          local szName = GetName( sceneId, x600056_g_HumanID[i] );           
          SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,i) 
          if i ==1 then	   
          str = "#bµÚ#cFF0000"..i.."#WÃû:#cFF0000"..szName.."  #W»ı·Ö#G£º"..x600056_g_jifeng[i].." "   
          elseif i==2 then
          str = "µÚ#cff66cc"..i.."#WÃû#cff6633:"..szName.."    #W»ı·Ö#G£º"..x600056_g_jifeng[i].." "   	
          elseif i==3 then
          str = "µÚ#cff6633"..i.."#WÃû#cff6633:"..szName.."    #W»ı·Ö#G£º"..x600056_g_jifeng[i].." "   	
          else
          str = "µÚ#G"..i.."#WÃû:"..szName.." #w»ı·Ö#G£º".. x600056_g_jifeng[i].." "   	
          end       
        	AddText( sceneId, str )
     
 end 
     

	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 
 	
 	
 	
 	
 	
 	else
	x600056_UpdateEventList( sceneId, selfId, targetId )
	end
	
	
	
 end
 
--**********************************
--
--**********************************
function x600056_OnEventRequest( sceneId, selfId, targetId, eventId)
	         local	key	= GetNumText()          
           local GetHuDongTime ,stratime, endtime,huodongjieshu = x600056_GetTimer(sceneId)
           
  -----------------------1£¬¼ì²âÂú×ãÌõ¼ş---------------------------------         
	if key == 1  then
		if LuaFnHasTeam( sceneId, selfId ) ~= 0  or LuaFnGetDRideFlag(sceneId, selfId) ~= 0  or GetLevel(sceneId, selfId) < 10  then
			x600056_BoxTip( sceneId, selfId, targetId,"ÇëÏÈÀë¿ª¶ÓÎéºóÔÙÀ´²Î¼Ó,»òÕß¿ÉÄÜÊÇÔÚË«ÈË×øÆïÏÂ£¬»òÕßÊÇÄãµÈ¼¶²»×ã10¼¶")			
			return 
		end
		
        -- 2£¬¼ì²â»î¶¯ÊÇ²»ÊÇÒÑ¾­¿ªÊ¼ÁË£¬Èç¹ûÒÑ¾­¿ªÊ¼£¬¾Í²»ÄÜÔÙ½øÈ¥ÁË
        
       
   if GetHuDongTime == 0  then
     
   if stratime  > 0  then
   x600056_BoxTip( sceneId, selfId, targetId,"ÏÖÔÚ²»ÊÇ»î¶¯Ê±¼äÅ¶£¬¾àÀë»î¶¯¿ªÆô»¹ÓĞ#G"..stratime.."#W·ÖÖÓ")		   	               
   else
   x600056_BoxTip( sceneId, selfId, targetId,"ÏÖÔÚ²»ÊÇ»î¶¯Ê±¼ä,»î¶¯Ê±¼äÒÑ¾­¹ıÈ¥ÁË#G"..endtime.."#W·ÖÖÓ£¬Äã»¹ÊÇ#GµÈÃ÷Ìì°É")		   	               
   end
   
 	 return
   end        
                         
				--------------------³õÊ¼»¯Êı¾İ-------------------------------
         SetMissionData( sceneId, selfId, MD_HUNZHAN_JIFEN,0)                                        
         SetMissionData( sceneId, selfId, MD_HUNZHAN_LIANZHAN,0)	
         SetMissionData( sceneId, selfId, MD_HUNZHAN_MYKILL,0)
         SetMissionData( sceneId, selfId, MD_HUNZHAN_PAIMING,0)
         SetMissionData( sceneId, selfId, MD_HUNZHAN_LASTPLAY,0)
         LuaFnSetCopySceneData_Param(sceneId, 1, 0);---Éè¶¨ĞÂ¸±±¾µÄ±êÖ¾
         LuaFnSetCopySceneData_Param(sceneId, 2, 0);--ÉèÖÃx600056_g_bEndTime
       	 LuaFnSetCopySceneData_Param(sceneId, 3, 0);--ÉèÖÃx600056_g_PreTime

         CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600056_g_OutScene, x600056_g_Outx, x600056_g_Outz)    
   
   elseif key == 2 then
       
            	
          if  endtime >0 and endtime  <= 60 then
            x600056_OnHuazhaniangli( sceneId, selfId, targetId )   
            return           
          elseif  GetHuDongTime == 1 then
          x600056_BoxTip( sceneId, selfId, targetId, "ÎÒËµ°É£¬ÄãÍ¦¿ÉÁ¯µÄ£¬ÄãÖªµÀÎªÉ¶²»£¿ ÔÚ»î¶¯»¹Ã»Íê¾ÍÅÜÀ´Áì½±Àø°¡£¬»ı·Ö¶¼ÇåÁãÁË°¡£¬¾àÀë½áÊøÊ±¼ä»¹ÓĞ#G"..huodongjieshu.."·ÖÖÓ ¿ì½øÈ¥°¡#W£¬»¹ÄÜ´òÒ»»á£¡" )
          else         
          x600056_BoxTip( sceneId, selfId, targetId, "ÁìÈ¡½±ÀøµÄÊ±¼äÒÑ¹ı£¬Çë»î¶¯½áÊøÒ»¸öĞ¡Ê±ÒÔÄÚÔÙÀ´ÕÒÎÒ°É¡£" )
          return           		
          end
          
    elseif key == 3 then   
         local begintime = x600056_g_hudongtime[1][1]*60+x600056_g_hudongtime[1][2]
         local endtime = x600056_g_hudongtime[2][1]*60+x600056_g_hudongtime[2][2]
         local nowtime = floor(mod((LuaFnGetCurrentTime()+28800),86400)/60)
           BeginEvent(sceneId)
           --AddText( sceneId, "#cFF0000±¾»î¶¯ÓÉGM¾ı·îÌìQQ:137094888 Ô­´´#r" )
           AddText( sceneId, "#YÉ±ÈË»ı·Ö¼ÆËã£º#r #G»ù´¡·Ö5·Ö+Á¬Õ¶XÁ¬Õ¶/4#r#Y¿ÉÒÔ¿´³ö£¬Á¬Õ¶¸ßºó»ı·ÖºÜ±äÌ¬µÄ£¡#r" )
           AddText( sceneId, "#YÉ±ÈË¿ÉÇÀÁ¬Õ¶£¬»á¸ù¾İÈËÎïÊôĞÔ×Ô¶¯ÅĞ¶ÏÇÀ¶àÉÙ£¬¶ÔÈõÊÆÍæ¼Ò¸üÓĞÀû#r" )
           AddText( sceneId, "#YËÀÍöÇå¿ÕÈ«²¿Á¬Õ¶£¬²¢µô»ı·Ö#r" )
           AddText( sceneId, "#YÔö¼ÓË¢Ğ¡ºÅÅĞ¶Ï£¬¾ßÌåÔõÃ´ÅĞ¶ÏÎÒ²»»áËµ£¬ÍÑ×°±¸Ë¢ÒÑ³É¹ıÈ¥!" ) 
         	 EndEvent(sceneId)
          DispatchEventList(sceneId,selfId,targetId)   
     elseif key == 4 then          
       local strText = format("@*;SrvMsg;SCA:#cFF0000 ÔÙ¹ı"..stratime.."·ÖÖÓ£¬¿ªÆôÌìÏÂµÚÒ»Õù°ÔÈü£¬¿ÉÔÚÕ÷Õ½´óÊ¹´¦¼Ó²Î»î¶¯~»î¶¯½áÊø£¬½«¿ÉÍ¨¹ı»ı·ÖÁìÈ¡¾Ş¶îÔª±¦£¡")			
		   BroadMsgByChatPipe(sceneId, selfId, strText, 4)         
       elseif key == 5 then    
       local strText = format("@*;SrvMsg;SCA:#cFF0000 ÌìÏÂµÚÒ»Õù°ÔÈüÕıÔÚ½øĞĞÖĞ£¬Ã»À´µÄ¿ìÀ´ £¬ÔÚÕ÷Õ½´óÊ¹´¦½øÈëÕ½³¡£¬»î¶¯½áÊø½«¿ÉÍ¨¹ı»ı·ÖÁìÈ¡¾Ş¶îÔª±¦£¡")			
		   BroadMsgByChatPipe(sceneId, selfId, strText, 4)    
              
  end
end
-------------´¦ÀíÊÇ²»ÊÇ»î¶¯Ê±¼ä------------------------------
function x600056_GetTimer(sceneId)
local begintime = x600056_g_hudongtime[1][1]*60+x600056_g_hudongtime[1][2]
local endtime = x600056_g_hudongtime[2][1]*60+x600056_g_hudongtime[2][2]
local nowtime = floor(mod((LuaFnGetCurrentTime()+28800),86400)/60)
local meikaishi = 0 ---Ã»¿ªÊ¼
local yiguo = 0   ---ÒÑ¹ıÁË
local isok = 0 
local overtime = -1 
if  begintime <= nowtime and   endtime>= nowtime  then
isok = 1
    overtime = endtime - nowtime         -------»¹ÓĞ¶àÉÙ·ÖÖÓ»î¶¯½áÊø 

elseif begintime > nowtime then
	 meikaishi = begintime - nowtime  ------Àë¶àÉÙ·ÖÖÓºó¿ªÊ¼
elseif nowtime > endtime then
	 yiguo = nowtime - endtime	  ----»î¶¯Ê±¼äÒÑ¾­½áÊø¶à¾Ã
end 

return isok,meikaishi,yiguo,overtime
end	
	-----------------------»ìÕ½Áì½±ÊÂ¼ş---------------------------
	
function x600056_OnHuazhaniangli( sceneId, selfId, targetId )	
local NowTime = GetDayTime()
local jifen = GetMissionData( sceneId, selfId, MD_HUNZHAN_JIFEN)
local paiming = GetMissionData( sceneId, selfId, MD_HUNZHAN_PAIMING)
local mykill = GetMissionData( sceneId, selfId, MD_HUNZHAN_MYKILL)
if paiming > 1000 then
x600056_BoxTip( sceneId, selfId, targetId,"ÄãÉÙÀ´ºöÓÆÎÒ£¬ÄãÒÑ¾­Áì¹ı½±ÀøÁË£¬Áì½±ÈÕÆÚÊÇ#G"..paiming.."#W£¬ÎÒ¶¼¼Ç×ÅµÄÄØ£¬ÉÙÀ´ºöÓÆÎÒ£¬±ğÒÔÎªÎÒºÃÆÛ¸º£¬Ğ¡º¢Ò»±ßÍæÈ¥")
return
end

if jifen == 0 and mykill ==0 then	
x600056_BoxTip( sceneId, selfId, targetId,"ÄúµÄ#G»ı·ÖÎªÁã#W,ÓÖ#GÃ»ÓĞÉ±ÈË#W£¬Äã¾ÍÊÇ#G»ì³ÔµÈËÀ#W°É£¬½ĞÎÒÔõÃ´¸øÄã·¢½±ÄØ£¿")
return
elseif jifen == 0 and mykill >0 then	
x600056_BoxTip( sceneId, selfId, targetId,"»¹ºÃÄã#GÉ±ÁË¼¸¸öÈË#W£¬²»È»£¬ÒÔÄãÎª#GÁãµÄ»ı·Ö#W£¬¾ÍÏñÉÏÃæÄÇÎ»»ì³ÔµÈËÀ£¬ËãÁË£¬GM·¢ÉÆĞÄ#G¸øÄã5000Ôª±¦#W²ÎÓë¹ÄÀø½±£¡")
YuanBao(sceneId,selfId,targetId,1,5000)
local message = format("#W#{_INFOUSR%s}ÔÚÌìÏÂµÚÒ»±ÈÈüÖĞÓĞ#G»ì³ÔµÈËÀ#WµÄÏÓÒÉ£¬µ«ÊÇÒ²É±ÁË¸öÈË£¬GM¿ÉÁ¯Ëû£¬¸øËû·¢ÁË#G5000Ôª±¦#W×÷Îª¹ÄÀø£¡", GetName(sceneId, selfId) );
BroadMsgByChatPipe(sceneId, selfId, message, 4);
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )
return
end
 
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )
if jifen > 1000 then
	x600056_BoxTip( sceneId, selfId, targetId,"ÄúµÄ»ı·Ö³¬¹ıGM¹æ¶¨µÄ×î´óÖµ £¬ËùÒÔÄãÃ»¶«Î÷Áì£¬ÒòÎªGM»³ÒÉÄãÓĞÎÊÌâ")
	jifen = 0 
end	
 local jiangliyuanbao = jifen*2000
 local curDayTime = GetTime2Day()
SetMissionData( sceneId, selfId, MD_HUNZHAN_JIFEN,0)                		                
SetMissionData( sceneId, selfId, MD_HUNZHAN_LIANZHAN,0)	
SetMissionData( sceneId, selfId, MD_HUNZHAN_MYKILL,0)
SetMissionData( sceneId, selfId, MD_HUNZHAN_PAIMING,curDayTime)
SetMissionData( sceneId, selfId, MD_HUNZHAN_LASTPLAY,0)

local message = format("#W#{_INFOUSR%s}ÔÚ¸öÈË»ìÕ½ÈüÖĞÓ¢ÓÂÉ±µĞ,È¡µÃÁË,µÚ#G"..paiming.."#WÃû£¬ÌØ¸øÓè #G"..jiangliyuanbao.."Ôª±¦ #W×÷Îª½±Àø", GetName(sceneId, selfId) );
BroadMsgByChatPipe(sceneId, selfId, message, 4);
YuanBao(sceneId,selfId,targetId,1,jiangliyuanbao)
x600056_BoxTip( sceneId, selfId, targetId,"¹§Ï²Äú£¬³É¹¦ÁìÈ¡½±Àø£¡#G"..jiangliyuanbao.."Ôª±¦#W,Ë³±ãËµ¾ä£¬½±ÀøÇ®¶àÇ®ÉÙÃ»´ó¹ØÏµ£¬¹Ø¼üÊÇ´ó¼ÒÍæµÄÀÖºÇ£¬#GÍæµÄ¿ªĞÄ²ÅÊÇ×îÖØÒªµÄ£¡")
end

--**********************************
--NPCÏûÏ¢
--**********************************
function x600056_BoxTip( sceneId, selfId, targetId,txt)
	BeginEvent(sceneId)
    AddText( sceneId, txt )       
	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 
end	


------------------------------------------------------------------------------------------------------
------------´¦ÀíÑ­»·³¡¾°ÊÂ¼ş--------------------------------------------------------------------------³¡¾°ÊÂ¼ş
function x600056_OnSceneTimer( sceneId, selfId )


  local bIsTime,cs1,cs2,cs3 = x600056_GetTimer(sceneId)
	local nNowTimeEX = LuaFnGetCurrentTime()
	 x600056_g_bHuodongbiaozhi = LuaFnGetCopySceneData_Param(sceneId, 1) ;  --±£´æ»î¶¯±êÖ¾
	 x600056_g_bEndTime = LuaFnGetCopySceneData_Param(sceneId, 2) ;  --µÃµ½×îºóÊ±¼ä
	 x600056_g_PreTime = LuaFnGetCopySceneData_Param(sceneId, 3) ;  --µÃµ½¹«¸æÊ±¼ä	
	 local tick = mod(x600056_g_PreTime,10)                ----Ã¿Îå·ÖÖÓ·¢Ò»¸öÅÅÃûµÄ¹«¸æ
	 local gonggao = floor(x600056_g_PreTime/10)         --------Ã¿·ÖÖÓ·¢Ò»´Î½áÊøÊ±¼äÌáĞÑ

	 
---------------ÕâÊÇ»î¶¯½áÊø30ÃëºóÊ±ºò£¬ÏòÈ«Çò·¢¹«¸æµÄ------------------
	if x600056_g_bEndTime >0  and nNowTimeEX > x600056_g_bEndTime+30    then
			-- ÏòÈ«×é·şÎñÆ÷·¢ËÍĞÂÎÅ¹«¸æ
			
		local strend = "±¾´Î»ìÕ½»î¶¯Ô²Âú½áÊø £¬ÇëÊ¤ÀûÕßÔÚ1Ğ¡Ê±Ö®ÄÚ£¬È¥´óÀí#GÕ÷Õ½´óÊ¹#cFF0000´¦Áì½±!!!"	
	  AddGlobalCountNews ( sceneId, strend )
	  x600056_g_bEndTime = 0
	  LuaFnSetCopySceneData_Param(sceneId, 2, 0);---Éè¶¨
  end
	
		-- ¼ì²âÕâ¸ö³¡¾°ÄÚÊÇ²»ÊÇÓĞÍæ¼Ò£¬Èç¹ûÃ»ÓĞ£¬Ö±½Ó·µ»Ø
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0  then
		return
	end
		
	
	if bIsTime == 1 then
		 if x600056_g_bHuodongbiaozhi ==0 then
		 	 x600056_g_bHuodongbiaozhi = 1 
		 	 LuaFnSetCopySceneData_Param(sceneId, 1, 1);---Éè¶¨ĞÂ¸±±¾µÄ±êÖ¾

		 	 ------½øĞĞ³¡¾°³õÊ¼»¯¹¤×÷-----------------
		 	 for i=1,50 do
		 	 x600056_g_jifeng[i] = 0
		 	 x600056_g_HumanID[i] = 0
		 	 end
	  end
	   
	  if x600056_g_bHuodongbiaozhi ==1 then
	   	-- »ñµÃµ±Ç°µÄÊ±¼ä
	   	
			  
			   if x600056_g_PreTime == 0    then				    
				    LuaFnSetCopySceneData_Param(sceneId, 3, cs3*10);-------¹«¸æÊ±¼ä		
			   end
	  		--- 1Ã¿¼ä¸ô5·ÖÖÓ£¬ĞèÒªÍ¨ÖªÍæ¼Òµ±Ç°ÅÅÃû£¬·¢ËÍ¸øÈ«ÊÀ½ç
			   if tick == 2 then
	  			 
	  		  	LuaFnSetCopySceneData_Param(sceneId, 3, cs3*10);			 	  					
	  			  x600056_paiming( sceneId )	  				 	  				 	  				 	  				 
	  		  for i= 1  ,nHumanNum do    
	  		         	           	           	           	              
          local szName = GetName( sceneId, x600056_g_HumanID[i] );                    
          if  x600056_g_jifeng[1] <1 then
          local message = format("#GÔÚÈ«·ş´ó»ìÕ½Èü³¡ÖĞ,#WÄ¿Ç°´ó¼Ò¶¼ÔÚ½øĞĞ×Å#GÄãËÀÎÒ»î#WµÄÕ½¶·£¬ÔİÎŞÅÅÃû£¡", szName );
          BroadMsgByChatPipe(sceneId, selfId, message, 4);	 
          	break
          end	
          
          if  x600056_g_jifeng[i] <1 then
           --- SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,0)     
          	break
          end	
          
          
          local message = format("#YÌìÏÂµÚÒ»Èü³¡ÖĞ#W£¬Ä¿Ç°ÅÅ£º#GµÚ"..i.."Ãû#WµÄÊÇ£º#{_INFOUSR%s}£¬»ı·Ö:#G ".. x600056_g_jifeng[i].."·Ö #W£¬ÆäËüÃ»ÓĞÅÅÃûÍæ¼ÒÒª¼ÓÓÍÁË", szName );
          BroadMsgByChatPipe(sceneId, selfId, message, 4);	 
         ---- SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,i)       
          end 
          elseif cs3+1 <= gonggao  then
              tick =tick+1
             LuaFnSetCopySceneData_Param(sceneId, 3, (cs3*10+tick));		
     	       for i= 0  ,nHumanNum-1 do   
     	       local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)  
             x600056_MsgBox( sceneId, nHumanId, "¾àÀë±¾´Î»î¶¯½áÊø»¹ÓĞ£º"..cs3.."·ÖÖÖ")     	       
     	       end
     	  				 								
			   end
			   
			   
			   
		 end
	end		   
	   
---------------------------»î¶¯Ê±¼äµ½ÁË-------------------------	 
	 if bIsTime == 0   then
	 		 	
	 	-------------------------------------------------------------
	 		if  x600056_g_bHuodongbiaozhi == 1   then
	 				x600056_g_bHuodongbiaozhi = 0
	 				LuaFnSetCopySceneData_Param(sceneId, 1, 0);

			  	x600056_g_bEndTime = LuaFnGetCurrentTime()			
	 			  LuaFnSetCopySceneData_Param(sceneId, 2, x600056_g_bEndTime);
	 -------------ÅÅÃû´Î----------------
	 
	         x600056_paiming( sceneId )
	  
	   
	 ------------¹«¸æ-------------------
	        for i = 1, 5 do                    	           	           	           	              
          local szName = GetName( sceneId, x600056_g_HumanID[i] );          
          if i ==1 and x600056_g_jifeng[i]>0  then	         
           AddGlobalCountNews ( sceneId, "#b¹§Ï²["..szName.."]È¡µÃÁË±¾´Î»î¶¯#cff9966µÚÒ»Ãû#cFF0000£¬ËûÔÚ½­ºşÒÑÊÇ´«ËµÖĞµÄ´æÔÚ" )          	            
          elseif i==2 and x600056_g_jifeng[i]>0 then
           AddGlobalCountNews ( sceneId, "#b #cff99cc¹§Ï²["..szName.."]È¡µÃÁË±¾´Î»î¶¯#cff9966µÚ¶şÃû #cff99cc£¬ËûÒÑ³É¾ÍÌìÏÂÎŞµĞ" )           
          elseif i==3 and x600056_g_jifeng[i]>0 then
           AddGlobalCountNews ( sceneId, "#b#G¹§Ï²["..szName.."]È¡µÃÁË±¾´Î»î¶¯#cff9966µÚÈıÃû#G£¬ËûÒÔºó¿ÉÒÔºá×Å×ßÁË" )   
          elseif i==4 and x600056_g_jifeng[i]>0 then
           AddGlobalCountNews ( sceneId, "#b#W¹§Ï²["..szName.."]#WÈ¡µÃÁË±¾´Î»î¶¯#cff9966µÚËÄÃû#G£¬ËûÒÑ³É¾ÍÎäÁÖµÄ¶¥¼â¸ßÊÖ" )   
          elseif i==5 and x600056_g_jifeng[i]>0  then
           AddGlobalCountNews ( sceneId, "#b#W¹§Ï²["..szName.."]#WÈ¡µÃÁË±¾´Î»î¶¯#cff9966µÚÎåÃû#W£¬ËûÒÀÈ»ÊÇ¸ö#GĞ¡»ì»ì" )   
          end
          end 
     
	 
	 
	 -------------ÒÆÈË-------------------
      for i=0, nHumanNum-1  do		 
        local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
      
			if LuaFnIsObjValid( sceneId, nHumanId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, nHumanId ) == 1 then
				local paiming = GetMissionData( sceneId, nHumanId, MD_HUNZHAN_PAIMING) ---ÅÅÃû
		    x600056_MsgBox( sceneId, nHumanId,"#P»î¶¯½áÊø,¹§Ï²ÄãÈ¡µÃ±¾´Î»î¶¯µÚ"..paiming.."Ãû,ÇëÔÚ»î¶¯½áÊøÒ»Ğ¡Ê±ÄÚÁì½±")
		    SetPvpAuthorizationFlagByID(sceneId, nHumanId, 2, 0) ---½â³ı¾º¼¼ÊÚÈ¨±ê¼Ç
			  CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 2, 276, 260)	
			end
      end
    else   
       for i=0, nHumanNum-1  do		 
        local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
      
			if LuaFnIsObjValid( sceneId, nHumanId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, nHumanId ) == 1 then
			 
		    x600056_MsgBox( sceneId, nHumanId,"#PÏÖÔÚ²»ÊÇ»î¶¯Ê±¼ä£¬Çë³öÃÅ×ª×óÈ¥´óÀí")
		   
			  CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 2, 276, 260)	
			end
      end
      
      
   end 
 end  
  

end



------ ×öÅÅÃû-----------
------ ----------------
function x600056_paiming( sceneId )
local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
for i=1, nHumanCount do   
  local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i-1) 
  local HumanJifen = GetMissionData( sceneId, nHumanId, MD_HUNZHAN_JIFEN) ---»ı·Ö 
    
   	 x600056_g_HumanID[i] = nHumanId  	     
     x600056_g_jifeng[i] = HumanJifen
              
end
---´óµÄÊıÍùÇ°ÃæÈÓ,×öÒ»´ÎÅÅĞò
for i = 1, nHumanCount do
       
        for j = 1, i do             
                                   
               if x600056_g_jifeng[i] > x600056_g_jifeng[j]  then
                   local temp = x600056_g_jifeng[i]
                   local tempID = x600056_g_HumanID[i]
                    x600056_g_jifeng[i] = x600056_g_jifeng[j]
                    x600056_g_HumanID[i] = x600056_g_HumanID[j]
                    x600056_g_jifeng[j] = temp
                    x600056_g_HumanID[j] = tempID
               end
       end
end  




   for i= 1  ,nHumanCount do
     if x600056_g_jifeng[i] < 1 then
 	   SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,0) 
     else
     SetMissionData( sceneId, x600056_g_HumanID[i], MD_HUNZHAN_PAIMING,i) 
     end 
   end

   
end  
  
  
  -----------------½øÈë³¡¾°ÊÂ¼ş------------------
function x600056_OnPlayerEnter( sceneId, playerId ) 
                 local playerName = LuaFnGetName( sceneId, playerId );
               	 local playerLv = GetLevel(sceneId, playerId)                   
				       RestoreHp( sceneId, playerId )
	             RestoreMp( sceneId, playerId )
	             RestoreRage( sceneId, playerId )               
	             LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 84, 0)  ---½â±äÉí
  		         SetPvpAuthorizationFlagByID(sceneId, playerId, 2, 1)   		         	
               SetUnitCampID(sceneId, playerId, playerId, playerId )
                 local x = random(80,106)				
				         local y = random(80,110)						
               SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0",sceneId ,x , y )
               
       	    BroadMsgByChatPipe(sceneId, playerId, "#ccc33ccÍæ¼Ò¡¾"..playerName.."¡¿,µÈ¼¶£º"..playerLv.."¼¶ ½øÈëÕ½³¡£¬¾¿¾¹Â¹ËÀË­ÊÖÄØ£¬ÎÒÃÇÊÔÄ¿ÒÔ´ı£¡", 4);   
       	    
end



--**********************************
--
--**********************************
function x600056_KillPlayer(sceneId, dieId, killerId)
local objType = GetCharacterType( sceneId, killerId )
if objType == 3 then
killerId = GetPetCreator(sceneId, killerId)
end

---¼ì²âÊÇ²»ÊÇÊ±¼äµ½ÁË----
if x600056_GetTimer(sceneId) ==0  then
return
end

----¼ì²âÊÇ²»ÊÇË¢µÄĞ¡ºÅ-------------------
-----------------------------------------
    local killerName = LuaFnGetName( sceneId, killerId );
    local dieName = LuaFnGetName( sceneId, dieId );
  	local killerLvl = GetLevel(sceneId, killerId)
  	local diedLvl = GetLevel(sceneId, dieId)	
    local killerhp = GetMaxHp(sceneId, killerId) ---µÃÉ±ÈËÕßµÄHP
    local diehp = GetMaxHp(sceneId, dieId)   ---µÃµ½ËÀÍöµÄHP
 	  local lastplayer = GetMissionData( sceneId, killerId, MD_HUNZHAN_LASTPLAY )	
 	  local shalastID = floor(lastplayer/100)
 	  local shacum = mod(lastplayer,100) 
 	  
 	  
if shalastID == dieId then
	  shacum = shacum+1
	  hpcha = killerhp - diehp
	     
     if diedLvl >=100 and diehp <200000 then
    	x600056_MsgBox( sceneId, killerId,"ÄãĞ¡×ÓĞĞ°¡£¬´óºÅÍÑÁËÔÚ¿ã×ÓË¢Ñ½£¿")		
    	shacum = shacum+1
      end	
    	
    	
	 if hpcha >400000  then 			 
	   x600056_MsgBox( sceneId, killerId,"Äã¾ÍÁôµãµÂ°É£¬ÃëÈË¼ÒÓĞÒâË¼£¿")		
     shacum = shacum+2  
   elseif hpcha >= 300000  then
   	 x600056_MsgBox( sceneId, killerId,"ÄãÒ²ÈÌĞÄ£¿")		
     shacum = shacum+1
    elseif hpcha >= 200000 then
    x600056_MsgBox( sceneId, killerId,"¸Ğ¾õÄãÃÇ²î¾àÓĞµã´óÑ½£¬±ğÀÏÉ±ËûÑ½£¡")		
    end 
		
		if shacum >= 8 then
		shacum = 0
		x600056_MsgBox( sceneId, killerId,"Äã¾ÍÁôµãµÂ°É£¬»¹ÖØ¸´É±Ğ¡ºÅ£¬Äã¾õµÃÄã»¹ÄÜÓĞ·ÖÂğ£¿")		
		BroadMsgByChatPipe(sceneId, killerId, "·¢ÏÖÒ»¸öË¢Ğ¡ºÅµÄ¼Ò»ï¡¾"..killerName.."¡¿ÆäĞĞÎª¼«Æä¶ñÁÓ£¬Æ·ÖÊ°Ü»µ£¬Êı´ÎË¢Ğ¡ºÅÃæ²»¸ÄÉ«£¬ÂÅÈ°²»¸Ä£¬ÌØ½øĞĞ»ı·ÖÇåÁã´¦Àí£¡", 4);    
		SetMissionData( sceneId, killerId, MD_HUNZHAN_JIFEN,0)  ---ÉèÖÃ»ı·Ö
		SetMissionData( sceneId, killerId, MD_HUNZHAN_LIANZHAN,0)  ---ÉèÖÃÉ±ÈËÕß+1
    SetMissionData( sceneId, killerId, MD_HUNZHAN_MYKILL,0)  ---ÉèÖÃÉ±ÈËÕß+1    
    SetMissionData( sceneId, killerId, MD_HUNZHAN_LASTPLAY,0)  ---ÉèÖÃÉ±ÈËÕß+1
		return 			    
	  end	
	  
	
end
	
	SetMissionData( sceneId, killerId, MD_HUNZHAN_LASTPLAY, (dieId*100+shacum) )
	 ------Èç¹û´óºÅ±»ÎÒÉ±ÁË£¬¾ÍÖØĞÂ¼ÆËãË¢Ğ¡ºÅ-----   
	if shalastID == killerId then		
	SetMissionData( sceneId, killerId, MD_HUNZHAN_LASTPLAY,0)  ---ÉèÖÃIDÇåÁã
  end
--------------------------------------------------------------------------
local dielianzhan = GetMissionData( sceneId, dieId, MD_HUNZHAN_LIANZHAN)

--------------µÃµ½É±ÈËÕßÏà¹ØÊı¾İ-----------------
local killerlianzhan = GetMissionData( sceneId, killerId, MD_HUNZHAN_LIANZHAN)
local killerkill = GetMissionData( sceneId, killerId, MD_HUNZHAN_MYKILL)
local Killerjifen0 = GetMissionData( sceneId, killerId, MD_HUNZHAN_JIFEN) 

--- Èç¹ûµÈ¼¶Ïà²î20¼¶£¬ÔòĞ¡ºÅ¾Í°Ñ´óºÅÁ¬Õ¶È«ÇÀ¹ıÀ´
--- »òÕßÈç¹û£¬¶Ô·½Á¬Õ¶´óÓÚ2£¬ÔòËæ»úÇÀÈ¥Ò»¸öÁ¬Õ¶Êı
--- »òÕß£¬Á¬Õ¶¾Í¼Ó1
if  ( diedLvl - killerLvl ) >= 20 and dielianzhan >=6 then	
	
	killerlianzhan = killerlianzhan + dielianzhan	
	 
elseif 	dielianzhan > 2  then
dielianzhan = random(2,dielianzhan)
killerlianzhan = killerlianzhan + dielianzhan
else	
killerlianzhan = (killerlianzhan + 1)
end
 
SetMissionData( sceneId, killerId, MD_HUNZHAN_LIANZHAN,killerlianzhan)  ---ÉèÖÃÉ±ÈËÕß+1
SetMissionData( sceneId, killerId, MD_HUNZHAN_MYKILL,killerkill+1)  ---ÉèÖÃÉ±ÈËÊı+1
killerjifen = x600056_jifeng( sceneId, Killerjifen0,killerlianzhan)	---»ı·Ö¼ÆËã
SetMissionData( sceneId, killerId, MD_HUNZHAN_JIFEN,(killerjifen))  ---ÉèÖÃ»ı·Ö

--------------ÉèÖÃ±»É±ÕßÏà¹ØÊı¾İ-------------
---Á¬Õ¶ÇåÁã£¬Ôö¼ÓÒ»´ÎËÀÍö

local diejifen = GetMissionData( sceneId, dieId, MD_HUNZHAN_JIFEN) 
local jianshaojifen = floor (diejifen/10)  ---ËÀÍöËğÊ§10% »ı·Ö

if jianshaojifen <3 then
	jianshaojifen = 2
end

diejifen = diejifen - jianshaojifen

if diejifen < 1 then
	diejifen = 0 
	
end
	
SetMissionData( sceneId, dieId, MD_HUNZHAN_LIANZHAN,0)  ---ËÀÍöÉèÖÃÁ¬Õ¶Çå0
SetMissionData( sceneId, dieId, MD_HUNZHAN_JIFEN,diejifen)  ---ÉèÖÃ»ı·Ö

----------------¹«¸æ´¦Àí---------------------------------
if killerlianzhan > 1  then
		
   if 	killerlianzhan == 10  then
  str = "#bÒÑÁ¬#cFF0000Õ¶É±"..killerlianzhan.."ÈË#W£¬Ò»´ú´óÏÀ¼´½«áÈÆğÁË¡£" 
elseif 	killerlianzhan == 20  then
  str = "#b#cFF0000ÒÑ¾­Á¬Õ¶"..killerlianzhan.."ÈË£¬ÒÔÆøÍÌÍòÀï½­É½Ö®ÊÆ£¬ÃëÉ±È«³¡£¬È«¶¼¸ÉÅ¿£¡£¬ÎäÁÖÃËÖ÷·ÇÄãÄªÊô" 
 elseif 	killerlianzhan == 30  then
  str = "#b#cFF0000ÒÑ¾­Á¬Õ¶"..killerlianzhan.."ÈË,´ïµ½Íò½£¹é×ÚÖ®¾³£¬ÔÙ´ÎÖ¤Ã÷RMBÍæ¼Ò¾ÍÊÇÇ¿£¬Ë­¸ÒÓëËûÕù·æ£¬¾ÍËÍÄãÒ»¸ö ËÀ ×Ö£¡"  
 elseif 	killerlianzhan == 40  then
  str = "#b#cFF0000ÒÑ¾­Á¬Õ¶"..killerlianzhan.."£¬´ïµ½ÓĞ½£Ê¤ÎŞ½£Ö®¾³ £¬GMÒÑ²»ÔÙËµ»°£¬ÒòÎªGMÒ²¸ã²»¹ıËû£¬ËûÒÑ³¬³öÅ£¶Ù¶¨Àí£¬²»ÔÚÈı½çÖ®ÄÚ"  
 else
 	str = "ÒÑÁ¬#cFF0000Õ¶É±"..killerlianzhan.."ÈË#W"
 end 
  
else
  str = " "
end

local message = format("#WÌìÏÂµÚÒ»ÅÅÃûÈüÖĞ£¬#cff9966#{_INFOUSR%s}#W·ÉÆğÒ»ÕÆ¸Éµ¹ÁË#cff9966#{_INFOUSR%s}#W"..str.."£¬Ä¿Ç°»ı·ÖÉıÖÁ£º"..killerjifen.."·Ö", killerName, dieName);
BroadMsgByChatPipe(sceneId, killerId, message, 4);

if dielianzhan < 1 then
	stra = "Á¬Õ¶Î´±»ÇÀ£¬ÒòÎªÄãÃ»ÓĞ"
	strb = "¶Ô·½ÒÑ±»´ò²Ğ,ÔİÎ´ÓĞÁ¬Õ¶"
else
	stra = "Á¬Õ¶±»ÇÀ"..dielianzhan.."µã"	
	strb = "ÇÀµ½Á¬Õ¶"..dielianzhan.."µã"
end	

x600056_MsgBox( sceneId, killerId, "ÄúÄ¿Ç°»ı·ÖÎª£º"..killerjifen.."·Ö£¬ "..strb)
x600056_MsgBox( sceneId, dieId, stra..",»ı·Ö¼õÉÙ"..jianshaojifen)
x600056_paiming( sceneId )
 
end





--**********************************
function x600056_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
	AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

---»ı·Ö´¦Àí--------
function x600056_jifeng( sceneId, shanum,lianzhan )	
  lianzhanjf =floor(lianzhan*lianzhan/4)  ---Á¬Õ¶·Ö¼ÆËã

   
   jifeng = shanum + 5+lianzhanjf ---»ù´¡·Ö¼ÓÁ¬Õ¶
  if jifeng < 0 then
  	return 0 ;
  end
	return jifeng ;
end
