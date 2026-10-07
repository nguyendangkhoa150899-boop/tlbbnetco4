-- NetCo4 999999: VI WEB - chuyen Kim Nguyen Bao (KNB) giua game va web mini game (bot BotDoMin).
-- Thay the NPC Gift Code cu (da tat 28/09, ma VIP bi lo). NPC dung o Lac Duong (203,323) va Dai Ly (154,170).
--
-- Giao dien file voi bot (cung VPS, thu muc Server/txt/NetCo4Web/):
--   GAME -> WEB: NPC tru KNB TRONG GAME (bat buoc: KNB nam trong RAM ShareMemory, ghi DB se bi de)
--                roi ghi phieu out/<GUID>_<gio>_<ngau nhien>.txt = "<GUID> <so> END".
--                Bot doc phieu co chu END, cong vi web, chuyen phieu sang out/xong/. Ten file = ma giao dich.
--   WEB -> GAME: bot ghi <GUID>.in (ghi tam roi doi ten, luon nguyen ven), moi dong "<ma> <so> ok".
--                x999999_NhanWeb (goi tu quatang.lua luc dang nhap / doi ban do) phat dong nao chua co
--                trong <GUID>.done, ghi ma vao .done TRUOC khi phat (khong bao gio phat trung).
-- Chi ky tu ASCII; chu tieng Viet = escape VISCII (tools/vn.py). Ban goc (Gift Code): lich su git.

x999999_g_ScriptId = 999999
x999999_g_Dir = "./txt/NetCo4Web/"
x999999_g_Amounts = { 10000, 100000 }   -- [NetCo4 05/10] gon menu: bo 1.000 / 50.000 / 500.000 / 1.000.000 (con Toan bo)
x999999_g_LongVan = { 10157001, 10157002, 10157003 }   -- [NetCo4 03/10] Long Van +1/+2/+3 -> Ruong Ich Ky (web)

function x999999_Balance( sceneId, selfId )
	return YuanBao( sceneId, selfId, -1, 3, 0 )
end

