--**********************************
-- Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************

x760416_g_ScriptId	= 760416

--Môn phái Tin tÑc (Môn phái Tên ,SceneID,PosX,PosY,Môn phái ID)
x760416_g_mpInfo		= {}
x760416_g_mpInfo[0]	= {"Tinh Túc", 16, 96, 152, MP_XINGSU }
x760416_g_mpInfo[1]	= {"Tiêu Dao", 14, 67, 145, MP_XIAOYAO }
x760416_g_mpInfo[2]	= {"Thiªu Lâm", 9, 96, 127, MP_SHAOLIN }
x760416_g_mpInfo[3]	= {"Thiên S½n", 17, 95, 120, MP_TIANSHAN }
x760416_g_mpInfo[4]	= {"Thiên Long", 13, 96, 120, MP_DALI }
x760416_g_mpInfo[5]	= {"Nga Mi", 15, 89, 139, MP_EMEI }
x760416_g_mpInfo[6]	= {"Võ Ðang", 12, 103, 140, MP_WUDANG }
x760416_g_mpInfo[7]	= {"Minh Giáo", 11, 98, 167, MP_MINGJIAO }
x760416_g_mpInfo[8]	= {"Cái Bang", 10, 91, 116, MP_GAIBANG }

x760416_g_Yinpiao = 40002000
--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760416_OnDefaultEvent(sceneId, selfId, targetId)

	-- Ki¬m tra ðo lß¶ng Ngß¶i ch½i Trên ngß¶i Có phäi hay không Có "Ngân phiªu "ThÑ này ,Có Li«n không th¬ SØ døng N½i này Công nång 
	if GetItemCount(sceneId, selfId, x760416_g_Yinpiao)>=1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Trên ngß¶i cüa ngß½i Có Ngân phiªu ,Ðang · Bào Thß½ng !Ngã Không th¬ giúp Trþ Ngß½i .")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	local	mp
	local	i		= 0
	BeginEvent(sceneId)
		if GetLevel(sceneId, selfId)>= 10 then
			AddText(sceneId," ÐÕi hi®p ,Lão nÕp N½i này Có th¬ vì ngß½i Truy«n t¯ng Ði ra ngoài")
			--AddText(sceneId,"#IBän ð° Ch÷n dùng Toàn bµ bän ð° ThÆng t¾i Hình thÑc Cäm tÕ ngài Duy trì .")
			--AddNumText(sceneId, x760416_g_ScriptId,"Thí nghi®m", 6, 22222)--Không có vi®c gì Bi®t Khai Cái này 
			--AddNumText(sceneId, x760416_g_ScriptId,"Thí nghi®m (Ði¬m ðánh Ðä khai)", 6, 56780)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thí nghi®m Tr÷ng lâu", 6, 222223)--Không có vi®c gì Bi®t Khai Cái này 
			--SetLevel(sceneId, selfId, 100)
			--AddNumText(sceneId, x760416_g_ScriptId,"Mãn Huyªt Mãn Nµ (Mi­n phí Tr¸ li®u)", 1, 10000)
			--AddNumText(sceneId, x760416_g_ScriptId,"Hào hi®p Công lßþc #G(Tân thü T¤t Khán)", 1, 10001)
			AddNumText(sceneId, x760416_g_ScriptId,"Phän h°i ÐÕi lý", 9, 1220)
			--AddNumText(sceneId, x760416_g_ScriptId,"Truy«n t¯ng Ðªn Côn Ngô #GVong Xuyên Bi¬n hoa", 9, 1001)			
			--AddNumText(sceneId, x760416_g_ScriptId,"V« Linh thÕch Tr¶i giáng", 11, 99900)		
			--AddNumText(sceneId, x760416_g_ScriptId,"V« Xin Chiªn Minh Minh chü", 11, 99901)				
			--AddNumText(sceneId, x760416_g_ScriptId,"Truy«n t¯ng Chí Tr§n Linh thÕch #GNhân", 6, 1001)
			--AddNumText(sceneId, x760416_g_ScriptId,"Phó bän Truy«n t¯ng", 6, 3333)
			--AddNumText(sceneId, x760416_g_ScriptId,"Phía chính phü HoÕt ðµng #cffcc88#ÐÕi lßþng Kinh nghi®m Nguyên bäo Tài li®u #", 6, 9999)
			--AddNumText(sceneId, x760416_g_ScriptId,"Tân thü HoÕt ðµng #cffcc88#ÐÕi lßþng Kinh nghi®m Nguyên bäo Tài li®u #", 6, 7778)
			--AddNumText(sceneId, x760416_g_ScriptId,"Cao c¤p HoÕt ðµng #cffcc88#ÐÕi lßþng Kinh nghi®m Nguyên bäo Tài li®u #", 6, 7777)
			--AddNumText(sceneId, x760416_g_ScriptId,"Sinh Bän ð° s¯ng #cffcc88#Sinh hoÕt Tài li®u Sinh hoÕt Tài li®u #", 6, 1999)
			
			for i, mp in x760416_g_mpInfo do
			end
		else
		-- SetLevel(sceneId, selfId, 100)
			AddText(sceneId,"Ngß½i Yêu c¥u C¤p b§c T¾i C¤p 10 Tr· lên ,M¾i có th¬ ði Khác Thành th¸ ,Tái Giá Phía trß¾c Ngß½i Vçn là Häo häo luy®n C¤p Ba !")
			AddNumText(sceneId, x760416_g_ScriptId,"Mãn Huyªt Mãn Nµ (Mi­n phí Tr¸ li®u)", 1, 10000)
			AddNumText(sceneId, x760416_g_ScriptId,"Hào hi®p Công lßþc #G(Tân thü T¤t Khán)", 1, 10001)
		 AddNumText(sceneId, x760416_g_ScriptId,"Luy®n C¤p Truy«n t¯ng (Ði¬m ðánh Ðä khai)", 6, 5555)
			
		end

		
		

	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760416_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 99900 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WHOATN_12103154_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText() == 99901 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WHOATN_12103145_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	
	if GetNumText() == 1011111 then
	local	mp
	local	i		= 0
		BeginEvent(sceneId)
			for i, mp in x760416_g_mpInfo do
				AddNumText(sceneId, x000128_g_ScriptId,"Môn phái -"..mp[1], 9, i)
			end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
   if GetNumText() == 10000 then
       x760416_Restore_hpmp(sceneId, selfId, targetId)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Tr¸ li®u Thành công ,M¾i nh¤t Phäng Quan Thiên Long Chúc Ngài Trò ch½i Vui sß¾ng .")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
    if GetNumText() == 10001 then
  BeginUICommand(sceneId)
	UICommand_AddString(sceneId,"#gFF0FA0Hào hi®p Phøc c± -Tân thü Công lßþc")
	UICommand_AddString(sceneId,"") --Cái này Tiªp l¶i Bi®t Thao Quá 480Cái Tñ phù 
	EndUICommand(sceneId)
	DispatchUICommand(sceneId, selfId,20151025)
	end
	if GetNumText() == 1110 then
	local	mp
	local	i		= 0
		BeginEvent(sceneId)
			for i, mp in x760416_g_mpInfo do
				AddNumText(sceneId, x760416_g_ScriptId,"Môn phái -"..mp[1], 9, i)
			end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
		--Ðµi ngû Tß½ng quan 
	if GetTeamId(sceneId,selfId)>=0 and
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount(sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021)> 0 then
				x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðµi ngû Thành viên trung Có ngß¶i Có ThuÖ v§n \Khoang chÑa hàng Trong ngß¶i ,Chúng ta D¸ch TrÕm không th¬ Vì ngß½i Cung c¤p Truy«n t¯ng Phøc vø .")
				return
			end
		end
	end

	--ThuÖ v§n Tß½ng quan 
	if IsHaveMission(sceneId,selfId,4021)> 0 then
		x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Có ThuÖ v§n Khoang chÑa hàng Trong ngß¶i ,C¥n thiªt Ði bµ Träi qua -Tung S½n -Thái H° -Tô Châu #G(243,79)ThuÖ v§n XØ Giao Nhi®m vø .")
		return
	end

	--Thu§n lþi Truy«n t¯ng 
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai(sceneId, selfId)
	if arg == 1000 then		--Phän h°i Môn phái 
		if id <0 or id>= 9 then
			x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Hoàn Không có gia nh§p B¤t lu§n cái gì môn phái !")
		else
			mp	= x760416_GetMPInfo(id)
			if mp ~= nil then
				CallScriptFunction((400900),"TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10)
			end
		end
		return
	end

--Gia tång Truy®n t¯ng ði¬m Ð¯i Ñng Hß·ng Ñng Sñ ki®n Danh sách .

	if arg == 3333 then
			BeginEvent(sceneId)
			AddText(sceneId,"#GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Thiên Long .")
			AddText(sceneId,"#IBän ð° Ch÷n dùng Toàn bµ bän ð° ThÆng t¾i Hình thÑc Cäm tÕ ngài Duy trì .")
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #G Thüy   Lao", 9, 1201)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #G Túc C¥u ÐÕi tái", 9, 1202)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #G Trân lung kÏ cøc", 9, 1203)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #G Lâu Lan T¥m bäo", 9, 1204)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #GTô Châu Lão tam Hoàn", 9, 1205)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #GLâu Lan Tân Tam Hoàn", 9, 1206)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #GThäo phÕt Chim én ‘", 9, 1207)
			AddNumText(sceneId, x760416_g_ScriptId,"Phó bän - #GKhiêu chiªn M¶ äo phong", 9, 1208)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	
	if arg == 3334 then
			BeginEvent(sceneId)
			AddText(sceneId,"#GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Thiên Long .")
			AddText(sceneId,"#IKhoáng thÕch Sinh trß·ng TÕi Các ÐÕi ð¸a Ð° M¶i chú ý Tra tìm Nga !")
			AddNumText(sceneId, x760416_g_ScriptId,"Ði trß¾c Gieo tr°ng Bän ð° (LÕc Dß½ng Nông trß¶ng)", 9, 1241)
			AddNumText(sceneId, x760416_g_ScriptId,"Ði trß¾c Câu cá Bän ð° (Thäo nguyên Ngß Ðß¶ng)", 9, 1232)
			AddNumText(sceneId, x760416_g_ScriptId,"Ði trß¾c OÕt Quáng Bän ð° (Các ÐÕi Khu mö)", 9, 1235)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	
	if arg == 3335 then
			BeginEvent(sceneId)
			AddText(sceneId,"#GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Thiên Long .")
			AddText(sceneId,"#IKhoáng thÕch Sinh trß·ng TÕi Các ÐÕi ð¸a Ð° M¶i chú ý Tra tìm Nga !")
			AddNumText(sceneId, x760416_g_ScriptId,"Mai Lînh (Sän xu¤t Long huyªt Khoáng thÕch )", 9, 6588)
			AddNumText(sceneId, x760416_g_ScriptId,"Thäo nguyên (Sän xu¤t Long huyªt Khoáng thÕch )", 9, 1232)
			AddNumText(sceneId, x760416_g_ScriptId,"Cao Xß½ng (Sän xu¤t Long huyªt Khoáng thÕch )", 9, 1226)
			AddNumText(sceneId, x760416_g_ScriptId,"Trong tháp Mµc (Sän xu¤t Long huyªt Khoáng thÕch )", 9, 6589)
			AddNumText(sceneId, x760416_g_ScriptId,"Höa di­m s½n (Sän xu¤t Long huyªt Khoáng thÕch )", 9, 6590)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	

	
	
	
	if arg == 5555 then
			BeginEvent(sceneId)
			AddText(sceneId,"Ngß¶i trë tu±i ,Xin höi Ngß½i Mu¯n ði n½i nào ?")
			AddText(sceneId,"Giang h° N½i ch¯n Hi¬m ác ,Xu¤t thân Bên ngoài Khä Nh¤t ð¸nh phäi Chú ý An toàn A")
			
			AddNumText(sceneId, x760416_g_ScriptId,"Vô lßþng S½n (#-C¤p 10)#G Tân thü Ð« cØ", 9, 22252)
			AddNumText(sceneId, x760416_g_ScriptId,"Bäo tàng Ðµng (10-20C¤p)#G Tân thü Ð« cØ", 9, 22231)
			AddNumText(sceneId, x760416_g_ScriptId,"Chæ viªt và tßþng Ph§t trên vách núi Ðµng (30-40C¤p)#G Tân thü Ð« cØ", 9, 22232)
			AddNumText(sceneId, x760416_g_ScriptId,"Yªn Vß½ng C± mµ Nh¤t T¢ng (40-50C¤p)", 9, 1221)
			AddNumText(sceneId, x760416_g_ScriptId,"Yªn Vß½ng C± mµ T¥ng nåm (55-60C¤p)", 9, 1222)
			AddNumText(sceneId, x760416_g_ScriptId,"Yªn Vß½ng C± mµ Tám t¥ng (60-65C¤p)", 9, 1223)
			AddNumText(sceneId, x760416_g_ScriptId,"T¥n Hoàng Ð¸a cung Nh¤t T¢ng (65-68C¤p)", 9, 1224)
			AddNumText(sceneId, x760416_g_ScriptId,"T¥n Hoàng Ð¸a cung Ba t¥ng (70-C¤p 90)", 9, 1225)
			AddNumText(sceneId, x760416_g_ScriptId,"Hãn Huyªt Lînh (100-119C¤p)#cFF0000 H§u kÏ Ð« cØ", 9, 1227)
			AddNumText(sceneId, x760416_g_ScriptId,"Cao Xß½ng Mê cung (100-119C¤p)#cFF0000 H§u kÏ Ð« cØ", 9, 1226)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	
	
	
	if arg == 7777 then
			BeginEvent(sceneId)
			AddText(sceneId,"#GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Phøc c± .")
			AddText(sceneId,"#IBän ð° Ch÷n dùng Toàn bµ bän ð° ThÆng t¾i Hình thÑc Cäm tÕ ngài Duy trì .")
			AddText(sceneId,"#IHoÕt ðµng Xu¤t s¡c Không ng×ng.Khen thß·ng Nhi«u h½n Làm ½n T¤t Tham dñ Nga")
			AddNumText(sceneId, x760416_g_ScriptId,"Thánh Thú S½n: Niên thú Ðµt kích", 9,1246)
			AddNumText(sceneId, x760416_g_ScriptId,"Vô Lßþng S½n: Siêu c¤p BÕo Long", 9, 22225)
			AddNumText(sceneId, x760416_g_ScriptId,"Ðôn Hoàng Sa mÕc: Cß½ng thi Tß½ng Th¥n", 9, 22224)
			AddNumText(sceneId, x760416_g_ScriptId,"Yªn Vß½ng C± mµ: Oán ni®m QuÖ linh", 9, 22226)
			AddNumText(sceneId, x760416_g_ScriptId,"Ngân Khäi Cánh ð°ng tuyªt: CØu Lê Tù trß·ng", 9, 22227)
			AddNumText(sceneId, x760416_g_ScriptId,"Thúc Hà C± tr¤n: Ma gi¾i SÑ giä", 9,22230)
			AddNumText(sceneId, x760416_g_ScriptId,"Hào hi®p Chung cñc HoÕt ðµng: Kính H° - Thiên Ðª Buông xu¯ng", 9,22228)
			AddNumText(sceneId, x760416_g_ScriptId,"Hào hi®p Chung cñc HoÕt ðµng: Ð¸a cung - Xi vßu Tr· v«", 9,22229)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			return
			end
	
	if arg == 8888 then
			BeginEvent(sceneId)
			AddText(sceneId,"#{XIYU_20071228_01}")
			--AddNumText(sceneId, x760416_g_ScriptId,"HÑa nguy®n - #GThái H°", 9, 8878)
			--AddNumText(sceneId, x760416_g_ScriptId,"Phän h°i Môn phái", 9, 1011111)
			--AddNumText(sceneId, x760416_g_ScriptId,"Truy«n t¯ng Chí Tr§n Linh thÕch #GThiên", 9, 1220)
			--AddNumText(sceneId, x760416_g_ScriptId,"Truy«n t¯ng Chí Tr§n Linh thÕch #GNhân", 9, 1001)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thành th¸ - LÕc Dß½ng - CØu Châu Thß½ng hµi", 9, 5678)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thành th¸ - ÐÕi lý", 9, 1113)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thành th¸ - Tô Châu", 9, 1002)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thành th¸ - Tô Châu - Thþ rèn Phô", 9, 3731)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thành th¸ - Lâu Lan", 9, 8877)
			--AddNumText(sceneId, x760416_g_ScriptId,"Thành th¸ - Thúc Hà C± tr¤n", 9, 8879)
			--AddNumText(sceneId, x760416_g_ScriptId,"Mang ta ði M£t khác môn phái", 9, 1110)

	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	
	if arg == 9999 then
			BeginEvent(sceneId)
			AddText(sceneId,"#GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Thiên Long .")
			AddText(sceneId,"#IBän ð° Ch÷n dùng Toàn bµ bän ð° ThÆng t¾i Hình thÑc Cäm tÕ ngài Duy trì .")
			AddText(sceneId,"#IH¢ng ngày Quái v§t Ð±i m¾i H® th¯ng Tß½ng S¨ tñ ðµng GØi ði Thông cáo .")
			AddNumText(sceneId, x760416_g_ScriptId,"Võ Di  - #GBång Yêu", 9, 1251)
			AddNumText(sceneId, x760416_g_ScriptId,"Thß½ng S½n  - #GKim cß½ng", 9, 1252)
			AddNumText(sceneId, x760416_g_ScriptId,"Thäo Nguyên  - #GTi¬u bÕch", 9, 1253)
			AddNumText(sceneId, x760416_g_ScriptId,"Huy«n Vû Ðäo - #GCóc", 9, 1254)
			AddNumText(sceneId, x760416_g_ScriptId,"Thánh thú S½n - #GLong quy", 9, 1255)
			AddNumText(sceneId, x760416_g_ScriptId,"Ngân Khäi Cánh ð°ng tuyªt - #GChim cánh cøt Vß½ng", 9, 1256)

	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	
	if arg == 1999 then
			BeginEvent(sceneId)
			AddText(sceneId,"##GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Thiên Long .")
			AddText(sceneId,"#IBän ð° Ch÷n dùng Toàn bµ bän ð° ThÆng t¾i Hình thÑc Cäm tÕ ngài Duy trì .")
			AddText(sceneId,"#H(B±n Phøc Nhân Suy xét Ðªn Bµ ph§n Vô pháp Tài trþ Cüa Bình dân Ngß¶i ch½i ,Vì KÏ Sinh t°n Nhân ðây Cung c¤p Gieo tr°ng ,Câu cá ,OÕt Quáng Tam HÕng Sinh hoÕt KÛ nång ,Sän v§t Quân Khä Ð±i Các loÕi V§t ph¦m Nguyên bäo Khen thß·ng .)")
			AddNumText(sceneId, x760416_g_ScriptId,"Ði trß¾c Gieo tr°ng Bän ð° (LÕc Dß½ng Nông trß¶ng)", 9, 1241)
			AddNumText(sceneId, x760416_g_ScriptId,"Ði trß¾c Câu cá Bän ð° (Thäo nguyên Ngß Ðß¶ng)", 9, 1232)
			AddNumText(sceneId, x760416_g_ScriptId,"Ði trß¾c OÕt Quáng Bän ð° (Các ÐÕi Khu mö)", 9, 3335)

	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
	return
	end
	
	if arg == 7778 then
			BeginEvent(sceneId)
			AddText(sceneId,"#GThân ái Ngß¶i ch½i.Hoan nghênh Ngß½i t¾i Ðªn #YHào hi®p Phøc c± .")
			AddText(sceneId,"#IBän ð° Ch÷n dùng Toàn bµ bän ð° ThÆng t¾i Hình thÑc Cäm tÕ ngài Duy trì .")
			AddText(sceneId,"#IHoÕt ðµng Xu¤t s¡c Không ng×ng.Khen thß·ng Nhi«u h½n Làm ½n T¤t Tham dñ Nga")
			AddNumText(sceneId, x760416_g_ScriptId,"Tân thü Quái v§t ðàn #G#Kiªm Các Ð±i m¾i Ði¬m #", 9, 33330)
			AddNumText(sceneId, x760416_g_ScriptId,"Tân thü Quái v§t ðàn #G#Tây H° Ð±i m¾i Ði¬m #", 9, 33331)
			AddNumText(sceneId, x760416_g_ScriptId,"Tân thü Quái v§t ðàn #G#Nh¸ Häi Ð±i m¾i Ði¬m #", 9, 33332)
			AddNumText(sceneId, x760416_g_ScriptId,"Tân thü Quái v§t ðàn #G#Thß½ng S½n Ð±i m¾i Ði¬m #", 9, 33333)
			AddNumText(sceneId, x760416_g_ScriptId,"#cccccccTân thü Quái v§t ðàn #G#Ðang · Kª hoÕch Trung #", 9, 33334)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			return
			end
	
