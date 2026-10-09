-- NetCo4 950000: phat qua do admin gui tu panel.
-- Panel ghi hang doi vao Server/txt/NetCo4Qua/<GUID>.txt, moi dong 1 lenh:
--   item <ID vat pham> <so luong>
--   knb <so KNB>
--   vang <so vang>
--   diemtang <so Diem Tang>
--   level <cap 1-119>   (chi len cap, khong ha cap)
--   xoa <ID vat pham> <so luong>   (admin xoa khoi tui, vd do khong vut duoc)
--   doi <ID cu> <ID moi>   (doi TAT CA ID cu trong tui sang ID moi, giu so luong - vd nang cap ngoc)
--   vip <cap 0-10>
--   pet <ID pet>   (tao pet theo PetAttrTable, o pet day thi giu lai; chi admin phat event; Huyen Hoa = tu chat co dinh)
-- Duoc goi tu scene.lua: x888888_OnScenePlayerLogin (dang nhap) va x888888_OnScenePlayerEnter (doi ban do).
-- Tui day: phan chua nhan duoc ghi lai, nhan tiep o lan dang nhap sau.
-- File nay chi dung ky tu ASCII; chu tieng Viet viet bang escape VISCII (tools/vn.py).

x950000_g_ScriptId = 950000
x950000_g_Dir = "./txt/NetCo4Qua/"

-- [01/10] 180 pet Huyen Hoa (docs/pet-skin.tsv, V2 + Admin 12000 + Tan Thu cap 5): tao voi ruler 2 = tu chat CO DINH (PetConfigTable.ini SuperRMB,
-- moi he so 1.000, truong thanh bac 5) -> ra dung so trong PetAttrTable. Hoan Dong (4834/4907/4908) tu choi cac pet nay.
x950000_g_HuyenHoa = {
	[25022]=1, [25031]=1, [25032]=1, [25041]=1, [25042]=1, [25051]=1, [25052]=1, [25061]=1, [25062]=1, [25071]=1, [25072]=1, [25081]=1,
	[25082]=1, [25091]=1, [25092]=1, [25101]=1, [25102]=1, [25111]=1, [25112]=1, [25121]=1, [25122]=1, [25131]=1, [25132]=1, [25141]=1,
	[25142]=1, [25151]=1, [25152]=1, [25161]=1, [25162]=1, [25171]=1, [25172]=1, [25181]=1, [25182]=1, [25191]=1, [25192]=1, [25201]=1,
	[25202]=1, [25211]=1, [25212]=1, [25221]=1, [25222]=1, [25231]=1, [25232]=1, [25241]=1, [25242]=1, [25251]=1, [25252]=1, [25261]=1,
	[25262]=1, [25271]=1, [25272]=1, [25281]=1, [25282]=1, [25291]=1, [25292]=1, [25301]=1, [25302]=1, [25311]=1, [25312]=1, [25321]=1,
	[25322]=1, [25331]=1, [25332]=1, [25341]=1, [25342]=1, [25381]=1, [25382]=1, [25391]=1, [25392]=1, [25401]=1, [25402]=1, [25411]=1,
	[25412]=1, [25421]=1, [25422]=1, [25431]=1, [25432]=1, [25442]=1, [25451]=1, [25452]=1, [25461]=1, [25462]=1, [25471]=1, [25472]=1,
	[25481]=1, [25482]=1, [25491]=1, [25492]=1, [25501]=1, [25502]=1, [25511]=1, [25512]=1, [25521]=1, [25522]=1, [25532]=1, [25541]=1,
	[25542]=1, [25551]=1, [25552]=1, [25561]=1, [25562]=1, [25571]=1, [25572]=1, [25581]=1, [25582]=1, [25591]=1, [25592]=1, [25601]=1,
	[25602]=1, [25611]=1, [25612]=1, [25621]=1, [25622]=1, [25631]=1, [25632]=1, [25641]=1, [25642]=1, [25651]=1, [25652]=1, [25661]=1,
	[25662]=1, [25671]=1, [25672]=1, [25681]=1, [25682]=1, [25691]=1, [25692]=1, [25701]=1, [25702]=1, [25711]=1, [25712]=1, [25721]=1,
	[25722]=1, [25731]=1, [25732]=1, [25751]=1, [25752]=1, [25771]=1, [25772]=1, [25781]=1, [25782]=1, [25801]=1, [25802]=1, [25821]=1,
	[25822]=1, [25841]=1, [25861]=1, [25862]=1, [25961]=1, [25962]=1, [25971]=1, [25972]=1, [26081]=1, [26082]=1, [26091]=1, [26092]=1,
	[26361]=1, [26362]=1, [26371]=1, [26372]=1, [26401]=1, [26402]=1, [26411]=1, [26412]=1, [26421]=1, [26422]=1, [26431]=1, [26432]=1,
	[26521]=1, [26522]=1, [26531]=1, [26532]=1, [26561]=1, [26562]=1, [26571]=1, [26572]=1, [26601]=1, [26602]=1, [26611]=1, [26641]=1,
}

