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

-- [01/10] 144 pet Huyen Hoa (docs/pet-skin.tsv, V2 + Admin 12000): tao voi ruler 2 = tu chat CO DINH (PetConfigTable.ini SuperRMB,
-- moi he so 1.000, truong thanh bac 5) -> ra dung so trong PetAttrTable. Hoan Dong (4834/4907/4908) tu choi cac pet nay.
x950000_g_HuyenHoa = {
	[25022]=1, [25031]=1, [25032]=1, [25041]=1, [25042]=1, [25051]=1, [25052]=1, [25061]=1, [25062]=1, [25071]=1, [25072]=1, [25081]=1,
	[25082]=1, [25091]=1, [25092]=1, [25101]=1, [25102]=1, [25111]=1, [25112]=1, [25121]=1, [25122]=1, [25131]=1, [25132]=1, [25141]=1,
	[25142]=1, [25151]=1, [25152]=1, [25161]=1, [25162]=1, [25171]=1, [25172]=1, [25181]=1, [25182]=1, [25191]=1, [25192]=1, [25201]=1,
	[25202]=1, [25211]=1, [25212]=1, [25221]=1, [25222]=1, [25231]=1, [25232]=1, [25241]=1, [25242]=1, [25251]=1, [25252]=1, [25261]=1,
	[25262]=1, [25271]=1, [25272]=1, [25281]=1, [25282]=1, [25291]=1, [25292]=1, [25301]=1, [25302]=1, [25321]=1, [25322]=1, [25331]=1,
	[25332]=1, [25381]=1, [25382]=1, [25391]=1, [25392]=1, [25401]=1, [25402]=1, [25411]=1, [25412]=1, [25421]=1, [25422]=1, [25431]=1,
	[25432]=1, [25442]=1, [25451]=1, [25452]=1, [25461]=1, [25462]=1, [25471]=1, [25472]=1, [25481]=1, [25482]=1, [25491]=1, [25492]=1,
	[25501]=1, [25502]=1, [25511]=1, [25512]=1, [25521]=1, [25522]=1, [25532]=1, [25541]=1, [25542]=1, [25551]=1, [25552]=1, [25561]=1,
	[25562]=1, [25571]=1, [25572]=1, [25581]=1, [25582]=1, [25591]=1, [25592]=1, [25601]=1, [25602]=1, [25611]=1, [25612]=1, [25621]=1,
	[25622]=1, [25631]=1, [25632]=1, [25641]=1, [25642]=1, [25651]=1, [25652]=1, [25671]=1, [25672]=1, [25691]=1, [25692]=1, [25711]=1,
	[25771]=1, [25772]=1, [25781]=1, [25782]=1, [25961]=1, [25962]=1, [25971]=1, [25972]=1, [26081]=1, [26082]=1, [26091]=1, [26092]=1,
	[26361]=1, [26362]=1, [26371]=1, [26372]=1, [26401]=1, [26402]=1, [26411]=1, [26412]=1, [26421]=1, [26422]=1, [26431]=1, [26521]=1,
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

function x950000_NhanQua( sceneId, selfId )
	x950000_CapMin( sceneId, selfId )
	CallScriptFunction( 999999, "NhanWeb", sceneId, selfId )   -- KNB chuyen tu web mini game (CDK/CDK.lua)
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