--Gia tång Truy®n t¯ng ði¬m Ð¯i Ñng Hß·ng Ñng Sñ ki®n Danh sách 
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai(sceneId, selfId)
	if arg == 1000 then		--Phän h°i Môn phái 
		if id <0 or id>= 9 then
			x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Hoàn Không có gia nh§p B¤t lu§n cái gì môn phái !")
		else
			mp	= x760416_GetMPInfo(id)
			if mp ~= nil then
				CallScriptFunction((400900),"TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10)
			end
		end
		return
	end
	if arg == 33330 then		--Kiªm Các 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 7, 75, 261, 10)
		return
	end
	if arg == 33331 then		--Tây H° 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 30, 57, 59, 10)
		return
	end
	if arg == 33332 then		--Nh¸ Häi 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 24, 191, 66, 10)
		return
	end
	if arg == 33333 then		--Thß½ng S½n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 25, 165, 181, 10)
		return
	end
	if arg == 1001 then		--LÕc Dß½ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 574, 126, 101, 10)
		return
	end
	if arg == 1002 then		--Tô Châu 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 1, 206,257, 10)
		return
	end
	if arg == 3731 then		--Tô Châu Thþ rèn 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 1, 350, 239, 10)
		return
	end
	if arg == 5678 then		--LÕc Dß½ng - CØu Châu 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 0, 232, 130, 10)
		return
	end
	if arg == 56780 then		--LÕc Dß½ng - CØu Châu 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 0, 0, 0, 10)
		return
	end
	if arg == 8877 then		--Lâu Lan 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 186, 286, 130, 10)
		return
	end
	if arg == 8878 then		--Thái H° HÑa nguy®n thø 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 4, 161, 182, 10)
		return
	end
	if arg == 8879 then		--Thúc Hà C± tr¤n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 420, 201, 212, 10)
		return
	end
	if arg == 1201 then		--Thái H° Thüy lao 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 4, 63, 76, 10)
	end
	if arg == 1202 then		--ÐÕi lý Túc C¥u 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 278, 94, 10)
	end
	if arg == 1203 then		--ÐÕi lý Ván c¶ 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 278, 94, 10)
	end
	if arg == 1204 then		--Lâu Lan T¥m bäo 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 186, 161, 76, 10)
	end
	if arg == 1205 then		--Tô Châu Lão tam Hoàn 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 1, 133, 260, 10)
	end
	if arg == 1206 then		--Lâu Lan Tân Tam Hoàn 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 186, 292, 68, 10)
	end
	if arg == 1207 then		--Thäo phÕt Chim én ‘ 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 4, 78, 121, 10)
		return
	end
	if arg == 1208 then		--Khiêu chiªn M¶ äo phong 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 186, 190, 222, 10)
		return
	end
	if arg == 1211 then		--Nga Mi 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 145, 46, 40, 10)
		return
	end
	if arg == 1212 then		--Tiêu Dao 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 144, 140, 41, 10)
		return
	end
	if arg == 1213 then		--Thiên S½n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 147, 93, 39, 10)
		return
	end
	if arg == 1214 then		--Minh Giáo 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 141, 98, 60, 10)
		return
	end
	if arg == 1215 then		--Tinh Túc 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 146, 142, 54, 10)
		return
	end
	if arg == 1216 then		--Thiên Long 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 143, 95, 35, 10)
		return
	end
	if arg == 1217 then		--Thiªu Lâm 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 139, 46, 41, 10)
		return
	end
	if arg == 1218 then		--Cái Bang 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 140, 44, 38, 10)
		return
	end
	if arg == 1219 then		--Võ Ðang 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 142, 88, 52, 10)
		return
	end
	if arg == 1221 then		--C± mµ Mµt t¥ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 159, 68, 93, 10)
	end
	if arg == 1222 then		--C± mµ T¥ng nåm 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 163, 25, 25, 10)
	end
	if arg == 1223 then		--C± mµ Tám t¥ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 166, 25, 12, 10)
	end
	if arg == 1224 then		--Ð¸a cung Mµt t¥ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 400, 227, 221, 10)
	end
	if arg == 1225 then		--Ð¸a cung Ba t¥ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 402, 225, 217, 10)
	end
	if arg == 1226 then		--Cao Xß½ng Mê cung 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 520, 99, 102, 10)
	end
	if arg == 1227 then		--Hãn Huyªt Lînh 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 432, 87, 89, 10)
		return
	end
	if arg == 1228 then		--Tháp Cara Mã Càn 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 427, 38, 24, 10)
		return
	end
	if arg == 1231 then		--Lâu Lan Gieo tr°ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 186, 49, 210, 10)
		return
	end
	if arg == 1232 then		--Thäo nguyên Câu cá 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 20, 215, 173, 10)
		return
	end
	if arg == 1241 then		--Huy«n Vû Ðäo -Chí tôn Danh nhân 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 0, 273, 175, 10)
		return
	end
	if arg == 1242 then		--Vô lßþng S½n -Yêu H¥u Hi®n thª 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 6, 43, 172, 10)
		return
	end
	if arg == 1243 then		--Kính H° -Thßþng c± Ma thú 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 5, 210, 58, 10)
		return
	end
	if arg == 1244 then		--Kính H° -Tiên thäo Tranh ðoÕt 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 5, 101, 41, 10)
		return
	end
	if arg == 1245 then		--Thánh thú S½n Bäo sß½ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 158, 142, 114, 10)
		return
	end
	if arg == 1246 then		--Thánh thú S½n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 158, 140, 116, 10)
		return
	end
	if arg == 1251 then		--Võ di Bång Yêu 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 32, 99, 85, 10)
	end
	if arg == 1252 then		--Thß½ng S½n Kim cß½ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 25, 165, 54, 10)
	end
	if arg == 1253 then		--Thäo nguyên Ti¬u bÕch 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 20, 65, 165, 10)
	end
	if arg == 1254 then		--Huy«n Vû Cóc 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 39, 214, 220, 10)
		return
	end
	if arg == 1255 then		--Thánh thú S½n Long quy 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 158, 178, 34, 10)
		return
	end
	if arg == 1256 then		--Ngân Khäi Cánh ð°ng tuyªt Chim cánh cøt Vß½ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 188, 78, 47, 10)
		return
	end
	if arg == 1220 then		--Ti«n trang 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 131, 79, 10)
		return
	end
	if arg == 6588 then		--Mai Lînh 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 33, 64, 45, 10)
		return
	end
	if arg == 6589 then		--Trong tháp Mµc 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 425, 123, 127, 10)
		return
	end
	if arg == 6590 then		--Trong tháp Mµc 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 423, 64, 45, 10)
		return
	end
	if arg ==22223 then		--Trong tháp Mµc 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 84, 47, 10)
		return
	end
	--Tân Gia Truy«n t¯ng 
	if arg ==22224 then		--Ðôn Hoàng BOSS
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 8, 157, 130, 10)
		return
	end
	if arg ==22225 then		--Vô lßþng S½n BOSS
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 6, 84, 174, 10)
		return
	end
	if arg ==22226 then		--Yªn Vß½ng C± mµ BOSS
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 159, 69, 90, 10)
		return
	end
	if arg == 22227 then	--Ngân Khäi Cánh ð°ng tuyªt CØu Lê Tù trß·ng 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 188, 47, 118, 10)
		return
	end
	if arg == 22228 then		--Kính H° -Thßþng c± Ma thú 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 5, 121,134, 10)
		return
	end
	if arg == 22229 then		--Ð¸a cung Nh¸ t¥ng BOSS
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 401, 191, 166, 10)
	end
	if arg == 22230 then		--Thúc Hà C± tr¤n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 420, 201, 212, 10)
		return
	end
	if arg == 22231 then		--Thúc Hà C± tr¤n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 123, 226, 227, 10)
		return
	end
	if arg == 22232 then		--Thúc Hà C± tr¤n 
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 170, 24, 223, 10)
		return
	end
	if arg ==22252 then		--Vô lßþng S½n BOSS
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 6, 84, 174, 10)
		return
	end
	
	
	

	
	
	
	
	
	
	
	
	if arg == 22222 then		--Trong tháp Mµc 
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId,3517, posX, posZ, 27, 23, 321);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
			SetCharacterTitle(sceneId, nObjID,"Thí nghi®m BOSS");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
      local nam= LuaFnGetName(sceneId, selfId)
		local strText = format ("Thí nghi®m BOSSSinh thành Xong !", nam)						
		  BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		 return