-- goi tu script khac: CallScriptFunction( 950000, "LaHuyenHoa", sceneId, petDataID ) -> 1 / 0
function x950000_LaHuyenHoa( sceneId, petDataID )
	if petDataID ~= nil and x950000_g_HuyenHoa[petDataID] == 1 then
		return 1
	end
	return 0
end

-- Cap toi thieu toan server: panel ghi so cap vao _capmin.txt (0 = tat). Nhan vat duoi cap nay
-- thi len cap khi dang nhap/doi ban do, ke ca nhan vat moi tao (khong can vao phai).
-- KHONG dat DefaultChar.ini level >= 100: scene.lua x888888_OnScenePlayerFirstLogin coi nhan vat moi
-- cap >= 100 la hack va SetLevel 0. Ham nay chay trong OnScenePlayerLogin, SAU buoc kiem tra do.
function x950000_CapMin( sceneId, selfId )
	local h = openfile( x950000_g_Dir.."_capmin.txt", "r" )
	if h == nil then
		return
	end
	local s = read( h, "*l" )
	closefile( h )
	if s == nil then
		return
	end
	local n = tonumber( s )
	if n == nil or n < 1 or n > 119 then
		return
	end
	if GetLevel( sceneId, selfId ) < n then
		SetLevel( sceneId, selfId, n )
		x950000_Tip( sceneId, selfId, "B\213n \240\227 \240\223\254c n\226ng l\234n c\164p "..n )
	end
end

-- [NetCo4 03/10] Dua tam phap cua nhan vat CU (GUID <= x950000_g_TPMaxGuid, tao truoc 03/10) ve cap 1, moi nhan vat dung 1 lan.
-- Truoc 03/10 NPC NetCo4 (990010) cho san tam phap 90 khi vao phai. Danh dau ./txt/NetCo4Web/<GUID>.tp1 GHI TRUOC khi ha cap:
-- khong ghi duoc thi bo qua (khong bao gio ha cap lap lai moi lan dang nhap).
x950000_g_TPMaxGuid = 1010100013
x950000_g_TPList = { {1,2,3,4,5,6,55,72}, {7,8,9,10,11,12,56,73}, {13,14,15,16,17,18,57,74},
	{19,20,21,22,23,24,58,75}, {25,26,27,28,29,30,59,76}, {31,32,33,34,35,36,60,77},
	{37,38,39,40,41,42,61,78}, {43,44,45,46,47,48,62,79}, {49,50,51,52,53,54,63,80}, {},
	{64,65,66,67,68,69,70,71}, {81,82,83,84,85,86,87,88}, {89,90,91,92,93,94,95,96} }
