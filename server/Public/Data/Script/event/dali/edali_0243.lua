-- 210243
-- Òø°¨Ñ©Ô­¶Ò»»Ê±×°

x210243_g_ScriptId = 210243

x210243_g_ItemId = {
										{mp=0,Item=10124009,mpname="Phái Thiªu Lâm"},
										{mp=1,Item=10124010,mpname="Phái Minh Giáo"},
										{mp=2,Item=10124011,mpname="Phái Cái Bang"},
										{mp=4,Item=10124012,mpname="Phái Nga My"},
										{mp=3,Item=10124013,mpname="Phái Võ Ðang"},
										{mp=5,Item=10124014,mpname="Phái Tinh Túc"},
										{mp=7,Item=10124015,mpname="Phái Thiên S½n"},
										{mp=8,Item=10124016,mpname="Phái Tiêu Dao"},
										{mp=6,Item=10124017,mpname="Phái Thiên Long"},
										{mp=9,Item=0},
										{mp=10,Item=10124198,mpname="Mµ Dung"},
}

x210243_g_Stone = {id=30505122, num=20} --°ó¶¨µÄ
x210243_g_Stone2 = {id=30505135, num=20} --Ã»°ó¶¨µÄ

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x210243_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end
function x210243_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId, "#YNh§n lînh cao c¤p th¶i trang môn phái" );
			AddText(sceneId, "  Có 1 v¸ læ hành gia ðã phát hi®n 1 cách kinh ngÕc, trên Ngân Ngai Tuyªt Nguyên có 1 s¯ quái v§t trên ngß¶i mang theo bí m§t cüa #Yquy¬n nh§t ký cüa quái v§t#W. Nªu các hÕ có th¬ giúp h¡n tìm 20 quy¬n #YNh§t ký cüa quái v§t#W, là s¨ nh§n ðßþc 1 món cao c¤p th¶i trang môn phái.#r sao ðây, các hÕ có mu¯n ð±i không?" );
			AddNumText(sceneId, x210243_g_ScriptId,"Ð±i", 8, 3);
			AddNumText(sceneId, x210243_g_ScriptId,"HuÖ", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if GetNumText() == 3   then
		BeginEvent(sceneId)
			AddText(sceneId, "#YNh§n lînh cao c¤p th¶i trang môn phái" );
			AddText(sceneId, "  Có 1 v¸ læ hành gia ðã phát hi®n 1 cách kinh ngÕc, trên Ngân Ngai Tuyªt Nguyên có 1 s¯ quái v§t trên ngß¶i mang theo bí m§t cüa #Yquy¬n nh§t ký cüa quái v§t#W. Nªu các hÕ có th¬ giúp h¡n tìm 20 quy¬n #YNh§t ký cüa quái v§t#W, là s¨ nh§n ðßþc 1 món cao c¤p th¶i trang môn phái.#r sao ðây, các hÕ có mu¯n ð±i không?" );
			AddNumText(sceneId, x210243_g_ScriptId,"Ð±i", 8, 8);
			AddNumText(sceneId, x210243_g_ScriptId,"HuÖ", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if GetNumText()  == 8 then                   --ÌáÉý ±ù µÈ¼¶
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 30505135)
            if c0 >=20 then
					LuaFnDelAvailableItem(sceneId,selfId,30505135,20)--É¾³ýÎïÆ·
					local DVP = TryRecieveItem( sceneId, selfId, 10124198, 1)--¸øÓèÎïÆ·				
		            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
                    x210243_NotifyFailTips(sceneId, selfId, "Chúc m×ng bÕn hþp thành công")
						local	szTranItm1	= GetBagItemTransfer( sceneId, selfId, DVP )
						local szMsg = format( "#{_INFOUSR%s} sØ døng#G20 quy¬n nh§t ký qoái v§t#Pð±i ðßþc cao c¤p th¶i trang môn phái#P! Chúc m×ng! Chúc M×ng! Chúc M×ng!  #{_INFOMSG%s}",LuaFnGetName( sceneId, selfId ), szTranItm1)
						AddGlobalCountNews( sceneId, szMsg )
             else
			 BeginEvent( sceneId ) 
					strText = "#GVui Lòng Kiªm tra lÕi nh§t ký quoái v§t không khóa"
					AddText( sceneId, strText )
			EndEvent( sceneId )
             DispatchEventList( sceneId, selfId, targetId )
	       end
		   
	end
	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 3   then
		-- 0£¬¿´Íæ¼ÒÊÇ²»ÊÇÓÐÕýÈ·µÄÃÅÅÉ
		local nMenpai = GetMenPai(sceneId,selfId)
		if nMenpai<0 or nMenpai>10   then
			BeginEvent(sceneId)
				AddText(sceneId, "  Các hÕ vçn chßa gia nh§p môn phái nào, chï có ð® tØ cüa cØu ðÕi môn phái m¾i có th¬ ð±i cao c¤p th¶i trang môn phái." );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 1£¬¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ×ã¹»µÄÊ¯Í·
		local HaveAllItem = 1
		if (GetItemCount(sceneId, selfId, x210243_g_Stone.id) + GetItemCount(sceneId, selfId, x210243_g_Stone2.id)) < x210243_g_Stone.num   then
			HaveAllItem = 0
		end
	
		
		if HaveAllItem == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "  Các hÕ c¥n mang 20 quy¬n Nh§t ký cüa quái v§t m¾i có th¬ ð±i cao c¤p th¶i trang môn phái." );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 2£¬¼ì²âÍæ¼ÒµÄÕâÌ×ËéÆ¬ÊÇ²»ÊÇ¶¼ÄÜ¹»É¾³ý
		local AllItemCanDelete = 1
		local Stone1_Num = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone.id)
		local Stone2_Num = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone2.id)

		if Stone1_Num+Stone2_Num < x210243_g_Stone.num   then
			AllItemCanDelete = 0
		end
		
		if AllItemCanDelete == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    Kh¤u tr× v§t ph¦m trên ngß¶i các hÕ th¤t bÕi, xin ki¬m tra lÕi phäi chång v§t ph¦m ðã b¸ khóa ho£c v§t ph¦m ðang trong trÕng thái giao d¸ch." );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		--¿Û³ýÎïÆ·Ç°»ñµÃÎïÆ·
		local	bagpos = -1
		if Stone1_Num > 0 then
		  bagpos = GetBagPosByItemSn(sceneId, selfId, x210243_g_Stone.id)
		elseif Stone1_Num == 0 and Stone2_Num > 0 then
		  bagpos = GetBagPosByItemSn(sceneId, selfId, x210243_g_Stone2.id)
		end
		
		local GemItemInfo
		if bagpos ~= -1 then
		  GemItemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
		end

		
		-- 3£¬¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ¿Õ¼ä·Å½±Àø
		local nItemId = 0
		local nMenpaiName = ""
		for i=1, 10  do
			if nMenpai == x210243_g_ItemId[i].mp  then
				nItemId = x210243_g_ItemId[i].Item
				nMenpaiName = x210243_g_ItemId[i].mpname
			end
		end
		
		if nItemId==0  then
			return
		end

	 	BeginAddItem(sceneId)
			AddItem( sceneId, nItemId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		local delret = 1
		if ret == 1  then
		--¿ªÊ¼¿Û³ýÎïÆ·
			local DeleteNum = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone.id);
			if(DeleteNum >= x210243_g_Stone.num) then
			--¿Û³ý°ó¶¨µÄ
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone.id, x210243_g_Stone.num) == 0   then
					delret = 0
				end
			elseif(DeleteNum == 0) then
			--¿Û³ýÃ»ÓÐ°ó¶¨µÄ
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone2.id, x210243_g_Stone.num) == 0   then
					delret = 0
				end
			else
			--ÏÈ¿Û³ýÃ»°ó¶¨µÄÔÙ¿Û³ý°ó¶¨µÄ
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone.id, DeleteNum) == 0   then
					delret = 0
				end
				
				DeleteNum = x210243_g_Stone.num - DeleteNum;  --»¹ÒªÉ¾³ýµÄ
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone2.id, DeleteNum) == 0   then
					delret = 0
				end
				
			end
			
			if delret == 1  then
				AddItemListToHuman(sceneId,selfId)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
				
				-- ÌáÊ¾Íæ¼Ò
				BeginEvent(sceneId)
					AddText(sceneId, "Các hÕ ðã ðÕt ðßþc" .. nMenpaiName .. "cao c¤p th¶i trang môn phái." );
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				-- ·¢ÊÀ½ç¹«¸æ
				local str = ""
				local rand = random(3)
				
				if rand == 1  then
					str = format("#PB²ng nhiên! B¥u tr¶i u ám, m÷i ngß¶i không biªt chuy®n gì, thì ra là #{_INFOUSR%s} sØ døng #G20 quy¬n #{_INFOMSG%s} #Pð±i ðßþc #G%s cao c¤p th¶i trang môn phái#P!", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				elseif rand == 2  then
					str = format("#PWoo! #{_INFOUSR%s} sØ døng #G20 quy¬n#{_INFOMSG%s} #Pð±i ðßþc#G %s cao c¤p th¶i trang môn phái#P, m£c lên ngß¶i làm ai cûng phäi nhìn 1=mµt cách ngÕc nhiên!", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				else
					str = format("#P#{_INFOUSR%s} sØ døn g#G20 quy¬n#{_INFOMSG%s} #Pð±i ðßþc#G %s cao c¤p th¶i trang môn phái#P! Chúc m×ng! Chúc M×ng! Chúc M×ng!", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				end
				
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
				
				-- ¹Ø±Õ´°¿Ú
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				return
			end
		end
		return

	end
	
	if GetNumText() == 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "#{function_help_094}" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x210243_OnEnumerate( sceneId, selfId, targetId )
	if GetMenPai(sceneId,selfId) < 9 then
	AddNumText(sceneId, x210243_g_ScriptId,"Nh§n th¶i trang cao c¤p môn phái", 6, 1);
	end
	if GetMenPai(sceneId,selfId) > 9 then
	AddNumText(sceneId, x210243_g_ScriptId,"Nh§n th¶i trang cao c¤p môn phái", 6, 3);
	end
	AddNumText(sceneId, x210243_g_ScriptId,"Gi¾i thi®u nh§n th¶i trang cao c¤p môn phái", 0, 2);

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x210243_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x210243_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--·ÅÆú
--**********************************
function x210243_OnAbandon( sceneId, selfId )
end


--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x210243_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x210243_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x210243_OnEnterZone( sceneId, selfId, zoneId )
end