end
	if arg == 1113 then		--ÐÕi lý 1
		--Nªu Ngß¶i ch½i Li«n · ÐÕi lý 1T¡c B¤t truy«n T¯ng 
		if sceneId == 2 then
			x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðã TÕi ÐÕi lý R°i .")
		else
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 159, 174)
		end
		return
	end
	if arg == 1114 then		--ÐÕi lý 2
		--Nªu Ngß¶i ch½i Li«n · ÐÕi lý 2T¡c B¤t truy«n T¯ng 
		if sceneId == 71 then
			x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðã TÕi ÐÕi lý 2R°i .")
		else
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 71, 241, 138)
		end
		return
	end
	if arg == 1115 then		--ÐÕi lý 3
		--Nªu Ngß¶i ch½i Li«n · ÐÕi lý 3T¡c B¤t truy«n T¯ng 
		if sceneId == 72 then
			x760416_MsgBox(sceneId, selfId, targetId,"Ngß½i Ðã TÕi ÐÕi lý 3R°i .")
		else
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 72, 241, 138)
		end
		return
	end

	for i, mp in x760416_g_mpInfo do
		if arg == i then
			CallScriptFunction((400900),"TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10)
			return
		end
	end

	if arg == 1010 then		--Thúc Hà C± tr¤n 
		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x760416_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId,"GotoShuHeGuZhen");
			UICommand_AddString(sceneId,"Thúc Hà C± tr¤n Vi B¤t Gia Sát khí Cänh tßþng ,M¶i chú ý An toàn .Ngß½i Xác nh§n Mu¯n ði vào MÕ ?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

	if GetNumText() == 2000 then		--
		BeginEvent(sceneId)
			AddText(sceneId,"#{GOTO_DUNHUANF_SONGSHAN}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

		return
	end

end
-- add by zchw
function x760416_GotoShuHeGuZhen(sceneId, selfId, targetId)
	CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 420, 200, 211, 20);
	return
end
--**********************************
--Cån cÑ Môn phái IDThu hoÕch Môn phái Tin tÑc 
--**********************************
function x760416_GetMPInfo(mpID)
	local	mp
	local	i		= 0
	for i, mp in x760416_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
-- Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760416_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
-- Trong màn hình Gian Tin tÑc Ð« kÏ 
--**********************************
function x760416_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760416_MsgBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
--**********************************
--Khôi phøc Huyªt Hòa khí 
--**********************************
function x760416_Restore_hpmp(sceneId, selfId, targetId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
	RestoreRage(sceneId, selfId)
end
