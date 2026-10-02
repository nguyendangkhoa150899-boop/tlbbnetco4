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
x999999_g_Amounts = { 1000, 10000, 50000, 100000, 500000, 1000000 }
x999999_g_LongVan = { 10157001, 10157002, 10157003 }   -- [NetCo4 03/10] Long Van +1/+2/+3 -> Ruong Ich Ky (web)

function x999999_Balance( sceneId, selfId )
	return YuanBao( sceneId, selfId, -1, 3, 0 )
end

function x999999_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddText( sceneId, "V\237 Web NetCo4: chuy\172n Kim Nguy\234n B\228o t\215 game ra v\237 web mini game (t\239 gi\225 1:1). Chi\171u ng\223\254c l\213i d\249ng web, nh\167n khi \240\229ng nh\167p ho\163c \240\177i b\228n \240\176." )
	AddText( sceneId, "Kim Nguy\234n B\228o hi\174n c\243: "..x999999_Balance( sceneId, selfId ) )
	for i = 1, getn( x999999_g_Amounts ) do
		AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n ra web "..x999999_g_Amounts[i], 6, i )
	end
	AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n ra web ".."To\224n b\181", 6, 99 )
	AddNumText( sceneId, x999999_g_ScriptId, "Chuy\172n Long V\229n ra R\223\189ng \205ch K\214 (web)", 6, 98 )   -- [NetCo4 03/10] o cuoi
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

-- Ham cu con trong AllowableScriptFunc.txt (Gift Code): de trong cho client goi khong loi.
function x999999_XuKaJiHuo1( sceneId, selfId ) end
function x999999_XuKaJiHuo2( sceneId, selfId ) end
function x999999_XuKaJiHuo3( sceneId, selfId ) end