function x999999_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddText( sceneId, "V\237 Web NetCo4: chuy\172n Kim Nguy\234n B\228o t\215 game ra v\237 web mini game (t\239 gi\225 1:1). Chi\171u ng\223\254c l\213i d\249ng web, nh\167n khi \240\229ng nh\167p ho\163c \240\177i b\228n \240\176." )
	AddText( sceneId, "Kim Nguy\234n B\228o hi\174n c\243: "..x999999_Balance( sceneId, selfId ) )
	for i = 1, getn( x999999_g_Amounts ) do
		AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n ra web "..x999999_g_Amounts[i].." KNB", 6, i )   -- [NetCo4 05/10] them chu KNB
	end
	AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n ra web ".."To\224n b\181 KNB", 6, 99 )
	--AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n Long V\229n ra R\223\189ng \205ch K\214 (web)", 6, 98 )   -- [NetCo4 03/10] o cuoi -- [NetCo4 08/10] AN: chu server bo nut (Long Van khong con duong khac ra web)
	--AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n Ng\247c c\164p 6 (kh\244ng c\175 \240\184nh) ra R\223\189ng \205ch K\214 (web)", 6, 96 )   -- [NetCo4 05/10] chi ngoc cap 6 -- [NetCo4 08/10] AN: chu server bo nut (ngoc 6 di Thuong Pho -> Ruong Ich Ky)
	AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n \208\213o c\248 ra Th\223\189ng Ph\175 (web)", 6, 94 )   -- [NetCo4 06/10] Thuong Pho
	AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n Nguy\234n li\174u ra Th\223\189ng Ph\175 (web)", 6, 93 )
	AddNumText( sceneId, x999999_g_ScriptId, "Nh\167n \240\176 Th\223\189ng Ph\175 \240ang ch\182", 6, 90 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x999999_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()
	if key == 98 then   -- [NetCo4 03/10] Long Van -> Ruong Ich Ky: hoi xac nhan
		x999999_HoiLongVan( sceneId, selfId, targetId )
		return
	end
	if key == 97 then   -- [NetCo4 03/10] Long Van -> Ruong Ich Ky: chuyen
		x999999_ChuyenLongVan( sceneId, selfId, targetId )
		return
	end
	if key == 94 or key == 93 then   -- [NetCo4 06/10] Thuong Pho: hoi xac nhan (94 = Dao cu, 93 = Nguyen lieu)
		x999999_HoiTP( sceneId, selfId, targetId, 95 - key )
		return
	end
	if key == 92 or key == 91 then   -- [NetCo4 06/10] Thuong Pho: chuyen (92 = Dao cu, 91 = Nguyen lieu)
		x999999_ChuyenTP( sceneId, selfId, targetId, 93 - key )
		return
	end
	if key == 90 then   -- [NetCo4 06/10] Thuong Pho: nhan do dang cho ngay (khong can doi ban do)
		x999999_NhanTP( sceneId, selfId, 1 )
		return
	end
	if key == 96 then   -- [NetCo4 05/10] Ngoc khong co dinh -> Ruong Ich Ky: hoi xac nhan
		x999999_HoiNgoc( sceneId, selfId, targetId )
		return
	end
	if key == 95 then   -- [NetCo4 05/10] Ngoc khong co dinh -> Ruong Ich Ky: chuyen
		x999999_ChuyenNgoc( sceneId, selfId, targetId )
		return
	end
	local have = x999999_Balance( sceneId, selfId )
	local n = 0
	if key == 99 then
		n = have
	elseif key >= 1 and key <= getn( x999999_g_Amounts ) then
		n = x999999_g_Amounts[key]
	else
		return
	end
	if n < 1 or have < n then
		x999999_Tips( sceneId, selfId, "Kh\244ng \240\252 Kim Nguy\234n B\228o" )
		return
	end

	-- Tru truoc, ghi phieu sau; ghi phieu loi thi hoan lai ngay (khong mat, khong nhan doi)
	YuanBao( sceneId, selfId, -1, 2, n )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local name = x999999_g_Dir.."out/"..guid.."_"..LuaFnGetCurrentTime().."_"..random( 100000, 999999 )..".txt"
	local h = openfile( name, "w" )
	if h == nil then
		YuanBao( sceneId, selfId, -1, 1, n )
		x999999_Tips( sceneId, selfId, "L\178i ghi phi\170u, \240\227 ho\224n l\213i Kim Nguy\234n B\228o" )
		return
	end
	write( h, guid.." "..n.." END\n" )
	closefile( h )
	x999999_Tips( sceneId, selfId, "\208\227 chuy\172n ra web: "..n.." Kim Nguy\234n B\228o" )
	x999999_OnDefaultEvent( sceneId, selfId, targetId )
end

-- WEB -> GAME. Goi tu x950000_NhanQua (quatang.lua).
function x999999_NhanWeb( sceneId, selfId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local h = openfile( x999999_g_Dir..guid..".in", "r" )
	if h == nil then
		return
	end
	local inbox = {}
	local line = read( h, "*l" )
	while line do
		tinsert( inbox, line )
		line = read( h, "*l" )
	end
	closefile( h )
	if getn( inbox ) == 0 then
		return
	end

	local done = {}
	h = openfile( x999999_g_Dir..guid..".done", "r" )
	if h then
		line = read( h, "*l" )
		while line do
			done[line] = 1
			line = read( h, "*l" )
		end
		closefile( h )
	end

	local total = 0
	for i = 1, getn( inbox ) do
		local s, e, tx, amt = strfind( inbox[i], "^(%w+) (%d+) ok$" )
		local n = tonumber( amt )
		if tx and n and n > 0 and done[tx] == nil then
			local d = openfile( x999999_g_Dir..guid..".done", "a" )
			if d == nil then
				return
			end
			write( d, tx.."\n" )
			closefile( d )
			done[tx] = 1
			YuanBao( sceneId, selfId, -1, 1, n )
			total = total + n
		end
	end
	if total > 0 then
		x999999_Tips( sceneId, selfId, "\208\227 nh\167n t\215 web: "..total.." Kim Nguy\234n B\228o" )
	end
end

function x999999_Tips( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

-- [NetCo4 03/10] GAME -> RUONG ICH KY (web): chuyen TOAN BO Long Van +1/+2/+3 trong tui (mon dang mac / khoa mat khau khong tinh).
-- Xoa tung mon truoc, ghi phieu outlv/<GUID>_<gio>_<so>.txt sau: moi dong "<GUID> <ID> <so>", dong cuoi "END".
-- Ghi phieu loi thi tra lai mon. Bot (tlbbPollLvReceipts, repo bialk) cong vao Ruong Ich Ky, giu qua dem;
-- rut ve game / tang nguoi khac bang nut cua Ruong Ich Ky tren web. Long Van da nang sao / chue thuoc tinh MAT phan nang cap.
function x999999_DemLongVan( sceneId, selfId )
	local ds = {}
	local tong = 0
	for i = 1, getn( x999999_g_LongVan ) do
		local n = LuaFnGetAvailableItemCount( sceneId, selfId, x999999_g_LongVan[i] )
		if n == nil or n < 0 then
			n = 0
		end
		ds[i] = n
		tong = tong + n
	end
	return ds, tong
end

function x999999_HoiLongVan( sceneId, selfId, targetId )
	local ds, tong = x999999_DemLongVan( sceneId, selfId )
	BeginEvent( sceneId )
	AddText( sceneId, "Chuy\172n TO\192N B\147 Long V\229n +1/+2/+3 trong t\250i ra R\223\189ng \205ch K\214 tr\234n web (m\243n \240ang m\163c kh\244ng t\237nh). Tr\234n web r\250t v\171 game ho\163c t\163ng ng\223\182i kh\225c." )
	AddText( sceneId, "Trong t\250i: Long V\229n +1: "..ds[1]..", +2: "..ds[2]..", +3: "..ds[3] )
	AddText( sceneId, "#R".."Ch\250 \253: ".."#W".."Long V\229n \240\227 n\226ng sao ho\163c chu\170 thu\181c t\237nh s\168 M\132T ph\165n n\226ng c\164p, r\250t v\171 game l\224 Long V\229n m\190i." )
	if tong > 0 then
		AddNumText( sceneId, x999999_g_ScriptId, "\208\176ng \253 chuy\172n "..tong.." Long V\229n", 6, 97 )
	end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x999999_ChuyenLongVan( sceneId, selfId, targetId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local da = {}
	local tong = 0
	for i = 1, getn( x999999_g_LongVan ) do
		local id = x999999_g_LongVan[i]
		local n = LuaFnGetAvailableItemCount( sceneId, selfId, id )
		local xoa = 0
		if n and n > 0 then
			for j = 1, n do
				if LuaFnDelAvailableItem( sceneId, selfId, id, 1 ) == 1 then
					xoa = xoa + 1
				end
			end
		end
		if xoa > 0 then
			tinsert( da, { id, xoa } )
			tong = tong + xoa
		end
	end
	if tong == 0 then
		x999999_Tips( sceneId, selfId, "Trong t\250i kh\244ng c\243 Long V\229n \240\172 chuy\172n" )
		return
	end
	local name = x999999_g_Dir.."outlv/"..guid.."_"..LuaFnGetCurrentTime().."_"..random( 100000, 999999 )..".txt"
	local h = openfile( name, "w" )
	if h == nil then
		for i = 1, getn( da ) do
			for j = 1, da[i][2] do
				TryRecieveItem( sceneId, selfId, da[i][1], 1 )
			end
		end
		x999999_Tips( sceneId, selfId, "L\178i ghi phi\170u, \240\227 tr\228 l\213i Long V\229n" )
		return
	end
	for i = 1, getn( da ) do
		write( h, guid.." "..da[i][1].." "..da[i][2].."\n" )
	end
	write( h, "END\n" )
	closefile( h )
	x999999_Tips( sceneId, selfId, "\208\227 chuy\172n "..tong.." Long V\229n ra R\223\189ng \205ch K\214 tr\234n web" )
	x999999_OnDefaultEvent( sceneId, selfId, targetId )
end

-- [NetCo4 05/10] GAME -> RUONG ICH KY (web): chuyen TOAN BO NGOC CAP 6 KHONG CO DINH (ID 506xxxxx, chu server chot) trong tui Dao cu + Nguyen lieu.
-- Bo qua: ngoc CO DINH (LuaFnGetItemBindStatus == 1 - ruong web khong luu khoa, rut ve se thanh khong khoa = rua khoa),
-- mon khoa mat khau (LuaFnIsItemAvailable ~= 1), ngoc dang kham tren trang bi (khong nam trong tui).
-- Xoa tung o (dem so luong truoc/sau de dung ca khi 1 o co nhieu vien), ghi phieu outlv/ y nhu Long Van
-- (bot tlbbPollLvReceipts cong vao Ruong Ich Ky). Ghi phieu loi thi tra lai ngoc. Web rut ve game toi da 10 vien/lan (bot).
function x999999_LaNgoc( id )
	if id and id >= 50600000 and id < 50700000 then   -- chi ngoc cap 6
		return 1
	end
	return nil
end

function x999999_DemNgoc( sceneId, selfId )
	local het = LuaFnGetMaterialEndBagPos( sceneId, selfId )
	local cap = { 0, 0, 0, 0, 0, 0, 0 }
	local tong = 0
	local khoa = 0
	for pos = 0, het do
		local id = LuaFnGetItemTableIndexByIndex( sceneId, selfId, pos )
		if x999999_LaNgoc( id ) then
			if LuaFnGetItemBindStatus( sceneId, selfId, pos ) == 1 then
				khoa = khoa + 1
			elseif LuaFnIsItemAvailable( sceneId, selfId, pos ) == 1 then
				local c = floor( id / 100000 ) - 500
				if c >= 1 and c <= 7 then
					cap[c] = cap[c] + 1
				end
				tong = tong + 1
			end
		end
	end
	return cap, tong, khoa
end

function x999999_HoiNgoc( sceneId, selfId, targetId )
	local cap, tong, khoa = x999999_DemNgoc( sceneId, selfId )
	BeginEvent( sceneId )
	AddText( sceneId, "Chuy\172n TO\192N B\147 ng\247c c\164p 6 KH\212NG c\175 \240\184nh trong t\250i ra R\223\189ng \205ch K\214 tr\234n web. Tr\234n web r\250t v\171 game t\175i \240a 10 vi\234n m\178i l\165n, t\163ng ho\163c b\225n \240\223\254c." )
	AddText( sceneId, "Ng\247c c\164p 6 trong t\250i: "..cap[6].." \244" )
	AddText( sceneId, "#R".."Kh\244ng chuy\172n: ".."#W".."ng\247c c\175 \240\184nh (kh\243a) "..khoa.." \244, ng\247c \240ang kh\228m, m\243n kh\243a m\167t kh\166u." )
	if tong > 0 then
		AddNumText( sceneId, x999999_g_ScriptId, "\208\176ng \253 chuy\172n "..tong.." \244 ng\247c c\164p 6", 6, 95 )
	end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x999999_ChuyenNgoc( sceneId, selfId, targetId )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local het = LuaFnGetMaterialEndBagPos( sceneId, selfId )
	local soId = {}
	local ds = {}
	local tong = 0
	for pos = 0, het do
		local id = LuaFnGetItemTableIndexByIndex( sceneId, selfId, pos )
		if x999999_LaNgoc( id ) and LuaFnGetItemBindStatus( sceneId, selfId, pos ) ~= 1 and LuaFnIsItemAvailable( sceneId, selfId, pos ) == 1 then
			local truoc = LuaFnGetAvailableItemCount( sceneId, selfId, id )
			LuaFnEraseItem( sceneId, selfId, pos )
			local sau = LuaFnGetAvailableItemCount( sceneId, selfId, id )
			local d = 0
			if truoc and sau then
				d = truoc - sau
			end
			if d > 0 then
				if soId[id] == nil then
					soId[id] = 0
					tinsert( ds, id )
				end
				soId[id] = soId[id] + d
				tong = tong + d
			end
		end
	end
	if tong == 0 then
		x999999_Tips( sceneId, selfId, "Trong t\250i kh\244ng c\243 ng\247c c\164p 6 kh\244ng c\175 \240\184nh \240\172 chuy\172n" )
		return
	end
	local name = x999999_g_Dir.."outlv/"..guid.."_"..LuaFnGetCurrentTime().."_"..random( 100000, 999999 )..".txt"
	local h = openfile( name, "w" )
	if h == nil then
		for i = 1, getn( ds ) do
			for j = 1, soId[ds[i]] do
				TryRecieveItem( sceneId, selfId, ds[i], 1 )
			end
		end
		x999999_Tips( sceneId, selfId, "L\178i ghi phi\170u, \240\227 tr\228 l\213i ng\247c" )
		return
	end
	for i = 1, getn( ds ) do
		write( h, guid.." "..ds[i].." "..soId[ds[i]].."\n" )
	end
	write( h, "END\n" )
	closefile( h )
	x999999_Tips( sceneId, selfId, "\208\227 chuy\172n "..tong.." vi\234n ng\247c c\164p 6 ra R\223\189ng \205ch K\214 tr\234n web" )
	x999999_OnDefaultEvent( sceneId, selfId, targetId )
end

-- [NetCo4 06/10] THUONG PHO (web, bot thuongpho.js repo bialk): kho do theo TUNG NHAN VAT. Chu server chot: moi mon chi rut ve
-- DUNG nhan vat da gui, khong tang / ban / giao dich tren web. Do CO DINH giu co khoa, rut ve khoa lai.
--   GAME -> WEB (NPC, x999999_ChuyenTP): chuyen TOAN BO tui Dao cu (tui=1, o 0 .. MaterialStart-1) hoac Nguyen lieu
--     (tui=2, MaterialStart .. MaterialEnd). Chi mon co trong ./txt/NetCo4Web/thuongpho-cho.txt (bot dung tu CommonItem /
--     GemInfo / ItemRule: cat duoc ngan hang, khong duy nhat, khong gioi han so huu, script khong ghi tham so rieng).
--     Kiem them tung o: khoa mat khau / dang khoa (LuaFnIsItemAvailable, LuaFnIsItemLocked) va THAM SO RIENG khac 0
--     (GetBagItemParam 0/4/8 kieu 2 = 3 so nguyen; ngan phieu, do dung do...) -> de lai trong tui (rut ve la mon moi = dup / mat).
--     File danh sach thieu / rong = Thuong Pho tam khoa, khong xoa gi.
--     Xoa TUNG O truoc (kiem o da trong), ghi phieu outtp/<GUID>_<gio>_<so>.txt sau: "<GUID> <ID> <so> <khoa> <tui>", dong cuoi END.
--     Ghi phieu loi thi tra lai do (khoa lai mon co dinh).
--   WEB -> GAME (x999999_NhanTP, goi tu quatang.lua luc dang nhap / doi ban do, hoac nut NPC): bot ghi <GUID>.tpin
--     "<ma> <ID> <so> <khoa> <tui> <chong>". Chi phat dong nao DU O TRONG (ceil(so/chong) o, tru dan), ghi ma vao <GUID>.tpdone
--     TRUOC khi phat (khong bao gio phat trung). Phat loi giua chung -> phan con lai ghi phieu HOAN ve kho web.
x999999_g_TPChoFile = "thuongpho-cho.txt"

function x999999_TPDocCho()
	local h = openfile( x999999_g_Dir..x999999_g_TPChoFile, "r" )
	if h == nil then
		return nil
	end
	local cho = {}
	local n = 0
	local line = read( h, "*l" )
	while line do
		local id = tonumber( line )
		if id then
			cho[id] = 1
			n = n + 1
		end
		line = read( h, "*l" )
	end
	closefile( h )
	if n == 0 then
		return nil
	end
	return cho
end

function x999999_TPKhoang( sceneId, selfId, tui )
	local nl = LuaFnGetMaterialStartBagPos( sceneId, selfId )
	if tui == 1 then
		return 0, nl - 1
	end
	return nl, LuaFnGetMaterialEndBagPos( sceneId, selfId )
end

function x999999_TPCoThamSo( sceneId, selfId, pos )
	for i = 0, 8, 4 do
		local v = GetBagItemParam( sceneId, selfId, pos, i, 2 )
		if v ~= nil and v ~= 0 then
			return 1
		end
	end
	return nil
end

-- tra ve (ket qua, id): 1 = chuyen duoc, 0 = o trong, "cho" = khong nam trong danh sach, "khoa" = khoa mat khau / dang khoa, "ts" = tham so rieng
function x999999_TPXet( sceneId, selfId, pos, cho )
	local id = LuaFnGetItemTableIndexByIndex( sceneId, selfId, pos )
	if id == nil or id <= 0 then
		return 0, id
	end
	if cho[id] == nil then
		return "cho", id
	end
	if LuaFnIsItemAvailable( sceneId, selfId, pos ) ~= 1 then
		return "khoa", id
	end
	local lk = LuaFnIsItemLocked( sceneId, selfId, pos )
	if lk ~= nil and lk ~= 0 then
		return "khoa", id
	end
	if x999999_TPCoThamSo( sceneId, selfId, pos ) then
		return "ts", id
	end
	return 1, id
end

function x999999_TPTenTui( tui )
	if tui == 1 then
		return "\208\213o c\248"
	end
	return "Nguy\234n li\174u"
end

function x999999_HoiTP( sceneId, selfId, targetId, tui )
	local cho = x999999_TPDocCho()
	if cho == nil then
		x999999_Tips( sceneId, selfId, "Th\223\189ng Ph\175 \240ang t\213m kh\243a, th\216 l\213i sau" )
		return
	end
	local a, b = x999999_TPKhoang( sceneId, selfId, tui )
	local o = 0
	local mon = 0
	local cd = 0
	local ngoai = 0
	local khoa = 0
	local ts = 0
	for pos = a, b do
		local r, id = x999999_TPXet( sceneId, selfId, pos, cho )
		if r == 1 then
			o = o + 1
			mon = mon + LuaFnGetItemCountInBagPos( sceneId, selfId, pos )
			if LuaFnGetItemBindStatus( sceneId, selfId, pos ) == 1 then
				cd = cd + 1
			end
		elseif r == "cho" then
			ngoai = ngoai + 1
		elseif r == "khoa" then
			khoa = khoa + 1
		elseif r == "ts" then
			ts = ts + 1
		end
	end
	BeginEvent( sceneId )
	AddText( sceneId, "Chuy\172n TO\192N B\147 t\250i "..x999999_TPTenTui( tui ).." ra Th\223\189ng Ph\175 tr\234n web. Kho ri\234ng c\252a nh\226n v\167t n\224y: ch\239 r\250t v\171 \240\250ng nh\226n v\167t n\224y, kh\244ng t\163ng / b\225n \240\223\254c." )
	AddText( sceneId, "S\168 chuy\172n: "..o.." \244 ("..mon.." m\243n), trong \240\243 "..cd.." \244 c\175 \240\184nh (r\250t v\171 v\231n c\175 \240\184nh)." )
	AddText( sceneId, "#R".."Gi\230 l\213i trong t\250i: ".."#W"..ngoai.." \244 kh\244ng chuy\172n \240\223\254c (trang b\184, \240\176 \240\163c bi\174t), "..ts.." \244 c\243 thu\181c t\237nh ri\234ng, "..khoa.." \244 \240ang kh\243a." )
	if o > 0 then
		AddNumText( sceneId, x999999_g_ScriptId, "\208\176ng \253 chuy\172n "..o.." \244", 6, 93 - tui )
	end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x999999_ChuyenTP( sceneId, selfId, targetId, tui )
	local cho = x999999_TPDocCho()
	if cho == nil then
		x999999_Tips( sceneId, selfId, "Th\223\189ng Ph\175 \240ang t\213m kh\243a, th\216 l\213i sau" )
		return
	end
	local guid = LuaFnGetGUID( sceneId, selfId )
	local a, b = x999999_TPKhoang( sceneId, selfId, tui )
	local ds = {}
	local tong = 0
	for pos = a, b do
		local r, id = x999999_TPXet( sceneId, selfId, pos, cho )
		if r == 1 then
			local n = LuaFnGetItemCountInBagPos( sceneId, selfId, pos )
			local k = 0
			if LuaFnGetItemBindStatus( sceneId, selfId, pos ) == 1 then
				k = 1
			end
			if n and n > 0 then
				LuaFnEraseItem( sceneId, selfId, pos )
				if LuaFnGetItemTableIndexByIndex( sceneId, selfId, pos ) ~= id then
					tinsert( ds, { id, n, k } )
					tong = tong + n
				end
			end
		end
	end
	if tong == 0 then
		x999999_Tips( sceneId, selfId, "Kh\244ng c\243 m\243n n\224o chuy\172n \240\223\254c" )
		return
	end
	local name = x999999_g_Dir.."outtp/"..guid.."_"..LuaFnGetCurrentTime().."_"..random( 100000, 999999 )..".txt"
	local h = openfile( name, "w" )
	if h == nil then
		x999999_TPTraLai( sceneId, selfId, ds )
		x999999_Tips( sceneId, selfId, "L\178i ghi phi\170u, \240\227 tr\228 l\213i \240\176" )
		return
	end
	for i = 1, getn( ds ) do
		write( h, guid.." "..ds[i][1].." "..ds[i][2].." "..ds[i][3].." "..tui.."\n" )
	end
	write( h, "END\n" )
	closefile( h )
	x999999_Tips( sceneId, selfId, "\208\227 chuy\172n "..tong.." m\243n ra Th\223\189ng Ph\175 tr\234n web" )
	x999999_OnDefaultEvent( sceneId, selfId, targetId )
end

-- tra lai do vao tui (ghi phieu loi): ds = { {id, so, khoa}, ... }
function x999999_TPTraLai( sceneId, selfId, ds )
	for i = 1, getn( ds ) do
		for j = 1, ds[i][2] do
			local p = TryRecieveItem( sceneId, selfId, ds[i][1], 1 )
			if ds[i][3] == 1 and p ~= nil and p >= 0 and LuaFnGetItemBindStatus( sceneId, selfId, p ) ~= 1 then
				LuaFnItemBind( sceneId, selfId, p )
			end
		end
	end
end

-- O dang chua mon <id> KHONG co dinh trong tui (ca 2 tui): tra ve { [o] = 1 } va so o chua day (< chong).
-- Phat mon co dinh ma con chong khong co dinh chua day -> game chong mon moi vao do, khoa o la khoa oan do cua nguoi choi -> cho.
function x999999_TPOKhongKhoa( sceneId, selfId, id, chong )
	local het = LuaFnGetMaterialEndBagPos( sceneId, selfId )
	local ds = {}
	local chuaDay = 0
	for p = 0, het do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, p ) == id and LuaFnGetItemBindStatus( sceneId, selfId, p ) ~= 1 then
			ds[p] = 1
			if LuaFnGetItemCountInBagPos( sceneId, selfId, p ) < chong then
				chuaDay = chuaDay + 1
			end
		end
	end
	return ds, chuaDay
end

-- WEB -> GAME. baoTrong = 1 khi bam NPC (bao ca luc khong co gi).
function x999999_NhanTP( sceneId, selfId, baoTrong )
	local guid = LuaFnGetGUID( sceneId, selfId )
	local inbox = {}
	local h = openfile( x999999_g_Dir..guid..".tpin", "r" )
	if h then
		local line = read( h, "*l" )
		while line do
			tinsert( inbox, line )
			line = read( h, "*l" )
		end
		closefile( h )
	end
	local done = {}
	h = openfile( x999999_g_Dir..guid..".tpdone", "r" )
	if h then
		local line = read( h, "*l" )
		while line do
			done[line] = 1
			line = read( h, "*l" )
		end
		closefile( h )
	end
	local trong = { LuaFnGetPropertyBagSpace( sceneId, selfId ), LuaFnGetMaterialBagSpace( sceneId, selfId ) }
	if trong[1] == nil then
		trong[1] = 0
	end
	if trong[2] == nil then
		trong[2] = 0
	end
	local nhan = 0
	local con = 0
	local vuong = 0
	local hoan = {}
	-- 2 luot: do CO DINH truoc (luot 1), khong co dinh sau (luot 2) -> rut ca 2 loai cung mon 1 lan khong tu chan nhau
	for luot = 1, 2 do
		for i = 1, getn( inbox ) do
			local s, e, tx, sid, sn, sk, stui, schong = strfind( inbox[i], "^(%w+) (%d+) (%d+) ([01]) ([12]) (%d+)$" )
			local id = tonumber( sid )
			local n = tonumber( sn )
			local k = tonumber( sk )
			local tui = tonumber( stui )
			local chong = tonumber( schong )
			if tx and id and n and n > 0 and k and k == 2 - luot and tui and chong and chong > 0 and done[tx] == nil then
				local can = floor( ( n + chong - 1 ) / chong )
				local cu = nil
				local chuaDay = 0
				if k == 1 then
					cu, chuaDay = x999999_TPOKhongKhoa( sceneId, selfId, id, chong )
				end
				if chuaDay > 0 then
					vuong = vuong + 1
				elseif trong[tui] >= can then
					local d = openfile( x999999_g_Dir..guid..".tpdone", "a" )
					if d == nil then
						return
					end
					write( d, tx.."\n" )
					closefile( d )
					done[tx] = 1
					trong[tui] = trong[tui] - can
					local j = 0
					local vao = {}
					local daCo = {}
					while j < n do
						local p = TryRecieveItem( sceneId, selfId, id, 1 )
						if p == nil or p < 0 then
							break
						end
						if daCo[p] == nil then
							daCo[p] = 1
							tinsert( vao, p )
						end
						j = j + 1
					end
					-- phat het roi moi khoa; KHONG khoa o von la do khong co dinh cua nguoi choi (cu[p])
					if k == 1 then
						for q = 1, getn( vao ) do
							local p = vao[q]
							if cu[p] == nil and LuaFnGetItemBindStatus( sceneId, selfId, p ) ~= 1 then
								LuaFnItemBind( sceneId, selfId, p )
							end
						end
					end
					nhan = nhan + j
					if j < n then
						tinsert( hoan, { id, n - j, k, tui } )
					end
				else
					con = con + 1
				end
			end
		end
	end
	if getn( hoan ) > 0 then
		local name = x999999_g_Dir.."outtp/"..guid.."_"..LuaFnGetCurrentTime().."_"..random( 100000, 999999 )..".txt"
		local hh = openfile( name, "w" )
		if hh then
			write( hh, "HOAN\n" )
			for i = 1, getn( hoan ) do
				write( hh, guid.." "..hoan[i][1].." "..hoan[i][2].." "..hoan[i][3].." "..hoan[i][4].."\n" )
			end
			write( hh, "END\n" )
			closefile( hh )
			x999999_Tips( sceneId, selfId, "M\181t ph\165n \240\176 kh\244ng v\224o \240\223\254c t\250i, \240\227 tr\228 v\171 Th\223\189ng Ph\175" )
		else
			x999999_Tips( sceneId, selfId, "L\178i tr\228 \240\176 v\171 Th\223\189ng Ph\175 - b\225o admin ngay" )
		end
	end
	if nhan > 0 then
		x999999_Tips( sceneId, selfId, "\208\227 nh\167n "..nhan.." m\243n t\215 Th\223\189ng Ph\175" )
	end
	if con > 0 then
		x999999_Tips( sceneId, selfId, "T\250i \240\165y: c\242n "..con.." l\174nh Th\223\189ng Ph\175 \240ang ch\182, d\247n t\250i r\176i \240\177i b\228n \240\176 ho\163c b\164m NPC V\237 Web \240\172 nh\167n ti\170p" )
	end
	if vuong > 0 then
		x999999_Tips( sceneId, selfId, "C\242n "..vuong.." l\174nh \240\176 c\175 \240\184nh \240ang ch\182: trong t\250i c\243 ch\176ng c\249ng m\243n KH\212NG c\175 \240\184nh ch\223a \240\165y, c\164t ch\176ng \240\243 v\224o r\223\189ng r\176i nh\167n l\213i" )
	end
	if nhan == 0 and con == 0 and vuong == 0 and baoTrong == 1 then
		x999999_Tips( sceneId, selfId, "Kh\244ng c\243 \240\176 Th\223\189ng Ph\175 n\224o \240ang ch\182" )
	end
end

-- Ham cu con trong AllowableScriptFunc.txt (Gift Code): de trong cho client goi khong loi.
function x999999_XuKaJiHuo1( sceneId, selfId ) end
function x999999_XuKaJiHuo2( sceneId, selfId ) end
function x999999_XuKaJiHuo3( sceneId, selfId ) end
