-- 005116
-- Kính H° BOSS

x005116_g_PreTimeHour_1 = 0
x005116_g_PreTimeHour_2 = 0
x005116_g_PreTimeHour_3 = 0

x005116_g_Boss ={
								{x=141,z=96,	b1=885,b2=887,b3=889,n1="B¡c Häi H²n Giang Ti¬u long",n2="B¡c Häi Xu¤t ðµng Ti¬u Giao",n3="B¡c Häi Phiên Giang Ti¬u Th§n"},
								{x=250,z=98,	b1=885,b2=887,b3=889,n1="Ðông Häi H²n Giang Ti¬u long",n2="Ðông Häi Xu¤t ðµng Ti¬u Giao",n3="Ðông Häi Phiên Giang Ti¬u Th§n"},
								
								{x=206,z=253,	b1=885,b2=887,b3=889,n1="Nam Häi H²n Giang Ti¬u long",n2="Nam Häi Xu¤t ðµng Ti¬u Giao",n3="Nam Häi Phiên Giang Ti¬u Th§n"},
								{x=101,z=256,	b1=885,b2=887,b3=889,n1="Tây Häi H²n Giang Ti¬u long",n2="Tây Häi Xu¤t ðµng Ti¬u Giao",n3="Tây Häi Phiên Giang Ti¬u Th§n"},
								
								{x=139,z=133,	b1=884,b2=886,b3=888,n1="H²n Giang Long",n2="Xu¤t ðµng Giao",n3="Phiên Giang Th§n"}}

-- SØ døng Mµt ít B±n tràng Cänh Duy nh¤t Toàn cøc Lßþng biªn ð±i Lai Bäo t°n S¯ li®u 

-- N½i này Tính gi¶ Khí TÕi Ð® nh¤t Ngß¶i ch½i Tiªn vào B±n tràng Cänh H§u Chính mình Kh·i ðµng , Vînh Không liên quan Bª.
function x005116_OnSceneTimer(sceneId)

	-- ÐÕt ðßþc Trß¾c m£t Th¶i gian 
	--begin modified by zhangguoxin 090207
	--local nHour = GetHourTime()
	local nHour = GetQuarterTime()
	--local temp = floor(nHour/100)*100
	
	-- Chï Ð± TÕi 10:00 4:00 Trñc tiªp Trong khoäng th¶i gian này Nµi Tài Ð± 
	--if nHour-temp>16 and nHour-temp<40  then
	--	return
	--end
	
	local nQuarter = mod(nHour,100);
	-- Chï Ð± TÕi 10:00 4:00 Trñc tiªp Trong khoäng th¶i gian này Nµi Tài Ð± 
	if nQuarter> 16 and nQuarter <40 then
		return
	end
	--end modified by zhangguoxin 090207
	
	--Quái v§t Phân b¯: Ð±i m¾i Th¶i Cµng Xoát Xu¤t 5T± BOSS,
	--	Ð® 45 Phút , LßÞng T± BOSS,55C¤p Ðái 53Ti¬u ð® Xu¤t hi®n.()
	--	50 Phút , LßÞng T± BOSS,55C¤p Ðái 53Ti¬u ð® Xu¤t hi®n.	()
	--	55 Phút , Mµt t± BOSS,C¤p 60 Ðái 58Ti¬u ð® Xu¤t hi®n.	()
	--	Cu¯i cùng Mµt t± BOSSXu¤t hi®n Th¶i H® th¯ng Thông cáo.	
	
	-- Ð® 45 Phút , Xoát Ð® nh¤t ðµi BOSS
	if GetMinute()>= 45 and GetMinute() <50 then 
		-- B±n Gi¶ Cüa Giá T± Quái Ðã Quét qua 
		if nHour == x005116_g_PreTimeHour_1 then
			return
		end
		
		-- Ký løc Th¶i gian này Ði¬m 
		x005116_g_PreTimeHour_1 = nHour
		
		-- Ki¬m tra ðo lß¶ng Có phäi hay không Thöa mãn Sáng tÕo Quái Cüa Ði«u ki®n 
		-- Ki¬m tra ðo lß¶ng Cänh tßþng Trung x005116_g_Boss[1].b1 Có phäi hay không Còn t°n tÕi , 
		-- T°n tÕi Li«n không T¯ Thao tác , Nªu không Thanh tr× Ti¬u quái Sau ðó Xoát Ra tân Cüa Lai 
		if x005116_IsHaveMonster(sceneId,"B¡c Häi H²n Giang Ti¬u long") == 0 then
			x005116_UpDateMonster(sceneId, 1, 10)
		end
		if x005116_IsHaveMonster(sceneId,"Ðông Häi H²n Giang Ti¬u long") == 0 then
			x005116_UpDateMonster(sceneId, 2, 11)
		end

		
	end
	
	-- 55 Phút , Xoát Ð® nh¸ ðµi BOSS
	if GetMinute()>= 50 and GetMinute() <55 then
		-- B±n Gi¶ Cüa Giá T± Quái Ðã Quét qua 
		if nHour == x005116_g_PreTimeHour_2 then
			return
		end
		
		-- Ký løc Th¶i gian này Ði¬m 
		x005116_g_PreTimeHour_2 = nHour
		
		-- Ki¬m tra ðo lß¶ng Có phäi hay không Thöa mãn Sáng tÕo Quái Cüa Ði«u ki®n 
		if x005116_IsHaveMonster(sceneId,"Nam Häi H²n Giang Ti¬u long") == 0 then
			x005116_UpDateMonster(sceneId, 3, 12)
		end
		if x005116_IsHaveMonster(sceneId,"Tây Häi H²n Giang Ti¬u long") == 0 then
			x005116_UpDateMonster(sceneId, 4, 13)
		end
		
	end
	
	-- 60 Phút , Xoát Ð® tam ðµi BOSS
	if GetMinute()>= 55 	then
		-- B±n Gi¶ Cüa Giá T± Quái Ðã Quét qua 
		if nHour == x005116_g_PreTimeHour_3 then
			return
		end
		
		-- Ký løc Th¶i gian này Ði¬m 
		x005116_g_PreTimeHour_3 = nHour
		
		-- Ki¬m tra ðo lß¶ng Có phäi hay không Thöa mãn Sáng tÕo Quái Cüa Ði«u ki®n 
		if x005116_IsHaveMonster(sceneId,"H²n Giang Long") == 0 then
			x005116_UpDateMonster(sceneId, 5, 14)
		end
	end
	
		