function x950000_TamPhap1( sceneId, selfId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	if guid == nil or guid > x950000_g_TPMaxGuid then
		return
	end
	local path = "./txt/NetCo4Web/"..guid..".tp1"
	local h = openfile( path, "r" )
	if h ~= nil then
		closefile( h )
		return
	end
	h = openfile( path, "w" )
	if h == nil then
		return
	end
	write( h, "1\n" )
	closefile( h )
	local mp = GetMenPai( sceneId, selfId )
	if mp == nil or mp < 0 or mp > 12 or mp == 9 then
		return
	end
	local ds = x950000_g_TPList[mp + 1]
	local n = 0
	for i = 1, getn( ds ) do
		local lv = LuaFnGetXinFaLevel( sceneId, selfId, ds[i] )
		if lv ~= nil and lv > 1 then
			LuaFnSetXinFaLevel( sceneId, selfId, ds[i], 1 )
			n = n + 1
		end
	end
	if n > 0 then
		x950000_Tip( sceneId, selfId, "T\226m ph\225p c\252a c\225c h\213 \240\227 \240\223\254c \240\223a v\171 c\164p 1." )
	end
end

function x950000_NhanQua( sceneId, selfId )
	x950000_CapMin( sceneId, selfId )
	x950000_TamPhap1( sceneId, selfId )   -- [NetCo4 03/10] tam phap nhan vat cu ve 1 (1 lan)
	CallScriptFunction( 999999, "NhanWeb", sceneId, selfId )   -- KNB chuyen tu web mini game (CDK/CDK.lua)
	CallScriptFunction( 999999, "NhanTP", sceneId, selfId )   -- [NetCo4 06/10] do rut tu Thuong Pho (web) - chi dong du o trong
	x950000_CapNhatTop( sceneId, selfId )   -- [NetCo4 03/10] Bang Top Server: Top Level + Top Tai Phu (KNB)
	local guid = LuaFnGetGUID( sceneId, selfId )
	local path = x950000_g_Dir..guid..".txt"
	local h = openfile( path, "r" )
	if h == nil then
		return
	end
	local lines = {}
	local line = read( h, "*l" )
	while line do
		tinsert( lines, line )
		line = read( h, "*l" )
	end
	closefile( h )
	if getn( lines ) == 0 then
		return
	end

	local left = {}
	local got = 0
	for i = 1, getn( lines ) do
		local s, e, kind, a, b = strfind( lines[i], "^(%a+)%s+(%d+)%s*(%d*)" )
		local n = tonumber( b )
		if n == nil or n < 1 then
			n = 1
		end
		if kind == "item" then
			local id = tonumber( a )
			local k = 0
			while k < n do
				local r = TryRecieveItem( sceneId, selfId, id, 1 )
				if r == nil or r < 0 then
					break
				end
				k = k + 1
			end
			got = got + k
			if k < n then
				tinsert( left, "item "..id.." "..( n - k ) )
			end
		elseif kind == "itemten" then
			-- [09/10] "itemten <ID> <chu>": phat 1 mon + ghi chu vao dong ten nguoi che (hien duoi tooltip). Chu VISCII, toi da ~30 ky tu.
			local s2, e2, ten = strfind( lines[i], "^itemten%s+%d+%s+(.+)$" )
			local r = TryRecieveItem( sceneId, selfId, tonumber( a ), 1 )
			if r == nil or r < 0 then
				tinsert( left, lines[i] )
			else
				if ten ~= nil then
					LuaFnSetItemCreator( sceneId, selfId, r, ten )
					LuaFnRefreshItemInfo( sceneId, selfId, r )
				end
				got = got + 1
			end
		elseif kind == "knb" then
			YuanBao( sceneId, selfId, -1, 1, tonumber( a ) )
			got = got + 1
		elseif kind == "vang" then
			AddMoney( sceneId, selfId, tonumber( a ) )
			got = got + 1
		elseif kind == "diemtang" then
			ZengDian( sceneId, selfId, -1, 1, tonumber( a ) )
			got = got + 1
		elseif kind == "level" then
			-- SetLevel giong qua Tan Thu 8887 (obj/loulangucheng/oloulan_malan.lua)
			if GetLevel( sceneId, selfId ) < tonumber( a ) then
				SetLevel( sceneId, selfId, tonumber( a ) )
			end
			got = got + 1
		elseif kind == "xoa" then
			-- Xoa toi da n cai, co bao nhieu xoa bay nhieu. Khong tinh la "nhan qua" (khong hien thong bao)
			local id = tonumber( a )
			local co = LuaFnGetAvailableItemCount( sceneId, selfId, id )
			if co > n then
				co = n
			end
			if co > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, id, co )
			end
		elseif kind == "doi" then
			-- Dem ID cu trong tui -> xoa dung so do -> phat lai dung so do bang ID moi (1 luot, khong lech so).
			-- Tui day giua chung: phan chua phat duoc xep lai "item <ID moi> <con lai>" nhan lan sau.
			local cu = tonumber( a )
			local moi = tonumber( b )
			local co = 0
			if moi ~= nil and moi > 0 then
				co = LuaFnGetAvailableItemCount( sceneId, selfId, cu )
			end
			if co > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, cu, co )
				local k = 0
				while k < co do
					local r = TryRecieveItem( sceneId, selfId, moi, 1 )
					if r == nil or r < 0 then
						break
					end
					k = k + 1
				end
				got = got + k
				if k < co then
					tinsert( left, "item "..moi.." "..( co - k ) )
				end
			end
		elseif kind == "pet" then
			-- [30/09] Pet theo ID PetAttrTable (vd 25351 = Huyen Hoa Tan Vuong, xem docs/pet-huyen-hoa.md). Cap -1 = theo bang.
			-- Chi admin phat (event). O pet day -> giu lai dong, nhan lan dang nhap sau.
			local ruler = 0
			if x950000_LaHuyenHoa( sceneId, tonumber( a ) ) == 1 then
				ruler = 2   -- [01/10] tu chat co dinh
			end
			local r = LuaFnCreatePetToHuman( sceneId, selfId, tonumber( a ), -1, ruler )
			if r ~= nil and r == 1 then
				got = got + 1
			else
				tinsert( left, "pet "..a )
			end
		elseif kind == "vip" then
			-- Cap VIP = CHONG_ZHI_CHONGSHU (ScriptGlobal.lua). VIP>=1 mo phuc loi ngay (shengjjll.lua
			-- index 20-37), so luong qua tang theo cap. Ban goc chi len VIP bang nap tien.
			SetMissionData( sceneId, selfId, CHONG_ZHI_CHONGSHU, tonumber( a ) )
			got = got + 1
		end
	end

	-- Ghi lai phan chua nhan (file rong = da nhan het)
	h = openfile( path, "w" )
	if h then
		for i = 1, getn( left ) do
			write( h, left[i].."\n" )
		end
		closefile( h )
	end

	if got > 0 then
		x950000_Tip( sceneId, selfId, "B\213n \240\227 nh\167n qu\224 t\215 admin NetCo4" )
	end
	if getn( left ) > 0 then
		x950000_Tip( sceneId, selfId, "T\250i \240\165y, ph\165n c\242n l\213i s\168 nh\167n \183 l\165n \240\229ng nh\167p sau" )
	end
end

function x950000_Tip( sceneId, selfId, msg )
	BeginEvent( sceneId )
	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

-- [NetCo4 03/10] Bang Top Server (890096 shengjjll.lua GetGiftsForUI 20/21): cap nhat moi lan dang nhap / doi ban do.
--   Top Level (key 4) = cap hien tai (truoc chi cap nhat luc len cap -> nhan vat len cap qua panel khong vao bang).
--   Top Tai Phu (key 1) = KNB trong game luc do (truoc chi cap nhat luc nap the -> server khong co nap, bang trong).
--   SetDengji (888899 eprize.lua) GHI DE gia tri cua chinh nguoi do roi xep lai top 10 (KNB giam thi bang giam theo).
function x950000_CapNhatTop( sceneId, selfId )
	local lv = GetLevel( sceneId, selfId )
	if lv and lv > 0 then
		CallScriptFunction( 888899, "SetDengji", sceneId, selfId, lv, 4 )
	end
	local knb = YuanBao( sceneId, selfId, -1, 3, 0 )
	if knb == nil or knb < 1 then
		knb = 1
	end
	CallScriptFunction( 888899, "SetDengji", sceneId, selfId, knb, 1 )
end
