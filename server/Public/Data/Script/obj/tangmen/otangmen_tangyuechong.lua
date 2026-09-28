--ÇéÔµÌìÁú

--½Å±¾ºÅ
x017506_g_scriptId = 017506
x017506_g_x017506_g_szTamPhap = 0
szLuaFnGetXinFaLevel2 = 0
--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í

--**********************************
--ÊÂ¼þÁÐ±í#G´ò¿×Ç°£¬±ØÐë±£Ö¤ÉíÉÏÓÐÒ»¸ö8¼¶¾«Ìú»ò8¼¶ÃÞ²¼»ò8¼¶ÃØÒø¡£
--**********************************
function x017506_OnDefaultEvent( sceneId, selfId,targetId )
    BeginEvent(sceneId)
		AddText(sceneId,"  Trß·ng môn sß huynh có vi®c tr÷ng ðÕi phäi làm, nhæng vi®c nh§n ð° ð® bái sß giao cho ta phø trách.")
		local mp = GetMenPai(sceneId, selfId)
		local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		
		if mp == 11  then
			--AddNumText(sceneId, x017506_g_scriptId, "KÛ nång h÷c t§p",12,1)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x017506_OnEventRequest( sceneId, selfId, targetId, eventId)
	local haveMoney = x017506_MoneyDisplayChange( sceneId, selfId, GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) )
	local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
	if	GetNumText()==2	then
		x017506_HocKinhCong(sceneId, selfId, targetId, nMenpaiPoint)
	end
	
	if	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "  Ch÷n Bí t¸ch mu¯n nâng tâm pháp:")
			AddNumText(sceneId, x017506_g_scriptId, "Tích Thiên Tên Bí Quyªt",12,20)
			AddNumText(sceneId, x017506_g_ScriptId, "QuÖ Quái Bí Quyªt",12,21)
			AddNumText(sceneId, x017506_g_scriptId, "Vô Ngã Tâm Kinh",12,22)
			AddNumText(sceneId, x017506_g_scriptId, "CØu Biªn Bí Chß½ng",12,23)
			AddNumText(sceneId, x017506_g_scriptId, "Phong Lôi TÑ ThÑc",12,24)
			AddNumText(sceneId, x017506_g_scriptId, "Ð¥y Tr¶i Hoa Vû",12,25)
			AddNumText(sceneId, x017506_g_scriptId, "Ngû Ðµc Kì Kinh",12,26)
			AddNumText(sceneId, x017506_g_scriptId, "Äo Nh§t Ði¬n Bí",12,27)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	end
	
	if GetNumText()==20 then
		x017506_g_szTamPhap = 81
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x017506_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 2213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GTích Thiên Tên Bí Quyªt#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,200)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==21	then
		x017506_g_szTamPhap = 82
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x017506_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;			
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GQuÖ Quái Bí Quyªt#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,201)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==22	then
		x017506_g_szTamPhap = 83
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x017506_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GVô Ngã Tâm Kinh#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,202)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText()==23	then
		x017506_g_szTamPhap = 84
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x017506_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GCØu Biªn Bí Chß½ng#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,203)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==24	then
		x017506_g_szTamPhap = 85
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x017506_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GPhong Lôi TÑ ThÑc#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,204)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==25	then
		x017506_g_szTamPhap = 86
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x017506_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GÐ¥y Tr¶i Hoa Vû#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,205)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==26	then
		x017506_g_szTamPhap = 87
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,87)
		if szLuaFnGetXinFaLevel <= 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "Các hÕ chßa h÷c Bí t¸ch này")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
				szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			end
			BeginEvent(sceneId)
				AddText(sceneId, "Bí t¸ch: #GNgû Ðµc Kì Kinh#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
				AddNumText(sceneId, x017506_g_scriptId, "H÷c",12,206)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	

	if GetNumText() >= 200 and GetNumText() <= 216 then
		x017506_UpTamPhap( sceneId, selfId, targetId, x017506_g_szTamPhap );
	end	

end

function x017506_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x017506_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x017506_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


function x017506_UpTamPhap( sceneId, selfId, targetId, TamPhap )
	local TamPhapHienTai = LuaFnGetXinFaLevel(sceneId,selfId,TamPhap)
	if TamPhapHienTai >= GetLevel( sceneId, selfId ) +5 then
		BeginEvent(sceneId)
			AddText(sceneId,"  ÐÆng c¤p Tâm pháp ðã ðÕt t¾i c¤p cao nh¤t. Xin nâng cao ðÆng c¤p nhân v§t")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if TamPhapHienTai >= 120 then
			TamPhapHienTai = TamPhapHienTai + 1;
	else
			TamPhapHienTai = TamPhapHienTai + 1;
	end
	NeedMoneyUP = TamPhapHienTai * 4213;
	NeedExpUP = TamPhapHienTai * 40;
	if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < NeedMoneyUP  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ngân lßþng trên ngß¶i các hÕ không ðü, vì v§y không th¬ nâng tâm pháp")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif GetExp(sceneId, selfId) <NeedExpUP then
		BeginEvent(sceneId)
			AddText(sceneId,"  Kinh nghi®m không ðü, vì v§y không th¬ nâng tâm pháp")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return

	end
	
	LuaFnSetXinFaLevel(sceneId,selfId,TamPhap,TamPhapHienTai)
	CostMoney(sceneId,selfId,NeedMoneyUP)
	AddExp(sceneId,selfId,0-NeedExpUP)
	x017506_MsgBox( sceneId, selfId, "Nâng tâm pháp thành công");
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
end

function x017506_MoneyDisplayChange( sceneId, selfId, money )
	Moneydisplay = ""
	Bronze = mod(money,100)
	Silver = (mod(money,10000) - Bronze)/100
	Gold = (money - Bronze - Silver * 100)/10000
	if Gold ~= 0 and Silver ~= 0 and Bronze ~= 0 then
		Moneydisplay = ""..Gold.."#-02"..Silver.."#-03"..Bronze.."#-04"
	elseif Gold ~= 0 and Silver ~= 0 and Bronze == 0 then
		Moneydisplay = ""..Gold.."#-02"..Silver.."#-03"
	elseif Gold ~= 0 and Silver == 0 and Bronze ~= 0 then
		Moneydisplay = ""..Gold.."#-02"..Bronze.."#-04"
	elseif Gold ~= 0 and Silver == 0 and Bronze == 0 then
		Moneydisplay = ""..Gold.."#-02"
	elseif Gold == 0 and Silver ~= 0 and Bronze ~= 0 then
		Moneydisplay = ""..Silver.."#-03"..Bronze.."#-04"
	elseif Gold == 0 and Silver ~= 0 and Bronze == 0 then
		Moneydisplay = ""..Silver.."#-03"
	elseif Gold == 0 and Silver == 0 and Bronze ~= 0 then
		Moneydisplay = ""..Bronze.."#-04"
	elseif Gold  == 0 and Silver == 0 and Bronze == 0 then
		Moneydisplay = "0#-04"
	end
	return Moneydisplay
end
