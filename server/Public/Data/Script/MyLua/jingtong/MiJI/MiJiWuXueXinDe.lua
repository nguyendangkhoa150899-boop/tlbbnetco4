--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ


--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀı:



--3570.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾

--½Å±¾ºÅ
x890101_g_scriptId = 890101 --ÁÙÊ±Ğ´Õâ¸ö,ÕæÕıÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.

--Ğ§¹ûµÄID
x890101_g_Iitemid = 38000531 --ÁÙÊ±Ğ´Õâ¸ö
x890101_Wuxuexinde = 1000
x890101_WuxuexindeMiss = ZHOUTIANWUXUEXINDE
x890101_g_wujuemijitoxingdenum = {WULIMIJIXUEJUEBOOK1,WULIMIJIXUEJUEBOOK2,WULIMIJIXUEJUEBOOK3}
--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x890101_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x890101_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x890101_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x890101_OnConditionCheck( sceneId, selfId )
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
    if   itemTblIndex ~=   x890101_g_Iitemid then
	x890101_ShowNotice( sceneId, selfId, "ÎïÆ·ÄÚ²¿´íÎó!!")
	return 0
    end
	
	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x890101_OnDeplete( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
    if   itemTblIndex ~=   x890101_g_Iitemid then
	x890101_ShowNotice( sceneId, selfId, "ÎïÆ·ÄÚ²¿´íÎó!!")
	return 0
    end
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x890101_OnActivateOnce( sceneId, selfId )
	if(-1~=x890101_g_Iitemid) then
    local Wuxuenum = GetMissionData( sceneId, selfId, x890101_WuxuexindeMiss )
	SetMissionData( sceneId, selfId,x890101_WuxuexindeMiss,Wuxuenum+x890101_Wuxuexinde )
     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0) 
      local jisumiji = mod(GetMissionData( sceneId, selfId, ZHOUTIANWUXUEJUEXUE ),1000000)
      local skillbook1 = floor(jisumiji/10000)+ 30311000
      local skillbook2 = floor(mod(jisumiji,10000)/100)+ 30311000
      local skillbook3 = mod(mod(mod(jisumiji,10000),100),100)+ 30311000
      local xiuweijinjue = 0 
      local lingwujinjuelevel = {}
             for i = 1,3 do
             xiuweijinjue = xiuweijinjue + GetMissionData( sceneId, selfId, x890101_g_wujuemijitoxingdenum[i])
             lingwujinjuelevel[i] = GetMissionData( sceneId, selfId, x890101_g_wujuemijitoxingdenum[i])
             end
      
	      BeginUICommand(sceneId)
	      UICommand_AddInt(sceneId,skillbook1)
	      UICommand_AddInt(sceneId,skillbook2)
	      UICommand_AddInt(sceneId,skillbook3)
	      UICommand_AddInt(sceneId,xiuweijinjue)
	      UICommand_AddInt(sceneId,GetMissionData( sceneId, selfId, ZHOUTIANWUXUEXINDE ))
	      UICommand_AddInt(sceneId,GetMissionData( sceneId, selfId, WULIMIJIXUEJUE_3BOOKS ))
	      for i = 1,3 do
	      UICommand_AddInt(sceneId,lingwujinjuelevel[i])
	      end
	      UICommand_AddString(sceneId,"sesefg")
	      EndUICommand(sceneId)
	      DispatchUICommand(sceneId,selfId,2013092101)
	x890101_ShowNotice( sceneId, selfId, "Chúc m×ng các hÕ gia tång "..x890101_Wuxuexinde.." ği¬m võ h÷c tâm ğ¡c!")
	end
	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x890101_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end
function x890101_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