end

function x005116_IsHaveMonster(sceneId, MonsterName)
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHaveMonster = 0
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId) == MonsterName then
			bHaveMonster = 1
		end
	end
	return bHaveMonster
end

function x005116_UpDateMonster(sceneId, nIndex, nGroupId)

	-- Tiên Thanh tr×  Cái này t± Ð¥u S· hæu Ti¬u quái 
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHaveMonster = 0
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId) == x005116_g_Boss[nIndex].n1 then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
		
		if GetName(sceneId, nMonsterId) == x005116_g_Boss[nIndex].n2 then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
		
		if GetName(sceneId, nMonsterId) == x005116_g_Boss[nIndex].n3 then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
	
	-- Bä Quái Toàn Sáng tÕo Ra t¾i 
	local nMonId
	nMonId = LuaFnCreateMonster(sceneId, x005116_g_Boss[nIndex].b1, x005116_g_Boss[nIndex].x, x005116_g_Boss[nIndex].z, 19, 197, 005117)
	SetCharacterName(sceneId, nMonId, x005116_g_Boss[nIndex].n1)
	SetMonsterGroupID(sceneId, nMonId, nGroupId)
	SetCharacterTitle(sceneId, nMonId,"Kính H° Løc Bá")
	
	nMonId = LuaFnCreateMonster(sceneId, x005116_g_Boss[nIndex].b2, x005116_g_Boss[nIndex].x+2, x005116_g_Boss[nIndex].z, 19, 198, 005118)
	SetCharacterName(sceneId, nMonId, x005116_g_Boss[nIndex].n2)
	SetMonsterGroupID(sceneId, nMonId, nGroupId)
	SetCharacterTitle(sceneId, nMonId,"Kính H° Løc Bá")
	
	nMonId = LuaFnCreateMonster(sceneId, x005116_g_Boss[nIndex].b3, x005116_g_Boss[nIndex].x-2, x005116_g_Boss[nIndex].z, 19, 199, 005119)
	SetCharacterName(sceneId, nMonId, x005116_g_Boss[nIndex].n3)
	SetMonsterGroupID(sceneId, nMonId, nGroupId)
	SetCharacterTitle(sceneId, nMonId,"Kính H° Løc Bá")
	
	if nIndex == 5  then
		--Nåm ðó Hoành hành T¥m Dß½ng Giang Cüa Thüy t£c H²n Giang Long Ðã Dçn d¡t Bµ hÕ Xu¤t hi®n · Kính H° !M¶i Thiên hÕ anh hùng Nhanh ði Tiêu di®t !
		-- Xoát T±ng BOSSCüa Th¶i ði¬m , C¤p Mµt  Cái Thª gi¾i Thông cáo 
		
		local str ="#PNåm ðó Hoành hành T¥m Dß½ng Giang Cüa Thüy t£c #{_BOSS14}#PÐã Dçn d¡t Bµ hÕ Xu¤t hi®n · #GKính H° #P!M¶i Thiên hÕ anh hùng Nhanh ði Tiêu di®t !"
		BroadMsgByChatPipe(sceneId, -1, str, 4)
	end
	
	
end

