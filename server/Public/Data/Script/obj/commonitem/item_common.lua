--ÎïÆ·¹«ÓÃ½Å±¾

x330000_g_scriptId = 330000;

--**********************************
--È¼·ÅÑÌ»¨µÄÊ±ºòÍæ¼ÒÓÐ¼¸ÂÊ»ñµÃÒ»¿Å±¦Ê¯
--**********************************
x330000_g_yianHuaBaoshi_dropRate_cur = 25;		--Íæ¼ÒÔÚÈ¼·ÅÑÌ»¨µÄÊ±ºò£¬ÓÐ2.5£¥µÄ¼¸ÂÊ»ñµÃÒ»¿Å±¦Ê¯¡£
x330000_g_yianHuaBaoshi_dropRate_max = 1000;

x330000_g_yianHuaBaoshi_gems = {{gemId=50101001, rate=25},
							{gemId=50101002, rate=25},
							{gemId=50111001, rate=25},
							{gemId=50111002, rate=25}
						};

function x330000_YianhuaDuihuanBaoshi(sceneId, selfId)
	local randValue = random(x330000_g_yianHuaBaoshi_dropRate_max);
	if randValue <= x330000_g_yianHuaBaoshi_dropRate_cur then
		local gemTemp;
		local totalRate = 0;
		for _, gemTemp in x330000_g_yianHuaBaoshi_gems do
			totalRate = totalRate + gemTemp.rate;
		end
		
		local gemRandValue = random(totalRate);
		for _, gemTemp in x330000_g_yianHuaBaoshi_gems do
			if gemRandValue <= gemTemp.rate then
				BeginAddItem(sceneId);
				AddItem(sceneId, gemTemp.gemId, 1);
				ret = EndAddItem(sceneId, selfId);
				if ret > 0 then
					AddItemListToHuman(sceneId, selfId);
					
					--»ñµÃÎïÆ·ÐÅÏ¢
	        local ItemInfo = GetItemTransfer(sceneId,selfId,0)

					local message;
					local randMessage = random(3);
					if randMessage == 1 then
						message = format("#W#{_INFOUSR%s}#Itrong lúc b¡n pháo hoa, không c¦n th§n b¸ pháo hoa b¡n ra 1 viên #cB3DB35#{_INFOMSG%s}#I trúng vào m£t.", LuaFnGetName(sceneId, selfId), ItemInfo);
					elseif randMessage == 2 then
						message = format("#W#{_INFOUSR%s}#Iðã b¡n hªt pháo hoa nhßng trong lòng vçn chßa thöa mãn, trong lúc b½i xác pháo, b²ng nhiên phát hi®n 1 viên #cB3DB35#{_INFOMSG%s}#I.", LuaFnGetName(sceneId, selfId), ItemInfo);
					else
						message = format("#W#{_INFOUSR%s}#Iphát hi®n 1 cái pháo hoa höng, chu¦n b¸ vÑt bö thì trong pháo hoa l°i ra 1 viên #cB3DB35#{_INFOMSG%s}#I.", LuaFnGetName(sceneId, selfId), ItemInfo);
					end
					BroadMsgByChatPipe(sceneId, selfId, message, 4);
				end
				return
			end
			gemRandValue = gemRandValue - gemTemp.rate;
		end
	end
end
