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
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x999999_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()
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

-- Ham cu con trong AllowableScriptFunc.txt (Gift Code): de trong cho client goi khong loi.
function x999999_XuKaJiHuo1( sceneId, selfId ) end
function x999999_XuKaJiHuo2( sceneId, selfId ) end
function x999999_XuKaJiHuo3( sceneId, selfId ) end
