--ÇéÔµÌìÁú

--½Å±¾ºÅ
x960002_g_scriptId = 960002
x960002_g_x960002_g_szTamPhap = 0
szLuaFnGetXinFaLevel2 = 0
--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í

--**********************************
--ÊÂ¼þÁÐ±í#G´ò¿×Ç°£¬±ØÐë±£Ö¤ÉíÉÏÓÐÒ»¸ö8¼¶¾«Ìú»ò8¼¶ÃÞ²¼»ò8¼¶ÃØÒø¡£
--**********************************
function x960002_OnDefaultEvent( sceneId, selfId,targetId )
    BeginEvent(sceneId)
		AddText(sceneId,"TÕi hÕ là Mµ Dung Thanh S½n, ngß¶i truy«n thø võ h÷c Mµ Dung Gia cho các ð® tØ bän môn.")
		local mp = GetMenPai(sceneId, selfId)
		local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		
		if mp == 10  then
			AddNumText(sceneId, x960002_g_scriptId, "KÛ nång h÷c t§p",12,1)
			AddNumText(sceneId,x960002_g_scriptId, "Gi¾i thi®u tâm pháp",8,2)

		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x960002_OnEventRequest( sceneId, selfId, targetId, eventId)
	local haveMoney = x960002_MoneyDisplayChange( sceneId, selfId, GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) )
	local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
	if	GetNumText()==2	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_xinfajieshao_001}")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "  Ch÷n Bí t¸ch mu¯n nâng tâm pháp:")
			AddNumText(sceneId, x960002_g_scriptId, "Giang Nam Kiªm Quyªt",12,20)
			AddNumText(sceneId, x960002_g_ScriptId, "Sát Trß¶ng Quyªt",12,21)
			AddNumText(sceneId, x960002_g_scriptId, "Viêm Dß½ng Tâm Pháp",12,22)
			AddNumText(sceneId, x960002_g_scriptId, "Thanh Vân Bí T¸ch",12,23)
			AddNumText(sceneId, x960002_g_scriptId, "Sß½ng Lînh Kiªm Thu§t",12,24)
			AddNumText(sceneId, x960002_g_scriptId, "Tinh Nguy®t Yêu Thu§t",12,25)
			AddNumText(sceneId, x960002_g_scriptId, "Tinh Tuy«n Kiªm Ði¬n",12,26)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	end
	
	if GetNumText()==20 then
		x960002_g_szTamPhap = 64
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x960002_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GGiang Nam Kiªm Quyªt#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,200)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==21	then
		x960002_g_szTamPhap = 65
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x960002_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;			
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GSát Trß¶ng Quyªt#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,201)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==22	then
		x960002_g_szTamPhap = 66
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x960002_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GViêm Dß½ng Tâm Pháp#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,202)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText()==23	then
		x960002_g_szTamPhap = 67
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x960002_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GThanh Vân Bí T¸ch#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,203)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==24	then
		x960002_g_szTamPhap = 68
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x960002_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GSß½ng Lînh Kiªm Thu§t#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,204)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==25	then
		x960002_g_szTamPhap = 69
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x960002_g_szTamPhap)
		if szLuaFnGetXinFaLevel <= 120 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
			szmoney = szLuaFnGetXinFaLevel * 4213;
			szexp = szLuaFnGetXinFaLevel * 40;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 1;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "Quy¬n: #GTinh Nguy®t Yêu Thu§t#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
			AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,205)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==26	then
		x960002_g_szTamPhap = 70
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,70)
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
				AddText(sceneId, "Bí t¸ch: #GTinh Tuy«n Kiªm Ði¬n#W#r")
			AddText(sceneId, "#e993366Tâm pháp hi®n tÕi:              "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "#b#eDC4C18Tâm pháp tiªp theo:           "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#r#eff9900Ti«n vàng có:                     "..haveMoney)
			AddText(sceneId, "#b#YTi«n vàng c¥n:                   "..szmoney.."#-04")
			AddText(sceneId, "#ccc33ccKinh nghi®m c¥n:                "..szexp.. " Exp")
				AddNumText(sceneId, x960002_g_scriptId, "H÷c",12,206)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	

	if GetNumText() >= 200 and GetNumText() <= 216 then
		x960002_UpTamPhap( sceneId, selfId, targetId, x960002_g_szTamPhap );
	end	

end

function x960002_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x960002_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x960002_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


function x960002_UpTamPhap( sceneId, selfId, targetId, TamPhap )
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
	NeedExpUP = TamPhapHienTai * 2635;
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
	x960002_MsgBox( sceneId, selfId, "Nâng tâm pháp thành công "..TamPhapHienTai.."");
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
end

function x960002_MoneyDisplayChange( sceneId, selfId, money )
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
